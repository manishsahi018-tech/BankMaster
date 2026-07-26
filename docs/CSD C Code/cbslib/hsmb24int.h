/* An include file for sthsmint and stb24int */

/* Request & response message for HSM */

struct hsmrequestmsg
{
	long 	mtype;
	char 	cardNo[19];
	char	expiryDate[8];
	char 	branchEncryptedPin[10];
	char	requestType;	/* 0-Initial card; 2-ForceCard; 3-Force PIN */
	char	nullPad;
};

struct hsmreplymsg
{
	long 	mtype;
	char 	cardNo[19];
	char	retStatus[2]; /*00 -success; 01-Failure */
	char 	pinOffset[4];
	char 	cvv[3];
	char 	pvv[4];
	char	nullPad;
};

/* Request & response message for BASE24 */

struct b24requestmsg
{
	long 	mtype;
	char	action;			/* 0-New card; 1-card update; 2-AccInfoUpdate; 3-PBF Add; 4-PBF update */
	char 	cardNo[19];
	char	cardType[2];	/* B24 values for Admin, Pension,CPS, etc, etc */
	char	pinOffset[4];   /* should be blank for update */
	char	atmAccNo[19];
	char	atmAccStatus;
	char	atmAccDesc[10];
	char	cardStatus;
	char	restrictedReason; /* 1- Warned for SAMA ; 2- Blocked for SAMA */
	char	branchCode[4];
	char	expiryDate[4];	/* YYMM */
	char	packageAcc;		/* same as CRD; required for calculating withdrawal limits */
	/* The following 4 fields are added for the Opportunity Management Project */
	char  	primaryOrSupplementary;     /*P-Primary; S-Supplementary*/
	char  	custNo[10];            
	char  	idNo[15];              
	char  	idType;			/* I-SaudiID, Q-Iqama, etc */
	/* The following fields are added by Rajesh on 21/08/06 for EMV(chip cards) purpose */
	char 	accLimit[4];        /*0000 or spaces*/
	char 	sendCardBlk;        /*space, N or Y*/
	char 	sendPutData;        /*space, N or Y*/
	char 	lowerConsLimit[4];  /*0000 or spaces*/
	char 	dataTag[4];         /*spaces*/
	char 	sendPinUnBlock;  
	char 	sendPinChange;  
	char 	pinSyncAct;         /*1 or 0*/
	char 	accScriptMgt;    
	char 	issApplDataFrmt;    
	char 	actTblIndex;    
	char	nullPad;
};

struct b24replymsg
{
	long 	mtype;
	char 	cardNo[19];
	char	retStatus[3]; /*000 -success or BASE24 error messages */
	char	nullPad;
};

#define	INITIAL	'0'
#define	FORCE_CARD	'2'
#define FORCE_PIN	'3'
