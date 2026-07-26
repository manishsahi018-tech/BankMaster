
/*   Outgoing message layout - with Finnacle Online interface */

#define MAXERR  50

struct accInfoRequest
{
	char	msgLen[4];			/* 0 - 4 */
	char	tuxConnectionNo;	/* 4 - 1 */
	char	branchName[10];     /* 5 - 10*/
	char	source[2];          /*15 - 2 */
	char	service[2];			/*17 - 2 */ /* 04 - Account details */
	char	accNo[16];          /*19 - 16*/
	char	filler[73];			/*35 - 73*/
	char	userId[15];     	/*108 - 15*/
	char	filler1[203];     	/*123 - 203*/
	char	responseStatus[5];  /*326 - 5 */
	char	filler2[30];        /*331 - 30*/
	char	endOfText;          /*361- 1 */
	char	nullPad;
};

struct accInfoResponse
{
	char	msgLen[4];			/* 0 - 4 */
	char	tuxConnectionNo;	/* 4 - 1 */
	char	branchName[10];     /* 5 - 10*/
	char	source[2];          /*15 - 2 */
	char	service[2];			/*17 - 2 */ /* 04 - Account details */
	char	accNo[16];          /*19 - 16*/
	char	decimalPlace;       /*35 - 1 */
	char	exRate[14];			/*36 - 14*//* 8 digits decimal place */
	char	isoCurrCode[3];     /*50 - 3 */
	char	accOpenDate[8];     /*53 - 8 */
	char	branchCode[8];      /*61 - 8 */
	char	accStatus;          /*69 - 1 */ /* Similiar to BM Passwd */
	char	atmCardHolder;      /*70 - 1 */
	char	lastTransDate[8];   /*71 - 8 */
	char	lastAccrualDate[8]; /*79 - 8 */
	char	crIntRate[9];       /*87 - 9 */
	char	drIntRate[9];       /*96 - 9 */
	char	matchingAccNo[16];  /*105- 16*/
	char	payAccNo[16];       /*121- 16*/
	char	loanStatus;         /*137- 1 */ /* 0-Performing ; 1-Non-performing */
	char	responseStatus[5];  /*138- 5 */
	char	dormantFlag;		/*143- 1 */ /* 0-Active ; 1-Dormant */
	char	custNo[8];			/*144- 8 */
	char	filler[191];		/*152- 191*/
	char	endOfText;          /*343- 1 */
	char	nullPad;
};

struct custInfoRequest	
{
	char	msgLen[4];			/* 0 - 4 */
	char	tuxConnectionNo;	/* 4 - 1 */
	char	branchName[10];		/* 5 - 10*/
	char	source[2];			/* 15 - 2*/
	char	service[2];			/* 17 - 2*/	/* 05- Customer details */
	char	custNo[8];			/* 19 - 8*/
	char	filler[80];			/* 27 - 80*/
	char	userId[15];			/* 107- 15*/
	char    filler1[275];		/* 122- 275*/
	char	endOfText;			/* 397- 1 */  /* Z */
	char	nullPad;
};

struct custInfoResponse	
{
	char	msgLen[4];			/* 0 - 4 */
	char	tuxConnectionNo;	/* 4 - 1 */
	char	branchName[10];		/* 5 - 10*/
	char	source[2];			/* 15 - 2*/
	char	service[2];			/* 17 - 2*/	/* 05- Customer details */
	char	custNo[8];			/* 19 - 8*/
	char	shortName[30];
	char	longName[80];
	char    address1[200];
	char    address2[200];
	char    poBox[10];
	char    cityName[200];
	char    zipCode[100];
	char	preferredLang;					/* 1-English;2-Arabic */
	char	homeTelNo[50];
	char    officeTelNo[50];
	char	mobileNo[50];
	char	pagerNo[50];
	char	eMail[50];
	char	idType[50];
	char	idNo[50];
	char	dateOfBirth[8];
	char	custOpenDate[8];
	char	fillerxy;		
	char	businessType[50];
	char	nationality[50];
	char    branchCode[8];
	char	alternativeBranchCode[8];
	char	titleCode[30];
	char	packageCustFlag;
	char	custType; 
	char	idIssueDateH[8]; 
	char	idExpiryDateH[8]; 
	char	idIssueDateG[8]; 
	char	idExpiryDateG[8]; 
	char	educationCode[5]; 
	char	noOfDependents[2]; 
	char	relationshipManager[50];
	char	relationshipManagerContact[10];
	char	filler[200];
	char	responseStatus[5];
	char	endOfText;
	char	nullPad;
};

struct	accountDetails 	
{
	char	accNo[14];
	char	accStatus;
	char	accOpenDate[8];
	char	filler[30];
};

struct customerAccs	
{
	char	msgLen[4];			/*0 -4*/
	char	tuxConnectionNo;	/*4 -1*/	/* future purpose*/
	char	branchName[10];		/*5-10*/
	char	source[2];			/*15-2*/	/* 10 - customerAccs*/
	char	service[2];			/*17-2*/
	char	custNo[7];			/*19-7*/
	char	responseStatus[2];	/*26-2*/
	char	completionFlag;		/*28-1*/ /* 0- incomplete; 1 complete */
	char	noOfAccsHere[2];	/*29-2*/
	char	lastAccNo[14];		/*31-14*/
	struct	accountDetails 	accDetails[50]; /*45--*/
	char	endOfText;
	char	nullPad;
};


struct custSearchByIdRequest 	/* Ver 3.27 - Customer search using ID number */
{
	char	msgLen[4];					/*0 - 4*/
	char	tuxConnectionNo;			/*4 - 1*/
	char	branchName[10];				/*5 - 10*/
	char	source[2];					/*15 - 2*/
	char	service[2];					/*17 - 2*/ /* 57 - Customer search using ID number*/
	char	responseStatus[2]; 			/*19 - 2*/ /* space in inMessage */
	char	idType;						/*21 - 1*/ /*  I - Saudi ID 
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
												*/
	char	idNo[15];					/*22 -15*/
	char	lastCustNo[7];				/*37 - 7*/
	char	arabicCodePage;				/*44 - 1*/  /* Ver 3.30 : W-Window else ASMO708*/
	char	filler[100];				/*45 - 100*/ /* for future purpose -should be spaces*/
	char	nullPad;
};

struct	custSearchDetails 	  /* Ver 3.27 - Customer Search using ID number */
{
	char	custNo[7];
	char	shortName[30];
	char	address1[30];
	char	address2[30];
	char	filler[30];
};

struct custSearchByIdResponse			/* Ver 3.27 - Customer search using ID number - Response */
{
	char	msgLen[4];					/*0 -4*/
	char	tuxConnectionNo;			/*4 -1*/	/* future purpose*/
	char	branchName[10];				/*5-10*/
	char	source[2];					/*15-2*/	
	char	service[2];					/*17-2*/	/* 57 - Customer search using ID number */
	char	responseStatus[2];			/*19-2*/
	char	idType;						/*21-1*/
	char	idNumber[15];				/*22-15*/
	char	lastRetrivedCustNo[7];		/*37-7*/
	char	completionFlag;				/*44-1*/ 	/* 0- incomplete; 1 complete */
	char	totalCust[5];				/*45-5*/
	char	arabicCodePage;				/*46-1*/ 	/*Ver 3.30 W-Window else ASMO708*/
	char	filler[49];					/*50-49*/
	char	noOfCustHere[2];			/*100-2*/
	struct	custSearchDetails 	custDetails[50]; /*102--*/
	char	nullPad;
};
