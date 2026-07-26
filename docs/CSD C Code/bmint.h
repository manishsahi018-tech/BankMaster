/* VER1.0   Added  for "Dormant account activation" project */
/* VER1.1   Modified  for "Time Deposit opening" project */
/* VER1.2   Modified  for "SADAD payment from branch using CSD" project */

struct postTransInfo
{
    char    accNo[14];
    char    transAmt[15];
    char    transType[2];
    char    narrative1Code[4];
    char    exRate[9];
    char    baseEquivalent[15];
    char    filler;
};

struct postTransactionRequest
{
    char    msgLen[4];                  /*0 - 4*/
    char    tuxConnectionNo;            /*4 - 1*/
    char    branchName[10];             /*5 - 10*/
    char    source[2];                  /*15 - 2*/
    char    service[2];                 /*17 - 2*/ /* 54 - Post Transaction service*/
    char    responseStatus[2];          /*19 - 2*/ /* space in inMessage */
    char    userId[4];                  /*21 - 4*/ /* Bankmaster userID*/
    char    transDate[8];               /*25 - 8*/
    char    transTime[9];               /*33 - 9*/ /* HHMMSSLLL-includes milliseconds*/
    char    bmRefNo[10];                /*42 -10*/
    char    refNoExt[6];                /*52 -6 */
    char    eNarrative1[25];            /*58 -25*/ /* if available narrative code will be ignored*/
    char    eNarrative2[25];            /*83 -25*/
    char    eNarrative3[25];            /*108-25*/
    char    aNarrative1[25];            /*133-25*/ /* if available narrative code will be ignored*/
    char    aNarrative2[25];            /*158-25*/
    char    aNarrative3[25];            /*183-25*/
    char    transCategory;              /*208- 1*/ /* 0-Normal; 1-Force Post; 2-Reversal */
    char    valueDate[8];               /*209-8*/
    char    ignoreBlockAmt;             /*217-1*/ /* 0-NO; 1-YES */
	char	dormantAccPosting;			/*218-1*/ /* 0-NO; 1-YES; 2-Allow with dormant flag removal*/
	char	requestBranchCode[4];		/*219-4*/
	char	txnSource;					/*223-1*/ /* S-Static Data */
	char	filler[43];					/*224-43*/  /* for future use */
    char    noOfTransHere[2];           /*267-2 */  /* can be maximum of 99 transaction */
    struct  postTransInfo  transInfo[99];   /*269-5940*/    /* 60x99*/
    char    hashTotal[4];
    char    nullPad;
};

struct postTransactionResponse
{
    char    msgLen[4];                  /*0 - 4*/
    char    tuxConnectionNo;            /*4 - 1*/
    char    branchName[10];             /*5 - 10*/
    char    source[2];                  /*15 - 2*/
    char    service[2];                 /*17 - 2*/ /* 54 - Post Transaction service */
    char    responseStatus[2];          /*19 - 2*/ /* will have the response values */
    char    userId[4];                  /*21 - 4*/ /* Bankmaster userID */
    char    transDate[8];               /*25 - 8*/
    char    transTime[9];               /*33 - 9*/ /* HHMMSSLLL-includes milliseconds */
    char    bmRefNo[10];                /*42 -10*/
    char    refNoExt[6];                /*52 -6 */
    char    detailResponseCode[4];      /*58 -4*/
    char    errorAccount[14];           /*62 -14*/
    char    errorDescription[30];       /*76 -30*/
    char    filler[50];                 /*106-50*/
    char    hashTotal[4];               /*156-4 */
    char    nullPad;
};

struct timeDepositIntRateEnqRequest 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	currency[2];      			/*25 - 2*/
	char	depositPrd[4];      		/*27 - 4*/
	char	depositAmt[15];      		/*31 - 15*/
	char	valueDate[8];				/*46 - 8 */
	char	filler[42];         		/* for future use */
	char	nullPad;					
};

struct timeDepositIntRateEnqResponse 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	currency[2];      			/*25 - 2*/
	char	depositPrd[4];      		/*27 - 4*/
	char	depositAmt[15];      		/*31 - 15*/
	char	intRate[9];      		    /*46 - 9*/
	char	minIntRate[9];     		    /*54 - 9*/
	char	maxIntRate[9];     		    /*63 - 9*/
	char	filler[32];         		/* for future use */
	char	nullPad;					
};

struct exchangeRateEnqRequest 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	isoCurrCode[3];				/*21 - 3*/ 
	char	bmCurrCode[2];     			/*24 - 2*/
	char	exchangeRateDate[8];   		/*26 - 8*/
	char	filler[50];         		/* for future use */
	char	nullPad;					
};

struct exchangeRateEnqResponse 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	buyingRate[11];				/*21 -11*/ 
	char	sellingRate[11];      		/*32 -11*/
	char	costRate[11];      			/*43 -11*/
	char	filler[50];         		/* for future use */
	char	nullPad;					
};

struct timeDepositOpenRequest1
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 60*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	userId[4];					/*21 - 4*/ /* userID */
	char	tranDate[8];      			/*25 - 8*/
	char	tranTime[9];         		/*33 - 9*/ 
	char	tranRef[10];         		/*42 - 10*/ 
	char	currency[2];         		/*52 - 2*/
	char	ledgCode[3];         		/*54 - 3*/
	char	custNo[7];         		    /*57 - 7*/
	char	debitAccNo[14];    		    /*64 - 14*/
	char	depositAmt[15];    		    /*78 - 15*/
	char	depFreq;        		    /*93 - 1*/  /*D-daily;W-weekly;M-month*/
	char	depPrd[2];        		    /*94 - 2*/  /* 1 - 99*/
	char	payeeAccNo[14];        	    /*96 - 14*/
	char	intApplication;        	    /*110 -1*/  /* 0-Self Ac; 1-Payee Ac */
	char	renewFlag;        	        /*111 -1*/  /* 0-not; 1-autoRenewal */
	char	exRate[14];                 /*112 -14*/ 
	char	transCategory;              /*126 -1*/ /* 0-Normal; 2-Reversal*/
	char	actionFlag;                 /*127 -1*/ /* D-Delete*/
	char	deleteAccNo[14];      	    /*128 -14*/
	char	intRate[9];					/*142 - 9*/
	char	maturityDate[8];			/*151 - 8 */ /* YYYYMMDD */
	char	arabicNarrative1[25];		/*159 - 25*/
	char	englishNarrative1[25];		/*184 - 25*/
	char	valueDate[8];				/*209 - 8 */ /* to support back-value dated TD */
	char	debitAmt[14];				/*217 - 14*/ /* added along with back-value dated TD amendments */
	char	filler1[50];         		/*231 - 50*/ /* for future use */
	char	nullPad;					/*281-  1 */
};

struct timeDepositOpenResponse1
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 60*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	userId[4];					/*21 - 4*/ /* userID */
	char	tranDate[8];      			/*25 - 8*/
	char	tranTime[9];         		/*33 - 9*/ 
	char	tranRef[10];         		/*42 - 10*/ 
	char	depAccNo[14];         		/*52 - 14*/
	char	intRate[9];        		    /*66 - 9*/
	char	debitCustName[30];    	    /*75 - 30*/
	char	timeDepCustName[30];  	    /*105 - 30*/
	char	tpgErr[12];        		    /*135 - 12*/
	char	errDesc[30];   		        /*147 - 30*/
	char	filler1[23];         		/*177 - 23*/ /* for future use */
	char	nullPad;					/*200 - 1*/
};

struct timeDepositEnqRequest 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	accNo[14];      			/*25 - 14*/
	char	filler[50];         		/* for future use */
	char	nullPad;					
};

struct timeDepositEnqResponse 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	accNo[20];      			/*25 - 20*/
	char	filler1;      			    /*45 - 1*/
	char	accStatus;      			/*46 - 1*/
	char	branch[4];      			/*47 - 4*/
	char	accDesc[30];      			/*51 - 30*/
	char	custName[30];      			/*81 - 30*/
	char	accOpenDate[8];   			/*111- 8*/
	char	depositAmt[15];   			/*119- 15*/
	char	bookBal[15];   			    /*134- 15*/
	char	maturityDate[8];   			/*149- 8*/
	char	maturityAmt[15];   			/*157- 15*/
	char	intRate[9];   			    /*172- 9*/
	char	payAccNo[14];   			/*181- 14*/
	char	intAppFlag;      			/*195- 1*/
	char	autoRenewFlag;     			/*196- 1*/
	char	renewType;      			/*197- 1*/
	char	renewPrd[2];    			/*198- 2*/
	char	marginRate[9];    			/*200- 9*/
	char	activeFlag;    			    /*207- 1*/
	char	decimals;    			    /*210- 1*/
	char	filler2[50];         		/* for future use */
	char	nullPad;					
};

struct timeDepositRenewRequest 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	accNo[14];      			/*25 - 14*/
	char	autoRenewFlag;     			/*39 - 1*/  /* 0 or 1*/
	char	renewType;      			/*40 - 1*/ /*D-daily;W-weekly;M-month*/
	char	renewPrd[3];    			/*41 - 3*/  /* 1 - 99*/
	char	filler[50];         		/* for future use */
	char	nullPad;					
};

struct timeDepositRenewResponse 
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ 
	char	responseStatus[2]; 			/*19 - 2*/
	char	userId[4];					/*21 - 4*/ 
	char	errorDescription[30];		/*25 - 30*/
	char	filler[50];         		/* for future use */
	char	nullPad;					
};

struct breakTimeDepositRequest
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 61 - break Time Deposit */
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	userId[4];					/*21 - 4*/ /* userID */
	char	tranDate[8];      			/*25 - 8*/
	char	tranTime[9];         		/*33 - 9*/ 
	char	tranRef[10];         		/*42 - 10*/ 
	char	tdAccNo[14];         		/*52 - 14*/
	char	penaltyAmt[14];    		    /*78 - 14*/
	char	penaltyAccNo[14];			/*92 - 14*/
	char	arabicNarrative1[25];		/*106 - 25*/
	char	englishNarrative1[25];		/*131 - 25*/
	char	filler1[100];         		/*156 - 100*/ /* for future use */
	char	nullPad;					/*256- 1*/
};

struct breakTimeDepositResponse
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 60*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	userId[4];					/*21 - 4*/ /* userID */
	char	tranDate[8];      			/*25 - 8*/
	char	tranTime[9];         		/*33 - 9*/ 
	char	tranRef[10];         		/*42 - 10*/ 
	char	tdAccNo[14];         		/*52 - 14*/
	char	payAccNo[14];				/*66 - 14*/
	char	amtCredited[14];			/*80 - 14*/
	char	tpgErr[12];        		    /*94 - 12*/
	char	errDesc[30];         		/*106 - 30*/
	char	filler1[100];         		/*136 - 100*/ /* for future use */
	char	nullPad;					/*236 - 1*/
};

