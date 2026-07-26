Attribute VB_Name = "anbLibrary"
Option Explicit
Public nfCodePage As String, wCodePage As String
Public branchPowerEnv As String

Public Function ConnectStaticServer(staticSocket As Winsock, staticTimer As timer) As String
    staticSocket.RemoteHost = hostName
    staticSocket.RemotePort = port
    HostConnected = False
    TimeOutFlag = False
    staticTimer.Interval = ConnectTimeOut
    staticTimer.Enabled = True
    Err.Number = 0
    On Error Resume Next
    LogData "About to connect to Static Server"
    staticSocket.Connect
    If Err.Number <> 0 Then
        LogData errConnectProblem(1) + "   " + errHostName(1) + ":" + hostName + "(" + CStr(port) + ")"
        MsgBox (errConnectProblem(UserLang) + Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + errCallHeadOffice(UserLang))
        staticTimer.Interval = 0 'deactivate the timer
        staticSocket.Close
        On Error GoTo 0
        ConnectStaticServer = LocalCommsError
        Exit Function
    End If
    Do While (HostConnected = False And TimeOutFlag = False)
       DoEvents
    Loop
    If HostConnected = False And TimeOutFlag = True Then
        LogData errConnectProblem(1) + "   " + CStr(Err.Number) + "(" + Err.Description + ")"
        MsgBox (errConnectProblem(UserLang) + Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errCallHeadOffice(UserLang))
        staticTimer.Interval = 0 'deactivate the timer
        staticSocket.Close
        On Error GoTo 0
        ConnectStaticServer = LocalCommsError
        Exit Function
    End If
    staticTimer.Interval = 0
    staticTimer.Enabled = False
    On Error GoTo 0
'   LOGON should be part of it
    ConnectStaticServer = Success
End Function
Public Function HandleMsgTraffic(staticSocket As Winsock, staticTimer As timer) As String
    
    Dim reLoginMsg, strmsglen As String
    ' send message
    MsgWouldBlock = False
    TimeOutFlag = False
    DataReceivedFlag = False
    staticTimer.Interval = ReceiveTimeOut
    staticTimer.Enabled = True
    
    Err.Number = 0
    On Error Resume Next
    SendMsg = windowToAsmo(SendMsg)
    staticSocket.SendData SendMsg
     If Err.Number <> 0 Then
       LogData errMsgSendError(1) + "  " & str(Err.Number) & " (" & Err.Description & ") , hostname =" + hostName + "port#" + CStr(port)
       MsgBox (errMsgSendError(UserLang) _
          + Chr(13) + errHostName(UserLang) + hostName + "; " + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + str(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        staticSocket.Close
        If ConnectStaticServer(staticSocket, staticTimer) = Success Then
            reLoginMsg = "00000097" + gBranchCode + Format(gUserId, "!@@@@@@@@@@")
            strmsglen = Format(Len(reLoginMsg), "000000")
            Mid$(reLoginMsg, 1, 6) = strmsglen
            LogData "Relogin message sent to server : [" + reLoginMsg + "]"
            staticSocket.SendData reLoginMsg
            MsgBox (errTryAgain(UserLang))
        End If
        Err.Number = 0
        On Error GoTo 0
        HandleMsgTraffic = LocalCommsError
        staticTimer.Enabled = False
        Exit Function
    End If
    If TimeOutFlag = True Then
       LogData errTimeOut(1) + errMsgSendError(1) + "  Host name:" + hostName + "  Port#" + CStr(port)
       MsgBox (errTimeOut(UserLang) + errMsgSendError(UserLang) + _
          Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + errEnterToContinue(UserLang))
        staticSocket.Close
        If ConnectStaticServer(staticSocket, staticTimer) = Success Then
            reLoginMsg = "00000097" + gBranchCode + Format(gUserId, "!@@@@@@@@@@")
            strmsglen = Format(Len(reLoginMsg), "000000")
            Mid$(reLoginMsg, 1, 6) = strmsglen
            LogData "Relogin message sent to server : [" + reLoginMsg + "]"
            staticSocket.SendData reLoginMsg
            MsgBox (errTryAgain(UserLang))
        End If
        On Error GoTo 0
        HandleMsgTraffic = LocalCommsError
        Exit Function
    End If
    
    ' start receving
    staticTimer.Enabled = False
    TimeOutFlag = False
    DataReceivedFlag = False
    staticTimer.Interval = ReceiveTimeOut
    staticTimer.Enabled = True
    Do While (DataReceivedFlag = False And TimeOutFlag = False)
         DoEvents
    Loop
    If DataReceivedFlag = False And TimeOutFlag = True Then
       LogData errTimeOut(1) + errMsgReceiveError(1) + "  hostname:" + hostName + "  Port#" + CStr(port)
       LogData "err.number :" + CStr(Err.Number) + " (" + Err.Description + ")"
       MsgBox (errTimeOut(UserLang) + errMsgReceiveError(UserLang) _
          + Chr(13) + errHostName(UserLang) + hostName + "; " + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        staticSocket.Close
        If ConnectStaticServer(staticSocket, staticTimer) = Success Then
            reLoginMsg = "00000097" + gBranchCode + Format(gUserId, "!@@@@@@@@@@")
            strmsglen = Format(Len(reLoginMsg), "000000")
            Mid$(reLoginMsg, 1, 6) = strmsglen
            LogData "Relogin message sent to server : [" + reLoginMsg + "]"
            staticSocket.SendData reLoginMsg
            MsgBox (errTryAgain(UserLang))
        End If
        staticTimer.Enabled = False
        On Error GoTo 0
        HandleMsgTraffic = LocalCommsError
        Exit Function
    End If
    staticTimer.Enabled = False
    
    RecvStr = asmoToWindow(RecvStr)
    'Received the message; parse it to the required variables
    If Mid$(SendMsg, 7, 2) = "00" Or Mid$(SendMsg, 7, 2) = "01" Then
       If ParseLoginMessage = Success Then
          HandleMsgTraffic = Success
       ElseIf recvLoginMsg.status = CommsError Or recvLoginMsg.status = timeOut Then
          LogData errErrorAtServer(1) + recvLoginMsg.status
          MsgBox (errErrorAtServer(UserLang))
          staticSocket.Close
          If ConnectStaticServer(staticSocket, staticTimer) = LocalCommsError Then
             recvLoginMsg.eRemarks = errConnectProblem(UserLang)
             HandleMsgTraffic = LocalCommsError
             Exit Function
          End If
          HandleMsgTraffic = recvLoginMsg.status
       End If
    Else
       If ParseMessage = Success Then
          HandleMsgTraffic = Success
       ElseIf recvMsg.status = CommsError Or recvMsg.status = timeOut Or recvMsg.status = NotLogon Then
          MsgBox (errErrorAtServer(UserLang))
          staticSocket.Close
          If ConnectStaticServer(staticSocket, staticTimer) = LocalCommsError Then
             recvMsg.remarks = errConnectProblem(UserLang)
             HandleMsgTraffic = LocalCommsError
             Exit Function
          End If
          HandleMsgTraffic = recvMsg.status
       End If
    End If
End Function

Public Sub getRegistrySettings()
' Get host name from registry
If GetSetting("StaticData", "Startup", "Host") = "" Then
   SaveSetting "StaticData", "Startup", "Host", "hpanb"
End If
hostName = GetSetting("StaticData", "Startup", "Host")

If hostName = "" Then
    MsgBox ("Could not get host name from registry")
    End
End If
' get port number from registry
If GetSetting("StaticData", "Startup", "Port") = "" Then
   SaveSetting "StaticData", "Startup", "Port", 8101
End If
port = GetSetting("StaticData", "Startup", "Port")
If port = 0 Then
    MsgBox ("Could not get host name from registry")
    End
End If

' get connect timeout from registry
If GetSetting("StaticData", "Startup", "ConnectTimeOut") = "" Then
   SaveSetting "StaticData", "Startup", "ConnectTimeOut", 30000 '30 seconds
End If
ConnectTimeOut = GetSetting("StaticData", "Startup", "ConnectTimeOut")
If ConnectTimeOut = 0 Then
    MsgBox ("Could not get ConnectTimeOut from registry; defaulted to 30 seconds")
    ConnectTimeOut = 30000
End If

' get receive timeout from registry
If GetSetting("StaticData", "Startup", "ReceiveTimeOut") = "" Then
   SaveSetting "StaticData", "Startup", "ReceiveTimeOut", 60000 '60 seconds
End If
ReceiveTimeOut = GetSetting("StaticData", "Startup", "ReceiveTimeOut")
If ReceiveTimeOut = 0 Then
    MsgBox ("Could not get ReceiveTimeOut from registry; defaulted to 60 seconds")
    ReceiveTimeOut = 60000
End If
' get dbdir from registry
If GetSetting("staticdata", "Startup", "dbpath") = "" Then
   SaveSetting "StaticData", "Startup", "dbpath", "c:\static\controldb\controldb.mdb"
End If
dbPath = GetSetting("StaticData", "Startup", "dbpath")
If dbPath = "" Then
    MsgBox ("Could not get dbpath from registry; defaulted to c:\static\controldb\controldb.mdb")
    dbPath = "c:\static\controldb\controldb.mdb"
End If

' get BranchPowerDb dir from registry
If GetSetting("staticdata", "Startup", "bpdbpath") = "" Then
   SaveSetting "StaticData", "Startup", "bpdbpath", "g:\bpower\data\"
End If
dbPath = GetSetting("StaticData", "Startup", "dbpath")
If dbPath = "" Then
    MsgBox ("Could not get bpdbpath from registry; defaulted to g:\bpower\data\")
    bpdbPath = "g:\bpower\data\"
End If

' get Startup Language from registry
If GetSetting("staticdata", "Startup", "startupLang") = "" Then
   SaveSetting "StaticData", "Startup", "startupLang", "1"
End If
startupLang = GetSetting("StaticData", "Startup", "startupLang")
If startupLang = "" Then
    MsgBox ("Could not get startup Language from registry; defaulted to 1")
    startupLang = "1"
End If

' get Branch Code from registry
If GetSetting("staticdata", "Startup", "rBranchCode") = "" Then
   SaveSetting "StaticData", "Startup", "rBranchCode", "0173"
End If
rBranchCode = GetSetting("StaticData", "Startup", "rbranchcode")
If rBranchCode = "" Then
    MsgBox ("Could not get Branch Code from registry; defaulted to 0499")
    rBranchCode = "0173"
End If

End Sub
Public Sub readCfgFile()
     Dim tmpStr As String
     Dim iniPath As String
     Dim objFs, objReadFile
     
     iniPath = App.Path + "\statdata.ini"
     On Error GoTo err_handler
     Set objFs = CreateObject("Scripting.FileSystemObject")
     Set objReadFile = objFs.OpenTextFile(iniPath, 1)
     
     hostName = IniRead(iniPath, "host")
     If Len(RTrim(hostName)) = 0 Then
        MsgBox "Host name is not defined in the configuration file.."
        End
     End If
     
     ' get port number from ini file
    port = IniRead(iniPath, "Port")
    If port = 0 Then
        MsgBox ("Could not get port name from ini file")
        End
    End If
    
    ' get connect timeout from ini file
    ConnectTimeOut = IniRead(iniPath, "ConnectTimeOut")
    If ConnectTimeOut = 0 Then
        MsgBox ("Could not get ConnectTimeOut from ini file; defaulted to 30 seconds")
        ConnectTimeOut = 30000
    End If
    
    ' get receive timeout from ini file
    ReceiveTimeOut = IniRead(iniPath, "ReceiveTimeOut")
    If ReceiveTimeOut = 0 Then
        MsgBox ("Could not get ReceiveTimeOut from ini file; defaulted to 60 seconds")
        ReceiveTimeOut = 60000
    End If
    ' get dbpath from ini file
    dbPath = IniRead(iniPath, "dbpath")
    If dbPath = "" Then
        MsgBox ("Could not get dbpath from ini file; defaulted to c:\static\controldb\controldb.mdb")
        dbPath = "c:\static\controldb\controldb.mdb"
    End If
    
    ' get transdbpath from ini file
    transDbPath = IniRead(iniPath, "transdbpath")
    If transDbPath = "" Then
        MsgBox ("Could not get transdbpath from ini file; defaulted to c:\static\controldb\transdb.mdb")
        transDbPath = "c:\static\controldb\transdb.mdb"
    End If
    
    ' get BranchPowerDb dir from ini file
    bpdbPath = IniRead(iniPath, "bpdbpath")
    If bpdbPath = "" Then
        MsgBox ("Could not get bpdbpath from ini file; defaulted to i:\bpower\data\")
        bpdbPath = "i:\bpower\data\"
    End If
    
    ' get Startup Language from ini file
    startupLang = IniRead(iniPath, "startupLang")
    If startupLang = "" Then
        MsgBox ("Could not get startup Language from ini file; defaulted to 1")
        startupLang = "1"
    End If
    
    ' get Branch Code from ini file
    rBranchCode = IniRead(iniPath, "rbranchcode")
    If rBranchCode = "" Then
        MsgBox ("Could not get Branch Code from ini file; defaulted to 0499")
        rBranchCode = "0499"
    End If
    
    ' get stmtpath dir from ini file
    stmtPath = IniRead(iniPath, "stmtpath")
    If stmtPath = "" Then
        'MsgBox ("Could not get stmtpath from ini file; defaulted to g:\hist_dat\")
        stmtPath = "g:\hist_dat\"
    End If
    stmtPath = Trim(stmtPath)
    
    ' get reqpath dir from ini file for statement file sent from Head office
    reqPath = IniRead(iniPath, "reqpath")
    If reqPath = "" Then
        'MsgBox ("Could not get reqpath from ini file; defaulted to g:\hist_dat\req\")
        reqPath = "g:\hist_dat\req\"
    End If
    reqPath = Trim(reqPath)
    
    ' get utilpath dir from ini file
    utilPath = IniRead(iniPath, "utilpath")
    If utilPath = "" Then
       'MsgBox ("Could not get utilpath from ini file; defaulted to i:\hist\")
       utilPath = "i:\hist\"
    End If
    utilPath = Trim(utilPath)
    
    ' get outpath dir from ini file
    outPath = IniRead(iniPath, "outpath")
    If outPath = "" Then
       'MsgBox ("Could not get outpath from ini file; defaulted to c:\hist\")
       outPath = "c:\hist\"
    End If
    outPath = Trim(outPath)
    
 ' Get Information for Online Gateway
    
 ' Get online host name from ini file
  onlineHostName = IniRead(iniPath, "onlineHost")
  If onlineHostName = "" Then
     MsgBox ("Could not get host name from ini file")
     End
  End If

' get onlineGateway port number from ini file
 OnlinePort = IniRead(iniPath, "onlineport")
 If OnlinePort = 0 Then
     MsgBox ("Could not get Online port # from ini file")
     End
 End If

' get connect timeout from ini file
OconnectTimeOut = IniRead(iniPath, "oConnectTimeOut")
If OconnectTimeOut = 0 Then
    MsgBox ("Could not get oConnectTimeOut from ini file; defaulted to 60 seconds")
    OconnectTimeOut = 60000
End If

gBranch = IniRead(iniPath, "branchName")

If gBranch = "" Then
   MsgBox ("Could not get Branch name from ini file, defaulted to Murabba")
   gBranch = "Murabba"
End If

oBranchCode = IniRead(iniPath, "oBranchCode")

If oBranchCode = "" Then
   MsgBox ("Could not get Branch Code from ini file, defaulted to 0101")
   oBranchCode = "0101"
End If

' get receive timeout from ini file
OreceiveTimeOut = IniRead(iniPath, "oReceiveTimeOut")
If OreceiveTimeOut = 0 Then
    MsgBox ("Could not get ReceiveTimeOut from ini file; defaulted to 60 seconds")
    OreceiveTimeOut = 60000
End If

' get reportdir from ini file
reportPath = IniRead(iniPath, "reportPath")
If reportPath = "" Then
   MsgBox ("Could not get reportPath from ini file; defaulted to c:\reports\")
   reportPath = "c:\reports\"
End If
reportPath = Trim(reportPath)

branchPowerEnv = IniRead(iniPath, "branchpower")
If branchPowerEnv = "" Then
   branchPowerEnv = "WINDOWS"
End If

stmtArabicChars = IniRead(iniPath, "STMTARABICCHARS")
If stmtArabicChars = "" Then
   stmtArabicChars = "   "
End If

cardPrinterName = IniRead(iniPath, "CARDPRINTER")
If cardPrinterName = "" Then
   cardPrinterName = "Smart Driver"
End If

receiptPrinterName = IniRead(iniPath, "RECEIPTPRINTER")
If receiptPrinterName = "" Then
   receiptPrinterName = "SEDCO Forms Pro 45"
End If


' get historical host from ini file
histHost = IniRead(iniPath, "HISTHOST")
If histHost = "" Then
   'MsgBox ("Could not get histHost from ini file; defaulted to hpanb")
   histHost = "hpanb"
End If
histHost = Trim(histHost)

' get historical Userid  from ini file
histUser = IniRead(iniPath, "HISTUSER")
If histUser = "" Then
   'MsgBox ("Could not get histUser from ini file; defaulted to outctl")
   histHost = "static"
End If
histUser = Trim(histUser)

On Error GoTo 0
Exit Sub

err_handler:

If Err.Number = 53 Or Err.Number = 76 Then
   MsgBox "Configuaration file (statdata.ini) does not exist in " & App.Path
   End
Else
   Resume Next
End If

End Sub
Public Function asmoToWindow(asmoArabicStr As String) As String
    Dim windowArabicStr As String
    Dim i As Integer
    Dim ch As String * 1
    For i = 1 To Len(asmoArabicStr)
        ch = Mid(asmoArabicStr, i, 1)
        If Asc(ch) >= 215 And Asc(ch) <= 218 Then
           windowArabicStr = windowArabicStr + Chr(Asc(ch) + 1)
        ElseIf Asc(ch) >= 224 And Asc(ch) <= 227 Then
           windowArabicStr = windowArabicStr + Chr(Asc(ch) - 4)
        ElseIf Asc(ch) = 228 Then
           windowArabicStr = windowArabicStr + Chr(225)
        ElseIf Asc(ch) >= 229 And Asc(ch) <= 232 Then
           windowArabicStr = windowArabicStr + Chr(Asc(ch) - 2)
        ElseIf Asc(ch) >= 233 And Asc(ch) <= 234 Then
           windowArabicStr = windowArabicStr + Chr(Asc(ch) + 3)
        Else
           windowArabicStr = windowArabicStr + ch
        End If
    Next i
    asmoToWindow = windowArabicStr
End Function

Public Function windowToAsmo(windowArabicStr As String) As String
    Dim asmoArabicStr As String
    Dim i As Integer
    Dim ch As String * 1
    For i = 1 To Len(windowArabicStr)
        ch = Mid(windowArabicStr, i, 1)
        If Asc(ch) >= 216 And Asc(ch) <= 219 Then
           asmoArabicStr = asmoArabicStr + Chr(Asc(ch) - 1)
        ElseIf Asc(ch) >= 220 And Asc(ch) <= 223 Then
           asmoArabicStr = asmoArabicStr + Chr(Asc(ch) + 4)
        ElseIf Asc(ch) = 225 Then
           asmoArabicStr = asmoArabicStr + Chr(228)
        ElseIf Asc(ch) >= 227 And Asc(ch) <= 230 Then
           asmoArabicStr = asmoArabicStr + Chr(Asc(ch) + 2)
        ElseIf Asc(ch) >= 236 And Asc(ch) <= 237 Then
           asmoArabicStr = asmoArabicStr + Chr(Asc(ch) - 3)
        Else
           asmoArabicStr = asmoArabicStr + ch
        End If
    Next i
    windowToAsmo = asmoArabicStr
End Function

Public Function Encrypt(password As String) As String
    Dim key As String
    Dim asciiValue As String
    Dim i, length, mode As Integer
    Dim c1, c2, c3 As Variant
    
    length = Len(password)
    key = ""
    mode = (length Mod 4 + 1) * 15
    For i = 1 To length
'        c1 = Mid$(password, i, 1)
'        c2 = Asc(c1)
'        c3 = Chr$(c2 + mode)
'        key = key + c3
        key = key + Chr$(Asc(Mid$(password, i, 1)) + mode)
        asciiValue = asciiValue + "," + CStr(Asc(Mid$(password, i, 1)) + mode)
    Next i
    Encrypt = StrReverse(key)
 End Function
Public Function Decrypt(password As String) As String
    Dim key As String
        
    Dim asciiValue As String
    
    Dim i, length, mode As Integer
    Dim c1, c2, c3 As Variant
    
    length = Len(password)
    key = ""
    mode = (length Mod 4 + 1) * 15
    For i = 1 To length
        c1 = Mid$(password, i, 1)
        c2 = Asc(c1)
        c3 = Chr$(c2 + mode)
        key = key + c3
       ' key = key & Chr$(Asc(Mid$(password, i, 1)) - mode)
       ' key1 = key1 & key
        'asciiValue = asciiValue + "," + CStr(Asc(Mid$(password, i, 1)) - mode)
    Next i
    Decrypt = StrReverse(key)
 End Function

Public Function arabicCharFound(str As String) As Boolean
    Dim i As Integer
    
    If Len(RTrim(str)) = 0 Then
       arabicCharFound = False
       Exit Function
    End If
     
    For i = 1 To Len(str)
        If Asc(Mid$(str, i, 1)) >= 128 Then
           arabicCharFound = True
           Exit Function
        End If
    Next
    
    arabicCharFound = False

End Function
Public Function englishCharFound(str As String) As Boolean
    Dim i As Integer
    
    If Len(RTrim(str)) = 0 Then
       englishCharFound = False
       Exit Function
    End If
    
    For i = 1 To Len(str)
        If (Asc(Mid$(str, i, 1)) > 64 And Asc(Mid$(str, i, 1)) < 91) Or _
           (Asc(Mid$(str, i, 1)) > 96 And Asc(Mid$(str, i, 1)) < 123) Then
           englishCharFound = True
           Exit Function
        End If
    Next
    
    englishCharFound = False
        
End Function

Public Function nafithaEnToWindows(Buffer As String) As String

  Dim nafCodePage, wCodePage As String
 
  Dim pos As Integer, i As Integer
  Dim strLen As Integer, TBuffer As String
  
  nafCodePage = "æìëáóòðïùäãâåêéý¬õ«àøöôíª¥¨çõ«ü­ûèîõõ©©õ§§ñõ¦¦"
  wCodePage = "ÐÖÕËÞÝÛÚåÎÍÌÏÔÓíÈáÇÊäãßØÆÁÄÑáÇìÉæÒÙááÅÅáÃÃÜáÂÂ"
  
   i = 1
   strLen = Len(Buffer)
   TBuffer = ""
  Do While (i <= strLen)
     pos = InStr(nafCodePage, Right$(Left$(Buffer, i), 1))
     If (pos <> 0) Then
       TBuffer = TBuffer + Right$(Left$(wCodePage, pos), 1) ' Replace character
     Else
       TBuffer = TBuffer + Right$(Left$(Buffer, i), 1) ' Replace character
     End If
     i = i + 1
  Loop
  If (strLen > 0) Then
     nafithaEnToWindows = TBuffer
  Else
     nafithaEnToWindows = "!"
  End If
 End Function

Public Sub LogData(strOperation As String)

  Exit Sub

'Create a directory by name log in application path, if it does not exists
 Dim fso, Fold, SubFold, CreaFold, ts
 Set fso = CreateObject("Scripting.FileSystemObject")
 If (Not fso.FolderExists("c:\staticLog")) Then
     Set Fold = fso.GetFolder("c:\")
     Set SubFold = Fold.SubFolders
     Set CreaFold = SubFold.Add("staticLog")
 End If

'Creates a file system object and inserts into it
Dim CreaFile

Set CreaFile = fso.OpenTextFile("c:\staticLog\stclient" & rBranchCode & "_" & Date$ & ".log", ForAppending, True)
CreaFile.WriteLine CStr(Time) & " : " & gUserId & " : " & strOperation
CreaFile.Close
End Sub

Public Function IniRead(strPath As String, strSubKey As String) As String

'Declare string values for storing key and subkey values
Dim strSubKeyValue As String

'Variable for storing and returning value
Dim strReturnValue() As String

'Declare file system object
Dim objFs, objReadFile

Set objFs = CreateObject("Scripting.FileSystemObject")

strSubKeyValue = UCase(Trim(strSubKey))

Set objReadFile = objFs.OpenTextFile(strPath, 1)

Do While objReadFile.AtEndOfStream <> True
    strReturnValue = Split(objReadFile.ReadLine, "=")
    If (UBound(strReturnValue) = 1) Then
        strReturnValue(0) = UCase(strReturnValue(0))
        If (Trim(strReturnValue(0)) = strSubKeyValue) Then
            IniRead = Trim(strReturnValue(1))
            objReadFile.Close
            Exit Function
        End If
    End If
Loop

objReadFile.Close

End Function

Public Function convertDate(ByRef dateStr As String, ByRef fromCalendar, ByRef toCalendar, ByRef dateFormat As String)

Dim savedCal As Integer
Dim tmpDate As Date
Dim tmpStr As String

savedCal = Calendar

Calendar = fromCalendar
tmpDate = CDate(dateStr)
Calendar = toCalendar
tmpStr = CStr(tmpDate)
convertDate = Format(tmpStr, dateFormat)

Calendar = savedCal
End Function
