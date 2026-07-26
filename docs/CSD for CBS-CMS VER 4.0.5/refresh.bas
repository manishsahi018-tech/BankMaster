Attribute VB_Name = "Refresh"
Option Explicit
'Public dbPath As String

Public Sub doRefresh(refreshType As String)
    Dim userId As String * 10
    Dim lastRecCount As String * 5
    Dim strmsglen As String * 6
    Dim respStatus As String * 3
    Dim recType As String * 2
    Dim mQry As String
    Dim i, currentPosition As Integer
    Dim noOfRecs As Integer
    Dim tmpStr As String
    Dim tCode As String
    
    ' Make the cursor as busy
    frmEnquiry.MousePointer = vbHourglass
    
    On Error Resume Next
    If Err.Number <> 0 Then
       MsgBox errLocalDbOpenError(UserLang) ' "Error While opening local Database " + CStr(Err.Number) + "  " + Err.description
       Exit Sub
    End If
    userId = Format(gUserId, "!@@@@@@@@@")
    lastRecCount = "00000"
    CSD_mdiForm.staticStatus.Panels(3).text = errRefreshingLocalDb(UserLang)
    Do While True
        SendMsg = "000069" & "13" & gBranchCode & gBranchCode & userId & refreshType & lastRecCount & "0" ' 0 for refresh from stctltab
        strmsglen = Format(Len(SendMsg), "000000")
        Mid$(SendMsg, 1, 6) = strmsglen
        DataReceivedFlag = False
        If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
           CSD_mdiForm.staticStatus.Panels(3).text = errRefreshError(UserLang)
           LoadError = True
            frmEnquiry.MousePointer = vbDefault
           Exit Sub
        End If
'        recvRefreshMsg.status = Mid$(RecvStr, 1, 3)
'        recvRefreshMsg.service = Mid$(RecvStr, 4, 2)
'        recvRefreshMsg.aRemarks = Mid$(RecvStr, 6, 50)
'        recvRefreshMsg.eRemarks = Mid$(RecvStr, 56, 50)
'        recvRefreshMsg.refreshType = Mid$(RecvStr, 106, 1)
'        recvRefreshMsg.lastRecCount = Mid$(RecvStr, 107, 5)
        respStatus = Mid$(RecvStr, 1, 3)
        If respStatus <> Success Then
            If UserLang = ARABIC Then
                MsgBox "Œÿ√ " & respStatus & " " & Mid$(RecvStr, 6, 50)
            Else
                MsgBox "Error " & respStatus & " " & Mid$(RecvStr, 56, 50)
            End If
            CSD_mdiForm.staticStatus.Panels(3).text = "Problem during refresh; refresh not complete"
            frmEnquiry.MousePointer = vbDefault
            Exit Sub
        End If
        lastRecCount = Mid$(RecvStr, 107, 5)
        On Error Resume Next
        noOfRecs = CInt(Mid$(RecvStr, 112, 2))
        currentPosition = 0
        For i = 1 To noOfRecs
            currentPosition = 124 + (i - 1) * 200 ' from position 114, 10 chars left as blank for
                                                  ' future enhancement; so, started from 124

            recType = Mid$(RecvStr, currentPosition, 2)
            If recType = "BD" Then
               mQry = "update branchinfo set arabicname= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', arabicaddress= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 66, 30)) & " ', englishaddress= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 96, 30)) & " ', citycode= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 126, 4)) & " ', pobox = '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 130, 10)) & " ', zipcode = '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 140, 10)) & "', regioncode = '" & _
                      Mid$(RecvStr, currentPosition + 150, 1) & "', realorpseudo = '" & _
                      Mid$(RecvStr, currentPosition + 178, 1) & "', mainbrcode = '" & _
                      Mid$(RecvStr, currentPosition + 179, 4) & _
                      "' where branchcode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into branchinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 96, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 126, 4)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 130, 10)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 140, 10)) & "','" & _
                    Mid$(RecvStr, currentPosition + 150, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 178, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 179, 4) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "CB" Then
                       mQry = "update cvrbankinfo set arabicname= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', arabicaddress= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 66, 30)) & " ', englishaddress= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 96, 30)) & " ', cvrbankcode= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 126, 14)) & " ', bankaccno= '" & _
                       RTrim(Mid$(RecvStr, currentPosition + 140, 20)) & _
                       "' where recordcode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                 db.Execute (mQry)
                 If db.RecordsAffected = 0 Then
                     mQry = "insert into cvrbankinfo  " & _
                     " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 66, 30)) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 96, 30)) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 126, 14)) & "','" & _
                     RTrim(Mid$(RecvStr, currentPosition + 140, 20)) & "');"
                     db.Execute (mQry)
                 End If
            ElseIf recType = "CT" Then
                mQry = "update cityinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', telAreaCode= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & " ', idIssued= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 68, 1)) & " ', crIssued= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 69, 1)) & _
                         "' where citycode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into cityinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & "','" & _
                    Mid$(RecvStr, currentPosition + 68, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 69, 1) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "NA" Then   ' Country code
                mQry = "update countryinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', isoCode = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & _
                         " ' where countrycode = '" & Mid$(RecvStr, currentPosition + 2, 3) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into countryinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SN" Then   ' Swift Country code
                mQry = "update swiftCountryInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', ibanLength= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & _
                         " ' where countrycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into swiftCountryInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PE" Then  ' SWIFT Transfer purpose
                mQry = "update transferPurposeInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where purposeCode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into transferPurposeInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "XC" Then
           ' code changed by Arshad on 26th feb 2007
            
'                mQry = "update currencyinfo set arabicname = '" & _
'                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname = '" & _
'                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', isoCurrCode = '" & _
'                         RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & "', decimalplace = '" & _
'                         Mid$(RecvStr, currentPosition + 69, 1) & "', arabicshortcode = '" & _
'                         Mid$(RecvStr, currentPosition + 70, 6) & _
'                         "', fxTolerance = '" & Mid$(RecvStr, currentPosition + 76, 1) & _
'                         "' where currencycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                         
                mQry = "update currencyinfo set arabicname = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', isoCurrCode = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & "', decimalplace = '" & _
                         Mid$(RecvStr, currentPosition + 69, 1) & "', arabicshortcode = '" & _
                         Mid$(RecvStr, currentPosition + 70, 6) & _
                         "', TimeDepositAllowed = '" & Mid$(RecvStr, currentPosition + 76, 1) & _
                         "' where currencycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                         
                         ' code change ends here

                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into currencyinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & "','" & _
                    Mid$(RecvStr, currentPosition + 69, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 70, 6) & "','" & _
                    Mid$(RecvStr, currentPosition + 76, 1) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "TT" Then
                mQry = "update titleinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where titlecode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into titleinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "BI" Then
                tCode = Mid$(RecvStr, currentPosition + 192, 1)
                mQry = "update companyIdinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', transType= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & " ', contraAccNo= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 68, 14)) & " ', checkDigitOption= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 82, 1)) & " ', prepaymentAllowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 83, 1)) & " ', prepaymentTypesAllowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 84, 20)) & " ', postpaymentTypesAllowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 104, 20)) & " ', aNarrative1= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 124, 25)) & " ', eNarrative1= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 149, 25)) & " ', cashAccNo= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 174, 14)) & " ', serviceType= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 188, 4)) & " ',  disableBillerId= '" & _
                         IIf(Len(RTrim(tCode)) = 0, "0", tCode) & _
                         " ' where companyId = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into companyIdinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 2)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 68, 14)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 82, 1)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 83, 1)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 84, 20)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 104, 20)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 124, 25)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 149, 25)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 174, 14)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 188, 4)) & "','" & _
                    IIf(Len(RTrim(tCode)) = 0, "0", tCode) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SP" Then   ' SADAD payment type
                mQry = "update sadadPaymentTypeInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', preOrPostpaid = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 1)) & _
                         " ' where sadadPaymentType = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sadadPaymentTypeInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 1)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "ER" Then
                mQry = "update errorInfo set arabicdescription= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 50)) & " ', englishdescription= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 116, 50)) & _
                         " ' where errorCode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into errorinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 50)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 116, 50)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "BS" Then
                mQry = "update businessTypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where businessTypecode = '" & Mid$(RecvStr, currentPosition + 2, 3) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into businessTypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "FM" Then
                ''Added fdValueDateTolerance & tdRenewAllowed fields by Mohit on 22-Feb-2007 as change reported by Arul
                mQry = "update cbsLedgerInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', atmCardToBeIssued = '" & _
                         Mid$(RecvStr, currentPosition + 66, 1) & _
                         "' where ledgercode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into cbsLedgerInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 3) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ','" & _
                    Mid$(RecvStr, currentPosition + 66, 1) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "MM" Then
                ''Added fdValueDateTolerance & tdRenewAllowed fields by Mohit on 22-Feb-2007 as change reported by Arul
                mQry = "update bmledgerinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', accCreationAllowed = '" & _
                         Mid$(RecvStr, currentPosition + 66, 1) & _
                         "',  samaBlockingAccount = '" & _
                         Mid$(RecvStr, currentPosition + 67, 1) & _
                         "', obligationMemo = '" & _
                         Mid$(RecvStr, currentPosition + 68, 1) & _
                         "', timeDepositMemo = '" & _
                         Mid$(RecvStr, currentPosition + 69, 1) & _
                         "' , fdIntRateTolerance = '" & _
                         Mid$(RecvStr, currentPosition + 70, 1) & _
                         "' , tdDebitMemo = '" & _
                         Mid$(RecvStr, currentPosition + 71, 1) & _
                         "' , minTdAmt = '" & _
                         Mid$(RecvStr, currentPosition + 72, 10) & _
                         "' , maxTdPeriod = '" & _
                         Mid$(RecvStr, currentPosition + 82, 1) & "' , atmCardToBeIssued = '" & _
                         Mid$(RecvStr, currentPosition + 83, 1) & _
                         "' , fdValueDateTolerance = '" & Mid$(RecvStr, currentPosition + 84, 3) & _
                         "' , tdRenewAllowed = '" & _
                         Mid$(RecvStr, currentPosition + 87, 1) & _
                         "' , chqBookAllowed = '" & _
                         Mid$(RecvStr, currentPosition + 89, 1) & _
                         "' where ledgercode = '" & Mid$(RecvStr, currentPosition + 2, 3) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into bmledgerinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 3) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ','" & _
                    Mid$(RecvStr, currentPosition + 66, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 67, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 68, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 69, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 70, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 71, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 72, 10) & " ','" & _
                    Mid$(RecvStr, currentPosition + 82, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 83, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 84, 3) & " ','" & _
                    Mid$(RecvStr, currentPosition + 87, 1) & " ','" & _
                    Mid$(RecvStr, currentPosition + 89, 1) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "ED" Then
                mQry = "update educationinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where educationcode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into educationinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PR" Then
                mQry = "update professioninfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where professioncode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into professioninfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PO" Then
                mQry = "update positioninfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where positioncode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into positioninfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "MI" Then
                mQry = "update monthlyincomeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where incomecode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into monthlyincomeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "AS" Then
                mQry = "update accountstatusinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "'," & _
                        "englishname='" & RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "' " & _
                        "where statuscode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into accountstatusinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SF" Then
                mQry = "update statementfrequencyinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where frequencycode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into statementfrequencyinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SG" Then
                mQry = "update segmentationinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where segmentationcode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into segmentationinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "TP" Then
                mQry = "update customertypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where customertypecode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into customertypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "ID" Then
                mQry = "update idinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', displayForUtilityEnq= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 1)) & " ', displayForQuickScreen= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 67, 1)) & _
                         " ' where idcode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into idinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 1)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 67, 1)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "IA" Then
                mQry = "update intappinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where intappcode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into intappinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PK" Then
                mQry = "update packageaccinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where packagetypecode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into packageaccinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PT" Then
                mQry = "update paymenttypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where paymenttype = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into paymenttypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "ST" Then
                mQry = "update sodtypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where ordertype = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sodtypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PM" Then
                mQry = "update paymodeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where paymodecode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into paymodeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "PF" Then   ' Standing order payment frequency code
                mQry = "update payfreqinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where payfreqcode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into payfreqinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SM" Then    ' SAMA main category
                mQry = "update samaMainCategoryInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where maincategorycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into samaMainCategoryInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SS" Then    ' SAMA sub category
                mQry = "update samaSubCategoryInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', samareferenceno= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 10)) & " ', splmemocode= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 76, 3)) & _
                         " ' where subcategorycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into samaSubCategoryInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 10)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 76, 3)) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "CC" Then
                mQry = "update CategoryConfigInfo set arabicShortDesc = '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishShortDesc= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & " ', firstletterdue= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 3)) & " ', secondletterdue= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 69, 3)) & " ', thirdletterdue= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 72, 3)) & " ', crlicensemandatory= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 75, 1)) & " ', accstatusvalueforfreeze= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 76, 1)) & " ', accfreezinggraceperiod= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 77, 3)) & " ', fundmovementperiod= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 80, 3)) & " ', fundmovementperiodvalidflag= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 83, 1)) & " ', fundmovementapplicableflag= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 84, 1)) & " ', reportexpiryownerid= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 85, 1)) & " ', samaapprovalreqd= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 86, 1)) & " ', allownonsaudisignatory= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 87, 1)) & " ', mandatorylicno= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 88, 1)) & " ', allowonlyresidentoperators= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 89, 1)) & " ', accopeningallowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 90, 1)) & " ', checkbookallowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 91, 1)) & " ', secondgraceperiodapplicable= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 92, 1)) & " ', idexpiryactionreqd= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 93, 1)) & " ', atmCardAllowed= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 94, 1)) & _
                         " ' where samaMainCategory = '" & Mid$(RecvStr, currentPosition + 2, 2) & "' and  " & _
                         "         samaSubCategory =  '" & Mid$(RecvStr, currentPosition + 4, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into CategoryConfigInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    Mid$(RecvStr, currentPosition + 4, 2) & "','" & _
                    Mid$(RecvStr, currentPosition + 6, 30) & "','" & _
                    Mid$(RecvStr, currentPosition + 36, 30) & "','" & _
                    Mid$(RecvStr, currentPosition + 69, 3) & "','" & _
                    Mid$(RecvStr, currentPosition + 72, 3) & "','" & _
                    Mid$(RecvStr, currentPosition + 75, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 76, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 77, 3) & "','" & _
                    Mid$(RecvStr, currentPosition + 80, 3) & "','" & _
                    Mid$(RecvStr, currentPosition + 83, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 84, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 85, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 86, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 87, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 88, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 89, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 90, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 91, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 92, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 93, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 94, 1) & "','" & _
                    Mid$(RecvStr, currentPosition + 95, 1) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "DT" Then    ' Documents information
                mQry = "update documentInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where documentcode = '" & Mid$(RecvStr, currentPosition + 2, 3) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into documentInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 3) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "DC" Then    ' Category based Documents information
                mQry = "update categorydocInfo set documents= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 60)) & _
                         " ' where maincategorycode = '" & Mid$(RecvStr, currentPosition + 2, 2) & _
                         " ' and   subcategorycode  = '" & Mid$(RecvStr, currentPosition + 4, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into categorydocInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 2) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 4, 2)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 60)) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "TR" Then  ' BM Transaction Type
                mQry = "update transTypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where transtypecode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into transtypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "RC" Then    ' Account status change reason
                mQry = "update reasoncodeInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where reasoncode = '" & Mid$(RecvStr, currentPosition + 2, 2) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into reasoncodeInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 3) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "RS" Then    ' Returned reason
                mQry = "update returnedReasonInfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where reasoncode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into returnedReasonInfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                    "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "RQ" Then   ' card request type information
                mQry = "update requesttypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & _
                         " ' where idcode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into requesttypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "LT" Then   ' Letter type information
                mQry = "update lettertypeinfo set arabicname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & " ', englishname= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "', shortcode= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 66, 4)) & "', lookupplace= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 70, 1)) & "', DespatchedToBranch= '" & _
                         RTrim(Mid$(RecvStr, currentPosition + 71, 1)) & _
                         " ' where lettertypecode = '" & Mid$(RecvStr, currentPosition + 2, 1) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into lettertypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 1) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 6, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 36, 30)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 66, 4)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 70, 1)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 71, 1)) & "');"
                    db.Execute (mQry)
                End If
            End If
        Next i
        If noOfRecs < 10 Then
            Exit Do
        End If
        CSD_mdiForm.staticStatus.Panels(3).text = errRefreshingLocalDb(UserLang)
    Loop
    
    ' Now , refresh records from SADAD control file
    lastRecCount = "00000"
    Do While True
        SendMsg = "000069" & "13" & gBranchCode & gBranchCode & userId & refreshType & lastRecCount & "1" ' 1 for refresh from stsadctl
        strmsglen = Format(Len(SendMsg), "000000")
        Mid$(SendMsg, 1, 6) = strmsglen
        DataReceivedFlag = False
        If HandleMsgTraffic(frmEnquiry.tcpClient, frmEnquiry.Timer1) = LocalCommsError Then
           CSD_mdiForm.staticStatus.Panels(3).text = errRefreshError(UserLang)
           LoadError = True
           frmEnquiry.MousePointer = vbDefault
           Exit Sub
        End If
'        recvRefreshMsg.status = Mid$(RecvStr, 1, 3)
'        recvRefreshMsg.service = Mid$(RecvStr, 4, 2)
'        recvRefreshMsg.aRemarks = Mid$(RecvStr, 6, 50)
'        recvRefreshMsg.eRemarks = Mid$(RecvStr, 56, 50)
'        recvRefreshMsg.refreshType = Mid$(RecvStr, 106, 1)
'        recvRefreshMsg.lastRecCount = Mid$(RecvStr, 107, 5)
        respStatus = Mid$(RecvStr, 1, 3)
        If respStatus <> Success Then
            If UserLang = ARABIC Then
                MsgBox "Œÿ√ " + respStatus + " " + Mid$(RecvStr, 6, 50)
            Else
                MsgBox "Error " + respStatus + " " + Mid$(RecvStr, 56, 50)
            End If
            CSD_mdiForm.staticStatus.Panels(3).text = "Problem during refresh; refresh not complete"
            frmEnquiry.MousePointer = vbDefault
            Exit Sub
        End If
        lastRecCount = Mid$(RecvStr, 107, 5)
        On Error Resume Next
        noOfRecs = CInt(Mid$(RecvStr, 112, 2))
        currentPosition = 0
        For i = 1 To noOfRecs
            currentPosition = 124 + (i - 1) * 200 ' from position 114, 10 chars left as blank for
                                                  ' future enhancement; so, started from 124

            recType = Mid$(RecvStr, currentPosition, 2)
            If recType = "ST" Then
               mQry = "update sadadstatusinfo set arabicdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & " ', englishdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & _
                      "' where statuscode = '" & Mid$(RecvStr, currentPosition + 2, 6) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sadadstatusinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 6) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "US" Then
                mQry = "update sadadupdstatusinfo set arabicdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & " ', englishdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & _
                      "' where updstatuscode = '" & Mid$(RecvStr, currentPosition + 2, 6) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sadadupdstatusinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 6) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "SV" Then
                mQry = "update sadadservicetypeinfo set arabicdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & " ', englishdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & _
                      "' where servicetypecode = '" & Mid$(RecvStr, currentPosition + 2, 4) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sadadservicetypeinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 4) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & "');"
                    db.Execute (mQry)
                End If
            ElseIf recType = "ER" Then
                mQry = "update sadaderrorinfo set arabicdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & " ', englishdescription= '" & _
                      RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & _
                      "' where errorcode = '" & Mid$(RecvStr, currentPosition + 2, 6) & "';"
                db.Execute (mQry)
                If db.RecordsAffected = 0 Then
                    mQry = "insert into sadaderrorinfo  " & _
                    " values('" & Mid$(RecvStr, currentPosition + 2, 6) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 12, 50)) & "','" & _
                    RTrim(Mid$(RecvStr, currentPosition + 62, 50)) & "');"
                    db.Execute (mQry)
                End If
            End If
        Next i
        If noOfRecs < 10 Then
            Exit Do
        End If
        CSD_mdiForm.staticStatus.Panels(3).text = errRefreshingLocalDb(UserLang)
    Loop
     
    CSD_mdiForm.staticStatus.Panels(3).text = errRefreshComplete(UserLang)
    frmEnquiry.MousePointer = vbDefault
End Sub
