VERSION 5.00
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "MSFLXGRD.OCX"
Begin VB.Form frmSadadPayment 
   BackColor       =   &H00BFD87E&
   Caption         =   "SADAD Payment"
   ClientHeight    =   8370
   ClientLeft      =   1710
   ClientTop       =   525
   ClientWidth     =   11550
   ControlBox      =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   MinButton       =   0   'False
   ScaleHeight     =   8370
   ScaleWidth      =   11550
   WindowState     =   2  'Maximized
   Begin VB.Frame frameBillDetails 
      BackColor       =   &H00BFD87E&
      Caption         =   "Bill Details"
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
      Height          =   1395
      Left            =   915
      TabIndex        =   36
      Top             =   2685
      Width           =   10530
      Begin VB.Frame frameBillSelection 
         BackColor       =   &H00BFD87E&
         BorderStyle     =   0  'None
         Height          =   660
         Left            =   9450
         TabIndex        =   38
         Tag             =   "10530"
         Top             =   435
         Width           =   345
         Begin VB.OptionButton optBill2 
            BackColor       =   &H00BFD87E&
            Height          =   240
            Left            =   75
            TabIndex        =   40
            Tag             =   "345"
            ToolTipText     =   "Second bill"
            Top             =   345
            Width           =   240
         End
         Begin VB.OptionButton optBill1 
            BackColor       =   &H00BFD87E&
            Height          =   210
            Left            =   60
            TabIndex        =   39
            Tag             =   "345"
            ToolTipText     =   "First Bill"
            Top             =   105
            Value           =   -1  'True
            Width           =   255
         End
      End
      Begin MSFlexGridLib.MSFlexGrid billDetailsGrid 
         Height          =   975
         Left            =   690
         TabIndex        =   37
         Tag             =   "10530"
         Top             =   240
         Width           =   8025
         _ExtentX        =   14155
         _ExtentY        =   1720
         _Version        =   393216
         Rows            =   3
         Cols            =   5
         FixedCols       =   0
         BackColor       =   12572798
         ForeColor       =   8388608
         ForeColorFixed  =   8388608
         ScrollBars      =   0
         SelectionMode   =   1
         AllowUserResizing=   1
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
      Height          =   2640
      Left            =   945
      TabIndex        =   16
      Top             =   4245
      Width           =   10305
      Begin VB.CommandButton cmdReject 
         Caption         =   "Reject Reversal"
         Height          =   375
         Left            =   5730
         TabIndex        =   35
         Tag             =   "10305"
         ToolTipText     =   "Reject the reversal"
         Top             =   2130
         Visible         =   0   'False
         Width           =   1815
      End
      Begin VB.TextBox txtCustName 
         Enabled         =   0   'False
         Height          =   285
         Left            =   2385
         TabIndex        =   33
         Tag             =   "10305"
         Top             =   1695
         Width           =   2655
      End
      Begin VB.TextBox txtTransRefNo 
         Enabled         =   0   'False
         Height          =   285
         Left            =   7395
         TabIndex        =   31
         Tag             =   "10305"
         Top             =   1650
         Width           =   2655
      End
      Begin VB.CommandButton cmdSigCap 
         Caption         =   "Signature"
         Height          =   375
         Left            =   5220
         TabIndex        =   8
         Tag             =   "10305"
         ToolTipText     =   "Signature verification"
         Top             =   735
         Width           =   1215
      End
      Begin VB.CommandButton cmdPayBill 
         Caption         =   "POST"
         Height          =   375
         Left            =   3810
         TabIndex        =   10
         Tag             =   "10305"
         ToolTipText     =   "Post"
         Top             =   2130
         Width           =   1815
      End
      Begin VB.TextBox txtDebitAccNo 
         Height          =   285
         Left            =   2385
         TabIndex        =   7
         Tag             =   "10305"
         Top             =   765
         Width           =   2655
      End
      Begin VB.ComboBox cmbPaymentType 
         Height          =   315
         Left            =   6330
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Tag             =   "10305"
         Top             =   285
         Width           =   2160
      End
      Begin VB.Frame frameCashOrAcc 
         Height          =   420
         Left            =   2385
         TabIndex        =   18
         Tag             =   "10305"
         Top             =   210
         Width           =   1920
         Begin VB.OptionButton optAcc 
            Caption         =   "A/c"
            Height          =   210
            Left            =   120
            TabIndex        =   5
            Tag             =   "1920"
            ToolTipText     =   "A/c"
            Top             =   120
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.OptionButton optCash 
            Caption         =   "Cash"
            Height          =   240
            Left            =   960
            TabIndex        =   19
            Tag             =   "1920"
            ToolTipText     =   "Cash"
            Top             =   120
            Width           =   840
         End
      End
      Begin VB.TextBox txtPaymentAmt 
         Height          =   285
         Left            =   2385
         TabIndex        =   9
         Tag             =   "10305"
         Top             =   1245
         Width           =   2655
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
         Left            =   255
         TabIndex        =   34
         Tag             =   "10305"
         Top             =   1695
         Width           =   2085
      End
      Begin VB.Label lblTransRefNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Transaction Ref.No."
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
         Left            =   5235
         TabIndex        =   32
         Tag             =   "10305"
         Top             =   1650
         Width           =   2085
      End
      Begin VB.Label lblSigCapStatus 
         BackColor       =   &H00BFD87E&
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
         Left            =   7500
         TabIndex        =   30
         Tag             =   "9855"
         Top             =   1770
         Visible         =   0   'False
         Width           =   915
      End
      Begin VB.Label lblDrAccNo 
         BackColor       =   &H00BFD87E&
         Caption         =   "Debit A/c Number"
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
         TabIndex        =   22
         Tag             =   "10305"
         Top             =   750
         Width           =   1965
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
         Left            =   4725
         TabIndex        =   21
         Tag             =   "10305"
         Top             =   300
         Width           =   1770
      End
      Begin VB.Label lblCashOrAcc 
         BackColor       =   &H00BFD87E&
         Caption         =   "Cash or Account"
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
         Left            =   525
         TabIndex        =   20
         Tag             =   "10305"
         Top             =   315
         Width           =   1785
      End
      Begin VB.Label lblPaymentAmt 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment Amount"
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
         Left            =   225
         TabIndex        =   17
         Tag             =   "10305"
         Top             =   1245
         Width           =   1815
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
      Height          =   1695
      Left            =   930
      TabIndex        =   11
      Top             =   915
      Width           =   10335
      Begin VB.Frame frameInstrumentType 
         Height          =   420
         Left            =   2400
         TabIndex        =   28
         Tag             =   "10335"
         Top             =   645
         Width           =   3405
         Begin VB.OptionButton optBillNo 
            Caption         =   "Bill number"
            Height          =   240
            Left            =   2055
            TabIndex        =   2
            Tag             =   "3405"
            ToolTipText     =   "Bill number"
            Top             =   135
            Width           =   1170
         End
         Begin VB.OptionButton optSubsNo 
            Caption         =   "Subscription number"
            Height          =   210
            Left            =   105
            TabIndex        =   1
            Tag             =   "3405"
            ToolTipText     =   "Subscription number"
            Top             =   135
            Value           =   -1  'True
            Width           =   1800
         End
      End
      Begin VB.Frame framePaymentOption 
         Height          =   420
         Left            =   7575
         TabIndex        =   24
         Tag             =   "10335"
         Top             =   195
         Width           =   2595
         Begin VB.OptionButton optPostPayment 
            Caption         =   "Post paid"
            Height          =   210
            Left            =   105
            TabIndex        =   26
            Tag             =   "2595"
            ToolTipText     =   "Post paid"
            Top             =   120
            Value           =   -1  'True
            Width           =   1155
         End
         Begin VB.OptionButton optPrePayment 
            Caption         =   "Pre paid"
            Height          =   240
            Left            =   1365
            TabIndex        =   25
            Tag             =   "2595"
            ToolTipText     =   "Pre paid"
            Top             =   120
            Width           =   1110
         End
      End
      Begin VB.CommandButton cmdClear 
         Caption         =   "Clear Details"
         Height          =   375
         Left            =   7665
         TabIndex        =   23
         Tag             =   "10335"
         Top             =   1200
         Width           =   1815
      End
      Begin VB.CommandButton cmdBillDetails 
         Caption         =   "Get Bill Details"
         Default         =   -1  'True
         Height          =   375
         Left            =   5640
         TabIndex        =   4
         Tag             =   "10335"
         Top             =   1230
         Width           =   1815
      End
      Begin VB.ComboBox cmbCompanyId 
         Height          =   315
         Left            =   2415
         TabIndex        =   0
         Tag             =   "10335"
         Text            =   "cmbCompanyId"
         Top             =   225
         Width           =   3015
      End
      Begin VB.TextBox txtSubscriptionNo 
         Height          =   285
         Left            =   2415
         MaxLength       =   19
         TabIndex        =   3
         Tag             =   "10335"
         Top             =   1245
         Width           =   3015
      End
      Begin VB.Label lblInstType 
         BackColor       =   &H00BFD87E&
         Caption         =   "Instrument Type"
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
         Left            =   645
         TabIndex        =   29
         Tag             =   "10335"
         Top             =   705
         Width           =   1755
      End
      Begin VB.Label lblPreOrPostPayment 
         BackColor       =   &H00BFD87E&
         Caption         =   "Payment option"
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
         Left            =   5880
         TabIndex        =   27
         Tag             =   "10335"
         Top             =   285
         Width           =   1770
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
         Left            =   135
         TabIndex        =   14
         Tag             =   "10335"
         Top             =   1230
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
         Left            =   195
         TabIndex        =   13
         Tag             =   "10335"
         Top             =   255
         Width           =   2055
      End
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "Return to Main menu"
      Height          =   375
      Left            =   4740
      TabIndex        =   12
      ToolTipText     =   "Return to Main menu"
      Top             =   7245
      Width           =   2055
   End
   Begin VB.Image anbLogo 
      Height          =   810
      Left            =   7575
      Picture         =   "frmSadadPayment.frx":0000
      Top             =   30
      Width           =   930
   End
   Begin VB.Image sadadLogo 
      Height          =   600
      Left            =   2175
      Picture         =   "frmSadadPayment.frx":27EA
      Top             =   150
      Width           =   2100
   End
   Begin VB.Label lblUtilityBillPayment 
      BackColor       =   &H00BFD87E&
      Caption         =   "SADAD Payment"
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
      Left            =   4425
      TabIndex        =   15
      Top             =   285
      Width           =   2880
   End
End
Attribute VB_Name = "frmSadadPayment"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Public billerIdRs As Recordset
Public gDebitAccNo As String
Public gPaymentAmt As String
Public gSubscriptionNo As String

Private Sub billDetailsGrid_Click()
    If billDetailsGrid.Row = 1 Then
       optBill1.Value = True
    Else
       optBill2.Value = True
    End If
End Sub

Private Sub billDetailsGrid_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
     secsUserInactive = 0
     CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub cmbCompanyId_LostFocus()
    Dim tCode As String, mQry As String
    Dim i As Integer
      
    If Screen.ActiveControl.Name = "cmdıExit" Then
       DoEvents
    Else
       On Error Resume Next
       If Len(RTrim(cmbCompanyId.text)) <> 0 Then
          tCode = Trim(Mid$(cmbCompanyId.text, 1, 4))
          For i = 0 To cmbCompanyId.ListCount
              If Trim(Mid$(cmbCompanyId.List(i), 1, 4)) = tCode Then
                 cmbCompanyId.ListIndex = i
                 Exit For
              End If
          Next i
       End If
   End If
   On Error GoTo 0
   If optPrePayment = True Then
      tCode = Format(Trim(Mid$(cmbCompanyId, 1, 4)), "!@@@@")
      mQry = "select * from companyIdInfo where  companyId = '" & tCode & "'"
      Set billerIdRs = db.OpenRecordset(mQry)
      If billerIdRs.recordCount <= 0 Then
         MsgBox errBillerIdNotDefined(UserLang)  '"Biller Id not defined in local DB.. Please check.."
         cmbCompanyId.ListIndex = -1
         optPostPayment.Value = True
         Exit Sub
      End If
      tCode = IIf(billerIdRs("prepaymentallowed") = "" Or IsNull(billerIdRs("prepaymentallowed")) = True, " ", billerIdRs("prepaymentallowed"))
      If tCode <> "1" Then
         MsgBox errPrepaymentNotAllowed(UserLang)  '"Prepayment is not allowed for this biller id .. please check.."
         cmbCompanyId.ListIndex = -1
         optPostPayment.Value = True
         Exit Sub
      End If
      cmdBillDetails.Enabled = False
      framePaymentDetails.Enabled = True
      cmbPaymentType.Enabled = True
      txtPaymentAmt.Enabled = True
   End If
End Sub

Private Sub cmdBillDetails_Click()
    Dim tCode As String
    Dim mQry As String
    Dim strmsglen As String
    Dim tmpStr As String
    Dim i As Integer
    Dim gridRow As Integer
    Dim defaultRow As Integer
    
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
    
    tCode = Mid$(cmbCompanyId, 1, 4)
    mQry = "select * from companyIdInfo where  companyId = '" & tCode & "'"
    Set billerIdRs = db.OpenRecordset(mQry)
    If billerIdRs.recordCount <= 0 Then
       MsgBox errBillerIdNotDefined(UserLang)  '"Biller Id not defined in local DB.. Please check.."
       Exit Sub
    End If
    
    ' while reading from barcode scanner for STC and some other bill,
    ' subscription number along with bill amount is barcoded; from that,
    ' to get the correct subscription number, we have taken the first
    ' 10 digits
'    If Len(Trim(txtSubscriptionNo)) > 19 Then
'       txtSubscriptionNo = Mid$(txtSubscriptionNo, 1, 10)
'    End If
    
    formatSadadEnq

    SendMsg = billEnquiryMsg.msgLen & billEnquiryMsg.service & billEnquiryMsg.homeBranch & _
              billEnquiryMsg.userId & billEnquiryMsg.langInd & billEnquiryMsg.custNo & _
              billEnquiryMsg.idType & billEnquiryMsg.idNo & billEnquiryMsg.subscriptionNo & _
              billEnquiryMsg.companyId & billEnquiryMsg.newLangId & billEnquiryMsg.billNo & _
              billEnquiryMsg.startDate & billEnquiryMsg.endDate & billEnquiryMsg.inclPayments & _
              billEnquiryMsg.inclPaidBills & Space(50)
            
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    frmSadadPayment.MousePointer = vbHourglass
    frameEnquiryDetails.Enabled = False
    cmdBillDetails.Enabled = False
    cmdExit.Enabled = False
    cmdClear.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSadadPayment.MousePointer = vbDefault
       frameEnquiryDetails.Enabled = True
       cmdBillDetails.Enabled = True
       cmdClear.Enabled = True
       cmdExit.Enabled = True
       Exit Sub
    End If
    frameEnquiryDetails.Enabled = True
    frmSadadPayment.MousePointer = vbDefault
    cmdBillDetails.Enabled = True
    cmdExit.Enabled = True
    cmdClear.Enabled = True
        
    parseBillRequestMsg
    
    If recvBillEnqMsg.status <> "000" Then
       If UserLang = ARABIC Then
          MsgBox recvBillEnqMsg.aRemarks
       Else
          MsgBox recvBillEnqMsg.eRemarks
       End If
       Exit Sub
    End If
    
    If Trim(recvBillEnqMsg.errorCode) <> "0" And Trim(recvBillEnqMsg.errorCode) <> "0040" Then
       tCode = recvBillEnqMsg.errorCode
       mQry = "select * from sadaderrorinfo where errorcode = '" & tCode & "'"
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
       If tCode <> "000062" And tCode <> "000061" Then
          MsgBox errError(UserLang) & "(Error Code) [" & tmpStr & "] " & errRecdFromSADAD(UserLang)
       Else
          MsgBox tmpStr
       End If
       Exit Sub
    End If
    
    If Trim(recvBillEnqMsg.statusCode) <> "0" And Trim(recvBillEnqMsg.statusCode) <> "0040" Then
       tCode = recvBillEnqMsg.statusCode
       'mQry = "select * from sadadstatusinfo where statuscode = '" & tCode & "'"
       mQry = "select * from sadaderrorinfo where errorcode = '" & tCode & "'"
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
       If tCode <> "000062" And tCode <> "000061" Then
          MsgBox errError(UserLang) & "(Status Code) [" & tmpStr & "] " & errRecdFromSADAD(UserLang)
       Else
          MsgBox tmpStr
       End If
       Exit Sub
    End If
    
    If Val(recvBillEnqMsg.recordCount) = 2 Then
       If (Trim(recvBillEnqMsg.billInfo(1).billStatusCode) = "BillOverPd" Or _
           Trim(recvBillEnqMsg.billInfo(1).billStatusCode) = "BillPaid") And _
          (Trim(recvBillEnqMsg.billInfo(2).billStatusCode) = "BillOverPd" Or _
           Trim(recvBillEnqMsg.billInfo(2).billStatusCode) = "BillPaid") Then
           MsgBox errBillAlreadyPaid(UserLang)  '"This bill is already paid....cannot pay again.."
           Exit Sub
       End If
    Else
       If (Trim(recvBillEnqMsg.billInfo(1).billStatusCode) = "BillOverPd" Or _
           Trim(recvBillEnqMsg.billInfo(1).billStatusCode) = "BillPaid") Then
           MsgBox errBillAlreadyPaid(UserLang)  '"This bill is already paid....cannot pay again.."
           Exit Sub
       End If
    End If
    
    billDetailsGrid.Clear
    displayBillEnquiryHeading
    
    gridRow = 0
    For i = 1 To Val(recvBillEnqMsg.recordCount)
        If i > 2 Then
           Exit For
        End If
        gridRow = gridRow + 1
        billDetailsGrid.Row = gridRow
        billDetailsGrid.Col = 0
        billDetailsGrid.CellAlignment = flexAlignLeftCenter
        billDetailsGrid.text = Format(Val(recvBillEnqMsg.billInfo(i).amountDue), "#" & _
                                       "#################0.00")
        billDetailsGrid.Col = 1
        billDetailsGrid.CellAlignment = flexAlignLeftCenter
        billDetailsGrid.text = recvBillEnqMsg.billInfo(i).billCategory
        billDetailsGrid.Col = 2
        billDetailsGrid.CellAlignment = flexAlignLeftCenter
        billDetailsGrid.text = Mid$(recvBillEnqMsg.billInfo(i).billDueDate, 9, 2) & "/" & _
                               Mid$(recvBillEnqMsg.billInfo(i).billDueDate, 6, 2) & "/" & _
                               Mid$(recvBillEnqMsg.billInfo(i).billDueDate, 1, 4)
        billDetailsGrid.Col = 3
        billDetailsGrid.CellAlignment = flexAlignLeftCenter
        billDetailsGrid.text = Mid$(recvBillEnqMsg.billInfo(i).billExpiryDate, 9, 2) & "/" & _
                               Mid$(recvBillEnqMsg.billInfo(i).billExpiryDate, 6, 2) & "/" & _
                               Mid$(recvBillEnqMsg.billInfo(i).billExpiryDate, 1, 4)
                            
        billDetailsGrid.Col = 4
        billDetailsGrid.CellAlignment = flexAlignLeftCenter
        If Trim(UCase(recvBillEnqMsg.billInfo(i).exactPaymentReqd)) = "TRUE" Then
           billDetailsGrid.text = errNo(UserLang)
        Else
           billDetailsGrid.text = errYes(UserLang)
        End If
        'billDetailsGrid.text = Trim(UCase(recvBillEnqMsg.billInfo(i).exactPaymentReqd))
     Next

'    If Val(recvBillEnqMsg.billInfo(1).amountDue) <= 0 Then
'       defaultRow = 2
'    Else
'       defaultRow = 1
'    End If

    defaultRow = 1

    txtPaymentAmt = Format(Val(recvBillEnqMsg.billInfo(defaultRow).amountDue), "#" & _
                                            "#################0.00")
    framePaymentDetails.Enabled = True
    If Trim(UCase(recvBillEnqMsg.billInfo(defaultRow).exactPaymentReqd)) = "FALSE" Then
       txtPaymentAmt.Enabled = True
    Else
       txtPaymentAmt.Enabled = False
    End If
   
    cmbPaymentType.Enabled = False
        
    cmdBillDetails.Enabled = False
    cmdBillDetails.Default = False
    'cmdPayBill.Default = True
    cmdSigCap.Default = True
    cmbCompanyId.Enabled = False
    txtSubscriptionNo.Enabled = False
    frameInstrumentType.Enabled = False
    framePaymentOption.Enabled = False

End Sub
Public Sub clearForms()
    cmdBillDetails.Enabled = True
    cmdPayBill.Default = False
    cmdSigCap.Default = False
    cmdBillDetails.Default = False
    cmbCompanyId.Enabled = True
    txtSubscriptionNo.Enabled = True
    frameInstrumentType.Enabled = True
    framePaymentOption.Enabled = True
    cmbCompanyId.ListIndex = -1
    optSubsNo.Value = True
    optAcc.Value = True
    txtSubscriptionNo.text = ""
    optPostPayment.Value = True
    optBill1.Value = True
    
    billDetailsGrid.Clear
    If Val(recvBillEnqMsg.recordCount) >= 2 Then
       recvBillEnqMsg.billInfo(2).amountDue = "    "
       recvBillEnqMsg.billInfo(2).billCategory = "    "
       recvBillEnqMsg.billInfo(2).billDueDate = "     "
       recvBillEnqMsg.billInfo(2).billExpiryDate = "      "
       recvBillEnqMsg.billInfo(2).exactPaymentReqd = "    "
    End If
    displayBillEnquiryHeading
'    txtBillAmt.text = ""
'    cmbDueDate = ""
'    cmbDueMonth = ""
'    txtDueYear = ""
'    cmbExpiryDate = ""
'    cmbExpiryMonth = ""
'    txtExpiryYear = ""
    framePaymentDetails.Enabled = False
    txtDebitAccNo.text = ""
    txtPaymentAmt.text = ""
    txtCustName.text = ""
    txtTransRefNo.text = ""
End Sub
Private Sub cmdClear_Click()
   clearForms
End Sub

Private Sub cmdExit_Click()
    Unload Me
End Sub

Private Sub cmdPayBill_Click()
    Dim transRefNo As String
    Dim strmsglen As String
    Dim currentPrinter As Printer, PRNTR As Printer
    Dim tmpPrinter As String
    Dim pendingFlag As String
    Dim recptPrinterDefaulted As Boolean
    Dim tCode As String
    Dim chkDigitStatus As Integer
    Dim response
    
    If frmSadadPayment.tag = "S" Or frmSadadPayment.tag = "A" Then  'S-send the reversal request to supervisor
                                                                    'A-send the approval message to teller
       If frmSadadPayment.tag = "S" Then
          If optCash = True Then
             If checkTellerCashPosition(recvLoginMsg.bpUserId, "SAR") = 1 Then
                Exit Sub
             End If
          End If
       End If
       transRefNo = txtTransRefNo
       SendMsg = "000000" & "AW" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvLoginMsg.bpUserId & _
                 Format(transRefNo, "!@@@@@@@@@@") & recvLoginMsg.bankingDate & frmSadadPayment.tag & _
                 Space(50)
       strmsglen = Format(Len(SendMsg), "000000")
       Mid$(SendMsg, 1, 6) = strmsglen
       DataReceivedFlag = False
       frmSadadPayment.MousePointer = vbHourglass
  
       If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
          LoadError = True
          frmSadadPayment.MousePointer = vbNormal
          Exit Sub
       End If
   
       frmSadadPayment.MousePointer = vbNormal
       
       If recvCustomerMsg.status = "000" Then
          If frmSadadPayment.tag = "S" Then
             MsgBox errReversalPendingWithChiefTeller(UserLang)
             Unload Me
          Else
             MsgBox errReversalApproved(UserLang)
             unloadSadadForms
          End If
       ElseIf recvCustomerMsg.status = "128" Then
          MsgBox errReversalNotAllowed(UserLang)   ' "Reversal Not allowed for this Payment type"
       Else
          If UserLang = ARABIC Then
             MsgBox recvCustomerMsg.aRemarks
          Else
             MsgBox recvCustomerMsg.eRemarks
          End If
       End If
       Exit Sub
    End If
    
    If frmSadadPayment.tag <> "R" Then   ' Not a reversal
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
       
       If Len(RTrim(cmbPaymentType)) = 0 Then
          MsgBox errSpacePaymentType(UserLang) '"Payment type cannot be space.. please select..."
          Exit Sub
       End If
        
       If Len(Trim(txtDebitAccNo)) = 0 Then
          MsgBox errSpaceDrAccNo(UserLang) '"Debit account number cannot be space...please check..."
          Exit Sub
       End If
       
       If Mid$(txtDebitAccNo, 1, 2) <> "01" Then
          MsgBox errOnlySarDrAcc(UserLang)    ' "Only SAR account can be used as debit account
          Exit Sub
       End If
        
       If Len(Trim(txtPaymentAmt)) = 0 Then
          MsgBox errSpacePaymentAmt(UserLang)   '"Payment amount cannot be blank..please check..."
          Exit Sub
       End If
       
       If Val(txtPaymentAmt) <= 0 Then
          MsgBox errAmtGreaterThanZero(UserLang)   '"Payment amount should be greater than zero.. please check.."
          Exit Sub
       End If
       
       tCode = IIf(billerIdRs("checkDigitOption") = "" Or IsNull(billerIdRs("checkDigitOption")) = True, " ", billerIdRs("checkDigitOption"))
       
       If tCode >= "0" And tCode <= "9" Then
          chkDigitStatus = BPAnbVal(tCode, Trim(txtSubscriptionNo))
          
          If chkDigitStatus = 1 Then
             MsgBox errInvalidSubsNo(UserLang)  '"Invalid subscription number entered...please check.."
             Exit Sub
          End If
       End If

       If optCash = True Then
          If checkTellerCashPosition(recvLoginMsg.bpUserId, "SAR") = 1 Then
             Exit Sub
          End If
       End If
       If getTransRefNo(recvLoginMsg.bpUserId, transRefNo) = 1 Then
          Exit Sub
       End If
    Else   ' incase of reversal
       transRefNo = txtTransRefNo
    End If
        
    If frmSadadPayment.tag = "R" Then
       formatSadadPaymentMsg transRefNo, "T"
    Else
       formatSadadPaymentMsg transRefNo, "F"
    End If
    
    If sendSadadPaymentMsg = 1 Then
       Exit Sub
    End If
    
    gDebitAccNo = txtDebitAccNo
    gPaymentAmt = txtPaymentAmt
    gSubscriptionNo = txtSubscriptionNo
    
    ' sometimes, when teller sends a SADAD transaction, & even if the transaction failed,
    ' the control is coming to success and making problem of printing receipt with some junk
    ' reference number ; to avoid this problem,  after the sucessfule validation transaction,
    ' check is made to ensure BP userid in login response message should be equal to first 3
    ' characters of reference number and response status should be success
    
'    If frmSadadPayment.tag <> "R" Then
'       If Mid$(recvLoginMsg.bpUserId, 1, 3) <> Mid$(recvBillPaymentMsg.transRefNo, 1, 3) And _
'          recvBillPaymentMsg.status <> "000" Then
'          Exit Sub
'       End If
'    End If

    If updateBranchPower(frmSadadPayment.tag) = 1 Then
       If frmSadadPayment.tag <> "R" Then
          billPaymentMsg.reversalFlag = "A"
          If sendSadadPaymentMsg = 1 Then
             Exit Sub
          End If
       End If
    Else
       If frmSadadPayment.tag <> "R" Then
          SendMsg = "000000" & "AV" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvLoginMsg.bpUserId & _
                    Format(recvBillPaymentMsg.transRefNo, "!@@@@@@@@@@") & "PmtTransf   " & Space(50)
          strmsglen = Format(Len(SendMsg), "000000")
          Mid$(SendMsg, 1, 6) = strmsglen
          DataReceivedFlag = False
          frmSadadPayment.MousePointer = vbHourglass
          
          If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
             LoadError = True
             frmSadadPayment.MousePointer = vbNormal
             Exit Sub
          End If
 
          frmSadadPayment.MousePointer = vbNormal
       End If
       recptPrinterDefaulted = False
       If Len(Trim(receiptPrinterName)) = 0 Or receiptPrinterName = "" Then
          receiptPrinterName = "SEDCO Forms Pro 45"
       End If
       If Printer.DeviceName <> receiptPrinterName Then
          tmpPrinter = Printer.DeviceName
          For Each PRNTR In Printers
              If PRNTR.DeviceName = receiptPrinterName Then
                 Set Printer = PRNTR
                 recptPrinterDefaulted = True
                 Exit For
              End If
          Next

          If recptPrinterDefaulted = False Then
             MsgBox errReceiptPrinterNotFound(UserLang)  '"Receipt printer not found.. please check "
             cmdPayBill.Enabled = True
             If frmSadadPayment.tag = "R" Then
                unloadSadadForms
             Else
                clearForms
             End If
             Exit Sub
          End If
       End If
          
       printReceipt
       response = MsgBox(errWannaPrintReceiptAgain(UserLang), vbYesNo)
       If response = vbYes Then
          printReceipt
       End If
       If recptPrinterDefaulted = True Then
          For Each PRNTR In Printers
              If PRNTR.DeviceName = tmpPrinter Then
                 Set Printer = PRNTR
                 Exit For
              End If
          Next
       End If
     End If
    
    cmdPayBill.Enabled = True
    If frmSadadPayment.tag = "R" Then
       unloadSadadForms
    Else
       cmdSigCap.Enabled = True
       clearForms
    End If
End Sub

Public Sub printReceipt()
  Dim fontSize As Integer
  
  Printer.FontName = "Courier New (Arabic)"
  Printer.fontSize = 8
  Printer.RightToLeft = False
  Printer.Print "     " & "«·»‰ﬂ «·⁄—»Ì «·Êÿ‰Ì"
  If frmSadadPayment.tag = "R" Then ' Reversal
     fontSize = Printer.fontSize
     Printer.fontSize = fontSize + 10
     Printer.Print Space(10) & "⁄ﬂ”"
     Printer.fontSize = fontSize
  End If

  Printer.Print "     " & Format(Val(gBranchCode), "000000000000")
  Printer.Print "     " & recvBillPaymentMsg.custName
  Printer.Print "     " & gDebitAccNo
  Printer.Print "     " & "-" & " " & gPaymentAmt
  Printer.Print "     " & Mid$(recvBillPaymentMsg.transDate, 1, 4) & "/" & _
                Mid$(recvBillPaymentMsg.transDate, 5, 2) & "/" & _
                Mid$(recvBillPaymentMsg.transDate, 7, 2)
  Printer.Print "     " & "BRFC" & Format(Mid$(recvBillPaymentMsg.transRefNo, 1, 3), "!@@@@") & _
                Mid$(recvBillPaymentMsg.transRefNo, 4, 7)
'  Printer.Print "     " & Mid$(recvBillPaymentMsg.valueDate, 1, 4) & "/" & _
'                Mid$(recvBillPaymentMsg.valueDate, 5, 2) & "/" & _
'                Mid$(recvBillPaymentMsg.valueDate, 7, 2)
'  Printer.Print "     " & "-" & " " & txtPaymentAmt
'  Printer.Print "     " & recvBillPaymentMsg.contraAccNo
'  Printer.Print "     " & recvBillPaymentMsg.contraCustName
  Printer.Print "     " & recvBillPaymentMsg.aNarrative1
  Printer.Print "     " & gSubscriptionNo
  Printer.Print "     " & recvBillPaymentMsg.narrative3
  
  Printer.EndDoc
  
End Sub

Private Sub cmdReject_Click()
    Dim transRefNo As String
    Dim strmsglen As String
    Dim currentPrinter As Printer, PRNTR As Printer
    Dim tmpPrinter As String
    Dim recptPrinterDefaulted As Boolean
    Dim response
    
    transRefNo = txtTransRefNo
    transRefNo = txtTransRefNo
    SendMsg = "000000" & "AW" & gBranchCode & Format(gUserId, "!@@@@@@@@@@") & recvLoginMsg.bpUserId & _
              Format(transRefNo, "!@@@@@@@@@@") & recvLoginMsg.bankingDate & "R" & _
              Space(50)
       
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSadadPayment.MousePointer = vbHourglass
  
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSadadPayment.MousePointer = vbNormal
       Exit Sub
    End If
   
    frmSadadPayment.MousePointer = vbNormal
       
    If recvCustomerMsg.status = "000" Then
       MsgBox errReversalRejected(UserLang)
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       Exit Sub
    End If
           
    unloadSadadForms
End Sub

Private Sub cmdSigCap_Click()
    Dim retStr As String
    If Len(Trim(txtDebitAccNo)) = 0 Then
       MsgBox errSpaceDrAccNo(UserLang) '"Debit account number cannot be space...please check..."
       Exit Sub
    End If
    On Error GoTo sigCapError
    lblSigCapStatus.LinkTopic = "SIGCAP|RETRIEVE"
    lblSigCapStatus.LinkItem = "String"
    lblSigCapStatus.LinkMode = 1
    lblSigCapStatus.Caption = Trim(txtDebitAccNo) & "~" & "0" & "~"
    'Text2.text = SigCap.Caption
    lblSigCapStatus.LinkPoke
    lblSigCapStatus.LinkExecute "Verify"
    lblSigCapStatus.LinkItem = "status"
    lblSigCapStatus.LinkMode = 1
'    If lblSigCapStatus.Caption <> 100 And lblSigCapStatus.Caption <> 150 And _
'       lblSigCapStatus.Caption <> 151 Then
    If lblSigCapStatus.Caption = 102 Then   ' if cancel the transaction
       cmdPayBill.Enabled = False
    Else
       cmdPayBill.Enabled = True
    End If
    
    ' Send the message to get the customer name
    
    retStr = doSearch1("00000", Mid$(txtDebitAccNo, 6, 7))
    CSD_mdiForm.staticStatus.Panels(3).text = "  "
    If retStr <> "-0001" Then
       If recvSearchMsg.noOfRecs = "00" Then
          MsgBox errInvalidCustNo(UserLang)
          cmdPayBill.Enabled = False
       Else
          txtCustName = recvSearchMsg.details(1).shortName
          cmdPayBill.Enabled = True
       End If
    Else
       cmdPayBill.Enabled = False
    End If
    
    On Error GoTo 0
    Exit Sub
sigCapError:
    If Err.Number = 282 Then
       MsgBox errSigcapRetrieveNotStarted(UserLang) '"SIGCAP application not started...please start the SIGCAP and try again to retrieve.."
    Else
       MsgBox "Error  " & Err.Number & "   " & Err.Description & "  occured while retrieving Signature  "
    End If
    Exit Sub
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    Dim mQry As String
    Dim i As Integer
            
    If UserLang = ARABIC Then
       ChangePositions frmSadadPayment, 11800
       frmSadadPayment.RightToLeft = True
       frameEnquiryDetails.RightToLeft = True
       framePaymentDetails.RightToLeft = True
       frameBillDetails.RightToLeft = True
    End If
    
    frmSadadPayment.Caption = frmSadadPaymentCaption(0, UserLang)
    lblUtilityBillPayment.Caption = frmSadadPaymentCaption(0, UserLang)
    frameEnquiryDetails.Caption = frmSadadPaymentCaption(2, UserLang)
    lblCompanyId.Caption = frmSadadPaymentCaption(3, UserLang)
    lblPreOrPostPayment.Caption = frmSadadPaymentCaption(4, UserLang)
    optPostPayment.Caption = frmSadadPaymentCaption(5, UserLang)
    optPrePayment.Caption = frmSadadPaymentCaption(6, UserLang)
    lblInstType.Caption = frmSadadPaymentCaption(7, UserLang)
    optSubsNo.Caption = frmSadadPaymentCaption(8, UserLang)
    optBillNo.Caption = frmSadadPaymentCaption(9, UserLang)
    lblSubscriptionNo.Caption = frmSadadPaymentCaption(10, UserLang)
    cmdBillDetails.Caption = frmSadadPaymentCaption(12, UserLang)
    cmdClear.Caption = frmSadadPaymentCaption(13, UserLang)
    frameBillDetails.Caption = frmSadadPaymentCaption(14, UserLang)
    
    displayBillEnquiryHeading
    

'    lblBillAmt.Caption = frmSadadPaymentCaption(14, UserLang)
'    lblDueDate.Caption = frmSadadPaymentCaption(15, UserLang)
'    lblExpiryDate.Caption = frmSadadPaymentCaption(16, UserLang)
'    lblExactPaymentOnly.Caption = frmSadadPaymentCaption(17, UserLang)
'    optExactPaymentYes.Caption = frmSadadPaymentCaption(18, UserLang)
'    optExactPaymentNo.Caption = frmSadadPaymentCaption(19, UserLang)
    framePaymentDetails.Caption = frmSadadPaymentCaption(20, UserLang)
    lblCashOrAcc.Caption = frmSadadPaymentCaption(21, UserLang)
    optAcc.Caption = frmSadadPaymentCaption(22, UserLang)
    optCash.Caption = frmSadadPaymentCaption(23, UserLang)
    lblPaymentType.Caption = frmSadadPaymentCaption(24, UserLang)
    lblDrAccNo.Caption = frmSadadPaymentCaption(25, UserLang)
    cmdSigCap.Caption = frmSadadPaymentCaption(26, UserLang)
    lblPaymentAmt.Caption = frmSadadPaymentCaption(27, UserLang)
    lblCustName.Caption = frmSadadPaymentCaption(28, UserLang)
    lblTransRefNo.Caption = frmSadadPaymentCaption(29, UserLang)
    cmdPayBill.Caption = frmSadadPaymentCaption(30, UserLang)
    cmdExit.Caption = frmSadadPaymentCaption(35, UserLang)
        
    'rs(0) = "" Or IsNull(rs(0)) = True
    'mQry = "select * from companyidinfo where disableBillerId <> '1' order by companyid"
    mQry = "select * from companyidinfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbCompanyId.Clear
       Do While Not rs.EOF
          On Error Resume Next
          If rs("disableBillerId") <> "1" Or rs("disableBillerId") = "" Or IsNull(rs("disableBillerId")) = True Then
             If UserLang = ENGLISH Then
                cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("englishname")
             Else
                cmbCompanyId.AddItem Format(rs("companyid"), "!@@@@") & "-" & rs("arabicname")
             End If
          End If
          rs.MoveNext
       Loop
       On Error GoTo 0
    End If
    
    mQry = "select * from sadadPaymentTypeInfo"
    Set rs = db.OpenRecordset(mQry)
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbPaymentType.Clear
       i = -1
       Do While Not rs.EOF
          If UserLang = ENGLISH Then
             cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("englishname")
          Else
             cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("arabicname")
          End If
          If rs("sadadPaymentType") = "POST" Then
             i = cmbPaymentType.ListIndex + 1
          End If
          rs.MoveNext
       Loop
       If i >= 0 Then
          cmbPaymentType.ListIndex = i
       End If
    End If
    framePaymentDetails.Enabled = False
    
    frmSadadPayment.Show
    
End Sub
Public Sub formatSadadPaymentMsg(transRefNo As String, reversalFlag As String)
    Dim tCode As String
    billPaymentMsg.msgLen = "000000"
    billPaymentMsg.service = "AT"
    billPaymentMsg.homeBranch = gBranchCode
    billPaymentMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    billPaymentMsg.tellerId = Format(recvLoginMsg.bpUserId, "!@@@")
    billPaymentMsg.custNo = Space(7)
    billPaymentMsg.idType = Space(1)
    billPaymentMsg.idNo = Space(15)
    tCode = Trim(Mid$(cmbCompanyId, 1, 4))
    'billEnquiryMsg.companyId = Format(Mid$(cmbCompanyId, 1, 2), "!@@@@")
    billPaymentMsg.companyId = Format(tCode, "!@@@@")
    If UserLang = ARABIC Then
       billPaymentMsg.langId = "ar-sa"
    Else
       billPaymentMsg.langId = "en-gb"
    End If
    If optBillNo = True Then
       billPaymentMsg.billNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
       billPaymentMsg.subscriptionNo = Space(19)
    Else
       billPaymentMsg.subscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
       billPaymentMsg.billNo = Space(19)
    End If
    tCode = Trim(Mid$(cmbPaymentType, 1, 4))
    billPaymentMsg.paymentType = Format(tCode, "!@@@@")
    billPaymentMsg.drAccNo = Format(Trim(txtDebitAccNo), "@@@@@@@@@@@@@@")
    ' RAJESH; Sign + needs to be changed depending on the exact payment flag
    billPaymentMsg.billAmt = Format(Val(txtPaymentAmt) * 100, "+000000000000000000")
    txtPaymentAmt = Format(Val(txtPaymentAmt), "##################0.00")
    
    billPaymentMsg.transRefNo = Format(transRefNo, "!@@@@@@@@@@")
    If optCash = True Then
       billPaymentMsg.cashOrAcc = "C"
    Else
       billPaymentMsg.cashOrAcc = "A"
    End If
    If optPrePayment.Value = True Then
       billPaymentMsg.preOrPostpaid = "1"
    Else
       billPaymentMsg.preOrPostpaid = "0"
    End If
    
    billPaymentMsg.reversalFlag = reversalFlag
    
End Sub
Public Sub formatSadadEnq()
    Dim tmpStr As String
    Dim tCode As String

    billEnquiryMsg.msgLen = "000000"
    billEnquiryMsg.service = "81"
    billEnquiryMsg.homeBranch = gBranchCode
    billEnquiryMsg.userId = Format(gUserId, "!@@@@@@@@@@")
    billEnquiryMsg.langInd = "B" ' to indicate that we should use the branch(BP) layout
    
    billEnquiryMsg.custNo = Space(7)
    billEnquiryMsg.idType = Space(1)
    billEnquiryMsg.idNo = Space(15)
    tCode = Trim(Mid$(cmbCompanyId, 1, 4))
    'billEnquiryMsg.companyId = Format(Mid$(cmbCompanyId, 1, 2), "!@@@@")
    billEnquiryMsg.companyId = Format(tCode, "!@@@@")
    If UserLang = ARABIC Then
       billEnquiryMsg.newLangId = "ar-sa"
    Else
       billEnquiryMsg.newLangId = "en-gb"
    End If
    If optBillNo = True Then
       billEnquiryMsg.billNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
       billEnquiryMsg.subscriptionNo = Space(19)
    Else
       billEnquiryMsg.subscriptionNo = Format(txtSubscriptionNo, "!@@@@@@@@@@@@@@@@@@@")
       billEnquiryMsg.billNo = Space(19)
    End If
    billEnquiryMsg.startDate = Space(8)
    billEnquiryMsg.endDate = Space(8)
    billEnquiryMsg.inclPayments = Space(1)
    billEnquiryMsg.inclPaidBills = Space(1)
                               
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

Private Sub optAcc_Click()
    If frmSadadPayment.tag <> "R" Then
       cmdSigCap.Enabled = True
       txtDebitAccNo.Enabled = True
       txtDebitAccNo.text = ""
    End If
End Sub

Private Sub optBill1_Click()
    Dim billAmt As String
    
    billDetailsGrid.Row = 1
    billDetailsGrid.Col = 0
   
    billAmt = Format(billDetailsGrid.text, "!@@@@@@@@@@@@@@@@@@")
    
    If Len(RTrim(billAmt)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       Exit Sub
    End If
    
    txtPaymentAmt = Format(Val(recvBillEnqMsg.billInfo(1).amountDue), "#" & _
                                          "#################0.00")
    
    billDetailsGrid.Col = 4
    If Trim(UCase(recvBillEnqMsg.billInfo(1).exactPaymentReqd)) = "FALSE" Then
       txtPaymentAmt.Enabled = True
    Else
       txtPaymentAmt.Enabled = False
    End If
End Sub

Private Sub optBill2_Click()
    Dim billAmt As String
    
    billDetailsGrid.Row = 2
    billDetailsGrid.Col = 0
   
    billAmt = Format(billDetailsGrid.text, "!@@@@@@@@@@@@@@@@@@")
    
    If Len(RTrim(billAmt)) = 0 Then
       MsgBox errEmptyRowSelected(UserLang) '"Empty Row has been selected.. Please select a row which has a value"
       optBill1.Value = True
       Exit Sub
    End If
    
    txtPaymentAmt = Format(Val(recvBillEnqMsg.billInfo(2).amountDue), "#" & _
                                          "#################0.00")
    'txtPaymentAmt = Format(Val(billDetailsGrid.text), "#" & _
                                          "#################0.00")
    
    billDetailsGrid.Col = 4
    If Trim(UCase(recvBillEnqMsg.billInfo(2).exactPaymentReqd)) = "FALSE" Then
       txtPaymentAmt.Enabled = True
    Else
       txtPaymentAmt.Enabled = False
    End If
    
End Sub

Private Sub optBillNo_Click()
    lblSubscriptionNo.Caption = frmSadadPaymentCaption(11, UserLang) '"Bill Number"
End Sub

Private Sub optCash_Click()
    Dim tmpStr As String
    Dim tCode As String
    Dim mQry As String
    If frmSadadPayment.tag <> "R" Then
       cmdSigCap.Enabled = False
       cmdPayBill.Enabled = True
       tCode = Mid$(cmbCompanyId, 1, 4)
       mQry = "select * from companyIdInfo where  companyId = '" & tCode & "'"
       Set billerIdRs = db.OpenRecordset(mQry)
       If optPrePayment = True Then
          If billerIdRs.recordCount <= 0 Then
             MsgBox errBillerIdNotDefined(UserLang)  '"Biller Id not defined in local DB.. Please check.."
             Exit Sub
          End If
       End If
       tmpStr = billerIdRs("cashAccNo")
       If Len(Trim(tmpStr)) = 0 Then
          MsgBox errCashAccNotDefined(UserLang)  '"Cash account number is not configured for this biller id ..Please check.."
          Exit Sub
        End If
        txtDebitAccNo = Mid$(tmpStr, 1, 9) & Mid$(gBranchCode, 2, 3) & Mid$(tmpStr, 13, 2)
        txtDebitAccNo.Enabled = False
    End If
End Sub

Private Sub optPostPayment_Click()
    Dim tCode As String
    Dim mQry As String
    Dim i As Integer
    
    If frmSadadPayment.tag = "N" Then
        cmdBillDetails.Enabled = True
        framePaymentDetails.Enabled = False
        txtDebitAccNo.text = ""
        txtPaymentAmt.text = ""
        txtPaymentAmt.Enabled = False
        mQry = "select * from sadadPaymentTypeInfo where preOrPostpaid <> '1'"
        Set rs = db.OpenRecordset(mQry)
        i = -1
        If rs.recordCount > 0 Then
           rs.MoveFirst
           cmbPaymentType.Clear
           Do While Not rs.EOF
              If UserLang = ENGLISH Then
                 cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("englishname")
              Else
                 cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("arabicname")
              End If
              If rs("sadadPaymentType") = "POST" Then
                 i = cmbPaymentType.ListIndex + 1
              End If
              rs.MoveNext
           Loop
           If i >= 0 Then
              cmbPaymentType.ListIndex = i
           End If
        End If
        cmbPaymentType.Enabled = False
    End If
        
End Sub

Private Sub optPrePayment_Click()
   Dim tCode As String
   Dim tmpStr As String
   Dim mQry As String
   Dim i As Integer
   Dim j As Integer
   
   If frmSadadPayment.tag = "N" Then
        tCode = Mid$(cmbCompanyId, 1, 4)
        mQry = "select * from companyIdInfo where  companyId = '" & tCode & "'"
        Set billerIdRs = db.OpenRecordset(mQry)
        If billerIdRs.recordCount <= 0 Then
           MsgBox errBillerIdNotDefined(UserLang) '"Biller Id not defined in local DB.. Please check.."
           cmbCompanyId.ListIndex = -1
           optPostPayment.Value = True
           Exit Sub
        End If
        tCode = IIf(billerIdRs("prepaymentallowed") = "" Or IsNull(billerIdRs("prepaymentallowed")) = True, " ", billerIdRs("prepaymentallowed"))
        If tCode <> "1" Then
           MsgBox errPrepaymentNotAllowed(UserLang)  '"Prepayment is not allowed for this biller id .. please check.."
           cmbCompanyId.ListIndex = -1
           optPostPayment.Value = True
           Exit Sub
        End If
        
        tmpStr = IIf(billerIdRs("prePaymentTypesAllowed") = "" Or IsNull(billerIdRs("prePaymentTypesAllowed")) = True, "             ", billerIdRs("prePaymentTypesAllowed"))
        j = -1
        cmbPaymentType.Clear
        For i = 1 To Len(tmpStr) Step 4
            tCode = Mid$(tmpStr, i, 4)
            mQry = "select * from sadadPaymentTypeInfo where preOrPostPaid = '1' and sadadPaymenttype='" & tCode & "'"
            Set rs = db.OpenRecordset(mQry)
            If rs.recordCount > 0 Then
               If UserLang = ENGLISH Then
                  cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("englishname")
               Else
                  cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("arabicname")
               End If
               If rs("sadadPaymentType") = "RCHG" Then
                  j = cmbPaymentType.ListIndex
               End If
            End If
        Next
        cmbPaymentType.ListIndex = j
        
        tCode = "RCHG"
        If tCode <> "" Then
           For i = 0 To cmbPaymentType.ListCount
               If Mid(cmbPaymentType.List(i), 1, 4) = tCode Then
                  cmbPaymentType.ListIndex = i
                  Exit For
               End If
           Next i
        Else
           cmbPaymentType.ListIndex = -1
        End If
        If i > cmbPaymentType.ListCount Then
           cmbPaymentType.ListIndex = -1
        End If

        
'        mQry = "select * from sadadPaymentTypeInfo where preOrPostPaid = '1'"
'        Set rs = db.OpenRecordset(mQry)
'        If rs.recordCount > 0 Then
'           rs.MoveFirst
'           i = -1
'           cmbPaymentType.Clear
'           Do While Not rs.EOF
'              If UserLang = ENGLISH Then
'                 cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("englishname")
'              Else
'                 cmbPaymentType.AddItem Format(rs("sadadpaymenttype"), "!@@@@") & "-" & rs("arabicname")
'              End If
'              If rs("sadadPaymentType") = "RCHG" Then
'                 i = cmbPaymentType.ListIndex + 1
'              End If
'              rs.MoveNext
'           Loop
'           If i >= 0 Then
'              cmbPaymentType.ListIndex = i
'           End If
'        End If
        cmdBillDetails.Enabled = False
        framePaymentDetails.Enabled = True
        cmbPaymentType.Enabled = True
        txtPaymentAmt.Enabled = True
   End If
End Sub

Private Sub optSubsNo_Click()
    lblSubscriptionNo.Caption = frmSadadPaymentCaption(10, UserLang)  '"Subscription Number"
End Sub
Public Function sendSadadPaymentMsg() As Integer
    Dim strmsglen As String
    Dim tCode As String, tCode1 As String
    Dim mQry As String
    Dim tmpStr As String, tmpStr1 As String
    
    SendMsg = billPaymentMsg.msgLen & billPaymentMsg.service & billPaymentMsg.homeBranch & _
              billPaymentMsg.userId & billPaymentMsg.tellerId & billPaymentMsg.custNo & _
              billPaymentMsg.idType & billPaymentMsg.idNo & billPaymentMsg.companyId & _
              billPaymentMsg.subscriptionNo & billPaymentMsg.billNo & billPaymentMsg.langId & _
              billPaymentMsg.paymentType & billPaymentMsg.drAccNo & billPaymentMsg.billAmt & _
              billPaymentMsg.transRefNo & billPaymentMsg.cashOrAcc & billPaymentMsg.preOrPostpaid & _
              billPaymentMsg.reversalFlag & Space(50)
            
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    
    sendSadadPaymentMsg = 1
    
    frmSadadPayment.MousePointer = vbHourglass
    cmdPayBill.Enabled = False
    cmdExit.Enabled = False
    cmdClear.Enabled = False
    cmdSigCap.Enabled = False
    If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
       LoadError = True
       frmSadadPayment.MousePointer = vbDefault
       cmdPayBill.Enabled = True
       cmdExit.Enabled = True
       cmdClear.Enabled = True
       If frmSadadPayment.tag <> "R" Then
          cmdSigCap.Enabled = True
       End If
       sendSadadPaymentMsg = 1
       Exit Function
    End If
    frmSadadPayment.MousePointer = vbDefault
    cmdExit.Enabled = True
    'cmdPayBill.Enabled = True
    cmdClear.Enabled = True
'    If frmSadadPayment.tag <> "R" Then
'       cmdSigCap.Enabled = True
'    End If
    parseBillPaymentMsg
    
    If recvBillPaymentMsg.status <> "000" Then
       If recvBillPaymentMsg.status = "126" Then
          MsgBox errReversalFailedBillNotPaid(UserLang) '"Bill could not be paid in SADAD; money is debited from the account; reversal failed "
       ElseIf recvBillPaymentMsg.status = "129" Then ' SADAD error ; get the description from LOCAL DB
          tCode = recvBillPaymentMsg.msgStatusCode
          If Trim(tCode) <> "0" And Len(Trim(tCode)) > 0 Then
             mQry = "select * from sadaderrorinfo where errorcode = '" & tCode & "'"
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
             tCode1 = recvBillPaymentMsg.paymentStatusCode
             If Len(Trim(tCode1)) > 0 Then
                mQry = "select * from sadaderrorinfo where errorcode = '" & tCode1 & "'"
                Set rs = db.OpenRecordset(mQry)
                If rs.recordCount > 0 Then
                   If UserLang = ARABIC Then
                      tmpStr1 = tCode1 & "-" & rs("arabicdescription")
                   Else
                      tmpStr1 = tCode1 & "-" & rs("englishdescription")
                   End If
                Else
                   tmpStr1 = tCode1 & "-" & "Not defined in local DB"
                End If
             End If
             If tCode <> "000062" And tCode <> "000061" Then
                MsgBox errError(UserLang) & "[" & tmpStr & "] " & Chr(13) & tmpStr1 & Chr(13) & errRecdFromSADAD(UserLang)
             Else
                MsgBox tmpStr & Chr(13) & tmpStr1
             End If
             cmdPayBill.Enabled = True
             If frmSadadPayment.tag <> "R" Then
                cmdSigCap.Enabled = True
             End If
             sendSadadPaymentMsg = 1
             Exit Function
          Else
             If UserLang = ARABIC Then
                MsgBox recvBillPaymentMsg.aRemarks
             Else
                MsgBox recvBillPaymentMsg.eRemarks
             End If
             cmdPayBill.Enabled = True
             If frmSadadPayment.tag <> "R" Then
                cmdSigCap.Enabled = True
             End If
             sendSadadPaymentMsg = 1
             Exit Function
          End If
      Else
         If UserLang = ARABIC Then
            MsgBox recvBillPaymentMsg.aRemarks
         Else
            MsgBox recvBillPaymentMsg.eRemarks
         End If
       End If
       cmdPayBill.Enabled = True
       If frmSadadPayment.tag <> "R" Then
          cmdSigCap.Enabled = True
       End If
       sendSadadPaymentMsg = 1
       Exit Function
    Else
       txtCustName = recvBillPaymentMsg.custName
       txtTransRefNo = recvBillPaymentMsg.transRefNo
       If billPaymentMsg.reversalFlag <> "A" Then
          MsgBox errSuccessful(UserLang)
       End If
    End If
    
    sendSadadPaymentMsg = 0

End Function


Public Function getTransRefNo(tellerId As String, transRefNo As String) As Integer
   Dim lastRefNo As Long
   Dim tmpStr As String
   Dim tmpAmt As String

   If openBuserFile = 1 Then
      getTransRefNo = 1
      Exit Function
   End If
   
   If readUserRec(tellerId) = 1 Then
      closeUserFile
      getTransRefNo = 1
      Exit Function
   End If
   
   lastRefNo = Val(userBuf.serlNo)
      
   'transRefNo = "BRFC" & Format(tellerId, "!@@@ ") & Format(lastRefNo, "00000") & "01"
   transRefNo = Format(tellerId, "!@@@") & Format(lastRefNo, "00000") & "01"
   
   lastRefNo = lastRefNo + 1
   userBuf.serlNo = Format(lastRefNo, "00000")
   
   If updateUser = 1 Then
      closeUserFile
      getTransRefNo = 1
      Exit Function
   End If
   closeUserFile
   getTransRefNo = 0
End Function

Public Function updateBranchPower(normalOrReversal) As Integer
   Dim transRefNo As String
   Dim tmpStr As String
   Dim tmpAmt As String
   Dim valueDate As String
   Dim postDate As String, blank As String
   Dim tmpDbl As Double
   Dim status As Integer
   
   If openBpFiles = 1 Then
      updateBranchPower = 1
      Exit Function
   End If
    
     
   transRefNo = "BRFC" & Format(recvLoginMsg.bpUserId, "!@@@@") & Mid$(recvBillPaymentMsg.transRefNo, 4, 7)
   
   tlrJnlBuf.tellerId = Format(recvLoginMsg.bpUserId, "!@@@@")
   tlrJnlBuf.jnlDate = Mid$(recvLoginMsg.bankingDate, 3, 6)
   tlrJnlBuf.jnlTime = Format(Hour(Time), "00") & Format(Minute(Time), "00") & Format(Second(Time), "00")
   If optCash Then
      tlrJnlBuf.accountNo = Format(recvBillPaymentMsg.contraAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      tmpStr = Format(Val(gPaymentAmt) * 100, String(18, "0"))
      tmpAmt = dblToBmAmt(tmpStr)
      tlrJnlBuf.cashAmt = Mid$(tmpAmt, 1, 18)
   Else
      tlrJnlBuf.accountNo = Format(gDebitAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      tmpStr = Format(Val(gPaymentAmt) * 100 * -1, String(18, "0"))
      tmpAmt = dblToBmAmt(tmpStr)
      tlrJnlBuf.cashAmt = Mid$(tmpAmt, 2, 18)
   End If
   
   tlrJnlBuf.chequeAmt = String(18, "0")
   tlrJnlBuf.entryRef = transRefNo
   tlrJnlBuf.supervisorId = Space(4)
   tlrJnlBuf.fromToTeller = Space(4)
   tlrJnlBuf.lm1Denom = String(18, "0")
   tlrJnlBuf.lm2Denom = String(18, "0")
   tlrJnlBuf.lm3Denom = String(18, "0")
   tlrJnlBuf.lm4Denom = String(18, "0")
   tlrJnlBuf.lm5Denom = String(18, "0")
   tlrJnlBuf.lm6Denom = String(18, "0")
   tlrJnlBuf.lm7Denom = String(18, "0")
   tlrJnlBuf.lm8Denom = String(18, "0")
   tlrJnlBuf.lm9Denom = String(18, "0")
   tlrJnlBuf.lmCoinDenom = String(18, "0")
   tlrJnlBuf.other = String(18, "0")
   tlrJnlBuf.tfFlag = " "
   tlrJnlBuf.currType = "SAR"
   tlrJnlBuf.chainFlag = "N"
   tlrJnlBuf.chequeAmt = String(18, "0")
   tlrJnlBuf.cashEquiv = String(18, "0")
   tlrJnlBuf.chequeEquiv = String(18, "0")
   tlrJnlBuf.excRate = String(14, "0")
   tlrJnlBuf.bopCode = String(18, "0")
   If normalOrReversal <> "R" Then
      tlrJnlBuf.transCode = "0001"
      tlrJnlBuf.reversalFlag = "0"
      tlrJnlBuf.transClass = String(2, "0")
   Else
      tlrJnlBuf.transCode = "0014"
      tlrJnlBuf.reversalFlag = "1"
      tlrJnlBuf.transClass = "02"
   End If
   tlrJnlBuf.currCodeEq = Space(3)
   tlrJnlBuf.denomEq1 = String(18, "0")
   tlrJnlBuf.denomEq2 = String(18, "0")
   tlrJnlBuf.denomEq3 = String(18, "0")
   tlrJnlBuf.denomEq4 = String(18, "0")
   tlrJnlBuf.denomEq5 = String(18, "0")
   tlrJnlBuf.denomEq6 = String(18, "0")
   tlrJnlBuf.denomEq7 = String(18, "0")
   tlrJnlBuf.denomEq8 = String(18, "0")
   tlrJnlBuf.denomEq9 = String(18, "0")
   tlrJnlBuf.coinsDenomEq = String(18, "0")
   tlrJnlBuf.inclFlag = "N"
   tlrJnlBuf.totsUpdate = "N"
   tlrJnlBuf.clrUpd = "0"
   tlrJnlBuf.accUpdFlag = "0"
   tlrJnlBuf.totsSign = "+"  'To be checked
   tlrJnlBuf.modified = " "
   tlrJnlBuf.draftReferance = Mid$(transRefNo, 5, 11)
   tlrJnlBuf.eftCode = String(3, "0")

   BufLen = Len(tlrJnlBuf)
   KeyBuffer$ = Space$(KEY_BUF_LEN)
   keybuflen = KEY_BUF_LEN

    ' start the transaction for btlrjnl file
   status = BTRCALL(19, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

   If insertTlrJnl = 1 Then
      ' Abor the transaction
      status = BTRCALL(21, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
      closeBpFiles
      updateBranchPower = 1
      Exit Function
   End If
   
   If optCash = True Then
      If readTellerTotFile(recvLoginMsg.bpUserId, "SAR") = 1 Then
         ' Abort the transaction
         status = BTRCALL(21, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
         closeBpFiles
         updateBranchPower = 1
         Exit Function
      End If
      tmpStr = bmAmtToDbl(totCrBuf.cashIn)
      If normalOrReversal = "R" Then
         tmpDbl = Val(tmpStr) - (Val(gPaymentAmt) * 100)
      Else
         tmpDbl = Val(tmpStr) + (Val(gPaymentAmt) * 100)
      End If
      tmpStr = Format(tmpDbl, String(18, "0"))
      tmpAmt = dblToBmAmt(tmpStr)
      totCrBuf.cashIn = tmpAmt

      If updateTotCr = 1 Then
         ' Abort the transaction
         status = BTRCALL(21, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
         closeBpFiles
         updateBranchPower = 1
         Exit Function
      End If
   End If

   blank = Space(75)
   'trnDtlBuf = String(Len(trnDtlBuf), "0")
   'On Error GoTo err_handler
   
   trnDtlBuf.tdl_rec_type = "TRN"
   
   If optCash Then
      trnDtlBuf.tdl_accNo = Format(recvBillPaymentMsg.contraAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      trnDtlBuf.tdl_tgt_sort_code = String(9, "0")
      Mid$(trnDtlBuf.tdl_tgt_sort_code, 10, 3) = Mid$(gBranchCode, 2, 3)
      trnDtlBuf.tdl_contra_accno = Format(gDebitAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      trnDtlBuf.tdl_contra_sort_code = trnDtlBuf.tdl_tgt_sort_code
   Else
      trnDtlBuf.tdl_accNo = Format(txtDebitAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      trnDtlBuf.tdl_tgt_sort_code = String(9, "0")
      Mid$(trnDtlBuf.tdl_tgt_sort_code, 10, 3) = Mid$(recvBillPaymentMsg.customerBranch, 2, 3)
      trnDtlBuf.tdl_contra_accno = Format(recvBillPaymentMsg.contraAccNo, "!@@@@@@@@@@@@@@@@@@@@")
      trnDtlBuf.tdl_contra_sort_code = String(9, "0")
      Mid$(trnDtlBuf.tdl_contra_sort_code, 10, 3) = Mid$(gBranchCode, 2, 3)
   End If
   trnDtlBuf.tdl_2nd_tx_accno = Space(20)
   trnDtlBuf.tdl_2nd_tx_sort_code = String(9, "0")
   Mid$(trnDtlBuf.tdl_2nd_tx_sort_code, 10, 3) = Mid$(gBranchCode, 2, 3)
   trnDtlBuf.tdl_0_bnk_ac_no = Space(20)
   trnDtlBuf.tdl_other_sort_code = String(12, "0")
      
   trnDtlBuf.tdl_trans_code = "0487  "  'check ; hard coding
   trnDtlBuf.tdl_entry_ref = transRefNo
   trnDtlBuf.tdl_user_code = Format(recvLoginMsg.bpUserId, "!@@@@")
   trnDtlBuf.tdl_date_stamp = recvLoginMsg.bankingDate
   trnDtlBuf.tdl_time_stamp = Format(Hour(Time), "00") & Format(Minute(Time), "00") & _
                          Format(Second(Time), "00")
   If normalOrReversal <> "R" Then
      trnDtlBuf.tdl_tx_class = "00" ' check
      trnDtlBuf.tdl_reversal_type = "0"
   Else
      trnDtlBuf.tdl_tx_class = "02"
      trnDtlBuf.tdl_reversal_type = "1"
   End If
   trnDtlBuf.tdl_short_desc = "PSB"  ' check
   trnDtlBuf.tdl_2nd_tx_host_code = Space(6)
   trnDtlBuf.tdl_2nd_tx_sign = Space(1)
   trnDtlBuf.tdl_sce_sort_code = String(9, "0")
   Mid$(trnDtlBuf.tdl_sce_sort_code, 10, 3) = Mid$(gBranchCode, 2, 3)
   trnDtlBuf.tdl_ccb_sort_code = String(12, "0")
      
   trnDtlBuf.tdl_book_date = recvLoginMsg.bankingDate    ' check
   trnDtlBuf.tdl_clearing_date = String(8, "0") ' check
   trnDtlBuf.tdl_clear_days = String(4, "0")
   trnDtlBuf.tdl_ex_clearing_days = String(4, "0")
   trnDtlBuf.tdl_cheque_no = String(12, "0")
   
   trnDtlBuf.tdl_org_reference = Space(10)
   trnDtlBuf.tdl_curr_code = "SAR"
'   tmpStr = Mid$(inBuf, 20, 14)
'
'   If Asc(Mid$(tmpStr, 14, 1)) >= Asc("P") And Asc(Mid$(tmpStr, 14, 1)) < Asc("Z") Then
'      Mid$(tmpStr, 14, 1) = Chr$(Asc(Mid$(tmpStr, 14, 1)) - Asc("A") + Asc("a"))
'   End If
   
   trnDtlBuf.tdl_gross_amount = tlrJnlBuf.cashAmt
   trnDtlBuf.tdl_cash_amt = tlrJnlBuf.cashAmt
   trnDtlBuf.tdl_cheque_amt = String(18, "0")
   
   trnDtlBuf.tdl_curr_equiv = "SAR"
   trnDtlBuf.tdl_cash_equiv = tlrJnlBuf.cashAmt
   trnDtlBuf.tdl_cheque_equiv = String(18, "0")
   
   trnDtlBuf.tdl_base_curr = Space(3)
   'trnDtlBuf.tdl_base_equiv_amt = tlrJnlBuf.cashAmt
   trnDtlBuf.tdl_base_equiv_amt = String(18, "0")
   
   trnDtlBuf.tdl_tranx_exch_rate = String(14, "0")
   'trnDtlBuf.tdl_tranx_mult_div = "0"
   trnDtlBuf.tdl_tranx_mult_div = " "
   trnDtlBuf.tdl_tot_comm_chg = String(18, "0")
   trnDtlBuf.tdl_comm_code_1 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_1 = String(18, "0")
   trnDtlBuf.tdl_comm_code2 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_2 = String(18, "0")
   trnDtlBuf.tdl_comm_code3 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_3 = String(18, "0")
   trnDtlBuf.tdl_comm_code4 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_4 = String(18, "0")
   trnDtlBuf.tdl_comm_code5 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_5 = String(18, "0")
   trnDtlBuf.tdl_comm_code6 = String(2, "0")
   trnDtlBuf.tdl_comm_charges_6 = String(18, "0")
   
   trnDtlBuf.tdl_narr1 = Format(recvBillPaymentMsg.aNarrative1, "!" & String(30, "@")) & _
                         Format(recvBillPaymentMsg.eNarrative1, "!" & String(30, "@"))
   trnDtlBuf.tdl_narr2 = Format(txtSubscriptionNo, "!" & String(60, "@"))
   trnDtlBuf.tdl_narr3 = Format(recvBillPaymentMsg.narrative3, "!" & String(60, "@"))
   
   trnDtlBuf.tdl_settle_inst_1 = Space(35)
   trnDtlBuf.tdl_settle_inst_2 = Space(35)
   trnDtlBuf.tdl_settle_inst_3 = Space(35)
   trnDtlBuf.tdl_drawer = Space(15)
   trnDtlBuf.tdl_stat_symbols = Space(12)
   trnDtlBuf.tdl_reason_code = Space(4)
   trnDtlBuf.tdl_branch_code = gBranchCode ' check
   trnDtlBuf.tdl_no_cheques = String(4, "0")
   trnDtlBuf.tdl_no_t_cheques = String(4, "0")
   trnDtlBuf.tdl_no_cheques_eq = String(4, "0")
   trnDtlBuf.tdl_no_t_chqs_eq = String(4, "0")
   trnDtlBuf.tdl_maturity_date = String(8, "0")
   trnDtlBuf.tdl_interest_rate = String(9, "0")
   trnDtlBuf.tdl_coup_disc_rate = String(9, "0")
   trnDtlBuf.tdl_draw_issue_date = String(8, "0")
   trnDtlBuf.tdl_nominal_amnt = String(18, "0")
   trnDtlBuf.tdl_broker_no = String(6, "0")
   trnDtlBuf.tdl_lim_exc_status = String(2, "0")
   trnDtlBuf.tdl_lim_exc_edamt = String(16, "0")
      
   trnDtlBuf.tdl_delete_ind = "0"
   trnDtlBuf.tdl_update_ind = "N"
   trnDtlBuf.tdl_passbk = Space(1)
   trnDtlBuf.tdl_eod_ind = Space(1)
   trnDtlBuf.tdl_prim_ex_rate_1 = Space(14)
   trnDtlBuf.tdl_prim_mult_div_1 = Space(1)
   trnDtlBuf.tdl_eq_ex_rate_2 = Space(14)
   trnDtlBuf.tdl_eq_ex_multi_div_2 = Space(1)
   trnDtlBuf.tdl_org_draft_ref = Space(18)
   trnDtlBuf.tdl_verif_modif_flag = Space(1)
   trnDtlBuf.tdl_verif_tx_flag = Space(1)
   trnDtlBuf.tdl_verif_chain_flag = Space(1)
   trnDtlBuf.tdl_verifier_id = Space(4)
   trnDtlBuf.tdl_trans_number = tlrJnlBuf.transCode
   trnDtlBuf.tdl_self_balance = Space(1)
   trnDtlBuf.tdl_receipt_layout = Space(3)
   trnDtlBuf.tdl_receipt_reqd = Space(1)
   trnDtlBuf.tdl_applicant_name = Space(30)
   trnDtlBuf.tdl_eft_code = Space(3)
   trnDtlBuf.tdl_lang_code = Space(1)
   trnDtlBuf.tdl_drawee_sort_code = Space(12)
   trnDtlBuf.tdl_transfer_draft = Space(1)
   trnDtlBuf.tdl_narr_code = Space(4)
   trnDtlBuf.tdl_posting_queue = Space(1)
   trnDtlBuf.tdl_customer_name = recvBillPaymentMsg.custName
   trnDtlBuf.tdl_int_at_maturity = Space(18)
   trnDtlBuf.tdl_new_acc_number = Space(20)
   trnDtlBuf.tdl_available_balance = Space(18)
   trnDtlBuf.tdl_final_amount = Space(18)
   trnDtlBuf.tdl_nett_interest_amt = Space(18)
   trnDtlBuf.tdl_payee_name = Space(30)
   trnDtlBuf.tdl_contra_chq_no = Space(12)
   trnDtlBuf.tdl_contra_org_ref = Space(10)
   trnDtlBuf.tdl_credit_card_no = Space(16)
   trnDtlBuf.tdl_batch_ind = Space(1)
   trnDtlBuf.tdl_batch_ref = Space(7)
   
   trnDtlBuf.tdl_verify_status = "0"
   trnDtlBuf.tdl_curpos_subref = Space(2)
   trnDtlBuf.tdl_add_cur_code = Space(3)
   trnDtlBuf.tdl_add_curr_amount = Space(18)
   
   If insertTrnDtl = 1 Then
      ' Abort the transaction
      status = BTRCALL(21, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
      closeBpFiles
      updateBranchPower = 1
      Exit Function
   End If
   
   ' End the transaction
   status = BTRCALL(20, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
   closeBpFiles
   updateBranchPower = 0
      
'   sysMontBuf.userCode = Format(recvLoginMsg.bpUserId, "!@@@@")
'   sysMontBuf.dateStamp = recvLoginMsg.bankingDate
'   sysMontBuf.timeStamp = Format(Hour(Time), "00") & Format(Minute(Time), "00") & _
'                          Format(Second(Time), "00")
'   sysMontBuf.entryRef = transRefNo
'   sysMontBuf.hostCode = "FN0487  " ' check
'   sysMontBuf.priOrOff = "P"
'   sysMontBuf.messageType = "5"
'   If normalOrReversal <> "R" Then
'      sysMontBuf.postFlag = "0"
'   Else
'      sysMontBuf.postFlag = "2"
'   End If
'   sysMontBuf.sentFlag = "N"
'   sysMontBuf.ackNo = "Y"
'   sysMontBuf.resend = Space(1)
'   sysMontBuf.nor = Space(3)
'   sysMontBuf.inputTime = Space(6)
'   sysMontBuf.sfSendTime = Space(6)
'   sysMontBuf.tpsRespTime = Space(6)
'   sysMontBuf.compTime = Space(6)
'   sysMontBuf.roundTrip = Space(3)
'
'   If insertSysMont = 1 Then
'      ' Abort the transaction
'      status = BTRCALL(21, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
'      updateBranchPower = 1
'      Exit Function
'   End If
   
   
'   If openAcctFile = 1 Then
'      updateBranchPower = 0  ' ignore the failure during update of baccrec
'      Exit Function
'   End If
'
'   If readAccount(txtDebitAccNo) = 1 Then
'      'ignore the failure during update of baccrec
'   Else
'      tmpStr = bmAmtToDbl(AccBuf.clearedBal)
'      tmpDbl = Val(tmpStr) - (Val(txtPaymentAmt) * 100)
'      tmpStr = Format(tmpDbl, String(18, "0"))
'      tmpAmt = dblToBmAmt(tmpStr)
'      AccBuf.clearedBal = tmpAmt
'
'      tmpStr = bmAmtToDbl(AccBuf.bookBal)
'      tmpDbl = Val(tmpStr) - (Val(txtPaymentAmt) * 100)
'      tmpStr = Format(tmpDbl, String(18, "0"))
'      tmpAmt = dblToBmAmt(tmpStr)
'      AccBuf.bookBal = tmpAmt
'
'      If updateAccount = 1 Then
'         'ignore the failure during update of baccrec
'      End If
'   End If
'
'   If readAccount(recvBillPaymentMsg.contraAccNo) = 1 Then
'      closeAcct
'      updateBranchPower = 0  ' ignore the failure during update of baccrec
'      Exit Function
'   End If
'
'   tmpStr = bmAmtToDbl(AccBuf.clearedBal)
'   tmpDbl = Val(tmpStr) + (Val(txtPaymentAmt) * 100)
'   tmpStr = Format(tmpDbl, String(18, "0"))
'   tmpAmt = dblToBmAmt(tmpStr)
'   AccBuf.clearedBal = tmpAmt
'
'   tmpStr = bmAmtToDbl(AccBuf.bookBal)
'   tmpDbl = Val(tmpStr) + (Val(txtPaymentAmt) * 100)
'   tmpStr = Format(tmpDbl, String(18, "0"))
'   tmpAmt = dblToBmAmt(tmpStr)
'   AccBuf.bookBal = tmpAmt
'
'   If updateAccount = 1 Then
'      'ignore the failure during update of baccrec
'   End If
'
'   closeAcct
'   updateBranchPower = 0

End Function

Public Function checkTellerCashPosition(tellerId As String, currCode As String) As Integer
   
   If openTotCrFile = 1 Then
      checkTellerCashPosition = 1
      Exit Function
   End If
   
   If readTellerTotFile(tellerId, currCode) = 1 Then
      MsgBox errTellerCashPositionNotOpen(UserLang) '"Teller  " & recvLoginMsg.bpUserId & "'s SAR cash position is not open ; please open cash position and try again...."
      closeTotCrFile
      checkTellerCashPosition = 1
      Exit Function
   End If

   If totCrBuf.currPos <> "O" Then
      MsgBox errTellerCashPositionNotOpen(UserLang) '"Teller  " & recvLoginMsg.bpUserId & "'s SAR cash position is not open ; please open cash position and try again...."
      closeTotCrFile
      checkTellerCashPosition = 1
      Exit Function
   End If
   closeTotCrFile
   checkTellerCashPosition = 0
End Function

Public Function openBpFiles() As Integer

    If openTlrJnlFile = 1 Then
       openBpFiles = 1
       Exit Function
    End If
    
    If optCash = True Then
       If openTotCrFile = 1 Then
          openBpFiles = 1
          Exit Function
       End If
    End If
    
    If openTrnDtlFile = 1 Then
       openBpFiles = 1
       Exit Function
    End If
    
'    If openSysMontFile = 1 Then
'       openBpFiles = 1
'       Exit Function
'    End If
    
    openBpFiles = 0

End Function
Public Sub closeBpFiles()
   closeTlrJnrFile
   If optCash = True Then
      closeTotCrFile
   End If
   closeTrnDtlFile
   'closeSysMontFile
End Sub

Public Sub unloadSadadForms()
  Dim reqdTransRefNo As String
  Dim formTag As String
   
  If Len(RTrim(frmSadadReversalPendingList.txtTransRefNo)) <> 0 Then
     reqdTransRefNo = Format(frmSadadReversalPendingList.txtTransRefNo, "!@@@@@@@@@@")
  Else
     reqdTransRefNo = Space(10)
  End If
  formTag = frmSadadPayment.tag
    
  Unload Me
  Unload frmSadadReversalPendingList
  
  If formTag = "A" Then
     frmEnquiry.readSadadReversalPendingList "00000", "S", reqdTransRefNo
  Else
     frmEnquiry.readSadadReversalPendingList "00000", "T", reqdTransRefNo
  End If
  
  If UserLang = ARABIC Then
     ChangePositions frmSadadReversalPendingList, 11800
     frmSadadReversalPendingList.RightToLeft = True
  End If
  frmSadadReversalPendingList.Show
End Sub


Public Sub displayBillEnquiryHeading()
    Dim colwidth(5) As Integer
    Dim tWidth As Integer
    Dim i As Integer
        
    billDetailsGrid.Clear
    billDetailsGrid.Row = 0
    billDetailsGrid.Font.Bold = True
    
    colwidth(0) = 1100
    colwidth(1) = 1000
    colwidth(2) = 1300
    colwidth(3) = 1300
    colwidth(4) = 1900
     
    tWidth = 0
    For i = 0 To 4
      billDetailsGrid.Col = i
      If UserLang = ARABIC Then
         billDetailsGrid.CellAlignment = flexAlignRightCenter
      Else
         billDetailsGrid.CellAlignment = flexAlignLeftCenter
      End If
      billDetailsGrid.text = frmSadadPaymentCaption(i + 15, UserLang)
      billDetailsGrid.colwidth(i) = colwidth(i)
      tWidth = tWidth + colwidth(i)
    Next i
    
    billDetailsGrid.Width = tWidth + 200

End Sub

Private Sub txtSubscriptionNo_KeyPress(KeyAscii As Integer)
    If optPostPayment.Value = True Then
       If KeyAscii = 13 Then 'enter key is pressed
          cmdBillDetails_Click
       End If
    End If
End Sub
