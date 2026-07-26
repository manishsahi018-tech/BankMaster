VERSION 5.00
Begin VB.Form frmBillEnquiry 
   BackColor       =   &H00BFD87E&
   Caption         =   "Utility Bill Enquiry "
   ClientHeight    =   8370
   ClientLeft      =   315
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
   Begin VB.CommandButton cmdHighToll 
      Caption         =   "High Toll Info"
      Enabled         =   0   'False
      Height          =   375
      Left            =   4560
      TabIndex        =   6
      ToolTipText     =   "High Toll Info"
      Top             =   7800
      Width           =   1815
   End
   Begin VB.TextBox txtBillStatusDesc 
      Enabled         =   0   'False
      Height          =   285
      Left            =   3600
      TabIndex        =   44
      Top             =   7440
      Width           =   5895
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
      Height          =   2775
      Left            =   960
      TabIndex        =   20
      Top             =   4560
      Width           =   9855
      Begin VB.TextBox txtSadadTransId 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   50
         Tag             =   "9855"
         Top             =   2400
         Width           =   2655
      End
      Begin VB.TextBox txtPaymentYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   4200
         MaxLength       =   4
         TabIndex        =   43
         Tag             =   "9855"
         Top             =   1440
         Width           =   615
      End
      Begin VB.ComboBox cmbPaymentMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3600
         TabIndex        =   42
         Tag             =   "9855"
         Top             =   1440
         Width           =   615
      End
      Begin VB.ComboBox cmbPaymentDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   3000
         TabIndex        =   41
         Tag             =   "9855"
         Top             =   1440
         Width           =   615
      End
      Begin VB.TextBox txtAnbTransRefNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   24
         Tag             =   "9855"
         Top             =   1920
         Width           =   2655
      End
      Begin VB.TextBox txtPaymentTime 
         Enabled         =   0   'False
         Height          =   285
         Left            =   4920
         TabIndex        =   23
         Tag             =   "9855"
         Top             =   1440
         Width           =   1215
      End
      Begin VB.TextBox txtBillPaymentStatus 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   22
         Tag             =   "9855"
         Top             =   960
         Width           =   2655
      End
      Begin VB.TextBox txtBillAmountPaid 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3000
         TabIndex        =   21
         Tag             =   "9855"
         Top             =   480
         Width           =   2655
      End
      Begin VB.Label lblSadadTransactionId 
         BackColor       =   &H00BFD87E&
         Caption         =   "SADAD Transaction Id"
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
         TabIndex        =   51
         Tag             =   "9855"
         Top             =   2400
         Width           =   2655
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
         TabIndex        =   28
         Tag             =   "9855"
         Top             =   1920
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
         TabIndex        =   27
         Tag             =   "9855"
         Top             =   480
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
         TabIndex        =   26
         Tag             =   "9855"
         Top             =   1440
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
         Left            =   240
         TabIndex        =   25
         Tag             =   "9855"
         Top             =   960
         Width           =   2295
      End
   End
   Begin VB.Frame frameBillDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Bill Details (Normal)"
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
      Height          =   1935
      Left            =   960
      TabIndex        =   12
      Top             =   2520
      Width           =   9855
      Begin VB.Frame frameExactPayment 
         Enabled         =   0   'False
         Height          =   495
         Left            =   6720
         TabIndex        =   38
         Tag             =   "9855"
         Top             =   1320
         Width           =   1575
         Begin VB.OptionButton optExactPaymentNo 
            Caption         =   "No"
            Height          =   255
            Left            =   840
            TabIndex        =   40
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
            TabIndex        =   39
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
         TabIndex        =   36
         Tag             =   "9855"
         Top             =   1320
         Width           =   615
      End
      Begin VB.ComboBox cmbExpiryMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   2640
         TabIndex        =   35
         Tag             =   "9855"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox txtExpiryYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   3240
         MaxLength       =   4
         TabIndex        =   34
         Tag             =   "9855"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox txtBillAmuntDue 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   33
         Tag             =   "9855"
         Top             =   840
         Width           =   2295
      End
      Begin VB.ComboBox cmbDueDate 
         Enabled         =   0   'False
         Height          =   315
         Left            =   6720
         TabIndex        =   32
         Tag             =   "9855"
         Top             =   840
         Width           =   615
      End
      Begin VB.ComboBox cmbDueMonth 
         Enabled         =   0   'False
         Height          =   315
         Left            =   7320
         TabIndex        =   31
         Tag             =   "9855"
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox txtDueYear 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7920
         MaxLength       =   4
         TabIndex        =   30
         Tag             =   "9855"
         Top             =   840
         Width           =   615
      End
      Begin VB.TextBox txtBillStatusCode 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6720
         TabIndex        =   14
         Tag             =   "9855"
         Top             =   360
         Width           =   1815
      End
      Begin VB.TextBox txtRefNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2040
         TabIndex        =   13
         Tag             =   "9855"
         Top             =   360
         Width           =   2295
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
         Left            =   4560
         TabIndex        =   37
         Tag             =   "9855"
         Top             =   1440
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
         TabIndex        =   29
         Tag             =   "9855"
         Top             =   1320
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
         Left            =   4560
         TabIndex        =   18
         Tag             =   "9855"
         Top             =   360
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
         Left            =   4560
         TabIndex        =   17
         Tag             =   "9855"
         Top             =   840
         Width           =   1935
      End
      Begin VB.Label lblBillRefNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Reference No. "
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
         Top             =   360
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
         TabIndex        =   15
         Tag             =   "9855"
         Top             =   840
         Width           =   1455
      End
   End
   Begin VB.Frame frameEnquiryDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Enquiry Details"
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
      TabIndex        =   7
      Top             =   360
      Width           =   9855
      Begin VB.TextBox txtIdNumber 
         Height          =   285
         Left            =   6480
         TabIndex        =   2
         Tag             =   "9855"
         Top             =   600
         Width           =   1695
      End
      Begin VB.ComboBox cmbIdType 
         Height          =   315
         Left            =   2880
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Tag             =   "9855"
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   6480
         TabIndex        =   47
         Tag             =   "9855"
         Top             =   240
         Width           =   3015
      End
      Begin VB.CommandButton cmdBillDetails 
         Caption         =   "Get Bill Details"
         Height          =   375
         Left            =   6360
         TabIndex        =   5
         Tag             =   "9855"
         Top             =   1440
         Width           =   1815
      End
      Begin VB.ComboBox cmbCompanyId 
         Height          =   315
         Left            =   2880
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Tag             =   "9855"
         Top             =   1080
         Width           =   3015
      End
      Begin VB.TextBox txtSubscriptionNo 
         Height          =   285
         Left            =   2880
         TabIndex        =   4
         Tag             =   "9855"
         Top             =   1560
         Width           =   3015
      End
      Begin VB.TextBox txtCustomerNo 
         Height          =   285
         Left            =   2880
         MaxLength       =   7
         TabIndex        =   0
         Tag             =   "9855"
         Top             =   240
         Width           =   1575
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
         Left            =   4680
         TabIndex        =   49
         Tag             =   "9855"
         Top             =   600
         Width           =   1215
      End
      Begin VB.Label lblidType 
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
         Left            =   240
         TabIndex        =   48
         Tag             =   "9855"
         Top             =   600
         Width           =   1335
      End
      Begin VB.Label lblCustName 
         BackColor       =   &H00BFD87E&
         Caption         =   "Customer Name"
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
         Left            =   4680
         TabIndex        =   46
         Tag             =   "9855"
         Top             =   240
         Width           =   1935
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
         Left            =   240
         TabIndex        =   11
         Tag             =   "9855"
         Top             =   1560
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
         Left            =   240
         TabIndex        =   10
         Tag             =   "9855"
         Top             =   1080
         Width           =   2055
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
         Left            =   240
         TabIndex        =   9
         Tag             =   "9855"
         Top             =   240
         Width           =   1935
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Return to Main menu"
      Height          =   375
      Left            =   6375
      TabIndex        =   8
      ToolTipText     =   "Return to Main menu"
      Top             =   7800
      Width           =   2055
   End
   Begin VB.Label lblBillStatusDesc 
      BackColor       =   &H00BFD87E&
      Caption         =   "Bill Query Status Description"
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
      TabIndex        =   45
      Top             =   7440
      Width           =   2535
   End
   Begin VB.Label lblUtilityBillEnquiry 
      BackColor       =   &H00BFD87E&
      Caption         =   "Utility Bill Enquiry"
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
      Left            =   4320
      TabIndex        =   19
      Top             =   0
      Width           =   3015
   End
End
Attribute VB_Name = "frmBillEnquiry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdBillDetails_Click()
    Dim tCode As String
    Dim mQry As String
    Dim strmsglen As String
    
    tCode = Mid$(cmbIdType.text, 1, 1)
    
    If Len(RTrim(tCode)) = 0 Then
       MsgBox errSpaceIdType(UserLang)
       Exit Sub
    End If
    
    If Len(RTrim(txtIdNumber)) = 0 Then
       MsgBox errSpaceId(UserLang)
       txtIdNumber.SetFocus
       Exit Sub
    End If
    
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
           
    If Mid$(cmbIdType.text, 1, 1) = "I" Or Mid$(cmbIdType.text, 1, 1) = "Q" Then
       If Len(RTrim(txtIdNumber)) <> 10 Then
          MsgBox errInvalidId(UserLang)
          txtIdNumber.SetFocus
          Exit Sub
       End If
       If validIdNumber(txtIdNumber) = False Then
          MsgBox errInvalidIdNo(UserLang)
          txtIdNumber.SetFocus
          Exit Sub
       End If
       If Mid$(cmbIdType, 1, 1) = "Q" Then
          If Mid$(txtIdNumber, 1, 1) <> "2" And _
             Mid$(txtIdNumber, 1, 1) <> "3" And _
             Mid$(txtIdNumber, 1, 1) <> "5" Then
             MsgBox errInvalidIdCategory(UserLang)
             txtIdNumber.SetFocus
             Exit Sub
          End If
       Else  ' Saudi Id Number
          If Mid$(txtIdNumber, 1, 1) <> "1" Then
             MsgBox errInvalidIdCategory(UserLang)
             txtIdNumber.SetFocus
             Exit Sub
          End If
       End If
    End If
    
    formatBillRequestMsg

    SendMsg = billEnquiryMsgOld.msgLen & billEnquiryMsgOld.service & billEnquiryMsgOld.homeBranch & _
              billEnquiryMsgOld.userId & billEnquiryMsgOld.langInd & billEnquiryMsgOld.custNo & _
              billEnquiryMsgOld.idType & billEnquiryMsgOld.idNo & billEnquiryMsgOld.subscriptionNo & _
              billEnquiryMsgOld.companyId

    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False

    frmBillEnquiry.MousePointer = vbHourglass
    cmdBillDetails.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmBillEnquiry.MousePointer = vbDefault
       cmdBillDetails.Enabled = True
       Exit Sub
    End If
    frmBillEnquiry.MousePointer = vbDefault
    cmdBillDetails.Enabled = True

    parseBillRequestMsg

    If recvBillEnqMsgOld.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvBillEnqMsgOld.aRemarks
       Else
          MsgBox recvBillEnqMsgOld.eRemarks
       End If
       Exit Sub
    End If

    cmdHighToll.tag = "N"
    fillBillEnquiryFrm cmdHighToll.tag
    If Mid$(cmbCompanyId, 1, 2) = "03" And _
      (Len(RTrim(recvBillEnqMsgOld.highTollBillInfo.billRefInfo)) > 0 Or _
       Len(RTrim(recvBillEnqMsgOld.highTollBillInfo.billAmountDue)) > 0) Then
       MsgBox errHighTollAvailable(UserLang)
       cmdHighToll.Enabled = True
    Else
       cmdHighToll.Enabled = False
    End If

End Sub
Public Sub fillBillEnquiryFrm(normalOrHightoll As String)
    Dim tCode As String
    Dim mQry As String

    txtBillStatusDesc = "  "
    If normalOrHightoll = "N" Then
        frameBillDetails.Caption = frmBillEnquiryCaption(9, UserLang)
        If Mid$(recvBillEnqMsgOld.billQueryStatusCode, 1, 1) <> "0" Then
           tCode = "S" & Format(Trim(recvBillEnqMsgOld.normalBillInfo.errorCode), "000")
           mQry = "select * from errorinfo where errorcode = '" & tCode & "'"
           Set rs = db.OpenRecordset(mQry)
           If rs.recordCount > 0 Then
              If UserLang = ARABIC Then
                 txtBillStatusDesc = recvBillEnqMsgOld.normalBillInfo.errorCode & rs("arabicDescription")
              Else
                 txtBillStatusDesc = recvBillEnqMsgOld.normalBillInfo.errorCode & rs("englishDescription")
              End If
           Else
              txtBillStatusDesc = recvBillEnqMsgOld.normalBillInfo.errorCode & "-Unknown error"
           End If
           MsgBox "Error  " & txtBillStatusDesc & " received from SADAD..."
        End If

        txtRefNo = recvBillEnqMsgOld.normalBillInfo.billRefInfo
        txtBillStatusCode = recvBillEnqMsgOld.normalBillInfo.billStatusCode
        If Len(RTrim(recvBillEnqMsgOld.normalBillInfo.billAmountDue)) > 0 Then
           txtBillAmuntDue = _
                Format(Val(recvBillEnqMsgOld.normalBillInfo.billAmountDue) / 100, "###############0.00")
        End If
        cmbExpiryDate = Mid$(recvBillEnqMsgOld.normalBillInfo.billExpiryDate, 9, 2)
        cmbExpiryMonth = Mid$(recvBillEnqMsgOld.normalBillInfo.billExpiryDate, 6, 2)
        txtExpiryYear = Mid$(recvBillEnqMsgOld.normalBillInfo.billExpiryDate, 1, 4)

        cmbDueDate = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDueDate, 9, 2)
        cmbDueMonth = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDueDate, 6, 2)
        txtDueYear = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDueDate, 1, 4)

        If recvBillEnqMsgOld.normalBillInfo.exactPaymentOnly = "T" Then
           optExactPaymentYes.Value = True
        Else
           optExactPaymentNo.Value = True
        End If
        If Len(RTrim(recvBillEnqMsgOld.normalBillInfo.billAmountPaid)) > 0 Then
           txtBillAmountPaid = _
                Format(Val(recvBillEnqMsgOld.normalBillInfo.billAmountPaid) / 100, "###############0.00")
        End If
        txtBillPaymentStatus = recvBillEnqMsgOld.normalBillInfo.billPaymentStatus
        cmbPaymentDate = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDate, 9, 2)
        cmbPaymentMonth = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDate, 6, 2)
        txtPaymentYear = Mid$(recvBillEnqMsgOld.normalBillInfo.paymentDate, 1, 4)
        txtAnbTransRefNo = recvBillEnqMsgOld.normalBillInfo.bankTransactionId
        txtSadadTransId = recvBillEnqMsgOld.normalBillInfo.sadadTransactionId
    Else  ' if Hightoll bill
       frameBillDetails.Caption = frmBillEnquiryCaption(10, UserLang)
       If Mid$(recvBillEnqMsgOld.billQueryStatusCode, 1, 1) <> "0" Then
          tCode = "S" & Format(Trim(recvBillEnqMsgOld.highTollBillInfo.errorCode), "000")
          mQry = "select * from errorinfo where errorcode = '" & tCode & "'"
          Set rs = db.OpenRecordset(mQry)
          If rs.recordCount > 0 Then
             If UserLang = ARABIC Then
                txtBillStatusDesc = recvBillEnqMsgOld.highTollBillInfo.errorCode & rs("arabicDescription")
             Else
                txtBillStatusDesc = recvBillEnqMsgOld.highTollBillInfo.errorCode & rs("englishDescription")
             End If
          Else
             txtBillStatusDesc = recvBillEnqMsgOld.highTollBillInfo.errorCode & "-Unknown error"
          End If
       End If

       txtRefNo = recvBillEnqMsgOld.highTollBillInfo.billRefInfo
       txtBillStatusCode = recvBillEnqMsgOld.highTollBillInfo.billStatusCode
       If Len(RTrim(recvBillEnqMsgOld.highTollBillInfo.billAmountDue)) > 0 Then
          txtBillAmuntDue = _
                 Format(Val(recvBillEnqMsgOld.highTollBillInfo.billAmountDue) / 100, "###############0.00")
       End If
       cmbExpiryDate = Mid$(recvBillEnqMsgOld.highTollBillInfo.billExpiryDate, 9, 2)
       cmbExpiryMonth = Mid$(recvBillEnqMsgOld.highTollBillInfo.billExpiryDate, 6, 2)
       txtExpiryYear = Mid$(recvBillEnqMsgOld.highTollBillInfo.billExpiryDate, 1, 4)

       cmbDueDate = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDueDate, 9, 2)
       cmbDueMonth = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDueDate, 6, 2)
       txtDueYear = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDueDate, 1, 4)

       If recvBillEnqMsgOld.highTollBillInfo.exactPaymentOnly = "T" Then
          optExactPaymentYes.Value = True
       Else
          optExactPaymentNo.Value = True
       End If
       If Len(RTrim(recvBillEnqMsgOld.highTollBillInfo.billAmountPaid)) > 0 Then
          txtBillAmountPaid = _
                Format(Val(recvBillEnqMsgOld.highTollBillInfo.billAmountPaid) / 100, "###############0.00")
       End If
       txtBillPaymentStatus = recvBillEnqMsgOld.highTollBillInfo.billPaymentStatus
       cmbPaymentDate = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDate, 9, 2)
       cmbPaymentMonth = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDate, 6, 2)
       txtPaymentYear = Mid$(recvBillEnqMsgOld.highTollBillInfo.paymentDate, 1, 4)
       txtAnbTransRefNo = recvBillEnqMsgOld.highTollBillInfo.bankTransactionId
       txtSadadTransId = recvBillEnqMsgOld.highTollBillInfo.sadadTransactionId
  End If
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdHighToll_Click()
    If cmdHighToll.tag = "N" Then
       cmdHighToll.tag = "H"
       cmdHighToll.Caption = frmBillEnquiryCaption(27, UserLang)
       cmdHighToll.ToolTipText = "Normal Bill Info"
    Else
       cmdHighToll.tag = "N"
       cmdHighToll.Caption = frmBillEnquiryCaption(26, UserLang)
       cmdHighToll.ToolTipText = "High Toll Info"
    End If
    fillBillEnquiryFrm cmdHighToll.tag
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    
    If UserLang = ARABIC Then
       ChangePositions frmBillEnquiry, 11800
       frmBillEnquiry.RightToLeft = True
       frameEnquiryDetails.RightToLeft = True
       framePaymentDetails.RightToLeft = True
       frameBillDetails.RightToLeft = True
    End If
    
    frmBillEnquiry.Caption = frmBillEnquiryCaption(0, UserLang)
    frmBillEnquiry.lblUtilityBillEnquiry.Caption = frmBillEnquiryCaption(0, UserLang)
    frmBillEnquiry.frameEnquiryDetails.Caption = frmBillEnquiryCaption(1, UserLang)
    frmBillEnquiry.lblCustomerNo.Caption = frmBillEnquiryCaption(2, UserLang)
    frmBillEnquiry.lblCustName.Caption = frmBillEnquiryCaption(3, UserLang)
    frmBillEnquiry.lblIdType.Caption = frmBillEnquiryCaption(4, UserLang)
    frmBillEnquiry.lblIdNumber.Caption = frmBillEnquiryCaption(5, UserLang)
    frmBillEnquiry.lblCompanyId.Caption = frmBillEnquiryCaption(6, UserLang)
    frmBillEnquiry.lblSubscriptionNo.Caption = frmBillEnquiryCaption(7, UserLang)
    frmBillEnquiry.cmdBillDetails.Caption = frmBillEnquiryCaption(8, UserLang)
    
    frmBillEnquiry.frameBillDetails.Caption = frmBillEnquiryCaption(9, UserLang)
    frmBillEnquiry.lblBillRefNo.Caption = frmBillEnquiryCaption(11, UserLang)
    frmBillEnquiry.lblBillStatus.Caption = frmBillEnquiryCaption(12, UserLang)
    frmBillEnquiry.lblAmountDue.Caption = frmBillEnquiryCaption(13, UserLang)
    frmBillEnquiry.lblDueDate.Caption = frmBillEnquiryCaption(14, UserLang)
    frmBillEnquiry.lblExpiryDate.Caption = frmBillEnquiryCaption(15, UserLang)
    frmBillEnquiry.lblExactPaymentOnly.Caption = frmBillEnquiryCaption(16, UserLang)
    frmBillEnquiry.optExactPaymentYes.Caption = frmBillEnquiryCaption(17, UserLang)
    frmBillEnquiry.optExactPaymentNo.Caption = frmBillEnquiryCaption(18, UserLang)
    
    frmBillEnquiry.framePaymentDetails.Caption = frmBillEnquiryCaption(19, UserLang)
    frmBillEnquiry.lblBillAmountPaid.Caption = frmBillEnquiryCaption(20, UserLang)
    frmBillEnquiry.lblBillPaymentStatus.Caption = frmBillEnquiryCaption(21, UserLang)
    frmBillEnquiry.lblPaymentDate.Caption = frmBillEnquiryCaption(22, UserLang)
    frmBillEnquiry.lblAnbTransactionId.Caption = frmBillEnquiryCaption(23, UserLang)
    frmBillEnquiry.lblSadadTransactionId.Caption = frmBillEnquiryCaption(24, UserLang)
    frmBillEnquiry.lblBillStatusDesc = frmBillEnquiryCaption(25, UserLang)
    frmBillEnquiry.cmdHighToll.Caption = frmBillEnquiryCaption(26, UserLang)
    frmBillEnquiry.cmdExit.Caption = frmBillEnquiryCaption(28, UserLang)
    
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
   frmBillEnquiry.Show

    
End Sub

Public Sub formatBillRequestMsg()
    Dim tmpStr As String
    Dim tCode As String

    billEnquiryMsgOld.msgLen = "000000"
    billEnquiryMsgOld.service = "81"
    billEnquiryMsgOld.homeBranch = gBranchCode
    billEnquiryMsgOld.userId = Format(gUserId, "!@@@@@@@@@@")
    billEnquiryMsgOld.langInd = "E"
    If UserLang = ARABIC Then
       billEnquiryMsgOld.langInd = "A"
    Else
       billEnquiryMsgOld.langInd = "E"
    End If
    billEnquiryMsgOld.custNo = Format(txtCustomerNo, "!@@@@@@@")
    billEnquiryMsgOld.idType = Mid$(cmbIdType.text, 1, 1)
    billEnquiryMsgOld.idNo = Format(txtIdNumber, "!@@@@@@@@@@@@@@@")
    billEnquiryMsgOld.subscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
    tCode = Trim(Mid$(cmbCompanyId, 1, 4))
    'billEnquiryMsgOld.companyId = Format(Mid$(cmbCompanyId, 1, 2), "!@@@@")
    billEnquiryMsgOld.companyId = Format(tCode, "!@@@@")
End Sub

Public Sub parseBillRequestMsg()
    Dim pos As Integer
    pos = 1
    recvBillEnqMsgOld.status = Mid$(RecvStr, pos, 3)
    pos = pos + 3
    recvBillEnqMsgOld.service = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    recvBillEnqMsgOld.aRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillEnqMsgOld.eRemarks = Mid$(RecvStr, pos, 50)
    pos = pos + 50
    recvBillEnqMsgOld.subscriptionNo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.companyId = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillEnqMsgOld.billQueryStatusCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillEnqMsgOld.normalBillInfo.billRefInfo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.billStatusCode = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBillEnqMsgOld.normalBillInfo.billAmountDue = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.billExpiryDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.paymentDueDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.exactPaymentOnly = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvBillEnqMsgOld.normalBillInfo.billAmountPaid = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.billPaymentStatus = Mid$(RecvStr, pos, 12)
    pos = pos + 12
    recvBillEnqMsgOld.normalBillInfo.paymentDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.normalBillInfo.bankTransactionId = Mid$(RecvStr, pos, 36)
    pos = pos + 36
    recvBillEnqMsgOld.normalBillInfo.sadadTransactionId = Mid$(RecvStr, pos, 36)
    pos = pos + 36
    recvBillEnqMsgOld.normalBillInfo.errorCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
    recvBillEnqMsgOld.highTollBillInfo.billRefInfo = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.billStatusCode = Mid$(RecvStr, pos, 10)
    pos = pos + 10
    recvBillEnqMsgOld.highTollBillInfo.billAmountDue = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.billExpiryDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.paymentDueDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.exactPaymentOnly = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    recvBillEnqMsgOld.highTollBillInfo.billAmountPaid = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.billPaymentStatus = Mid$(RecvStr, pos, 12)
    pos = pos + 12
    recvBillEnqMsgOld.highTollBillInfo.paymentDate = Mid$(RecvStr, pos, 19)
    pos = pos + 19
    recvBillEnqMsgOld.highTollBillInfo.bankTransactionId = Mid$(RecvStr, pos, 36)
    pos = pos + 36
    recvBillEnqMsgOld.highTollBillInfo.sadadTransactionId = Mid$(RecvStr, pos, 36)
    pos = pos + 36
    recvBillEnqMsgOld.highTollBillInfo.errorCode = Mid$(RecvStr, pos, 4)
    pos = pos + 4
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
