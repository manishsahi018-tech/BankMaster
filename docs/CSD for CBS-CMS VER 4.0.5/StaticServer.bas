Attribute VB_Name = "OnlineGatewayRoutines"
Option Explicit
'Error codes Received from static server

Type OnLineStatmentRequest
    msgLen As String * 4
    checkSum As String * 1
    branchName As String * 10
    Source As String * 2
    service As String * 2
    mainAccNo As String * 14
    fromDate As String * 8
    toDate   As String * 8
    lastTransPointer As String * 5
    userId As String * 4
    filler As String * 327
    EOT As String * 1
End Type

Type onDemandStmtTrans
    userId As String
    postDate As String
    valueDate As String
    transAmt As String
    transtype As String
    narrative1 As String
    narrative2 As String
    narrative3 As String
End Type

Type OnLineStatmentResponse
    msgLen As String
    checkSum As String
    branchName As String
    Source As String
    service As String
    accNo As String
    fromDate As String
    toDate As String
    lastTransPtr As String
    custName As String
    address As String
    langCode As String
    branchCode As String
    completionFlag As String
    totNoOfTrans As String
    noOfTransHere As String
    bfBalance As String
    transDetails(50) As onDemandStmtTrans
    responseStatus As String
    decimalPlace As String
    endOfText As String
End Type

Type transEnquiryRequest
    msgLen As String * 4
    checkSum As String * 1
    branchName As String * 10
    Source As String * 2
    service As String * 2
    mainAccNo As String * 14
    fromDate As String * 8
    toDate   As String * 8
    lastTransPointer As String * 5
    filler As String * 52
    userId As String * 4
    filler2 As String * 275
    EOT As String * 1
End Type

Type transEnquiryDetails
    userId As String
    postDate As String
    valueDate As String
    transAmt As String
    transtype As String
    narrative1 As String
    narrative2 As String
    narrative3 As String
    referenceNo As String
    supervisorId As String
    transCounter As String
    stmtFlag As String
End Type

Type transEnquiryResponse
    msgLen As String
    checkSum As String
    branchName As String
    Source As String
    service As String
    accNo As String
    fromDate As String
    toDate As String
    lastTransPtr As String
    custName As String
    address As String
    langCode As String
    branchCode As String
    completionFlag As String
    totNoOfTrans As String
    noOfTransHere As String
    bfBalance As String
    transDetails(50) As transEnquiryDetails
    responseStatus As String
    decimalPlace As String
    endOfText As String
    
End Type

    
Public reqMsg As OnLineStatmentRequest
Public resMsg As OnLineStatmentResponse
Public transReqMsg As transEnquiryRequest
Public transResMsg As transEnquiryResponse
Public gBranch As String
Public oBranchCode As String
Public reportLang As String
Public reportPath As String
Public OnlinePort As Integer
Public StaticPort As Integer
Public onlineHostName As String
Public OconnectTimeOut As Variant
Public OreceiveTimeOut As Variant
Public onlineHostConnected As Boolean
Public transDisplayed As Integer
Public transToBeDisplayed As Integer

Public Function ConnectServer(socket As Winsock, timer As timer, hostName As String, port As Integer) As String
    
    socket.RemoteHost = hostName
    socket.RemotePort = port
    HostConnected = False
    TimeOutFlag = False
    timer.Interval = 60000
    timer.Enabled = True
    Err.Number = 0
    socket.Connect
    If Err.Number <> 0 Then
        MsgBox (errConnectProblem(UserLang) + Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + errCallHeadOffice1(UserLang))
        timer.Interval = 0 'deactivate the timer
        socket.Close
        On Error GoTo 0
        ConnectServer = LocalCommsError
        Exit Function
    End If
    Do While (HostConnected = False And TimeOutFlag = False)
       DoEvents
    Loop
    If HostConnected = False And TimeOutFlag = True Then
        MsgBox (errConnectProblem(UserLang) + Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errCallHeadOffice1(UserLang))
        timer.Interval = 0 'deactivate the timer
        socket.Close
        On Error GoTo 0
        ConnectServer = LocalCommsError
        Exit Function
    End If
    timer.Interval = 0
    timer.Enabled = False
    On Error GoTo 0
    ConnectServer = Success
End Function
Public Function HandleOnlineTraffic(socket As Winsock, timer As timer, hostName As String, port As Integer) As String
    
    Dim reLoginMsg, strmsglen As String
    ' send message
    MsgWouldBlock = False
    TimeOutFlag = False
    DataReceivedFlag = False
    timer.Interval = ReceiveTimeOut
    timer.Enabled = True
    
    Err.Number = 0
    On Error Resume Next
    SendMsg = windowToAsmo(SendMsg)
    LogData "Message sent to Online gateway : " & SendMsg
    socket.SendData SendMsg
    If Err.Number <> 0 Then
       MsgBox (errMsgSendError(UserLang) _
          + Chr(13) + errHostName(UserLang) + hostName + "; " + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        socket.Close
        If ConnectServer(socket, timer, hostName, port) = Success Then
           MsgBox (errTryAgain(UserLang))
        End If
        Err.Number = 0
        On Error GoTo 0
        HandleOnlineTraffic = LocalCommsError
        timer.Enabled = False
        Exit Function
    End If
    If TimeOutFlag = True Then
       MsgBox (errTimeOut(UserLang) + errMsgSendError(UserLang) + _
          Chr(13) + errHostName(UserLang) + hostName + ";" + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + errEnterToContinue(UserLang))
        socket.Close
        If ConnectServer(socket, timer, hostName, port) = Success Then
           MsgBox (errTryAgain(UserLang))
        End If
        On Error GoTo 0
        HandleOnlineTraffic = LocalCommsError
        Exit Function
    End If
    
    ' start receving
    timer.Enabled = False
    TimeOutFlag = False
    DataReceivedFlag = False
    timer.Interval = ReceiveTimeOut     'OreceiveTimeOut
    timer.Enabled = True
    Do While (DataReceivedFlag = False And TimeOutFlag = False)
         DoEvents
    Loop
    If DataReceivedFlag = False And TimeOutFlag = True Then
       MsgBox (errTimeOut(UserLang) + errMsgReceiveError(UserLang) _
          + Chr(13) + errHostName(UserLang) + hostName + "; " + errPortNo(UserLang) + CStr(port) _
          + Chr(13) + CStr(Err.Number) + " : " + Err.Description _
          + Chr(13) + errEnterToContinue(UserLang))
        socket.Close
        If ConnectServer(socket, timer, hostName, port) = Success Then
           MsgBox (errTryAgain(UserLang))
        End If
        timer.Enabled = False
        On Error GoTo 0
        HandleOnlineTraffic = LocalCommsError
        Exit Function
    End If
    timer.Enabled = False
    
    RecvStr = asmoToWindow(RecvStr)
    LogData "Received from Online gateway  : " & RecvStr
    'Received the message; parse it to the required variables
    If Mid$(SendMsg, 18, 2) = "11" Then
       If parseTransMessage = Success Then
          HandleOnlineTraffic = Success
       End If
    Else
       If parseStmtMessage = Success Then
          HandleOnlineTraffic = Success
       End If
    End If
End Function
Public Function parseStmtMessage() As String
    Dim pos, i As Integer
         
    resMsg.checkSum = Mid$(RecvStr, 1, 1)
    resMsg.branchName = Mid$(RecvStr, 2, 10)
    resMsg.Source = Mid$(RecvStr, 12, 2)
    resMsg.service = Mid$(RecvStr, 14, 2)
    resMsg.accNo = Mid$(RecvStr, 16, 14)
    resMsg.fromDate = Mid$(RecvStr, 30, 8)
    resMsg.toDate = Mid$(RecvStr, 38, 8)
    resMsg.lastTransPtr = Mid$(RecvStr, 46, 5)
    resMsg.custName = Mid$(RecvStr, 51, 30)
    resMsg.address = Mid$(RecvStr, 81, 60)
    resMsg.langCode = Mid$(RecvStr, 141, 1)
    resMsg.branchCode = Mid$(RecvStr, 142, 4)
    resMsg.completionFlag = Mid$(RecvStr, 146, 1)
    resMsg.totNoOfTrans = Mid$(RecvStr, 147, 5)
    resMsg.noOfTransHere = Mid$(RecvStr, 152, 3)
    On Error Resume Next
    resMsg.bfBalance = Mid$(RecvStr, 155, 15)
    pos = 170
    For i = 1 To CInt(resMsg.noOfTransHere)
        resMsg.transDetails(i).userId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        resMsg.transDetails(i).postDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        resMsg.transDetails(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        resMsg.transDetails(i).transtype = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        resMsg.transDetails(i).transAmt = Mid$(RecvStr, pos, 15)
        pos = pos + 15
        resMsg.transDetails(i).narrative1 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
        resMsg.transDetails(i).narrative2 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
        resMsg.transDetails(i).narrative3 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
    Next
    resMsg.responseStatus = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    resMsg.decimalPlace = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    resMsg.endOfText = Mid$(RecvStr, pos, 1)
    parseStmtMessage = Success
        
End Function
Public Function parseTransMessage() As String
    Dim pos, i As Integer
    Dim ptr As Integer
    
    ptr = InStr(RecvStr, "'")
    Do While ptr > 0
       Mid$(RecvStr, ptr, 1) = "`"
       ptr = InStr(ptr, RecvStr, "'")
    Loop
          
    transResMsg.checkSum = Mid$(RecvStr, 1, 1)
    transResMsg.branchName = Mid$(RecvStr, 2, 10)
    transResMsg.Source = Mid$(RecvStr, 12, 2)
    transResMsg.service = Mid$(RecvStr, 14, 2)
    transResMsg.accNo = Mid$(RecvStr, 16, 14)
    transResMsg.fromDate = Mid$(RecvStr, 30, 8)
    transResMsg.toDate = Mid$(RecvStr, 38, 8)
    transResMsg.lastTransPtr = Mid$(RecvStr, 46, 5)
    transResMsg.custName = Mid$(RecvStr, 51, 30)
    transResMsg.address = Mid$(RecvStr, 81, 60)
    transResMsg.langCode = Mid$(RecvStr, 141, 1)
    transResMsg.branchCode = Mid$(RecvStr, 142, 4)
    transResMsg.completionFlag = Mid$(RecvStr, 146, 1)
    transResMsg.totNoOfTrans = Mid$(RecvStr, 147, 5)
    transResMsg.noOfTransHere = Mid$(RecvStr, 152, 3)
    transDisplayed = 0  ' required for transaction display
    transResMsg.bfBalance = Mid$(RecvStr, 155, 15)
    pos = 170
    For i = 1 To CInt(transResMsg.noOfTransHere)
        transResMsg.transDetails(i).userId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        transResMsg.transDetails(i).postDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        transResMsg.transDetails(i).valueDate = Mid$(RecvStr, pos, 8)
        pos = pos + 8
        transResMsg.transDetails(i).transtype = Mid$(RecvStr, pos, 2)
        pos = pos + 2
        transResMsg.transDetails(i).transAmt = Mid$(RecvStr, pos, 15)
        pos = pos + 15
        transResMsg.transDetails(i).narrative1 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
        transResMsg.transDetails(i).narrative2 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
        transResMsg.transDetails(i).narrative3 = Mid$(RecvStr, pos, 25)
        pos = pos + 25
        transResMsg.transDetails(i).referenceNo = Mid$(RecvStr, pos, 10)
        pos = pos + 10
        transResMsg.transDetails(i).supervisorId = Mid$(RecvStr, pos, 3)
        pos = pos + 3
        transResMsg.transDetails(i).transCounter = Mid$(RecvStr, pos, 5)
        pos = pos + 5
        transResMsg.transDetails(i).stmtFlag = Mid$(RecvStr, pos, 1)
        pos = pos + 1
    Next
    transResMsg.responseStatus = Mid$(RecvStr, pos, 2)
    pos = pos + 2
    transResMsg.decimalPlace = Mid$(RecvStr, pos, 1)
    pos = pos + 1
    transResMsg.endOfText = Mid$(RecvStr, pos, 1)
    parseTransMessage = Success
        
End Function

Public Sub getStmtRegistrySettings()
' Get host name from registry
If GetSetting("OnLineStatement", "Startup", "Host") = "" Then
   SaveSetting "OnLineStatement", "Startup", "Host", "ndev"
End If
onlineHostName = GetSetting("OnLineStatement", "Startup", "Host")

If onlineHostName = "" Then
    MsgBox ("Could not get host name from registry")
    End
End If

' get onlineGateway port number from registry
If GetSetting("OnLineStatement", "Startup", "OnlinePort") = "" Then
   SaveSetting "OnLineStatement", "Startup", "OnlinePort", 2006
End If
OnlinePort = GetSetting("OnLineStatement", "Startup", "OnlinePort")
If OnlinePort = 0 Then
    MsgBox ("Could not get Online port # from registry")
    End
End If

' get connect timeout from registry
If GetSetting("OnLineStatement", "Startup", "ConnectTimeOut") = "" Then
   SaveSetting "OnLineStatement", "Startup", "ConnectTimeOut", 60000 '30 seconds
End If
OconnectTimeOut = GetSetting("OnLineStatement", "Startup", "ConnectTimeOut")
If ConnectTimeOut = 0 Then
    MsgBox ("Could not get ConnectTimeOut from registry; defaulted to 30 seconds")
    OconnectTimeOut = 60000
End If

If GetSetting("OnLineStatement", "Startup", "BranchName") = "" Then
   SaveSetting "OnLineStatement", "Startup", "BranchName", "Murabba  "
End If
gBranch = GetSetting("OnLineStatement", "Startup", "BranchName")

If gBranch = "" Then
   MsgBox ("Could not get Branch name from registry, defaulted to Murabba")
   gBranch = "Murabba"
End If

If GetSetting("OnLineStatement", "Startup", "Branchcode") = "" Then
   SaveSetting "OnLineStatement", "Startup", "Branchcode", "0101"
End If
oBranchCode = GetSetting("OnLineStatement", "Startup", "BranchCode")

If oBranchCode = "" Then
   MsgBox ("Could not get Branch Code from registry, defaulted to 0101")
   oBranchCode = "0101"
End If

' get receive timeout from registry
If GetSetting("OnLineStatement", "Startup", "ReceiveTimeOut") = "" Then
   SaveSetting "OnLineStatement", "Startup", "ReceiveTimeOut", 60000 '60 seconds
End If
OreceiveTimeOut = GetSetting("OnLineStatement", "Startup", "ReceiveTimeOut")
If OreceiveTimeOut = 0 Then
    MsgBox ("Could not get ReceiveTimeOut from registry; defaulted to 60 seconds")
    OreceiveTimeOut = 60000
End If

End Sub

