VERSION 5.00
Begin VB.Form frmSwiftTransferDetail 
   BackColor       =   &H00BFD87E&
   Caption         =   "Swift Transfer Detail"
   ClientHeight    =   8190
   ClientLeft      =   -75
   ClientTop       =   765
   ClientWidth     =   11880
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MDIChild        =   -1  'True
   ScaleHeight     =   8190
   ScaleWidth      =   11880
   WindowState     =   2  'Maximized
   Begin VB.Frame Frame1 
      BackColor       =   &H00BFD87E&
      Height          =   690
      Index           =   1
      Left            =   75
      TabIndex        =   29
      Tag             =   "12000"
      Top             =   7620
      Width           =   11835
      Begin VB.CommandButton cmdBranchInfo 
         BackColor       =   &H00000000&
         Caption         =   "Financial Info"
         Height          =   405
         Left            =   180
         TabIndex        =   21
         Tag             =   "11835"
         ToolTipText     =   "Financial Info"
         Top             =   210
         Width           =   1545
      End
      Begin VB.CommandButton cmdMesg 
         BackColor       =   &H00000000&
         Caption         =   "Messages"
         Height          =   405
         Left            =   1725
         TabIndex        =   22
         Tag             =   "11835"
         ToolTipText     =   "Messages"
         Top             =   210
         Width           =   1545
      End
      Begin VB.CommandButton cmdCreate 
         BackColor       =   &H00000000&
         Caption         =   "&Create"
         Enabled         =   0   'False
         Height          =   405
         Left            =   5190
         TabIndex        =   24
         Tag             =   "11835"
         ToolTipText     =   "Create"
         Top             =   195
         Width           =   1545
      End
      Begin VB.CommandButton cmdCancel 
         BackColor       =   &H00000000&
         Caption         =   "&Cancel"
         Height          =   405
         Left            =   9855
         TabIndex        =   27
         Tag             =   "11835"
         ToolTipText     =   "Exit"
         Top             =   195
         Width           =   1890
      End
      Begin VB.CommandButton cmdApprove 
         BackColor       =   &H00000000&
         Caption         =   "&Approve"
         Height          =   405
         Left            =   6750
         TabIndex        =   25
         Tag             =   "11835"
         ToolTipText     =   "Approve"
         Top             =   195
         Width           =   1530
      End
      Begin VB.CommandButton cmdReject 
         BackColor       =   &H00000000&
         Caption         =   "&Reject"
         Height          =   405
         Left            =   8295
         TabIndex        =   26
         Tag             =   "11835"
         ToolTipText     =   "Reject"
         Top             =   195
         Width           =   1545
      End
      Begin VB.CommandButton cmdSupervisorComments 
         BackColor       =   &H00000000&
         Caption         =   "Supervisor comments"
         Height          =   405
         Left            =   3285
         TabIndex        =   23
         Tag             =   "11835"
         ToolTipText     =   "Supervisor Comments"
         Top             =   195
         Width           =   1890
      End
   End
   Begin VB.Frame frameSwiftTransferDetails 
      BackColor       =   &H00BFD87E&
      Height          =   7065
      Index           =   0
      Left            =   0
      TabIndex        =   28
      Top             =   495
      Width           =   12015
      Begin VB.Frame frameBenefDetails 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Details"
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
         Height          =   3210
         Left            =   5985
         TabIndex        =   58
         Tag             =   "12000"
         Top             =   135
         Width           =   5850
         Begin VB.TextBox txtBenefName 
            Height          =   315
            Left            =   2520
            TabIndex        =   8
            Tag             =   "5850"
            Top             =   240
            Width           =   3180
         End
         Begin VB.TextBox txtBenefAddr1 
            Height          =   315
            Left            =   2520
            MaxLength       =   35
            TabIndex        =   12
            Tag             =   "5850"
            Top             =   1485
            Width           =   3165
         End
         Begin VB.TextBox txtBenefAddr2 
            Height          =   315
            Left            =   2550
            MaxLength       =   35
            TabIndex        =   13
            Tag             =   "5850"
            Top             =   1905
            Width           =   3135
         End
         Begin VB.TextBox txtBenefAddr3 
            Height          =   315
            Left            =   2520
            MaxLength       =   35
            TabIndex        =   14
            Tag             =   "5850"
            Top             =   2310
            Width           =   3165
         End
         Begin VB.ComboBox cmbNationality 
            Height          =   315
            Left            =   2520
            TabIndex        =   15
            Tag             =   "5850"
            Top             =   2745
            Width           =   3165
         End
         Begin VB.TextBox txtBenefAccNo 
            Height          =   315
            Left            =   2520
            MaxLength       =   35
            TabIndex        =   11
            Tag             =   "5850"
            Top             =   1080
            Width           =   3180
         End
         Begin VB.Frame framIbanOrAcc 
            BackColor       =   &H00BFD87E&
            Height          =   465
            Left            =   2535
            TabIndex        =   59
            Tag             =   "5850"
            Top             =   555
            Width           =   3150
            Begin VB.OptionButton optAccNo 
               BackColor       =   &H00BFD87E&
               Caption         =   "A/c Number"
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
               Left            =   1275
               TabIndex        =   10
               Tag             =   "3150"
               ToolTipText     =   "Female"
               Top             =   150
               Width           =   1350
            End
            Begin VB.OptionButton optIban 
               BackColor       =   &H00BFD87E&
               Caption         =   "IBAN"
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
               Left            =   165
               TabIndex        =   9
               Tag             =   "3150"
               ToolTipText     =   "Male"
               Top             =   165
               Value           =   -1  'True
               Width           =   900
            End
         End
         Begin VB.Label lblBenefName 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Beneficiary Name"
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
            Left            =   165
            TabIndex        =   66
            Tag             =   "5850"
            Top             =   240
            Width           =   1500
         End
         Begin VB.Label lblIbanAccNo 
            BackColor       =   &H00BFD87E&
            Caption         =   "IBAN / Acc.No."
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
            Left            =   165
            TabIndex        =   65
            Tag             =   "5850"
            Top             =   690
            Width           =   1455
         End
         Begin VB.Label lblBenefAccNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Beneficiary A/c No."
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
            Left            =   150
            TabIndex        =   64
            Tag             =   "5850"
            Top             =   1140
            Width           =   1695
         End
         Begin VB.Label lblBenefAddr1 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Beneficiary Address 1"
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
            Left            =   150
            TabIndex        =   63
            Tag             =   "5850"
            Top             =   1560
            Width           =   1860
         End
         Begin VB.Label lblBenefAddr2 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Beneficiary Address 2"
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
            Left            =   165
            TabIndex        =   62
            Tag             =   "5850"
            Top             =   1950
            Width           =   1860
         End
         Begin VB.Label lblBenefAddr3 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Beneficiary Address 3"
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
            Left            =   165
            TabIndex        =   61
            Tag             =   "5850"
            Top             =   2355
            Width           =   1860
         End
         Begin VB.Label lblNationality 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Benef.Country"
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
            Left            =   150
            TabIndex        =   60
            Tag             =   "5850"
            Top             =   2775
            Width           =   1215
         End
      End
      Begin VB.Frame frameTransDetails 
         BackColor       =   &H00BFD87E&
         Caption         =   "Transaction Details"
         Enabled         =   0   'False
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
         Height          =   2505
         Left            =   120
         TabIndex        =   32
         Tag             =   "12000"
         Top             =   120
         Width           =   5775
         Begin VB.TextBox txtBranchCode 
            Height          =   285
            Left            =   3030
            TabIndex        =   48
            Tag             =   "5775"
            Top             =   2100
            Width           =   2535
         End
         Begin VB.ComboBox cmbTransDate 
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   315
            Left            =   3045
            TabIndex        =   46
            Tag             =   "5775"
            Text            =   "01"
            Top             =   780
            Width           =   615
         End
         Begin VB.ComboBox cmbTransMonth 
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   315
            Left            =   3735
            TabIndex        =   45
            Tag             =   "5775"
            Text            =   "01"
            Top             =   780
            Width           =   630
         End
         Begin VB.TextBox txtTransYear 
            BackColor       =   &H00FFFFFF&
            Enabled         =   0   'False
            Height          =   285
            Left            =   4455
            TabIndex        =   44
            Tag             =   "5775"
            Top             =   780
            Width           =   765
         End
         Begin VB.TextBox txtTransRefNo 
            Height          =   285
            Left            =   3060
            TabIndex        =   43
            Tag             =   "5775"
            Top             =   360
            Width           =   2535
         End
         Begin VB.TextBox txtDebitAccNo 
            Height          =   285
            Left            =   3060
            TabIndex        =   41
            Tag             =   "5775"
            Top             =   1710
            Width           =   2535
         End
         Begin VB.TextBox txtTransAmt 
            Height          =   285
            Left            =   3060
            TabIndex        =   40
            Tag             =   "5775"
            Top             =   1260
            Width           =   2535
         End
         Begin VB.Label lblBranchCode 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Branch Code"
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
            Left            =   285
            TabIndex        =   49
            Tag             =   "5775"
            Top             =   2100
            Width           =   1110
         End
         Begin VB.Label lblBpRefNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "BP Referrence No"
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
            Left            =   315
            TabIndex        =   42
            Tag             =   "5775"
            Top             =   360
            Width           =   1560
         End
         Begin VB.Label lblCrAccNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Credit A/c No"
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
            Left            =   330
            TabIndex        =   38
            Tag             =   "5775"
            Top             =   1695
            Width           =   1185
         End
         Begin VB.Label lblTransAmt 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Transaction Amount"
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
            Left            =   315
            TabIndex        =   37
            Tag             =   "5775"
            Top             =   1260
            Width           =   1710
         End
         Begin VB.Label lblTransDate 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Transaction Date "
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
            Left            =   315
            TabIndex        =   36
            Tag             =   "5775"
            Top             =   810
            Width           =   1545
         End
      End
      Begin VB.Frame frameBenefBankDetails 
         BackColor       =   &H00BFD87E&
         Caption         =   "Beneficiary Bank Details"
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
         Height          =   2580
         Left            =   6000
         TabIndex        =   31
         Tag             =   "12000"
         Top             =   3465
         Width           =   5895
         Begin VB.TextBox txtBankName 
            Height          =   315
            Left            =   2535
            MaxLength       =   35
            TabIndex        =   16
            Tag             =   "5895"
            Top             =   270
            Width           =   3165
         End
         Begin VB.TextBox txtBankBICcode 
            Height          =   315
            Left            =   2535
            MaxLength       =   11
            TabIndex        =   20
            Tag             =   "5895"
            Top             =   2100
            Width           =   3180
         End
         Begin VB.TextBox txtBankSortCode 
            Height          =   315
            Left            =   2520
            MaxLength       =   35
            TabIndex        =   19
            Tag             =   "5895"
            Top             =   1680
            Width           =   3195
         End
         Begin VB.TextBox txtBenefBankAddr2 
            Height          =   315
            Left            =   2535
            MaxLength       =   35
            TabIndex        =   18
            Tag             =   "5895"
            Top             =   1230
            Width           =   3180
         End
         Begin VB.TextBox txtBenefBankAddr1 
            Height          =   315
            Left            =   2535
            MaxLength       =   35
            TabIndex        =   17
            Tag             =   "5895"
            Top             =   735
            Width           =   3180
         End
         Begin VB.Label lblBankName 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Bank Name"
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
            Left            =   165
            TabIndex        =   67
            Tag             =   "5895"
            Top             =   270
            Width           =   990
         End
         Begin VB.Label lblBankBIC 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Bank BIC Code"
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
            Left            =   180
            TabIndex        =   47
            Tag             =   "5895"
            Top             =   2145
            Width           =   1305
         End
         Begin VB.Label lblBankSortCode 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Country clearing code"
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
            Left            =   195
            TabIndex        =   35
            Tag             =   "5895"
            Top             =   1725
            Width           =   1875
         End
         Begin VB.Label lblBankAddr2 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Bank Address 2 "
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
            Left            =   180
            TabIndex        =   34
            Tag             =   "5895"
            Top             =   1230
            Width           =   1410
         End
         Begin VB.Label lblBankAddr1 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Bank Address 1"
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
            Left            =   180
            TabIndex        =   33
            Tag             =   "5895"
            Top             =   750
            Width           =   1350
         End
      End
      Begin VB.Frame frameApplicantDetails 
         BackColor       =   &H00BFD87E&
         Caption         =   "Applicant Details"
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
         Height          =   4215
         Left            =   120
         TabIndex        =   30
         Tag             =   "12000"
         Top             =   2685
         Width           =   5775
         Begin VB.ComboBox cmbTransferPurpose 
            Height          =   315
            Left            =   2370
            TabIndex        =   1
            Tag             =   "5775"
            Top             =   360
            Width           =   3120
         End
         Begin VB.TextBox txtApplicantIdNo 
            Height          =   285
            Left            =   2400
            MaxLength       =   15
            TabIndex        =   7
            Tag             =   "5775"
            Top             =   3600
            Width           =   3135
         End
         Begin VB.ComboBox cmbApplicantNationality 
            Height          =   315
            Left            =   2385
            TabIndex        =   6
            Tag             =   "5775"
            Top             =   3120
            Width           =   3150
         End
         Begin VB.TextBox txtApplicantAddr3 
            Height          =   285
            Left            =   2400
            MaxLength       =   35
            TabIndex        =   5
            Tag             =   "5775"
            Top             =   2655
            Width           =   3150
         End
         Begin VB.TextBox txtApplicantAddr2 
            Height          =   285
            Left            =   2400
            MaxLength       =   35
            TabIndex        =   4
            Tag             =   "5775"
            Top             =   2205
            Width           =   3135
         End
         Begin VB.TextBox txtApplicantAddr1 
            Height          =   285
            Left            =   2400
            MaxLength       =   35
            TabIndex        =   3
            Tag             =   "5775"
            Top             =   1755
            Width           =   3135
         End
         Begin VB.TextBox txtApplicantName 
            Height          =   285
            Left            =   2385
            MaxLength       =   30
            TabIndex        =   2
            Tag             =   "5775"
            Top             =   1305
            Width           =   3150
         End
         Begin VB.TextBox txtApplicantAccNo 
            Enabled         =   0   'False
            Height          =   285
            Left            =   2385
            TabIndex        =   39
            Tag             =   "5775"
            Top             =   840
            Width           =   3150
         End
         Begin VB.Label lblTransPurpose 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Transfer Purpose"
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
            Left            =   225
            TabIndex        =   57
            Tag             =   "5775"
            Top             =   390
            Width           =   1470
         End
         Begin VB.Label lblApplicantIdNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant ID Number"
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
            Left            =   225
            TabIndex        =   56
            Tag             =   "5775"
            Top             =   3645
            Width           =   1770
         End
         Begin VB.Label lblApplicantNationality 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant Nationality"
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
            Left            =   240
            TabIndex        =   55
            Tag             =   "5775"
            Top             =   3195
            Width           =   1770
         End
         Begin VB.Label lblApplicantAddr3 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant Address 3"
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
            Left            =   240
            TabIndex        =   54
            Tag             =   "5775"
            Top             =   2775
            Width           =   1710
         End
         Begin VB.Label lblApplicantAddr2 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant Address 2"
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
            Left            =   255
            TabIndex        =   53
            Tag             =   "5775"
            Top             =   2310
            Width           =   1710
         End
         Begin VB.Label lblApplicantAddr1 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant Address 1"
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
            Left            =   255
            TabIndex        =   52
            Tag             =   "5775"
            Top             =   1815
            Width           =   1710
         End
         Begin VB.Label lblApplicantName 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant Name"
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
            Left            =   210
            TabIndex        =   51
            Tag             =   "5775"
            Top             =   1350
            Width           =   1350
         End
         Begin VB.Label lblApplicantAccNo 
            AutoSize        =   -1  'True
            BackColor       =   &H00BFD87E&
            Caption         =   "Applicant A/c No"
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
            Left            =   225
            TabIndex        =   50
            Tag             =   "5775"
            Top             =   870
            Width           =   1485
         End
      End
   End
   Begin VB.Label lblSwiftTransferDetail 
      BackColor       =   &H00BFD87E&
      Caption         =   "Swift Transfer Details"
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
      Height          =   390
      Left            =   3360
      TabIndex        =   0
      Top             =   60
      Width           =   5055
   End
End
Attribute VB_Name = "frmSwiftTransferDetail"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmbApplicantNationality_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbApplicantNationality.text)) <> 0 Then
         tCode = Mid$(cmbApplicantNationality.text, 1, 3)
         For i = 0 To cmbApplicantNationality.ListCount
             If Mid$(cmbApplicantNationality.List(i), 1, 3) = tCode Then
                cmbApplicantNationality.ListIndex = i
                Exit For
             End If
         Next i
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmbNationality_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbNationality.text)) <> 0 Then
         tCode = UCase(Mid$(cmbNationality.text, 1, 2))
         For i = 0 To cmbNationality.ListCount
             If Mid$(cmbNationality.List(i), 1, 2) = tCode Then
                cmbNationality.ListIndex = i
                Exit For
             End If
         Next i
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmbTransferPurpose_Validate(Cancel As Boolean)
   Dim i As Integer
   Dim tCode As String
   
   Cancel = False
   If Screen.ActiveControl.Name = "cmdCancel" Then
      DoEvents
   Else
      On Error Resume Next
      If Len(RTrim(cmbTransferPurpose.text)) <> 0 Then
         tCode = Mid$(cmbTransferPurpose.text, 1, 2)
         For i = 0 To cmbTransferPurpose.ListCount
             If Mid$(cmbTransferPurpose.List(i), 1, 2) = tCode Then
                cmbTransferPurpose.ListIndex = i
                Exit For
             End If
         Next i
      End If
   End If
   On Error GoTo 0
End Sub

Private Sub cmdApprove_Click()
    swiftTransferSupervisorDecision "A", Space(200)
End Sub

Private Sub cmdBranchInfo_Click()
    Dim tCode As String
    
    frmSwiftFinancialInfo.txtTransRefNo = recvTransferDetail.transRefNo
    frmSwiftFinancialInfo.cmbTransDate = Mid$(recvTransferDetail.issueDate, 7, 2)
    frmSwiftFinancialInfo.cmbTransMonth = Mid$(recvTransferDetail.issueDate, 5, 2)
    frmSwiftFinancialInfo.txtTransYear = Mid$(recvTransferDetail.issueDate, 1, 4)
    
    tCode = recvTransferDetail.transCurrCode
    Set rs = db.OpenRecordset("select arabicname, englishname,decimalplace from currencyinfo " & _
                              "where isocurrcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(2)
    Else
       tDecimalPlace = "2"
    End If
    
    If tDecimalPlace = "3" Then
       coinPrecision = 3
       coinDenomination = 1000
    ElseIf tDecimalPlace = "2" Then
       coinPrecision = 2
       coinDenomination = 100
    ElseIf tDecimalPlace = "1" Then
       coinPrecision = 1
       coinDenomination = 10
    Else
       coinPrecision = 0
       coinDenomination = 1
    End If
   
    If Not IsNumeric(Right(Trim(recvTransferDetail.transAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvTransferDetail.transAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvTransferDetail.transAmt)
    End If
        
    amtToPrint = tranAmt / coinDenomination
    frmSwiftFinancialInfo.txtTransAmt = recvTransferDetail.transCurrCode & "  " & _
                                         Format(Format(amtToPrint, "##,###,###,###,##0" & _
                                         IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
        
    frmSwiftFinancialInfo.txtCrAccNo = recvTransferDetail.accNo
    frmSwiftFinancialInfo.cmbTransferPurpose = frmSwiftTransferDetail.cmbTransferPurpose
    'frmSwiftTransferDetail.txtCustName = recvTransferDetail.custName
    
    frmSwiftFinancialInfo.txtDebitAccNo = recvTransferDetail.drAccNo
    
    frmSwiftFinancialInfo.cmbValueDate = Mid$(recvTransferDetail.valueDate, 7, 2)
    frmSwiftFinancialInfo.cmbValueMonth = Mid$(recvTransferDetail.valueDate, 5, 2)
    frmSwiftFinancialInfo.txtValueYear = Mid$(recvTransferDetail.valueDate, 1, 4)

    tCode = recvTransferDetail.paymentCurrCode
    Set rs = db.OpenRecordset("select arabicname, englishname, decimalplace from currencyinfo " & _
                              "where isocurrcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       tDecimalPlace = rs(2)
    Else
       tDecimalPlace = "2"
    End If
    If tDecimalPlace = "3" Then
       coinPrecision = 3
       coinDenomination = 1000
    ElseIf tDecimalPlace = "2" Then
       coinPrecision = 2
       coinDenomination = 100
    ElseIf tDecimalPlace = "1" Then
       coinPrecision = 1
       coinDenomination = 10
    Else
       coinPrecision = 0
       coinDenomination = 1
    End If
    
    'Added by Mohit on August 20, 2007
    If Len(Trim(recvTransferDetail.paymentAmt)) = 0 Then
       recvTransferDetail.paymentAmt = "0"
    End If

    If Not IsNumeric(Right(Trim(recvTransferDetail.paymentAmt), 1)) Then
       tmpStr = "-" & bmAmtToDbl(recvTransferDetail.paymentAmt)
       tranAmt = CDbl(tmpStr)
    Else
       tranAmt = CDbl(recvTransferDetail.paymentAmt)
    End If

    amtToPrint = tranAmt / coinDenomination
    frmSwiftFinancialInfo.txtPaymentAmt = recvTransferDetail.paymentCurrCode & "   " & Format(Format(amtToPrint, "##,###,###,###,##0" & _
                             IIf(coinPrecision <> 0, "." & String(coinPrecision, "0"), "")), "!@@@@@@@@@@@@@@@@@")
                             
    amtToPrint = Val(recvTransferDetail.exchangeRate) / 100000000
    frmSwiftFinancialInfo.txtExchangeRate = Format(Format(amtToPrint, "###0.00000000"), "!@@@@@@@@@@@@@")

    tCode = recvTransferDetail.branchCode
    Set rs = db.OpenRecordset("select arabicname, englishname from branchinfo " & _
                              "where branchcode = '" & tCode & "'")
    If rs.recordCount > 0 Then
       If UserLang = ARABIC Then
          frmSwiftFinancialInfo.txtBranchCode = tCode & "-" & rs(0)
       Else
          frmSwiftFinancialInfo.txtBranchCode = tCode & "-" & rs(1)
       End If
    Else
       frmSwiftFinancialInfo.txtBranchCode = tCode & "-Not defined in Local"
    End If
    frmSwiftFinancialInfo.Show vbModal
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdCreate_Click()
    Dim newOrUpdate As String, custName As String
    Dim tTransRefNo As String, tBranchCode As String
    Dim strmsglen As String, tmpStr As String
    Dim retStatus
    
    If validateFrmSwiftTransferDetail = 1 Then
       Exit Sub
    End If
    
    tTransRefNo = Format(txtTransRefNo, "!@@@@@@@@@@")
    
    If swiftUpdateAction Or swiftTellerAction Then
        newOrUpdate = "U"
    Else
        newOrUpdate = "N"
    End If
     
    If Len(RTrim(gDateTime)) = 0 Then
       gDateTime = getUnixDateTime
       If Trim(gDateTime) = "ERROR" Then
          gDateTime = Space(14)
          Exit Sub
       End If
    End If
    
    formatNewSwiftTransferRequest
    
    SendMsg = swiftTransferInfo.msgLen & swiftTransferInfo.service & gBranchCode & _
              swiftTransferInfo.userId & swiftTransferInfo.dateTime & swiftTransferInfo.creationOrUpdate & _
              swiftTransferInfo.bmUpdateStatus & swiftTransferInfo.transRefNo & swiftTransferInfo.issueDate & _
              swiftTransferInfo.supervisorId & swiftTransferInfo.transferPurpose & swiftTransferInfo.applicantName & _
              swiftTransferInfo.applicantAddr1 & swiftTransferInfo.applicantAddr2 & swiftTransferInfo.applicantIdNo & swiftTransferInfo.applicantAddr3 & _
              swiftTransferInfo.applicantNationality & swiftTransferInfo.issueBranchCode & swiftTransferInfo.benefName & _
              swiftTransferInfo.ibanOrAccNo & swiftTransferInfo.benefAccNo & swiftTransferInfo.benefBankName & _
              swiftTransferInfo.benefAddr1 & swiftTransferInfo.benefAddr2 & swiftTransferInfo.benefAddr3 & _
              swiftTransferInfo.benefCountryCode & swiftTransferInfo.benefBankAddr1 & swiftTransferInfo.benefBankAddr2 & _
              swiftTransferInfo.bankSortCode & swiftTransferInfo.benefBankBIC & swiftTransferInfo.message1 & swiftTransferInfo.message2 & _
              swiftTransferInfo.message3 & swiftTransferInfo.message4 & Space(50)
               
    strmsglen = Format(Len(SendMsg), "000000")
    Mid$(SendMsg, 1, 6) = strmsglen
    DataReceivedFlag = False
    frmSwiftTransferDetail.MousePointer = vbHourglass
    frmSwiftTransferDetail.cmdCreate.Enabled = False
    frmSwiftTransferDetail.cmdCancel.Enabled = False
    retStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
    If retStatus = LocalCommsError Then
       LoadError = True
       frmSwiftTransferDetail.cmdCreate.Enabled = True
       frmSwiftTransferDetail.cmdCancel.Enabled = True
       frmSwiftTransferDetail.MousePointer = vbDefault
       Exit Sub
    End If
    frmSwiftTransferDetail.MousePointer = vbDefault
    frmSwiftTransferDetail.cmdCancel.Enabled = True
    If recvCustomerMsg.status = "000" Then
       If UserLang = ARABIC Then
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.aRemarks
       Else
          CSD_mdiForm.staticStatus.Panels(3).text = recvCustomerMsg.eRemarks
       End If
       MsgBox errSuccessful(UserLang) '"Transaction Successfully completed...."
       frmSwiftTransferDetail.cmdCancel.Enabled = True
    Else
       If UserLang = ARABIC Then
          MsgBox recvCustomerMsg.aRemarks
       Else
          MsgBox recvCustomerMsg.eRemarks
       End If
       frmSwiftTransferDetail.cmdCreate.Enabled = True
       frmSwiftTransferDetail.cmdCancel.Enabled = True
       Exit Sub
    End If
    
    Unload Me
    If swiftTellerAction = True Then
       If Len(Trim(frmSwiftTransferPendingList.cmbBranchcode)) = 0 Then
          tBranchCode = Space(4)
       Else
          tBranchCode = Mid$(frmSwiftTransferPendingList.cmbBranchcode, 1, 4)
       End If
       Unload frmSwiftTransferPendingList
  
       frmEnquiry.readSwiftTransferPendingList "00000", "T", tBranchCode
  
       If UserLang = ARABIC Then
          'ChangePositions frmSwiftTransferPendingList, 11800
          'frmSwiftTransferPendingList.RightToLeft = True
       End If
       'frmSwiftTransferPendingList.Show
    End If
End Sub

Public Function validateFrmSwiftTransferDetail() As Integer
    Dim ans
    Dim tmpStr As String
    
    tCode = Mid$(cmbTransferPurpose, 1, 2)
    Set rs = db.OpenRecordset("select arabicname, englishname from transferPurposeInfo " & _
                              "where purposecode = '" & tCode & "'")
    If rs.recordCount = 0 Then
       MsgBox errInvalidTransferPurpose(UserLang) '"Transfer purpose code is invalid.. please check .."
       cmbTransferPurpose.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If

    tCode = Mid$(cmbApplicantNationality, 1, 3)
    Set rs = db.OpenRecordset("select arabicname, englishname from countryinfo " & _
                              "where countrycode = '" & tCode & "'")
    If rs.recordCount = 0 Then
       MsgBox errInvalidApplicantCountryCode(UserLang)  '"Applicant nationality is invalid... please check..."
       cmbApplicantNationality.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If Len(Trim(txtApplicantAddr1)) = 0 Then
       MsgBox errSpaceApplicantAddr1(UserLang)
       txtApplicantAddr1.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If Len(Trim(txtBenefAccNo)) = 0 Then
       MsgBox errSpaceBenefAccNo(UserLang)
       txtBenefAccNo.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If Len(Trim(txtBenefAddr1)) = 0 Then
       MsgBox errSpaceBenefAddr1(UserLang)
       txtBenefAddr1.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If Len(Trim(txtBankName)) = 0 Then
       MsgBox errSpaceBankName(UserLang)
       txtBankName.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If Len(Trim(txtBenefBankAddr1)) = 0 Then
       MsgBox errSpaceBankAddr1(UserLang)
       txtBenefBankAddr1.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    tCode = Mid$(cmbNationality, 1, 2)
    Set rs = db.OpenRecordset("select englishname from swiftcountryinfo " & _
                              "where countrycode = '" & tCode & "'")
    If rs.recordCount = 0 Then
       MsgBox errInvalidBenefCountryCode(UserLang) '"Beneficiary country code is invalid ... please check.. "
       cmbNationality.SetFocus
       validateFrmSwiftTransferDetail = 1
       Exit Function
    Else
       validateFrmSwiftTransferDetail = 0
    End If
    
    If optIban = True Then
       
       If validateIBAN(txtBenefAccNo, tmpStr) = False Then
          MsgBox tmpStr
          validateFrmSwiftTransferDetail = 1
          Exit Function
       Else
          validateFrmSwiftTransferDetail = 0
       End If
    End If
    
    If Len(Trim(recvTransferDetail.message1)) = 0 And _
       Len(Trim(recvTransferDetail.message2)) = 0 And _
       Len(Trim(recvTransferDetail.message3)) = 0 And _
       Len(Trim(recvTransferDetail.message4)) = 0 Then
       
       ans = MsgBox(errSpaceMessages(UserLang), vbYesNo)
       
       If ans = vbYes Then
          validateFrmSwiftTransferDetail = 0
       Else
          validateFrmSwiftTransferDetail = 1
          Exit Function
       End If
    End If
       
    validateFrmSwiftTransferDetail = 0
End Function
Public Sub formatNewSwiftTransferRequest()
    Dim mQry As String
    Dim tmpStr As String
 
    swiftTransferInfo.msgLen = Space(6) ' will be calculated before sending to socket
    swiftTransferInfo.service = "AO"  ' AO is for New customer creation
    swiftTransferInfo.userId = gUserId
    
    If swiftTellerAction Then
       frmSwiftTransferPendingList.swiftPendingGrid.Col = 1
       swiftTransferInfo.dateTime = Format(frmSwiftTransferPendingList.swiftPendingGrid.text, "00000000000000")
       swiftTransferInfo.creationOrUpdate = "U"
       swiftTransferInfo.supervisorComments = recvTransferDetail.supervisorComments
       swiftTransferInfo.supervisorId = Left(recvTransferDetail.supervisorId, 10)
    Else
       swiftTransferInfo.dateTime = gDateTime
       swiftTransferInfo.creationOrUpdate = "C"
       swiftTransferInfo.supervisorId = Space(10)
       swiftTransferInfo.supervisorComments = Space(200)
    End If
    
    swiftTransferInfo.bmUpdateStatus = "1"  ' 1 for "Pending with supervisor"
    swiftTransferInfo.transRefNo = Format(txtTransRefNo, "!@@@@@@@@@@")
    swiftTransferInfo.issueDate = txtTransYear & cmbTransMonth & cmbTransDate
    
    swiftTransferInfo.applicantName = Format(txtApplicantName, "!" & String(35, "@"))
    swiftTransferInfo.applicantAddr1 = Format(txtApplicantAddr1, "!" & String(35, "@"))
    swiftTransferInfo.applicantAddr2 = Format(txtApplicantAddr2, "!" & String(35, "@"))
    swiftTransferInfo.applicantAddr3 = Format(txtApplicantAddr3, "!" & String(35, "@"))
    swiftTransferInfo.applicantNationality = Format(Mid$(cmbApplicantNationality, 1, 3), "!@@@")
    swiftTransferInfo.applicantIdNo = Format(txtApplicantIdNo, "!" & String(15, "@"))
    swiftTransferInfo.benefName = Format(txtBenefName, "!" & String(30, "@"))
    swiftTransferInfo.ibanOrAccNo = "A"
    If optIban = True Then
       swiftTransferInfo.ibanOrAccNo = "I"
    End If
    swiftTransferInfo.benefAccNo = Format(txtBenefAccNo, "!" & String(35, "@"))
    swiftTransferInfo.benefBankName = Format(txtBankName, "!" & String(35, "@"))
    swiftTransferInfo.benefAddr1 = Format(txtBenefAddr1, "!" & String(35, "@"))
    swiftTransferInfo.benefAddr2 = Format(txtBenefAddr2, "!" & String(35, "@"))
    swiftTransferInfo.benefAddr3 = Format(txtBenefAddr3, "!" & String(35, "@"))
    swiftTransferInfo.benefCountryCode = Format(Mid$(cmbNationality, 1, 2), "!@@")
    swiftTransferInfo.benefBankAddr1 = Format(txtBenefBankAddr1, "!" & String(35, "@"))
    swiftTransferInfo.benefBankAddr2 = Format(txtBenefBankAddr2, "!" & String(35, "@"))
    swiftTransferInfo.bankSortCode = Format(txtBankSortCode, "!" & String(35, "@"))
    swiftTransferInfo.benefBankBIC = Format(txtBankBICcode, "!" & String(11, "@"))
    swiftTransferInfo.issueBranchCode = Mid$(txtBranchCode, 1, 4)
    swiftTransferInfo.transferPurpose = Mid$(cmbTransferPurpose, 1, 2)
    
    swiftTransferInfo.message1 = recvTransferDetail.message1
    swiftTransferInfo.message2 = recvTransferDetail.message2
    swiftTransferInfo.message3 = recvTransferDetail.message3
    swiftTransferInfo.message4 = recvTransferDetail.message4
    
End Sub

Private Sub cmdMesg_Click()
    frmSwiftMessages.txtMessage1 = Trim(recvTransferDetail.message1)
    frmSwiftMessages.txtMessage2 = Trim(recvTransferDetail.message2)
    frmSwiftMessages.txtMessage3 = Trim(recvTransferDetail.message3)
    frmSwiftMessages.txtMessage4 = Trim(recvTransferDetail.message4)
    frmSwiftMessages.Show vbModal
End Sub

Private Sub cmdReject_Click()
    frmSwiftTransferRejection.Show vbModal
End Sub

Private Sub cmdSupervisorComments_Click()
    MsgBox Trim(recvTransferDetail.supervisorComments)
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Form_Load()
    
    If UserLang = ARABIC Then
       ChangePositions frmSwiftTransferDetail, 11800
       frmSwiftTransferDetail.RightToLeft = True
       'Added by Mohit on 21 August, 2007
       frameTransDetails.RightToLeft = True
       frameApplicantDetails.RightToLeft = True
       frameBenefDetails.RightToLeft = True
       frameBenefBankDetails.RightToLeft = True
       'till here
    End If
    
    frmSwiftTransferDetail.Caption = frmSwiftTransferDetailCaption(0, UserLang)
    lblSwiftTransferDetail.Caption = frmSwiftTransferDetailCaption(0, UserLang)
    frameTransDetails.Caption = frmSwiftTransferDetailCaption(1, UserLang)
    lblBpRefNo.Caption = frmSwiftTransferDetailCaption(2, UserLang)
    lblTransDate.Caption = frmSwiftTransferDetailCaption(3, UserLang)
    lblTransAmt.Caption = frmSwiftTransferDetailCaption(4, UserLang)
    lblCrAccNo.Caption = frmSwiftTransferDetailCaption(5, UserLang)
    lblBranchCode.Caption = frmSwiftTransferDetailCaption(6, UserLang)
    frameApplicantDetails.Caption = frmSwiftTransferDetailCaption(7, UserLang)
    lblTransPurpose.Caption = frmSwiftTransferDetailCaption(8, UserLang)
    lblApplicantAccNo.Caption = frmSwiftTransferDetailCaption(9, UserLang)
    lblApplicantName.Caption = frmSwiftTransferDetailCaption(10, UserLang)
    lblApplicantAddr1.Caption = frmSwiftTransferDetailCaption(11, UserLang)
    lblApplicantAddr2.Caption = frmSwiftTransferDetailCaption(12, UserLang)
    lblApplicantAddr3.Caption = frmSwiftTransferDetailCaption(13, UserLang)
    lblApplicantNationality.Caption = frmSwiftTransferDetailCaption(14, UserLang)
    lblApplicantIdNo.Caption = frmSwiftTransferDetailCaption(15, UserLang)
    frameBenefDetails.Caption = frmSwiftTransferDetailCaption(16, UserLang)
    lblBenefName.Caption = frmSwiftTransferDetailCaption(17, UserLang)
    lblIbanAccNo.Caption = frmSwiftTransferDetailCaption(18, UserLang)
    optIban.Caption = frmSwiftTransferDetailCaption(19, UserLang)
    optAccNo.Caption = frmSwiftTransferDetailCaption(20, UserLang)
    lblBenefAccNo.Caption = frmSwiftTransferDetailCaption(21, UserLang)
    lblBenefAddr1.Caption = frmSwiftTransferDetailCaption(22, UserLang)
    lblBenefAddr2.Caption = frmSwiftTransferDetailCaption(23, UserLang)
    lblBenefAddr3.Caption = frmSwiftTransferDetailCaption(24, UserLang)
    lblNationality.Caption = frmSwiftTransferDetailCaption(25, UserLang)
    frameBenefBankDetails.Caption = frmSwiftTransferDetailCaption(26, UserLang)
    lblBankName.Caption = frmSwiftTransferDetailCaption(27, UserLang)
    lblBankAddr1.Caption = frmSwiftTransferDetailCaption(28, UserLang)
    lblBankAddr2.Caption = frmSwiftTransferDetailCaption(29, UserLang)
    lblBankSortCode.Caption = frmSwiftTransferDetailCaption(30, UserLang)
    lblBankBIC.Caption = frmSwiftTransferDetailCaption(31, UserLang)
    cmdBranchInfo.Caption = frmSwiftTransferDetailCaption(32, UserLang)
    cmdMesg.Caption = frmSwiftTransferDetailCaption(33, UserLang)
    cmdSupervisorComments.Caption = frmSwiftTransferDetailCaption(34, UserLang)
    cmdCreate.Caption = frmSwiftTransferDetailCaption(35, UserLang)
    cmdApprove.Caption = frmSwiftTransferDetailCaption(36, UserLang)
    cmdReject.Caption = frmSwiftTransferDetailCaption(37, UserLang)
    cmdCancel.Caption = frmSwiftTransferDetailCaption(38, UserLang)
    
    Set rs = db.OpenRecordset("select * from countryinfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbApplicantNationality.Clear
       Do While Not rs.EOF
          If UserLang = ARABIC Then
             cmbApplicantNationality.AddItem rs("countrycode") & " - " & rs("arabicname")
          Else
             cmbApplicantNationality.AddItem rs("countrycode") & " - " & rs("englishname")
          End If
          rs.MoveNext
       Loop
       cmbApplicantNationality.ListIndex = 0
    End If
    
    Set rs = db.OpenRecordset("select * from transferpurposeinfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbTransferPurpose.Clear
       Do While Not rs.EOF
          If UserLang = ARABIC Then
             cmbTransferPurpose.AddItem rs("purposecode") & " - " & rs("arabicname")
          Else
             cmbTransferPurpose.AddItem rs("purposecode") & " - " & rs("englishname")
          End If
          rs.MoveNext
       Loop
       cmbTransferPurpose.ListIndex = 0
    End If
    
    Set rs = db.OpenRecordset("select * from swiftcountryinfo")
    If rs.recordCount > 0 Then
       rs.MoveFirst
       cmbNationality.Clear
       Do While Not rs.EOF
          If UserLang = ARABIC Then
             cmbNationality.AddItem rs("countrycode") & " - " & rs("englishname")
          Else
             cmbNationality.AddItem rs("countrycode") & " - " & rs("englishname")
          End If
          rs.MoveNext
       Loop
       cmbNationality.ListIndex = 0
    End If
    
    If swiftUpdateAction Or swiftTellerAction Then
       cmdCreate.Enabled = True
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
    ElseIf swiftSupervisorAction Then
       cmdCreate.Enabled = False
       cmdApprove.Enabled = True
       cmdReject.Enabled = True
       frameTransDetails.Enabled = False
       frameApplicantDetails.Enabled = False
       frameBenefDetails.Enabled = False
       frameBenefBankDetails.Enabled = False
    Else
       cmdCreate.Enabled = False
       cmdApprove.Enabled = False
       cmdReject.Enabled = False
       frameTransDetails.Enabled = False
       frameApplicantDetails.Enabled = False
       frameBenefDetails.Enabled = False
       frameBenefBankDetails.Enabled = False
    End If
    
    If Len(RTrim(recvTransferDetail.supervisorComments)) > 0 Then
       cmdSupervisorComments.Enabled = True
    Else
       cmdSupervisorComments.Enabled = False
    End If
    
    gDateTime = Space(14)
    
End Sub
Public Function swiftTransferSupervisorDecision(appRejectFlag As String, supervisorComments As String) As Integer
   Dim tuserId As String
   Dim tDateTime As String
   Dim tSupervisorId As String
   Dim tTransRefNo As String
   Dim strmsglen As String
 
   frmSwiftTransferPendingList.swiftPendingGrid.Col = 0
   tuserId = Format(frmSwiftTransferPendingList.swiftPendingGrid.text, "!@@@@@@@@@@")
   frmSwiftTransferPendingList.swiftPendingGrid.Col = 1
   tDateTime = Format(frmSwiftTransferPendingList.swiftPendingGrid.text, "00000000000000")
   frmSwiftTransferPendingList.swiftPendingGrid.Col = 2
   tTransRefNo = Format(frmSwiftTransferPendingList.swiftPendingGrid.text, "!@@@@@@@@@@")

   tSupervisorId = Format(gUserId, "!@@@@@@@@@@")
    
   SendMsg = "000268" & "AQ" & gBranchCode & appRejectFlag & tuserId & tDateTime & _
             tTransRefNo & tSupervisorId & supervisorComments & Space(50)
    
   strmsglen = Format(Len(SendMsg), "000000")
   Mid$(SendMsg, 1, 6) = strmsglen
   DataReceivedFlag = False
   frmSwiftTransferDetail.MousePointer = vbHourglass
   
   cmdApprove.Enabled = False
   cmdCancel.Enabled = False
   cmdReject.Enabled = False
      
   ReturnStatus = HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1)
   If ReturnStatus = LocalCommsError Then
      LoadError = True
      frmAcceptTPin.MousePointer = vbDefault
      cmdApprove.Enabled = True
      cmdCancel.Enabled = True
      cmdReject.Enabled = True
      Exit Function
   End If
      
   frmSwiftTransferDetail.MousePointer = vbDefault
   cmdApprove.Enabled = True
   cmdCancel.Enabled = True
   cmdReject.Enabled = True
   
   If recvCustomerMsg.status = "000" Then
      MsgBox errSuccessful(UserLang)
   Else
      If UserLang = ARABIC Then
         MsgBox recvCustomerMsg.aRemarks
      Else
         MsgBox recvCustomerMsg.eRemarks
      End If
   End If
   If appRejectFlag = "R" Or appRejectFlag = "F" Then
      Unload frmSwiftTransferRejection
   End If
   unloadSwiftTransferForms
  
End Function

Public Sub unloadSwiftTransferForms()
  Dim tag As String
  Dim tBranchCode As String
  Unload Me
  If Len(Trim(frmSwiftTransferPendingList.cmbBranchcode)) = 0 Then
     tBranchCode = Space(4)
  Else
     tBranchCode = Mid$(frmSwiftTransferPendingList.cmbBranchcode, 1, 4)
  End If
  Unload frmSwiftTransferPendingList
  
  frmEnquiry.readSwiftTransferPendingList "00000", "S", tBranchCode
  
  If UserLang = ARABIC Then
     'ChangePositions frmSwiftTransferPendingList, 11800
     'frmSwiftTransferPendingList.RightToLeft = True
  End If
  'frmSwiftTransferPendingList.Show
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
   secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub Frame1_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameApplicantDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameBenefBankDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameBenefDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameSwiftTransferDetails_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub frameTransDetails_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
secsUserInactive = 0
   CSD_mdiForm.staticStatus.Panels(5).text = secsUserInactive
End Sub

Private Sub txtApplicantAddr1_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtApplicantAddr2_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtApplicantAddr3_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtApplicantName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBankBICcode_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBankName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBankSortCode_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefAccNo_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefAddr1_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefAddr2_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefAddr3_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefBankAddr1_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefBankAddr2_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefIdNo_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub

Private Sub txtBenefName_KeyPress(KeyAscii As Integer)
    If KeyAscii > 128 Then
       KeyAscii = 0
       MsgBox (errNoArabicCharacters(UserLang))
       Exit Sub
    End If
End Sub
