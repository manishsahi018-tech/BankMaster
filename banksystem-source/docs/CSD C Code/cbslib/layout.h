/*
	Purpose : Include file for all BM program.
	Author : Arul Selvam
	Date   : 01/09/93.
Ver	 Date		Author			Details of Modification
======================================================================
3.0 02/06/02	Arul		Added requestBranchCode in req0data
3.1 04/06/02	Arul		Added risk classification in crd0data at 1923
3.2 16/06/02	Arul		Added anb610 row, col & description at ank0data M1 record
3.3 25/08/01	Arul		Increased the ced0data last filler to 700 & cnd0dataAC last filler increased to 425. 
3.4 26/08/01	Ali 		Structure for aad0data was added. 
                            Element autoRollFlag was added in gld0data.
3.5 07/11/02	Ali 		Structure for cnd0dataPN was added for alcorp.prt
3.6 15/12/02	Ali 		Element ReviewDate was added in aad0data.
3.7 15/12/02	Arul		1. Addition of und0data; Add riskClass field in crd0data
3.8 24/04/03	Arul		offset and length are added; aad0data modified to be
							upto-date using ACCDET parameter.
3.9 03/06/03    Arul        Filler field added to rid0data, increased the final filler for pens, pennot & peninh
3.10 18/06/03    Arul       Structure of sysres/opfile added which has the Bankmaster userIds
						    Structure for bkd0data added for blocking/unblocking feature
3.11 01/08/03    Arul       1. "Sama Account Status" flag added in GL0DATA
							2. Block/unblock history file
							3. directposting history header file
							4. directposting history trans  file
							5. Account status before freezing
  							6. cnd0dataNR record added for narrative code & description
3.12 13/10/03    Arul       THD0DATA structure changed to add FDE_UPDATE Flag 
							for CCPAY.
3.13 23/11/03   Arul        Shadow diary structure added
3.14 08/06/04   Arul        New user defined field in GL for dormant status & a/c status prior to restriction due to dormancy
3.15 02/08/04   Arul        1. Add cheque deletion flat in PYD0DATA
							2. Added AtmWithdrawalLimit in o2d0data
3.16 17/10/04   Arul        1. fud0data layout added.
							2. MR record layout added for cnd0data
3.17 28/10/04   Arul        1. Fields added to dpheader/dptrans for FINONE
                            2. New layout of dpdiary/dpard added for FINONE
3.18 23/01/05	Rajesh		1. New layout of ccarrblk added for Credit card arrear blocking 
							2. Layout of ccpayhist added 

3.19 25/02/05   Rajesh      Added "migrationLoanMemo" in ank0dataM1 structure 
3.20 11/03/05   Rajesh      Added "migrationFlag" in ard0data structure 
3.21 15/06/05	Rajesh		Added "lastUsedSoNo" field in gld0data structure
3.22 13/07/05	Rajesh		New layout of ank0dataRT for having postingAllowedFlag for Direcposting
3.22 03/08/05	Rajesh		New layout of dpmsgs for error code mapping from directpost to  fundTransfer 
3.23 15/08/05	Rajesh		Added "orgTransCategory" field in dpheader to hold original transction category 
							after reversal 
3.24 17/08/05	Rajesh		Following new layouts are added for letter generation 
								1. letter
								2. letseq  (for letter sequence number)
							The field "remarks" added in sod0data to display in Static data 		
3.25 20/09/05	B.M. ali   Two fields i.e. newRvPrd and newRvFreq were added 
						   into aad0data.
3.26 23/10/05	Rajesh		Added the field "bpPackageFlag" in CRD0DATA to store the 
3.27 07/01/06	B.M. ali   Three fields called drInterestPYTD, drInterestCYTD, 
						   crInterestPYTD were added (on already existing filler
						   of 42) into aad0data, from position 204 to 245. 
3.28 27/03/06	Arul       Exchange rate length in cnd0dataXC extended          
3.29 06/11/06   B.M. Ali   Structure for mrd0data was added.                    
3.30 10/23/06   Arul       Added fields in CRD for Fee charging process         
3.31 15/03/07	Rajesh	   Brought the file layouts for serviceFeeLog & serviceFeeCtl
						   from servicefee.h to here (layout.h)
3.32 10/23/06   Mohit      1. Added 'tdlUpdateFlag' field in thd0data for fund transfer from omni account
						   	  to tradeNet account.
						   2. Layout of 'omnitrnhist' added
						   3. Chargable amount for alpha packaged flag from A to Z were added under
							  serviceFeeCtl structure for both daily and monthly fee charging programes.

3.33 28/08/07   B.M.Ali    Struct for transaction archieval master & detail 
						   files were added.                 

3.34 19/10/08	Rajesh	   Added a field "chipCardIssued" in crd0data 
*/

/* Structure definition for file access */

struct opfile {
	char    liveChar;			/*0-1*/
	char    userId[3];			/*1-3*/
	char    branchCode[4];		/*3-170*/
	char    activeFlag;			/*173-1*/
	char	filler[500];		/*174-500*/
};

struct bsf0data {
	char    liveChar;			/*0-1*/
	char    recType[2];			/*1-2*/
	char    branchCode[4];		/*3-4*/
	char    bsCode[5];			/*7-5*/
	char    indicator;			/*12-1*/
	char    filler1[5];			/*13-5*/
	char    sarBal[16];			/*18-16*/
	char	fxBal[16];			/*34-16*/
	char	currDate[6];		/*50-6*/
	char	eomSarBal[16];		/*56-16*/
	char	eomFxBal[16];		/*72-16*/
	char	eomDate[6];			/*88-6*/
	char	prevEomSarBal[16];	/*94-16*/
	char	prevEomFxBal[16];	/*110-16*/
	char	prevEomDate[6];		/*126-6*/
	char	filler[50];			/*131-50*/
};

struct req0data {
	char    liveChar;        /*0 - 1*/
	char    zeros[6];        /*1 - 6*/ /* forced by easidata for date default */
	char    recType[3];      /*7 - 3*/
	char    accNo[13];      /*10 - 13*/
	char    filler1[7];     /*23 - 7*/
	char    branchCode[4];  /*30 - 4*/
	char    reqSource;      /*34 - 1*/	/* B- Branches, A- ATM, P-Phone Bank */
	char    chequeType;     /*35 - 1*/	/* 1- personal; 2- corporate */
	char    booksRequested[2]; /*36 -2*/
	char    requestDate[6];    /*38 -6*/         /* YYMMDD  Easidata format */
	char    deliveryOption;	   /*44 -1*/         /* 0 - Branch; 1 - by Mail */
	char	requestBranchCode[4];	/*45 - 4*/   /* Version 3.0 change */
	char	deliveryBranchCode[4];	/*49 - 4*/   /* Version 3.6 change */
	char    filler[480];            /*53 - 480*/ /* early it was 35 */
};

struct bmcb01   {
	char    brnCode[3];
	char    chequeType;
	char    ledger;
	char    subAcc[2];
	char    clientNo[8];
	char    bankingDate[8];
	char    transitCode[2];
	char    transCode[2];
	char    lngCode;
	char    clientName[60];
	char    chequeFrom[6];
	char    chequeTo[6];
};

struct mmd0data {
	char	liveChar;							/*0 - 1*/
	char	memoCode[3];						/*1 - 3*/
	char	arabicDescription[30];				/*4 - 30*/
	char	englishDescription[30];				/*34- 30*/
	char	crBalCode[5];						/*64- 5*/
	char	drBalCode[5];						/*69- 5*/
	char	productType;  						/*74 - 1*/ 
							/*1-fixture multiMaturity; 
							2-single maturity;
							3-variable account;
							4-Internal account;
							5-FixedAssetAccount*/
	char	variableRateFlag;	/*0-No, 1-Yes*/	/*75 - 1*/
	char	processFlag;						/*76 - 1*/
	char	filler[61];							/*77 -61*/
	char	consumerLoanFlag;					/*138-1*/
	char	filler1[200];
};

/* account notes file */

struct acn0data {
	char	liveChar;
	char	accNo[13];
	char	filler[7];
	char	holdCode[3]; /* can be GRN, OBD, BLK, XXX, REF, RFD or RFC */
	char	referenceNo[15];
	char	note[50];
	char	heldAmt[14];
	char	heldDate[6];
	char	heldTime[6];	
	char	tellerAdviceCode;
	char	filler1[200];
};

struct ank0data 
{
	char    liveChar;			/*  0 - 1 */
	char    recType[2]; 		/*  1 - 2 */  /* BR */
	char    branchCode[4];		/*  3 - 4 */
	char    branchName[30];		/*  7 - 30*/
	char    catagory[3];		/* 37 - 3 */
	char    branchLngInd;		/* 40 - 1 */
	char    currentRangeBeg[7]; /* 41 - 7 */
	char    currentRangeEnd[7]; /* 48 - 7 */
	char    nextRangeBeg[7];	/* 55 - 7 */
	char    nextRangeEnd[7];	/* 62 - 7 */
	char    lastStarterNo[7];	/* 69 - 7 */
	char    maximumStarter[3];  /* 76 - 3 */
	char    transitCode[2];		/* 79 - 2 */
	char	filler[16];			/* 81 - 16*/
	char	mainBrCode[4];		/* 97 - 4 */
	char	accruedException;	/*101 - 1 */ /* 1-anb660 should ignore; 0-anb660 should include */
	char	pseudoBranch;		/*102 - 1 */ /* 1-realBranch; 0-pseudoBranch */
	char	regionCode;			/*103 - 1*/ /* 1-Central; 2-Western; 3-Eastern */
	char	branchCategory;		/*104 - 1*/ /* 0-Retail; 1-Commercial; 2-Corporate */
	char	islamiBranch;		/*105 - 1*/ /* 0-No; 1-Yes */
	char	areaCode[2];		/*106 - 2*/
	char	finoneBranch;		/*108 - 1*/
	char    filler1[248];   	/*109 - 248*/
};

struct ank0dataMM {
	char	liveChar;				/* 0 	1	*/
	char	recType[2];				/* 1	2	*/
	char	ledgerCode[3];			/* 3	3	*/
	char	filler2;				/* 6    1   */
	char	loanAnalysisFlag;		/* 7    1   */
	char	feeIncomeFlag;			/* 8    1   */
	char	memoDesc[30];			/* 9	30	*/
	char	intReceived1[3];		/* 39	3	*/
	char	doubtFlag;				/* 42	1 	*/
	char	arrearMemo[3];    		/* 43	3	Mail from salah dt.15-May-99*/
	/*
	char	btsDrCode[3];			/* 46	3	old
	*/
	char	islamicLoan;		    /* 46   1   */ /*required for lancia*/
	char	zeroDebitInt;			/* 47   1   */ /*required for lancia*/
	char	filler2a;				/* 48   1   */
	char	intPaid[3];				/* 49	3	*/
	char	catagory[2];			/* 52	2 	*/
	char	analysisFlag;			/* 54	1	*/
	char	deleteInhibit;			/* 55	1	*/
	char	doubtMemo[3];			/* 56 	3	*/
	char	intIncome1[3];			/* 59	3	*/
	char	intAdv;					/* 62	1	*/
	char	intReceived2[3];		/* 63	3	*/
	char	intPaid2[3];			/* 66	3	*/
	char	intExpense1[3];			/* 69	3	*/
	char	intIncome2[3];			/* 72	3	*/
	char	intExpense2[3];			/* 75	3	*/
	char	filler3[2];				/* 78	2	*/
	char	defaultAcc[2];			/* 80	2	*/
	char	rateAdvise;				/* 82	1	*/
	char	intFrequency;			/* 83	1	*/
	char	intAppMonth[2];			/* 84	2	*/
	char	intAppDay[2];			/* 86	2	*/
	char	intAppType;				/* 88	1 	*/
	char	doubtFlag2;				/* 89	1	*/
	char	statementFrequency;		/* 90	1	*/
	char	statementMonth[2];		/* 91	2	*/
	char	statementDay[2];		/* 93	2	*/
	char	limitFlag;				/* 95	1	*/
	char	crBase[2];				/* 96	2 	*/
	char	drBase[2];				/* 98	2	*/
	char	confAdvise;				/* 100	1	*/
	char	plDrCode[5];			/* 101	5	*/
	char	plCrCode[5];			/* 106	5	*/
	char	bsDrCode[5];			/* 111	5	*/
	char	bsCrCode[5];			/* 116	5	*/
	char	reconFlag;				/* 121	1	*/
	char	balanceFlag;			/* 122	1	*/
	char	interFlag;				/* 123	1	*/
	char	matureFlag;				/* 124	1	*/
	char	memTFlag;				/* 125	1	*/
	char	memSubFlag;				/* 126	1	*/
	char	fundFlag;				/* 127	1	*/
	char	filler4[200];
};

struct ank0dataM1 
{
	char	liveChar;				/* 0  1 */
	char	recType[2];				/* 1  2 */
	char	ledgerCode[3];			/* 3  3 */
	char	filler;					/* 6  1 */
	char	minimumBal[10];			/*without decimal and in SAR 7 - 10*/
	char	crIntRateFlag;			/*17  1 */
	char	crIntMemo[3];			/*18  3 */
	char	intInAdv[3];			/*21  3 */
	char	loanFlag;				/*24  1 */ /* 1- consumer loan */
	char	anb610RowNum;			/*25  1 */
	char    anb610ColNum;			/*26  1 */
	char	anb610ColHeading[12];	/*27 12 */
	char	timeDepositFlag;		/*39 1	*/
	char	bmLoanFlag;       		/*40 1	*/ /* anb695 report the account when the flag is set to 1 */
	char	migrationLoanMemo[3];	/*41 3  */
	char	anb120PFlag;			/*44 1 */
	char	lgLcMemos;				/*45 1 */ /* 1-lgLcMemo */
	char	accDeleteFromOpen[3];	/*46 3 */ /* Number of days since a/c open date to mark for deletion*/
	char	filler2[250];			/*49  250*/
};

struct ank0dataXC 
{
	char	liveChar;				/*0 1 */
	char	recType[2];				/*1 2 */
	char	currCode[4];			/*3 4 */
	char	currDesc[30];			/*7 30*/
	char	fixRate[9];				/*37 9 */
	char	exRate[9];				/*46 9 */			/*9(4)V9(5)*/
	char	filler;					/*55 1 */
	char	dormantFee[10];			/*56 10*/
	char	minimumBal[10];			/*66 10*/
	char	filler2[200];
};

struct ank0dataGW {
	char	liveChar;
	char	recType[2];
	char	gwNo[4];
	char	payrollFlag; 	/*0-No; 1-Yes*/
	char	blockingDays[2];
	char	pensionGwFlag; 	/*0-No; 1-Yes*/
	char	suspenseLedger[3];
	char	suspenseCustNo[6];
	char	suspenseSubAccNo[2];
	char	filler2[250];
};

struct ank0dataRT 
{
	char	liveChar;		/* 0 - 1 */
	char	recType[2];     /* 1 - 2 */ /* RT */
	char	code[4]; 		/* 3 - 4 */ /* it will be "0000" */
	char	postingAllowed; /* 7 - 1 */ /*0-No; 1-Yes*/
	char	filler2[260];
};

struct gld0data 
{
	char    liveChar;				/*0-1*/
	char    filler1[20];			/*1-20*/
	char    accNo[13];				/*21-13*/
	char    filler2[11];			/*34-11*/
	char    recType[2];				/*45-2*/
	char    accDesc[30];			/*47-30*/
	char    accOpenDate[6];			/*77-6*/
	char    filler3[2];				/*83-2*/
	char    bookBal[14];			/*85-14*/
	char    filler4[2];				/*99-2*/
	char    clearedBal[14];			/*101-14*/
	char    filler5[2];				/*115-2*/
	char    forwardAmt[14];			/*117-14*/
	char    filler6[2];				/*131-2*/
	char    reportBal[14];			/*133-14*/
	char    lastTransDate[6];		/*147-6*/
	char    transCount[5];			/*153-5*/
	char    crIntRate[9];			/*158-9*/
	char    drIntRate[9];			/*167-9*/
	char    filler7[2];				/*176-2*/
	char    accruedInt[14];			/*178-14*/
	char    filler8[16];			/*192-16*/
	char    lastAccrualDate[6];		/*208-6*/
	char    filler9[2];				/*214-2*/
	char    reportAccruedInt[14];	/*216-14*/
	char    filler10[16];			/*230-16*/
	char    reportIntAccrualDate[6];	/*246-6*/
	char    filler11[2];			/*252-2*/
	char    yearToDateInt[14];		/*254-14*/
	char    filler12[18];			/*268-18*/
	char    payeIntCredit[14];		/*286-14*/
	char    filler13[2];			/*300-2*/
	char    payeIntDebit[14];		/*302-14*/
	char    creditBaseRateCode[2];	/*316-2*/
	char    creditMarginOverBaseRate[8];	/*318-8*/
	char    debitBaseRateCode[2];	/*326-2*/
	char    debitMarginOverBaseRate[8];		/*328-8*/
	char    minIntRate[9];			/*336-9*/
	char    maxIntRate[9];			/*345-9*/
	char    rateChangeAdviceFlag;	/*354-1*/
	char    dateOfLastRateChange[6];/*355-6*/
	char    intApplication;			/*361-1*/
	char    payAccNo[13];			/*362-13*/
	char    filler14[7];			/*375-7*/
	char    intApplicationFreq[3];	/*382-3*/
	char    intApplicationAdvice;	/*385-1*/
	char    lastIntApplicationDate[6];	/*386-6*/
	char    filler15[2];				/*392-2*/
	char    lastIntApplicationAmt[14];	/*394-14*/
	char    filler16[2];				/*408-2*/
	char    accLimit[12];				/*410-12*/
	char    matchingLoan[13];			/*422-13*/
	char    filler17[7];				/*435-7*/
	char    maturityDate[6];			/*442-6*/
	char    VATAccount;					/*448-1*/
	char    atmAccount;					/*449-1*/
	char    filler18[5];				/*450-5*/
	char    initialLoanAmt[14];			/*455-14*/
	char    reviewDate[6];				/*469-6*/
	char    drawerName[15];				/*475-15*/
	char    filler19;					/*490-1*/
	char    brokerNum[6];				/*491-6*/
	char    statementFrequency[3];		/*497-3*/
	char    statementDay[2];			/*500-2*/
	char    lastStatementDate[6];		/*502-6*/
	char    filler20[2];				/*508-2*/
	char    lastStatementBal[14];		/*510-14*/
	char    lastStatementNum[3];		/*524-3*/
	char    lastStatementTrans[5];		/*527-5*/
	char    filler21;					/*532-1*/
	char    correspondentAddress[6];	/*533-6*/
	char    signatureCode;				/*539-1*/
	char    confirmationAdviceFlag;		/*540-1*/
	char    cashAccFlag;				/*541-1*/
	char    memorandumField1[20];		/*542-20*/
	char    memorandumField2[20];		/*562-20*/
	char    branchCode[4];          	/*582 - 4*/
	char    memField3Rest[6];       	/*586-6 memorandum field 3 -redefined */
	char    memorandumIndicator1[2];	/*592-2*/
	char    memorandumIndicator2[2];	/*594-2*/
	char    memorandumIndicator3[2];	/*596-2*/
	char    memorandumIndicator4[2];	/*598-2*/
	char    memorandumIndicator5[2];	/*600-2*/
	char    interbankCode;				/*602-1*/
	char    nonResidentCode;			/*603-1*/
	char    passwd;						/*604-1*/
	char    creditIntRate[9];			/*605-9*/
	char    debitIntRate[9];			/*614-9*/
	char    debitTransCount[4];			/*623-4*/
	char    creditTransCount[4];		/*627-4*/
	char    debitTransCountYTD[5];		/*631-5*/
	char    creditTransCountYTD[5];		/*636-5*/
	char    intPaidAcc;					/*641-1*/
	char    intReceivedAcc;				/*642-1*/
	char    filler22[2];				/*643-2*/
	char    baseCurrEqui[14];			/*645-14*/
	char    startDate[6];				/*659-6*/
	char    memoGroup[3];				/*665-3*/
	char    noStatementToPrint;			/*668-1*/
	char    mailingInstructions;		/*669-1*/
	char    serviceFee[4];				/*670-4*/
	char    filler23[2];				/*674-2*/
	char    minServiceFee[14];			/*676-14*/
	char    filler24[2];				/*690-2*/
	char    maxServiceFee[14];			/*692-14*/
	char    filler25[2];				/*706-2*/
	char    accruedServiceFee[14];		/*708-14*/
	char    filler26[2];				/*722-2*/
	char    highestCreditBal[14];		/*724-14*/
	char    filler27[2];				/*738-2*/
	char    lowestCreditBal[14];		/*740-14*/
	char    filler28[2];				/*754-2*/
	char    valueOfCreditTrans[14];		/*756-14*/
	char    filler29[2];				/*770-2*/
	char    highestDebitBal[14];		/*772-14*/
	char    filler30[2];				/*786-2*/
	char    lowestDebitBal[14];			/*788-14*/
	char    filler31[2];				/*802-2*/
	char    valueOfDebitTrans[14];		/*804-14*/
	char    filler32[2];				/*818-2*/
	char    accumulatedDailyBal[14];	/*820-14*/
	char    LWDBalAccum[2];				/*834-2*/
	char    intBaseDays[3];				/*836-3*/
	char    reconcilationAcc;			/*839-1*/
	char    fromChqNo[6];				/*840-6*/
	char    lastSlNo[6];				/*846-6*/
	char    filler33[2];				/*852-2*/
	char    FXPosAccBookBal[14];		/*854-14*/
	char    accServiceCharges[13];		/*868-13*/
	char    filler34[7];				/*881-7*/
	char    PLDebitBal[5];				/*888-5*/
	char    PLCreditBal[5];				/*893-5*/
	char    PLDebitAcruedInt[5];		/*898-5*/
	char    PLCreditAccruedInt[5];		/*903-5*/
	char    PLDebitAccruedIntContra[5];	/*908-5*/
	char    PLCreditAccruedIntContra[5];/*913-5*/
	char    BSDebitBal[5];				/*918-5*/
	char    BSCreditBal[5];				/*923-5*/
	char    BSDebitAcruedInt[5];		/*928-5*/
	char    BSCreditAccruedInt[5];		/*933-5*/
	char    BSDebitAccruedIntContra[5];	/*938-5*/
	char    BSCreditAccruedIntContra[5];/*943-5*/
	char    commercialLoan[3];			/*948-3*/
	char    filler35[2];				/*951-2*/
	char    dailyClosBal[14];			/*953-14*/
	char    dealMarginRate[8];			/*967-8*/
	char    tlxFormatFlag;				/*975-1*/
	char    inactiveAccFlag;			/*976-1*/
	char    interbranchFlag;			/*977-1*/
	char    moneyMarketIntAccFlag;		/*978-1*/
	char    filler36[2];				/*979-2*/
	/*
	char    loanAmtAdvance[14];
	char    filler37[2];
	char    equalPayment[14];
	char    filler38[2];
	*/
	char	finalMaturityDate[6];			/* 0981 -  6 */
	char	filler37[3];					/* 0987 -  3 */
	char	blockedAmt[14];					/* 0990 - 14 */
	char	filler38[9];					/* 1004 -  9 */
	char    initailIntLoan[14];				/* 1013 - 14 */
	char    noticePeriod[3];				/* 1027 - 3 */
	char    originalDealNo[6];				/* 1030 - 6 */
	char    lastDealNo[6];					/* 1036 - 6 */
	char    limitCheckFlag;					/* 1042 - 1 */
	char    witholdingTaxInd;				/* 1043 - 1 */
	char    filler39[2];					/* 1044 - 2 */
	char    lowestBal[14];					/* 1046 - 14 */
	char    accLimitReviewDate[6];			/* 1060 - 6 */
	char    intApplicationDay[2];			/* 1066 - 2*/
	char    lineNumber1[3];					/* 1068 - 3*/
	char    lineNumber2[3];					/* 1071 - 3*/
	char    lineNumber3[3];					/* 1074 - 3*/
	char    lineNumber4[3];					/* 1077 - 3*/
	char    filler40;						/* 1080 - 1*/
	char    lastAmendmentDate[6];			/* 1081 - 6*/
	char    filler41[2];					/* 1087 - 2*/
	char    accDailyOpenBal[14];			/* 1089 - 14*/
	char    forwardFixtureBreakDate[6];		/* 1103 - 6*/
	char    centralBankCodeDefaults[33];	/* 1109 -33*/
	char    filler42[7];					/* 1142 - 7*/
	char    customerBankOfEng[13];			/* 1149 -13*/
	char    tessaInd;						/* 1162 - 1*/
	char    SCBChqComm;						/* 1163 - 1*/
	char    filler43[2];					/* 1164 - 2*/
	char    posAccBaseEquiv[14];			/* 1166 -14*/
	char    compundIntFlag;					/* 1180 - 1*/
	char    excludePosAcc;					/* 1181 - 1*/
	char    on2CardHolder;					/* 1182 - 1*/
	/*char    filler44[252];*/
	char	filler44d[9];						/*1183-9*/
	char	inclInAlcoProcess;					/*1192-1*/
	char	temporaryLimitExpiryDate[6];		/*1193-6*/
	char	filler44[2];						/*1199-2*/
	char	temporaryLimit[12];					/*1201-12*/
	char	filler44a[2];						/*1213-2*/
	char	blockedArrear1[14];					/*1215-14*/
	char	filler44b[2];						/*1229-2*/
	char	blockedArrear2[14];					/*1231-14*/

	char	filler44c[49];						/*1245-49*/
	char	intAppMethodCr;						/*1294-1*/
	char	payAccNoCr[13];						/*1295-13*/
	char	filler44c1[7];						/*1308-7*/
	char	intAppFreqCr[3];					/*1315-3*/
	char	intAppDayCr[2];						/*1318-2*/
	char	filler44c2[2];						/*1320-2*/
	char	lastIntAppAmtCr[14];				/*1322-14*/
	char	lastIntAppDateCr[6];				/*1336-6*/
	char	filler44c3[17];						/*1342-17*/
	char	intBaseDaysCr[3];					/*1359-3*/
	char	fromChequeNo[8];					/*1362-8*/
	char	toChequeNo[8];						/*1370-8*/
	char	filler44c4[56];						/*1378-56*/

	char	autoRollFlag;						/*1434, 1*/
	char	mt320Produced;						/*1435, 1*/
	char	filler44u[114];						/*1436, 6+1342,10+1452,98*/
	char	settlementAccNo[13];				/*1550, 13*/
	char	filler44v[7];						/*1563, 7*/
	char	availableFunds;						/*1570, 1*/
	char	repaymentPriority;					/*1571, 1*/
	char	loanStatus;							/*1572, 1*/
	char	loanStatusChanged;					/*1573, 1*/
	char	loanStatusChangeDate[6];			/*1574, 6*/
	char	doubtIntPaid;						/*1580, 1*/
	char	doubtIntReceived;					/*1581, 1*/
	char	loanDrawndownDate[6];				/*1582, 6*/
	char	finalRepaymentDate[6];				/*1588, 6*/
	char	lastFullyPaidDate[6];				/*1594, 6*/
	char	filler44w[2];						/*1600, 2*/
	char	doubtYtdInt[14];					/*1602, 14*/
	char	filler44x[2];						/*1616,2*/
	char	intLastRun[14];						/*1618,14*/
	char	filler44y[2];						/*1632,2 */
	char	accruedYtd[14];						/*1634, 14*/
	char	loanRunningFlag;					/*1648, 1*/
	char	filler44z[199];						/*1649, 199*/
	char	overdrawnDate[6];					/*1848, 6*/
	char	bmPnpProcessFlag;					/*1854, 1*/
	char    filler45[5];						/*1855, 5*/
	char    uniqueNo[5];						/*1860, 5*/
	char    uniqueSubNo1[2];					/*1865, 2*/
	char    uniqueSubNo2[2];					/*1867, 2*/
	char    dayTransCount[5];					/*1869, 5*/
	char	prevYearBal[14];				    /*1874, 14*/
	char	others[12];							/*1888, 12*/
	char	atmCardType;						/*1900, 1 */ 
	char	deleteInhibit;						/*1901, 1 */
	char	CBookEntitled;						/*1902, 1*/
	char	chargebleCBook;						/*1903, 1*/
	char	lastCBookFromAtm[6]; 				/*1904, 6*/
	char	statementException;					/*1910, 1*/
	char	filler46[10];						/*1911,10*/
	char	alKanz[2];							/*1921,2*/
	char	reneiwalCode;						/*1923,1*/
	char	giftCode[2];						/*1924,2*/
	char	copacaCustomer;						/*1926,1*/
	char	atmOverDraft;						/*1927,1*/
	char	intEarnedInAdvance[10];				/*1928,10*/
	char	historyJewelLoan;					/*1938,1*/
	char	samaAccStatus;						/*1939,1*/ /*0-active;1-inactive;2-Dormant;3-Unclaimed*/
	char	passwdBeforeFreeze;	                /*1940,1*/
	char	anbDormantFlag;                     /*1941,1*/
	char    passwdBeforeDormantRestriction;	    /*1942,1*/
	char	lastUsedSoNo[6];					/*1943,6*/
	char	lgLcBlockStatus;					/*1949,1*//*0-Blocking in effect; 1-Unblocked*/
	char	iban[24];                           /*1950,24*/
	char	intToBeAmortized[10];				/*1974,10*/
	char	amortizedInt[10];					/*1984,10*/
	char	lastFreezedDate[6];					/*1994,6*/
	char	freezeReason[30];					/*2000,30*/
	char    filler[200];
};

struct gld0data05 
{
	char	liveChar;					/*0-1*/
	char	filler1[20];				/*1-20*/
	char	accNo[13];					/*21-13*/
	char	filler2[11];				/*34-11*/
	char	recType[2];					/*45-2*/
	char	accDesc[30];				/*47-30*/
	char	filler3[3];					/*77-3*/
	char	bookBal[15];				/*80-15*/
	char	filler4[3];					/*95-3*/
	char	clearedBal[15];				/*98-15*/
	char	filler5[3];					/*113-3*/
	char	forwardBal[15];				/*116-15*/
	char	filler6[3];					/*131-3*/
	char	reportBal[15];				/*134-15*/
	char	filler7[3];					/*149-3*/
	char	weekToDateBal[15];			/*152-15*/
	char	filler8[3];					/*167-3*/
	char	monthToDateBal[15];			/*170-15*/
	char	filler9[3];					/*185-3*/
	char	yearToDateBal[15];			/*188-15*/
	char	filler10[3];				/*203-3*/
	char	accruedInt[15];				/*206-15*/
	char	filler11[21];				/*221-21*/
	char	reportAccruedInt[15];		/*242-15*/
	char	filler12[21];				/*257-21*/
	char	weeklyInt[15];				/*278-15*/
	char	filler13[21];				/*293-21*/
	char	monthlyInt[15];				/*314-15*/
	char	filler14[21];				/*329-21*/
	char	yearlyInt[15];				/*350-15*/
	char	filler15[18];				/*365-18*/
	char	noOfAccs[5];				/*383-5*/
	char	noOfTrans[5];				/*388-5*/
	char	averageIntRate[9];			/*393-9*/
	char	filler16[24];				/*402-24*/
	char	intPaySuspenseAcc[13];		/*426-13*/
	char	filler17[7];				/*439-7*/
	char	intRecevSuspenseAcc[13];	/*446-13*/
	char	filler18[7];				/*459-7*/
	char	balTransCount[5];			/*466-5*/
	char	dayOfWeek[2];				/*471-2*/
	char	dayOfMonth[2];				/*473-2*/
	char	dayOfYear[3];				/*475-3*/
	char	filler19[2];				/*478-2*/
	char	limitMemoGroup[12];			/*480-12*/
	char	accServiceCharges[13];		/*492-13*/
	char	filler20[7];				/*505-7*/
	char	plCodes[30];				/*512-30*/
	char	bsCodes[30];				/*542-30*/
	char	intRecevAcc1[13];			/*572-13*/
	char	filler21[7];				/*585-7*/
	char	intRecevAcc2[13];			/*592-13*/
	char	filler22[7];				/*605-7*/
	char	intRecevAcc3[13];			/*612-13*/
	char	filler23[7];				/*625-7*/
	char	intRecevAcc4[13];			/*632-13*/
	char	filler24[7];				/*645-7*/
	char	intRecevAcc5[13];			/*652-13*/
	char	filler25[7];				/*665-7*/
	char	intRecevAcc6[13];			/*672-13*/
	char	filler26[7];				/*685-7*/
	char	intPaidAcc1[13];			/*692-13*/
	char	filler27[7];				/*705-7*/
	char	intPaidAcc2[13];			/*712-13*/
	char	filler28[7];				/*725-7*/
	char	intPaidAcc3[13];			/*732-13*/
	char	filler29[7];				/*745-7*/
	char	intPaidAcc4[13];			/*752-13*/
	char	filler30[7];				/*765-7*/
	char	intPaidAcc5[13];			/*772-13*/
	char	filler31[7];				/*785-7*/
	char	intPaidAcc6[13];			/*792-13*/
	char	filler32[8];				/*805-8*/
	char	accType[2];					/*813-2*/
	char	defaultAccDesc[30];			/*815-30*/
	char	rateChangeAdviceFlag;		/*845-1*/
	char	intApplicationFreq[3]; 		/*846-3 frequency+month-like in detail*/
	char	statementFrequency[3];   	/*849-3 frequency&month-like in detail*/
	char	statementDay[2];			/*852-2*/
	char    confirmationAdviceFlag;		/*854-1*/
	char	serviceFee[4];				/*855-4*/
	char	loanClass[3];				/*859-3*/
	char    intApplicationDay[2];		/*862-2*/
	char    intApplication;				/*864-1*/
	char	intApplicationAdvice;		/*865-1*/
	char	withHoldingTax;				/*866-1*/
	char	autoGenerateAcc;			/*867-1*/
	char	filler33[34];				/*868-34*/
	char	commisionFlatAmtFlag;		/*902-1*/
	char	filler34[2];				/*903-2*/
	char	commisionFlatAmtCust[12];	/*905-12*/
	char	filler35[2];				/*917-2*/
	char	commisionFlatExtCust[12];	/*919-12*/
	char	startDay[2];				/*931-2*/
	char	minIntApp;					/*933-1*/
	char	minDrAmt[5];				/*934-5*/
	char	minCrAmt[5];				/*939-5*/
	char	filler37[6];				/*944-6*/
	char	weekAverageIntRate[9];		/*950-9*/
	char	monthAverageIntRate[9];		/*959-9*/
	char	yearAverageIntRate[9];		/*968-9*/
	char	filler38[39];				/*977-39*/
	char	yearEndBal[15];				/*1016-15*/
	char	filler39[3];				/*1031-3*/
	char	yearEndInt[15];				/*1034-15*/
	char	filler40[18];				/*1049-18*/
	char	standOrderCommAcc[13];		/*1067-13*/
	char	filler41[7];				/*1080-7*/
	char	standOrderChequeAcc[13];	/*1087-13*/
	char	filler42[7];				/*1100-7*/
	char	standOrderSuspenseAcc[13];	/*1107-13*/
	char	filler43[7];				/*1120-7*/
	char	commissionRate[4];			/*1127-4*/
	char	minCharge[5];				/*1131-5*/
	char	maxCharge[5];				/*1136-5*/
	char	chequeCharge[4];			/*1141-4*/
	char	minChargeCheque[5];			/*1145-5*/
	char	maxChargeCheque[5];			/*1150-5*/
	char	intRecevAcc[13];			/*1155-13*/
	char	filler44[7];				/*1168-7*/
	char	cashLoanAcc[13];			/*1175-13*/
	char	filler45[7];				/*1188-7*/
	char	serviceFeeFlag;				/*1195-1*/
	char	earningAcc[11];				/*1196-11*/
	char	filler46[9];				/*1207-9*/
	char	commisionPaidAcc[13];		/*1216-13*/
	char	filler47[7];				/*1229-7*/
	char	alternateMemoDesc[30];      /*1236-30*/
	char    filler48[522];				/*1266-522*/
	char	forBankOfEngland[60];     	/*1788-60*/
	char	filler49;                 	/*1848-1*/
	char	crditBaseRateCode[2];		/* 1849-2 */
	char	debitBaseRateCode[2];		/* 1851-2 */
	char	filler50[61];				/* 1853-61*/
	char	limitCheckFlag;				/* 1914-1 */
	char	reconcilationAcc;			/* 1915-1*/
	char	userArea[200];				/* 1916-200*/
};


struct custLim 
{
	char    filler1;				/*0-1*/
	char    userLimit[7];			/*1-7*/
	char    signOfUserLimit;		/*8-1*/
	char    filler2;				/*9-1*/
	char    userExposure[7];		/*10-7*/
	char    signOfUserExposure;		/*17-1*/
};

struct crd0data 
{
	char    liveChar;					/*0-1*/
	char    accNoExt;					/*1-1*/
	char    accNo[6];					/*2-6*/
	char    shortName[30];				/*8-30*/
	char    address1[30];				/*38-30*/
	char    address2[30];				/*68-30*/
	char    address3[20];				/*98-20*/
	char    address4[20];				/*118-20*/
	char    address5[10];				/*138-10*/
	char    nonResident;				/*148-1*/
	char    alphaSearchCode[6];			/*149-6*/
	char    primaryAccNum[13];			/*155-13*/
	char    filler1[7];					/*168-7*/
	char    interBank;					/*175-1*/
	char    dateOfBirth[8];				/*176-8*/
	char    staffMember;				/*184-1*/
	char    language;					/*185-1*/
	char    sex;						/*186-1*/
	char    gappedAnalysisInd;			/*187-1*/
	char    fileMainteanceChange;		/*188-1*/
	char    filler2;					/*189-1*/
	char    corrAddressRef[6];			/*190-6*/
	char    tlxNo[15];					/*196-15*/
	char    filler3[5];					/*211-5*/
	char    swiftNo[11];				/*216-11*/
	char    filler4[4];					/*227-4*/
	char    custName[60];				/*231-60*/
	char    defaultIntpaid;				/*291-1*/
	char    defaultIntreceived;			/*292-1*/
	char    lastAmendmentDate[6]; 		/*293-6*/
	char    forExForwardmonitor;		/*299-1*/
	char    custAnalysisFlag;			/*300-1*/
	char    brokerSettlementReport;		/*301-1*/
	char    brokerCommission[2];		/*302-2*/
	char    custTypeFlag;				/*304-1*/
	char    swiftMemberFlag;			/*305-1*/
	char    creditSwiftAcc[34];			/*306-34*/
	char    debitSwiftAcc[34];			/*340-34*/
	char    labelPrintFlag;				/*374-1*/
	char    languageIndependence[2];	/*375-2*/
	char    alternateCustNo[8];			/*377-8*/
	char    swiftAssociationMsg;		/*385-1*/
	char    filler5;					/*386-1*/
	char    brokerReference[6];			/*387-6*/
	char    BMbusinessType[3];			/*393-3*/
	char    financialInst;				/*396-1*/
	char    withHoldingTax;				/*397-1*/
	char    swiftStatements;			/*398-1*/
	char    commissionApplication;		/*399-1*/
	char    BOECounterParty[4];			/*400-4*/
	char    accLimitFacilityInd;		/*404-1*/
	char    countryOfRisk[4];			/*405-4*/
	char    countryOfResidence[4];		/*409-4*/
	char    businessAnalysis[4];		/*413-4*/
	char    BSDIAnalysis[4];			/*417-4*/
	char    riskWeight[4];				/*421-4*/
	char    limitCheckingFlag;			/*425-1*/
	char    groupLeaderFlag;			/*426-1*/
	char    filler6;					/*427-1*/
	char    groupLeaderNumber[6];		/*428-6*/
	char    limitReviewDate[6];			/*434-6*/
	char    limitExpiryDate[6];			/*440-6*/
	char    sanctionId[3];				/*446-3*/
	char    filler7[21];				/*449-21*/
	char    forExSpotLimit[7];			/*470-7*/
	char    signOfForExSpotLimit;		/*477-1*/
	char    filler8;					/*478-1*/
	char    forExSpotExposure[7];		/*479-7*/
	char    signOfForExSpotExposure;	/*486-1*/
	char    filler9;					/*487-1*/
	char    forExForwardLimit[7];		/*488-7*/
	char    signOfForExForwardLimit;	/*495-1*/
	char    filler10;					/*496-1*/
	char    forExForwardExposure[7];	/*497-7*/
	char    signforExExposure;			/*504-1*/
	char    filler11;					/*505-1*/
	char    moneyMarketDebitLimit[7];	/*506-7*/
	char    signMoneyMarketDebitLimit;	/*513-1*/
	char    filler12;					/*514-1*/
	char    moneyMarketDebitExposure[7];/*515-7*/
	char    signMoneyMarketDebitExposure;/*522-1*/
	char    filler13;					/*523-1*/
	char    moneyMarketCreditLimt[7];	/*524-7*/
	char    signMoneyMarketCreditLimit;	/*531-1*/
	char    filler14;					/*532-1*/
	char    moneyMarketcreditExposure[7];/*533-7*/
	char    signOfMoneyMarketCreditExposure;/*540-1*/
	char    filler15;						/*541-1*/
	char    overallDebitLimit[7];			/*542-7*/
	char    signOfOverallDebitLimit;		/*549-1*/
	char    filler16;						/*550-1*/
	char    overalldebitExposure[7];		/*551-7*/
	char    signOfOverallDebitExposure;		/*558-1*/
	char    filler17;						/*559-1*/
	char    overallCreditLimit[7];			/*560-7*/
	char    signOfOverallCreditLimit;		/*567-1*/
	char    filler18;						/*568-1*/
	char    overallCreditExposure[7];		/*569-7*/
	char    signOfOverallCreditExposure;	/*576-1*/

	struct  custLim custLimit[10];			/*577-180*/

	char    limitCurrCode[2];				/*757-2*/
	char    filler40;						/*759-1*/
	char    forExSpotDeliLimit[7];			/*760-7*/
	char    signOfForExSpotDeliLimit;		/*767-1*/
	char    filler41;						/*768-1*/
	char    forExSpotDeliExposure[7];		/*769-7*/
	char    signOfForExSpotDeliExposure;	/*776-1*/
	char    filler42;						/*777-1*/
	char    forExForwardDeliLimit[7];		/*778-7*/
	char    signOfForExForwardDeliLimit;	/*785-1*/
	char    filler43;						/*786-1*/
	char    forExForwardDeliExposure[7];	/*787-7*/
	char    signOfForExForwardDeliExposure;	/*794-1*/
	char    filler44;						/*795-1*/
	char    loansDepositsDeliExposure[7];	/*796-7*/
	char    signOfLoansDepositDeliExposure;	/*803-1*/
	char    filler45;						/*804-1*/
	char    groupSpotExposure[7];			/*805-7*/
	char    signOfGroupSpotExposure;		/*812-1*/
	char    filler46;						/*813-1*/
	char    groupForwardExposure[7];		/*814-7*/
	char    signOfGroupForwardExposure;		/*821-1*/
	char    swiftAccNumber[35];				/*822-35*/
	char    swiftAlternativeBIC[12];		/*857-12*/
	char    swiftAlternativeAcc[35];		/*869-35*/
	char    consolidationFlag;				/*904-1*/
	char    overallCreditCustTimeLimit[2];	/*905-2*/
	char    overallDebitCustTimeLimit[2];	/*907-2*/
	char    forExSpotExCustTimeLimit[2];	/*909-2*/
	char    forExForwardExCustTimeLimit[2];	/*911-2*/
	char    forExSpotDeliveryCustTimeLimit[2];	/*913-2*/
	char    forExForwardDeliveryCustTimeLimit[2];/*915-2*/
	char    moneyMarketForwardCredit[2];		/*917-2*/
	char    moneyMarketForwardDebit[2];			/*919-2*/
	char    userTimeLimit1[2];					/*921-2*/
	char    userTimeLimit2[2];					/*923-2*/
	char    userTimeLimit3[2];					/*925-2*/
	char    userTimeLimit4[2];					/*927-2*/
	char    userTimeLimit5[2];					/*929-2*/
	char    userTimeLimit6[2];					/*931-2*/
	char    userTimeLimit7[2];					/*933-2*/
	char    userTimeLimit8[2];					/*935-2*/
	char    userTimeLimit9[2];					/*937-2*/
	char    userTimeLimit10[2];			/*  939 - 2 */
	char    filler47[208];				/*  941 - 208*/
	char	newAlphaSearch[15];			/* 1149 - 15*/
	char	nextField[15];				/* 1164 - 15*/
	char	filler48[669];				/* 1179 - 669*/
	char	businessTypeTitle[2];		/* 1848 - 2 */
	char	businessType[3];			/* 1850 - 3 */
	char	nationalityTitle[2];		/* 1853 - 2 */
	char	nationality[3];				/* 1855 - 3 */
	char    branchBr[2];				/* 1858 - 2 */
	char    branchCode[4];				/* 1860 - 4 */
	char    alternativeBranchCode[4];	/* 1864 - 4 */
	char	titleCode[2];				/* 1868 - 2 */
	char	newCustomer;				/* 1870 - 1 */
	char	pinMailer;					/* 1871 - 1 */
	char	maoPacCustomer;				/* 1872 - 1 */
	char	completeAddress;			/* 1873 - 1 */
	char	atmChargeFlag;				/* 1874 - 1 */
	char	filler49[11];				/* 1875 -11 */
	char	uniqueNo[5];				/* 1886 - 5 */
	char	homeTelAreaCode[2];			/* 1891 - 2 */
	char	homeTelNo[7];				/* 1893 - 7 */
	char	homeTelExt[4];				/* 1900 - 4 */
	char	offTelAreaCode[2];			/* 1904 - 2 */
	char	offTelNo[7];				/* 1906 - 7 */
	char	offTelExt[4];				/* 1913 - 4 */
	char	cardType;					/* 1917 - 1 */
	char	accountManager[3];			/* 1918 - 3 */
	char	vipFlag;					/* 1921 - 1 */
	char	packageAcc;					/* 1922 - 1 */
	char	riskClassification;			/* 1923 - 1 */
	char	riskClass[2];				/* 1924 - 2 */
	char	restrictedDateForSAMA[6];	/* 1926 - 6 */
	char	bpPackageFlag;				/* 1932 - 1 */
	char	NINLevelPackageAcc;			/* 1933 - 1 */ /* Service charge fee process usuage */
	char	NINLevelPackageAccCustNo[6];/* 1934 - 6 */ /* Service charge fee process usuage */
	char	NINLevelPayrollType;		/* 1940 - 1 */ /* Service charge fee process ; G-Govt; P-Private; N-SalesStaff; S-Sarie */
	char	NINLevelPayrollCustNo[6];	/* 1941 - 6 */ /* Service charge fee process */
	char	NINLevelPayrollOrgId[4]; 	/* 1947 - 4 */ /* Service charge fee process - Organization ID*/
	char	NINLevelBusinessType[3];	/* 1951 - 3 */
	char	NINLevelBusinessTypeCustNo[6];	/* 1954 - 6 */
	char	anyAccFound;					/* 1960 - 1 */ /* Added by ARUL */
	char	staffAccFound;					/* 1961 - 1 */ /* Added by ARUL */
	char	excludeFromAtmFees;			/* 1962 - 1 */ /* 0-NO; 1-YES */ /* Added by Rajesh for the update through CSD */
	char	excludeFromMinBalFees;		/* 1963 - 1 */ /* 0-NO; 1-YES */ /* Added by Rajesh for the update through CSD */
	char	stmtDeliveryMode;			/* 1964 - 1 */ /* 0-Print Only;1-Email only;2-Both Print&Email */
	char	pkgStmtFreqOverride;        /* 1965 - 1 */ /* 0-No; 1-YES*/
	char	tdAdviseNotRequired;		/* 1966 - 1 */ /* 1-Not required else required */
	char	chipCardIssued;				/* 1967 - 1 */ /* 0-NO; 1-YES*/
	char    filler50[150];
};

struct ced0data 
{
	char    liveChar;
	char    custNoExt;
	char    custNo[6];
	char    filler1[20];
	struct custLim custLimit[70];
	char    custTimeLimit[140];
	char    filler2[700];
};

struct und0data 
{
	char    liveChar;			/* 0 - 1 */
	char    branchCode[4];		/* 1 - 4 */
	char    custNo[6];			/* 5 - 6 */
	char    riskClass[2];		/* 11 - 2 */
	char    limitFlag;			/* 13 - 1 */
	char    filler2[120];
};

struct cnd0data 
{
	char    liveChar;
	char    key[6];
	char    reportDate[6];
	char    filler[500];
};

struct cnd0dataBD   /* for branches */
{
	char    liveChar;             	/*0   - 1*/
	char    key[6];               	/*1   - 6*/
	char    engBrName[30];        	/*7   - 30*/
	char    engBrCity[28];        	/*37  - 28*/
	char    someData[2];          	/*65  - 2*/
	char    arabBrName[30];       	/*67  - 30*/
	char    arabBrCity[30];       	/*97  - 30*/
	char	alcoFlag;				/*127 - 1*/
	char    filler1[72];          	/*128 - 72*/
	char    stmtDay1[2];          	/*200 - 2*/
	char    stmtDay2[2];          	/*202 - 2*/
	char    stmtDay3[2];          	/*204 - 2*/
	char    stmtDay4[2];          	/*206 - 2*/
	char    stmtDay5[2];          	/*208 - 2*/
	char    stmtDay6[2];          	/*210 - 2*/
	char    stmtDay7[2];          	/*212 - 2*/
	char    stmtDay8[2];          	/*214 - 2*/
	char    stmtDay9[2];          	/*216 - 2*/
	char    stmtDayAToZ[52];     	/*218 - 52*/
	char	filler3[280];           /*270 - 280*/
};

struct cnd0dataBR   /* for interest rates */
{
	char    liveChar;
	char    recType[2];
		char	currCode[2];
	char	baseCode[2];
	char	baseRate[9];
	char	changeFlag;
	char	tiredFlag;
	char	calcType;
	char	rate1[9];
	char	filler1[2];
	char	limit1[12];
	char	rate2[9];
	char	filler2[2];
	char	limit2[12];
	char	rate3[9];
	char	filler3[2];
	char	limit3[12];
	char	rate4[9];
	char	filler4[2];
	char	limit4[12];
	char    filler[450];
};

struct cnd0dataBO 
{
	char    liveChar;
	char    key[6];
	char    postBox[10];
	char    filler[500];
};

struct cnd0dataC0 
{
	char    liveChar;
	char    key[6];
	char    reportBalanceDate[6];
	char    filler[600];
};

struct cnd0dataXC 
{
	char    liveChar; 		/* 0  - 1 */
	char    key[6];			/* 1  - 6 */
	char    shortCode[3];	/* 7  - 3 */
	char    curName[30];	/* 10 - 30*/
	char    noOfDays[3];	/* 40 - 3 */
	char    MDFlag;         /* 43 - 1 */     /* Multiply or Divide flag */
	char    exchangeRateExt[2];	/* 44 - 2 */ /*9(6)V9(8) - Extended exchange rate ; earlier named as filler 1*/
	char    exchangeRate[9];/* 46 - 9 */     /* 9(4)V9(5) */
	char    filler2[12];	/* 55 - 12*/     /* first three characters used for extended exchange rate */
	char    chequeAc[13];	/* 67 - 13*/
	char    filler3[7];		/* 80 - 7 */
	char    BOEFlag;		/* 87 - 1 */
	char    telexLook[2];	/* 88 - 2 */
	char    transLimit[2];	/* 90 - 2 */
	char    decimalPlace;	/* 92 - 1 */
	char    suspenseAc[13];	/* 93 - 13*/
	char    filler4[9];		/* 106- 9 */
	char    lDAdj[12];		/* 115- 12*/
	char    filler5[2];		/* 127- 2 */
	char    fxPosAdj[12];	/* 129- 12*/
	char    filler6[2];		/* 141- 2 */
	char    fxBEAdj[12];	/* 143- 12*/
	char    constant[4];	/* 155- 4 */
	char    rndDrAmt;		/* 159- 1 */
	char    rndCrAmt;		/* 160- 1 */
	char	filler7[33];	/* 161- 33*/
	char	drBaseDays[3];	/* 194- 3 */
	char	crBaseDays[3];	/* 197- 3 */
	char    filler8[400];
};

struct cnd0dataTR {
	char    liveChar;				/*0   - 1 */
	char    recType[4];				/*1   - 4 */
	char    transType[2];			/*5   - 2 */
	char    transCode[3];			/*7   - 3 */
	char    transDesc[20];			/*10  - 20 */
	char    dataEntry;				/*30  - 1 */
	char    debitCreditFlag;		/*31  - 1 */
	char    selfBalancingCode;		/*32  - 1 */
	char    narrativeCode;			/*33  - 1 */
	char    contraNarrativeCode;	/*34  - 1 */
	char    fixedNarrative[25];		/*35  - 25*/
	char    filler2;				/*60  - 1 */
	char    oppositTransType[2];	/*61  - 2 */
	char    interBankFlag;			/*63  - 1 */
	char    transClass;				/*64  - 1 */
	char    intRateMaturityDate;	/*65  - 1 */
	char    stoppedPaymentFlag;		/*66  - 1 */
	char    singleContraFlag;		/*67  - 1 */
	char    autoDateFlag;			/*68  - 1 */
	char    closingIntAppl;			/*69  - 1 */
	char    serviceFeeFlag;   		/*70  - 1 */
	char    advFormat[2];			/*71  - 2 */
	char    autoContraAccNo[11];	/*73  - 11*/
	char    filler3[9];				/*84  - 9 */
	char    newAccFlag;				/*93  - 1 */
	char    contraConfirmation[2];	/*94  - 2 */
	char    automaticRefNo;			/*96  - 1 */
	char    AccLimitCheck;			/*97  - 1 */
	char    intAmtCrossCheck;		/*98  - 1 */
	char    moneyMarketDeal;		/*99  - 1 */
	char    TelexExtractTransType;	/*100 - 1 */
	char    reversalTransFlag;		/*101 - 1 */
	char    limitTransFlag;			/*102 - 1 */
	char    activeMainFlag;			/*103 - 1 */
	char    cancellationFlag;		/*104 - 1 */
	char    statementFlag;			/*105 - 1 */
	char    multiCurrencyFlag;		/*106 - 1 */
	char    partialNarrativeLength[2];	/*107 - 2 */
	char    memoNote;				/*109 - 1 */
	char    syndLoanAuto;			/*110 - 1 */
	char    syndLoanMemoBal;		/*111 - 1 */
	char    finalMaturityFlag;		/*112 - 1 */
	char    activeContraFlag;		/*113 - 1 */
	char    blockingFlag;			/*114 - 1 */
	char    clearingPeriod[2];		/*115 - 2 */
	char    endOfDay;				/*117 - 1 */
	char    billsCds;				/*118 - 1 */
	char    outstandingTransFlag;	/*119 - 1 */
	char    booksNotReconciled;		/*120 - 1 */
	char	printInPassbook;		/*121 - 1 */
	char    swiftMessageType[3];	/*122 - 3 */
	char    corrToTessaFlag;		/*125 - 1 */
	char    filler4[2];				/*126 - 2 */
	char    transLimit[12];			/*128 - 12*/
	char    sortCodeRequired;		/*140 - 1 */
	char    vatTransaction;			/*141 - 1 */
	char    amountRounding;			/*142 - 1 */
	char    filler5[370];			/*143 - 370 */
};

struct limitCd {
	char limitCode[2];
};

struct cnd0dataAC {
	char    liveChar;			/* 0 - 1 */
	char    recType[4];			/* 1 - 4 */
	char    accType[2];			/* 5 - 2 */
	char	description[30];	/* 7 - 30*/
	char	crCategory[2];		/*37 - 2 */
	char	intCalc;			/*39 - 1 */
	char    filler1[46];		/*40 - 46*/
	struct  limitCd limits[5];	/*86 - 10*/
	char	filler2[28];		/*96 - 28*/
	char	supressLimitCheck;	/*124 - 1 */ /* 0-Realtime posting limit performed; 1-Limit checking not performed */
	char    filler3[400];		/*125 - 400*/
};

struct cnd0dataSP {		
	char 	liveChar;				/*0 - 1*/
	char	recType[6];				/*1 - 6*/
	char	filler1[71];			/*7 -71*/
	char	fxTolerance[2];			/*78- 2*/	/*system.dat*/
	char	filler2[8];				/*80- 8*/
	char	suspenseAccNo[11];		/*88-11*/   /* w/o currency & 7 digit customer number */
	char	filler3[39];			/*99-39*/
	char 	penaltyMargin[8];		/*138-8*/	/*systm3.dat*/
	char 	filler[450];			/*146-450*/
};

struct cnd0dataPN {	 /* For previous runDate and currentDate for alcorp.prt */
	char 	liveChar;
	char 	key[6];
	char 	runDate[6];
	char 	prevDate[6];
	char 	filler1[493];
};

struct cnd0dataGS {		/* Global system parameter */
	char 	liveChar;				/* 0 - 1 */
	char 	key[6];					/* 1 - 6 */
	char 	filler[34];				/* 7 -34 */
	char 	alphaFlag;				/*41 - 1 */  /* 1-Active; 0-Not active */
	char 	filler1[520];			/*42 -520 */
};

struct cnd0dataNR {	 /* Narrative description using narrative codes */
 	char 	liveChar;
 	char	recType[2];
 	char 	narrativeCode[4];
 	char 	arabicNarrative[25];
 	char 	englishNarrative[25];
 	char 	filler1[493];
};

struct cnd0dataMR
{
   char    liveChar;                  /*00000 00001 */
   char    recType[2];                /*00001 00002 */
   char    filler1;                   /*00003 00001 */
   char    currCode[2];               /*00004 00002 */
   char    serialNo;                  /*00006 00001 */
   char    depositAmt[14];            /*00007 00014 */
   char    defMargin[9];              /*00021 00009 */
   char    minMargin[9];              /*00030 00009 */
   char    maxMargin[9];              /*00039 00009 */
   char    filler2[464];              /*00048 00464 */
};

struct cnd0dataCL 
{
	char    liveChar; 			/*  0 - 1 */
	char    key[6];				/*  1 - 6 */
	char 	filler1;			/*  7 - 1 */
	char	loanAcType1[2];		/*  8 - 2 */
	char 	filler2;			/*  10 - 1 */
	char	loanAcType2[2];		/*  11 - 2 */
	char	filler3;			/*  13 - 1 */
	char	loanAcType3[2];		/*  14 - 2 */
	char 	filler4;			/*  16 - 1 */
	char	loanAcType4[2];		/*  17 - 2 */
	char 	filler5;			/*  19 - 1 */
	char	loanAcType5[2];		/*  20 - 2 */
	char	filler6;			/*  22 - 1 */
	char	arrears1[2];		/*  23 - 2 */
	char	filler7;			/*  25 - 1 */
	char	arrears2[2];		/*  26 - 2 */
	char	filler8;			/*  28 - 1 */
	char	arrears3[2];		/*  29 - 2 */
	char	filler9;			/*  31 - 1 */
	char	arrears4[2];		/*  32 - 2 */
	char	filler10;			/*  34 - 1 */
	char	arrears5[2];		/*  35 - 2 */
	char	aLonMgn[8];			/*  37 - 8 */
	char	aMinMgn[8];			/*  45 - 8 */
	char	startDate[6];		/*  53 - 6 */
	char	currency[2];		/*  59 - 2 */
	char	intMethod;			/*  61 - 1 */
	char	drOnly;				/*  62 - 1 */
	char	matDate;			/*  63 - 1 */
	char	filler11;			/*  64 - 1 */
	char	loanAcType6[2];		/*  65 - 2 */
	char	filler12;			/*  67 - 1 */
	char	loanAcType7[2];		/*  68 - 2 */
	char	filler13;			/*  70 - 1 */
	char	loanAcType8[2];		/*  71 - 2 */
	char	filler14;			/*  73 - 1 */
	char	loanAcType9[2];		/*  74 - 2 */
	char	filler15;			/*  76 - 1 */
	char	loanAcType10[2];	/*  77 - 2 */
	char	filler16;			/*  79 - 1 */
	char	arrears6[2];		/*  80 - 2 */
	char	filler17;			/*  82 - 1 */
	char	arrears7[2];		/*  83 - 2 */
	char	filler18;			/*  85 - 1 */
	char	arrears8[2];		/*  86 - 2 */
	char	filler19;			/*  88 - 1 */
	char	arrears9[2];		/*  89 - 2 */
	char	filler20;			/*  91 - 1 */
	char	arrears10[2];		/*  92 - 2 */
	char	anutyLn1;			/*  94 - 1 */
	char	anutyLn2;			/*  95 - 1 */
	char	anutyLn3;			/*  96 - 1 */
	char	anutyLn4;			/*  97 - 1 */
	char	anutyLn5;			/*  98 - 1 */
	char	anutyLn6;			/*  99 - 1 */
	char	anutyLn7;			/*  100 - 1 */
	char	anutyLn8;			/*  101 - 1 */
	char	anutyLn9;			/*  102 - 1 */
	char	anutyLn10;			/*  103 - 1 */
	char    filler80[400];
};

struct tid0data {		
	char 	liveChar;				/* 0 - 1 */
	char 	titleCode[2];			/* 1 - 2 */
	char 	englishName[30];		/* 3 -30 */
	char 	arabicName[30];			/*33 -30 */  
	char 	filler1[100];			/*63 -100 */
};

struct err0data {
	char    liveChar;
	char    errNo[4];
	char    englishText[55];
	char    arabicText[55];
	char    errType[2];
	char    filler[12];
};

struct ciatm {
	char    accNo[13];
	char    tranType[2];
	char	source;			/* P -Phone Banking */
	char	fromDate[8];	/* YYYYMMDD */
	char	toDate[8];		/* YYYYMMDD */
	char	filler[31];
	/*
	char    hdrText[3];
	char    hdrInd[2];
	char    hdrRelnum[2];
	char    hdrStatus[3];
	char    hdrOrigCode;
	char    hdrrespCode;
	char    hdrmsgtype[4];
	char    hdrPriBitMap[16];
	char    hdrSecBitMap[16];
	*/
	char    hdrTCode[2];
	char    hdrProcCode[4];
	char    hdrTranAmount[12];
	char    hdrTranDateTime[10];
	char    hdrTraceAuditNum[6];
	char    hdrTranTime[6];
	char    hdrTranDate[4];
	char    hdrSettleDate[4];
	char    hdrCaptureDate[4];
	char    hdrAcqInstFl[2];
	char    hdrAcqInst[11];
	char    hdrTrack2DataFl[2];
	char    hdrTrack2Data[37];
	char    hdrRetRef2[6];
	char    hdrRetRefRes[6];
	char    msgAuthidResp[6];
	char    msgRespCode[2];
	char    msgAcceptorTerm[4];
	char    msgAcceptor[12];
	char    msgAcptrNameLoc[40];
	char    msgCurrCode[3];
	char    msgAtmTermFiller[3];
	char    msgFiid[4];
	char    msgAtmRest[8];
	char    msgCardIssuData[18];
	char    msgPinOffset[19];
	char    msgDataElements[42];
	char    msgReplAmounts[42];
	char    msgRcgInstId[13];
	char    msgAcct1Filler[2];
	char    msgAcct1Number[28];
	char    msgAcct2filler[2];
	char    msgAcct2Number[28];
	char    msgTabr[36];
	char    msgDepAmount[15];
	char    filler1[10];
};

struct on2header {
	char    stat[2];  /* can have 00 (No error) or 21 (Unknown message type) */
	char    prodInd[2];  /* valid value 07 */
	char    relNul[2];   /* valid value 03 */
	char    dpcNo[4];
	char    fiId[4];
	char    origiType;   /* valid origin type is 1 */
	char    logicalNet[4];
	char    refGrp[4];
	char    filler;
	char    msgId[4];               /* 0300 file update request ( from the host )
								0310 file update response (from 2000FT)
								9310 File update response from SAF
								9311 File update res.from SAF- posible duplicate
								9320 file update res.from SAF acknowledgement
								9321 file update response from SAF - possible 
										duplicate acknowledgement.
							*/
	char    byteMap[16];
	char    acctNumLgth[2];
	char    acctNum[19];
	char    messageTrace[6];
	char    srcRteNum[10];
	char    timestamp[14];
	char    fileCode;               /*      4 - Replace / Update
								5 - Delete
								6 - Add
								7 - Inquiry
							*/
	char    fileType[2];    /*  CF  Cardholder Account File (CAF)
								CA  CAF Account Information (CAF)
								NF  Negative Authorization File (NEG)
								DA  DDA or NOW positive balance file(PBF)
								SV Savings Positive Balance File (PBF)
								CC Credit Card Positive Balance File (PBF)
							*/
	char    password[16];
	char    userGrp[4];
	char    userNum[8];
	char    userSta[4];
	char    addDataLgth[4];
	char    fileDistGrp[4];
	char    loggingInd;             /* Y Log activity into OMF if successful  
							   N Do not log if successfull
							*/
	char    regLoggingIng;  /* Y Log activity into OMF if rejected
							   N do not log if rejected
							*/
	char    compReq;                /* Y send a 0310 response to host 
							   N do not send 0310 response to host 
							*/
	char    resp[3];
};

struct account {
	char    typ[2];
	char    num[19];
	char    stat;
	char    desc[10];
};

struct on2data {
	struct on2header header;
	char    memNum;
	char    cardType;
	char    fiId[4];
	char    cardStat;
	char    pinCheck[16];   /* pin offset */
	char    onAtmWdlLim[7];
	char    offAtmWdlLim[7];
	char    onCcaWdlLim[7];
	char    offCcaWdlLim[7];
	char    onWdlLim[7];
	char    offWdlLim[7];
	char    maxDepCredAmt[4];
	char    firstUsedDate[6];
	char    lastUsedDate[6];
	char    dateExp[4];
	char    onPosWdlLim[7];
	char    offPosWdlLim[7];
	char    onMaxCrAmt[7];
	char    offMaxCrAmt[7];
	char    posUsedTodayLim[4];
	char    filler[31];
	char    cdfPresent;                     /* Y if CDF also to be updated */
	char    branchNum[4];
	char    deptNum[2];
	char    pinMailer;
	char    cardCarrier;
	char    addrline1[34];
	char    addrline2[34];
	char    city[18];
	char    st[2];
	char    zipcode[5];
	char    cardsToIssue[4];
	char    issueStat[2];
	char    cardsRet[4];
	char    cardholderTitle;
	char    nameLine1[26];
	char    nameLine2[26];
	char    cdfPrefixLen[2];
	char    acctCnt[2];
	struct  account acct[16];
	char    userData[100];
};

/* Structure definitions for Gateway files */
struct gw00 {
	char    liveChar;
	char    recType[2];             /* fixed as 00 */
	char    noOfRecs[5];    /* number of records + No.of Batch record 
							   + No. of Control Records */

	char    curCode1[2];
	char    filler1[3];
	char    curTotal1[15];
	char    curCode2[2];
	char    filler2[3];
	char    curTotal2[15];
	char    curCode3[2];
	char    filler3[3];
	char    curTotal3[15];
	char    curCode4[2];
	char    filler4[3];
	char    curTotal4[15];
	char    curCode5[2];
	char    filler5[3];
	char    curTotal5[15];
	char    curCode6[2];
	char    filler6[3];
	char    curTotal6[15];
	char	runNumber[2];
	char	lastRunDate[6];
	char    filler[888];    /* filled with zeros */
};

struct gw01 {
	char    liveChar;
	char    recType[2];
	char    noOfRecs[5];
	char    curCode1[2];
	char    filler1[3];
	char    curTotal1[15];   /* will have all credit amounts for the 
								above currency */
	char    curCode2[2];
	char    filler2[3];
	char    curTotal2[15];
	char    filler[976];
};

struct gw20 
{
	char    liveChar;				/*0 -1 */
	char    recType[2];				/*1 -2 */
	char    accNo[13];				/*3 -13*/
	char    filler1[18];            /* value spaces */ /*16-18*/
	char    transType[2];   /* transaction type defined in TTABLE *//*34-2*/
	char    filler2[2];				/*36-2*/
	char    transAmt[14];   /* value of transaction *//*38-14*/
	char    valueDate[6];   /* in the format YYMMDD *//*52-6*/
	char    maturityDate[6];        /* in the format YYMMDD *//*58-6*/
	char    interestRate[9];        /*64-9*/
	char    filler3[2];             /* value spaces */ /*73-2*/
	char    baseEquivalant[14];     /* used in FC */ /*75-14*/
	char    fxMulDivideFlag;        /* M - multiply;  D - Divide */ /*89-1*/
	char    filler4;				/*90 - 1*/
	char    brokerNumber[6];        /*91 - 6 */
	char    transRef[10];			/*97 - 10*/
	char    narrative1[25];			/*107- 25*/
	char    narrative2[25];			/*132- 25*/
	char    narrative3[25];			/*157- 25*/
	char    settleInstrns[105];		/*182-105*/
	char    amendFlag;				/*287-1*/
	char    processedFlag;			/*288-1*/
	char    memorandumNote[15];     /*289-15*/
	char    bankSortCode[10];       /*304-10*/
	char    passBookFlag;           /*314-1*/
	char    MaturityDate[6];        /*315-6*/
	char    dealMargin[8];          /*321-8*/
	char    drawerName[15];         /*329-15*/
	char    issueDate[6];           /*344-6*/
	char    exchangeRate[14]; /* earlier 12 */ /* 9(6)V9(8) */  /*350-14*/
	char    filler6[2];             /*364-2*/
	char    valueOfBill[14];        /*366-14*/
	char    discountRate[9];        /*380-9*/
	char    contraAccFlag;          /*389-1*/
	char    filler7[621];           /*390-621*/
	char    timeStamp[6];           /*1011-6*/
	char    filler8;                /*1017-1*/
	char    hashTotal[6];           /*1018-6*/
};

struct cbgw20 
{
	char    liveChar;				/*0 -1 */
	char    recType[2];				/*1 -2 */
	char    accNo[16];				/*3 -16*/
	char    filler1[18];            /* value spaces */ /*19-18*/
	char    transType[2];   /* transaction type defined in TTABLE *//*37-2*/
	char    filler2[2];				/*39-2*/
	char    transAmt[14];   /* value of transaction *//*41-14*/
	char    valueDate[6];   /* in the format YYMMDD *//*55-6*/
	char    maturityDate[6];        /* in the format YYMMDD *//*61-6*/
	char    interestRate[9];        /*67-9*/
	char    filler3[2];             /* value spaces */ /*76-2*/
	char    baseEquivalant[14];     /* used in FC */ /*78-14*/
	char    fxMulDivideFlag;        /* M - multiply;  D - Divide */ /*92-1*/
	char    filler4;				/*93 - 1*/
	char    brokerNumber[6];        /*94 - 6 */
	char    transRef[10];			/*100 - 10*/
	char    narrative1[25];			/*110- 25*/
	char    narrative2[25];			/*135- 25*/
	char    narrative3[25];			/*160- 25*/
	char    settleInstrns[105];		/*185-105*/
	char    amendFlag;				/*290-1*/
	char    processedFlag;			/*291-1*/
	char    memorandumNote[15];     /*292-15*/
	char    bankSortCode[10];       /*307-10*/
	char    passBookFlag;           /*317-1*/
	char    MaturityDate[6];        /*318-6*/
	char    dealMargin[8];          /*324-8*/
	char    drawerName[15];         /*332-15*/
	char    issueDate[6];           /*347-6*/
	char    exchangeRate[14]; /* earlier 12 */ /* 9(6)V9(8) */  /*353-14*/
	char    filler6[2];             /*367-2*/
	char    valueOfBill[14];        /*369-14*/
	char    discountRate[9];        /*383-9*/
	char    contraAccFlag;          /*392-1*/
	char    filler7[621];           /*393-621*/
	char    timeStamp[6];           /*1014-6*/
	char    filler8;                /*1020-1*/
	char    hashTotal[6];           /*1021-6*/
};

struct thd0data 
{
	char    liveChar;					/* 0 */
	char    accNo[13];					/* 1 */
	char    filler1[7];					/* 14  */
	char    transCounter[5];			/* 21  */ 
	char    recType;					/* 26  */
	char    postDate[6];				/* 27  */
	char    valueDate[6];				/* 33  */
	char    filler2;					/* 39  */
	char    transType[2];				/* 40  */
	char    statmentFlag;				/* 42  */ /* 1 - do not print */
	char    filler3[2];					/* 43  */
	char    transAmt[14];				/* 45  */
	char    filler4[2];					/* 59  */
	char    accruedInt[14];				/* 61  */
	char    transRef[10];				/* 75  */
	char    narrative1[25];				/* 85  */
	char    forExInd;					/* 110 */
	char    filler5[2];					/* 111 */
	char    serviceFee[14];				/* 113 */
	char    AIXFlag;  					/* 127 */
	char    passBookFlag;				/* 128 */
	char    userId[3];					/* 129 */
	char    supervisorId[3];			/* 132 */
	char    transInd;					/* 135 */
	char    filler6[2];					/* 136 */
	char    adjustmentAmt[14];			/* 138 */
	char    interfaceFlag;				/* 152 */
	char    filler7[2];					/* 153 */
	char    baseCurrEqui[14];			/* 155 */
	char    oppositeCurrCode[2];		/* 169 */
	char	filler8[48];				/* 171-48*/
	char	contraAccNo[13];			/* 219-13*/ /* defined by ANB to hold contra account from Directpost transactions */
	char	finnoneUserId[8];			/* 232-8*/
	char	filler9[10];				/* 240-10*/
	char	fdeUpdateFlag;				/* 250-1*/
	char	tdlUpdateFlag;				/* 251-1*/	/* 1 - updated; 2 - Error from host, retry later; */ /* Ver 3.32 */
	char    filler10[86];
};

struct thd1data 
{
	char    liveChar;					/* 0 */
	char    accNo[13];					/* 1 */
	char    filler1[7];					/* 14 */
	char    transCounter[5];			/* 21 */
	char    recType;					/* 26 */
	char    narrative2[25];				/* 27 */
	char    narrative3[25];				/* 52 */
	char    filler2[180];				/* 77 */
};
struct thd2data {
	char    liveChar;
	char    accNo[13];
	char    filler1[7];
	char    transCounter[5];
	char    recType[2];
	char    postDate[6];
	char    valueDate[6];
	char    filler2;
	char    transType[2];
	char    statementFlag;
	char    filler3[2];
	char    transAmt[14];
	char    filler4[2];
	char    accruedInt[14];
	char    transRef[10];
	char    narrative1[25];
	char    fxIndicator;
	char    filler5[2];
	char    transServiceFee[14];
	char    include2ndIndex;
	char    passBookFlag;
	char    userId[3];
	char    supervisorId[3];
	char    transactionInd;
	char    filler6[2];
	char    transAmtCD[14];
	char    filler7[119];
};

struct  thd3data {
	char    liveChar;
	char    accNo[13];
	char    filler1[7];
	char    transCounter[5];
	char    recType;
	char    narrative2[25];
	char    narrative3[25];
	char    newCrIntRate[9];
	char    newDrIntRate[9];
	char    activeRateFlag;
	char    newBaseCode[2];
	char    marginOverBase[8];
	char    drCrBase;
	char    filler2[149];
};

struct  tr0data 
{
	char    liveChar;			/*0-1*/
	char    recType[2];			/*1-2*/
	char    batchNo[7];			/*3-7*/
	char    contChar;			/*10-1*/
	char    accNo[13];			/*11-13*/
	char    filler1[8];			/*24-8*/
	char    transType[2];		/*32-2*/
	char    drCrInd;			/*34-1*/
	char    reference[10];		/*35-10*/
	char    narrative1[25];		/*45-25*/
	char    narrative2[25];		/*70-25*/
	char    narrative3[25];		/*95-25*/
	char    filler2[2];			/*120-2*/
	char    oldBal[14];			/*122-14*/
	char    filler3[2];			/*136-2*/
	char    transAmt[14];		/*138-14*/
	char    filler4[2];			/*152-2*/
	char    newBal[14];			/*154-14*/
	char    postDate[6];		/*168-6*/
	char    valueDate[6];		/*174-6*/
	char    exceptionCode[2];	/*180-2*/ /* Arul : earlier it was excptionCd - changed on 28 Dec 06*/
	char    autoTrans;			/*182-1*/
	char    intRate[9];			/*183-9*/
	char    maturityDate[6];	/*192-6*/
	char    filler5;			/*198-1*/
	char    brokerNo[6];		/*199-6*/
	char    settlementInst[105];	/*205-105*/
	char    oldMaturityDate[6];		/*310-6*/
	char    oldIntRate[9];			/*316-9*/
	char    confirmFlag;			/*325-1*/
	char    lastStartDate[6];		/*326-6*/
	char    intAmt[14];		/* could start from next two bytes */	/*332-14*/
	char    filler6[4];		/* check ???? */	/*346-4*/
	char    accLimit[12];		/*350-12*/
	char    filler7[2];			/*362-2*/
	char    serviceFee[14];		/*364-14*/
	char    confirmFormat[2];	/*378-2*/
	char    staffAccInd;		/*380-1*/
	char    nonResidentFlag;	/*381-1*/
	char    contraAccNo[13];	/*382-13*/
	char    filler8[8];			/*395-8*/
	char    contraAccType[2];	/*403-2*/
	char    intApplFlag;		/*405-1*/
	char    dateTelex[6];		/*406-6*/
	char    custName[30];		/*412-30*/
	char    tellerId[3];		/*442-3*/
	char    filler9[2];			/*445-2*/
	char    baseEquivalent[14];	/*447-14*/
	char    couponRate[9];		/*461-9*/
	char    multiplyDivide;		/*470-1*/
	char    limitCheck[3];		/*471-3*/ /*also SupervisorId; redefined field*/
	char    filler10[2];		/*474-2*/
	char    withholdingTax[14];	/*476-14*/
	char    mainAccInd;			/*490-1*/
	char    memoNote[15];		/*491-15*/
	/*
	char    userId[3];  * Redefined field *
	char    filler11[2];		*506-2*
	*/
	char    exRate[14];			/*506-14*/ /* 9(6)V9(8) */
	char    filler12[2];		/*520-2*/
	char    billValue[14];		/*522-14*/
	char    sortCode[10];		/*536-10*/
	char    forExDealFlag;		/*546-1*/
	char    dealNumber[5];		/*547-5*/
	char    recoverable;		/*552-1*/
	char    passbook;			/*553-1*/
	char    timeStamp[6];		/*554-6*/
	char    issueDate[6];		/*560-6*/
	char    sourceFlag;			/*566-1*/
	char    intRecalFlag;		/*567-1*/
	char    branchnetSource[2];	/*568-2*/
	char    destinationAcc[20];	/*570-20*/
	char	countryBankCode[10];/*590-10*/  /*a682512345*/
	char    sourceBranchCode[4];/*600-4*/
	char	filler13[63];		/*604-63*/
	char	reversalFlag;		/*667-1*/
	char	fille15[2];			/*668-2*/
	char	custBranchCode[4];	/*670-4*/
	char    filler14[351];		/*it was 442 earlier */
};

struct  cpd0data 
{
	char    liveChar;			/*0-1*/
	char    recType[2];			/*1-2*/
	char    currCode[2];		/*3-2*/
	char    isoCurrCode[3];		/*5-3*/
	char    currDesc[30];		/*8-30*/
	char    noOfDays[3];		/*38-3*/
	char    mdIndicator;		/*41-1*/
	char    filler2[21];		/*42-21*/
	char	filler5[13];		/*63-13*/
	char    spotAccNo[13];		/*76-13*/
	char	filler6[7];			/*89-7*/
	char    swapAccNo[13];		/*96-13*/
	char	filler7[7];			/*109-7*/
	char    arbitAccNo[13];		/*116-13*/
	char	filler8[7];			/*129-7*/
	char    commissionAccNo[13];/*136-13*/
	char	filler9[7];			/*149-7*/
	char    telexAccNo[13];		/*156-13*/
	char	filler10[7];		/*169-7*/
	char    filler3[80];		/*176-80*/
	char    nostroAccNo[13];	/*256-13*/
	char	filler11[7];		/*269-7*/
	char    filler4[53];		/*276-53*/
	char    noOfDecimals;		/*329-1*/
	char    filler14[694];		/*237-694*/
};

struct dcd0data 
{
	char    liveChar;
	char    date[6];
	char    workingDay;
	char    dayOfWeek;
	char    weekOfYear[2];
	char    dayOfYear[3];
	char    recType[2];
};

struct dzd0data 
{
	char    liveChar;				/* 0 - 1 */
	char    valueDate[6];			/* 1 - 6 */
	char    refCode[4];				/* 7 - 4 */
	char    recType[2];				/* 11 - 2 */
	char    accNo[13];				/* 13 - 13 */
	char    filler1[7];				/* 26 - 7 */
	char    batchNo[7];				/* 33 - 7 */
	char    filler2;				/* 40 - 1 */
	char    transType[2];			/* 41 - 2 */
	char    drCrFlag;				/* 43 - 1 */
	char    refNo[10];				/* 44 - 10 */
	char    narrative1[25];			/* 54 - 25 */
	char    narrative2[25];			/* 79 - 25 */
	char    narrative3[25];			/* 104 - 25 */
	char    filler3[2];				/* 129 - 2 */
	char    oldBal[14];				/* 131 - 14*/
	char    filler4[2];				/* 145 - 2*/
	char    transAmt[14];			/* 147 - 14*/	/* earlier called amtOfTrans */
	char    filler5[2];				/* 161 - 2 */
	char    newBal[14];				/* 163 - 14*/
	char    postingDate[6];			/* 177 - 6 */
	char    exceptionCode[2];		/* 183 - 2 */
	char    autoGenFlag;			/* 185 - 1 */
	char    newIntRate[9];			/* 186 - 9 */
	char    newMaturityDate[6];		/* 195 - 6 */
	char    filler6[5];				/* 201 - 5 */
	char    accType[2];				/* 206 - 2 */
	char    transValueDate[6];		/* 208 - 6 */
	char    filler7[2];				/* 214 - 2 */
	char    intAmt[14];				/* 216 - 14 */
	char    intAppMethodFlag;		/* 230 - 1 */
	char    staffFlag;				/* 231 - 1 */
	char    nonResidentFlag;		/* 232 - 1 */
	char    intPaymentFlag;			/* 233 - 1 */
	char    demandNoteAdviceFlag;	/* 234 - 1 */
	char    contraAccNo[13];		/* 235 - 13*/
	char    filler8[7];				/* 248 - 7 */
	char    dateTelex[6];			/* 255 - 6 */
	char    processedFlag;			/* 261 - 1 */
	char    settlementInstruction[105];		/* 262 - 105 */
	char    paymentRollover;				/* 367 - 1 */
	char    limitCurrCode[2];				/* 368 - 2 */
	char    confirmationAdvice[2];			/* 370 - 2 */
	char    fixtureBreakDate[6];			/* 372 - 6 */
	char    fixtureBreakTransType;			/* 378 - 1 */
	char    depositMaturityFlag;			/* 379 - 1 */
	char    sysdicateApportionment;			/* 380 - 1 */
	char    syndicateLoadAcc[13];			/* 381 - 13 */
	char    filler9[7];						/* 394 - 7 */
	char    diaryMemoIndi;					/* 401 - 1 */
	char    finalMaturityDate[6];			/* 402 - 6 */
	char    dealMargin[8];					/* 408 - 8 */
	char    billCdFlag;						/* 416 - 1 */
	char    filler10[2];					/* 417 - 2 */
	char    nominalValue[14];				/* 419 - 14*/
	char    drawer[15];						/* 433 - 15*/
	char    filler11;						/* 448 - 1 */
	char    depositaryBroker[6];			/* 449 - 6 */
	char    yieldRate[9];					/* 455 - 9 */
	char    discountCouponRate[9];			/* 464 - 9 */
	char    filler12[5];					/* 473 - 5 */
	char    leasingRepayment;				/* 478 - 1 */
	char    verifyFlag;						/* 479 - 1 */
	char    filler13[2];					/* 480 - 2 */
	char    baseEquivalent[14];				/* 482 - 14*/
	char    facilirtyLimits;				/* 496 - 1 */
	char    transRecCounter[5];				/* 497 - 5 */
	char    repaymentFrequency;				/* 502 - 1 */
	char    paymentsRemaining[4];			/* 503 - 4 */
	char    branchNo[4];					/* 507 - 4 */
	char    filler14;						/* 511 - 1 */
	char    swiftMsg[3];					/* 512 - 3 */
	char    swiftDealNo[6];					/* 515 - 6 */
	char    transRef[16];					/* 521 - 16*/
	char    relatedRef[16];					/* 537 - 16*/
	char    swiftSettlement[35];			/* 553 - 35*/
	char    swiftSettlement2[35];			/* 588 - 35*/
	char    swiftSettlement3[35];			/* 623 - 35*/
	char    swiftSettlement4[35];			/* 658 - 35*/
	char    swiftSettlement5[35];			/* 693 - 35*/
	char    swiftSettlement6[35];			/* 628 - 35*/
	char    processedByMT350;		/*763 - 1*/
	char	mt320Produced;			/*764 - 1*/
	char	fixedShceduleFlag;		/*765 - 1*/
	char	fixedShceduleDate[2];	/*766 - 2*/
	char	filler15[232];			/*768 - 232*/
	/* we consider from 1000th position as user defined area */
	char	blockedAmt[14];			/*1000 - 14*/
	char	penDateChanged;			/*1014 - 1 -used by bmcppd   1-changed else not-changed*/
	char	penDateChanged1;		/*1015 - 1 -used by bmcppd   1-changed else not-changed*/
	char    filler16[100];			
};

struct brcode {
	char    liveChar;
	char    brShortCode[2];
	char    branchCode[4];
};

struct brs0data {
	char    liveChar;
	char    branchCode[4];
	char    lastExtractDate[6];
	char    lastSlNo[5];
	char    filler[49];
};

struct ref0data {
	char    liveChar;
	char    accNo[13];
	char    transCount[5];
};

struct ddf0data {
	char    liveChar;
	char    type;
	char    fileName[20];
	char    path[100];
	char    split;
	char    splitNo;
	char	filler[20];
};

struct trc0data {
	char    accNo[13];
	char    transCount[5];
};

struct prd0data	{		/* same structure for pyd0data */
	char 	liveChar; 			/*0-1*/
	char	recType[2];			/*1-2*/
	char	accNo[13];			/*3-13*/
	char	filler1[7];			/*16-7*/
	char	chequeNo[10];		/*23-10*/
	char	filler2[2];			/*33-2*/
	char	amount[14];			/*35-14*/
	char	dateStop[6];		/*49-6*/
	char	payeeName[25];		/*55-25*/
	char	filler3;			/*80-1*/
	char	chequeFrom[8];		/*81-8*/
	char	filler[11];			/*89-11*/
	char	destroyFlag;		/*100-1*/
	char	filler4[170];
};


/*----------------------------------------------------------------------------
Title   : Transaction Pending file( C-ISAM file ).
Desc.   : File description for the Global Pend file
-----------------------------------------------------------------------------*/

struct cipend {
     char liveChar;			/* Status Flag     		(0,1)*/
     char accNo[19];		/* 90-cccccc-bbb-xx-lll-sss	(1,19)*/
     char transDate[8];		/* Transaction Date     	(20,8)*/
     char transTime[7];		/* Transaction Time as HHSSMM0	(28,7)*/
     char source[2];		/* Source code value 99         (35,2)*/
     char procDate[14];		/* Processing Date[BLANK]      (37,14)*/
     char contraAccNo[19];	/* Contra Account nummber      (51,19)*/
     char transType[2];		/* Transaction Type            (70,2)*/
     char transAmt[14];		/* Transaction Amount          (72,14)*/
     char ebsAlpha[4];	    /* Document Alpha              (86,4)*/
     char refNo[10];		/* Document Alpha              (90,10)*/
     char docCount[4];		/* Document Count 	       	   (100,4)*/
     char valueDate[8];		/* Value Date                  (104,8)*/
     char explCode[3];		/* Explanation Code            (112,3)*/
     char drCrInd;			/* DR/CR 1-Dr; 2-Cr            (115,1)*/
     char dist_code;		/* Distribution Code           (116,1)*/
     char narrative1[25];	/* Narrative 1		(117,25)*/
     char narrative2[25];	/* Narrative 2		(142,25)*/
     char baseEquiv[14];	/* Base equivalent      (167,14)*/
     char currCode[2];		/* FC code              (181,2)*/
     char exRate[9];		/* Exchange Rate    	(183,9)	*/ /*9(4)V9(5)*/
     char commision[7];		/* Commision Amount     (192,7)	*/
     char orgBranch[3];		/* Originating Branch   (199,3)*/
     char termSlNo[4];		/* Terminal Sl No.      (202,4)*/
     char bmAccNo[13];		/* Account in BM format (206,13)*/
     char posTerm[9];		/* Pos Terminal Number  (219,9)*/
     char retArabic[20];	/* Retailer ArabicName  (228,20)*/
     char retEnglish[20];	/* Retailer EnglishName (248,20)*/
     char cityCode[3];		/* City Code            (268,3)*/
     char settleDate[6];	/* settlement Date      (271,6)*/
     char rcvdDate[10];		/* Receving Date        (277,10)*/
     char narrative3[25];	/* Narrative 3          (287,25)*/
     char cardNo[21];		/* Card Number          (312,21)*/
     /*char filler[184];		* Filler          		(333,184)*/
	 /* following were the lines picked up from Edwin code */
     char pos_retailer_acnum[13];/* POS Retailer ACCNO  (333,13)*/
     char pos_posting_flag;	/* POS Retailer Posting Method (346,1)*/
     char gccnet_sama_fee[9];	/* GCCNET SAMA FEE	(347,9)*/
     char gccnet_sama_contra[19];/* GCCNET SAMA RECON ACCOUNT (356,19)*/
     char gccnet_anb_fee[9];	/* GCCNET ANB FEE	(375,9)*/
     char gccnet_anb_contra[19];/* GCCNET ANB FEE CONTRA ACCOUNT (384,19)*/
	 char tran_date_origin[10]; /* date and time at origion (403, 10) */
	 char tran_authid_resp[6];  /* authorization id response(413, 6) */
	 char acceptorTerminal[8];  /* TerminalId (419, 8) */
	 char msgType[4];			/* message type (428, 4) */
	 char accountId2[19];		/* Account identification 2 431, 19) */
	 char processCode[4];		/* Process code (450,4) - Starts with 90 for KIOSK transactions */
	 char seqNo[6];				/* Transaction sequence number (454, 6) */
	 char filler[53];           /* new filler length    (454,53)*/
};

struct gwmsgs {
     char liveChar;			/* Status Flag     		(0,1)*/
     char errNo[4];		    /* Return Error code from CIO*/
     char errExtn[2];		/* Extention Error code      */
     char errMsg[50];		/* Actual error Messages     */
};

struct rtupend {
	char	liveChar;		  	/*0, 1*/
	char	processDate[14]; 	/*Date+Time YYYYMMDDHHMMSS */ /*1, 14 */
	char	noOfTries; 			/*15, 1 */
	char	source[2];			/*16, 2*/
	char	mainAccNo[13];  	/*18, 13 */
	char	transDate[8];		/*31, 8 */
	char	transTime[6];		/*39, 6 */
	char	refNo[16];			/*45, 16 */
	char	transCategory;		/*0 - Normal;  2 - Reversal */	/* 61, 1*/
	char	contraAccNo[13];	/*62, 13 */
	char	transType[2];		/*75, 2 */
	char	valueDate[8];		/*77, 8 */
	char	transAmt[19];		/*85,19 */
	char	narrative1[25];		/*104,25*/
	char	narrative2[25];		/*129,25*/
	char	narrative3[25];		/*154,25*/
	char	userId[4];			/*179,4 */
	char	otherCurrAmt[19];	/*183,19*/
	char	baseEquiv[19];		/*202,19*/
	char	exRate[14];			/*221,14*/ /* 9(6)V9(8) */
	char	transSeqNo[5];		/*235,5 */
	char	transChainNo[2];	/*240,2 */
	char	recvDate[14];		/*242,14*/
	char	filler[200];
};

/* Declare (CAF/ACCTBM) RECORDS' Character Pointers		*/
struct acctBm 
{
	char   	count[7];		/*  0 Record Number		*/
	char   	cardNo[19];		/*  7  Card # 			*/
	char   	memberNo;		/* 26  Member #			*/
	char   	recType;		/* 27 Record Type, 'C'         	*/
	char   	cardType;		/* 28 Card Type			*/
	char   	fiid[4];		/* 29 Always 'ANB1'            	*/
	char   	cardStat;		/* 33 Card Status               */
	char   	pin[16];		/* 34 PIN, Left Just, Blank Filled */
	char   	onAtmLimit[7];	/* 50 Online ATM With. Limit,'0005000' */
	char   	offAtmLimit[7];	/* 57 Ofline ATM With. Limit,'0005000' */
	char   	onCcaLimit[7];	/* 64 Online CCA With. Limit,'0000000' */
	char   	offCcaLimit[7];	/* 71 Ofline CCA With. Limit,'0000000' */
	char   	totalOnLimit[7];/* 78 Total Onl With. Limit, '0005000' */
	char   	totalOffLimit[7];/* 85 Total Ofl With. Limit, '0005000' */
	char   	maxDepCr[4];	/* 92 Maximum Deposit Credit,'0000'    */
	char   	initUseDate[6];	/* 96 Initial Use Date                 */
	char   	lastUseDate[6];	/*102 Last Use Date                    */
	char   	expiryDate[4];	/*108 Expiration Date                  */
	char   	onPosLimit[7];	/*112 Onl Pos With. Limit, '0005000'   */
	char   	offPosLimit[7];	/*119 Ofl Pos With. Limit, '0005000'   */
	char   	onMaxRef[7];	/*126 Onl Max Credit Amt, '0005000'    */
	char   	offMaxRef[7];	/*133 Ofl Max Credit Amt, '0005000'    */
	char   	usedToday[4];	/*140 POS Used Today Limit, '9999'     */
	char   	reasonCode;	/*144 Reason Code                      */
	char   	filler1;	/*145 Fill with ' '                    */
	char   	acctCount[2];	/*146 Number of Accts tied to this #   */
	/* Repetition part of each account # associated with this card */
	char 	type[2];
	char 	atmAccNo[19];  	/* Account Number */
	char 	status;
	char 	desc[10];
	/* Repetition part ends here */	
	char	filler2[50];
}; 

struct etisam {
	char	liveChar;		/* 0  1  */
	char	accNo[13];		/* 1  13 */
	char	offset[6];		/* 14 6  */
	char	etOrCipend;		/* 20 1  */		/*E-ET; C-Cipend*/
	char	atmAccNo[19];	/* 21 19 */   /* CIPEND - key part 1*/
	char	transTime[7];	/* 40 7  */   /* CIPEND - key part 2*/
	char	source[2];		/* 47 2  */   /* CIPEND - key part 3*/
	char	refNo[10];		/* 49 10 */   /* CIPEND - key part 4*/
	char	mainOrContra;	/* 59 1  */   /* applicable for CIPEND; M-Main;C-Contra*/
	char	filler[20];		/* 60    */
};

/*  TR00XX Indexed File based on TR00BB.NNN Relative file (Txn Record) */

struct o2d0data	{              
	char	liveChar;		  		/*   0 */
	char	recType[2];				/*   1 */
	char	batchNumber[7];			/*   3 */
	char	continueFlag;			/*  10 */
	char	accNo[13];				/*  11 Index Key, Field 3 */
	char	t_1filler8[8];		  	/*  24 */
	char	transType[2];		  	/*  32 */
	char	drcrInd;		  		/*  34 */
	char	reference[10];		  	/*  35 */
	char	narrative1[25];		  	/*  45 */
	char	narrative2[25];		  	/*  70 */
	char	narrative3[25];		  	/*  95 */
	char	t_2filler2[2];		  	/* 120 */
	char	oldBal[14];				/* 122 */
	char	t_3filler2[2];		  	/* 136 */
	char	transAmt[14];			/* 138 */
	char	t_4filler2[2];		  	/* 152 */
	char	newBal[14];				/* 154 */
	char	postDate[6];		  	/* 168 Index Key, Field 1 */
	char	valueDate[6];		  	/* 174 */
	char	exceptionCode[2];		/* 180 */
	char	generatedFlag;		  	/* 182 */
	char	interestRate[9];		/* 183 */
	char	maturityDate[6];		/* 192 */
	char	t_5filler1;		  		/* 198 */
	char	brokerNumber[6];		/* 199 */
	char	settleInstruction[105];	/* 205 */
	char	atmReqTime[6];			/* 310 */
	char	atmCardNo[13];			/* 316 */
	char	atmCardSeq;		  		/* 329 */
	char	atmTranCode[3];			/* 330 */
	char	atmTranDesc[20];		/* 333 */
	char	atmTranType;		  	/* 353 */
	char	atmAcctType;		  	/* 354 */
	char	atmStatType;		  	/* 355 */
	char	atmBatch[7];		  	/* 356 */
	char	atmPostFlag;		  	/* 363 */
	char	atmRevFlag;		  		/* 364 */
	char	atmAcctAmt[8];			/* 365 */
	char	atmDispensed[8];		/* 373 */
	char	contraAcctType;			/* 381 */
	char	countryCode[3];			/* 382 */
	char	imdNumber[6];			/* 385 */
	char	branchCode[4];		  	/* 391 */
	char	commission[7];		  	/* 395 */
	char	currDispensed[2];		/* 402 */
	char	atmLocalCurr[2];		/* 404 */
	char	oldMaturityDate[6];		/* 406 */
	char	oldInterestRate[9];		/* 412 */
	char	confirmationFlag;		/* 421 */
	char	lastStartDate[6];		/* 422 */
	char	interestAmt[14];		/* 428 */
	char	t_6filler2[2];		  	/* 442 */
	char	accountLimit[12];		/* 444 */
	char	t_7filler2[2];		  	/* 456 */
	char	serviceFee[14];			/* 458 */
	char	confirmationCode[2];	/* 472 */
	char	staff_indicator;		/* 474 */
	char	nonResidentFlag;		/* 475 */
	char	contraAccount[13];		/* 476 */
	char	t_8filler8[8];		  	/* 489 */
	char	contraType[2];		  	/* 497 */
	char	intApplFlag;		  	/* 499 */
	char	dateTelex[6];		  	/* 500 */
	char	custName[30];		  	/* 506 */
	char	tellerId[3];		  	/* 536 */
	char	t_9filler2[2];		  	/* 539 */
	char	baseEquivalent[14];		/* 541 */
	char	couponDiscountRate[9];	/* 555 */
	char	multiplyDivideFlag;		/* 564 */
	char	supervisorId[3];		/* 565 */
	char	t_10filler2[2];		  	/* 568 */
	char	witholdingAmt[14];		/* 570 */
	char	multiCurrencyInd;		/* 584 */
	char	memoNote[15];		  	/* 585 */
	char	verifierId[3];		  	/* 600 */
	char	t_11filler2[2];		  	/* 603 */
	char	exchangeRate[12];		/* 605 */ /*9(4)V9(8)*/
	char	t_12filler2[2];		  	/* 617 */
	char	nominalValue[14];		/* 619 */
	char	sortCode[10];		  	/* 633 */
	char	fxDealFlag;		  		/* 643 */
	char	dealNumber[5];		  	/* 644 */
	char	recoverableFlag;		/* 649 */
	char	passBookPrinted;		/* 650 */
	char	timeStamp[6];		  	/* 651 */
	char	issueDate[6];		  	/* 657 */
	char	sourceFlag;		  		/* 663 *//* [R]efresh,[O]n2update,[P]rod, [H]atifBank, [C]carrblk, [M]anual cc block */
											 /* [P]rod, [E]asidata, [S]taticdata */
	char	intRecalcFlag;			/* 664 */
	char	sourceBranch[2];		/* 665 */
	char	destAccount[13];		/* 667 */
	char	t_13filler7[320];		/* 680 */
	char	atmWithdrawalLimit[12];	/*1000*/
	char	filler[300];			/*1012*/
};		

struct acd0intPaid {
	char	amt[15];
	char	filler[3];
};

struct acd0intRecv {
	char	amt[15];
	char	filler[3];
};

struct acd0intIncome {
	char 	accNo[13];
	char	filler[7];
};

struct acd0intExpense {
	char	accNo[13];
	char	filler[7];
};

struct acd0data {
	char    liveChar;						/* 0	1 */
	char    currency[2];					/* 1	2 */
	char    ledgerCode[3];					/* 3	3 */
	char    filler1[16];					/* 6	16 */
	char	recType[2];						/*22	2  */

	/*  Original Struct begins
	char    accNo1[13];						/*24	13 
	char    filler2[107];					/*37	107
	char    accNo2[13];						/*144	13 
	char    filler3[110];					/*157	110
	char    intReceived[15];				/*267	15
	char    filler4[93];					/*282	93
	char    intPaid[15];					/*375 	15
	char    filler5[330];					/*390	330
		Original Struct Ends */

	struct acd0intIncome intIncomeAcc[6];	/* 24	120 */
	struct acd0intExpense intExpenseAcc[6];/*144	120 */
	char	filler2[3];						/*164	3   */
	struct acd0intRecv intReceived[6];	 	/*267	108 */
	struct acd0intPaid intPaid[6]; 		   	/*375	108 */
	char    filler3[237];					/*483	237*/
	char    branchCode[4];					/*720	4*/
	char    filler[700];
};

struct iad0intReceived {
	char 	accNo[13];
	char	filler[7];
};

struct iad0intPaid {
	char	accNo[13];
	char	filler[7];
};

struct iad0data {
	char	liveChar;							/*  0	1  */
	char	branchCode[4];						/*  1	4  */
	char	currency[2];						/*  5	2  */
	char	ledgerCode[3];						/*  7	3  */
	char	filler1[18];						/* 10	18 */

	/*		Original Structure begins 
	char	accNo1[13];							// 28	13 
	char	filler2[107];						// 41	107
	char	accNo2[13];							//148	13 
	char	filler3[500];						//161	500
			Original structure Ends*/

	struct	iad0intReceived	intReceivedAcc[6];	/* 28	120*/
	struct	iad0intPaid		intPaidAcc[6];		/*148	120*/
	char	filler3[400];						/*268	400*/
};

struct ard0data	{
	char	liveChar;
	char	branchCode[4];						/*1,4*/
	char	accNo[13];							/*5,13*/
	char	filler1[7];							/*18,7*/
	char	repaymentDate[6];					/*25,6*/
	char	arrearAccNo[13];					/*31,13*/
	char	filler2[7];							/*44,7*/
	char	settlementAccNo[13];				/*51,13*/
	char	filler3[9];							/*64, 9*/
	char	repaymentAmt[14];					/*73,14*/
	char	filler4[2];							/*87,2*/
	char	repaymentAmtPaid[14];				/*89,14*/
	char	filler5[2];							/*103, 2*/
	char	principalAmt[14];					/*105,14*/
	char	filler6[2];							/*119,2*/
	char	principalAmtPaid[14];				/*121, 14*/
	char	filler7[2];							/*135, 2*/
	char	accruedInt[14];						/*137, 14*/
	char	filler8[2];							/*151, 2*/
	char	accruedIntPaid[14];					/*153, 14*/
	char	filler9[2];							/*167, 2*/
	char	penaltyAccruedInt[14];				/*169, 14*/
	char	filler10[2];						/*183, 2*/
	char	penaltyAccruedIntPaid[14];			/*185,14*/
	char	penaltyIntRate[9];					/*199, 9*/
	char	penaltyIntAccrualDate[6];			/*208, 6*/
	char	repaymentStatus[2];					/*214, 2*/
	char	repaymentStatusDate[6];				/*216, 6*/
	char	repaymentSettlementDate[6];			/*222, 6*/
	char	filler11[31];						/*228, 31*/
	char	migrationFlag;						/*259, 1 */
	char	filler12[300];						/*260-*/
};

struct acrHead {
	char	liveChar;
	char	recType[2];
	char	runDate[6];
	char	filler[250];
};

struct acrDetails	{
	char	liveChar;					/* 0 - 1 */
	char	recType[2];					/* 1 - 2 */
	char	branchCode[4];				/* 3 - 4 */
	char	accNo[13];					/* 7 - 13 */
	char	intFlag;					/*20 - 1 */
	char	accruedInt[15];				/*21 - 15*/
	char	payeCr[15];					/*36 - 15*/
	char	payeDr[15];					/*51 - 15*/
	char	intApplication;				/*66 - 1 */
	char	payeAcc[13];				/*67 - 13*/
	char	intFrequency;				/*80 - 1*/
	char	doubtYtdInt[15];			/*81 - 15*/
	char	doubtFlag;					/*96 - 1 */
	char	accrualAdjustment[15];		/*97 - 15*/
	char	ytdInNormal[15];			/*112- 15*/
	char	previousYtd[15];			/*127- 15*/
	char	filler[185];				/*142-   */
};

struct	acaHead	{
	char	liveChar;
	char	recType[2];
	char	runDate[6];
	char	postProcessFlag;
	char	updateProcessFlag;
	char	filler[150];
};

struct 	acaDetails  {
	char	liveChar;
	char	recType[2];
	char	accNo[13];
	char	refNo[10];
	char	transType[2];
	char	transAmt[14];
	char	contraAcc[13];
	char	processFlag;
	char	filler[80];
};

struct	acaTotal	{
	char	liveChar;
	char	recType[2];
	char	branchCode[4];
	char	memoCode[5];
	char	intFlag;
	char	filler1[15];
	char	totCrInt[15];
	char	totDrInt[15];
	char	filler2[80];
};

struct glSum 
{
	char    liveChar;				/* 0 - 1 */
	char    recType[2];				/* 1 - 2 */
	char    branchCode[4];			/* 3 - 4 */
	char    currCode[2];			/* 7 - 2 */
	char    ledgerCode[3];			/* 9 - 3 */
	char    drClearedBal[16];		/* 12 - 16 */
	char    crClearedBal[16];		/* 28 - 16 */
	char    drBookBal[16];			/* 44 - 16 */
	char    crBookBal[16];			/* 60 - 16 */
	char    noOfAccs[6];			/* 76 - 6 */
	char    transCrClearedBal[16];	/* 82 - 16 */
	char    transDrClearedBal[16];	/* 98 - 16 */
	char    transCrBookBal[16];		/* 114 - 16 */
	char    transDrBookBal[16];		/* 130 - 16 */
	char    filler[130];
};

struct fnglsum 
{
	char    liveChar;				/* 0 - 1 */
	char    solId[5];				/* 1 - 5 */
	char	currCode[2];			/* 6 - 2 */
	char    memoCode[7];			/* 8 - 7 */
	char    clearedBalDrCrInd;		/* 15 - 1 */ /* + or - */
	char    clearedBal[22];			/* 16 - 22 */
	char    bookBalDrCrInd;			/* 38 - 1 */ /* + or - */
	char    bookBal[22];			/* 39 - 22 */
	char    currRate[22];			/* 61 - 22 */
	char    lastUpdateDate[8];		/* 83 - 8 */
	char	filler1[37];			/* 91 - 37 */ /* For future use */
	char    filler[130];
};

struct chartOfAcc
{
	char    liveChar;				/* 0 - 1 */
	char    bmMemoCode[3];			/* 1 - 3 */
	char    glSubHead[5];			/* 4 - 5 */
	char    snoAcct[4];				/* 9 - 4 */ 
	char    description[100];		/* 13 - 100*/
	char    typeCorI;				/* 113 - 1 */  /* C or I */
	char    schemeType[3];			/* 114 - 3 */
	char    schemeCode[5];			/* 117 - 5 */
	char	filler1[6];				/* 122 - 6 */ /* For future use */
	char    filler[130];
};

struct cbsrlno
{
	char    liveChar;				/* 0 - 1 */
	char    srlNo[4];				/* 1 - 4 */
	char    alphaCode[2];			/* 5 - 2 */
	char	filler1[57];			/* 7 - 57 */ /* For future use */
	char    filler[100];
};

struct fnbmmemo
{
	char    liveChar;				/* 0 - 1 */
	char    fnglsumMemo[7];			/* 1 - 7 */
	char    bmMemo[3];				/* 8 - 2 */
	char	filler1[57];			/* 10 - 54 */ /* For future use */
	char    filler[100];
};

struct acrrec 
{
	char	liveChar;
	char	accNo[13];
	char	accruedInt[14];
	char	bookBal[14];
	char	transTotal[14];
	char	difference[14];
	char	calcType;
	char	filler[100];
};

struct currDetails {
	int   	decimalPlace;
	char    currName[30];
	char	existFlag;
	double  exRate;
	int		drBaseDays;
	int		crBaseDays;
};

struct clsLoanDetails {
	char	liveChar;			/* 000 - 01 */
	char	applicationNo[8];	/* 001 - 08 */
	char	custNo[6];			/* 009 - 06 */
	char	branchCode[4];		/* 015 - 04 */
	char	requestDate[8];		/* 019 - 08 */
	char	requestTime[6];		/* 027 - 06 */
	char	clsNarrative[50];	/* 033 - 50 */
	char	transType;	/* 0 - Book loan; 1-Amend installment  083-01 */
	char	loanStatus;	/*0-approval pending;1-Rejected;2-Approved 084-01 */
	char	bmStatus;	/* 0-Validated;1-Accepeted; 2-Acc.Opened;
						   3-Posting completed               085-01 */
	char	loanType;	/* 0 - Regular; 1-Discounted Bills   086-01 */
	char	principalAmt[15]; /* three decimal places  087-15 */
	char	memoCode[5];	 	/* 102 - 05 */
	char	valueDate[8];		/* 107 - 08 */
	char	intRate[5];			/* 115 - 05 */
	char	intAmt[15];			/* 120 - 15 */
	char	intAccNo[13];		/* 135 - 13 */
	char	settlementAccNo[13];/* 148 - 13 */
	char	arrearAccNo[13];	/* 161 - 13 */
	char	loanAccNo[13];		/* 174 - 13 */
	char	noOfInstallments[3];/* 187 - 03 */
	char	accType[2];			/* 190 - 02  required for diary*/
	char	bankingDate[8];		/* 192 - 08 banking date required for anb910*/
	char	recvTime[6];		/* 200 - 06 */
	char	filler[400];		/* 206 - */
};

struct clsArrearDetails {
	char	liveChar;
	char	applicationNo[8];
	char	installmentDate[8];
	char	installmentAmt[15];
	char	filler[20];
};

/* Standing order file */

struct sod0data 
{
	char 	liveChar;					/* 0 - 1 */
	char	accNo[13];					/* 1 - 13 */
	char	filler1[7];					/*14 - 7 */
	char	sodNo[6];					/*21 - 6 */
	char	paymentType;				/*27 - 1 */ /* 0 - Pay Until further notice
													   1 - Pay until specified total has been paid 
													   2 - Pay until specified date has been reached
													   3 - Pay until specified number of payments have been made
													   4 - Payment stopped
													   5 - Final payment made
													*/
	char	paymentMode;				/*28 - 1 */ /* 0 - Customer is beneficiary. Pay from/to account at our bank
													   1 - Customer is not beneficiary. Pay from/to account at our bank.
													*/
	char	firstPaymentDate[6];		/*29 - 6 */
	char	finalPaymentDate[6];		/*35 - 6 */
	char	paymentsToBeMade[3];		/*41 - 3 */
	char	paymentsMade[3];			/*44 - 3 */
	char	filler2[2];					/*47 - 2 */
	char	paymentAmt[14];				/*49 - 14*/
	char	filler3[2];				    /*63 - 2 */
	char	totalToPay[14];				/*65 - 14 */
	char	filler4[2];					/*79 - 2 */
	char	totalPaidToDate[14];		/*81 - 14 */
	char	paymentFrequency;			/*95 - 1 */ /* D - Daily
													   W - Weekly
													   M - Monthly
													   Q - Quarterly
													   H - Half yearly
													   Y - Yearly
													*/
	char	filler5[4];					/*96 - 4 */
	char	nextPaymentDate[6];			/*100- 6 */
	char	limitInExcessFlag;			/*106- 1 */ /* 0 - Pay 
													   1 - Do not pay in limit excess situation 
													   2 - Manual Run (Allows payment in limit excess situation)
													*/
	char	narrative1[25];				/*107- 25*/
	char	narrative2[25];				/*132- 25*/
	char	narrative3[25];				/*157- 25*/
	char	payAccNo[13];				/*182- 13*/
	char	filler6[7];					/*195- 7 */
	char	payeName1[30];				/*202-30*/
	char	payeName2[30];				/*232-30*/
	char	payeAddress1[30];			/*262-30*/
	char	payeAddress2[30];			/*292-30*/
	char	payeAddress3[20];			/*322-20*/
	char	payeAddress4[20];			/*342-20*/
	char	payeAddress5[10];			/*362-10*/
	char	payeBank[40]; 				/*372-40*/
	char	filler7[10];				/*412-10*/
	char	payeBankCode[10];			/*422-10*/
	char	chequeChargesFlag;			/*432-1*/ /* 0 - No charge to be applied for cheques.
													 1 - Charge to be applied for cheques
												  */
	char	commissionFlag;				/*433-1*/ /* 0 - No commission Charged
													 1 - Commission to be charged
												  */
	char	orderType;					/*434-1*/ /* 0 - Specific Standing Order
													 1 - Automatic funds transfer FROM standing order account
													 2 - Automatic funds transfer TO standing order account
												  */
	char	processNextDayFlag;			/*435-1*/ /* 0 - Process today, during today's end-of-day routine
													 1 - Process next day, during next day's start-of-day routine. 
													 (This means an entry is made on the Tag File).
												 */
	char	listOnlyFlag;				/*436-1*/ /* 0 - Process normally and update.
													 1 - Only list standing order. Do not update.
												  */
	char	filler8[2];					/*437-2*/
	char	transferLimit[4];			/*439-14*/
	char	thresholdAmt[10];			/*443-10 redefined field */
	char	drNarrative1[20];			/*453-20*/
	char	drNarrative2[20];			/*473-20*/
	char	crNarrative1[20];			/*493-20*/
	char	crNarrative2[20];			/*513-20*/
	char	transactionDateFlag;		/*533-1*/ /* 0 - Use run date 
													 1 - Use due date
												  */
	char	lastProcessedDate[6];		/*534-6*/ 
	char	generateAdviseFlag;			/*540-1*/ /* 0 - Confirmation may be generated for the standing order.
													 1 - Confirmation will not be generated for the standing order
												  */
	char	filler9[2];					/*541-2*/
	char	newPaymentAmt[14];			/*543-14*/
	char	unpaidCommision;			/*557-1*/
	char	branchCode[4];				/*558-4*/
	char	remarks[25];				/*562-25*/
	char	filler10[500];				/*587-437*/
};

struct card_detail {
	char	liveChar;					/*0   - 1*/
	char	processDateTime[14];		/*1   -14*/
	char	cardNo[19];					/*15  -19*/
	char	requestDateTime[14];		/*34  -14*/
	char	requestStatus;				/*48  - 1*/
	char	requestBranch[3];			/*49  - 3*/
	char	requestUserId[20];			/*52  -20*/
	char	cardType;					/*72  - 1*/
	char	newOrReplacement;			/*73  - 1*/
	char	primaryOrSupplementary;		/*74  - 1*/
	char	cardStatus;					/*75  - 1*/
	char	regionCode;					/*76  - 1*/
	char	bmAccNo[14];				/*77  -14*/
	char	languageCode;				/*91  - 1*/
	char	customerBranch[3];			/*92  - 3*/
	char	addressNo[4];				/*95  - 4 */
	char	nameOnTheCard[30];			/*99  -30*/
	char	firstIssueDate[8];			/*129 - 8*/
	char	issueDate[8];				/*137 - 8*//*can be a renewal date*/
	char	expireDate[8];				/*145 - 8*/
	char	rejectedDate[8];			/*153 - 8*/
	char	rejectedUserId[20];			/*161 -20*/
	char	rejectedReason[20];			/*181 -20*/
	char	orgCardNo[19];				/*201 -19*/
	char	deactivationDate[8];		/*220 - 8*/
	char	deactivationUserId[20];		/*228 -20*/
	char	lastUsedDate[8];			/*248 - 8*/
	char	filler[227];				/*256-227*/
	char	recordLastUpdateUser[15];	/*483 -15*/
	char	recordLastUpdateDateTime[14];/*498 -14*/
};

struct card_address {
	char	liveChar;					/*0   - 1*/
	char	custNo[7];					/*1   - 7*/
	char	addressNo[4];				/*8   - 4*/
	char	englishAddress1[30];		/*12  -30*/
	char	englishAddress2[30];		/*42  -30*/
	char	poBox[12];					/*72  -12*/
	char	city[30];					/*84  -30*/
	char	zipCode[10];				/*114 -10*/
	char	isoCountryCode[3];			/*124 - 3*/
	char	offTelephone[10];			/*127 -10*/
	char	offTelExtension[5];			/*137 - 5*/
	char	homeTelephone[10];			/*142 -10*/
	char	homeTelExtension[5];		/*152 - 5*/
	char	idType;						/*157 - 1*/
	char	idNo[15];					/*158 -15*/
	char	filler[83];					/*173 -83*/
};

struct card_history {
	char	liveChar;					/*0   - 1*/
	char	cardNo[19];					/*1   -19*/
	char	issueDate[8];				/*20  - 8*/
	char	cardProducedDate[8];		/*28  - 8*/
	char	cardDispatchDate[8];		/*36  - 8*/
	char	cardDispatchUser[20];		/*44  -20*/
	char	branchRcvdDate[8];			/*64  - 8*/
	char	userRcvdAtBranch[20];		/*72  -20*/
	char	customerRcvdDate[8];		/*92  - 8*/
	char	userIssuedToCustomer[20];	/*100 -20*/
	char	pinProducedDate[8];			/*120 - 8*/
	char	pinDispatchDate[8];			/*128 - 8*/
	char	pinDispatchUser[20];		/*136 -20*/
	char	branchRcvdPinDate[8];		/*156 - 8*/
	char	userRcvdPinAtBranch[20];	/*164 -20*/
	char	customerRcvdPinDate[8]; 	/*184 - 8*/
	char	userIssuedPinToCustomer[20];/*192 -20*/
	char	reportedForDestruction;		/*212 - 1*/
	char	filler[35];					/*213 -35*/
	char	recordLastUpdateDate[8];	/*248 - 8*/
};

struct card_supplementary {
	char	liveChar;					/*0  - 1*/
	char	cardNo[19];					/*1  -19*/
	char	arabicFirstName[20];		/*20 -20*/
	char	arabicSecondName[20];		/*40 -20*/
	char	arabicThirdName[20];		/*60 -20*/
	char	arabicFamilyName[20];		/*80 -20*/
	char	arabicShortName[30];		/*100-30*/
	char	englishFirstName[20];		/*130-20*/
	char	englishSecondName[20];		/*150-20*/
	char	englishThirdName[20];		/*170-20*/
	char	englishFamilyName[20];		/*190-20*/
	char	englishShortName[30];		/*210-30*/
	char	nationalityCode[3];			/*240- 3*/
	char	idType;						/*243- 1*/
	char	idNo[15];					/*244-15*/
	char	sexCode;					/*259- 1*/
	char	primaryCardNo[19];			/*260-19*/
	char	filler[233];				/*279-233*/
};

struct card_o2dfile {
	char	liveChar;					/*0  - 1*/
	char	cardNo[19];					/*1  -19*/
	char	requestType[2];				/*20 - 2*/
	char	requestText[16];			/*22 -16*/
	char	cardStatus[2];				/*38 - 2*/
	char	filler[600];				/*40 -600*/
	char	fileType[3];				/*641 -3*/
	char	constatnt;					/*644 -1*/
	char	filler1[500];
};

struct aad0data 
{	/* Taken from easidata paramerter file ACCDET - ALCO file */
	char    liveChar;                 /*0-1*/
	char    accNo[13];                /*1-13*/ /* Holds Memo (5) + Finone Loan(8) */
	char    intRevPeriod;             /*14-1*/
	char    intRevFreq[2];            /*15-2*/
	char    crmarginFundRate[8];      /*17-8*/ /* earlier it was CrmarginFundRate*/
	char    drmarginFundRate[8];      /*25-8*/ /* earlier it was DrmarginFundRate*/
	char    crmarginIntRev[8];        /*33-8*/ /* earlier it was CrmarginIntRev*/
	char    drmarginIntRev[8];        /*41-8*/ /* earlier it was DrmarginIntRev*/
	char    startDate[6];             /*49-6*/ /* earlier it was startDt */
	char    maturityDate[6];          /*55-6*/	/*Nostro Date ; earlier it was maturityDt */
	char    crMaturityAmt[14];        /*61-14*/ /*CrMtdFundingAmt*/
	char    drMaturityAmt[14];        /*75-14*/ /*drMtdFundingAmt*/
	char    maturityBal[14];          /*89-14*/ /* Report Bal/cleared Bal/loan balance, etc */
	char    crIntRate[9];             /*103-9*/	/* earlier it was CrIntRate*/
	char    drIntRate[9];             /*112-9*/ /* earlier it was DrIntRate*/ /* used for bmgwpay */
	char    crFundAmt[14];            /*121-14*//* earlier it was CrFundAmt*/
	char    drFundAmt[14];            /*135-14*//* earlier it was DrFundAmt*/
	char    processDate[6];           /*149-6*/ /* earlier it was processDt */
	char    filler1[6];               /*155-6*/
	char    branchCode[4];            /*161-4*/ /* earlier it was branchCd*/
	char    maturityAmtNonPrf[14];    /*165-14*//*drNpMtdIntAmt*/
	char    status;                   /*179-1*/
	char    statusDate[6];            /*180-6*/ /* earlier it was statusDt */
	char    maturityIntRate[9];       /*186-9*/
	char    renewType;                /*195-1*/
    char    renewPrd[2];              /*196-2*/
    char    reviewDate[6];            /*198-6*/ /* earlier it was reviewDt */
	char    drInterestPYTD[14];       /*204-14*/ 
	char    drInterestCYTD[14];       /*218-14*/ 
	char    crInterestPYTD[14];       /*232-14*/ 
	char    newRvPrd;                 /*246-1*/
	char    newRvFreq[2];             /*247-2*/
	char    filler21[8];              /*249-8*/
	char	penIntRate[9];			  /*257-9*/
	char	filler3[6];				  /*266-6*/
	char    custNo[7];				  /*272-7*/
	char	loanBlockBal[14];		  /*279-14*/
	char	settlementAccNo[13];	  /*293-13*/
	char	filler4[250];			  /*306-250*/
};

struct pens	{
	char	liveChar;			/* 0 - 1 */
	char	penCardNo[9];		/* 1 - 9 */
	char	penName[40];		/*10 -40 */
	char	penHafNo[10];		/*50 -10 */
	char	penHafPlC[3];		/*60 - 3 */
	char	penHafPl[15];		/*63 -15 */
	char	penBtNo[15];		/*78 -15 */
	char	reprName[30];		/*93 -30 */
	char	reprIdNo[10];		/*123-10 */
	char	reprIdPl[15];		/*133-15 */
	char	penAccNo[14];		/*148-14 */
	char	penAmt[9];			/*162- 9 */
	char	penDedn[9];			/*171- 9 */
	char	penNett[9];			/*180- 9 */
	char	branchCode[3];		/*189- 3 */
	char	issuerNo[9];		/*192- 9 */
	char	issueDate[8];		/*201- 8 */
	char	cashStat[16];		/*209- 16*/
	char	inHrNo[2];			/*225- 2 */
	char	cardType[7];		/*227- 7 */
	char	cardStat[7];		/*234- 7 */
	char	paymentType[5];		/*241- 5 */
	char	subCard[2];			/*246- 2 */
	char	proxyFlag;			/*248- 1 */ /*0-No; 1-Yes */
	char	nonPensionerProxy;	/*249- 1 */ /*0-No; 1-Yes */
	char	filler[50];			/*248- 50 */
};

struct pennot
{
	char 	liveChar;		/* 0 - 1 */
	char	penCardNo[9];	/* 1 - 9 */
	char	notes1[50];		/* 10 - 50 */
	char	notes2[50];		/* 60 - 50 */
	char	notes3[50];		/* 110 - 50 */
	char	notes4[50];		/* 160 - 50 */
	char	notes5[50];		/* 210 - 50 */
	char	notes6[50];		/* 260 - 50 */
	char	notes7[50];		/* 310 - 50 */
	char	notes8[50];		/* 360 - 50 */
	char	notes9[50];		/* 410 - 50 */
	char	notes10[50];	/* 460 - 50 */
	char	notes11[50];	/* 510 - 50 */
	char	notes12[50];	/* 560 - 50 */
	char	notes13[50];	/* 610 - 50 */
	char	notes14[50];	/* 660 - 50 */
	char	notes15[50];	/* 710 - 50 */
	char	filler[100];	/* 760 - 100 */
};

struct rid0data
{
	char	liveChar;				/* 0  - 1 */
	char 	recType[2];				/* 1  - 2 */ /* TF-Transfer or DF-Draft or DR-Draft Range*/
	char	transRef[10];			/* 3  - 10*/
	char	draftRef[18];			/*13  - 18*/ 
	char	drAccNo[13];			/*31  - 13*/
	char	filler[7];				/*44  - 7 */
	char	crAccNo[13];			/*51  - 13*/
	char	filler1[7];				/*64  - 7 */ 
	char	transCurrCode[3];		/*71  - 3 */
	char	filler2[2];				/*74  - 2 */
	char	netAmt[14];				/*76  - 14*/ /* transfer or draft amount */
	char	issueDate[6];			/*90  - 6 */
	char	valueDate[6];			/*96  - 6 */
	char	payCurrCode[3];			/*102 - 3 */
	char	filler3[2];				/*105 - 2 */
	char	payAmt[14];				/*107 - 14*/
	char	filler4[2];				/*121 - 2*/
	char	exchangeRate[12];		/*123 - 12*/ /*9(4)V9(8)*/
	char	filler5[2];				/*135 - 2*/
	char	baseEquivalent[14]; 	/*137 - 14*/
	char	statusFlag;				/*151 - 1 */ /*S-Create Skeleton; I-Issued; V-Verified; C-Confirmed; D-Cancelled; P-Stopped;
												   O-Dormant; R-Repurchased; T-Settled/Cleared*/
	char	previousStatusFlag;		/*152 - 1 */
	char	verficationCounter;		/*153 - 1 */
	char	exAdviceFlag;			/*154 - 1 */
	char	actionDate[6];			/*155 - 6 */
	char	countryCode[3];			/*161 - 3 */
	char	imdCode[6];				/*164 - 6 */
	char	branchCode[4];			/*170 - 4 */
	char	bmBranchCode[2];		/*174 - 2 */
	char	branchSortCode[12];		/*176 - 12*/
	char	reservedFiller[62];		/*188 - 62*/
	char	recordNo[5];			/*250 - 5*/
	char	paymentStatus;			/*255 - 1 */ /* 0-Initialised; 1-Direct Transfer; 2-SWIFT/Telex; 3-Postal/Fax; 4-Telephone*/
	char	issueBank[12];			/*256 - 12*/
	char	draweeBank[12];			/*268 - 12*/
	char	coveringBank[12];		/*280 - 12*/
	char	issueCountryCode[3];	/*292 - 3 */
	char	filler6;				/*295 - 1 */
	char	totAmt[30];				/*296 - 30*/ /*applicant name*/ /* 14 chars Pen totalAmt + 2chars blank + 14 chars deductions*/
	char	payMethod[10];			/*326 - 10*/
	char	penProxyName[30];		/*336 - 30*/ /*beneficiary name*/
	char	pensionerName[35];		/*366 - 35*/ /*beneficiary addr*/
	char	benefAddress2[35]; 		/*401 - 35*/
	char	benefAddress3[35]; 		/*436 - 35*/
	char	benefAddress4[35]; 		/*471 - 35*/
	char	issueSortCode[12];		/*506 - 12*/
	char	contraSortCode[12];		/*518 - 12*/
	char	filler7[32];			/*530 - 32*/
	char	statusFlag1;			/*562 - 1 */ /* T - Settled */
	char	filler8[4];				/*563 - 4 */
	char	benefCountryCode[2];	/*567 - 2 */
	char	filler10;				/*569 - 1 */
	char	benefBank1[35];			/*570 - 35*/
	char	benefBankBIC[22];		/*605 - 22*/
	char	benefAddress5[35];		/*627 - 35*/
	char	senderLine1[35];		/*662 - 35*/
	char	senderLine2[35];		/*697 - 35*/
	/*char	senderLine3[35];		  732 - 35 Amended on 17 Mar 04 to accomodate Pension Class. Replaced with next three lines */
	char	senderLine3[9];			/*732 - 9*/
	char	pensionClass;			/*741 - 1*/
	char	SenderLine3Remain[25];  /*742 - 25*/
	char	senderLine4[15];		/*767 - 15*/
	char	coveringBank1[35];		/*782 - 35*/
	char	benefAccNo[35];         /*817 - 35*/
	char	message1[35];			/*852 - 35*/ /*covering bank Addr2*/
	char	message2[35];			/*887 - 35*/ /*covering bank Addr3*/
	char	message3[35];			/*922 - 35*/
	char	message4[35];			/*957 - 35*/
	char	transferPurpose[2];		/*992 - 2 */ /* Added on 23rd July 2007 for SWIFT centralization project */
	char	benefBankBICcode[11];	/*994 - 11 */ /* Added on 23rd July 2007 for SWIFT centralization project */
	char	filler9[200];			/*1005 - 200*/
};

struct peninh
{
	char	liveChar;			/*  0 -  1  */
	char	penCardNo[9];		/*  1 -  9  */
	char	branchCode[3];		/* 10 -  3  */
	char	noOfInh[2];		    /* 13 -  2  */
	char	penSalary[9];		/* 15 -  9  */
	char	name1[60];			/* 24 - 60  */
	char	name2[60];			/* 84 - 60  */
	char	name3[60];			/* 144 - 60 */
	char	name4[60];			/* 204 - 60 */
	char	name5[60];			/* 264 - 60 */
	char	name6[60];			/* 324 - 60 */
	char	name7[60];			/* 384 - 60 */
	char	name8[60];			/* 444 - 60 */
	char	name9[60];			/* 504 - 60 */
	char	name10[60];			/* 564 - 60 */
	char	name11[60];			/* 624 - 60 */
	char	name12[60];			/* 684 - 60 */
	char	name13[60];			/* 744 - 60 */
	char	name14[60];			/* 804 - 60 */
	char	name15[60];			/* 864 - 60 */
	char	name16[60];			/* 924 - 60 */
	char	name17[60];			/* 984 - 60 */
	char	name18[60];			/* 1044 - 60 */
	char	name19[60];			/* 1104 - 60 */
	char	name20[60];			/* 1164 - 60 */
	char	name21[60];			/* 1224 - 60 */
	char	name22[60];			/* 1284 - 60 */
	char	name23[60];			/* 1344 - 60 */
	char	name24[60];			/* 1404 - 60 */
	char	name25[60];			/* 1464 - 60 */
	char	filler[200];		/* 1524 - 200 */
};

struct bkdhist  {	/* required for blockUnBlock */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	service[2];			/* 3   -  2 */ /*95-Blocking; 96-Unblocking*/
	char	transDate[8];		/* 5   -  8 */ /* YYYYMMDD */
	char	transTime[9];		/* 13  -  9 */ /* HHMMSSLLL */
	char	refNo[10];			/* 22  - 10 */
	char	userId[4];			/* 32  -  4 */
	char	accNo[14];			/* 36  - 14 */
	char	transAmt[14];		/* 50  - 14 */
	char	narrative1[25];		/* 64  - 25 */
	char	dormantAccBlocking;	/* 89  -  1 */
	char	processDateTime[14];/* 90  - 14 */ /*Date+Time YYYYMMDDHHMMSS*/ 
	char	bankingDate[8];		/* 104 -  8 */ /* YYYYMMDD */
	char	extentionNo[6];	    /* 112 - 6*/
	char	transCategory;		/* 118 - 1*/ /* 0 -normal; 1- forceBlock*/
	char	filler[50]; 		/* 119 - 50 */ /*rec length 128 */
};

struct dpthdidx {	/* required for FINONE directpost to hold thd index record for reconSettlement transaction */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	service[2];			/* 3   -  2 */
	char	transDate[8];		/* 5   -  8 *//* YYYYMMDD */
	char	transTime[9];		/* 13  -  9 *//* HHMMSSLLL */
	char	refNo[16];			/* 22  - 16 */
	char	userId[4];			/* 38  -  4 */
	char	mainAccNo[14];		/* 42  - 14 */
	char	thdIdxRec[34];		/* 56  - 34 */
	char	filler[50];			/* 90  - 50 */ /* Record length = 128*/
};

struct dpgeneralupdate {	/* required for FINONE directpost general update details */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	service[2];			/* 3   -  2 */
	char	transDate[8];		/* 5   -  8 *//* YYYYMMDD */
	char	transTime[9];		/* 13  -  9 *//* HHMMSSLLL */
	char	refNo[16];			/* 22  - 16 */
	char	userId[4];			/* 38  -  4 */
	char	mainAccNo[14];		/* 42  - 14 */ /* for finnone it will have bmLoanNo*/
	char	fileName[20];		/* 56  - 20 */ 
	char	dirName[10];		/* 76  - 10 */
	char	key1Offset[4];		/* 86  -  4 */
	char	key1Value[25];		/* 90  - 25 */
	char	key2Offset[4];		/*115  -  4 */
	char	key2Value[25];		/*119  - 25 */
	char	key3Offset[4];		/*144  -  4 */
	char	key3Vlaue[25];		/*148  - 25 */
	char	position[4];		/*173  -  4 */
	char	length[2];			/*177  -  2 */ /* Maximum of 30 chars */
	char	oldValue[30];		/*179  - 30 */
	char	newValue[30];		/*209  - 30 */
	char	fieldType;			/*239  -  1 */ /* A-Alpha(will be replaced) N-Numeric(will be adjusted)*/
	char	keyNum[2];			/*240  -  2 */
	char	filler[100];		/*242  -100*/ /* Record length 256*/
};

struct dprepayhistory {	/* required for FINONE directpost repayment history details */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	service[2];			/* 3   -  2 */
	char	transDate[8];		/* 5   -  8 *//* YYYYMMDD */
	char	transTime[9];		/* 13  -  9 *//* HHMMSSLLL */
	char	refNo[16];			/* 22  - 16 */
	char	userId[4];			/* 38  -  4 */
	char	mainAccNo[14];		/* 42  - 14 */ /* ie here bmLoanNo*/
	struct  ard0data	repayHist;/* 56  - 512*/ /*Warning : repayment history strcture can be more than 512*/
	char	filler[100];		/* 568-100*/ /* Record length 512+128=640*/
};

struct dpdiary {	/* required for FINONE directpost diary details */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	service[2];			/* 3   -  2 */
	char	transDate[8];		/* 5   -  8 *//* YYYYMMDD */
	char	transTime[9];		/* 13  -  9 *//* HHMMSSLLL */
	char	refNo[16];			/* 22  - 16 */
	char	userId[4];			/* 38  -  4 */
	char	mainAccNo[14];		/* 42  - 14 */ /* for finnone it will have bmLoanNo*/
	struct  dzd0data	diary;	/* 56  - 1024*/ /*Warning : diary strcture can be more than 1024*/
	char	filler[100];		/* 1080- 100*/ /* Record length 1024+128=1152*/
};

struct dpshadow {	/* required for FINONE directpost shadow diary details */
	char	liveChar;		  		/* 0   -  1 */
	char	source[2];				/* 1   -  2 */
	char	service[2];				/* 3   -  2 */
	char	transDate[8];			/* 5   -  8 *//* YYYYMMDD */
	char	transTime[9];			/* 13  -  9 *//* HHMMSSLLL */
	char	refNo[16];				/* 22  - 16 */
	char	userId[4];				/* 38  -  4 */
	char	mainAccNo[14];			/* 42  - 14 */ /*for finnone it will have bmLoanNo*/
	char	finnoneLoanNo[8];		/* 56  - 8 */
	char	finnoneLoanBrCode[4];	/* 64  -  4 */
	char	finnoneLedgerCode[3];	/* 68  -  3 */
	char	finnoneLoanStatus;		/* 71  -  1 */
	char	repaymentDate[8];		/* 72  -  8 */
	char	repaymentAmt[14];		/* 80  - 14 */
	char	filler[50]; 			/* 94  - 50 */ /*rec length 128 */
};

struct dptrans {	/* required for directtrans */
	char	liveChar;		  	/* 0   -  1 */
	char	source[2];			/* 1   -  2 */
	char	transDate[8];		/* 3   -  8 *//* YYYYMMDD */
	char	transTime[9];		/* 11  -  9 *//* HHMMSSLLL */
	char	refNo[16];			/* 20  - 16 */
	char	userId[4];			/* 36  -  4 */
	char	mainAccNo[14];		/* 40  - 14 */
	char	transCategory;		/* 54  -  1 */
	char	transCount[2];		/* 55  -  2 */
	char	accNo[14];			/* 57  - 14 */
	char	transAmt[14];		/* 71  - 14 */
	char	transType[2];		/* 85  -  2 */
	char	narrative1Code[4];	/* 87  -  4 */
	char	narr2AccNo[14];		/* 91  - 14 */
	char	finnoneBmTrans;		/* 105 - 1  */
	char	exRate[14];			/* 106 - 14 */ /* 9(6)V9(8) format */
	char	internalTrans;		/* 120 - 1 */ /*1-Internal Transaction; else actual transaction */
	char	filler[50]; 		/* 120 - 50 */ /*rec length 128 */
};

struct dpheader {
	char	liveChar;		  		/* 0   -  1 */
	char	source[2];				/* 1   -  2 */
	char	transDate[8];			/* 3   -  8 */ /* YYYYMMDD */
	char	transTime[9];			/* 11  -  9 */ /* HHMMSSLLL */
	char	refNo[16];				/* 20  - 16 */
	char	userId[4];				/* 36  -  4 */
	char	mainAccNo[14];			/* 40  - 14 */
	char	transCategory;			/* 54  -  1 */ /*0-Normal; 2-Reversed*/
	char	Enarrative1[25];		/* 55  - 25 */
	char	Enarrative2[25];		/* 80  - 25 */
	char	Enarrative3[25];		/* 105 - 25 */
	char	Anarrative1[25];		/* 130 - 25 */
	char	Anarrative2[25];		/* 155 - 25 */
	char	Anarrative3[25];		/* 180 - 25 */
	char	unblockingRequired;		/* 205 -  1 */
	char	amtToBeBlocked[14]; 	/* 206 - 14 */
	char	dormantAccPosting;  	/* 220 -  1 */
	char	noOfTransHere[2];		/* 221 -  2 */
	char	processDateTime[14];	/* 223 - 14 */ /*Date+Time YYYYMMDDHHMMSS*/ 
	char	bankingDate[8];			/* 237 -  8 */ /* YYYYMMDD */
 	char	amtUnblocked[14];		/* 245 - 14 */
	char	service[2];				/* 259 - 2 */
	char	finnoneLoanMemo[5];		/* 261 - 5  */
	char	finnoneLoanNo[8];		/* 266 - 8 */
	char	finnoneLoanBrCode[4];	/* 274 - 4 */
	char	finnoneStartDate[8];	/* 278 - 8 */
	char	finnoneMaturityDate[8];	/* 286 - 8 */
	char	finnoneIntRate[9];		/* 294 - 9 */
	char	finnoneSettlementAccNo[14];/* 303 -14 */
	char	finnoneLoanStatus;		/* 317 - 1 */
	char	migrationPurpose;  		/* 318 - 1  */ /*1-General Migration; 2-Securitization;3-Write off*/
	char	finnoneUserId[8];		/* 319 - 8 */
	char	finnoneLoanNewMemo[5];	/* 327 - 5 */
	char	valueDate[8];			/* 332 - 8 */
	char	noOfIntTransHere[2];	/* 340 - 2 */
	char	orgTransCategory;		/* 342 - 1 */ /* will have original transaction category after reversal */
	char	requestBranchCode[4];	/* 343 - 4 */
 	char	filler[200];			/* 347 - 200 */ /* record length to be 384*/
};


struct bkd0data 
{
	char	liveChar;		  	/* 0   -  1 */
	char	filler[20]; 		/* 1   - 20 */
	char	accNo[13];			/* 21  - 13 */
	char	filler2[7];			/* 34  -  7 */
	char	refNo[10];			/* 41  - 10 */
	char	recType;			/* 51  -  1 */
	char	filler3[2];			/* 52  -  2 */
	char	blockedAmt[14];		/* 54  - 14 */
	char	postDate[6];		/* 68  -  6 */
	char	valueDate[6];		/* 74  -  6 */
	char	narrative1[25];		/* 80  - 25 */
	char	narrative2[25];		/*105  - 25 */
	char	narrative3[25];		/*130  - 25 */
	char	userId[3];			/*155  - 3*/
	char	filler1[200];		/*158  -  */ /* record length of 256*/
};

struct shd0data {
	char	liveChar;			/*0  - 1 */
	char	branchCode[4];		/*1  - 4 */
	char	ledgerCode[3];		/*5  - 3 */
	char	finLoanNo[8];		/*8  - 8 */
	char	repaymentDate[6];	/*16 - 6 */
	char	loanStatus;			/*22 - 1 *//*0-Outstanding;1-Processed on Maturity
											 2-Deleted & not reconciled
											 3-Refinanced; 4-Early setteled;5-Modified
											 6-Written-off; 7-Topped-up; 8-Resheduled*/
	char	currency[2];		/*23 - 2 */
	char	statusDate[6];		/*25 - 6 */
	char	loanStartDate[6];	/*31 - 6 */
	char	maturityDate[6];	/*37 - 6 */
	char	processDate[6];		/*43 - 6 */
	char	repaymentAmt[14];	/*49 - 14*/
	char	fundingRate[8];		/*63 - 8 */
	char	fundingIntAmt[14];	/*71 - 14*/
	char	reconStatus;		/*85 - 1 */ /* 0-Outstanding; 2-Deleted & not reconciled */
	char	filler[26];			/*86 - 26 */
	char	blockedAmt[8];		/*112- 8 */ /* ANB Defined field */
	char	emi[8];             /*120- 8 */
	char	filler1[100];		/*128- 100*/
};

struct frd0data
{
	char	liveChar;			/* 0  -  1 */
	char	msgSeqNo[7];		/* 1  -  7 */
	char	transMsgType[2];	/* 8  -  2 */ /* 06- Accrued interest 
												 07- interest application
												 08- performing/non-performing financial 
												 09- loan maturity
												 10- settlement
												 12- write-off
												 13- financial reconciliation
												 14- loan reconciliation
											  */
	char	transSubType[2];	/* 10 -  2 */ /*01-Financial;02-Static*/  
	char	errSeqNo[3];		/* 12 -  3 */
	char	finnoneLoanNo[8];	/* 15 -  8 */
	char	errorCode[4];		/* 23 -  4 */
	char	engErrorDesc[60];	/* 27 - 60 */
	char	arbErrorDesc[60];	/* 87 - 60 */
	char	option1[20];		/* 147- 20 */
	char	processStatus;		/* 167-  1 */ /* 0 - Transaction processed successfully by the batch process
												 1 - Online transaction updated a record for this
													 message sequence number in the batch response
													 file prior to batch processing.
												 2 - Transaction failed during batch process due to errors 
												 3 - Partially settled
											  */
	char	reconStatus;		/* 168-  1 *//* I-Inserted;A-Amended;D-Deleted Un-reconciled */


	char	amountSign;			/* 169-  1 *//* +-positive ; -=negative */
	char	amount[14];			/* 170- 14 *//* Settlement Amount in case of settlement process 10
								   				Difference amount in case of Financial reconciliation 13 */
	char 	narrative3[25];		/* 184- 25 */

	/* The following 3 fields(of 40 bytes) are redefined field from position 169-209 
	char	maturityDate[8];	
	char	maturityAmt[14];	
	char	filler[18];		
	*/
	char	hashTotal[4];		/* 209-  4 */
};

struct fundRateCategory
{
   char   noDays[4];                       /*00000 00004 */
   char   drFundRt[8];                     /*00004 00008 */
   char   crFundRt[8];                     /*00012 00008 */
};

struct fud0data
{
   char   liveChar;                         /*00000 00001 */
   char   currency[2];                      /*00001 00002 */
   char   valueDate[6];                     /*00003 00006 */
   char   drFundRtIA[8];                    /*00009 00008 */
   char   crFundRtIA[8];                    /*00017 00008 */
   char   drFundRtFA[8];                    /*00025 00008 */
   char   crFundRtFA[8];                    /*00033 00008 */
   struct fundRateCategory fundRateCatg[12];/*00041 00220 */
   char   filler[743];                      /*00281 00743 */
};

struct ccarrblk
{
	char	liveChar; 					/* 0   -   1 */
	char	cardNo[16];					/* 1   -  16 */
	char	bmAccNo[14];				/* 17  -  14 */
	char	nameOnTheCard[26];			/* 31  -  26 */
	char	paymentAmtDue[14];			/* 57  -  14 */
	char	paymentMade[14];			/* 71  -  14 */
	char	otherChannelPayment[14];	/* 85  -  14 */
	char	blockedAmt[14];				/* 99  -  14 */
	char	cardInternalStatus;			/* 113 -   1 */ 
	char	cardExternalStatus;			/* 114 -   1 */ 
	char	orgPaymentDueDate[8];		/* 115 -   8 */
	char	lastBlockedDateTime[14];	/* 123 -  14 */
	char	orgBlockedAmt[14];			/* 137 -  14 */
	char	orgTransDate[8];			/* 151 -   8 */
	char	autoManualFlag;				/* 159 -   1 */ /* A-Auto blocking ; M-Manual blocking */
	char	lastBlockedUserId[10];		/* 160 -  10 */
	char	requestBranch[4];			/* 170 -   4 */
	char	filler[150];				/* 174 -    Record size 256 */
};

struct ccpayhist
{
    char liveChar   ;     				/*0     - 1*/
	char dateTime   [14];   			/*1     - 14*/
	char uniqNo		[8];    			/*15    - 8*/
	char accNo		[13];   			/*23    - 13*/
	char cardNo		[16];   			/*36    - 16*/
	char bmRef		[10];  				/*52    - 10*/
	char transAmt	[14];  				/*62    - 14*/
	char valueDate	[6];    			/*76    - 6*/
	char postDate	[6];    			/*82    - 6*/
	char bmDate	    [6];    			/*88    - 6*/
	char revFlag	;       			/*94    - 1*/
	char status 	;       			/*95    - 1*/
	char suspCnt	[2];    			/*96    - 2*/
	char errCode	[4];    			/*98 	- 4*/
	char filler		[26];   			/*102 	- 26*/
} ;

struct dpmsgs
{
	char	liveChar; 						/* 0   -   1 */
	char	dpResponseCode[2];				/* 1   -   2 */
	char	dpDetailRespCode[4];			/* 3   -   4 */
	char	dpErrorDescription[30];			/* 7   -  30 */
	char	fundTransRespCode[2];			/* 37  -   2 */  
	char	tpgErrorCodes[20];				/* 39  -  20 */
	char	filler[100];					/* 59  -    Record size 128 */
};

struct letter
{
	char	liveChar;						/* 0 - 1 */
	char	dateGenerated[8];				/* 1 - 8 */
	char	letterType[4];					/* 9 - 4 */ /* STMT - Statement 
													       CARD - ATM Card 
											   		   	   WELC - Welcome
											       		   SAMA - SAMA 
												   		   PENS - Pensioner's notification letter
														   TDAV - Time Deposit Advice letter */
	char	seqNo[7];						/* 13 - 7 */ /* sequence number */
	char	branchCode[4];					/* 20 - 4 */
	char	address1[30];					/* 24 - 30 */
	char	poBox[10];						/* 54 - 10 */
	char	cityName[20];					/* 64 - 20 */
	char	zipCode[10];					/* 84 - 10 */
	char	returnedDate[8];				/* 94 - 8 */
	char	registeredUser[10];				/* 102 - 10 */
	char	registeredBranch[4];			/* 112 - 4 */
	char	addressType;					/* 116 - 1 */ /* 0-P.O.Box ; 1-GPS */
	char	filler[13];						/* 117 - 13 */
	char	custNo[7];						/* 130 - 7  */
	char	productId[20];					/* 137 - 20 */
	char	filler1[120];					/* 157 - 99 */ /* RECORD SIZE 256 */
};

struct letseq
{
	char 	liveChar;				/* 0 - 1 */
	char	letterType[4];			/* 1 - 4 */
	char	lastSeqNo[7];			/* 5 - 7 */
	char	dateLetterSend[8];		/* 12 - 8 */
	char	filler[150];			/* 20 - 108*/
};

struct rateCategory
{
	char upperLmt[18];
	char intRate[9];
};

struct  mrd0data
{
	char liveChar;
	char isoCurCode[3];
	char tenor[3];
	char BMCurcode[2];
	char noOfBands[2];
	char maxRate[9];
	struct rateCategory rateCatg[4];
	char maturityDt[6];
	char filler1[2];
	char maturityPrd[3];
	char periodInd;
	char desc[20];
	char filler2[100];
};

struct serviceFeeCtl
{
	char  liveChar;					/*0 - 1 */
	char  serviceNo[2];				/*1 - 2 */
	char  branchOrDelivery;			/*3 - 1 */   /*0 - Branch; 1- Delivery Channel */
	char  serviceDesc[30];			/*4 - 30*/
	char  serviceDescArabic[28];	/*34- 28*/
	char  gwContraAccNo[16];		/*62- 16*/
	char  gwNarrative1[4];     		/*78- 4 */   /*narrtive code*/
	char  gwNarrative2[30];    		/*82- 30*/   /*charged accNo + refNo*/
	char  gwNarrative3[30];			/*112-30*/
	char  gwTranType[2];  			/*142-2 */
	char  creditType;          		/*144-1*/    /* 0-split; 1-Cumulative*/
	char  normalFeeAmt[14]; 		/*145-14*/                                         
	char  pkgFlag1Amt[14];     		/*159-14*/   /*0 or space means not chargable*/
	char  pkgFlag2Amt[14];			/*173-14*/   /*0 or space means not chargable*/
	char  pkgFlag3Amt[14];			/*187-14*/   /*0 or space means not chargable*/
	char  pkgFlag4Amt[14];     		/*201-14*/   /*0 or space means not chargable*/
	char  pkgFlag5Amt[14];     		/*215-14*/   /*0 or space means not chargable*/
	char  pkgFlag6Amt[14];     		/*229-14*/   /*0 or space means not chargable*/
	char  pkgFlag7Amt[14];     		/*243-14*/   /*0 or space means not chargable*/
	char  pkgFlag8Amt[14];     		/*257-14*/   /*0 or space means not chargable*/
	char  pkgFlag9Amt[14];     		/*271-14*/ 	 /*0 or space means not chargable*/
	char  govtPayrollAmt[14];  		/*285-14*/   /*0 or space means not chargable*/
	char  pvtPayrollAmt[14];   		/*299-14*/   /*0 or space means not chargable*/
	char  splPayrollAmt[14];   		/*313-14*/   /*0 or space means not chargable*/
	char  anbStaffAmt[14];     		/*327-14*/   /*0 or space means not chargable*/
	char  pensionerAmt[14];			/*341-14*/
	char  invAmtSelFlag;      		/*355-1*/  	 /* 1 - Yes; 0 - No */
	char  frInvAmtSel[14];     		/*356-14*/   /*Criteria amt involved in transaction*/
	char  toInvAmtSel[14];     		/*370-14*/   /*Criteria amt involved in transaction*/
	char  selTranType[10];     		/*384-10*/   /*2 char for each; max 5 types; appl. mrg */
	char  avgBalSelFlag;        	/*394-1 */   /* 1 - Yes; 0 - No */
	char  avgBalSelAmt[14];			/*395-14*/   /*if avgBal is '1', then look this value*/
	char  selContraLedger[3];   	/*409-3*/
	char  selSarTransOnly;			/*412-1*/	 /* 0-For all currency; 1 for SAR transactions only */
	char  selChargeOnlyIndividual;	/*413-1*/	 /* 0-For all; 1 - Individual customer only (juristic customer not charged)*/
	char  selExcludeCorporate;    	/*414-1*/    /* 1 - Yes; 0 - No */
	char  selExcludeCommercial;   	/*415-1*/    /* 1 - Yes; 0 - No */
	char  sourceFile;			  	/*416-1*/	 /* 0-NO; 1-YES */
	char  chargebleMemo[15];	  	/*417-15*/
	char  selDrTransOnly;	  	  	/*432-1*/    /* 0-No; 1- YES */
	char  selExceptionCode[2];		/*433-2*/ 	 /* used for mrg file txns to look at dormant account activation */
	char  selProductAge[4];			/*435-4*/	 /* charge an account/card after these many days */
	char  sariePayrollAmt[14]; 		/*439-14*/   /*0 or space means not chargable*/
	char  filler[57];				/*453-57*/
	char  reportOnly;  				/*510-1 */	 /* This service transactions will be reported for manual handling 1-ReportOnly*/
	char  runFrequency;  			/*511-1 */	 /* D-Daily; M-Monthly */
    char  pkgFlagAAmt[14];          /*512-14*/   /*0 or space means not chargable*/
    char  pkgFlagBAmt[14];          /*526-14*/   /*0 or space means not chargable*/
    char  pkgFlagCAmt[14];          /*540-14*/   /*0 or space means not chargable*/
    char  pkgFlagDAmt[14];          /*554-14*/   /*0 or space means not chargable*/
    char  pkgFlagEAmt[14];          /*568-14*/   /*0 or space means not chargable*/
    char  pkgFlagFAmt[14];          /*582-14*/   /*0 or space means not chargable*/
    char  pkgFlagGAmt[14];          /*596-14*/   /*0 or space means not chargable*/
    char  pkgFlagHAmt[14];          /*610-14*/   /*0 or space means not chargable*/
    char  pkgFlagIAmt[14];          /*624-14*/   /*0 or space means not chargable*/
    char  pkgFlagJAmt[14];          /*638-14*/   /*0 or space means not chargable*/
    char  pkgFlagKAmt[14];          /*652-14*/   /*0 or space means not chargable*/
    char  pkgFlagLAmt[14];          /*666-14*/   /*0 or space means not chargable*/
    char  pkgFlagMAmt[14];          /*680-14*/   /*0 or space means not chargable*/
    char  pkgFlagNAmt[14];          /*694-14*/   /*0 or space means not chargable*/
    char  pkgFlagOAmt[14];          /*708-14*/   /*0 or space means not chargable*/
    char  pkgFlagPAmt[14];          /*722-14*/   /*0 or space means not chargable*/
    char  pkgFlagQAmt[14];          /*736-14*/   /*0 or space means not chargable*/
    char  pkgFlagRAmt[14];          /*750-14*/   /*0 or space means not chargable*/
    char  pkgFlagSAmt[14];          /*764-14*/   /*0 or space means not chargable*/
    char  pkgFlagTAmt[14];          /*778-14*/   /*0 or space means not chargable*/
    char  pkgFlagUAmt[14];          /*792-14*/   /*0 or space means not chargable*/
    char  pkgFlagVAmt[14];          /*806-14*/   /*0 or space means not chargable*/
    char  pkgFlagWAmt[14];          /*820-14*/   /*0 or space means not chargable*/
    char  pkgFlagXAmt[14];          /*834-14*/   /*0 or space means not chargable*/
    char  pkgFlagYAmt[14];          /*848-14*/   /*0 or space means not chargable*/
    char  pkgFlagZAmt[14];          /*862-14*/   /*0 or space means not chargable*/
	char  filler1[200];
};

struct serviceFeeLog
{
	char  liveChar;					/* 0 - 1 */
	char  bankingDate[8];			/* 1 - 8 */
	char  serviceBranchCode[4];		/* 9 - 4 */
	char  serviceNo[2];				/*13 - 2 */
	char  branchOrDelivery;			/*15 - 1 */
	char  custBranchCode[4];		/*16 - 4 */
	char  accNo[14];				/*20 - 14*/
	char  normalFeeAmt[10];			/*34 - 10*/
	char  chargebleAmt[10];			/*44 - 10*/
	char  chargedAmt[10];			/*54 - 10*/
	char  chargedCategory[2];		/*64 - 2 */
	char  chargedType;				/*66 - 1 */		/*0-Excluded; 1-Fully charged; 2- Partially charged; 3-NoFund; 4-Manual*/
	char  remarks[50];				/*67 - 50*/
	char  contraAccNo[14];			/*117- 14*/
	char  transAmt[14];				/*131- 14*/
	char  orgRefNo[10];				/*145- 10*/
	char  thisRunDate[8];			/*155- 8*/
	char  filler[150];				/*163- 150*/
};

struct contractInfo
{
	char  liveChar;					/* 0 - 1 */
	char  idNo[10];					/* 1 - 10*/
	char  contractRegion[2];		/* 11- 2 */
	char  contractCity[4];			/* 13- 4 */
	char  contractNo[9];			/* 17- 9 */
	char  contractDate[8];			/* 26- 8 */
	char  accNo[15];				/* 34- 15*/
	char  borrowerNameArb[50];		/* 49- 50*/
	char  borrowerNameEng[50];		/* 99- 50*/
	char  filler[107];				/*149- 107*/
	char  filler1[50];				/*256-    */
};

struct omnitrnhist
{
    char liveChar;     				/*0     - 1*/
	char dateTime[14];   			/*1     - 14*/
	char uniqNo[8];    				/*15    - 8*/
	char accNo[20];   				/*23    - 20*/		/* Omnibus account number */
	char tdlAccNo[20];   			/*43    - 20*/		/* TradeNet account number */
	char bmRef[20];  				/*63    - 20*/
	char transAmt[15];  			/*83    - 15*/
	char valueDate[8];    			/*98    - 8*/
	char postDate[8];    			/*106   - 8*/
	char bmDate[8];    				/*114   - 8*/
	char transType;       			/*122   - 1*/		/* 1 - Debit;	2 - Credit */
	char status;       				/*123   - 1*/		/* 1 - Success  2 - Assumed Success */
	char narrative1[25];  			/*124   - 25*/
	char narrative2[25];  			/*149   - 25*/
	char narrative3[25];  			/*174   - 25*/
	char narrative4[25];  			/*199   - 25*/
	char narrative5[25];  			/*224   - 25*/
	char narrative6[25];  			/*249   - 25*/
	char forceFlag;    				/*274   - 1*/		/* Always 'Y' */
	char errCode[2];    			/*275 	- 2*/
	char errMsg[200];				/*277	- 200*/
	char userId[3];					/*477	- 3*/
	char filler[100];   			/*480 	- 100*/
};

struct tranarcmas
{
	char liveChar;                         /*00000 00001 */
	char acctBranch[4];                    /*00001 00004 */
	char stmtDate[8];                      /*00005 00008 */
	char accNo[20];                        /*00013 00020 */
	char stmtNo[4];                        /*00033 00004 */
	char custBranch[4];                    /*00037 00004 */
	char custBranchName[30];               /*00041 00030 */
	char custName[60];                     /*00071 00060 */
	char addr1[30];                        /*00131 00030 */
	char addr2[30];                        /*00161 00030 */
	char addr3[30];                        /*00191 00030 */
	char printFlag;                        /*00221 00001 */  /*1-printed; 0-not printed*/
	char printDate[8];                     /*00222 00008 */
	char segmentPrintDate[8];              /*00230 00008 */
	char letRefNo[30];                     /*00238 00030 */
	char delvMode;                         /*00268 00001 */ /*0-send by mail; 1-email; 3-both*/
	char emailId[30];                      /*00269 00030 */
	char dateOfBirth[8];                   /*00299 00008 */
	char openingBal[15];                   /*00307 00015 */
	char lastStmtDate[8];                  /*00322 00008 */
	char drCount[5];                       /*00330 00005 */
	char drTot[15];                        /*00335 00015 */
	char crCount[5];                       /*00350 00005 */
	char crTot[15];                        /*00355 00015 */
	char closingBal[15];                   /*00370 00015 */
	char filler[200];                      /*00385 00200 */
};

struct tranarcdet
{
	char liveChar;                         /*00000 00001 */
	char accNo[20];                        /*00001 00020 */
	char stmtDate[8];                      /*00021 00008 */
	char stmtNo[4];                        /*00029 00004 */
	char tranSeqNo[5];                     /*00033 00005 */
	char userId[4];                        /*00038 00004 */
	char postingDate[8];                   /*00042 00008 */
	char valueDate[8];                     /*00050 00008 */
	char transAmt[15];                     /*00058 00015 */
	char balance[15];                      /*00073 00015 */
	char bmRefNo[10];                      /*00088 00010 */
	char narr1[25];                        /*00098 00025 */
	char narr2[25];                        /*00123 00025 */
	char narr3[25];                        /*00148 00025 */
	char tranType[2];                      /*00173 00002 */
	char filler[100];                      /*00175 00100 */
};

struct bmrecoverycontrolheader
{
	char liveChar;					/* 0 - 1 */	
	char recType[2];				/* 1 - 2 */	/* CT */
	char filler[30];	            /* 3 - 30*/
	char bankingDate[8];			/* 33- 8 */
	char lastProcessFile[30];    	/* 41-30 */
	char scanStatus;				/* 71- 1 */ /* 0-Not complete; 1 - Completed */
	char filler1[250];				/* 72 -  */
};

struct bmrecoverycontroldetail
{
	char liveChar;					/* 0 - 1 */
	char recType[2];				/* 1 - 2 */	/* DT for detail record */
	char fileName[30];				/* 3 - 30*/
	char lastProcessedRecNo[8];		/* 33- 8 */
	char filler[250];				/* 41 -  */
};

struct bmrecoverygwfiles
{
	char liveChar;					/* 0 - 1 */	
	char recType[2];				/* 1 - 2 */	/* GW */
	char gwNo[2];					/* 3 - 2 */
	char filler[28];				/* 5 - 28*/
	char gwProcessStatus;			/* 33 - 1 */ /* 0-Not processed; 1 - Processed */
	char ignorePostingCheck;		/* 34 - 1 */ /* 1-YES; 0-NO */
	char filler1[250];				/* 34 -  */
};


struct unclcbs
{
	char	liveChar;					/* 0 - 1  */
	char 	accNo[14];					/* 1 - 14 */
	char	freezeCode;					/* 15 - 1 */
	char	accDormantFlag;				/* 16 - 1 */
	char	bmInactiveFlag;				/* 17 - 1 */
	char	accOpenDate[8];				/* 18 - 8 */
	char	accStatusDate[8];			/* 26 - 8 */
	char	particulars2[14];			/* 34 - 14 */
	char	currCode[3];				/* 48 - 3 */
	char	solId[4];					/* 51 - 4 */
	char	partTranTrType;				/* 55 - 1 */
	char	transAmt[17];				/* 56 - 17*/
	char	lastTransDate[8];			/* 73 - 8 */
	char	accOpenDate1[8];			/* 81 - 8 */
	char	lastTransDate1[8];			/* 89 - 8 */
	char	accOpenDate2[8];			/* 97 - 8 */
	char	lastTransDate2[8];			/* 105 - 8 */
	char	openDateChanged;			/* 113 - 1 */ /* 0 - Same ; 1 - Different */
	char	transDateChanged;			/* 114 - 1 */ /* 0 - Same ; 1 - Different */
	char	fundMovementDate[8];		/* 115 - 8 */
	char	filler[200];
};

/*ACCOUNT_NUMBER,FREEZE_CODE,ACCOUNT_DORMANT_FLAG,BM_INACTIVE_ACCOUNT_FLAG,ACCOUNT_OPEN_DATE,ACCOUNT_STATUS_DATE,PARTICULAR_2,CURRENCY_CODE,SOL_ID,PART_TRAN_TRYPE,TRANSACTION_AMOUNT,LAST_TRANSACTION_DATE*/

/* some standard prototype */

char *getpath(), 
*getDateTime(),
*bmDateToActul(), 
	 *actualToBmDate(), 
	 *bmCustToActual(), 
	 *actulToBmCust(), 
	 *bmAccToActual(), 
	 *actualToBmAcc(),
	 *dblToBmAmt();
double	bmAmtToDbl();
char *formatAmt();

struct ttdbmigr{
char liveChar;
char bankingDate[8];
char fileName[28];
char threadId[4];
char mainPid[8];
char childPid[8];
char startDateTime[16];
char endDateTime[16];
char recordProcessed[16];
char recordFailed[16];
char recordDuplicate[16];
char totalRecTBD[16];
char status[16];
char filler[856];
};
struct Param{
    int numThread;
    int sendRetryCount;
    int failThreshould;
    int minRecForThread;
    int serverNo;
    int csvPathName;
};

