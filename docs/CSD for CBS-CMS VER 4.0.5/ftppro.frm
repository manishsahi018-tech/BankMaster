VERSION 5.00
Begin VB.Form ftppro 
   Caption         =   "FTP Pro."
   ClientHeight    =   3585
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3585
   ScaleWidth      =   4680
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdTest 
      Caption         =   "Test"
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
      Left            =   1665
      TabIndex        =   6
      Top             =   150
      Width           =   1575
   End
   Begin VB.Frame stbox 
      BackColor       =   &H80000004&
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
      Begin VB.TextBox lbstatus 
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
         Text            =   "Ready"
         Top             =   360
         Width           =   3255
      End
   End
   Begin VB.CommandButton quit 
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
   Begin VB.CommandButton runftp 
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
   Begin VB.TextBox bcode 
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
   Begin VB.Label inbcode 
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
Attribute VB_Name = "ftppro"
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


Private Sub cmdTest_Click()
Set wshbin = CreateObject("wscript.shell")
Output = wshbin.run("rexec 167.111.3.15 -l bsg anb320 " & vbMinimizedFocus)
Sleep (200)
wshbin.SendKeys "123bsg" & "~"
Sleep (200)
End Sub

Private Sub Form_Load()



runftp.Enabled = False



' check if the directory logs is existed under c:\

If Dir("c:\logs", vbDirectory) = "" Then
MkDir ("C:\logs")
End If

' check for the pass.txt file and will create it if not exist

If Dir("c:\pass.txt") = "" Then
Open ("C:\pass.txt") For Output As #2
Print #2, "222outctl"
Close #2
End If

' read the password from pass.txt file and put it in variable named "pass"

Open ("c:\pass.txt") For Input As #3
Line Input #3, pass
Close #3


' create the text1 file that ftp reads from ( to get the result file from HPANB server and show the message!)

If Dir("c:\logs\test1.txt") = "" Then
Open "c:\logs\test1.txt" For Output As #4

Print #4, "user outctl"
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
lbstatus.Text = "Ready"
End Sub

Private Sub quit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbstatus.Text = "Quit from the FTP program..!"
End Sub

Private Sub quit_Click()
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
End
End Sub

Private Sub bcode_Change()
If (Len(bcode.Text) > 3) Then
MsgBox "Only 3 digits Branch Code is allowed!", , "Branch Code Error!"
bcode.Text = ""
bcode.SetFocus
runftp.Enabled = False
Else
runftp.Enabled = True
End If
End Sub


Private Sub bcode_KeyPress(KeyAscii As Integer)
 If (KeyAscii < 48 Or KeyAscii > 57) And KeyAscii <> 8 Then
      KeyAscii = 0
      MsgBox "Only digits allowed", , "Branch Code Error!"
      Exit Sub
  End If
End Sub


Private Sub bcode_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbstatus.Text = "Enter the branch code here.."
End Sub

Private Sub runftp_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbstatus.Text = "Start sending the file now ..!"
End Sub

Private Sub runftp_Click()

On Error GoTo err1
ftppro.MousePointer = vbHourglass
ftppro.runftp.Enabled = False
ftppro.quit.Enabled = False


' here should be all the actions
' 1. check the value of branch code! if not correct user shoudl re enter it again
' 2. ftp the file c:\hist\prtall.$s! to $home\."bcode.text" folder in HPANB
' 3. execute remotely the script sot_ftp
' 4. print the result on screen

' step (1)




If (bcode.Text < 100 Or bcode.Text > 999) Then  '1st if
MsgBox "Sorry, you are running out of branch codes limit!", vbOKOnly, "Branch Code Error!"


' create the text file where ftp command reads from (for sending the prtall.$s!)
Else

Open "c:\logs\test.txt" For Output As #5

Print #5, "user outctl"
Print #5, pass ' password
Print #5, "ascii"

'Path on the server
'current path, default path

' Copy the file from pc to server and rename it.
Print #5, "put c:\hist\prtall.$s! /users/outctl/." & bcode.Text & "/prtall.$s!"
Print #5, "cd ." & bcode
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
Print #6, "ftp -v -n -i -g -s:c:\logs\test.txt 167.111.4.210 > c:\logs\output.txt"
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
Else ' else 2nd if

Dim str As String
Open "c:\logs\formsgbox.txt" For Input As #7
Line Input #7, str
Close #7
Kill ("C:\logs\formsgbox.txt")
filesize1 = FileLen("c:\hist\prtall.$s!")
filesize = Format(filesize1, "###.00") / 1024
If str = 0 Then ' 3rd if
If (MsgBox("File was transferred successfully" & vbCrLf & "File Size: " & filesize & " Kb", , "Successful FTP") = vbOK) Then '4th if
'Shell "c:\yasser.bat"
Set wshbin = CreateObject("wscript.shell")
Output = wshbin.run("rexec 167.111.4.210 -l outctl sot_ftp " & bcode.Text, vbMinimizedFocus)
Sleep (200)
wshbin.SendKeys pass & "~"
Sleep (200)



Sleep 900


' read the results in a file ..

Dim result As String

reget:
Sleep 500
ret1 = Shell("ftp -v -n -i -g -s:c:\logs\test1.txt 167.111.4.210", vbHide)
'MsgBox "Done!!!"

If (Dir("C:\logs\result.txt") <> "") Then
Open ("C:\logs\result.txt") For Input As #8
Line Input #8, result
Close #8
If (result = "") Then
Kill ("c:\logs\result.txt")
GoTo reget
Else
ftppro.MousePointer = vbNormal
ftppro.runftp.Enabled = True
ftppro.quit.Enabled = True
MsgBox vbCrLf & result, vbokayonly, "Status on HPANB"
End If
Else
'MsgBox "Error happened! please try again...", , "Unexpected Error!"
GoTo reget
End If

' delete result.txt file
Kill ("C:\logs\result.txt")

End If ' end 4th if
Else 'else 3rd if
If (MsgBox("File Transfer ended with error." & vbCrLf & "Please see logsfile.log in c:\logs OR click OK" & vbCrLf & "to see the last FTP opertation status", vbOKCancel, "FTP Error!") = vbOK) Then
ret1 = Shell("notepad c:\logs\output.txt", vbNormalNoFocus)
End If

End If ' end 3rd if

End If ' end 2nd if




End If 'end 1st if

err1:
If (Err.Number = 13) Then
MsgBox "Please make sure of the Branch code!", , "Branch Code Error!"
End If

endit:


End Sub


