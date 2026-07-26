VERSION 5.00
Begin VB.Form frmSendFile 
   BackColor       =   &H00BFD87E&
   Caption         =   "FTP Historical statement to Branch"
   ClientHeight    =   3585
   ClientLeft      =   3180
   ClientTop       =   2640
   ClientWidth     =   4680
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3585
   ScaleWidth      =   4680
   Begin VB.Frame frameStatus 
      BackColor       =   &H00BFD87E&
      Caption         =   " Status "
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Left            =   480
      TabIndex        =   4
      Top             =   2160
      Width           =   3735
      Begin VB.TextBox txtStatus 
         Alignment       =   2  'Center
         BackColor       =   &H80000003&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   615
         Left            =   240
         TabIndex        =   5
         Tag             =   "3735"
         Text            =   "Ready"
         Top             =   360
         Width           =   3255
      End
   End
   Begin VB.CommandButton cmdQuit 
      Caption         =   "Quit"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   2400
      TabIndex        =   3
      Top             =   1560
      Width           =   1575
   End
   Begin VB.CommandButton cmdRunFtp 
      Caption         =   "Run FTP"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   720
      TabIndex        =   2
      Top             =   1560
      Width           =   1575
   End
   Begin VB.TextBox txtBranchCode 
      DataField       =   "3"
      BeginProperty DataFormat 
         Type            =   0
         Format          =   "0"
         HaveTrueFalseNull=   0
         FirstDayOfWeek  =   0
         FirstWeekOfYear =   0
         LCID            =   1025
         SubFormatType   =   0
      EndProperty
      Height          =   375
      Left            =   1320
      TabIndex        =   1
      Top             =   960
      Width           =   1935
   End
   Begin VB.Label lblBranchCode 
      BackColor       =   &H00BFD87E&
      Caption         =   "Enter the branch code here :"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   178
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   1200
      TabIndex        =   0
      Top             =   600
      Width           =   2535
   End
End
Attribute VB_Name = "frmSendFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'*************************************
'* FTP to branches program ..        *
'* By Yasser Mohammed Al-Khathlan    *
'* Launch date 19-6-2005             *
'*************************************

Private Declare Sub Sleep Lib "KERNEL32" (ByVal lngMillisec As Long)
Dim pass As String

Private Sub cmdQuit_Click()
On Error GoTo done
If Dir("C:\logs\test.txt") <> "" Then
   Kill ("C:\logs\test.txt")
End If
If Dir("C:\logs\test1.txt") <> "" Then
   Kill ("C:\logs\test1.txt")
End If
If Dir("C:\logs\result.txt") <> "" Then
   Kill ("C:\logs\result.txt")
End If
If Dir("C:\logs\ftpscript.bat") <> "" Then
   Kill ("C:\logs\ftpscript.bat")
End If
done:
Unload Me
End Sub

Private Sub cmdrunftp_Click()

  On Error GoTo err1
  If Dir("C:\logs\test.txt") <> "" Then
     Kill ("C:\logs\test.txt")
  End If
  If Dir("C:\logs\result.txt") <> "" Then
     Kill ("C:\logs\result.txt")
  End If
  If Dir("C:\logs\ftpscript.bat") <> "" Then
     Kill ("C:\logs\ftpscript.bat")
  End If

  frmSendFile.MousePointer = vbHourglass
  frmSendFile.cmdRunFtp.Enabled = False
  frmSendFile.cmdQuit.Enabled = False


' here should be all the actions
' 1. check the value of branch code! if not correct user shoudl re enter it again
' 2. ftp the file c:\hist\prtall.$s! to $home\."txtBranchCode.text" folder in HPANB
' 3. execute remotely the script sot_ftp
' 4. print the result on screen

' step (1)

  If (txtBranchCode.text < 100 Or txtBranchCode.text > 999) Then  '1st if
     MsgBox errInvalidBranchCode(UserLang)     ' "Sorry, you are running out of branch codes limit!", vbOKOnly, "Branch Code Error!"
     Exit Sub
  End If

  ' create the text file where ftp command reads from (for sending the prtall.$s!)

  Open "c:\logs\test.txt" For Output As #5

  Print #5, "user " & histUser
  Print #5, pass ' password
  Print #5, "ascii"

  'Path on the server
  'current path, default path

  ' Copy the file from pc to server and rename it.
  Print #5, "put " & outPath & "prtall.$s! /users/" & histUser & "/." & txtBranchCode.text & "/prtall.$s!"
  Print #5, "cd ." & txtBranchCode
  Print #5, "dir prtall.$s!"
  Print #5, "bye"
  Close #5

  ' write the bat file that will run the ftp and put return value in a file to indicate the operation SCCESS or FAILED

  Open "c:\logs\ftpscript.bat" For Output As #6
  Print #6, "echo --------- New Entry --------- >> c:\logs\logfile.log"
  Print #6, "echo. >> c:\logs\logfile.log"
  Print #6, "echo [ Date ] >> c:\logs\logfile.log"
  Print #6, "date /T >> c:\logs\logfile.log"
  Print #6, "echo [ Time ] >> c:\logs\logfile.log"
  Print #6, "time /T >> c:\logs\logfile.log"
  Print #6, "echo. >> c:\logs\logfile.log"
  'Print #6, "echo hi there -rw > c:\logs\output.txt"
  Print #6, "ftp -v -n -i -g -s:c:\logs\test.txt " & histHost & " > c:\logs\output.txt"
  Print #6, "find /C ""-rw"" c:\logs\output.txt"
  Print #6, "set _errcode=%errorlevel%"
  Print #6, "if %errorlevel% equ 0 (echo FTP Status: File Sent Successfully to HP-ANB server >> c:\logs\logfile.log) else (echo FTP Status: File was NOT sent to HP-ANB server. Please investigate the problem. See file c:\logs\output.txt >> c:\logs\logfile.log )"
  Print #6, "echo. >> logfile.log"
  Print #6, "echo %_errcode% > c:\logs\formsgbox.txt"
  Close #6

  'Run the batch file
  RetVal = Shell("c:\logs\ftpscript.bat", vbHide)

wait1:
Sleep 100

If Dir("c:\logs\formsgbox.txt") = "" Then ' 2nd if
   GoTo wait1
End If

Dim str As String
Open "c:\logs\formsgbox.txt" For Input As #7
Line Input #7, str
Close #7
Kill ("C:\logs\formsgbox.txt")
filesize1 = FileLen(outPath & "prtall.$s!")
fileSize = Format(filesize1, "###.00") / 1024
If str = 0 Then ' 3rd if
   ret = MsgBox(errFTPsuccess(UserLang) & vbCrLf & errFileSize(UserLang) & fileSize & errKb(UserLang), , "Successful FTP")
   If (ret <> vbOK) Then '4th if
      Exit Sub
   End If
   Set wshbin = CreateObject("wscript.shell")
   Output = wshbin.run("rexec " & histHost & " -l " & histUser & " sot_ftp " & txtBranchCode.text, vbMinimizedFocus)
   Sleep (200)
   wshbin.SendKeys pass & "~"
   Sleep (200)

   Sleep 900


   ' read the results in a file ..

   Dim result As String

reget:
Sleep 500
ret1 = Shell("ftp -v -n -i -g -s:c:\logs\test1.txt " & histHost, vbHide)
'MsgBox "Done!!!"
Sleep 500

    If (Dir("C:\logs\result.txt") <> "") Then
       Open ("C:\logs\result.txt") For Input As #8
       Line Input #8, result
       Close #8
       If (result = "") Then
          Kill ("c:\logs\result.txt")
          GoTo reget
       Else
          frmSendFile.MousePointer = vbNormal
          frmSendFile.cmdRunFtp.Enabled = True
          frmSendFile.cmdQuit.Enabled = True
          MsgBox vbCrLf & result, vbokayonly, "Status on HPANB"
       End If
    Else
       GoTo reget
    End If

   ' delete result.txt file
   Kill ("C:\logs\result.txt")

Else 'else 3rd if
  If (MsgBox(errFTPfailure(UserLang), vbOKCancel, "FTP Error!") = vbOK) Then
     ret1 = Shell("notepad c:\logs\output.txt", vbNormalNoFocus)
  End If
End If ' end 3rd if

err1:
    frmSendFile.MousePointer = vbNormal
    frmSendFile.cmdRunFtp.Enabled = True
    frmSendFile.cmdQuit.Enabled = True
endit:

End Sub

Private Sub Form_Load()

If UserLang = ARABIC Then
   ChangePositions frmSendFile, 4800
   frmSendFile.RightToLeft = True
End If

frmSendFile.Caption = frmSendFileCaption(0, UserLang)
frmSendFile.lblBranchCode.Caption = frmSendFileCaption(1, UserLang)
frmSendFile.cmdRunFtp.Caption = frmSendFileCaption(2, UserLang)
frmSendFile.cmdQuit.Caption = frmSendFileCaption(3, UserLang)
frmSendFile.frameStatus.Caption = frmSendFileCaption(4, UserLang)

frmSendFile.txtStatus.text = errReady(UserLang)

'frmSendFile.Enabled = False

' check if the directory logs is existed under c:\

If Dir("c:\logs", vbDirectory) = "" Then
   MkDir ("C:\logs")
End If

' check for the pass.txt file and will create it if not exist

If Dir("c:\logs\pass.txt") = "" Then
   Open ("C:\logs\pass.txt") For Output As #2
   Print #2, "222static"
   Close #2
End If

' read the password from pass.txt file and put it in variable named "pass"

Open ("c:\logs\pass.txt") For Input As #3
Line Input #3, pass
Close #3
'pass = Decrypt(pass)

' create the text1 file that ftp reads from ( to get the result file from HPANB server and show the message!)

If Dir("c:\logs\test1.txt") = "" Then
   Open "c:\logs\test1.txt" For Output As #4

   Print #4, "user " & histUser
   Print #4, pass ' password
   Print #4, "ascii"

   'Path on the server
   'current path, default path

   ' Copy the file from pc to server and rename it.
   Print #4, "get result.txt c:\logs\result.txt"
   Print #4, "bye"
   Close #4
End If

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtStatus.text = errReady(UserLang) '"Ready"
End Sub

Private Sub cmdquit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtStatus.text = errQuitFromFtp(UserLang) '"Quit from the FTP program..!"
End Sub

Private Sub txtBranchCode_Change()

If (Len(txtBranchCode.text) > 3) Then
   MsgBox errBranchMoreThan3Digits(UserLang) '"Only 3 digits Branch Code is allowed!", , "Branch Code Error!"
   txtBranchCode.text = ""
   txtBranchCode.SetFocus
   'frmSendFile.Enabled = False
End If
End Sub

Private Sub txtBranchCode_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox (errOnlyNumeralsAllowed(UserLang))
      Exit Sub
  End If
End Sub

Private Sub txtBranchCode_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
   txtStatus.text = errEnterBranchCode(UserLang)  '"Enter the branch code here.."
End Sub

Private Sub cmdrunftp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtStatus.text = errStartSendingFile(UserLang) '"Start sending the file now ..!"
End Sub

