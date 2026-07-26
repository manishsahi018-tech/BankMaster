Attribute VB_Name = "BranchpowerInterface"

DefInt A-Z
Global Const BOPEN = 0
Global Const BCLOSE = 1
Global Const BINSERT = 2
Global Const BUPDATE = 3
Global Const BDELETE = 4
Global Const BGETEQUAL = 5
Global Const BGETNEXT = 6
Global Const BGETPREV = 7
Global Const BGETGREATEROREQUAL = 9
Global Const BGETFIRST = 12
Global Const BGETLAST = 13
Global Const BCREATE = 14
Global Const BSTAT = 15
Global Const BSTOP = 25
Global Const BVERSION = 26
Global Const BRESET = 28

Global Const KEY_BUF_LEN = 256

Rem  Key Flags
Global Const DUP = 1
Global Const MODIFIABLE = 2
Global Const BIN = 4
Global Const NUL = 8
Global Const SEGMENT = 16
Global Const SEQ = 32
Global Const DEC = 64
Global Const SUP = 128

Rem  Key Types
Global Const EXTTYPE = 256
Global Const MANUAL = 512
Global Const BSTRING = 0
Global Const BINTEGER = 1
Global Const BFLOAT = 2
Global Const BDATE = 3
Global Const BTIME = 4
Global Const BDECIMAL = 5
Global Const BNUMERIC = 8
Global Const BZSTRING = 11
Global Const BAUTOINC = 15

Declare Function BTRCALL Lib "w3btrv7.dll" (ByVal OP, ByVal Pb$, db As Any, DL As Integer, Kb As Any, ByVal Kl, ByVal Kn) As Integer
'Declare Function BPAnbVal Lib bpExePath  & "anbval32.dll" (ByVal opt$, ByVal subsNo$) As Integer
Declare Function BPAnbVal Lib "i:\bpower\exe\anbval32.dll" (ByVal opt$, ByVal subsNo$) As Integer

Rem Declare Function BTRCALL Lib "w32bticm.dll" (ByVal OP, ByVal Pb$, Db As Any, DL As Integer, Kb As Any, ByVal Kl, ByVal Kn) As Integer
Rem     Structures to overcome problems within Visual Basic.
Rem     This User Defined Type allows us to convert the data coming in from (or going to)
Rem     our interface.  By treating the data as a byte we can concatenate the data back
Rem     into a Long variable type without conversion problems.


Type typ_byte4
     fld_Field1   As Byte
     fld_Field2   As Byte
     fld_Field3   As Byte
     fld_Field4   As Byte
End Type
Rem ***************************************************************************

Rem  Btrieve Structures

Type KeySpec
     KeyPos    As Integer
     KeyLen    As Integer
     KeyFlags  As Integer
     KeyTot    As typ_byte4
     KeyType   As String * 1
     Reserved  As String * 5
End Type

Type FileSpec
     RecLen             As Integer
     PageSize           As Integer
     IndxCnt            As Integer
     NotUsed            As String * 4
     FileFlags          As Integer
     Reserved           As String * 2
     Allocation         As Integer
     KeyBuf0            As KeySpec
     KeyBuf1            As KeySpec
     KeyBuf2            As KeySpec
End Type

Rem     Note that due to the way Visual Basic 4.0 handles arrays of user-
Rem     defined types, the above type uses
Rem
Rem         KeyBuf0          As KeySpec
Rem         KeyBuf1          As KeySpec
Rem
Rem     rather than
Rem
Rem         KeyBuf(0 To 1)   As KeySpec
Rem
Rem     Each Key description must be a separate entry in the FileSpec.
Rem
Rem     KeyBuf is treated similarly in 'StatFileSpecs', below.
Rem

Type StatFileSpecs
     RecLen              As Integer
     PageSize            As Integer
     IndexTot            As Integer
     RecTot              As typ_byte4
     FileFlags           As Integer
     Reserved            As String * 2
     UnusedPages         As Integer
     KeyBuf0             As KeySpec
     KeyBuf1             As KeySpec
     KeyBuf2             As KeySpec
End Type

Type BaccRecBuf
     recType As String * 2
     accNo   As String * 20
     shortName1 As String * 30
     shortName2 As String * 30
     ledgerSubLedg As String * 4
     currency As String * 3
     accType  As String * 4
     Description As String * 30
     clientNo As String * 9
     stopBlock As String * 1
     drLimit As String * 18
     drLimitExp  As String * 8
     clearTrans  As String * 18
     bookTrans  As String * 18
     filler As String * 3
     clearedBal As String * 18
     bookBal  As String * 18
     garnHold As String * 18
     lienHold As String * 18
     plgeHold As String * 18
     secRatg  As String * 2
     lastDate As String * 8
     altAccNo As String * 20
     pwProtected As String * 1
     filler1 As String * 100
End Type

Type BclientInfo
     recType    As String * 2
     clientNo   As String * 9
     shortName1 As String * 30
     shortName2 As String * 30
     location   As String * 30
     alphacode  As String * 15
     mainCurr   As String * 3
     secRatg    As String * 2
     closedInd  As String * 1
     garnOrder  As String * 18
     address1   As String * 45
     address2   As String * 45
     address3   As String * 45
     address4   As String * 45
     address5   As String * 45
     address6   As String * 45
     address7   As String * 45
     dispData   As String * 60
     langPref   As String * 1
     filler     As String * 100
End Type

Type BstopChqInfo
    stopChqAccNo As String * 20
    chqNo   As String * 12
    chqAmt  As String * 18
    chqDtDrawn As String * 8
    chqPayeeNarr As String * 25
    chqStopChqFlag As String * 1
    chqFromNo As String * 12
    filler As String * 32
End Type

Type stmtSpec
     accNo As String * 13
     lang  As String * 1
     stmtFile As String * 12
     zipFileNo As String * 2
End Type

Type VersionBuf
    Major As Integer
    Minor As Integer
    Engine As String * 1
End Type

Type BtlrjnlBuf
    tellerId As String * 4
    jnlDate   As String * 6
    jnlTime  As String * 6
    transCode As String * 4
    accountNo As String * 20
    cashAmt As String * 18
    chequeAmt As String * 18
    entryRef As String * 15
    supervisorId As String * 4
    fromToTeller As String * 4
    lm1Denom As String * 18
    lm2Denom As String * 18
    lm3Denom As String * 18
    lm4Denom As String * 18
    lm5Denom As String * 18
    lm6Denom As String * 18
    lm7Denom As String * 18
    lm8Denom As String * 18
    lm9Denom As String * 18
    lmCoinDenom As String * 18
    other As String * 18
    tfFlag As String * 1
    currType As String * 3
    chainFlag As String * 1
    tChequeAmount As String * 18
    cashEquiv As String * 18
    chequeEquiv As String * 18
    tChequeEquiv As String * 18
    excRate As String * 14
    bopCode As String * 4
    reversalFlag As String * 1
    currCodeEq As String * 3
    denomEq1 As String * 18
    denomEq2 As String * 18
    denomEq3 As String * 18
    denomEq4 As String * 18
    denomEq5 As String * 18
    denomEq6 As String * 18
    denomEq7 As String * 18
    denomEq8 As String * 18
    denomEq9 As String * 18
    coinsDenomEq As String * 18
    transClass As String * 2
    inclFlag As String * 1
    totsUpdate As String * 1
    clrUpd As String * 1
    accUpdFlag As String * 1
    totsSign As String * 1
    modified As String * 1
    draftReferance As String * 18
    eftCode As String * 3
    filler As String * 66
    filler1 As String * 100
End Type

Type BsysmontBuf
    userCode As String * 4
    dateStamp As String * 8
    timeStamp As String * 6
    entryRef As String * 15
    hostCode As String * 8
    priOrOff As String * 1
    messageType As String * 1
    postFlag As String * 1
    sentFlag As String * 1
    ackNo As String * 1
    resend As String * 1
    nor As String * 3
    inputTime As String * 6
    sfSendTime As String * 6
    tpsRespTime As String * 6
    compTime As String * 6
    roundTrip As String * 3
    filler As String * 50
    filler1 As String * 100
End Type

Type BtotCr
    recType As String * 2
    tellerId As String * 4
    currCode As String * 3
    openingCash As String * 18
    cashIn As String * 18
    cashOut As String * 18
    chqsIn As String * 18
    noChqsIn As String * 4
    chqsOut As String * 18
    noChqsOut As String * 4
    tChqsIn As String * 18
    noTChqsIn As String * 4
    tChqsOut As String * 18
    noTChqsOut As String * 4
    tChqsComLm As String * 18
    stampDutyLm As String * 18
    exchangeRecd As String * 18
    transCommLm As String * 18
    com5CommLm As String * 18
    dtltR2Com6CommLm As String * 18
    currPos As String * 1
    filler As String * 123
    filler1 As String * 100
End Type

Public Type BTrnDtlBuf
     tdl_rec_type As String * 3  ' 1-3
     tdl_accNo   As String * 20  ' 4-20
     tdl_tgt_sort_code  As String * 12   '24-12
     tdl_contra_accno As String * 20     '36-20
     tdl_contra_sort_code As String * 12 '56-12
     tdl_2nd_tx_accno As String * 20     '68-20
     tdl_2nd_tx_sort_code  As String * 12 '88-12
     tdl_0_bnk_ac_no As String * 20   '100-20
     tdl_other_sort_code As String * 12 '120-12
     tdl_trans_code As String * 6  '132-6
     tdl_entry_ref As String * 15  '138-15
     tdl_user_code  As String * 4  '153-4
     tdl_date_stamp  As String * 8 '157-8
     tdl_time_stamp  As String * 6 '165-6
     tdl_tx_class As String * 2    '171-2
     tdl_short_desc As String * 3  '173-3
     tdl_2nd_tx_host_code As String * 6 '176-6
     tdl_2nd_tx_sign As String * 1  '182-1
     tdl_sce_sort_code  As String * 12 '183-12
     tdl_ccb_sort_code As String * 12  '195-12
     tdl_book_date As String * 8   '207-8
     tdl_clearing_date As String * 8 '215-8
     tdl_clear_days  As String * 4  '223-4
     tdl_ex_clearing_days As String * 4 '227-4
     tdl_cheque_no As String * 12 '231-12
     tdl_org_reference As String * 10  '243-10
     tdl_curr_code As String * 3 '253-3
     tdl_gross_amount As String * 18  '256-18
     tdl_cash_amt As String * 18  '274-18
     tdl_cheque_amt As String * 18 '292-18
     tdl_curr_equiv As String * 3  '310-3
     tdl_cash_equiv As String * 18 '313-18
     tdl_cheque_equiv As String * 18 '331-18
     tdl_base_curr As String * 3  '349-3
     tdl_base_equiv_amt As String * 18 '352-18
     tdl_tranx_exch_rate As String * 14 '370-14
     tdl_tranx_mult_div As String * 1 '384-1
     '--
     tdl_tot_comm_chg As String * 18 '385-18
     tdl_comm_code_1 As String * 2 '403-2
     tdl_comm_charges_1 As String * 18 '405-18
     tdl_comm_code2 As String * 2 '423-2
     tdl_comm_charges_2 As String * 18 '425-18
     tdl_comm_code3 As String * 2 '443-2
     tdl_comm_charges_3 As String * 18 '445-18
     tdl_comm_code4 As String * 2 '463-2
     tdl_comm_charges_4 As String * 18  '465-18
     tdl_comm_code5 As String * 2  '483-2
     tdl_comm_charges_5 As String * 18  '485-18
     tdl_comm_code6 As String * 2  '503-2
     tdl_comm_charges_6 As String * 18  '505-18
     tdl_narr1 As String * 60  '523-60
     tdl_narr2 As String * 60  '583-60
     tdl_narr3 As String * 60  '643-60
     tdl_settle_inst_1 As String * 35  '703-35
     tdl_settle_inst_2 As String * 35  '738-35
     tdl_settle_inst_3 As String * 35  '773-35
     tdl_drawer As String * 15   '808-15
     tdl_stat_symbols As String * 12 '823-12
     tdl_reason_code As String * 4   '835-4
     tdl_branch_code As String * 4   '839-4
     tdl_no_cheques As String * 4    '843-4
     tdl_no_t_cheques As String * 4  '847-4
     tdl_no_cheques_eq As String * 4 '851-4
     tdl_no_t_chqs_eq As String * 4  '855-4
     tdl_maturity_date As String * 8 '859-8
     tdl_final_mat_date As String * 8 '867-8
     tdl_interest_rate As String * 9  '875-9
     tdl_coup_disc_rate As String * 9 '884-9
     tdl_draw_issue_date As String * 8 '893-8
     tdl_nominal_amnt As String * 18   '901-18
     tdl_interest_amnt As String * 19  '919-18
     tdl_broker_no As String * 7  '938-6
     tdl_lim_exc_status As String * 2  '944-2
     tdl_lim_exc_edamt As String * 16  '946-16
     tdl_delete_ind As String * 1  '962-1
     tdl_update_ind As String * 1 '963-1
     tdl_passbk As String * 1  '964-1
     tdl_eod_ind As String * 1  '965-1
     tdl_prim_ex_rate_1 As String * 14  '966-14
     tdl_prim_mult_div_1 As String * 1  '980-1
     tdl_eq_ex_rate_2 As String * 14  '981-14
     tdl_eq_ex_multi_div_2 As String * 1 '995-1
     tdl_org_draft_ref As String * 18  '996-18
     tdl_verif_modif_flag As String * 1 '1014-1
     tdl_verif_tx_flag As String * 1  '1015-1
     tdl_verif_chain_flag As String * 1  '1016-1
     tdl_verifier_id As String * 4  '1017-4
     tdl_trans_number As String * 4 '1021-4
     tdl_self_balance As String * 1  '1025-1
     tdl_reversal_type As String * 1 '1026-1
     tdl_receipt_layout As String * 9 '1027-9
     tdl_receipt_reqd As String * 1  '1036-1
     tdl_applicant_name As String * 30 '1037-30
     tdl_eft_code As String * 3  '1067-3
     tdl_lang_code As String * 1  '1070-1
     tdl_drawee_sort_code As String * 12  '1071-12
     tdl_transfer_draft As String * 1  '1083-1
     tdl_narr_code As String * 4  '1084-4
     tdl_posting_queue As String * 1 '1088-1
     tdl_customer_name As String * 30 '1089-30
     tdl_int_at_maturity As String * 18  '1119-18
     tdl_new_acc_number As String * 20 '1137-20
     tdl_available_balance As String * 18  '1157-18
     tdl_final_amount As String * 18 '1175-18
     tdl_nett_interest_amt As String * 18 '1193-18
     tdl_payee_name As String * 30      '1211-30
     tdl_contra_chq_no As String * 12  '1241-12
     tdl_contra_org_ref As String * 10  '1253-10
     tdl_credit_card_no As String * 16  '1263-16
     tdl_batch_ind As String * 1        '1279-1
     tdl_batch_ref As String * 7        '1280-7
     tdl_verify_status As String * 1    '1287-1
     tdl_curpos_subref As String * 2    '1288-2
     tdl_add_cur_code As String * 3
     tdl_add_curr_amount As String * 18
     tdl_filler As String * 768
End Type

Type bUserInfo
     userId As String * 4
     password As String * 8
     authLevel As String * 2
     maxOnlineDr As String * 18
     maxOnlineCr As String * 18
     maxOfflineDr As String * 18
     maxOfflineCr As String * 18
     access As String * 2
     sensitiveAcs As String * 2
     languagePref As String * 2
     lockout As String * 1
     passwChgDate As String * 8
     supvId1 As String * 4
     supvId2 As String * 4
     supvId3 As String * 4
     cashAnalReq As String * 1
     serlNo As String * 5
     maxFlrLmt As String * 18
     minFlrLmt As String * 18
     refTable As String * 10
     describe As String * 30
     loginDate As String * 8
     loginTime As String * 6
     postLoan As String * 1
     printRpschR78 As String * 1
     unreportedChqs As String * 4
     passwdSetDate1 As String * 8
     passwdPasswd1 As String * 8
     passwdSetDate2 As String * 8
     passwdPasswd2 As String * 8
     passwdSetDate3 As String * 8
     passwdPasswd3 As String * 8
     passwdSetDate4 As String * 8
     passwdPasswd4 As String * 8
     passwdSetDate5 As String * 8
     passwdPasswd5 As String * 8
     passwdSetDate6 As String * 8
     passwdPasswd6 As String * 8
     passwdSetDate7 As String * 8
     passwdPasswd7 As String * 8
     passwdSetDate8 As String * 8
     passwdPasswd8 As String * 8
     passwdSetDate9 As String * 8
     passwdPasswd9 As String * 8
     passwdSetDate10 As String * 8
     passwdPasswd10 As String * 8
     passwdSetDate11 As String * 8
     passwdPasswd11 As String * 8
     passwdSetDate12 As String * 8
     passwdPasswd12 As String * 8
     passJrnlCount As String * 2
     arabScreenReq As String * 1
     filler As String * 101
     filler1 As String * 100
End Type

Global FileBuf As FileSpec
Global AccBuf As BaccRecBuf
Global CustBuf As BclientInfo
Global StopChqBuf As BstopChqInfo
Global tlrJnlBuf As BtlrjnlBuf
Global sysMontBuf As BsysmontBuf
Global trnDtlBuf As BTrnDtlBuf
Global totCrBuf As BtotCr
Global userBuf As bUserInfo
Global StatFileBuffer As StatFileSpecs
Global CustPosBlk$, AcctPosBlk$, StopChqPosBlk$, tlrJnlPosBlk$, sysMontPosBlk$
Global trnDtlPosBlk$, totCrPosBlk$, userPosBlk$
Global BufLen As Integer
Global DBLen As Integer
Global keybuflen As Integer
Global stmtBuf As stmtSpec
Global KeyBuffer$, posBlk$

Function openAcctFile() As Integer

Dim loc_RecTot  As Long
Dim h_field1    As String
Dim h_field2    As String
Dim h_field3    As String
Dim h_field4    As String
Dim h_total     As String
Dim recStr      As String * 400
'Dim status

fileName$ = bpdbPath + "BACCREC.DAT"
AcctPosBlk$ = Space$(128)
KeyBuffer$ = Space$(KEY_BUF_LEN)

Rem ************* SET UP FILE SPECS
FileBuf.RecLen = 384
FileBuf.PageSize = 1024
FileBuf.IndxCnt = 3
FileBuf.FileFlags = 0


Rem ************* SET UP KEY SPECS
FileBuf.KeyBuf0.KeyPos = 1
FileBuf.KeyBuf0.KeyLen = 22
FileBuf.KeyBuf0.KeyFlags = EXTTYPE
FileBuf.KeyBuf0.KeyType = Chr$(BSTRING)

FileBuf.KeyBuf1.KeyPos = 124
FileBuf.KeyBuf1.KeyLen = 9
FileBuf.KeyBuf1.KeyFlags = EXTTYPE + MODIFIABLE + DUP
FileBuf.KeyBuf1.KeyType = Chr$(BSTRING)

FileBuf.KeyBuf2.KeyPos = 299
FileBuf.KeyBuf2.KeyLen = 20
FileBuf.KeyBuf2.KeyFlags = EXTTYPE + MODIFIABLE + DUP
FileBuf.KeyBuf2.KeyType = Chr$(BSTRING)

BufLen = Len(FileBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
BufLen = Len(AccBuf)
keynum = 0

status = BTRCALL(BOPEN, AcctPosBlk$, AccBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
    If UserLang = ENGLISH Then
       msg$ = "Error Opening account file! " + str$(status)
    Else
       msg$ = "Œÿ√ √À‰«¡ › Õ „·› «·Õ”«» ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
    End If
    LogData "Account No  " + recvAccPendingDetail.accNo + " not found in Branch Power DB" + str$(status)
    MsgBox (msg$)
    openAcctFile = 1
Else
    msg$ = "account File Opened Succesfully!"
    openAcctFile = 0
End If
End Function
      
Function readAccount(accNo As String) As Integer

BufLen = Len(AccBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

If branchPowerEnv = "DOS" Then
   KeyBuffer$ = "02" & Format(accNo, "!@@@@@@@@@@@@@@@@@@@@")
Else
   KeyBuffer$ = Format(accNo, "!@@@@@@@@@@@@@@@@@@@@")
End If
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETEQUAL, AcctPosBlk$, AccBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   msg$ = "Account No  " & accNo & " not found in Branch Power DB" & str$(status)
   LogData "Account No  " & accNo & " not found in Branch Power DB" & str$(status)
   MsgBox msg$
   readAccount = 1
Else
   readAccount = 0
End If

End Function
Function updateAccount() As Integer

BufLen = Len(AccBuf)

KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BUPDATE, AcctPosBlk$, AccBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
'   If UserLang = ENGLISH Then
      msg$ = "Error while updating BP account file  " + str$(status)
'   Else
'      msg$ = "Œÿ√ √À‰«¡  ÕœÌÀ „·› «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
'   End If
   LogData "Error while updating BP account file  " + str$(status)
   MsgBox msg$
   updateAccount = 1
Else
   updateAccount = 0
End If

End Function


Function insertAccount() As Integer

BufLen = Len(AccBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, AcctPosBlk$, AccBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting accountinfo into BP " + str$(status)
      Else
         msg$ = "Œÿ√ ›Ì ≈œŒ«· „⁄·Ê„«  «·Õ”«» ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
      End If
      LogData "Error in Inserting accountinfo into BP " + str$(status)
      MsgBox (msg$)
      insertAccount = 1
   Else
      insertAccount = 0
   End If
Else
    msg$ = "Insert account Record #1 into BP Successful!"
    insertAccount = 0
End If
End Function

Function openCustFile() As Integer

Dim loc_RecTot  As Long
Dim h_field1    As String
Dim h_field2    As String
Dim h_field3    As String
Dim h_field4    As String
Dim h_total     As String
Dim recStr      As String * 400
'Dim status

fileName$ = bpdbPath + "BCLI02.DAT"
CustPosBlk$ = Space$(128)
KeyBuffer$ = Space$(KEY_BUF_LEN)

Rem ************* SET UP FILE SPECS
FileBuf.RecLen = 576
FileBuf.PageSize = 1024
FileBuf.IndxCnt = 2
FileBuf.FileFlags = 0


Rem ************* SET UP KEY SPECS
FileBuf.KeyBuf0.KeyPos = 1
FileBuf.KeyBuf0.KeyLen = 11
FileBuf.KeyBuf0.KeyFlags = EXTTYPE
FileBuf.KeyBuf0.KeyType = Chr$(BSTRING)

FileBuf.KeyBuf1.KeyPos = 102
FileBuf.KeyBuf1.KeyLen = 10
FileBuf.KeyBuf1.KeyFlags = EXTTYPE + MODIFIABLE + DUP
FileBuf.KeyBuf1.KeyType = Chr$(BSTRING)

BufLen = Len(FileBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
BufLen = Len(CustBuf)
keynum = 0

status = BTRCALL(BOPEN, CustPosBlk$, CustBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening customer file! " + str$(status)
   Else
      msg$ = "Œÿ√ √À‰«¡ › Õ „·› ··⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
   End If
   LogData "Error Opening customer file! " + str$(status)
   MsgBox (msg$)
   openCustFile = 1
Else
   msg$ = "cust File Opened Succesfully!"
   openCustFile = 0
End If
       
End Function
Function openStopChqFile() As Integer

'Dim status

fileName$ = bpdbPath + "BSTPCHEQ.DAT"
StopChqPosBlk$ = Space$(128)
KeyBuffer$ = Space$(KEY_BUF_LEN)

BufLen = Len(StopChqBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
keynum = 0

status = BTRCALL(BOPEN, StopChqPosBlk$, StopChqBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening stop cheque file! " + str$(status)
   Else
      msg$ = "Œÿ√ √À‰«¡ › Õ „·› ··⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
   End If
   LogData "Error Opening stop cheque file! " + str$(status)
   MsgBox (msg$)
   openStopChqFile = 1
Else
   msg$ = "stop cheque File Opened Succesfully!"
   openStopChqFile = 0
End If
       
End Function
Function insertStopChq() As Integer

BufLen = Len(StopChqBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, StopChqPosBlk$, StopChqBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then   ' ignore duplicate
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting stopchqinfo into BP " + str$(status)
      Else
         msg$ = "Œÿ√ ›Ì ≈œŒ«· „⁄·Ê„«  «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
      End If
      LogData "Error in Inserting stopchqinfo into BP " + str$(status)
      MsgBox (msg$)
      insertStopChq = 1
   Else
      insertStopChq = 0
   End If
Else
   msg$ = "Insert stop cheque Record #1 into BP Successful!"
   insertStopChq = 0
End If
End Function
Function readStopChq() As Integer
    
BufLen = Len(StopChqBuf)

KeyBuffer$ = Format(recvStopChqDetail.accNo, "!@@@@@@@@@@@@@@@@@@@@") & Format(recvStopChqDetail.chequeNo, "000000000000")
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETEQUAL, StopChqPosBlk$, StopChqBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Customer  " & recvStopChqDetail.accNo & " & cheque no " & recvStopChqDetail.chequeNo & " not found in Branch Power DB" & str$(status)
   Else
      msg$ = "«·⁄„Ì·" & recvStopChqDetail.accNo & " & cheque no " & recvStopChqDetail.chequeNo & " €Ì— „ÊÃÊœ ›Ì ﬁ«⁄œ… »Ì«‰«  «·»—«‰‘ »Ê¯—" & str$(status)
   End If
   LogData "Customer  " & recvStopChqDetail.accNo & " & cheque no " & recvStopChqDetail.chequeNo & " not found in Branch Power DB" & str$(status)
   MsgBox msg$
   readStopChq = 1
Else
   readStopChq = 0
End If

End Function
Function updateStopChq() As Integer

BufLen = Len(StopChqBuf)

KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

 status = BTRCALL(BDELETE, StopChqPosBlk$, StopChqBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error while updating BP stop cheque file  " + str$(status)
   Else
      msg$ = "Œÿ√ √À‰«¡  ÕœÌÀ „·› «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
   End If
   LogData "Error while updating BP stop cheque file  " + str$(status)
   MsgBox msg$
   updateStopChq = 1
Else
   updateStopChq = 0
End If

End Function

Function insertClient() As Integer

BufLen = Len(CustBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, CustPosBlk$, CustBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then  ' ignore duplicate
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting customerinfo into BP " + str$(status)
      Else
         msg$ = "Œÿ√ ›Ì ≈œŒ«· „⁄·Ê„«  «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
      End If
      LogData "Error in Inserting customerinfo into BP " + str$(status)
      MsgBox (msg$)
      insertClient = 1
   Else
      insertClient = 0
   End If
Else
   msg$ = "Insert customer Record #1 into BP Successful!"
   insertClient = 0
End If
End Function
Function readClient() As Integer

BufLen = Len(CustBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

If branchPowerEnv = "DOS" Then
   KeyBuffer$ = "02" & Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
Else
   KeyBuffer$ = Format(recvSuperDecisionMsg.custNo, "!@@@@@@@@@")
End If
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETEQUAL, CustPosBlk$, CustBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Customer  " + recvSuperDecisionMsg.custNo + " not found in Branch Power DB" + str$(status)
   Else
      msg$ = "«·⁄„Ì·" + recvSuperDecisionMsg.custNo + " €Ì— „ÊÃÊœ ›Ì ﬁ«⁄œ… »Ì«‰«  «·»—«‰‘ »Ê¯—" + str$(status)
   End If
   LogData "Customer  " + recvSuperDecisionMsg.custNo + " not found in Branch Power DB" + str$(status)
   MsgBox msg$
   readClient = 1
Else
   readClient = 0
End If

End Function

Function updateClient() As Integer

BufLen = Len(CustBuf)

KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

 status = BTRCALL(BUPDATE, CustPosBlk$, CustBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error while updating BP customer file  " + str$(status)
   Else
      msg$ = "Œÿ√ √À‰«¡  ÕœÌÀ „·› «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" + str$(status)
   End If
   LogData "Error while updating BP customer file  " + str$(status)
   MsgBox msg$
   updateClient = 1
Else
   updateClient = 0
End If

End Function
Function openHistFile(tFileName As String) As Integer

Dim loc_RecTot  As Long
Dim h_field1    As String
Dim h_field2    As String
Dim h_field3    As String
Dim h_field4    As String
Dim h_total     As String
Dim recStr      As String * 400
Dim status

fileName$ = tFileName
posBlk$ = Space$(128)
KeyBuffer$ = Space$(KEY_BUF_LEN) '
'BufLen = Len(FileBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
BufLen = 28
keynum = 0

status = BTRCALL(BOPEN, posBlk$, stmtBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
    If UserLang = ENGLISH Then
       msg$ = "Error  " & str$(status) & " Opening Statement file! " & fileName$
    Else
       msg$ = "Œÿ√ √À‰«¡ › Õ „·› «·Õ”«» ›Ì «·»—«‰‘ »Ê¯—" & str$(status)
    End If
    MsgBox (msg$)
    On Error Resume Next
    histLogFile.WriteLine (CStr(Time) & ":" & "Error  " & str$(status) & " Opening Statement file [" & fileName$ & "]; Please investigate")
    On Error GoTo 0
    openHistFile = 1
Else
    msg$ = "Statement File [" & fileName$ & "] Opened Succesfully!"
    On Error Resume Next
    histLogFile.WriteLine (CStr(Time) & ":" & msg$)
    On Error GoTo 0
    openHistFile = 0
End If
End Function
      
Function readStmtFile(mode As Integer) As Integer

keybuflen = KEY_BUF_LEN
keybuflen = Len(KeyBuffer$)
BufLen = Len(stmtBuf)
keynum = 0
status = BTRCALL(mode, posBlk$, stmtBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

readStmtFile = status

'If status <> 0 Then
''   If UserLang = ENGLISH Then
''      msg$ = "Account No  " + recvAccPendingDetail.accNo + " not found in Branch Power DB" + Str$(status)
''   Else
''      msg$ = "«·⁄„Ì·" + recvSuperDecisionMsg.custNo + " €Ì— „ÊÃÊœ ›Ì ﬁ«⁄œ… »Ì«‰«  «·»—«‰‘ »Ê¯—" + str$(status)
''   End If
'   MsgBox msg$
'   readAccount = 1
'Else
'   readAccount = 0
'End If

End Function

Function closeClient() As Integer

status = BTRCALL(BCLOSE, CustPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing Customer File !" + str$(status)
   Else
      msg$ = "Œÿ√ ›Ì ≈⁄«œ… »Ì —Ì›" + str$(status)
   End If
'   MsgBox msg$
   closeClient = 1
Else
   closeClient = 0
End If

End Function
Function closeAcct() As Integer

status = BTRCALL(BCLOSE, AcctPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing Account File !" + str$(status)
   Else
      msg$ = "Œÿ√ ›Ì ≈⁄«œ… »Ì —Ì›" + str$(status)
   End If
'   MsgBox msg$
   closeAcct = 1
Else
   closeAcct = 0
End If

End Function
Function closeStopChq() As Integer

status = BTRCALL(BCLOSE, StopChqPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing stop cheque File !" + str$(status)
   Else
      msg$ = "Œÿ√ ›Ì ≈⁄«œ… »Ì —Ì›" + str$(status)
   End If
   closeStopChq = 1
Else
   closeStopChq = 0
End If
End Function

Function reset() As Integer
    keynum = 0
    KeyBuffer$ = "0"
    status = BTRCALL(BRESET, CustPosBlk$, patientvar, BufLen, KeyBuffer$, keybuflen, keynum)

    If status <> 0 Then
       LogData "Error on Btrieve Reset!" + str$(status)
       If UserLang = ENGLISH Then
          msg$ = "Error on Btrieve Reset!" + str$(status)
       Else
          msg$ = "Œÿ√ ›Ì ≈⁄«œ… »Ì —Ì›" + str$(status)
       End If
'       MsgBox msg$
       reset = 1
    Else
       reset = 0
    End If
End Function
Function openBuserFile() As Integer
    fileName$ = bpdbPath & "BUSER.DAT"
    userPosBlk$ = Space$(512)
    KeyBuffer$ = Space$(KEY_BUF_LEN)

    BufLen = Len(userBuf)
    keybuflen = Len(fileName$)
    KeyBuffer$ = fileName$

    'Open File
    keybuflen = KEY_BUF_LEN
    KeyBuffer$ = fileName$
    keynum = 0

    status = BTRCALL(BOPEN, userPosBlk$, userBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)
 
    If status <> 0 Then
       If UserLang = ENGLISH Then
          msg$ = "Error Opening User  file! " & str$(status)
       Else
          msg$ = "⁄œ„ ≈„ﬂ«‰Ì… › Õ „·› «·ÂÊÌ«  " & str$(status)
       End If
       LogData "Error Opening User file! " & str$(status)
       MsgBox (msg$)
       openBuserFile = 1
    Else
       msg$ = "User File Opened Succesfully!"
       openBuserFile = 0
    End If

End Function
Function readUserRec(tellerId As String) As Integer
    
BufLen = Len(userBuf)

'KeyBuffer$ = Format(tellerId, "!@@@@") & Space(6) & Space(6)
KeyBuffer$ = Format(tellerId, "!@@@@")
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETEQUAL, userPosBlk$, userBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)
If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "User Id  " & tellerId & " not found in Branch Power DB" & str$(status)
   Else
      msg$ = "«·ÂÊÌ…  " & tellerId & " €Ì— „œŒ·… ›Ì ‰Ÿ«„ »—«‰‘ »Ê—" & str$(status)
   End If
   LogData "User Id  " & tellerId & " not found in Branch Power DB" & str$(status)
   MsgBox msg$
   readUserRec = 1
Else
   readUserRec = 0
End If

End Function
Function updateUser() As Integer

BufLen = Len(userBuf)

KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BUPDATE, userPosBlk$, userBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error while updating BUSER file  " & str$(status)
   Else
      msg$ = "⁄œ„ ≈„ﬂ«‰Ì…  ÕœÌÀ „·› «·ÂÊÌ«  " + str$(status)
   End If
   LogData "Error while updating BUSER file  " & str$(status)
   MsgBox msg$
   updateUser = 1
Else
   updateUser = 0
End If

End Function
Public Function closeUserFile() As Integer
status = BTRCALL(BCLOSE, userPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing User file !" & str$(status)
   Else
      msg$ = "⁄œ„ ≈„ﬂ«‰Ì… ≈€·«ﬁ „·› «·ÂÊÌ«  " + str$(status)
   End If
   closeUserFile = 1
Else
   closeUserFile = 0
End If

End Function


Function openTlrJnlFile() As Integer

'Dim status

fileName$ = bpdbPath & "BTLRJNL.DAT"
tlrJnlPosBlk$ = Space$(672)
KeyBuffer$ = Space$(KEY_BUF_LEN)

BufLen = Len(tlrJnlBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
keynum = 0

status = BTRCALL(BOPEN, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening Teller Journal file! " & str$(status)
   Else
      msg$ = "⁄œ„ ≈„ﬂ«‰Ì… ≈€·«ﬁ „·› «·ÃÊ—‰«·" & str$(status)
   End If
   LogData "Error Opening Teller Journal file! " & str$(status)
   MsgBox (msg$)
   openTlrJnlFile = 1
Else
   msg$ = "Teller Journal File Opened Succesfully!"
   openTlrJnlFile = 0
End If
       
End Function
Function readLastTlrRec(tellerId As String) As Integer
    
BufLen = Len(tlrJnlBuf)

'KeyBuffer$ = Format(tellerId, "!@@@@") & Space(6) & Space(6)
KeyBuffer$ = "BRFO" & Format(tellerId, "!@@@@") & "00000" & "01"
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETGREATEROREQUAL, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 5)
If status = 0 And Trim(tlrJnlBuf.tellerId) = tellerId Then
   Do While status = 0 And Trim(tlrJnlBuf.tellerId) = tellerId
      status = BTRCALL(BGETNEXT, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 5)
   Loop
   If status = 0 Then
      status = BTRCALL(BGETPREV, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 5)
   End If
Else
   tlrJnlBuf.entryRef = "BRFO" & Format(tellerId, "!@@@@") & "00000" & "01"
   readLastTlrRec = 0
   Exit Function
End If

readLastTlrRec = 0

End Function
Public Function insertTlrJnl() As Integer
BufLen = Len(tlrJnlBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, tlrJnlPosBlk$, tlrJnlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then   ' ignore duplicate
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting a record in BTLRJNL " & str$(status)
      Else
         msg$ = "⁄œ„ ≈„ﬂ«‰Ì…  ÕœÌÀ „·› «·ÃÊ—‰«· " & str$(status)
      End If
      LogData "Error in Inserting a record in BTLRJNL " & str$(status)
      MsgBox (msg$)
      insertTlrJnl = 1
   Else
      insertTlrJnl = 0
   End If
Else
   msg$ = "Insert BTLRJNL Record #1 into BP Successful!"
   insertTlrJnl = 0
End If

End Function
Public Function closeTlrJnrFile() As Integer
status = BTRCALL(BCLOSE, tlrJnlPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing teller journal file !" & str$(status)
   Else
      msg$ = "⁄œ„ ≈„ﬂ«‰Ì… ≈€·«ﬁ „·› «·ÃÊ—‰«·  " + str$(status)
   End If
   closeTlrJnrFile = 1
Else
   closeTlrJnrFile = 0
End If

End Function

Public Function openSysMontFile() As Integer
'Dim status

fileName$ = bpdbPath & "BSYSMONT.DAT"
sysMontPosBlk$ = Space$(128)
KeyBuffer$ = Space$(KEY_BUF_LEN)

BufLen = Len(sysMontBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
keynum = 0

status = BTRCALL(BOPEN, sysMontPosBlk$, sysMontBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening System Monitoring file! " & str$(status)
   Else
      msg$ = "Œÿ√ √À‰«¡ › Õ „·› ··⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" & str$(status)
   End If
   LogData "Error Opening System Monitoring file! " & str$(status)
   MsgBox (msg$)
   openSysMontFile = 1
Else
   msg$ = "System Monitoring File Opened Succesfully!"
   openSysMontFile = 0
End If
       
End Function

Public Function closeSysMontFile() As Integer
status = BTRCALL(BCLOSE, sysMontPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing system monitoring file !" & str$(status)
   Else
      msg$ = "Œÿ√ ›Ì ≈⁄«œ… »Ì —Ì›" + str$(status)
   End If
   closeSysMontFile = 1
Else
   closeSysMontFile = 0
End If
End Function

Public Function insertSysMont() As Integer
BufLen = Len(sysMontBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, sysMontPosBlk$, sysMontBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then   ' ignore duplicate
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting a record in BSYSMONT " & str$(status)
      Else
         msg$ = "Œÿ√ ›Ì ≈œŒ«· „⁄·Ê„«  «·⁄„Ì· ›Ì «·»—«‰‘ »Ê¯—" & str$(status)
      End If
      LogData "Error in Inserting a record in BSYSMONT " & str$(status)
      MsgBox (msg$)
      insertSysMont = 1
   Else
      insertSysMont = 0
   End If
Else
   msg$ = "Insert BSYSMONT Record #1 into BP Successful!"
   insertSysMont = 0
End If

End Function


Public Function openTrnDtlFile() As Integer
'Dim status

fileName$ = bpdbPath & "BTRNDTL.DAT"
trnDtlPosBlk$ = Space$(1280)
KeyBuffer$ = Space$(KEY_BUF_LEN)

BufLen = Len(trnDtlBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
keynum = 0

status = BTRCALL(BOPEN, trnDtlPosBlk$, trnDtlBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening Transaction Detail file! " & str$(status)
   Else
      msg$ = "Œÿ√·«Ì„ﬂ‰ › Õ „·› «·Õ—ﬂ«   " & str$(status)
   End If
   LogData "Error Opening Transaction Detail file! " & str$(status)
   MsgBox (msg$)
   openTrnDtlFile = 1
Else
   msg$ = "Transaction Detail File Opened Succesfully!"
   openTrnDtlFile = 0
End If
       
End Function

Public Function closeTrnDtlFile() As Integer
status = BTRCALL(BCLOSE, trnDtlPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing transaction detail file !" & str$(status)
   Else
      msg$ = "Œÿ√ ≈€·«ﬁ „·› «·Õ—ﬂ« " + str$(status)
   End If
   closeTrnDtlFile = 1
Else
   closeTrnDtlFile = 0
End If
End Function

Public Function insertTrnDtl() As Integer
BufLen = Len(trnDtlBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BINSERT, trnDtlPosBlk$, trnDtlBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If status <> 5 Then   ' ignore duplicate
      If UserLang = ENGLISH Then
         msg$ = "Error in Inserting a record in BTRNDTL " & str$(status)
      Else
         msg$ = "Œÿ√ ›Ì  ”ÃÌ· «·„⁄·Ê„«  ›Ì „·› «·Õ—ﬂ« " & str$(status)
      End If
      LogData "Error in Inserting a record in BTRNDTL " & str$(status)
      MsgBox (msg$)
      insertTrnDtl = 1
   Else
      insertTrnDtl = 0
   End If
Else
   msg$ = "Insert BTRNDTL Record #1 into BP Successful!"
   insertTrnDtl = 0
End If

End Function

Function openTotCrFile() As Integer

'Dim status

fileName$ = bpdbPath & "BTOTCR.DAT"
totCrPosBlk$ = Space$(384)
KeyBuffer$ = Space$(KEY_BUF_LEN)

BufLen = Len(totCrBuf)
keybuflen = Len(fileName$)
KeyBuffer$ = fileName$

'Open File
keybuflen = KEY_BUF_LEN
KeyBuffer$ = fileName$
keynum = 0

status = BTRCALL(BOPEN, totCrPosBlk$, totCrBuf, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error Opening Teller Totals CR file! " & str$(status)
   Else
      msg$ = "Œÿ√ ›Ì › Õ „·› «·⁄„·« " & str$(status)
   End If
   LogData "Error Opening Teller Totals CR file! " & str$(status)
   MsgBox (msg$)
   openTotCrFile = 1
Else
   msg$ = "Teller Totals CR File Opened Succesfully!"
   openTotCrFile = 0
End If
       
End Function

Public Function closeTotCrFile() As Integer
status = BTRCALL(BCLOSE, totCrPosBlk$, patientvar, BufLen, ByVal KeyBuffer$, keybuflen, keynum)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error closing Teller Totals CR file !" & str$(status)
   Else
      msg$ = "Œÿ√ ›Ì ≈€·«ﬁ „·› «·⁄„·« " + str$(status)
   End If
   closeTotCrFile = 1
Else
   closeTotCrFile = 0
End If
End Function

Function readTellerTotFile(tellerId As String, currCode As String) As Integer

BufLen = Len(totCrBuf)
KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

KeyBuffer$ = "CR" & Format(tellerId, "!@@@@") & currCode
keybuflen = Len(KeyBuffer$)
status = BTRCALL(BGETEQUAL, totCrPosBlk$, totCrBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Teller  " & tellerId & " for the currency " & currCode & " not found in BTOTCR " & str$(status)
   Else
      msg$ = " ·—  " & tellerId & " ··⁄„·… " & currCode & " €Ì— „ÊÃÊœ… " & str$(status)
   End If
   LogData "Teller  " & tellerId & " for the currency " & currCode & " not found in BTOTCR " & str$(status)
   'MsgBox msg$
   readTellerTotFile = 1
Else
   readTellerTotFile = 0
End If

End Function

Function updateTotCr() As Integer

BufLen = Len(totCrBuf)

KeyBuffer$ = Space$(KEY_BUF_LEN)
keybuflen = KEY_BUF_LEN

status = BTRCALL(BUPDATE, totCrPosBlk$, totCrBuf, BufLen, ByVal KeyBuffer$, keybuflen, 0)

If status <> 0 Then
   If UserLang = ENGLISH Then
      msg$ = "Error while updating Teller totals CR file  " & str$(status)
   Else
      msg$ = "·«Ì„ﬂ‰‰«  ÕœÌÀ —’Ìœ «· ·— ›Ì »—«‰‘ »Ê—  " & str$(status)
   End If
   LogData "Error while updating Teller totals CR file  " & str$(status)
   MsgBox msg$
   updateTotCr = 1
Else
   updateTotCr = 0
End If

End Function









