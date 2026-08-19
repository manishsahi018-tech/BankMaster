/*   Message format/layout of Real Time Update process */

/*   Outgoing message layout */

#define MAXERR  50

struct inMessage 
{
	char	source[2];			/*15 - 2 */
	char	service[2];			/*17 - 2 */ 
								/* 00 - Ac to Ac transfer */
								/* 01 - Balance enquiry */
								/* 02 - Mini statement */
								/* 03 - Banking date */
								/* 04 - Account  static info */
								/* 05 - Customer static info */
								/* 06-07-On demand statement */
								/* 08 - Statement by mail */
								/* 09 - Cheque book request */
	char	mainAccNo[14];   	/*19 - 14*/ /* changed for Alphanumeric customer */
	char	contraAccNo[14];   	/*33 - 14*/ /* changed for Alphanumeric customer */
	char	transDate[8];       /*47 - 8 */
	char	transTime[6];       /*55 - 6 */
	char	refNo[16];          /*61 - 16*/
	char	valueDate[8];       /*77 - 8 */
	char	transAmt[19];       /*85 - 19*/
	char	transType[2];       /*104- 2 */
	char	userId[4];			/*106- 4 */
	char	Enarrative1[25];	/*110- 25*/
	char	Enarrative2[25];	/*135- 25*/
	char	Enarrative3[25];	/*160- 25*/
	char	Anarrative1[25];	/*185- 25*/
	char	Anarrative2[25];	/*210- 25*/
	char	Anarrative3[25];	/*235- 25*/
	char	otherCurrAmt[19];  	/*260- 19*/ /* mostly fX */
	char	baseEquiv[19];		/*279- 19*/
	char	exRate[14];			/*298- 14*/ /* 8 decimal Places */
	char	transCategory;  	/*312- 1 */ /* 0-Normal; 1-ForcePost; 2-Reversal */
	char	transStatus[2];		/*313- 2 *//* Space - when at inMessage */
	char	tpgError[40]; 		/*315- 40*//*spaces in inMessage */
	char	custName[30];		/*355- 30*/
	char	endOfText;			/*385- 1*/
	char	nullPad;			/*386- 1*/
	char	filler[15000];		/*387- 15000*/
}; 

struct	transactions 
{
	char	postDate[8];
	char	valueDate[8];
	char	transType[2];
	char	transAmt[15];
	char	narrative1[25];
	char	narrative2[25];
};

struct miniStatement	
{
	char	msgLen[4];
	char	tuxConnectionNo;		
	char	branchName[10];
	char	source[2];
	char	service[2];			/* 02 - Mini statement       */
	char	accNo[14];
	char	clearedBal[15];
	struct	transactions transDetails[5];
	char	responseStatus[2];
	char	decimalPlace;
	char	bookBal[15];		  /*added for 3.4 */
	char	endOfText;
	char	nullPad;
};

struct bankcomDate	
{
	char	msgLen[4];
	char	tuxConnectionNo;		
	char	branchName[10];
	char	source[2];
	char	service[2];			/* 03 - Banking date enquiry */
	char	bankingDate[8];
	char	reportBalanceDate[8];
	char	responseStatus[2];
	char	endOfText;
	char	nullPad;
};

struct stmtRequestByMail 
{
	char	msgLen[4];
	char	tuxConnectionNo;		
	char	branchName[10];
	char	source[2];
	char	service[2];
	char	accNo[14];
	char	fromDate[8];
	char    toDate[8];
	char	filler[51];
	char	responseStatus[2];
	char	endOfText;
	char	nullPad;
};

struct	fullStmtTrans 
{
	char	postDate[8];
	char	valueDate[8];
	char	transType[2];
	char	transAmt[15];
	char	narrative1[25];
	char	narrative2[25];
	char	narrative3[25];
};

struct fullStatement	
{
	char	msgLen[4];			/*0-4*/
	char	tuxConnectionNo;	/*4-1*/	/* exclusive OR of all characters */
	char	branchName[10];		/*5-10*/
	char	source[2];			/*15-2*/
	char	service[2];			/*17-2*/
	char	accNo[14];			/*19-14*/
	char	fromDate[8];		/*33-8*/
	char	toDate[8];			/*41-8*/
	char	lastTransPtr[5];	/*49-5*/
	char	completionFlag;		/*54-1*/ /* 0- incomplete; 1 complete */
	char	totNoOfTrans[5];	/*55-5*/
	char	noOfTransHere[3];	/*60-3*/
	char	clearedBal[15];		/*63-15*/
	char	bookBal[15];		/*78-15*/
	struct	fullStmtTrans transDetails[50];	/*93--- */
	char	responseStatus[2];
	char	decimalPlace;
	char	endOfText;
	char	nullPad;
};

struct	ondemandStmtTrans 
{
	char	userId[3];
	char	postDate[8];
	char	valueDate[8];
	char	transType[2];
	char	transAmt[15];
	char	narrative1[25];
	char	narrative2[25];
	char	narrative3[25];
};

struct ondemandStatement	
{
	char	msgLen[4];			/*0 -4*/
	char	tuxConnectionNo;	/*4 -1*/	/* exclusive OR of all characters */
	char	branchName[10];		/*5-10*/
	char	source[2];			/*15-2*/	/* 07 - Ondemand statement */
	char	service[2];			/*17-2*/
	char	accNo[14];			/*19-14*/
	char	fromDate[8];		/*33-8*/
	char	toDate[8];			/*41-8*/
	char	lastTransPtr[5];	/*49-5*/
	char	custName[30];		/*54-30*/
	char	custAddress[60];	/*84-60*/
	char	languageCode;		/*144-1*/
	char	branchCode[4];		/*145-4*/
	char	completionFlag;		/*149-1*/ /* 0- incomplete; 1 complete */
	char	totNoOfTrans[5];	/*150-5*/
	char	noOfTransHere[3];	/*155-3*/
	char	bfBal[15];		    /*158-15*/
	struct	ondemandStmtTrans transDetails[50]; /*173--*/
	char	responseStatus[2];
	char	decimalPlace;
	char	endOfText;
	char	nullPad;
};

struct	transEnquiryDetails 
{
	char	userId[3];
	char	postDate[8];
	char	valueDate[8];
	char	transType[2];
	char	transAmt[15];
	char	narrative1[25];
	char	narrative2[25];
	char	narrative3[25];
	char	refNo[10];			/* added for version 3.7 */
	char	supervisorId[3];	/* added for version 3.7 */
	char	transCounter[5];	/* added for version 3.7 */
	char	statementFlag;		/* added for version 3.7 */
};

struct transEnquiry	
{
	char	msgLen[4];			/*0 -4*/
	char	tuxConnectionNo;	/*4 -1*/	/* exclusive OR of all characters */
	char	branchName[10];		/*5-10*/
	char	source[2];			/*15-2*/	/* 11 - Ondemand statement Ver.3.7*/
	char	service[2];			/*17-2*/
	char	accNo[14];			/*19-14*/
	char	fromDate[8];		/*33-8*/
	char	toDate[8];			/*41-8*/
	char	lastTransPtr[5];	/*49-5*/
	char	custName[30];		/*54-30*/
	char	custAddress[60];	/*84-60*/
	char	languageCode;		/*144-1*/
	char	branchCode[4];		/*145-4*/
	char	completionFlag;		/*149-1*/ /* 0- incomplete; 1 complete */
	char	totNoOfTrans[5];	/*150-5*/
	char	noOfTransHere[3];	/*155-3*/
	char	bfBal[15];		    /*158-15*/
	struct	transEnquiryDetails transDetails[50]; /*173--*/
	char	responseStatus[2];
	char	decimalPlace;
	char	endOfText;
	char	nullPad;
};

struct debitCardEnquiryRequest
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 31 - Debit Card  Enquiry */
	char	responseStatus[2]; 			/*19 - 2*/ /* will have the response values */
	char	userId[4];					/*21 - 4*/
	char	custNo[8];					/*25 - 8*/
	char	filler[50];
	char	nullPad;
};

struct atmCardInfo
{
	char	source[2];
	char	cardNo[19];
	char	nameOnTheCard[30];
	char	cardType[3]; 		/* In ODS, the length is 3 */
	char	engCardTypeDesc[30];
	char	arbCardTypeDesc[30];
	char	cardSubType;		/* P-Primary ; S-Supplementary */
	char	issueDate[8];
	char	expiryDate[8];
	char	cardStatus;
	char	filler[25];			/* For future use */
};

struct debitCardEnquiryResponse
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 31 - Debit Card  Enquiry */ 
	char	responseStatus[2]; 			/*19 - 2*/ /* 00 - Success */
	char	userId[4];					/*21 - 4*/
	char	custNo[8];					/*25 - 8*/
	char	noOfAtmCards[3];			/*33 - 3*/
	char	filler1[25];				/*36 - 25*/
	struct	atmCardInfo		cardInfo[50];
	char	nullPad;
};

struct newAtmCardRequest 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 00 - New ATM Card request from finacle */
	char	responseStatus[5]; 			/*19 - 5*/ /* space in inMessage */
	char	custNo[8];					/*24 - 8*/ /* CIF ID */
	char	ninId[50];					/*32 - 50*/
	char	ninType[50];				/*82 - 50*/
	char	eFirstName[80];				/*132 - 80*/
	char	eMiddleName[80];			/*212 - 80*/
	char	eLastName[100];				/*292 - 80*/
	char	aFirstName[80];				/*392 - 80*/
	char	aMiddleName[80];			/*472 - 80*/
	char	aLastName[100];				/*552 - 100*/
	char	nameOnTheCard[26];			/*652 - 26*/
	char	accNo[16];					/*678 - 16*/ /* Valid Finacle number */
	char	accName[80];				/*694 - 80*/
	char	accOpenDate[8];				/*774 - 8 */
	char	branchCode[8];				/*782 - 8 */ /* SOL id of account */
	char	schemeCode[5];				/*790 - 5 */ /* Scheme code in which the account has been opened */
	char	isoCurrCode[3];				/*795 - 3 */
	char	filler[100];				/*798 - 100*/ /* for future purpose -should be spaces*/
	char	nullPad;
};

struct newAtmCardResponse 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 00 - New ATM Card request from finacle */
	char	responseStatus[5]; 			/*19 - 5*/ /* 00000 - Success 
													  TUX03 - Incorrect message
													  TUX12 - Communications failed with host
													  TUX80 - Host is not available 
													  TUX81 - This request is not supported by this service
													  TUX99 - Internal Error 
													  For Host error, please refer to tuxedo catelogue */
	char	custNo[8];					/*24 - 8*/ /* CIF ID - Same as request */
	char	ninId[50];					/*32 - 50*/ /* Same as request */
	char	ninType[50];				/*82 - 50*/ /* Same as request */
	char	atmCardNo[20];				/*132 - 20*/ /* New generated ATM card number */
	char	filler[100];				/*152 - 100*/ /* for future use */
	char	nullPad;
};

struct forceAtmCrdRequest 	/** [Mohit|07-01-2006|CRM Project] **/
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 33 - Force ATM Card resquest */
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	userId[4];					/*21 - 4*/ /* Bankmaster userID*/
	char	staticDataUserId[10];		/*25 - 10*/
	char	staticDataSupervisorId[10];	/*35 - 10*/
	char	atmCardNo[20];				/*45 - 20*/
	char	filler[50];					/*65 - 50*/ /* for future purpose -should be spaces*/
	char	nullPad;
};

struct forceAtmCrdResponse 	/** [Mohit|07-01-2006|CRM Project] **/
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 33 - Force ATM card request */
	char	responseStatus[2]; 			/*19 - 2*/ 
	char	userId[4];					/*21 - 4*/
	char	staticDataUserId[10];		/*25 -10*/
	char	staticDataSupervisorId[10];	/*35 -10*/
	char	atmCardNo[20];				/*45 -20*/
	char	errorDescription[50];		/*65 -50*/
	char	filler[50];  				/*115 - 50*/ /* for future purpose -should be spaces*/
	char	nullPad;
};


struct cardDetailsRequest
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 61 - debit card Detail using card number*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	atmCardNo[19];     			/*21 - 19*/
	char	filler1[50];         		/*40 - 50*/ /* for future use */
	char	nullPad;					/*90- 1*/
};

struct cardDetailsResponse
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 61- debit card details using card number*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	atmCardNo[19];      		/*21 - 19*/
	char	accountNo[20];         		/*40 - 20*/ 
	char	nameOnTheCard[30];     		/*60 - 30*/ 
	char	cardType[3];         		/*90 - 3*/
	char	primaryOrSupplementary;		/*93 - 1*/
	char	cardIssueDate[8];			/*94 - 8*/
	char	cardExpiryDate[8];       	/*102- 8*/
	char	cardStatus;       			/*110- 1*/
	char	packageFlag;				/*111- 1*/
	char	packageEnglishDesc[30];		/*112- 30*/
	char	packageArabicDesc[30];		/*142- 30*/
	char	customerName[80];			/*172- 80*/
	char	relationshipManager[50];	/*252- 50*/
	char	filler1[200];         		/*302 - 200*/ /* for future use */
	char	nullPad;					/*502 - 1*/
};

struct atmCrdLtStRequest   /** Added by Mohit on 03 Nov 2007 for Consumer Portal **/
{
    char    msgLen[4];                  /*0 - 4*/
    char    tuxConnectionNo;            /*4 - 1*/
    char    branchName[10];             /*5 - 10*/
    char    source[2];                  /*15 - 2*/
    char    service[2];                 /*17 - 2*/ /* 62 - Report Lost/Stolen ATM Card -validation only */
    char    responseStatus[2];          /*19 - 2*/ /* space in inMessage */
    char    userId[4];                  /*21 - 4*/ /* Bankmaster userID*/
    char    staticDataUserId[10];       /*25 - 10*/
    char    staticDataSupervisorId[10]; /*35 - 10*/
    char    atmCardNo[20];               /*45 - 20*/
    char    reqBranchCode[4];           /*65 - 4*/
    char    lostStolenFlag;             /*69 - 1*/  /* '2' - Lost;  '3' - Stolen */
    char    filler[200];                /*70 - 200*/ /* for future purpose -should be spaces*/
    char    nullPad;
};

struct atmCrdLtStResponse  /** Added by Mohit on 03 Nov 2007 for Consumer Portal **/
{
    char    msgLen[4];                  /*0 - 4*/
    char    tuxConnectionNo;            /*4 - 1*/
    char    branchName[10];             /*5 - 10*/
    char    source[2];                  /*15 - 2*/
    char    service[2];                 /*17 - 2*/ /* 62 - Report Lost/Stolen ATM Card -validation only */
    char    responseStatus[2];          /*19 - 2*/
    char    userId[4];                  /*21 - 4*/
    char    staticDataUserId[10];       /*25 -10*/
    char    staticDataSupervisorId[10]; /*35 -10*/
    char    atmCardNo[20];               /*45 -20*/
    char    rqstBranchCode[4];          /*65 - 4*/
    char    currentAtmCrdStatus;        /*69 - 1*/
    char    hostResponseCode[3];        /*70 - 3*/
    char    errorDescription[50];       /*73 -50*/
    char    filler[200];                /*123 - 200*/ /* for future purpose -should be spaces*/
    char    nullPad;
};

#define	YES		1
#define	NO		0

#define	INTERNALERR		"99"
#define ILLEGALUSER 	"98"
#define NOFINFI			"57"
#define SUPPCARDLIMITEXCEED "56" /* Supplementary card count exceeded 99 cards */
#define DATAMISSING     "55" 	/* Required data missing in the file ; Added by Rajesh on 06OCT08 for eStatement project */
#define NOTSAMEBRN      "54" 	/* Users are not from same branch */ /*by Mohit on 04/11/07 for CONSPORT*/
#define OUTOFRANGE      "53" 	/* Out of Range */
#define INVALIDIDNO     "52" 	/* Invalid ID Number. NIN Check digit validation failure */
#define INVALIDIDTYPE   "51" 	/* Invalid ID Type; valid values like I,Q,P, etc */
#define RESEND  		"50"
#define REFNOTFOUND  	"49"	/* Original reference not found fo reconciliation a/c posting */
#define INVALIDTYPE  	"48"	/* Invalid Card Type */ /* [Mohit|08-01-2006|CRM Project] */
#define INVALIDSTATUS	"47"	/* Invalid Card Status */ /* [Mohit|08-01-2006|CRM Project] */
#define INVALIDPAYACC	"46"	/* Invalid payee account */
#define INVALIDACTYPE	"45"	/* Invalid account type */
#define ACCLIMITEXCEED	"44"	/* Account  limit exceeded */
#define STOPPEDCHECK	"43"	/* Incoming cheque number is stopped */
#define RATENOTEXISTS	"42"    /*Funding rate not exist*/
#define INVALIDEXRATE	"41"	/* Invalid exchange rate*/ 
#define INVALIDVDATE 	"40"	/* Value date < last Accrual Date */ 
#define ALREADYPROCESSED "39"	/* settlement/payment already processed*/ 
#define INVALIDACC 	    "38"	/* Invalid Account */ 
#define INVALIDCUR 	    "37"	/* Invalid currency */ 
#define INVALIDTDACC 	"36"	/* Invalid time deposit Account*/ 
#define INVALIDTDMEMO 	"35"	/* Invalid time deposit memo*/ 
#define INVALIDNARCD   	"34"	/* Invalid narrative code 1*/
#define CUSTLIMITEXCEED	"33"	/* Customer limit exceeded */
#define NOFXTRANS    	"32"	/* No FX transactions allowd */
#define WRONGREFNO   	"31"	/* wrong reference number. zero/blank not allowd */
#define ACCNOTINTXNS  	"30"	/* Main account number given in direct posting not found in txn list */
#define NOSUCHBLOCK  	"29"	/* No such blocking found in bkd0data */
#define RECORDLOCKED 	"28"
#define DRCRMISMATCH 	"27"	/* Total debit amount does not zero proof with total credit amount */
#define INVALIDAMT   	"26"
#define INVALIDDATE  	"25"
#define INVALIDTTYPE 	"24"
#define NOTVALIDSUPV  	"23"	/* Not a valid static data supervisor id */
#define NOTVALIDUSER  	"22"	/* Not a valid static data user id */
#define INVALIDPAYFLAG	"21"
#define ALREADYEXISTS 	"20"
#define PAYMENTSETTLED	"19"
#define RECNOTEXISTS 	"18"
#define TRYLATER     	"17"
#define NOCHECKBOOKS 	"16"
#define ACCCLOSED    	"15"
#define NOTRANS			"14"
#define TIMEOUT			"13"
#define COMMSERR		"12"
#define TPGERR			"11"
#define NOFUND			"09"
#define ACCRESTRICTED	"08"
#define	DORMANTACC		"07"
#define	NOCONTRAACC		"06"
#define	NOMAINACC		"05"
#define NOTPG			"04"
#define	INCORRECTMSG	"03"
#define DUPLICATE		"02"
#define WRITTENTOPEND	"01"
#define	SUCCESS			"00"
