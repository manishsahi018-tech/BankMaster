/* 
Include file having the layout of all files required for static data Application
Author	:	A. Arulselvam
Date	:	10-June-2000
Ver	 Date		Author			Details of Modification
======================================================================
3.1	 Jul 2003		S. Rajesh		tpinHistory layout is added for the tpin select 

3.2	 12 Jul 2003	S. Rajesh		Modified for Sama Account Regulation project
3.3	 Aug 2004	    B.M. Ali 		ATM Annual fee charged year added to cardInfo
3.4	 18/06/2005		S. Rajesh		Add "stdOrdReqAllowed" flag added to branchInfo
3.5	 18/09/2005		S. Rajesh		Added the newlayout "sadadCtlInfo" for 
									handling SADAD error & payment status codes
									Added "remarks" field in "branchActivityOnSod" 
									layout for the display purpose in static data
3.6	 03/11/2005		S. Rajesh		Added "cardType" field in stcustlog layout
									to indicate whether "International card" or "smart card"
									Added "cvv2" field in cardInfo layout 
3.7	 07/01/2005		S. Rajesh		staccblk layout is added for manual account blocking

	 17/01/2005		Rajesh			Added new file stusrbrn to define branches allowed for the 
									private banking enquiry 
3.8	 17/02/2006		B.M. Ali 		Two fields i.e. feeChargedDate, prvCharged
									Date were added in cardInfo structure

3.9	 10/05/2006		S. Rajesh		Added new file stretmail for "returned mail" information

4.0  11/10/2006		S. Rajesh		Added new file "stcustpb" for keeping the history of customers 
									opened through Phone Banking Officer
4.1  28/11/2006		Mohit Mehrotra	Modified for Pension account opening 
					Arul            Added online customer number in systemConfig structure

4.2	 16/01/2007		S. Rajesh		Added the new file sttdlog for "Time Deposit" opening through CSD
				
					Mohit Mehrotra	Added fdValueDateTolerance field of 3  & tdRenewAllowed of 1 
									under bmLedger structure for "Time Deposit" opening through CSD

4.3	 17/03/2007		Arshad    	    Added the new filed in systemConfiguration for "userBlockingDays"

4.4	 02/05/2007		S. Rajesh		Added new structure for serverConfig for Server configuaration & 
									moved the userBlockingDays to serverConfig for the stusrblk program

									Added new structure for packageAccInfo for handling new alpha segment flag
	 21/05/2007		Mohit			1. Added 'accFreezingGracePeriod' field under 'customerInfo' structure 
									for customer level account freezing grace period.
									2. Added 'reportToCompliance' field under 'categoryConfig' structure to 
									generate a list of accounts belong to flaged category. 

	 23/06/2007		Rajesh			Added new structure heirsInfo for maintaining heirs information for saudi 
									individuals

4.5  11/07/2007		Rajesh			Added new structure stswiftlog for SWIFT centralization enhancement

4.6  17/09/2007		Rajesh			Added new structure stsadadlog for SADAD payment through CSD

*/
struct branchInfo
{
	char 	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*BD*/
	char	branchCode[4];			/* 3 - 4 */
	char	arabicName[30];			/* 7 - 30*/
	char	englishName[30];		/*37 - 30*/
	char	arabicAddress[30];		/*67 - 30*/
	char	englishAddress[30];		/*97 - 30*/
	char	cityCode[4];			/*127- 4 */
	char	poBox[10];				/*131- 10*/
	char	zipCode[10];			/*141- 10*/
	char	welcomeLetterRegionCode;/*151- 1 */
	char	lastRefreshDateTime[14];/*152- 14*/
	char	telAreaCode[2];			/*166-2*/
	char	telNo[7];		    	/*168-7*/
	char	telExt[4];				/*175-4*/
	char	realOrPseudoBranch;		/*179- 1*/  /* 1- realBranch; 0- PseudoBranch; 2-Pseudo branch facing customer*/
	char	mainBranchCode[4];		/*180-4*/
	char	cardPrdnAtBranch;		/*184-1*/ /* 0-NO  ; 1-YES */
	char	pinSelectAtBranch;		/*185-1*/ /* 0-NO  ; 1-YES */
	char	pinPrintFromBranch;		/*186-1*/ /* 0-NO  ; 1-YES */
	char	cardRequestFromBranch;	/*187-1*/ /* 0-NO  ; 1-YES */
	char	updateRestricted;		/*188-1*/ /* 0-NO  ; 1-YES */ 
	char	mainBrEditAllowed;		/*189-1*/ /* 0-NO  ; 1-YES */ 
	char	tpinSelectAtBranch;		/*190-1*/ /* 0-NO  ; 1-YES */ 
	char	dormantActivationFlag;	/*191-1*/ /* 0-NO  ; 1-YES */ 
	char	tpinMandatoryAtBranch;	/*192-1*/ /* 0-NO  ; 1-YES */ 
	char	nameSearchAllowed;		/*193-1*/ /* 0-NO  ; 1-YES */ 
	char	stdOrdReqAllowed;		/*194-1*/ /* 0-NO  ; 1-YES */ 
	char	custNameUpdAllowed;		/*195-1*/ /* 0-NO  ; 1-YES */ 
	char	addrUnificationFlag;	/*196-1*/ /* 0-NO  ; 1-YES */
	char	balEnqRestrictedFlag;	/*197-1*/ /* 0-NO  ; 1-YES */
	char	displayWarningFlag;     /*198-1*/ /* 0-NO  ; 1-YES */
	char	enableChipCard;     	/*199-1*/ /* 0-NO  ; 1-YES */
	char	newPensCardFlag;     	/*200-1*/ /* 0-NO  ; 1-YES */
	char	mailCentreBranch;    	/*201-1*/ /* 0-NO  ; 1-YES */ 
	char	mandateBranch;    		/*202-1*/ /* 0-NO  ; 1-YES */  
	char	callCentreBranch;   	/*203-1*/ /* 0-NO  ; 1-YES */ 
	char	internalCustOpenAllowed;/*204-1*/ /* 0-NO  ; 1-YES */
	char	regionCode;			  	/*205-1*/ /* 1-Central; 2-Western; 3-Eastern */
	char	branchCategory;		 	/*206-1*/ /* 0-Retail; 1-Commercial; 2-Corporate */
	char	islamiBranch;			/*207-1*/ /* 0-No; 1-Yes */
	char	enableLocalChipCard;	/*208-1*/ /* 0-No; 1-Yes */
	char	generalCustOpenAllowed;	/*209-1*/ /* 0-NO; 1-YES */
	char	pensionCustOpenAllowed;	/*210-1*/ /* 0-NO; 1-YES */  /* Ver 4.1 */
	char	feeExclusionUpdAllowed; /*211-1*/ /* 0-NO; 1-YES */
	char	generalSamaUpdAllowed;	/*212-1*/ /* 1-YES ;0-NO */
	char	swiftCentreBranchFlag;	/*213-1*/ /* 1-YES ;0-NO */
	char	swiftTransferCentralized;/*214-1*//* 1-YES ;0-NO */
	char	payrollBranch;			 /*215-1*//* 1-YES ;0-NO */
	char	accFreezingPeriod[3];	 /*216-3*/ /* A/c to be freezed after XXX days if not updated from quick screen */
	char	accOpenCardPrintAllowed; /*219-1 /* 1-YES ;0-NO */ 
	char	filler[2];				/*220-2*/	
	char	lastUpdateUser[10];		/*222-10*/
	char	filler1[10];			/*232-10*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct packageAccInfo
{
	char	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*PK*/
	char	packageAccCode[2];		/* 3 - 2 */
	char	filler[2];				/* 5 - 2 */
	char	arabicName[30];			/* 7 - 30*/
	char	englishName[30];		/*37 - 30*/
	char	arbShortName[15];		/*67 - 15*/		/* For the use of service fee report heading */
	char	engShortName[15];		/*82 - 15*/		/* For the use of service fee report heading */
	char	splChqBkReqd;			/*97 - 1 */ /* 0-NO;1-YES */
	char	splAtmReqd;				/*98 - 1 */ /* 0-NO;1-YES */
	char	pinMailerHeading[20];	/*99 - 20*/
	char	statementFrequency;     /*119- 1*/  /* Q - Quater, H - half year*/
	char	filler1[102];			/*120 -102*/
	char	lastUpdateUser[10];		/*222- 10*/
	char	filler2[10];			/*232- 10*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct cityInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*CT*/
	char	cityCode[4];		/* 3 - 4 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	telAreaCode[4];		/*67 - 4 */
	char	idIssued;			/*71 - 1 */
	char	crIssued;			/*72 - 1 */
	char	filler[149];		/*73 -149*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct countryInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*NA*/
	char	countryCode[3];		/* 3 - 3 */
	char	filler;				/* 6 - 1 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	isoCode[3];			/*67 - 3 */
	char	gccCountry;			/*70 - 1 */ /* 0-No ; 1-Yes */
	char	filler1[154];		/*68 -154*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct mailTypeInfo
{
	char	liveChar;					/* 0 - 1 */
	char	recType[2];					/* 1 - 2 */ /* record type: LT */ 
	char	mailType;					/* 3 - 1 */
	char	filler[3];					/* 4 - 3 */
	char	arabicName[30];				/* 7 - 30*/
	char	englishName[30];			/*37 - 30*/
	char	letterType[4];				/*67 - 4 */
	char	whereToLookForDetails;		/*71 - 1 */ /* L-Local; O-Outside */
	char	despatchedToBranches;		/*72 - 1 */ /* 0-No:not despatched to branches; 1-Yes;Despatched to branches */
	char	filler1[149];				/*73 -149*/
	char	lastUpdateUser[20];			/*222- 20*/
	char	lastUpdateDateTime[14]; 	/*242- 14*/
};

struct billerIdInfo
{
	char	liveChar;					/* 0 - 1 */
	char	recType[2];					/* 1 - 2 */  /* BI */
	char	billerId[4];				/* 3 - 4 */
	char	arabicName[30];				/* 7 - 30*/
	char	englishName[30];			/*37 - 30*/
	char	transType[2];				/*67 - 2*/
	char	contraAccNo[14];			/*69 - 14*/
	char	checkDigitValidationOption;	/*83 - 1*/
	char	prepaymentAllowed;			/*84 - 1 */ /* 0-NO;1-YES */
	char	prepaymentTypesAllowed[20];	/*85 - 20 */ /* 5 Types with 4 characters each */
	char	postpaymentTypesAllowed[20];/*105 - 20 */ /* 5 Types with 4 characters each */
	char	arabicNarrative1[25];		/*125 - 25*/
	char	englishNarrative1[25];		/*150 - 25*/
	char	cashAccNo[14];				/*175 - 14*/
	char	serviceType[4];				/*189 - 4 */
	char	disableBillerIdFlag;		/*193 - 1 */ /* 0-NO;1-YES */
	/*char	reversalAllowedFlag;		/*193 - 1 */ /* 0-NO;1-YES **/
	char	filler1[28];				/*194 - 28*/
	char	lastUpdateUser[10];			/*222- 10*/
	char	filler2[10];				/*232- 10*/
	char	lastUpdateDateTime[14]; 	/*242- 14*/
};

struct ctlInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ 
	char	ctlCode[4];			/* 3 - 4 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct currencyInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*XC*/
	char	currCode[2];		/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	isoCurrCode[3];		/*67 - 3 */ /* secondary key */
	char	decimalPlace;		/*70 - 1 */
	char	arabicShortCode[6];	/*71 - 6 */
	char	fxTolerance;		/*77 - 1 */
	char	filler1[144];		/*78 -144*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct titleInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*TT*/
	char	titleCode[2];		/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct businessType
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*BS*/
	char	typeCode[3];		/* 3 - 3 */
	char	filler2;			/* 6 - 1 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct education
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*ED*/
	char	educationCode[2];	/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct profession
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*PR*/
	char	professionCode[2];	/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct position
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*PO*/
	char	positionCode[2];	/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct monthlyIncome
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*MI*/
	char	incomeCode[2];		/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct accountStatus
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*AS*/
	char	statusCode[2];		/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct statementFrequency
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*SF*/
	char	frequencyCode[2];	/* 3 - 2 */
	char	filler[2];			/* 5 - 2 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67 -155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct customerRangeInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*RN*/
	char	rangeNo[4];			/* 3 - 4 */
	char	startingNo[7];		/* 7 - 7 */
	char	endingNo[7];		/*14 - 7 */
	char	currentNo[7];		/*21 - 7 */
	char	filler1[194];		/*28 -194*/
	char	lastUpdateUser[20];	/*222- 20 */
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct bmLedgers
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*MM*/
	char	ledgerCode[3];		/* 3 - 3 */
	char	filler;				/* 6 - 1 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	accCreationAllowed;	/*67 - 1*/ /*0-No ; 1-Yes*/
	char	samaBlockingAcc;	/*68 - 1*/ /*0-No ; 1-Yes*/
	char	obligationMemo;		/*69 - 1*/ /*0-No ; 1-Yes*/
	char	timeDepositMemo;	/*70 - 1*/ /*0-No ; 1-Yes*/
	char	fdIntRateTolerance;	/*71 - 1*/
	char	tdDebitMemo;		/*72 - 1*/ /*0-No ; 1-Yes*/
	char	minDepositAmt[10];	/*73 - 10*/		/* Ver 4.2 */
	char	maxDepositPeriod;	/*83 - 1*/		/* Ver 4.2 */
	char	atmCardToBeIssued;	/*84 - 1*/		/* Ver 4.2 */
	char	fdValueDateTolerance[3];/*85 - 3*/	/* Ver 4.2 */
	char	tdRenewAllowed;		/*88 - 1*/     /* Ver 4.2 */
	char	ignoreMemoForBrUpd;	/*89 - 1*/ /* 0-NO ; 1-YES */
	char	filler1[132];		/*89 -132*/		
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct cvrBankInfo
{
	char 	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*CB*/
	char	bankCode[4];		/* 3 - 4 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	arabicAddress[30];	/*67 - 30*/
	char	englishAddress[30];	/*97 - 30*/
	char	cvrBankCode[14];	/*127- 14*/
	char	bankAccNo[20];		/*141- 20 */
	char	filler[61];			/*161-61*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct documentInfo
{
	char 	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*DT*/
	char	docNo[3];			/* 3 - 3 */
	char	filler;				/* 6 - 1 */
	char	arabicName[30];		/* 7 - 30*/
	char	englishName[30];	/*37 - 30*/
	char	filler1[155];		/*67-  155*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct documentCategoryMatrix
{
	char 	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ /*DC*/
	char	samaMainCategory[2];/* 3 - 2 */
	char	samaSubCategory[2];	/* 5 - 2 */
	char	filler[60];			/* 7 - 60*/
	char	documentNo[60];		/*67 - 60*/  /* 20 documents of 3 byte code */
	char	filler1[95];		/*127- 95*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct signDisableReasonInfo
{
	char 	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*SD*/
	char	signDisableReason[2];	/* 3 - 2 */
	char	filler[2];				/* 5 - 2 */
	char	arabicName[30];			/* 7 - 30*/
	char	englishName[30];		/*37 - 30*/
	char	filler1[155];			/*67-  155*/
	char	lastUpdateUser[20];		/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct samaMainCategoryInfo
{
	char 	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*SM*/
	char	samaMainCategoryCode[2];/* 3 - 2 */
	char	filler[2];				/* 5 - 2 */
	char	arabicName[30];			/* 7 - 30*/
	char	englishName[30];		/*37 - 30*/
	char	filler1[155];			/*67-  155*/
	char	lastUpdateUser[20];		/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct samaSubCategoryInfo
{
	char 	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*SS*/
	char	samaSubCategoryCode[2];	/* 3 - 2 */
	char	filler[2];				/* 5 - 2 */
	char	arabicName[30];			/* 7 - 30*/
	char	englishName[30];		/*37 - 30*/
	char	samaReferenceNo[10];	/*67 - 10*/
	char	filler1[145];			/*77-  145*/
	char	lastUpdateUser[20];		/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct categoryConfig
{
	char 	liveChar;				/* 0 - 1 */
	char	recType[2];				/* 1 - 2 */ /*CC*/
	char	samaMainCategory[2];    /* 3 - 2 */
	char	samaSubCategory[2];	    /* 5 - 2 */
	char	arabicShortDesc[30];	/* 7 - 30*/
	char	englishShortDesc[30];	/*37 - 30*/
	char	firstLetterDue[3];		/*67 - 3*/
	char	secondLetterDue[3];		/*70 - 3*/
	char	thirdLetterDue[3];		/*73 - 3*/
	char	crLicenseMandatory;		/*76 - 1*/ /*0-No ; 1-Yes(d)*/
	char	accStatusValueForFreeze;/*77 - 1*/ /*4-Freezed(d); 5-dual control*/
	char	accFreezingGracePeriod[3];/*78 - 3*/
	char	fundMovementPeriod[3];	  /*81 - 3*/
	char	fundMovementPeriodValidFlag; /* 84 - 1*/ /* 0-Valid(d) ; 1-Invalid*/
	char	fundMovementApplicableFlag;  /* 85 - 1*/ /* 0-No(d)    ; 1-Yes */
	char	reportExpiryOwnerId;		 /* 86 - 1*/ /* 0-No       ; 1-Yes(d)*/
	char	samaApprovalReqd;			 /* 87 - 1*/ /* 0-No(d)    ; 1-Yes */
	char	allowNonSaudiSignatory;		 /* 88 - 1*/ /* 0-No(d)    ; 1-Yes */
	char	mandatoryLicNo;				 /* 89 - 1*/ /* 0-No(d)    ; 1-Yes */
	char	allowOnlyResidentOperators;  /* 90 - 1*/ /* 0-No       ; 1-Yes(d)*/
	char	accOpeningAllowed;			 /* 91 - 1*/ /* 0-No       ; 1-Yes(d)*/
	char	checkBookAllowed;			 /* 92 - 1*/ /* 0-No       ; 1-Yes(d)*/   
	char	secondGracePeriodApplicable; /* 93 - 1*/ /* 0-No       ; 1-Yes(d)*/
	char	idExpiryActionReqd;			 /* 94 - 1*/ /* 0-No       ; 1-Yes(d)*/
	char	atmCardAllowed;				 /* 95 - 1*/ /* 0-No(d)	   ; 1-YES*/
	char	generalCustOpenAllowed;		 /* 96 - 1*/ /* 0-No(d)	   ; 1-YES*/
	char	reportToCompliance;		 	 /* 97 - 1*/ /* 0-No   	   ; 1-YES*/ /* Ver 4.4 */
	char	custUpdActionNotReqd;		 /* 98 - 1*/ /* 0-No   	   ; 1-YES*/ /* Ver 4.4 */
	char	elapsedYears[2];			 /* 99 - 2*/ /* Ver 4.4 */
	char	filler[121];				 /* 101 - 121*/
	char	lastUpdateUser[20];			 /* 222 - 20*/
	char	lastUpdateDateTime[14]; 	 /* 242 - 14*/
	char	filler1[128];
};

struct systemConfig
{
	char	liveChar;								/* 0  -  1*/
	char	recType[2];								/* 1  -  2*/ /* SC */
	char	systemCode[4];							/* 3  -  4*/ /* SAR - SAMA regulation */
	char	arabicShortDesc[30];					/* 7  - 30*/
	char	englishShortDesc[30];					/* 37 - 30*/
	char	ageMinorBecomesMajor[2];				/* 67 - 2*/
	char	acctFreezingYearForSpecialChild[2];		/* 69 - 2*/
	char	endOfSafarDate[8];						/* 71 - 8*/
	char	noOfDaysForInactive[3];					/* 79 - 3*/
	char	noOfDaysForDormant[3];					/* 82 - 3*/
	char	noOfMonthsForUnclaimed[2];				/* 85 - 2*/
	char	roleCodeForSupervisor[3];				/* 87 - 3*/
	char	unclaimedAccNoForMovingFundForId[12];	/* 90 - 12*/ /* Without currency */
	char	accNoForMovingFundFromUnclaimedAcc[12];	/* 102 - 12*/ /* Without currency */
	char	fundMovementSequenceNo[10];				/* 114 - 10*/
	char	lastBackendProcessDate[8];				/* 124 - 8*/
	char	startGroupHeadCustNo[7];				/* 132 - 7*/
	char	endGroupHeadCustNo[7];					/* 139 - 7*/
	char	startPensionCustNo[7];					/* 146 - 7*/	/* Ver 4.1 */
	char	endPensionCustNo[7];					/* 153 - 7*/	/* Ver 4.1 */
	char	startOnlineCustNo[7];					/* 160 - 7*/	/* Ver 4.1 */
	char	endOnlineCustNo[7];						/* 167 - 7*/	/* Ver 4.1 */
	char	currentOnlineCustNo[7];					/* 174 - 7*/	/* Ver 4.1 */
	char	custActionPeriod[4];					/* 181 - 4*/	/* Ver 4.4 */
	char	stdOrdLimit[5];							/* 185 - 5*/	/* Ver 4.4 */
	char	filler[37];								/* 185 - 37*/ /* reduced from 41 to 37, under Ver 4.4 change */
	char	lastUpdateUser[20];						/* 222 - 20*/
	char	lastUpdateDateTime[14];					/* 242 - 14*/
	char	filler1[100];
};

struct serverConfig
{
	char	liveChar;								/* 0  -  1*/
	char	recType[2];								/* 1  -  2*/ /* SC */
	char	systemCode[4];							/* 3  -  4*/ /* SERV - Server configuration */
	char	arabicShortDesc[30];					/* 7  - 30*/
	char	englishShortDesc[30];					/* 37 - 30*/
	char	usrAccBlockingDays[3];					/* 67 - 3*/	
	char	enableSadadProfile;						/* 70 - 1*/ /* 1-Yes ; 0-No */
	char	maxAgeLimit[3];							/* 71 - 3*/
	char	filler[148];							/* 74 - 148*/ 
	char	lastUpdateUser[20];						/* 222 - 20*/
	char	lastUpdateDateTime[14];					/* 242 - 14*/
	char	filler1[100];
};

struct errorMsgInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */  /* ER */
	char	errorCode[4];		/* 3 - 4 */
	char	filler[60];			/* 7 - 60*/
	char	arabicMsg[50];		/* 67 - 50*/
	char	englishMsg[50];		/*117 - 50*/
	char	filler1[55];		/*167 - 55*/
	char	lastUpdateUser[20];	/*222 - 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct fundMovementInfo
{
   char   liveChar;                     /*0  - 1*/
   char   fundMovementDate[6];          /*1  - 6*/
   char   unclaimedAccNo[13];           /*7  - 13*/
   char   customerAccNo[13];            /*20 - 13*/
   char   fundMovementAmount[14];       /*33 - 14*/
   char   fundMovementRef[10];          /*47 - 10*/
   char   filler[71];                   /*57 - 71*/
   char	  filler1[100];
};

struct refreshInfo
{
	char	liveChar;					/* 0 - 1 */
	char	recType[2];					/* 1 - 2 */
	char	clientIpAddress[20];		/* 3 - 20*/
	char	lastRefreshDateTime1[14];	/* 23 - 14 */ /* last refresh date time from the general 
														 static data control file (stctltab) */
	char	lastRefreshDateTime2[14];	/* 37 - 14 */ /* last refresh date time from the sadad 
														 control file (stsadctl) */
	char	filler[100];					/* 51 - Recore size 128 */
};

struct refreshStatus
{
	char	liveChar;			/* 0 - 1 */
	char	branchCode[4];		/* 1 - 4 */
	char	tableType[2];		/* 5 - 2 */
	char	valueChanged;		/* 7 - 1 */ /*0-No; 1-Yes*/
	char	refreshStatus;		/* 8 - 1 */ /*0-Done, 1-Partial, 2-full*/
	char	lastRefreshDateTime[14]; /*9 -14*/
	char	clientIpAddress[30]; /*23 - 30*/
	char	filler1[169];		/* 53 -169*/
	char	lastUpdateUser[10];	/*222- 10 */
	char	filler2[10];		/*232- 10 */
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct userProfile
{
	char	liveChar;			/* 0 - 1 */
	char	userId[10];			/* 1 - 10*/
	char	filler1[10];		/*11 - 10*/
	char	password[20];		/*21 - 20*/
	char	last10Password[200];/*41 -200*/
	char	lastChangeDate[8];	/*241- 8 */
	char	liveStatus;			/*249- 1 */ /* 0 - Open/Reset 1 - Active 
											   2 - Locked     3 - Closed  */
	char	employeeNo[8];		/*250- 8 */
	char	branchCode[4];		/*258- 4 */
	char	firstName[15];		/*262- 15*/
	char	secondName[15];		/*277- 15*/
	char	thirdName[15];		/*292- 15*/
	char	lastName[15];		/*307- 15*/
	char	authorityLevel[20]; /*322- 20*/ /*  00 - CSO enquiry
												01 - CSO update 
												02 - supervisor approvals
												31 - Teller 
												32 - Chief Teller
												40 - card Enquiry
												41 - card request/update
												42 - card supervisor
												43 - card production user
												60 - Account enquiry
												61 - Account update
												62 - Account supervisor
												63 - SAMA STATUS UPDATE
												51 - table enquiry
												52 - table update
												90 - security enquiry
												91 - security update
												92 - HELP DESK user
												81 - Merchant statement
												82 - Manual CC blocking - CSO
												83 - Manual CC blocking - supervisor
												84 - Manual A/c blocking - CSO
												85 - Manual A/c blocking - supervisor
												86 - Allow restricted branch balance enquiry
												87 - Historical statement for deleted accounts
												93 - Cheque Processing 
												94 - FTP historical statements to branches
												99 - USER to check the connectivity  
											*/
	char	loginStatus;			/*342- 1 */ /* 1-Login Success */
	char	lastLoginDateTime[14];	/*343- 14*/
	char    langPreferred;         /*357- 1 */
	char    globalUpdatePriv;      /*358- 1 */ /* 0 - Local ; 1 - Global ; 2 - Restricted Global */
	char	loginIpAddress[15];		/*359-15*/
	char	authorityLevel2[60];	/*374-60*/ /* to expand additional 30 roles */
	char	bpUserId[3];			/*434-3*/ /* For posting SADAD txns from Teller facility*/
	char	filler2[43];			/*437-43*/
	char	lastUpdateUser[10];		/*480- 10*/
	char	filler3[10];			/*490- 10*/
	char	lastUpdateDateTime[14]; /*500- 14*/
};

struct userProfileLog
{
	char	liveChar;			/* 0 - 1 */
	char	userId[10];			/* 1 - 10*/
	char	filler1[10];		/*11 - 10*/
	char	password[20];		/*21 - 20*/
	char	last10Password[200];/*41 -200*/
	char	lastChangeDate[8];	/*241- 8 */
	char	liveStatus;			/*249- 1 */
	char	employeeNo[8];		/*250- 8 */
	char	branchCode[4];		/*258- 4 */
	char	firstName[15];		/*262- 15*/
	char	secondName[15];		/*277- 15*/
	char	thirdName[15];		/*292- 15*/
	char	lastName[15];		/*307- 15*/
	char	authorityLevel[20]; /*322- 20*/ /*  
												00 - teller enquiry
												01 - teller update 
												02 - supervisor approvals
												50 - table enquiry
												51 - table update
												90 - security enquiry
												91 - security update
												99 - SUPER_USER 
											*/
	char	loginStatus;			/*342- 1 */
	char	lastLoginDateTime[14];	/*343- 14*/
	char    langPreferred;         /*357- 1 */
	char    globalUpdatePriv;      /*358- 1 */
	char	newOrUpdate;			/*359-1*/
	char	filler4[14];			/*360-14*/
	char	authorityLevel2[60];	/*374-60*/
	char	bpUserId[3];			/*434-3*/
	char	filler2[43];			/*437-43*/
	char	lastUpdateUser[10];		/*480- 10*/
	char	filler3[10];			/*490- 10*/
	char	lastUpdateDateTime[14]; /*500- 14*/
};

struct securityLog
{
	char	liveChar;			/* 0  - 1 */
	char	dateTime[14];		/* 1  - 14*/
	char	userId[10];			/* 15 - 10*/
	char	actionType;			/* 25 - 1*/ /* 0 - Logon
											   1 - Logout 
											   2 - Invalid Password
											   3 - Password change
											   4 - User Locked 
											   5 - Password reset
											   6 - User closed
											   7 - User Added 
											   8 - User Deactivated
											   9 - Password Expired
											*/
	char	supervisorId[10];	/* 26 - 10*/
	char	branchCode[4];		/* 36 - 4 */
	char	filler[24];			/* 40 - 24*/
};

struct stcustpb
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/*15 - 14*/
	char	custNo[7];					/*29 - 7 */	
	char	custBranchCode[4];			/*36 - 4 */
	char	pendingStatus;				/*40 - 1 */ 	/* 1 - Pending with branch supervisor
														   2 - Pending with branch CSO
														   3 - Rejected by branch
														   4 - Entered by PBO; customer yet to visit the branch
														   9 - Completed successfully 
														*/
	char	branchActionDateTime[14];	/*41 - 14*/
	char	branchCsoId[10];			/*55 - 10*/
	char	branchSupervisorId[10];		/*65 - 10*/
	char	custOpenDate[8];			/*75 - 8*/ 
	char	approvedDateTime[14];		/*83 - 14*/
	char	filler[135];				/*97 - 135*/
	char	lastUpdateUser[10];			/*232- 10*/
	char	lastUpdateDateTime[14]; 	/*242- 14*/
	char	filler1[100];
};

struct branchActivityOnCustomer  
{
	char	liveChar;			/* 0 - 1 */
	char	branchCode[4];		/* 1 - 4 */
	char	userId[10];			/* 5 - 10*/
	char	filler1[10];		/*15 - 10*/
	char	dateTime[14];		/*25 - 14*/
	char	newOrUpdate;		/*39 - 1 */
	char	bmUpdateStatus;		/*40 - 1 */	  /*0-entered;
												1-pending with supervisor
												2-pending with teller
												3-rejected
												9-completed
											 */
	char	custNo[7];			/*41 - 7 */
	char	supervisorId[10];	/*48 - 10*/
	char	filler6[10];		/*58 - 10*/
	char	custBranchCode[4];	/*68 - 4 */
	char	idNo[15];			/*72 - 15*/
	char	idType;				/*87 - 1 */
	char	idIssuedAt[20];		/*88 - 20*/
	char	idDateType;			/*108- 1 */
	char	idIssueDateH[8];	/*109- 8 */
	char	idIssueDateG[8];	/*117- 8 */
	char	idExpiryDateH[8];	/*125- 8 */
	char	idExpiryDateG[8];	/*133- 8 */
	char	preferredLang;		/*141- 1 */
	char	nationality[3];		/*142- 3*/
	char	approvalRefNo[15];	/*145- 15*/ /* V4.4*/
	char	filler9[2];			/*160- 2 */ /*0-NO ; 1-YES */ /* V4.4*/
	char	titleCode[2];		/*162- 2 */
	char	dobDateType;		/*164- 1 */
	char	dobDateH[8];		/*165- 8 */
	char	dobDateG[8];		/*173- 8 */
	char	sexCode;			/*181- 1 */
	char    vipCode;			/*182- 1 */
	char	maritalStatus;		/*183- 1 */
	char	noOfDependents[2];	/*184- 2 */
	char	residentStatus;		/*186- 1 */
	char	businessType[3];	/*187- 3 */
	char	filler4;			/*190- 1 */
	char	crNo[15];			/*191- 15*/
	char	crIssuedAt[20];		/*206- 20*/
	char	crIssueDateType;	/*226- 1 */
	char	crIssueDateH[8];	/*227- 8 */
	char	crIssueDateG[8];	/*235- 8 */
	char	aOrgName1[30];		/*243- 30*/
	char	aOrgName2[30];		/*273- 30*/
	char	aOrgShortName[30];	/*303- 30*/
	char	eOrgName1[30];		/*333- 30*/
	char	eOrgName2[30];		/*363- 30*/
	char	eOrgShortName[30];	/*393- 30*/
	char	aFirstName[15];		/*423- 15*/
	char	a2ndName[15];		/*438- 15*/
	char	a3rdName[15];		/*453- 15*/
	char	aLastName[15];		/*468- 15*/
	char	aShortName[30];		/*483- 30*/
	char	eFirstName[15];		/*513- 15*/
	char	e2ndName[15];		/*528- 15*/
	char	e3rdName[15];		/*543- 15*/
	char	eLastName[15];		/*558- 15*/
	char	eShortName[30];		/*573- 30*/
	char	address1[30];		/*603- 30*/
	char	address2[30];		/*633- 30*/
	char	poBox[10];			/*663- 10*/
	char	cityName[20];		/*673- 20*/
	char	zipCode[10];		/*693- 10*/
	char	country[3];			/*703- 3 */
	char	addressType;		/*706-  1*/ /* 0-PO Box;1-Saudi Post */
	char	gprsNo[8];			/*707-  8*/ /* Added for Saudi postal address */
	char	unitNo[5];			/*715-  5*/ /* Added for Saudi postal address */
	char	accFreezingGracePeriod[3]; /*720 - 3 */ /*Ver 4.4; Customer Level Acc freezing grace period */
	char	telOffAreaCode[4];	/*723- 4 */
	char	telOffNo[10];		/*727- 10*/
	char	telOffExt[4];		/*737- 4 */
	char	telHomeAreaCode[4];	/*741- 4 */
	char	telHomeNo[10];		/*745- 10*/
	char	telHomeExt[4];		/*755- 4 */
	char	faxAreaCode[4];		/*759- 4 */
	char	faxNo[10];			/*763- 10*/
	char	faxExt[4];			/*773- 4 */
	char	mobileNo[10];		/*777- 10*/
	char	pagerNo[10];		/*787- 10*/
	char	eMail[30];			/*797- 30*/
	char	educationCode[2];	/*827- 2 */
	char	professionCode[2];	/*829- 2 */
	char	positionCode[2];	/*831- 2 */
	char	monthlyIncome[2];	/*833- 2 */
	char	ownerShip[10];		/*835- 10*/ /* position 0-RentHouse; Value 1 means RentHouse else no RentHouse
														1-OwnHouse; Value 1 means OwnHouse else no OwnHouse
														2-CompanyAccomodation; Value 1 means Comp.House else Comp.House
														3-RentCar; Value 1 means RentCar else no RentCar
														4-OwnCar; Value 1 means ownCar else no ownCar
														5-CompanyTransport; Value 1 means Comp.Car else no Comp.Car */
	char    segmentation;		/*845- 1 */
	char	employerName[30];	/*846- 30*/
	char	department[20];		/*876- 20*/
	char	employerPoBox[10];	/*896- 10*/
	char	employerCity[20];	/*906- 20*/
	char	employerZipCode[10];/*926- 10*/
	char	documents[15];		/*936- 15*/
	char	documentOther[50];	/*951- 50*/
	char	singleJointAcc;	    /*1001-1 */	/*0-single;1-joint; 2-Unknown*/
	char	packageAcc;			/*1002-1 */ /* 0 - None
											   1 - Munafa
											   2 - Wahat 
											   3 - Al Safwa
											   4 - Mubarak
											   5 - Private Banking 
											*/
	char	noOfJointCustomer[2];/*1003-2*/
	char	jointAccNameOnCheck[60];	/*1005-60*/
	char	jointAccNameOnReports[30];	/*1065-30*/
	char	signatureNature;		/*1095-1 */	/*0-single;1-joint*/
	char	electronCardRequired;		/*1096-1 */
	char	electronCardName[26];		/*1097-26*/
	char	electronSuppRequired;		/*1123-1 */
	char	electronSuppName[26];		/*1124-26*/
	char	electronIntlRequired;		/*1150-1 */
	char	electronIntlName[26];		/*1151-26*/
	char	electronIntlSuppRequired;	/*1177-1 */
	char	electronIntlSuppName[26];	/*1178-26*/
	char	deliveryToBranchOrPO;		/*1204-1 */ /*B-Branch ; P - PoBox*/
	char	deliveryAddress1[30];		/*1205-30*/
	char	deliveryAddress2[30];		/*1235-30*/
	char	deliveryPoBox[10];			/*1265-10*/
	char	deliveryCity[20];			/*1275-20*/
	char	deliveryZip[10];			/*1295-10*/
	char	supervisorComments[200];	/*1305-200*/
	char    custType;					/*1505-1  */
	char	foundInAList;				/*1506-1 */ /* 0 - No 1 - Yes */
	char	foundInBList;				/*1507-1 */ /* 0 - No 1 - Yes */
	char	foundInCList;				/*1508-1 */ /* 0 - No 1 - Yes */
	char	existingCustomer;			/*1509-1 */ /* 0 - No 1 - Yes */
	char	nameChanged;				/*1510-1*/ /*0-NO; 1-YES*/
	char	addressChanged;				/*1511-1*/ /*0-NO; 1-YES*/
	char	custOpenDate[8];			/*1512-8*/
	char	lastUpdateBmDate[8];		/*1520-8*/
	char	updateCardAddressReqd;		/*1528-1*/ /*0-NO; 1-YES*/
	char	internetBankAcc;			/*1529-1*/ /*0-NO; 1-YES*/
	char	custAdviceFlag;				/*1530-1*/ /*0-NO; 1-YES*/
	char	altBranchCode[4];			/*1531-4*/
	char	orgAlphaSearchCode[6];		/*1535-6*/
	char	updatedForSama;				/*1541-1*/ /*0-NO; 1-YES*/
	char	relationshipManager[25];	/*1542-25*/
	char	generalMemo[25];			/*1567-25*/

	char	samaMainCategory[2];		/*1592 -  2*/
	char	samaSubCategory[2]; 		/*1594 -  2*/
	char	passportNo[15];				/*1596 - 15*/
	char	hafizaNo[15];				/*1611 - 15*/
	char	familyRegnNo[15];			/*1626 - 15*/
	char	licenseNo[15];				/*1641 - 15*/
	char	samaAuthNo[15];				/*1656 - 15*/
	char 	diplomaticCardNo[15];		/*1671 - 15*/
	char	visaNo[15];					/*1686 - 15*/
	char	contractNo[15];				/*1701 - 15*/
	char	homeCountryId[15];		    /*1716 - 15*/
	char	certificateOfBirthNo[15];	/*1731 - 15*/ 
	char	interGroupAccNo[14];		/*1746 - 14*/
	char	specialRefNo[15];			/*1760 - 15*/
	char	purposeOfAccount[50];		/*1775 - 50*/
	char	govtShareHoldingPerc[3];	/*1825 -  3*/
	char	saudiShareHoldingPerc[3];	/*1828 -  3*/
	char	foreignShareHoldingPerc[3];	/*1831 -  3*/
	char	documentsSupplied[60];		/*1834 - 60*/ /* 20 documents of 3 bytes code */
	char	overrideForCList;			/*1894 -  1*/
	char	overrideForNonSaudi;		/*1895 -  1*/
	char	overrideForNoSamaAuth;		/*1896 -  1*/
	char	overrideForExistingCust;	/*1897 -  1*/
	char	minorOrMajor;				/*1898 -  1*/ /* 0-Major ; 1-Minor */
	char	childWithSpecialCase;		/*1899 -  1*/ /* 0-No    ; 1-Yes   */
	char	idExpiryActionNotReqd;		/*1900 -  1*/ /* 0-No    ; 1-Yes   */
	char	referenceReqdFor[10];		/*1901 - 10*/ 
	char	createdFromQuickScreen;		/*1911 -  1*/ /* 0-No; 1-Normal customer; 2-Internal customer; 3-Pension customer*//*Ver4.1*/
	char	cardType;					/*1912 -  1*/ /* I-International card; S-Smart Card */
	char	marketingMemo[25];			/*1913 - 25*/ /* General memo for marketing */
	char	custOpenSource;				/*1938 -  1*/ /* P-customer created through phone;B-created through branch;O-created Online*/
	char	excludeFromAtmFees;			/*1939 -  1*/ /*0-No ; 1-YES */
	char	excludeFromMinBalFees;		/*1940 -  1*/ /*0-No ; 1-YES */
	char	succDeedNo[10];				/*1941 -  10*/
	char	pkgStmtFreqOverride;		/*1951 -  1*/ /*0-No ; 1-YES */
	char	stmtDeliveryMode;			/*1952 -  1*/ /*0-Print only; 1-Mail only; 2-Both */
	char	filler5[61];				/*1953 - 61*/
	char	lastUpdateUser[10];			/*2014-10*/
	char	filler7[10];				/*2024-10*/
	char	lastUpdateDateTime[14]; 	/*2034-14*/
	char	filler8[128];				/*2048-128*/ /* for future enhancement */	
};

struct branchActivityOnAccounts
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	filler1[10];				/*15 - 10*/
	char	dateTime[14];				/*25 - 14*/

	char	accNo[14];					/*39 - 14*/
	char	newOrUpdate;				/*53 - 1 */
	char	supervisorId[10];			/*54 - 10*/
	char	filler4[10];				/*64 - 10*/
	char	accStatus[2];				/*74 - 2 */
	char	statementFreq[2];			/*76 - 2 */
	char	checkBook;					/*78 - 1 */
	char	droppedAcc;					/*79 - 1 */ /*0 - Not Dropped , 1 - Dropped*/
	char	accOpenDate[8];				/*80 - 8 */
	char	lastUpdateBmDate[8];		/*88 - 8 */
	char	bmUpdateStatus;				/*96 - 1 */
	char	supervisorComments[200]; 	/*97 - 200*/
	char	intApplication;				/*297-1*/
	char    crIntRate[9];				/*298-9*/
	char    drIntRate[9];				/*307-9*/
	char	payAccNo[14];				/*316-14*/
	char	uniqueNo[5];				/*330-5*/
	char	uniqueSub[2];				/*335-2*/
	char	statementDay;				/*337-1*/ /* 0-Branch Statement Day ; 1 - Month End */
	char	filler;						/*338-1*/
	char	custBranchCode[4];			/*339-4*/
	char	statusChanged;				/*343-1*/ /* 0-Not Changed ; 1-Changed */
	char	fromStatus[2];				/*344-2*/
	char	toStatus[2];				/*346-2*/
	char	acctDesc[30];				/*348-30*/
	char	initialStatus[2];			/*378-2*/
	char	samaAccStatus[2];			/*380-2*/ 			/* 00-Open;01-Inactive;02-Dormant;03-Unclaimed*/
	char	samaAccStatusChanged;		/* 382-1*/ /* 0-Not Changed ; 1-Changed */
	char	fromSamaAccStatus[2];		/* 383-2*/
	char	toSamaAccStatus[2];			/* 385-2*/
	char	initialSamaStatus[2];		/* 387-2*/
	char	accStatusChangeReason[30];	/* 389-30*/
	char	dormantActivationUpd;		/* 419-1*/  /* 0-No(Normal Update) ; 1-Yes(Updated to remove dormant restriction */
	char 	creditLimit[12];			/* 420-12*/
	char 	intLastRun[14];				/* 432-14*/
	char 	intFreqCode[3];				/* 446-3 */
	char 	intApplDay[2];				/* 449-2 */
	char 	inactiveAccFlag;			/* 451-1 */ /* 0-Not dormant ; 1-dormant */
	char	samaBlockAccStatusChanged;	/* 452-1 */ /* 1-YES;0-NO */ /* this is set as "1" when Branch admin lift the a/c status 
																		for a sama blocked account */
	char	filler6[25];				/*453-25*/
	char	lastUpdateUser[10];			/*478- 10*/
	char	filler5[10];				/*488- 10*/
	char	lastUpdateDateTime[14]; 	/*498- 14*/
	char	filler9[128];				/*512-128*/
};

struct sttdlog			/* Time deposit log */
{
	char	liveChar;				/* 0 - 1 */
	char	branchCode[4];			/* 1 - 4 */
	char	userId[10];				/* 5 - 10*/
	char	dateTime[14];			/*15 - 14*/
	char	custNo[7];				/*29 - 7 */
	char	tdAccNo[14];			/*36 - 14*/
	char	newOrUpdate;			/*50 - 1 */
	char	supervisorId[10];		/*51 - 10*/
	char	bmUpdateStatus;			/*61 - 1 */
	char	tdCurrency[2];			/*62 - 2 */
	char	tdLedger[3];			/*64 - 3 */
	char	debitAccNo[14];			/*67 - 14*/
	char	depositAmt[14];			/*81 - 14*/
	char	tenorType;				/*95 - 1 */ /* D-Days;W-Week;M-Month */
	char	tenorPeriod[3];			/*96 - 3 */ 
	char	fundIntRate[9];			/*99 - 9 */
	char	exRate[14];				/*108- 14*/
	char	maturityAmt[14];		/*122- 14*/
	char	maturityDate[8];		/*136- 8*/
	char	overrideExRate;			/*144- 1 */ /* 0-No ; 1-Yes */
	char	overrideIntRate;		/*145- 1 */ /* 0-No ; 1-Yes */
	char	orgFundIntRate[9];		/*146- 9 */
	char	orgExRate[14];			/*155- 14*/
	char	autoRenewFlag;			/*169- 1 */ /* 0 or 1 */
	char	supervisorComments[200];/*170- 200*/
	char	diffDays[3];			/*370- 3 */
	char	intAppln;				/*373- 1 */ /* 0-Applied to Fixed deposit;1-Applied Payee A/c */
	char	payAccNo[14];			/*374- 14*/
	char	valueDate[8];			/*388- 8 */ /* YYYYMMDD- included for supporting back-value dated TD */
	char	overrideValueDate;		/*396- 1 */ /* 1-Override else normal */
	char	debitAmt[14];			/*397- 14*/ /* Added along with back-value dated TD amendments */
	char	bookingDate[8];			/*411- 8 */ /* Added for back-value dated TD; Date on which TD was booked-bankingDate*/
	char 	filler[69];			    /*419- 69*/ 
	char	lastUpdateUser[10];		/*488- 10*/
	char	lastUpdateDateTime[14];	/*498- 14*/
	char	filler1[100];
};

struct branchActivityOnJointAccounts  /* sequence need to be reviwed */
{
	char	liveChar;			/* 0 - 1 */
	char	branchCode[4];		/* 1 - 4 */
	char	userId[10];			/* 5 - 10*/
	char	filler8[10];		/*15 - 10*/
	char	dateTime[14];		/*25 - 14*/
	char	custNo[7];			/*39 - 7 */
	char	jointCustNo[2]; 	/*46 - 2 */
	char	filler1[7];			/*48 - 7 */
	char	newOrUpdate;		/*55 - 1 */
	char	supervisorId[10];	/*56 - 10*/
	char	filler9[10];		/*66 - 10*/
	char	idNo[15];			/*76 - 15*/
	char	idType;				/*91 - 1 */
	char	idIssuedAt[20];		/*92 - 20*/
	char	idDateType;			/*112- 1 */
	char	idIssueDateH[8];	/*113- 8 */
	char	idIssueDateG[8];	/*121- 8 */
	char	idExpiryDateH[8];	/*129- 8 */
	char	idExpiryDateG[8];	/*137- 8 */
	char	preferredLang;		/*145- 1 */
	char	nationality[3];		/*146- 3 */
	char	filler2[17];		/*149- 17*/
	char	titleCode[2];		/*166- 2 */
	char	dobDateType;		/*168- 1 */
	char	dobDateH[8];		/*169- 8 */
	char	dobDateG[8];		/*177- 8 */
	char	sexCode;			/*185- 1 */
	char	vipCode;			/*186- 1 */
	char	marritalStatus;		/*187- 1 */
	char	noOfDependents[2];	/*188- 2 */
	char	residentStatus;		/*190- 1 */
	char	businessType[3];	/*191- 3 */
	char	filler5;			/*194- 1 */
	char	aFirstName[15];		/*195- 15*/
	char	a2ndName[15];		/*210- 15*/
	char	a3rdName[15];		/*225- 15*/
	char	aLastName[15];		/*240- 15*/
	char	aShortName[30];		/*255- 30*/
	char	eFirstName[15];		/*285- 15*/
	char	e2ndName[15];		/*300- 15*/
	char	e3rdName[15];		/*315- 15*/
	char	eLastName[15];		/*330- 15*/
	char	eShortName[30];		/*345- 30*/
	char	address1[30];		/*375- 30*/
	char	address2[30];		/*405- 30*/
	char	poBox[10];			/*435- 10*/
	char	cityName[20];		/*445- 20*/
	char	zipCode[10];		/*465- 10*/
	char	country[3];			/*475- 3 */
	char	addressType;		/*478- 1 */ /* 0-PO Box ; 1-Saudi Post */
	char	gprsNo[8];			/*479- 8 */ /* Added for saudi post enhancement */
	char	unitNo[5];			/*487- 5 */ /* Added for saudi post enhancement */
	char	filler3[3];			/*492- 3 */
	char	telOffAreaCode[4];	/*495- 4 */
	char	telOffNo[10];		/*499- 10*/
	char	telOffExt[4];		/*509- 4 */
	char	telHomeAreaCode[4];	/*513- 4 */
	char	telHomeNo[10];		/*517- 10*/
	char	telHomeExt[4];		/*527- 4 */
	char	faxAreaCode[4];		/*531- 4 */
	char	faxNo[10];			/*535- 10*/
	char	faxExt[4];			/*545- 4 */
	char	mobileNo[10];		/*549- 10*/
	char	pagerNo[10];		/*559- 10*/
	char	eMail[30];			/*569- 30*/
	char	educationCode[2];	/*599- 2 */
	char	professionCode[2];	/*601- 2 */
	char	positionCode[2];	/*603- 2 */
	char	monthlyIncome[2];	/*605- 2 */
	char	ownerShip[10];		/*607- 10*/
	char	segmentation;		/*617- 1 */
	char	employerName[30];	/*618- 30*/
	char	department[20];		/*648- 20*/
	char	employerPoBox[10];	/*668- 10*/
	char	employerCity[20];	/*678- 20*/
	char	employerZipCode[10];/*698- 10*/
	char	jointOpenDate[8];	/*708- 8*/
	char	lastUpdateBmDate[8];/*716 - 8*/
	char	activeStatus;		/*724 - 1*/ /* 0-Invalid; 1-Valid */
	char	recordChanged;		/*725 - 1*/ /* Y - Changed ; N - Not changed */
	char	custOpenSource;		/*726 - 1*/ /* P-Phone ; */
	char	filler4[263];		/*727-263*/
	char	lastUpdateUser[10]; /*990- 10*/
	char	filler6[10];		/*1000-10*/
	char	lastUpdateDateTime[14];	/*1010-14*/
	char	filler20[128];		/*1024-128*/
};

struct chequeBookDeleteLog 
{
	char    liveChar;				/* 0 - 1 */
	char    accNo[14];				/* 1 - 14*/
	char    branchCode[4];			/* 15 - 4*/
	char    chequeType;				/* 19 - 1*/		/* 1- personal; 2- corporate */
	char    booksRequested[2];		/* 20 - 2*/
	char	requestUserId[10];		/* 22 - 10*/
	char	requestDateTime[14];  	/* 32 - 14 */
	char	requestStatus ;        	/* 46 - 1 */	/* 1 - Requested
											       	   2 - Produced 
											           3 - Received by Branch   
												       4 - Issued to customer
												       9 - Rejected by branch
											        */
	char	custBranchCode[4];		/* 47  - 4 */
	char	deletedDateTime[14];	/* 51  - 14*/
	char	deletedUserId[10];		/* 65  - 10*/
	char	deletedReason[20];		/* 75  - 20*/
	char    filler[385];            /* 95  - 385*/
	char	lastUpdateUser[10]; 	/* 480 - 10*/
	char	lastUpdateDateTime[14]; /* 490 - 14*/
	char	filler1[100];
};

struct chequeBookInfo 
{
	char    liveChar;			 /* 0 - 1 */
	char    accNo[14];			 /* 1 - 14*/
	char    branchCode[4];		 /* 15 - 4*/
	char    chequeType;			 /* 19 - 1*/		/* 1- personal; 2- corporate */
	char    booksRequested[2];	 /* 20 - 2*/
	char	requestUserId[10];	 /* 22 - 10*/
	char	requestDateTime[14]; /* 32 - 14 */
	char	requestStatus ;      /* 46 - 1 */	/* 1 - Requested
											       2 - Produced 
											       3 - Received by Branch   
												   4 - Issued to customer
												   9 - Rejected by branch
											    */
	char	producedDate[8];    /* 47 - 8 */
	char	producedUserId[10]; /*55  - 10*/
	char	recdByBranchDate[8];/* 65 - 8 */
	char	recdByBranchUserId[10];/* 73 - 10 */
	char	issuedToCustDate[8]; /* 83 - 8 */
	char	issuedToCustUserId[10];/* 91 - 10 */
	char	custBranchCode[4];		/* 101 - 4 */
	char	chequeNoFrom[8];		/* 105 - 8 */
	char	chequeNoTo[8];			/* 113 - 8 */
	char	reqDate[8];				/* 121 - 8 */ /* It has actual date of request; the other requestDateTime contains banking date.  So, this date(reqdate) will be used in history display */
	char	rejectedDate[8];		/* 129 - 8*/
	char	rejectedUserId[10];		/* 137 -10*/
	char	rejectedReason[20];		/* 147 -20*/
	char	producedTime[6];		/* 167 -6*/
	char	recdByBranchTime[6];	/* 173 -6*/
	char	issuedToCustTime[6];	/* 179 -6*/
	char	rejectedTime[6];		/* 185 -6*/
	char	deliveryBranchCode[4];	/* 191 -4*/
	char    filler[293];            /* 195 - 293 */
	char	lastUpdateUser[10]; 	/* 488 - 10*/
	char	lastUpdateDateTime[14]; /* 498 - 14*/
	char	filler1[128];
};

struct abcList
{
	char	liveChar;		/* 0 - 1 */
	char	ipNumber[10];	/* 1 - 10*/
	char	abcListType;	/*11 - 1 */
	char	custNo[8];		/*12 - 8 */
	char	custName[60];	/*20 - 60*/
	char	idType;			/*80 - 1 */
	char	idNo[15];		/*81 - 15*/
	char	reportedBank[20];/*96 - 20*/
	char	reportedDate[8]; /*116 - 8 */
	char	filler[20];
};

struct calendarInfo
{
  char liveChar;			/* 0 - 1 */  /* @*/
  char gregDate[8];			/* 1 - 8 */  /* YYYYMMDD */
  char hijriDate[8];		/* 9 - 8 */  /* YYYYMMDD */
  char filler[11];			/* 17 - 11*/
  char filler1[20];			/* 28 - 20*/
};

struct tpinHistory
{
	char	liveChar;					/* 0   - 1  */
	char	branchCode[4];				/* 1   - 4  */
	char	userId[10];					/* 5   - 10 */
	char	dateTime[14];				/* 15  - 14 */
	char	newOrUpdate;				/* 29  -  1 */ /* N - New ; U - Update */
	char	pendingStatus;				/* 30  -  1 */ /* 1 - Pending ; 3 - Rejected ; 9 - Completed */
	char	custNo[7];					/* 31  -  7 */	
	char	supervisorId[10];			/* 38  - 10 */
	char	custBranchCode[4];			/* 48  -  4 */
	char	tPin[4];					/* 52  -  4  */ /* Encrypted */
	char	supervisorComments[200]; 	/* 56  - 200 */
	char	filler[232];				/* 256 - 232*/
	char	lastUpdateUser[10];	    	/* 488 - 10 */
	char	lastUpdateDateTime[14]; 	/* 498 - 14*/
	char	filler1[100];				/* 512 - 100*/
};

struct idInfo
{
	char	liveChar;				/* 0  -  1*//* @ */
	char	custNo[7];				/* 1  -  7*/
	char	idType;					/* 8  -  1*/ 
												/*  I - Saudi ID 
													Q - Iqama
													P - Passport
													H - Hafiza
													F - Family Registration
													C - CR NO
													S - Sama Authorization No
													V - Visa No
													T - Contract 
													D - Diplomatic passport no
													L - License number
													M - Home country Id
													A - Approval Document Reference number 
													E - Succession deed number
												*/
	char	idNo[15];				/* 9  - 15*/
	char	idCategory;				/* 24 -  1*/ /* S-Signatory; C-Customer; W-oWner ; R-Reference ; J-Joint ; H-Heirs*/
	char	idDateType;				/* 25 -  1*/ /* 0 - Hijri ; 1 - Gregorian */
	char	idIssuedAt[20];			/* 26 - 20*/
	char	idIssueDateH[8];		/* 46 -  8*/
	char	idIssueDateG[8];		/* 54 -  8*/
	char	idExpiryDateH[8];		/* 62 -  8*/
	char	idExpiryDateG[8];		/* 70 -  8*/
	char	lastUpdateBmDate[8];	/* 78 -  8*/
	char	idExpiryActionNotReqd;	/* 86 -  1*/ /* 0-No ; 1-Yes */
	char	grace1ActionTaken;		/* 87 -  1*/ /* 0-Not Taken ; 1 - Taken*/
	char	grace1ActionDate[8];	/* 88 -  8*/ /* Blank when the above flag is 0*/
	char	grace2ActionTaken;		/* 96 -  1*/ /* 0-Not Taken ; 1 - Taken*/
	char	grace2ActionDate[8];	/* 97 -  8*/ /* Blank when the above flag is 0*/
	char	newOrUpdate;			/* 105 - 1*/ /* N - New ; U - Update */
	char	idRefNo[4];				/* 106 - 4*/
	char	idRefName[30];			/* 110 - 30*//* Ver 4.4 ; Added for approver referer name */
	char	iqamaType;				/* 140 - 1 */ /* 0-Book ; 1-Plastic */
	char	filler1[67];			/* 141 - 67*/
	char	createdUserId[10];		/* 208-  10*/
	char	createdDateTime[14];	/* 218-  14*/
	char	lastUpdateUser[10];		/* 232 - 10*/
	char	lastUpdateDateTime[14];	/* 242 - 14*/
	char	filler2[128];			/* 256 - 128*/
};

struct branchActivityOnId
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	newOrUpdate;				/* 29 - 1*/ /* N - New ; U - Update */
	char	custNo[7];					/* 30 - 7*/
	char	bmUpdateStatus;				/* 37 - 1*/
	char	idType;						/* 38 -  1*/ 
												/*  I - Saudi ID 
													Q - Iqama
													P - Passport
													H - Hafiza
													F - Family Registration
													C - Corporate/Commercial
													S - Sama Authorization No
													V - Visa No
													T - Contract 
													D - Diplomatic passport no
													L - License number
													M - Home country Id
													A - Approval Document Reference number 
													E - Succession deed number
												*/
	char	idNo[15];					/* 39  - 15*/
	char	idCategory;					/* 54  -  1*/ /* S-Signatory; C-Customer; W-oWner ; R-Reference ; J-Joint ; H-Heirs*/
	char	idDateType;					/* 55  -  1*/ /* 0 - Hijri ; 1 - Gregorian */
	char	idIssuedAt[20];				/* 56  - 20*/
	char	idIssueDateH[8];			/* 76  -  8*/
	char	idIssueDateG[8];			/* 84  -  8*/
	char	idExpiryDateH[8];			/* 92  -  8*/
	char	idExpiryDateG[8];			/* 100 -  8*/
	char	lastUpdateBmDate[8];		/* 108 -  8*/
	char	idExpiryActionNotReqd;		/* 116 -  1*/ /* 0-No ; 1 - Yes */
	char	grace1ActionTaken;			/* 117 -  1*/ /* 0-Not Taken ; 1 - Taken*/
	char	grace1ActionDate[8];		/* 118 -  8*/ /* Blank when the above flag is 0*/
	char	grace2ActionTaken;			/* 126 -  1*/ /* 0-Not Taken ; 1 - Taken*/
	char	grace2ActionDate[8];		/* 127 -  8*/ /* Blank when the above flag is 0*/
	char	idRefNo[4];					/* 135 -  4*/
	char	recordChanged;				/* 139 -  1*/ /* Y - Changed ; N - Not changed */
	char	idRefName[30];				/* 140 - 30*/ /* Ver 4.4 */
	char	iqamaType;					/* 170 - 1 */ /* 0-Book ; 1-Plastic */
	char	filler[61];					/* 171 - 61*/
	char	lastUpdateUser[10];			/* 232 - 10*/
	char	lastUpdateDateTime[14];		/* 242 - 14*/
	char	filler1[128];				/* 256 - 128*/
};

struct addressInfo
{
	char	liveChar;				/* 0  -  1*/
	char	custNo[7];				/* 1  -  7*/
	char	addressType[2];			/* 8  -  2*/ /* 00 - Customer main/local address
													01 - Customer abroad address
													02 - Reference address
													03 - Owner local address
													04 - Owner abroad address
													05 - Heirs Address
												*/
	char	addressNo[4];			/* 10 -  4*/
	char	address1[30];			/* 14 - 30*/
	char	address2[30];			/* 44 - 30*/
	char	poBox[10];				/* 74 - 10*/
	char	cityName[20];			/* 84 - 20*/
	char 	zipCode[10];			/* 104- 10*/
	char	country[3];				/* 114-  3*/
	char	telOffAreaCode[4];		/* 117-  4*/
	char	telOffNo[10];			/* 121- 10*/
	char	telOffExt[4];			/* 131-  4*/
	char	telHomeAreaCode[4];		/* 135-  4*/
	char	telHomeNo[10];			/* 139- 10*/
	char	telHomeExt[4];			/* 149-  4*/
	char 	faxAreaCode[4];			/* 153-  4*/
	char	faxNo[10];				/* 157- 10*/
	char	faxExt[4];				/* 167-  4*/
	char	mobileNo[10];			/* 171- 10*/
	char	pagerNo[10];			/* 181- 10*/
	char	eMail[30];				/* 191- 30*/
	char	lastUpdateBmDate[8];	/* 221-  8*/
	char	newOrUpdate;			/* 229-  1*/
	char	addrType;				/* 230-  1*/ /* 0-PO Box;1-Saudi Post */
	char	gprsNo[8];				/* 231-  8*/ /* Added for Saudi postal address */
	char	unitNo[5];				/* 239-  5*/ /* Added for Saudi postal address */
	char	filler[220];			/* 244- 220*/
	char	createdUserId[10];		/* 464- 10*/
	char	createdDateTime[14];	/* 474- 14*/
	char	lastUpdateUser[10];		/* 488- 10*/
	char	lastUpdateDateTime[14]; /* 498- 14*/
	char	filler1[128];			/* 512- 128*/
};

struct branchActivityOnAddress
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	newOrUpdate;				/* 29 - 1*/ /* N - New ; U - Update */
	char	custNo[7];					/* 30 - 7*/
	char	addressType[2];				/* 37 - 2*/ /* 00 - Customer main/local address
													   01 - Customer abroad address
													   02 - Reference address
													   03 - Owner local address
													   04 - Owner abroad address
													   05 - Heirs Address
													*/
	char	addressNo[4];				/* 39 - 4*/  /* 0000 for customer local/abroad address */
	char	bmUpdateStatus;				/* 43 - 1*/ /* 1 - Pending with supervisor
													   2 - Pending with CSO
													   3 - Rejected    
													   9 - Completed
													*/
	char	address1[30];				/* 44  - 30*/
	char	address2[30];				/* 74  - 30*/
	char	poBox[10];					/* 104 - 10*/
	char	cityName[20];				/* 114 - 20*/
	char 	zipCode[10];				/* 134 - 10*/
	char	country[3];					/* 144 -  3*/
	char	telOffAreaCode[4];			/* 147 -  4*/
	char	telOffNo[10];				/* 151 - 10*/
	char	telOffExt[4];				/* 161 -  4*/
	char	telHomeAreaCode[4];			/* 165 -  4*/
	char	telHomeNo[10];				/* 169 - 10*/
	char	telHomeExt[4];				/* 179 -  4*/
	char 	faxAreaCode[4];				/* 183 -  4*/
	char	faxNo[10];					/* 187 - 10*/
	char	faxExt[4];					/* 197 -  4*/
	char	mobileNo[10];				/* 201 - 10*/
	char	pagerNo[10];				/* 211 - 10*/
	char	eMail[30];					/* 221 - 30*/
	char	lastUpdateBmDate[8];		/* 251 - 8*/
	char	recordChanged;				/* 259 -  1*/ /* Y - Changed ; N - Not changed */
	char	addrType;				    /* 260 -  1*/ /* 0-PO Box;1-Saudi Post */
	char	gprsNo[8];					/* 261-   8*/ /* Added for Saudi postal address */
	char	unitNo[5];					/* 269 -  5*/ /* Added for Saudi postal address */
	char	filler[214];				/* 274 - 214*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler1[128];				/* 512 - 128*/
};

struct customerInfo
{
	char	liveChar;			/* 0 - 1 */
	char	custNo[7];			/* 1 - 7 */
	char	branchCode[4];		/* 8 - 4 */
	char	createdUserId[10];	/*12 - 10*/
	char	filler7[10];		/*22 - 10*/
	char	createdDateTime[14];/*32 - 14*/
	char	idNo[15];			/*46 - 15*/
	char	idType;				/*61 - 1 */
	char	idIssuedAt[20];		/*62 - 20*/
	char	idDateType;			/*82 - 1 */ /*0-Hijri; 1-Gregorian*/
	char	idIssueDateH[8];	/*83 - 8 */
	char	idIssueDateG[8];	/*91 - 8 */
	char	idExpiryDateH[8];	/*99 - 8 */
	char	idExpiryDateG[8];	/*107- 8 */
	char	preferredLang;		/*115- 1 */ /* 0-Arabic; 1-English */
	char	nationality[3];		/*116- 3 */ /* BM Codes */
	char	approvalRefNo[15];	/*119- 15*/ /* V4.4*/
	char	custUpdActionNotReqd;/*134- 1 */ /*0-NO ; 1-YES */ /* V4.4*/
	char	custUpdActionTaken;	/*135- 1*//*0-NO ; 1-YES */ /* V4.4*/
	char	titleCode[2];		/*136- 2 */ /* BM Codes */
	char	dobDateType;		/*138- 1 */ /*0-Hijri; 1-Gregorian*/
	char	dobDateH[8];		/*139- 8 */
	char	dobDateG[8];		/*147- 8 */
	char	sexCode;			/*155- 1 */ /*0-Male; 1-Female*/
	char	vipCode;			/*156- 1 */ /*0-Non-VIP ; 1-VIP*/
	char	marritalStatus;		/*157- 1 */ /*0-Married;1-single;2-others*/
	char	noOfDependents[2];	/*158- 2 */
	char	residentStatus;		/*160- 1 */ /*0-resident;1-Non-resident*/
	char	businessType[3];	/*161- 3 */ /* BM Codes */
	char	custUpdWarningLetterGenerated;/*164- 1 */ /* Ver4.4 */ /* 0-NO; 1-YES */
	char	crNo[15];			/*165- 15*/
	char	crIssuedAt[20];		/*180- 20*/
	char	crIssueDateType;	/*200- 1 */ /*0-Hijri; 1-Gregorian*/
	char	crIssueDateH[8];	/*201- 8 */
	char	crIssueDateG[8];	/*209- 8 */
	char	aOrgName1[30];		/*217- 30*/
	char	aOrgName2[30];		/*247- 30*/
	char	aOrgShortName[30];	/*277- 30*/
	char	eOrgName1[30];		/*307- 30*/
	char	eOrgName2[30];		/*337- 30*/
	char	eOrgShortName[30];	/*367- 30*/
	char	aFirstName[15];		/*397- 15*/
	char	a2ndName[15];		/*412- 15*/
	char	a3rdName[15];		/*427- 15*/
	char	aLastName[15];		/*442- 15*/
	char	aShortName[30];		/*457- 30*/
	char	eFirstName[15];		/*487- 15*/
	char	e2ndName[15];		/*502- 15*/
	char	e3rdName[15];		/*517- 15*/
	char	eLastName[15];		/*532- 15*/
	char	eShortName[30];		/*547- 30*/
	char	address1[30];		/*577- 30*/
	char	address2[30];		/*607- 30*/
	char	poBox[10];			/*637- 10*/
	char	cityName[20];		/*647- 20*/
	char	zipCode[10];		/*667- 10*/
	char	country[3];			/*677- 3 */ /* what should we do during migration??? */
	char	addressType;		/*680- 1 */ /* 0 - PO Box ; 1 - Saudi Post */
	char	gprsNo[8];			/*681- 8 */ /* Added for Saudi Postal address */
	char	unitNo[5];			/*689- 5 */ /* Added for Saudi Postal address */
	char	accFreezingGracePeriod[3]; /*694 - 3 */ /*Ver 4.4; Customer Level Acc freezing grace period */
	char	telOffAreaCode[4];	/*697- 4 */
	char	telOffNo[10];		/*701- 10*/
	char	telOffExt[4];		/*711- 4 */
	char	telHomeAreaCode[4];	/*715- 4 */
	char	telHomeNo[10];		/*719- 10*/
	char	telHomeExt[4];		/*729- 4 */
	char	faxAreaCode[4];		/*733- 4 */
	char	faxNo[10];			/*737- 10*/
	char	faxExt[4];			/*747- 4 */
	char	mobileNo[10];		/*751- 10*/
	char	pagerNo[10];		/*761- 10*/
	char	eMail[30];			/*771- 30*/
	char	educationCode[2];	/*801- 2 */
	char	professionCode[2];	/*803- 2 */
	char	positionCode[2];	/*805- 2 */
	char	monthlyIncome[2];	/*807- 2 */
	char	ownerShip[10];		/*809- 10*/
	char	segmentation;		/*819- 1 */
	char	employerName[30];	/*820- 30*/
	char	department[20];		/*850- 20*/
	char	employerPoBox[10];	/*870- 10*/
	char	employerCity[20];	/*880- 20*/
	char	employerZipCode[10];/*900- 10*/
	char	documents[7];		/*910- 7*/
	char	custUpdActionDate[8];/*917- 8*/ /* Ver 4.4 */
	char	documentOther[50];	/*925- 50*/
	char	singleJointAcc;	    /*975- 1 */	/*0-single;1-joint*/
	char	packageAcc;			/*976- 1 */ /* 0 - None
											   1 - Munafa
											   2 - Wahat 
											   3 - Al Safwa
											   4 - Mubarak
											   5 - Private Banking 
											*/
	char	noOfJointCustomer[2];/*977 -2*/
	char	jointAccNameOnCheck[60];	/*979- 60*/
	char	jointAccNameOnReports[30];	/*1039-30*/
	char	signatureNature;	 		/*1069-1*/ /*0-single;1-joint*/
	char	custType;					/*1070-1*/ /*0-Consumer;1-Commercial;2-Corporate*/
	char	nameChanged;				/*1071-1*/ /*0-NO; 1-YES*/
	char	addressChanged;				/*1072-1*/ /*0-NO; 1-YES*/
	char	incorrectName;				/*1073-1*/ /*0-NO; 1-YES; populated during migration*/
	char	custOpenDate[8];			/*1074-8*/
	char	lastUpdateBmDate[8];		/*1082-8*/
	char	internetBankAcc;			/*1090-1*/ /*0-NO; 1-YES*/
	char	custAdviceFlag;				/*1091-1*/ /*0-NO; 1-YES*/
	char	altBranchCode[4];			/*1092-4*/
	char	orgAlphaSearchCode[6];		/*1096-6*/
	char	updatedForSama;				/*1102-1*/ /*0-NO; 1-YES*/
	char	relationshipManager[25];	/*1103-25*/
	char	generalMemo[25];			/*1128-25*/

	char	samaMainCategory[2];		/*1153-2*/
	char	samaSubCategory[2]; 		/*1155-2*/
	char	passportNo[15];				/*1157-15*/
	char	hafizaNo[15];				/*1172-15*/
	char	familyRegnNo[15];			/*1187-15*/
	char	licenseNo[15];				/*1202-15*/
	char	samaAuthNo[15];				/*1217-15*/
	char 	diplomaticCardNo[15];		/*1232-15*/
	char	visaNo[15];					/*1247-15*/
	char	contractNo[15];				/*1262-15*/
	char	homeCountryId[15];			/*1277-15*/
	char	certificateOfBirthNo[15];	/*1292-15*/
	char	interGroupAccNo[14];		/*1307-14*/
	char	specialRefNo[15];			/*1321-15*/
	char	purposeOfAccount[50];		/*1336-50*/
	char	govtShareHoldingPerc[3];	/*1386-3*/
	char	saudiShareHoldingPerc[3];	/*1389-3*/
	char	foreignShareHoldingPerc[3];	/*1392-3*/
	char	documentsSupplied[60];		/*1395-60*/  /* 20 documents of 3 byte code */
	char	overrideForCList;			/*1455-1*/
	char	overrideForNonSaudi;		/*1456-1*/
	char	overrideForNoSamaAuth;		/*1457-1*/
	char	overrideForExistingCust;    /*1458-1*/ 
	char	minorOrMajor;				/*1459-1*/ /* 0-Major ; 1-Minor */
	char	childWithSpecialCase;		/*1460-1*/ /* 0-No    ; 1-Yes   */
	char	idExpiryActionNotReqd;		/*1461-1*/ /* 0-No    ; 1-Yes   */
	char	referenceReqdFor[10];		/*1462-10*/ 
													/* Reference for
												POS		1 - Blind person 
												POS		2 - Veiled woman
												POS		3 - Incompetent person
												POS		4 - Minor
												POS		5 - Minor with special circumstances
												POS		6 - Mentally disabled 
													  */
	char	createdFromQuickScreen;		/*1472-1*/ /* 0-No; 1-Normal customer; 2-Internal customer; 3-Pension Customer  */			/* Ver 4.1 */
	char	marketingMemo[25];			/*1473-25*/ /* General memo for marketing */
	char	custOpenSource;				/*1498-1*/ /* P-customer created through phone; B-created through branch; O-Created Online */
	char	excludeFromAtmFees;			/*1499-1*/ /*0-No ; 1-YES */
	char	excludeFromMinBalFees;		/*1500-1*/ /*0-No ; 1-YES */
	char	pkgStmtFreqOverride;		/*1501-1*/ /*0-No ; 1-YES */
	char	lastUpdateUser[10];			/*1502-10*/
	char	succDeedNo[10];				/*1512-10*/
	char	lastUpdateDateTime[14];		/*1522-14*/
	char	filler20[1000];				/*1536-1000*/
};

struct customerReferenceInfo
{
	char	liveChar;					/* 0   - 1 */
	char	custNo[7];					/* 1   - 7 */
	char	referenceNo[4];				/* 8   - 4 */
	char	referenceReqdFor[10];		/* 12  - 10*/ 
													/* Reference for
												POS		1 - Blind person 
												POS		2 - Veiled woman
												POS		3 - Incompetent person
												POS		4 - Minor
												POS		5 - Minor with special circumstances
												POS		6 - Mentally disabled 
													  */
	char	referenceType;				/* 22  -  1*/ /* 0 - Personal reference
														 1 - Legal representative
														 2 - Foster parents
														 3 - Guardian
													 */
	char	aFirstName[15];				/* 23  - 15*/
	char	aSecondName[15];			/* 38  -  15*/
	char	aThirdName[15];				/* 53  -  15*/
	char	aLastName[15];				/* 68  -  15*/
	char	aShortName[30];				/* 83  -  30*/	
	char	eFirstName[15];				/* 113 - 15*/
	char	eSecondName[15];			/* 128 - 15*/
	char	eThirdName[15];				/* 143 - 15*/
	char	eLastName[15];				/* 158 - 15*/
	char	eShortName[30];				/* 173 - 30*/
	char	idType;						/* 203 - 1*/ /* I - Saudi Id ; Q - Iqama ; P - Passport */
	char	idNo[15];					/* 204 - 15*/
	char	activeStatus;				/* 219 -  1*/ /*0-Invalid ; 1-Valid*/
	char	disabledDate[8];			/* 220 -  8*/
	char	lastUpdateBmDate[8];		/* 228 -  8*/
	char	branchCode[4];				/* 236 -  4*/
	char	custOpenSource;				/* 240 -  1*//* P-customer created through phone; OtherValue-created through branch */
	char	filler1[223];				/* 241 - 223*/
	char	createdUserId[10];			/* 464 - 10*/
	char	createdDateTime[14];		/* 474 - 14*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler[128];				/* 512 - 128*/
};

struct branchActivityOnCustRef
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	newOrUpdate;				/* 29 - 1*/ /* N - New ; U - Update */
	char	bmUpdateStatus;				/* 30 - 1*/ /* 1 - Pending with supervisor
													   2 - Pending with CSO
													   3 - Rejected    
													   9 - Completed
													*/
	char	custNo[7];					/* 31 - 7*/
	char	referenceNo[4];				/* 38 - 4*/
	char	referenceReqdFor[10];		/* 42 - 10 */
													/* Reference for
														1 - Blind person 
														2 - Veiled woman
														3 - Incompetent person
														4 - Minor
														5 - Minor with special circumstances
														6 - Mentally disabled 
													  */
	char	referenceType;				/* 52 - 1*/  /* 
														0-Personal Reference 												  
														1-Legal reporesentative
														2-Foster parents
														3-Guardian
													 */
	char	supervisorId[10];			/* 53 - 10*/
	char	custBranchCode[4];			/* 63 - 4*/
	char	aFirstName[15];				/* 67 - 15*/
	char	a2ndName[15];				/* 82 - 15*/
	char	a3rdName[15];				/* 97 - 15*/
	char	aLastName[15];				/* 112 - 15*/
	char	aShortName[30];				/* 127 - 30*/	
	char	eFirstName[15];				/* 157 - 15*/
	char	e2ndName[15];				/* 172 - 15*/
	char	e3rdName[15];				/* 187 - 15*/
	char	eLastName[15];				/* 202 - 15*/
	char	eShortName[30];				/* 217 - 30*/
	char	idType;						/* 247 - 1*/ /* I - Saudi ID ; Q - Iqama ; P - passport */
	char	idNo[15];					/* 248 - 15*/
	char	referenceStatus;			/* 263 - 1*/
	char	referenceDisableDate[8];	/* 264 - 8*/
	char	lastUpdateBmDate[8];		/* 272 - 8*/
	char	recordChanged;				/* 280 - 1*/ /* Y-changed ; N-Not changed */
	char	custOpenSource;				/* 281 - 1*/ /* P-customer created through phone; otherValue-created through branch */
	char	filler1[206];				/* 282 - 206*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler[128];				/* 512 - 128*/
};

struct branchActivityOnOwner
{
	char	liveChar;					/* 0  -  1*/
	char	branchCode[4];				/* 1  -  4*/
	char	userId[10];					/* 5  - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	newOrUpdate;				/* 29 -  1*/
	char	custNo[7];					/* 30 -  7*/
	char	ownerNo[4];					/* 37 -  4*/
	char	ownerType;					/* 41 -  1*/ /* M-Manager; T-Trustee; C-Cashier; W-Owners */
	char	bmUpdateStatus;				/* 42 -  1*/
	char	supervisorId[10];			/* 43 - 10*/ 
	char	custBranchCode[4];			/* 53 -  4*/
	char	idType;						/* 57 -  1*/
	char	idNo[15];					/* 58 - 15*/
	char	parentCompanyName[30];		/* 73 - 30*/
	char	shareHoldingPerc[3];		/* 103-  3*/
	char	aFirstName[15];				/* 106- 15*/
	char	a2ndName[15];				/* 121- 15*/
	char	a3rdName[15];				/* 136- 15*/
	char	aLastName[15];				/* 151- 15*/
	char	aShortName[30];				/* 166- 30*/
	char	eFirstName[15];				/* 196- 15*/
	char	e2ndName[15];				/* 211- 15*/
	char	e3rdName[15];				/* 226- 15*/
	char	eLastName[15];				/* 241- 15*/
	char	eShortName[30];				/* 256- 30*/
	char	ownerEnabled;				/* 286-  1*/ /* 0-No ; 1-Yes */
	char	lastUpdateBmDate[8];		/* 287-  8*/
	char	recordChanged;				/* 295-  1*/ /* Y - Changed ; N - Not changed */
	char	filler[192];				/* 296- 192*/
	char	lastUpdateUser[10];			/* 488- 10*/
	char	lastUpdateDateTime[14];		/* 498- 14*/
	char	filler1[128];				/* 512- 128*/
};

struct ownerInfo
{
	char	liveChar;					/* 0  -  1*/
	char	custNo[7];					/* 1  -  7*/
	char	ownerNo[4];					/* 8  -  4*/
	char	ownerType;					/* 12 -  1*/ /* M-Manager
														T-Trustee
														C-Cashier
														W-Owners
													 */
	char	idType;						/* 13 -  1*/ /* I - Saudi Id
														Q - Iqama
														C - CR Number
														F - Family Regn no
														H - Hafiza 
													 */
	char	idNo[15];					/* 14 - 15*/
	char	parentCompanyName[30];		/* 29 - 30*/
	char	shareHoldingPerc[3];		/* 59 -  3*/
	char	aFirstName[15];				/* 62 - 15*/
	char	aSecondName[15];			/* 77 - 15*/
	char	aThirdName[15];				/* 92 - 15*/
	char	aLastName[15];				/* 107- 15*/
	char	aShortName[30];				/* 122- 30*/
	char	eFirstName[15];				/* 152- 15*/
	char	eSecondName[15];			/* 167- 15*/
	char	eThirdName[15];				/* 182- 15*/
	char	eLastName[15];				/* 197- 15*/
	char	eShortName[30];				/* 212- 30*/
	char	ownerEnabled;				/* 242-  1*/ /* 0-No;1-Yes*/
	char	lastUpdateBmDate[8];		/* 243-  8*/
	char	branchCode[4];				/* 251-  4*/
	char	cbsOwnerCifNo[8];			/* 255-  8*/
	char	filler[201];				/* 263- 201*/
	char	createdUserId[10];			/* 464- 10*/
	char	createdDateTime[14];		/* 474- 14*/
	char	lastUpdateUser[10];			/* 488- 10*/
	char	lastUpdateDateTime[14];		/* 498- 14*/
	char	filler1[50];				/* 512- 50*/
};

struct branchActivityOnSignatory
{
	char	liveChar;					/* 0  -   1*/
	char	branchCode[4];				/* 1  -   4*/
	char	userId[10];					/* 5  -  10*/	
	char	dateTime[14];				/* 15 -  14*/
	char	newOrUpdate;				/* 29 -   1*/ /* N - New ; U -Update*/
	char	accNo[14];					/* 30 -  14*/
	char	signatoryNo[4];				/* 44 -   4*/
	char	bmUpdateStatus;				/* 48 -   1*/
	char	custBranchCode[4];			/* 49 -   4*/
	char	supervisorId[10];			/* 53 -  10*/
	char	idType;						/* 63 -   1*/
	char	idNo[15];					/* 64  - 15*/
	char	aFirstName[15];				/* 79  - 15*/
	char	a2ndName[15];				/* 94  - 15*/
	char	a3rdName[15];				/* 109 - 15*/
	char	aLastName[15];				/* 124 - 15*/
	char	aShortName[30];				/* 139 - 30*/
	char	eFirstName[15];				/* 169 - 15*/
	char	e2ndName[15];			 	/* 184 - 15*/
	char	e3rdName[15];				/* 199 - 15*/
	char	eLastName[15];				/* 214 - 15*/
	char	eShortName[30];				/* 229 - 30*/
	char	diplomaticPpNo[15];			/* 259 - 15*/
	char	reason[25];					/* 274 - 25*/
	char	activeStatus;				/* 299 -  1*/ /* 0-Inactive ; 1-Active */
	char	signatureActionDate[14];	/* 300 - 14*/
	char	lastUpdateBmDate[8];		/* 314 - 8*/
	char	recordChanged;				/* 322-  1*/ /* Y - Changed ; N - Not changed */
	char	signatoryForOthers;			/* 323 - 1 */ /* 1-YES ; 0-NO */	
	char	overrideOtherExpatSign;		/* 324 - 1 */ /* 1-YES ; 0-NO */	
	char	filler[163];				/* 325 - 163*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler1[128];				/* 512 - 128*/
};

struct signatoryInfo
{
	char	liveChar;					/* 0  -   1*/
	char	accNo[14];					/* 1  -  14*/
	char	signatoryNo[4];				/* 15 -   4*/
	char	idType;						/* 19 -   1*/
	char	idNo[15];					/* 20  - 15*/
	char	aFirstName[15];				/* 35  - 15*/
	char	aSecondName[15];			/* 50  - 15*/
	char	aThirdName[15];				/* 65  - 15*/
	char	aLastName[15];				/* 80  - 15*/
	char	aShortName[30];				/* 95  - 30*/
	char	eFirstName[15];				/* 125 - 15*/
	char	eSecondName[15];			/* 140 - 15*/
	char	eThirdName[15];				/* 155 - 15*/
	char	eLastName[15];				/* 170 - 15*/
	char	eShortName[30];				/* 185 - 30*/
	char	diplomaticPpNo[15];			/* 215 - 15*/
	char	reason[25];					/* 230 - 25*/
	char	activeStatus;				/* 255 -  1*/ /* 0-Inactive ; 1-Active */
	char	signatureActionDate[8];		/* 256 -  8*/
	char	lastUpdateBmDate[8];		/* 264 -  8*/
	char	branchCode[4];				/* 272 -  4*/
	char	overrideOtherExpatSign;		/* 276 - 1 */ /* 1-YES ; 0-NO */	
	char	filler[187];				/* 277 - 187*/
	char	createdUserId[10];			/* 464 - 10*/
	char	createdDateTime[14];		/* 474 - 14*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler1[50];				/* 512 - 50*/
};

struct accountInfo
{
	char	liveChar;			/* 0 - 1 */
	char	accNo[14];			/* 1 - 14*/
	char	branchCode[4];		/*15 - 4 */
	char	createdUserId[10];	/*19 - 10*/
	char	filler4[10];		/*29 - 10*/
	char	createdDateTime[14];/*39 - 14*/
	char	accStatus[2];		/*53 - 2 */
	char	statementFreq[2];	/*55 - 2 */
	char	checkBook;			/*57 - 1 */
	char	accOpenDate[8];		/*58 - 8 */
	char	lastUpdateBmDate[8];/*66 - 8 */
	char	filler1[404];		/*74 -404*/
	char	lastUpdateUser[10];	/*478- 10*/
	char	filler5[10];		/*488- 10*/
	char	lastUpdateDateTime[14]; /*498- 14*/
};

struct jointAccountInfo
{
	char	liveChar;			/* 0 - 1 */
	char	custNo[7];			/* 1 - 7 */
	char	filler1[7];			/* 8 - 7 */
	char	jointCustNo[2];		/*15 - 2 */
	char	branchCode[4];		/*17 - 4 */
	char	createdUserId[10];	/*21 - 10*/
	char	filler4[10];		/*31 - 10*/
	char	createdDateTime[14];/*41 - 14*/
	char	idNo[15];			/*55 - 15*/
	char	idType;				/*70 - 1 */
	char	idIssuedAt[20];		/*71 - 20*/
	char	idDateType;			/*91 - 1 */
	char	idIssueDateH[8];	/*92 - 8 */
	char	idIssueDateG[8];	/*100- 8 */
	char	idExpiryDateH[8];	/*108- 8/*/
	char	idExpiryDateG[8];	/*116- 8 */
	char	preferredLang;		/*124- 1 */
	char	nationality[3];		/*125- 3 */
	char	filler2[17];		/*128- 17*/
	char	titleCode[2];		/*145- 2 */
	char	dobDateType;		/*147- 1 */
	char	dobDateH[8];		/*148- 8 */
	char	dobDateG[8];		/*156- 8 */
	char	sexCode;			/*164- 1 */
	char	vipCode;			/*165- 1 */
	char	marritalStatus;		/*166- 1 */
	char	noOfDependents[2];	/*167- 2 */
	char	residentStatus;		/*169- 1 */
	char	businessType[3];	/*170- 3 */
	char	filler;				/*173- 1 */
	char	aFirstName[15];		/*174- 15*/
	char	a2ndName[15];		/*189- 15*/
	char	a3rdName[15];		/*204- 15*/
	char	aLastName[15];		/*219- 15*/
	char	aShortName[30];		/*234- 30*/
	char	eFirstName[15];		/*264- 15*/
	char	e2ndName[15];		/*279- 15*/
	char	e3rdName[15];		/*294- 15*/
	char	eLastName[15];		/*309- 15*/
	char	eShortName[30];		/*324- 30*/
	char	address1[30];		/*354- 30*/
	char	address2[30];		/*384- 30*/
	char	poBox[10];			/*414- 10*/
	char	cityName[20];		/*424- 20*/
	char	zipCode[10];		/*444- 10*/
	char	country[3];			/*454- 3 */
	char	addressType;		/*457- 1 */ /* 0-PO Box ; 1-Saudi Post */
	char	gprsNo[8];			/*458- 8 */ /* Added for saudi post enhancement */
	char	unitNo[5];			/*466- 5 */ /* Added for saudi post enhancement */
	char	filler5[3];		/*471- 3*/
	char	telOffAreaCode[4];	/*474- 4 */
	char	telOffNo[10];		/*478- 10*/
	char	telOffExt[4];		/*488- 4 */
	char	telHomeAreaCode[4];	/*492- 4 */
	char	telHomeNo[10];		/*496- 10*/
	char	telHomeExt[4];		/*506- 4 */
	char	faxAreaCode[4];		/*510- 4 */
	char	faxNo[10];			/*514- 10*/
	char	faxExt[4];			/*524- 4 */
	char	mobileNo[10];		/*528- 10*/
	char	pagerNo[10];		/*538- 10*/
	char	eMail[30];			/*548- 30*/
	char	educationCode[2];	/*578- 2 */
	char	professionCode[2];	/*580- 2 */
	char	positionCode[2];	/*582- 2 */
	char	monthlyIncome[2];	/*584- 2 */
	char	ownerShip[10];		/*586- 10*/
	char	segmenation;		/*596- 1 */
	char	employerName[30];	/*597- 30*/
	char	department[20];		/*627- 20*/
	char	employerPoBox[10];	/*647- 10*/
	char	employerCity[20];	/*657- 20*/
	char	employerZipCode[10];/*677- 10*/
	char	jointOpenDate[8];   /*687-  8*/
	char	lastUpdateBmDate[8];/*695-  8*/
	char	activeStatus;		/*703-  1*/ /* 0-Invalid ; 1-Valid */
	char	custOpenSource;		/*704 - 1*/ /* P-Phone ; */
	char	cbsJointCifNo[8];	/*705-  8*/
	char	filler3[277];		/*713-277*/
	char	lastUpdateUser[10];	/*990- 10*/
	char	filler6[10];		/*1000-10*/
	char	lastUpdateDateTime[14]; /*1010-14*/
	char	filler10[128];
};

struct branchActivityOnCard 
{
	char	liveChar;					 /*0  - 1*/
	char	branchCode[4];				 /*1  - 4*/   
	char	userId[10];					 /*5  - 10*/  
	char	dateTime[14];				 /*15 - 14*/  
	char	newOrUpdate;				 /*29 - 1*/
	char	bmUpdateStatus;				 /*30 - 1*/ /* 1 - Pending with 
																	Supervisor 
												       2 - Pending with CSO
													   3 - Rejected 
													   9 - Completed */
	char	supervisorId[10];			 /*31 - 10*/
	char	cardNo[19];					 /*41 - 19*/
	char	requestStatus;				 /*60 - 1*//*0-Requested;1-Approved
										   		     2-Processed;
													 3-GeneratedAtDc9000
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	cardType;					 /*61 - 1*//*R-Regular;I-International
											 		 V-VIP;A-Administrative;
													 D-Deposit only, C-CPS
													 S-International chip card;
													 L-Local chip card */
	char	newOrReplacement;			 /*62 - 1*//*N-New; R-Replacement*/
	char	primaryOrSupplementary;		 /*63 - 1*//*P-Primary;S-Secondary*/
	char	cardStatus;					 /*64 - 1*//*0-Requested;1-Open;2-Lost
										        	 3-Stolen;4-Restricted;
													 9-Closed/Damaged*/
	char	regionCode;					 /*65 - 1*//*1-Central;2-West;3-East*/
	char	bmAccNo[14];				 /*66 - 14*/
	char	languageCode;				 /*80 - 1*//*ATM screen language
													0-Arabic
													1-English
													2-Arabic/English
													*/
	char	customerBranch[4];			 /*81 - 4*/
	char	nameOnTheCard[26];			 /*85 - 26*/
	char	address1[30];				 /*111 - 30*/
	char	address2[30];				 /*141 - 30*/
	char	poBox[10];					 /*171 - 10*/
	char	cityName[20];				 /*181 - 20*/
	char	zipCode[10];				 /*201 - 10*/
	char	firstIssueDate[8];			 /*211 - 8*/
	char	renewalDate[8];				 /*219 - 8*/ /* will be issue date for new cards */
	char	expireDate[8];				 /*227 - 8*/
	char	rejectedDate[8];			 /*235 - 8*/
	char	rejectedUserId[10];			 /*243 - 10*/
	char	rejectedReason[20];			 /*253 - 20*/
	char	deactivationDate[8];		 /*273 - 8*/
	char	deactivationUserId[10];		 /*281 - 10*/
	char	titleCode[2];				 /*291 - 2*/
	char	idNo[15];					 /*293 - 15*/
	char	deliveryToBranchOrPO;		 /*308 - 1*//*B-Branch; P-PO Box*/
	char	pinOffset[4];				 /*309 - 4*/
	char	encryptedPin[5];			 /*313 - 5*/
	char	cvv[3];						 /*318 - 3*/
	char	pvv[4];						 /*321 - 4*/
	char	requestType;				 /*325 - 1*//* 0 - Initial Card 
													   1 - Renewal
													   2 - Force Card
													   3 - Force Pin
													   4 - Deactivation
													   5 - Activation
													   6 - Change Address
													   7 - Restrictioin
													   8 - Unrestriction
													   C - Converted to Intl card
													   9 - Rejected
													*/
	char	pinRequestStatus;			 /*326 - 1*//*0-Requested;1-Approved
												     2-Processed;
													 3-GeneratedAtDc9000
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	cardGeneratedDate[8];		 /*327 - 8*/
	char	cardGeneratedUserId[10];	 /*335 - 10*/
	char	cBranchReceiptDate[8];		 /*345 - 8*/
	char	cBranchReceiptUserId[10];    /*353 - 10*/
	char	cCustIssueDate[8];			 /*363 - 8*/
	char	cCustIssueUserId[10];		 /*371 - 10*/
	char	pinGeneratedDate[8];		 /*381 - 8*/
	char	pinGeneratedUserId[10];		 /*389 - 10*/
	char	pBranchReceiptDate[8];		 /*399 - 8*/
	char	pBranchReceiptUserId[10];	 /*407 - 10*/
	char	pCustIssueDate[8];			 /*417 - 8*/
	char	pCustIssueUserId[10];		 /*425 - 10*/
	char	branchEncryptedPin[4];		 /*435 - 4 */
	char	filler2[3];					 /*439 - 3*/
	char	supervisorComments[200];	 /*442 - 200*/
	char	branchPinSelect;			 /*642 - 1*/  /* Y - Pin select successful from branch */
													  /* N - Pin select failure from branch */
	char	branchCardPrdn;				 /*643 - 1*/  /* Y - Card print successful from branch */
													  /* N - Card print failure from branch */
	char	rejectedTime[6];			 /*644 - 6*/
	char	cardGeneratedTime[6];		 /*650 - 6*/
	char	cBranchReceiptTime[6];		 /*656 - 6*/
	char	cCustIssueTime[6];			 /*662 - 6*/
	char	pinGeneratedTime[6];		 /*668 - 6*/
	char	pBranchReceiptTime[6];		 /*674 - 6*/
	char	pCustIssueTime[6];			 /*680 - 6*/
	char	deactivatedTime[6];			 /*686 - 6*/
	char	restrictedReason;			 /*692 - 1*/ /* 1 - Restricted with Warning for SAMA; 
										 			    2 - Restricted with card blocking
													    0 - Not Restricted for SAMA requirement
													*/
	char	deactivationType;			 /*693 - 1*/ /* L - Lost; S-Stolen; D-Damaged */
	char	oldCardNo[19];				 /*694 - 19*/
	char	oldExpiryDate[4];			 /*713 - 4 */
	char	filler[13];				     /*717 - 13*/
	char	lastUpdateUser[10];	 		 /*730 - 10*/
	char	lastUpdateDateTime[14];		 /*740 - 14*/
	char	processDateTime[14];		 /*754 - 14*/
	char	pbfAccNo[19];				 /*768 - 19*/ /* Added for CBS-interim solution */
	char	filler1[300];				 /*787 - 300*/ /* currently the file size is 820 bytes */
};

struct cardInfoBm 
{
	char	liveChar;					/*0   - 1*/
	char	processDateTime[14];		/*1   -14*/
	char	cardNo[19];					/*15  -19*/
	char	requestDateTime[14];		/*34  -14*/
	char	requestStatus;				/*48  - 1*//*0-Requested;1-Approved
												     2-Processed;
													 3-GeneratedAtDc9000
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	requestBranch[4];			/*49  - 4*/
	char	requestUserId[10];			/*53  - 10*/
	char	cardType;					/*63  - 1*//*R-Regular;I-International
													 V-VIP;A-Administrative;
													 D-Deposit only;C-CPS
													 S-International Chip Card;
													 L-Local Chip card */
	char	newOrReplacement;			/*64  - 1*//*N-New; R-Replacement*/
	char	primaryOrSupplementary;		/*65  - 1*//*P-Primary;S-Supplementary*/
	char	cardStatus;					/*66  - 1*//* 0-Requested;1-Open;
													  2-Lost
										              3-Stolen;
													  4-Restricted;
													  9-Closed/Damaged*/
	char	regionCode;					/*67  - 1*//*1-Central;2-West;3-East*/
	char	bmAccNo[14];				/*68  - 14*/
	char	languageCode;				/*82  - 1*//*ATM screen language
													0-Arabic
													1-English
													2-Arabic/English
													*/
	char	customerBranch[4];			/*83  - 4*/
	char	nameOnTheCard[26];			/*87  -26*/
	char	address1[30];				/*113 -30*/
	char	address2[30];				/*143 -30*/
	char	poBox[10];					/*173 -10*/
	char	cityName[20];				/*183 -20*/
	char	zipCode[10];				/*203 -10*/
	char	firstIssueDate[8];			/*213 - 8*/
	char	renewalDate[8];				/*221 - 8*/ /* will be issue date for new cards */
	char	expireDate[8];				/*229 - 8*/
	char	rejectedDate[8];			/*237 - 8*/
	char	rejectedUserId[10];			/*245 -10*/
	char	rejectedReason[20];			/*255 -20*/
	char	deactivationDate[8];		/*275 - 8*/
	char	deactivationUserId[10];		/*283 -10*/
	char	titleCode[2];				/*293 - 2*/
	char	idNo[15];					/*295 - 15*/
	char	deliveryToBranchOrPO;		/*310 - 1*//*R-Request Branch; 
													 C-Customer Branch; 
													 P-PO Box ;
													 G-GPS    ;
												   */
	char	pinOffset[4];				/*311 - 4*/
	char	encryptedPin[5];			/*315 - 5*/
	char	cvv[3];						/*320 - 3*/
	char	pvv[4];						/*323 - 4*/
	char	requestType;				/*327 - 1*/ /* 0 - Initial Card 
													   1 - Renewal
													   2 - Force Card
													   3 - Force Pin
													   4 - Deactivation
													   5 - Activation
													   6 - Change Address
													   7 - Restrictioin
													   8 - Unrestriction
													   C - Converted to Intl card
													   9 - Rejected
													*/
	char	pinRequestStatus;			/*328 - 1*//*
													 0-Requested;1-Approved
												     2-Processed;
													 3-Printed at HSM
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	cardGeneratedDate[8];		/*329 - 8*/
	char	cardGeneratedUserId[10];	/*337 - 10*/
	char	cBranchReceiptDate[8];		/*347 - 8*/
	char	cBranchReceiptUserId[10];   /*355 - 10*/
	char	cCustIssueDate[8];			/*365 - 8*/
	char	cCustIssueUserId[10];		/*373 - 10*/
	char	pinGeneratedDate[8];		/*383 - 8*/
	char	pinGeneratedUserId[10];		/*391 - 10*/
	char	pBranchReceiptDate[8];		/*401 - 8*/
	char	pBranchReceiptUserId[10];	/*409 - 10*/
	char	pCustIssueDate[8];			/*419 - 8*/
	char	pCustIssueUserId[10];		/*427 - 10*/
	char	firstUsedDate[6];			/*437 - 6 */
	char	lastUsedDate[6];			/*443 - 6 */
	char	source;						/*449 - 1 */ /* S - Static 
														C - CPDB
														M - MAO
														A - A2000
													 */
	char 	convertedFlag;				/*450 - 1 */ /* 0 - No ; 1 - Yes */ 
	char	oldCardNo[19];				/*451 - 19*/ 					
	char	branchPinSelect;			/*470 - 1*/  /* Y - Pin select successful from branch */
										  		     /* N - Pin select failure from branch */
	char	branchCardPrdn;				/*471 - 1*/  /* Y - Card print successful from branch */
													 /* N - Card print failure from branch */
	char	b24CardType[2];				/*472 - 2*/  /*P,PA,P1,P2, etc*/
	char	requestFromClo;				/*474 - 1*//* 1 - Request from CLO ; 
												      0 - Request from Branch 
												   */
	char	restrictedReason;			/*475 - 1*/ /* 1 - Restricted with Warning for SAMA; 
													   2 - Restricted with card blocking
													   0 - Not Restricted for SAMA requirement
													*/
	char	yearCharged[4];				/*476 - 4 */ /* YYYY */
	char	oldExpiryYear[4];			/*480 - 4 */
	char	newPensCardGenerated;		/*484 - 1 */
	char	cvv2[3];				    /*485 - 3*/
	char	lastUpdateUser[10];			/*488 - 10*/
	char	lastUpdateDateTime[14];		/*498 -14*/
	char	deactivationType;			/*512 - 1*/ /* L - Lost; S-Stolen; D-Damaged */
	char	prvChargedDate[8];			/*513 -8*/ /* ATM annual card fee charged date (previous run date)*/
	char	chargedDate[8];			    /*521 -8*/ /* ATM annual card fee charged date */
	char	deliveryFlag;				/*529 -1*/ /* deliveryToBranchOrPO is copied here whenever a
													  card is requested/force card/renewed */
	char	deliveryBranchCode[4];		/*530 -4*/ /* If the card is delivered to branch(request/customer branch), 
													  the corresponding delivery branch code is copied here for the
													  branch to update the receipt of the card */
	char	cpsCorpName[30];			/*534 -30*/  /* used for payroll cards */
	char	empNo[15];					/*564 -15*/  /* used for payroll cards */
	char	oldExpiryDate[4];			/*579 -4 */  /* YYMM *//* For the SCM replacement card,it will have old card's expiry date */
	char	pbfAccNo[19];				/*583 -19*/
	char	filler1[10];				/*702 -10*/
	char 	filler2[300]; /* Just for extra buffer */
};

struct cardInfo  /* cbcardtab */
{
	char	liveChar;					/*0   - 1*/
	char	processDateTime[14];		/*1   -14*/
	char	cardNo[19];					/*15  -19*/
	char	requestDateTime[14];		/*34  -14*/
	char	requestStatus;				/*48  - 1*//*0-Requested;1-Approved
												     2-Processed;
													 3-GeneratedAtDc9000
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	requestBranch[4];			/*49  - 4*/
	char	requestUserId[10];			/*53  - 10*/
	char	cardType;					/*63  - 1*//*R-Regular;I-International
													 V-VIP;A-Administrative;
													 D-Deposit only;C-CPS
													 S-International Chip Card;
													 L-Local Chip card */
	char	newOrReplacement;			/*64  - 1*//*N-New; R-Replacement*/
	char	primaryOrSupplementary;		/*65  - 1*//*P-Primary;S-Supplementary*/
	char	cardStatus;					/*66  - 1*//* 0-Requested;1-Open;
													  2-Lost
										              3-Stolen;
													  4-Restricted;
													  9-Closed/Damaged*/
	char	regionCode;					/*67  - 1*//*1-Central;2-West;3-East*/
	char	bmAccNo[14];				/*68  - 14*/
	char	languageCode;				/*82  - 1*//*ATM screen language
													0-Arabic
													1-English
													2-Arabic/English
													*/
	char	customerBranch[4];			/*83  - 4*/
	char	nameOnTheCard[26];			/*87  -26*/
	char	address1[30];				/*113 -30*/
	char	address2[30];				/*143 -30*/
	char	poBox[10];					/*173 -10*/
	char	cityName[20];				/*183 -20*/
	char	zipCode[10];				/*203 -10*/
	char	firstIssueDate[8];			/*213 - 8*/
	char	renewalDate[8];				/*221 - 8*/ /* will be issue date for new cards */
	char	expireDate[8];				/*229 - 8*/
	char	rejectedDate[8];			/*237 - 8*/
	char	rejectedUserId[10];			/*245 -10*/
	char	rejectedReason[20];			/*255 -20*/
	char	deactivationDate[8];		/*275 - 8*/
	char	deactivationUserId[10];		/*283 -10*/
	char	titleCode[2];				/*293 - 2*/
	char	idNo[15];					/*295 - 15*/
	char	deliveryToBranchOrPO;		/*310 - 1*//*R-Request Branch; 
													 C-Customer Branch; 
													 P-PO Box ;
													 G-GPS    ;
												   */
	char	pinOffset[4];				/*311 - 4*/
	char	encryptedPin[5];			/*315 - 5*/
	char	cvv[3];						/*320 - 3*/
	char	pvv[4];						/*323 - 4*/
	char	requestType;				/*327 - 1*/ /* 0 - Initial Card 
													   1 - Renewal
													   2 - Force Card
													   3 - Force Pin
													   4 - Deactivation
													   5 - Activation
													   6 - Change Address
													   7 - Restrictioin
													   8 - Unrestriction
													   C - Converted to Intl card
													   9 - Rejected
													*/
	char	pinRequestStatus;			/*328 - 1*//*
													 0-Requested;1-Approved
												     2-Processed;
													 3-Printed at HSM
													 4-ReceivedByBranch
													 5-ReceivedByCustomer
													 8-Canceled by Branch
													 9-Rejected
													*/
	char	cardGeneratedDate[8];		/*329 - 8*/
	char	cardGeneratedUserId[10];	/*337 - 10*/
	char	cBranchReceiptDate[8];		/*347 - 8*/
	char	cBranchReceiptUserId[10];   /*355 - 10*/
	char	cCustIssueDate[8];			/*365 - 8*/
	char	cCustIssueUserId[10];		/*373 - 10*/
	char	pinGeneratedDate[8];		/*383 - 8*/
	char	pinGeneratedUserId[10];		/*391 - 10*/
	char	pBranchReceiptDate[8];		/*401 - 8*/
	char	pBranchReceiptUserId[10];	/*409 - 10*/
	char	pCustIssueDate[8];			/*419 - 8*/
	char	pCustIssueUserId[10];		/*427 - 10*/
	char	firstUsedDate[6];			/*437 - 6 */
	char	lastUsedDate[6];			/*443 - 6 */
	char	source;						/*449 - 1 */ /* S - Static 
														C - CPDB
														M - MAO
														A - A2000
														F - Initiated from Finacle
													 */
	char 	convertedFlag;				/*450 - 1 */ /* 0 - No ; 1 - Yes */ 
	char	oldCardNo[19];				/*451 - 19*/ 					
	char	branchPinSelect;			/*470 - 1*/  /* Y - Pin select successful from branch */
										  		     /* N - Pin select failure from branch */
	char	branchCardPrdn;				/*471 - 1*/  /* Y - Card print successful from branch */
													 /* N - Card print failure from branch */
	char	b24CardType[2];				/*472 - 2*/  /*P,PA,P1,P2, etc*/
	char	requestFromClo;				/*474 - 1*//* 1 - Request from CLO ; 
												      0 - Request from Branch 
												   */
	char	restrictedReason;			/*475 - 1*/ /* 1 - Restricted with Warning for SAMA; 
													   2 - Restricted with card blocking
													   0 - Not Restricted for SAMA requirement
													*/
	char	yearCharged[4];				/*476 - 4 */ /* YYYY */
	char	oldExpiryYear[4];			/*480 - 4 */
	char	newPensCardGenerated;		/*484 - 1 */
	char	cvv2[3];				    /*485 - 3*/
	char	lastUpdateUser[10];			/*488 - 10*/
	char	lastUpdateDateTime[14];		/*498 -14*/
	char	deactivationType;			/*512 - 1*/ /* L - Lost; S-Stolen; D-Damaged */
	char	prvChargedDate[8];			/*513 -8*/ /* ATM annual card fee charged date (previous run date)*/
	char	chargedDate[8];			    /*521 -8*/ /* ATM annual card fee charged date */
	char	deliveryFlag;				/*529 -1*/ /* deliveryToBranchOrPO is copied here whenever a
													  card is requested/force card/renewed */
	char	deliveryBranchCode[4];		/*530 -4*/ /* If the card is delivered to branch(request/customer branch), 
													  the corresponding delivery branch code is copied here for the
													  branch to update the receipt of the card */
	char	cpsCorpName[30];			/*534 -30*/  /* used for payroll cards */
	char	empNo[15];					/*564 -15*/  /* used for payroll cards */
	char	oldExpiryDate[4];			/*579 -4 */  /* YYMM *//* For the SCM replacement card,it will have old card's expiry date */
	char	coreAccNo[16];				/*583 -16*/
	char	pbfAccNo[19];				/*599 -19*/
	char	coreCustNo[8];				/*618 - 8*/
	char	sequenceNo[10];				/*626 - 10*/ /* Unique sequence number for identifying card in the logs (since card numbers are 
														masked in the log file for PCI compliance*/
	char	filler1[388];				/*636 -388*/
	char 	filler2[200]; /* Just for extra buffer */
};

struct cardControl
{
	char 	liveChar;			/* 0 - 1 */
	char 	runDate[8];			/* 1 - 8 */ /* YYYYMMDD */
	char 	runType;			/* 9 - 1 */ /*R - Regular N - Renewal*/
	char 	regionCode;			/* 10 - 1 *//*blank for Regular process*/
	char	cpdbLoadStatus;		/* 11 - 1 */
	char	testHsmStatus;		/* 12 - 1 */
	char	statmextStatus;		/* 13 - 1 */
	char	cpdbextStatus;		/* 14 - 1 */
	char	gw69Status;			/* 15 - 1 */
	char	renewalStatus;		/* 16 - 1 */
	char	gw67Status;			/* 17 - 1 */
	char 	b24RefreshStatus;	/* 18 - 1 */
	char	cafRefreshStatus;	/* 19 - 1 */
	char 	filler[117];		/* 20 - 117 */	
};

struct bmgw69Exception
{
	char 	liveChar;				/* 0  - 1  */
	char	accNo[14];				/* 1  - 14 */
	char 	runDate[8];				/* 15 - 8  */ /* YYYYMMDD */
	char	feeAmount[14];			/* 23 - 14 */
	char	noOfTimesFailed[3]; 	/* 37 - 3  */
	char	filler[74];				/* 40 - 74 */
	char	lastUpdateDateTime[14]; /* 114 - 14*/
	char 	filler1[100];			
};

struct cardBlkControl
{
	char	liveChar;			/* 0   - 1   */
	char	runDateTime[14];	/* 1   - 14  */
	char	pid[10];			/* 15  - 10  */
	char	inputFileName[200];	/* 25  - 200 */
	char	warnOrBlock;		/* 225 - 1   */ /* 1-Warning ; 2-Blocking */
	char	filler[200];		/* 226 - 200 */
};

struct labelInfo
{
	char	liveChar;  	 	/* 0  - 1 */
	char	labelName[20];  /* 1  - 20*/
	char	stPosition[5];  /* 21 - 5 */
	char	length[2];      /* 26 - 2 */
	char	recType[2];     /* 28 - 2 */
	char	rLen;           /* 30 - 1 */
	char	filler[99];     /* 31 - 99*/
};

struct acctLabelInfo
{
	char	liveChar;  	 	/* 0  - 1 */
	char	labelName[30];  /* 1  - 30*/
	char	stPosition[5];  /* 31 - 5 */
	char	length[2];      /* 36 - 2 */
	char	recType[2];     /* 38 - 2 */
	char	rLen;           /* 40 - 1 */
	char	filler[89];     /* 41 - 89*/
};

struct branchActivityOnSod 
{
	char 	liveChar;					/*0  - 1 */
	char	branchCode[4];				/*1  - 4*/   
	char	userId[10];					/*5  - 10*/ 
	char	dateTime[14];				/*15 - 14*/
	char	newOrUpdate;				/*29 - 1*/ /* N - New    ; U - Update */
	char	bmUpdateStatus;				/*30 - 1*/ /* 1 - Pending with 
																Supervisor 
										              2 - Pending with CSO
													  3 - Rejected 
													  9 - Completed */
	char	supervisorId[10];			/*31 - 10*/
	char	accNo[13];					/*41 - 13 */
	char	filler1[7];					/*54 - 7 */
	char	sodNo[6];					/*61 - 6 */
	char	paymentType;				/*67 - 1 */ /* 0 - Pay Until further 
														   notice
													   1 - Pay until specified 													     	   total has been paid
													   2 - Pay until specified 															   date has been reached
													   3 - Pay until specified 
													       number of payments 
														   have been made
													   4 - Payment stopped
													   5 - Final payment made
													*/
	char	paymentMode;				/*68 - 1 */ /* 0 - Customer is 
														   beneficiary. Pay 
														   from/to account at 
														   our bank
													   1 - Customer is not 
														   beneficiary. Pay 
														   from/to account at 
														   our bank.
													*/
	char	firstPaymentDate[6];		/*69  - 6 */
	char	finalPaymentDate[6];		/*75  - 6 */
	char	paymentsToBeMade[3];		/*81  - 3 */
	char	paymentsMade[3];			/*84  - 3 */
	char	paymentAmt[14];				/*87  - 14*/
	char	totalToPay[14];				/*101 - 14 */
	char	totalPaidToDate[14];		/*115 - 14 */
	char	paymentFrequency;			/*129 - 1 */ /*D - Daily
											 		   W - Weekly
													   M - Monthly
													   Q - Quarterly
													   H - Half yearly
													   Y - Yearly
													*/
	char	nextPaymentDate[6];			/*130- 6 */
	char	limitInExcessFlag;			/*136- 1 */ /* 0 - Pay 
													   1 - Do not pay in limit 
														   excess situation 
													   2 - Manual Run (Allows 
														   payment in limit 
														   excess situation)
													*/
	char	payAccNo[13];				/*137- 13*/
	char	commissionFlag;				/*150-1*/ /* 0 - No commission Charged
													 1 - Commission to be 
														 charged
												  */
	char	orderType;					/*151-1*/ /* 0 - Specific Standing Order
													 1 - Automatic funds 
														 transfer FROM standing 														 order account
													 2 - Automatic funds 
														 transfer TO standing 
														 order account
												  */
	char	processNextDayFlag;			/*152-1*/ /* 0 - Process today, during 
														 today's end-of-day 
														 routine
													 1 - Process next day, 
														 during next day's 
														 start-of-day routine. 
														 (This means an entry is
														 made on the Tag File).
												 */
	char	listOnlyFlag;				/*153-1*/ /* 0 - Process normally and 
														 update.
													 1 - Only list standing 
														 order. Do not update.
												  */
	char	thresholdAmt[10];			/*154-10 redefined field */
	char	drNarrative1[20];			/*164-20*/
	char	drNarrative2[20];			/*184-20*/
	char	crNarrative1[20];			/*204-20*/
	char	crNarrative2[20];			/*224-20*/
	char	transactionDateFlag;		/*244-1*/ /* 0 - Use run date 
													 1 - Use due date
												  */
	char	lastProcessedDate[6];		/*245-6*/ 
	char	sodBranchCode[4];			/*251-4*/
	char	supervisorComments[200];	/*255-200*/
	char	lastUpdateUser[10];			/*455-10*/
	char	lastUpdateDateTime[14];		/*465-14*/
	char	lastUpdateBmDate[8];		/*479-8*/
	char	remarks[25];				/*487-25*/
	char	filler4[50];				/* For future use */
};

struct branchActivityOnStopChq	
{		
	char 	liveChar;			/*0  - 1 */
	char	branchCode[4];		/*1  - 4 */
	char	userId[10];			/*5  - 10*/
	char	dateTime[14];		/*15 - 14*/
	char	newOrUpdate;		/*29 - 1*/ /* N - New    ; U - Update */
	char	bmUpdateStatus;		/*30 - 1*/ /* 1 - Pending with Supervisor 
										      2 - Pending with CSO
											  3 - Rejected 
											  4 - Deleted
											  9 - Completed */
	char	supervisorId[10];	/* 31  - 10*/
	char	recType[2];			/* 41  - 2 */  /* "CH" */
	char	accNo[13];			/* 43  - 13*/
	char	filler1[7];			/* 56  - 7 */
	char	chequeNo[8];		/* 63  - 8 */
	char	filler2[4];			/* 71  - 4 */
	char	amount[14];			/* 75  - 14 */
	char	dateStop[6];		/* 89  - 6 */
	char	payeeName[25];		/* 95  - 25 */
	char	filler3;			/* 120 - 1 */
	char	chequeFrom[8];		/* 121 - 8 */
	char	supervisorComments[200]; /* 129 - 200*/
	char	lastUpdateBmDate[8];/* 329 - 8 */
	char	destroyFlag;		/* 337 - 1 */     /* 1-Destroyed */
	char	filler4[150];		/* 338 - 150 */
	char	lastUpdateUser[10];	/* 488 - 10*/
	char	lastUpdateDateTime[14]; /* 498 - 14*/
};

struct vssControlInfo
{
	char	liveChar;			/* 0 - 1   */
	char	vssFileName[30];	/* 1 - 30  */
	char	processDate[8];		/* 31 - 8  */
	char	trxnRec1[63];		/* 39 - 63 */
	char	trxnRec2[63];		/* 102 - 63*/
	char	filler[91];			/* 165 - 91*/
	char 	filler1[128];		/* 256 - 128*/
};

struct stpenblk
{
	char	liveChar;			/* 0  - 1  */
	char	branchCode[4];		/* 1  - 4  */
	char	custNo[7];			/* 5  - 7  */
	char	frozenStatus;		/* 12 - 1  */
	char	updateDateTime1[14];/* 13 - 14 */
	char	updateDateTime2[14];/* 27 - 14 */
	char	updateDateTime3[14];/* 41 - 14 */
	char	filler[73];			/* 55 - 73*/
};

struct ccblklog
{
	char	liveChar; 					/* 0   -   1 */
	char	branchCode[4];				/* 1   -   4 */
	char	userId[10];					/* 5   -  10 */
	char	dateTime[14];				/* 15  -  14 */
	char	pendingStatus;				/* 29  -   1 */ /*1-Pending with supervisor; 2-Pending with CSO ; 3-Rejected; 9-completed */
	char	supervisorId[10];			/* 30  -  10 */
	char	cardNo[16];					/* 40  -  16 */
	char	bmAccNo[14];				/* 56  -  14 */
	char	action;						/* 70  -   1 */ /* N-New blocking ; A-Amend ; D-Deleted */
	char	blockedAmt[14];				/* 71  -  14 */
	char	oldBlockAmt[14];			/* 85  -  14 */ /* will have value only for action = 'A' */
	char	supervisorComments[200];	/* 99  - 200 */
	char	nameOnTheCard[26];			/* 299 -  26 */
	char	cardInternalStatus;			/* 325 -  1  */
	char	cardExternalStatus;			/* 326 -  1  */
	char	cardOrAcct;					/* 327 -  1  */ /* C-Credit card ; A-Account */
	char	filler[160];				/* 328 - 160 */
	char	lastUpdateUser[10];			/* 488 -  10 */
	char	lastUpdateDateTime[14];		/* 498 -  14 */
	char	filler1[50];				/* 512 -    Record size 512 */
};

struct sadadCtlInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */ 
	char	ctlCode[10];		/* 3 - 10 */
	char	arabicName[50];		/* 13 - 50*/
	char	englishName[50];	/* 63 - 50*/
	char	otherDetails[100];	/*113 -100*/
	char	filler[9];			/*213 -9*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
};

struct sadadConfigInfo
{
	char	liveChar;			/* 0 - 1 */
	char	recType[2];			/* 1 - 2 */  /* SC */
	char	billerId[4];		/* 3 - 4 */
	char	paymentType[4];		/* 7 - 4 */
	char	filler2[2];			/* 11 - 2 */
	char	arabicName[50];		/* 13 - 50*/
	char	englishName[50];	/* 63 - 50*/
	char	reversalAllowed;	/*113 - 1 */ /* 0-NO;1-YES */
	char	otherDetails[99];	/*114 -99*/
	char	filler[9];			/*213 -9*/
	char	lastUpdateUser[20];	/*222- 20*/
	char	lastUpdateDateTime[14]; /*242- 14*/
	char	filler1[100];
};

struct staccblk
{
	char	liveChar; 					/* 0   -   1 */
	char	bmAccNo[14];				/* 1   -  14 */
	char	blockedAmt[14];				/* 15  -  14 */
	char	blockedBmDate[8];			/* 29  -   8 */
	char	requestUserId[10];			/* 37  -  10 */
	char	requestBranch[4];			/* 47  -   4 */
	char	filler[53];				    /* 51  -  53 */
	char	lastBlockedUserId[10];		/* 104 -  10 */
	char	lastBlockedDateTime[14];	/* 114 -  14 */
	char	filler1[50];			    /* 128 -    Record size 128 */
};

struct stusrbrn
{
	char	liveChar;					/* 0  -  1  */
	char	userId[10];					/* 1  -  10 */
	char	noOfBranchesDefined[3];		/* 11 -  3  */
	char	allowedBranch[500][4];		/* 14 -  2000 */  /* Max. 500 branches of 4 characters */
	char	filler[100];				/* 2014 -    Record size 2048 */
};

struct stretmail
{
	char	liveChar;						/* 0 - 1 */
	char	refNo[16];						/* 1 - 16 */ /* YYYYMMDD<C><7digit Sequence number> */
	char	branchCode[4];					/* 17 - 4 */
	char	address1[30];					/* 21 - 30 */
	char	poBox[10];						/* 51 - 10 */
	char	cityName[20];					/* 61 - 20 */
	char	zipCode[10];					/* 81 - 10 */
	char	returnedDate[8];				/* 91 - 8 */
	char	registeredUser[10];				/* 99 - 10 */
	char	registeredBranch[4];			/* 109 - 4 */
	char	returnedReason;					/* 113 - 1 */
	char	custNo[7];						/* 114 - 7  */
	char	productId[20];					/* 121 - 20 */
	char	verficationActionDate[8];		/* 141 - 8 */
	char	verficationActionUser[10];		/* 149 -10 */
	char	verficationActionBranch[4];		/* 159 -4  */
	char	verificationActionTaken;		/* 163 -1 *//* 	0-Pending 
															1-Address different from documents & fixed
															2-Address same; forward to call center */
	char	verificationUserRemarks[75];	/* 164 -75 */
	char	callCenterActionDate[8];		/* 239-8 */
	char	callCenterActionUser[10];		/* 247-10*/
	char	callCenterActionBranch[4];		/* 257-4 */
	char	callCenterActionTaken;			/* 261-1 */	/* 	0-Pending
															1-Address updated
															9-Action completed without address update */
	char	callCenterUserRemarks[75];		/* 262 -75 */
	char	deliveryDate[8];				/* 337-8 */
	char	deliveryUser[10];				/* 345-10*/
	char	deliveryBranch[4];				/* 355-4 */
	char	deliveryActionTaken;			/* 359-1 */	/* 	0-pending
															1-Address updated 
															9-delivered to customer without address update */
	char	deliveryUserRemarks[75];		/* 360 -75 */
	char	deliveredToCustomer;			/* 435 - 1 */ /* 0-NO; 1-YES */
	char	filler1[52];					/* 436 -52 */ /* for future use */ 
	char	lastUpdateUser[10];				/* 488 - 10 */
	char	lastUpdateDateTime[14];			/* 498 - 14 */ /* RECORD SIZE 512 */
	char	filler2[50];					/* 512 -    */ 
};

struct heirInfo
{
	char	liveChar;					/* 0   - 1 */
	char	custNo[7];					/* 1   - 7 */
	char	heirNo[4];					/* 8   - 4 */
	char	heirType;					/* 12  -  1*/ /* 0 - Heir
														 1 - Proxy 
													 */
	char	aFirstName[15];				/* 13  - 15*/
	char	aSecondName[15];			/* 28  -  15*/
	char	aThirdName[15];				/* 43  -  15*/
	char	aLastName[15];				/* 58  -  15*/
	char	aShortName[30];				/* 73  -  30*/	
	char	eFirstName[15];				/* 103 - 15*/
	char	eSecondName[15];			/* 118 - 15*/
	char	eThirdName[15];				/* 133 - 15*/
	char	eLastName[15];				/* 148 - 15*/
	char	eShortName[30];				/* 163 - 30*/
	char	idType;						/* 193 - 1*/ /* I - Saudi Id ; H - Hafiza ; P - Passport ; F-Family registration*/
	char	idNo[15];					/* 194 - 15*/
	char	activeStatus;				/* 209 -  1*/ /*0-Invalid ; 1-Valid*/
	char	disabledDate[8];			/* 210 -  8*/
	char	lastUpdateBmDate[8];		/* 218 -  8*/
	char	branchCode[4];				/* 226 -  4*/
	char	custOpenSource;				/* 230 -  1*//* P-customer created through phone; OtherValue-created through branch */
	char 	proxyNo[15];				/* 231 - 15*/
	char 	proxyDateType;				/* 246 - 1 */ /* 0-Hijri ; 1-Gregorian */
	char 	proxyIssueDateH[8];			/* 247 - 8 */
	char 	proxyIssueDateG[8];			/* 255 - 8 */
	char	filler1[201];				/* 263 - 201*/
	char	createdUserId[10];			/* 464 - 10*/
	char	createdDateTime[14];		/* 474 - 14*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler[128];				/* 512 - 128*/
};

struct branchActivityOnHeir
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	newOrUpdate;				/* 29 - 1*/ /* N - New ; U - Update */
	char	bmUpdateStatus;				/* 30 - 1*/ /* 1 - Pending with supervisor
													   2 - Pending with CSO
													   3 - Rejected    
													   9 - Completed
													*/
	char	custNo[7];					/* 31 - 7*/
	char	heirNo[4];					/* 38 - 4*/
	char	heirType;					/* 42 - 1*/  /* 0-Heir 												  
														1-Proxy
													 */
	char	supervisorId[10];			/* 43 - 10*/
	char	custBranchCode[4];			/* 53 - 4*/
	char	aFirstName[15];				/* 57 - 15*/
	char	a2ndName[15];				/* 72 - 15*/
	char	a3rdName[15];				/* 87 - 15*/
	char	aLastName[15];				/* 102 - 15*/
	char	aShortName[30];				/* 117 - 30*/	
	char	eFirstName[15];				/* 147 - 15*/
	char	e2ndName[15];				/* 162 - 15*/
	char	e3rdName[15];				/* 177 - 15*/
	char	eLastName[15];				/* 192 - 15*/
	char	eShortName[30];				/* 207 - 30*/
	char	idType;						/* 237 - 1*/ /* I - Saudi ID ; H - Hafiza ; P - passport ; F-Family registration */
	char	idNo[15];					/* 238 - 15*/
	char	heirStatus;					/* 253 - 1*/
	char	heirDisableDate[8];			/* 254 - 8*/
	char	lastUpdateBmDate[8];		/* 262 - 8*/
	char	recordChanged;				/* 270 - 1*/ /* Y-changed ; N-Not changed */
	char	custOpenSource;				/* 271 - 1*/ /* P-customer created through phone; otherValue-created through branch */

	char 	proxyNo[15];				/* 272 - 15*/
	char 	proxyDateType;				/* 287 - 1 */ /* 0-Hijri ; 1-Gregorian */
	char 	proxyIssueDateH[8];			/* 288 - 8 */
	char 	proxyIssueDateG[8];			/* 296 - 8 */
	char	filler1[184];				/* 304 - 184*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler[128];				/* 512 - 128*/
};

struct stswiftlog
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	bmUpdateStatus;				/* 29 - 1*/ /* 1 - Pending with supervisor
													   2 - Pending with CSO
													   3 - Rejected    
													   9 - Completed
													*/
	char	transRefNo[10];				/* 30 - 10*/
	char	issueDate[8];				/* 40 - 8 */

	char	applicantName[35];			/* 48 - 35*/
	char	applicantAddress1[35];		/* 83 - 35*/
	char	applicantAddress2[35];		/*118 - 35*/
	char	applicantAddress3[35];		/*153 - 35*/
	char	applicantNationality[3];  	/*188 - 3*/
	char	applicantAccNo[14];			/*191 - 14*/
	char	filler6;					/*205 - 1*/
	char	issueBranchCode[4];			/*206 - 4*/
	char	crAccNo[14];				/*210 - 14*/
	char	exchangeRate[12];			/*224 - 12*/
	char	transferPurpose[2];			/*236 - 2*/
	char	filler3[7];					/*238 - 7*/
	char	benefName[30];				/*245 - 30*/ /*beneficiary name*/
	char	ibanOrAccNo;				/*275 - 1 */ /* I-IBAN ; A-Account number */
	char	benefAccNo[35];         	/*276 - 35*/
	char	benefBankName[35];			/*311 - 35*/
	char	benefAddress1[35];			/*346 - 35*/ /*beneficiary addr*/
	char	benefAddress2[35]; 			/*381 - 35*/
	char	benefAddress3[35]; 			/*416 - 35*/
	char	benefCountryCode[2];		/*451 - 2 */
	char	applicantIdNo[15];			/*453 - 15*/
	char	filler8;					/*468 - 1*/
	char	benefBankAddress1[35];		/*469 - 35*/
	char	benefBankAddress2[35];		/*504 - 35*/
	char	bankSortCode[35];			/*539 - 35*/
	char	benefBankBIC[11];			/*674 - 11*/
	char	filler7[3];					/*685 - 3 */
	char	message1[35];				/*688 - 35*/ /*covering bank Addr2*/
	char	message2[35];				/*723 - 35*/ /*covering bank Addr3*/
	char	message3[35];				/*758 - 35*/
	char	message4[35];				/*793 - 35*/
	char	supervisorId[10];			/*828 - 10*/
	char	supervisorComments[200];	/*838 - 200*/
	char	lastUpdateBmDate[8];		/*1128- 8 */ /* YYYYMMDD */
	char	transCurrCode[3];			/*1136- 3 */
	char	transAmt[14];				/*1139- 14 */
	char	paymentCurrCode[3];			/*1153- 3 */
	char	paymentAmt[14];				/*1156- 14 */
	char	valueDate[8];				/*1170- 8 */ /*YYYYMMDD */
	char	filler[78];					/*1178- 78*/
	char	lastUpdateUser[10];			/*1256- 10*/ 
	char	lastUpdateDateTime[14];		/*1266- 14*/
	char	filler1[100];
};

struct stsadadlog
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/* 15 - 14*/
	char	tellerId[3];				/* 29 - 3 */
	char	postingStatus;				/* 32 - 1*/ /* N - Normal post
													   R - Reversed 
													   T - Terminated */
	char	langInd[5];					/* 33 - 5 */
	char	companyId[4];				/* 38 - 4*/
	char	subscriptionNo[19];			/* 42 - 19*/
	char	subsOrBillNo;				/* 61 - 1 */ /* S-Subs.No; B-Bill Number */

	char	billAmt[19];				/* 62 - 19*/
	char	paymentType[4];				/* 81 - 4 */
	char	cashOrAcc;					/* 85 - 1 */ /* C-Cash;A-A/c */
	char	drAccNo[14];				/* 86 - 14*/
	char	contraAccNo[14];			/* 100 - 14*/
	char	transType[2];				/* 114 - 2*/
	char	serviceType[4];				/* 116 - 4 */
	char	transRefNo[10];				/* 120 - 10*/
	char	valueDate[8];				/* 130 - 8 */
	char	transDateTime[14];			/* 138 - 14*/ /* YYYYMMDDHHMMSS*/
	char 	preOrPostpaid; 				/* 152 - 1 */ /* 0-Post paid ; 1-Pre paid */
	char	bankTransId[32];			/* 153 - 32*/
	char	sadadTransId[32];			/* 185 - 32*/
	char	reversalTime[6];			/* 217 - 6 */ /* HHMISS */
	char	reversalStatus;				/* 223 - 1 */ /* 1 - Pending with Chief Teller ; 3-Rejected; 9-Sucessfully reversed*/
	char	supervisorId[10];			/* 224 - 10*/
	char	filler2[254];				/* 234 - 254*/
	char	lastUpdateUser[10];			/* 488 - 10*/
	char	lastUpdateDateTime[14];		/* 498 - 14*/
	char	filler1[100];
};

struct stsamaacc
{
	char	liveChar;					/* 0 - 1 */
	char	branchCode[4];				/* 1 - 4 */
	char	userId[10];					/* 5 - 10*/
	char	dateTime[14];				/*15 - 14*/

	char	accNo[14];					/*29 - 14*/
	char	supervisorId[10];			/*43 - 10*/
	char	accStatus[2];				/*53 - 2 */
	char	custBranchCode[4];			/*55 - 4 */
	char	fromStatus[2];				/*59 - 2*/
	char	toStatus[2];				/*61 - 2*/
	char	accStatusChangeReason[30];	/*63 -30*/
	char	filler[10];					/*93 -10*/
	char	lastUpdateUser[10];			/*103-10*/
	char	lastUpdateDateTime[14];		/*113-14*/
	char	filler2;					/*127-1 */
	char	filler1[100];
};

struct staccopencard
{
	char 	liveChar;						/* 0 - 1 */
	char 	branchCode[4];					/* 1 - 4 */
	char 	userId[10];						/* 5 - 10*/
	char 	dateTime[14];					/* 15 - 14*/
	char 	custNo[7];						/* 29 - 7 */
	char 	printStatus;					/* 36 - 1 */ /* 1-Succesfully printed */
	char 	accNo[14];						/* 37 - 14*/
	char 	iban[24];						/* 51 - 24*/
	char 	custName[30];					/* 75 - 30*/
	char 	customerLang;					/* 105 - 1 */ /* 0-Arabic ; 1-English */
	char 	custOpenDate[8];				/* 106 - 8 */ /* YYYYMMDD */
	char 	custBranchCode[4];				/* 114 - 4 */
	char 	filler[114];					/* 118 - 114*/
	char	lastUpdateUser[10];				/* 232 - 10*/
	char	lastUpdateDateTime[14];			/* 242 - 14*/ 
	char	filler1[100];
};

struct cblienext
{
	char liveChar;
	char accNo[14];
	char lienAmt[14];
	char filler[50];
};

struct cbchqext
{
	char liveChar;			/* 0 - 1 */
	char accNo[14];			/* 1 - 14 */
	char endChqNo[8];		/* 15 - 8 */
	char filler[50];		/* 23 - 50 */
};
