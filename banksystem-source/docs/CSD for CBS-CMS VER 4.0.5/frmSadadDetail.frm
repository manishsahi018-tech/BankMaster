VERSION 5.00
Begin VB.Form frmSadadDetail 
   BackColor       =   &H00BFD87E&
   Caption         =   "Utility Bill Enquiry "
   ClientHeight    =   8370
   ClientLeft      =   1530
   ClientTop       =   885
   ClientWidth     =   11550
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11550
   WindowState     =   2  'Maximized
   Begin VB.TextBox txtRecordPosition 
      BackColor       =   &H00004080&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   405
      Left            =   10920
      TabIndex        =   68
      Top             =   720
      Width           =   735
   End
   Begin VB.CommandButton cmdLast 
      Caption         =   "Last"
      Height          =   375
      Left            =   6480
      TabIndex        =   67
      ToolTipText     =   "Last"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdNext 
      Caption         =   "Next"
      Height          =   375
      Left            =   5040
      TabIndex        =   66
      ToolTipText     =   "Next"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdPrev 
      Caption         =   "Previous"
      Height          =   375
      Left            =   3600
      TabIndex        =   65
      ToolTipText     =   "Previous"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.CommandButton cmdFirst 
      Caption         =   "First"
      Height          =   375
      Left            =   2160
      TabIndex        =   64
      ToolTipText     =   "First"
      Top             =   7800
      Width           =   1335
   End
   Begin VB.Frame frameEnquiryDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Enquiry Details"
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
      ForeColor       =   &H00800000&
      Height          =   1215
      Left            =   960
      TabIndex        =   35
      Top             =   120
      Width           =   9855
      Begin VB.TextBox txtIdNumber 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7680
         TabIndex        =   70
         Tag             =   "9855"
         Top             =   240
         Width           =   1695
      End
      Begin VB.ComboBox cmbIdType 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2280
         Style           =   2  'Dropdown List
         TabIndex        =   69
         Tag             =   "9855"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox txtSubscriptionNo 
         Height          =   285
         Left            =   7680
         TabIndex        =   37
         Tag             =   "9855"
         Top             =   720
         Width           =   1935
      End
      Begin VB.ComboBox cmbCompanyId 
         Height          =   315
         Left            =   2280
         Style           =   2  'Dropdown List
         TabIndex        =   36
         Tag             =   "9855"
         Top             =   720
         Width           =   3015
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
         Left            =   5400
         TabIndex        =   72
         Tag             =   "9855"
         Top             =   240
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
         Left            =   120
         TabIndex        =   71
         Tag             =   "9855"
         Top             =   240
         Width           =   1335
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
         Left            =   120
         TabIndex        =   39
         Tag             =   "9855"
         Top             =   720
         Width           =   2055
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
         Left            =   5400
         TabIndex        =   38
         Tag             =   "9855"
         Top             =   720
         Width           =   2295
      End
   End
   Begin VB.TextBox txtGeneralInfo 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3600
      TabIndex        =   31
      Top             =   7440
      Width           =   7215
   End
   Begin VB.Frame framePaymentDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Payment Details"
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
      ForeColor       =   &H00800000&
      Height          =   2055
      Left            =   960
      TabIndex        =   8
      Top             =   5280
      Width           =   9855
      Begin VB.TextBox txtMsgTxt 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   62
         Tag             =   "9855"
         Top             =   1680
         Width           =   2895
      End
      Begin VB.ComboBox cmbEffectiveDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7200
         TabIndex        =   60
         Tag             =   "9855"
         Top             =   720
         Width           =   615
      End
      Begin VB.ComboBox cmbEffectiveMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7800
         TabIndex        =   59
         Tag             =   "9855"
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtEffectiveYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8400
         TabIndex        =   58
         Tag             =   "9855"
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txtSadadTransId 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7560
         TabIndex        =   33
         Tag             =   "9855"
         Top             =   1200
         Width           =   2055
      End
      Begin VB.TextBox txtPaymentYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   4200
         TabIndex        =   30
         Tag             =   "9855"
         Top             =   720
         Width           =   1455
      End
      Begin VB.ComboBox cmbPaymentMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3600
         TabIndex        =   29
         Tag             =   "9855"
         Top             =   720
         Width           =   615
      End
      Begin VB.ComboBox cmbPaymentDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3000
         TabIndex        =   28
         Tag             =   "9855"
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox txtAnbTransRefNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   11
         Tag             =   "9855"
         Top             =   1200
         Width           =   2295
      End
      Begin VB.TextBox txtBillPaymentStatus 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7920
         TabIndex        =   10
         Tag             =   "9855"
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtBillAmountPaid 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   9
         Tag             =   "9855"
         Top             =   240
         Width           =   2415
      End
      Begin VB.Label lblMessageText 
         BackColor       =   &H00BFD87E&
         Caption         =   "Message Text"
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
         TabIndex        =   63
         Tag             =   "9855"
         Top             =   1680
         Width           =   2535
      End
      Begin VB.Label lblEffectiveDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Effective Date"
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
         Left            =   5760
         TabIndex        =   61
         Tag             =   "9855"
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label lblSADADPaymentId 
         BackColor       =   &H00BFD87E&
         Caption         =   "SADAD Payment Id"
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
         Left            =   5400
         TabIndex        =   34
         Tag             =   "9855"
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblAnbTransactionId 
         BackColor       =   &H00BFD87E&
         Caption         =   "ANB Transaction Ref. No."
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
         TabIndex        =   15
         Tag             =   "9855"
         Top             =   1200
         Width           =   2655
      End
      Begin VB.Label lblBillAmountPaid 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Amount Paid"
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
         TabIndex        =   14
         Tag             =   "9855"
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label lblPaymentDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Date"
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
         TabIndex        =   13
         Tag             =   "9855"
         Top             =   720
         Width           =   1575
      End
      Begin VB.Label lblBillPaymentStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Payment Status"
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
         Left            =   5640
         TabIndex        =   12
         Tag             =   "9855"
         Top             =   240
         Width           =   2175
      End
   End
   Begin VB.Frame frameBillDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Bill Details"
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
      ForeColor       =   &H00800000&
      Height          =   3495
      Left            =   960
      TabIndex        =   1
      Top             =   1560
      Width           =   9855
      Begin VB.TextBox txtBillNumber 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7080
         TabIndex        =   56
         Tag             =   "9855"
         Top             =   840
         Width           =   2295
      End
      Begin VB.TextBox txtBillCycle 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7080
         TabIndex        =   54
         Tag             =   "9855"
         Top             =   360
         Width           =   1935
      End
      Begin VB.TextBox txtServiceType 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   52
         Tag             =   "9855"
         Top             =   840
         Width           =   2895
      End
      Begin VB.TextBox txtBillCategory 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   50
         Tag             =   "9855"
         Top             =   360
         Width           =   2175
      End
      Begin VB.TextBox txtBillCheckDigit 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   48
         Tag             =   "9855"
         Top             =   3120
         Width           =   735
      End
      Begin VB.TextBox txtBillCloseYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8280
         TabIndex        =   46
         Tag             =   "9855"
         Top             =   2760
         Width           =   1335
      End
      Begin VB.ComboBox cmbBillCloseMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7680
         TabIndex        =   45
         Tag             =   "9855"
         Top             =   2760
         Width           =   615
      End
      Begin VB.ComboBox cmbBillCloseDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7080
         TabIndex        =   44
         Tag             =   "9855"
         Top             =   2760
         Width           =   615
      End
      Begin VB.TextBox txtBillOpenYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3240
         TabIndex        =   42
         Tag             =   "9855"
         Top             =   2640
         Width           =   1575
      End
      Begin VB.ComboBox cmbBillOpenMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2640
         TabIndex        =   41
         Tag             =   "9855"
         Top             =   2640
         Width           =   615
      End
      Begin VB.ComboBox cmbBillOpenDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2040
         TabIndex        =   40
         Tag             =   "9855"
         Top             =   2640
         Width           =   615
      End
      Begin VB.Frame frameExactPayment 
         Enabled         =   0   'False
         Height          =   495
         Left            =   7080
         TabIndex        =   25
         Tag             =   "9855"
         Top             =   2160
         Width           =   1575
         Begin VB.OptionButton optExactPaymentNo 
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   27
            Tag             =   "1575"
            ToolTipText     =   "No"
            Top             =   120
            Value           =   -1  'True
            Width           =   615
         End
         Begin VB.OptionButton optExactPaymentYes 
            Caption         =   "Yes"
            Height          =   255
            Left            =   120
            TabIndex        =   26
            Tag             =   "1575"
            ToolTipText     =   "Yes"
            Top             =   120
            Width           =   615
         End
      End
      Begin VB.ComboBox cmbExpiryDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2040
         TabIndex        =   23
         Tag             =   "9855"
         Top             =   2160
         Width           =   615
      End
      Begin VB.ComboBox cmbExpiryMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2640
         TabIndex        =   22
         Tag             =   "9855"
         Top             =   2160
         Width           =   615
      End
      Begin VB.TextBox txtExpiryYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3240
         TabIndex        =   21
         Tag             =   "9855"
         Top             =   2160
         Width           =   1575
      End
      Begin VB.TextBox txtBillAmuntDue 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   20
         Tag             =   "9855"
         Top             =   1680
         Width           =   2295
      End
      Begin VB.ComboBox cmbDueDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7080
         TabIndex        =   19
         Tag             =   "9855"
         Top             =   1680
         Width           =   615
      End
      Begin VB.ComboBox cmbDueMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7680
         TabIndex        =   18
         Tag             =   "9855"
         Top             =   1680
         Width           =   615
      End
      Begin VB.TextBox txtDueYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   8280
         TabIndex        =   17
         Tag             =   "9855"
         Top             =   1680
         Width           =   1335
      End
      Begin VB.TextBox txtBillStatusCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7080
         TabIndex        =   3
         Tag             =   "9855"
         Top             =   1200
         Width           =   1815
      End
      Begin VB.TextBox txtRefNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   2
         Tag             =   "9855"
         Top             =   1200
         Width           =   2295
      End
      Begin VB.Label lblBillNumber 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Number"
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
         TabIndex        =   57
         Tag             =   "9855"
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label lblBillCycle 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill cycle"
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
         TabIndex        =   55
         Tag             =   "9855"
         Top             =   360
         Width           =   1815
      End
      Begin VB.Label lblServiceType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Service Type"
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
         TabIndex        =   53
         Tag             =   "9855"
         Top             =   840
         Width           =   1695
      End
      Begin VB.Label lblBillCategory 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill category"
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
         TabIndex        =   51
         Tag             =   "9855"
         Top             =   360
         Width           =   1695
      End
      Begin VB.Label lblBillCheckDigit 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Check Digit"
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
         TabIndex        =   49
         Tag             =   "9855"
         Top             =   3120
         Width           =   1695
      End
      Begin VB.Label lblBillCloseDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Close Date"
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
         Left            =   4920
         TabIndex        =   47
         Tag             =   "9855"
         Top             =   2760
         Width           =   1935
      End
      Begin VB.Label lblBillOpenDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Open Date"
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
         TabIndex        =   43
         Tag             =   "9855"
         Top             =   2640
         Width           =   1935
      End
      Begin VB.Label lblExactPaymentOnly 
         BackColor       =   &H00BFD87E&
         Caption         =   "Exact Payment Only"
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
         Left            =   4920
         TabIndex        =   24
         Tag             =   "9855"
         Top             =   2280
         Width           =   2055
      End
      Begin VB.Label lblExpiryDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Expiry Date"
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
         Top             =   2160
         Width           =   1935
      End
      Begin VB.Label lblBillStatus 
         BackColor       =   &H00BFD87E&
         Caption         =   "Bill Status Code"
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
         Left            =   4920
         TabIndex        =   7
         Tag             =   "9855"
         Top             =   1200
         Width           =   1815
      End
      Begin VB.Label lblDueDate 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Due Date"
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
         Left            =   4920
         TabIndex        =   6
         Tag             =   "9855"
         Top             =   1680
         Width           =   1935
      End
      Begin VB.Label lblBillRefInfo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reference Info"
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
         TabIndex        =   5
         Tag             =   "9855"
         Top             =   1200
         Width           =   1695
      End
      Begin VB.Label lblAmountDue 
         BackColor       =   &H00BFD87E&
         Caption         =   "Amount Due"
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
         Top             =   1680
         Width           =   1455
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Return to Main menu"
      Height          =   375
      Left            =   7935
      TabIndex        =   0
      ToolTipText     =   "Return to Main menu"
      Top             =   7800
      Width           =   2055
   End
   Begin VB.Label lblGeneralInfo 
      BackColor       =   &H00BFD87E&
      Caption         =   "General Information"
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
      TabIndex        =   32
      Top             =   7440
      Width           =   2535
   End
End
Attribute VB_Name = "frmSadadDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public currentRecord As Integer
Public totalRecords As Integer

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdFirst_Click()
    If currentRecord = 1 Then
       MsgBox errAlreadyInFirstRec(UserLang)
       Exit Sub
    End If
    currentRecord = 1
    fillSadadDetailFrm 1
End Sub

Private Sub cmdLast_Click()
    If currentRecord = totalRecords Then
       MsgBox errAlreadyInLastRec(UserLang) '"Already at last record...."
       Exit Sub
    End If
    currentRecord = totalRecords
    
    fillSadadDetailFrm totalRecords
End Sub

Private Sub cmdNext_Click()
    
    If (currentRecord + 1) > totalRecords Then
       MsgBox errAlreadyInLastRec(UserLang) '"Already at last record...."
       Exit Sub
    End If
    currentRecord = currentRecord + 1
    
    fillSadadDetailFrm currentRecord
End Sub

Private Sub cmdPrev_Click()
    
    If (currentRecord - 1) < 1 Then
       MsgBox errAlreadyInFirstRec(UserLang) '"Already in first record...."
       Exit Sub
    End If
    currentRecord = currentRecord - 1
    
    fillSadadDetailFrm currentRecord
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmSadadDetail, 11800
       frmSadadDetail.RightToLeft = True
       frameEnquiryDetails.RightToLeft = True
       framePaymentDetails.RightToLeft = True
       frameBillDetails.RightToLeft = True
    End If
    
    frmSadadDetail.Caption = frmSadadDetailCaption(0, UserLang)
    frmSadadDetail.frameEnquiryDetails.Caption = frmSadadDetailCaption(1, UserLang)
    frmSadadDetail.lblCompanyId.Caption = frmSadadDetailCaption(2, UserLang)
    frmSadadDetail.lblSubscriptionNo.Caption = frmSadadDetailCaption(3, UserLang)
    frmSadadDetail.frameBillDetails.Caption = frmSadadDetailCaption(4, UserLang)
    frmSadadDetail.lblBillCategory.Caption = frmSadadDetailCaption(5, UserLang)
    frmSadadDetail.lblBillCycle.Caption = frmSadadDetailCaption(6, UserLang)
    frmSadadDetail.lblServiceType.Caption = frmSadadDetailCaption(7, UserLang)
    frmSadadDetail.lblBillNumber.Caption = frmSadadDetailCaption(8, UserLang)
    frmSadadDetail.lblBillRefInfo.Caption = frmSadadDetailCaption(9, UserLang)
    frmSadadDetail.lblBillStatus.Caption = frmSadadDetailCaption(10, UserLang)
    frmSadadDetail.lblAmountDue.Caption = frmSadadDetailCaption(11, UserLang)
    frmSadadDetail.lblDueDate.Caption = frmSadadDetailCaption(12, UserLang)
    frmSadadDetail.lblExpiryDate.Caption = frmSadadDetailCaption(13, UserLang)
    frmSadadDetail.lblExactPaymentOnly.Caption = frmSadadDetailCaption(14, UserLang)
    frmSadadDetail.lblBillOpenDate.Caption = frmSadadDetailCaption(15, UserLang)
    frmSadadDetail.lblBillCloseDate.Caption = frmSadadDetailCaption(16, UserLang)
    frmSadadDetail.lblBillCheckDigit.Caption = frmSadadDetailCaption(17, UserLang)
    frmSadadDetail.framePaymentDetails.Caption = frmSadadDetailCaption(18, UserLang)
    frmSadadDetail.lblBillAmountPaid.Caption = frmSadadDetailCaption(19, UserLang)
    frmSadadDetail.lblBillPaymentStatus.Caption = frmSadadDetailCaption(20, UserLang)
    frmSadadDetail.lblEffectiveDate.Caption = frmSadadDetailCaption(21, UserLang)
    frmSadadDetail.lblPaymentDate.Caption = frmSadadDetailCaption(22, UserLang)
    frmSadadDetail.lblAnbTransactionId.Caption = frmSadadDetailCaption(23, UserLang)
    frmSadadDetail.lblSADADPaymentId.Caption = frmSadadDetailCaption(24, UserLang)
    frmSadadDetail.lblMessageText.Caption = frmSadadDetailCaption(25, UserLang)
    frmSadadDetail.lblGeneralInfo.Caption = frmSadadDetailCaption(26, UserLang)
    
    frmSadadDetail.cmdFirst.Caption = frmSadadDetailCaption(27, UserLang)
    frmSadadDetail.cmdPrev.Caption = frmSadadDetailCaption(28, UserLang)
    frmSadadDetail.cmdNext.Caption = frmSadadDetailCaption(29, UserLang)
    frmSadadDetail.cmdLast.Caption = frmSadadDetailCaption(30, UserLang)
    frmSadadDetail.cmdExit.Caption = frmSadadDetailCaption(31, UserLang)
    frmSadadDetail.optExactPaymentYes.Caption = frmSadadDetailCaption(32, UserLang)
    frmSadadDetail.optExactPaymentNo.Caption = frmSadadDetailCaption(33, UserLang)
    frmSadadDetail.lblIdType.Caption = frmSadadDetailCaption(34, UserLang)
    frmSadadDetail.lblIdNumber.Caption = frmSadadDetailCaption(35, UserLang)
    
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
    
'    mQry = "select * from idinfo where displayforutilityenq = '1'"
'    Set rs = db.OpenRecordset(mQry)
'    If rs.recordCount > 0 Then
'        .Clear
'       Do While Not rs.EOF
'          If UserLang = ENGLISH Then
'             cmbIdType.AddItem rs("idcode") & "-" & rs("englishname")
'          Else
'             cmbIdType.AddItem rs("idcode") & "-" & rs("arabicname")
'          End If
'          rs.MoveNext
'       Loop
'    End If
    currentRecord = 1
    totalRecords = Val(recvBillEnqMsg.recordCount)
    frmSadadDetail.Show
    
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameBillDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameEnquiryDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub framePaymentDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

