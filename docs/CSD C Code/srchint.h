
struct reqMsgSrchEngineEnq
{
	char	msgLen[5];
	char	branchName[10];		/* Left justified; filled with spaces
								   CORPCASH - corpcash application
								   TPS      - TAPS application
								   OPI		- OPICS
								   TLY		- Telemoney
								   EXB		- Eximbills
								   DCP		- Draft Cheque
								   PAY		- Payroll
								   STD		- Static Data 
								*/
	char	source[2];			/* Module abbreviation ; eg., EC - Electronic Corporate */
	char 	service[2];			/* 00 - Search Engine */
	char	responseStatus[2];	/* will be spaces in request message */
	char	retrieveFlag;		/* 1-To get more than one record; 0-To get one record */
	char	name[60];			/* Name of the suspect; left justified filled with spaces */
	char	idNo[15];			/* Identification of the suspect */
	char	searchLevel;		/* Search Level */
	char	filler[49];			/* for future use */
	char	nullPad;
};

struct srchEngineDetails
{
	char	englishName[35];
	char	arabicName[35];
	char	idNo[15];
	char	dobDetails[20];
	char	placeOfBirth[20];
	char	position[20];
	char	miscInfo[50];
	char	extractFlag;
	char	sourceName[4];		/* Name supplied by Sources like 
								   UN, SAMA, OFAC
								*/
};

struct resMsgSrchEngineEnq
{
	char	msgLen[5];
	char	branchName[10];		/* Left justified; filled with spaces
								   CORPCASH - corpcash application
								   TPS      - TAPS application
								   OPI		- OPICS
								   TLY		- Telemoney
								   EXB		- Eximbills
								   DCP		- Draft Cheque
								   PAY		- Payroll
								   STD		- Static Data 
								*/
	char	source[2];			/* Module abbreviation ; eg., EC - Electronic Corporate */
	char 	service[2];			/* 00 - Search Engine */
	char	responseStatus[2];	/* 00 - Success
								   03 - Incorrect Message
								   18 - No such record exists
								   99 - Internal Errors
								*/
	char	retrieveFlag;		/* 1-To get more than one record; 0-To get one record */
	char 	filler[50];
	char	recsRetrieved[2];	/* Total records retieved. Right justified filled with 
								   zeros. (Maximum no. of records can be 50) 
								*/
	struct  srchEngineDetails	details[50];
};
