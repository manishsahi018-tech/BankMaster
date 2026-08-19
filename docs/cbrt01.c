/*
	Objective	:	Function to receive message from CBS for CMS related services

	Author		:	S. Rajesh
	Date		:	23-12-2008.

	Modification History :
	---------------------    
	Ver		Author		Date				Details of Modification
	===		======		====				=======================
	1.0 	Rajesh	    23/12/08		Modified for CBS-CMS interim solution project

	1.1		Rajesh		01/03/10		Modified to mask the card number in the log for PCI complaince

*/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <isam.h>
#include <unistd.h>			/* for sleep() */
#include <ctype.h>			/* for isdigit() */
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include "cbrt.h"
#include "../cbslib/layout.h"  
#include "../cbslib/cblayout.h"
#include "tuxint.h"

#define	NO	0
#define	YES	1

#define	SEND			"send"
#define	RECV			"recv"
#define	BOTH			"both"

#define	ACCUPDATE     	"61"
#define	ACCSUPERVISOR 	"62"

#define	CUSTUPDATE    	"01"
#define	CUSTSUPERVISOR	"02"

#define	CARDUPDATE    	"41"	/* Ver 3.24 */
#define	CARDSUPERVISOR	"42"	/* Ver 3.24 */

#define VISA_PAYMENT_ACCNO1		"0000017910055124000" 
#define VISA_PAYMENT_ACCNO2		"0000017310055124000" 
#define UTILITY_PAYMENT_MEMO  	"019" /* Mail from Edwin dt.10-Jan-2001*/

#define ONLY_PENDING_AMOUNT		1
#define COMPLETE_INFO      		2

#define NOT_FOUND				1
#define REC_FOUND  				0
#define RESTRICTED				2
#define	DORMANT					3
#define	CLOSED					4
#define DR_RESTRICTED			5
#define CR_RESTRICTED			6

#define MAX_DIRECT_TRANS		99

/* Informaton for what */

char whatmsg1[80] = "@(#)Online Gateway for CBS-CMS                  RAJ     Ver 1.00";
char whatmsg2[80] = "@(#)Arab National Bank                                    Dec'08";

extern int ahaerr;

extern char *tpgErrPathName, *dpErrPathName, *gldPathName, *bkdPathName, *crdPathName, *cedPathName, *cndPathName, *pendPathName, *ankPathName, *ankPathName, *thdPathName, *thdIdxPathName, *stCtlTabPathName, *stCalPathName, *stCustTabPathName, *stCustLogPathName, *stIdTabPathName, *stIdLogPathName, *stAddrTabPathName, *stAddrLogPathName, *stCardPathName, *stAccLogPathName, *stUserPathName, *ciatmPathName, *reqPathName, *etIsamPathName, *cipendPathName, *o3dPathName, *ridPathName, *opPathName, *acdPathName, *iadPathName, *bkdHistPathName, *acctBmPathName, *dzdPathName, *ardPathName, *aadPathName, *fudPathName, *chqPathName, *pydPathName, *mmdPathName,*shdPathName, *frdPathName, *stopChqLogPathName, *stCardTabPathName, *stCardLogPathName, *prdPathName, *o3dPathName, *prtPathName, *rtupendPathName, *cfcpcfchPathName, *logPathName, *etPathName, *cardSeqPathName;

int tpgErrFile, dpErrFile, gldFile, gldMemoFile, bkdFile, crdFile, crdFile1, cedFile, cndFile, cndFile1, pendFile, ankFile, ankFile1, thdFile, thdIdxFile, thdFile1, stCtlFile, stCalFile, stCustTabFile, stCustLogFile, stIdTabFile, stAddrTabFile, stCardFile, stAccLogFile, stUserFile, ciatmFile, reqFile, etIsamFile, cipendFile, o3dFile, ridFile, opFile, acdFile, iadFile, bkdHistFile, dpHeaderFile, dpTransFile, acctBmFile, dzdFile, ardFile, aadFile, fudFile, chqFile, pydFile, mmdFile,shdFile, frdFile, stopChqLogFile, stCardTabFile, stCardLogFile, gldFile1, prdFile, stCtlTabFile, cardSeqFile; /* Ver 3.24 */

struct keydesc dpErrKey, gldKey, gldMemoKey, bkdKey, tpgErrKey, crdKey, crdKey1, cedKey, cndKey, cndKey1, pendKey, ankKey, thdKey, thdIdxKey, thdKey1, stUserKey, stAccLogKey, stCtlKey, stCalKey, stCustKey, stCustLogKey, stIdKey, stAddrKey, stCardKey, ciatmKey, reqKey, etIsamKey, cipendKey, o3dKey, ridKey, opKey, directTransKey, acrKey, acdKey, iadKey, bkdHistKey, dpHeaderKey, dpTransKey, acctBmKey, dzdKey, ardKey, aadKey, fudKey, chqKey, pydKey, mmdKey, shdKey, frdKey, stopChqLogKey, cardTabKey, cardLogKey, gldKey1, cardSeqKey; /* Ver 3.24 */

int   gldFileTrans, gldFile1Trans, crdFileTrans, cedFileTrans, thdFileTrans, thdIdxFileTrans, tgFileTrans, bkdFileTrans,o3dFileTrans, dpHeaderFileTrans, dpTransFileTrans, bkdHistFileTrans, aadFileTrans, ardFileTrans, dzdFileTrans, shdFileTrans, acrFileTrans, dpdFileTrans, dprFileTrans, dpsFileTrans, dpgFileTrans, dpiFileTrans, stAccFileTrans, frdFileTrans, stCustTabFileTrans, stCustLogFileTrans, stIdTabFileTrans, stIdLogFileTrans, stAddrTabFileTrans, stAddrLogFileTrans, stAccLogFileTrans; 
struct keydesc  gldKeyTrans, crdKeyTrans, cedKeyTrans, thdKeyTrans, thdIdxKeyTrans, tgKeyTrans, bkdKeyTrans, o3dKeyTrans, dpHeaderKeyTrans, dpTransKeyTrans, bkdHistKeyTrans, aadKeyTrans, ardKeyTrans, dzdKeyTrans, shdKeyTrans, dpsKeyTrans, dpdKeyTrans, dprKeyTrans, dpgKeyTrans, dpiKeyTrans, acrKeyTrans, stAccKeyTrans, frdKeyTrans, stCustTabKey, stCustLogKey, stIdTabKey, stIdLogKey, stAddrTabKey, stAddrLogKey, stAccLogKey, stCtlTabKey;

struct 	gld0data 		gldRec, gldRec1, gldRec2;
struct  gld0data05      gldMemoRec;
struct 	crd0data 		crdRec;
struct 	ced0data 		cedRec;
struct 	thd0data 		thdRec, thdRec1;
struct 	thd1data 		thd1Rec;

struct 	cnd0dataC0 		cndRecC0;
struct 	cnd0dataXC 		cndRecXC;
struct 	inMessage 		message;
struct  branchActivityOnCard     stCardLogRec;   /* Ver 3.24 */
struct 	cardInfo 		stCardRec, stCardTabRec; /* Ver 3.24 */
struct 	ctlInfo  		ctlRec;
struct 	countryInfo  	stCtlRec;
struct 	branchInfo  	stCtlRecBD;			/* Ver 3.28 */
struct 	systemConfig  	stCtlRecSC;			/* Ver 3.28 */
struct 	bmLedgers  		stCtlLedgerRec;
struct	userProfile   	stUserRec;
struct 	dzd0data        dzdRec;
struct 	ank0dataMM      ankRecMM;
struct 	ank0dataM1      ankRecM1;
struct cardSequenceInfo	cardSeqRec;

struct cbcustinfo		cbCustTabRec;

struct msgReceived1	{
	char	msgLen[4];			/* 0 - 4*/
	char	tuxConnectionNo;	/* 5 - 1*/		/* used for the different connection to Tuxedo*/
	char	branchName[10];		/* 6 - 10*/
	struct	inMessage	message;/*16 - 15388*/
} incomingMsg;

struct 	ankrec	{
	char	liveChar;
	char	prgName[6];
	char	seqNo[5];
	char	filler[120];
} ankRec;

struct currDetail {
	short   decimalPlace;
	char    currName[30];
	char	existFlag;
	double	exRate;
	short	drBaseDays;
	short	crBaseDays;
	struct baserates {
		short	baseRateCode;
		double  baseRate1;
		double  baseRate2;
	} baseRates[100];
} currRec[100];

struct currFxAcc
{
	char	fxPosAccNo[14]; /* Added to configure the FX position account */
}currFxRec[100];

struct IRA 
{
	char	accNo[13];
	char	recType[2];
	double  drIntRate;
	char	iraCalculationDate[8];
	double	futureRepaymentAmt;
	int		totDiaryRecs;
	double  intEarnedInAdvance;
}iraRecOnBankingDate, iraRecOnRepayDate;

struct DPD 
{
	char	accNo[13];
	char	branchCode[4];
	int		noOfDpd;
	double	totPastUnpaidAmt;
	int		totArdRecs;
	char	lastRepaymentDate[8];
}dpdCalcRec;

char thdIndexRec[100];

char dateTime[20], Msg[1024], tpgError[100], bankingDate[10], bmBankingDate[10], mainAccDecPlace, bmAmtStr[25], mainAccBranchCode[5], contraAccBranchCode[5], mainAccAtmFlag, contraAccAtmFlag, tpgErrorDesc[100], bmMainAccNo[20], bmContraAccNo[20];
int msgSeqNo = 0, line = 0, page = 1, alphaFlag = 1, mainAccDormant = NO, contraAccDormant = NO;
extern int errno;

extern char sourceBranchCode[5], destBranchCode[5], progName[30], o2dFileName[50];
extern char directPartitionNo[10], charAmtToBeUnblocked[20];
extern char finnoneBmTransCode[5], finnoneProdType ;
extern char cbsCardType, cbsIntUserId[20];
extern char migNarr1[10],migNarr2[10],migNarr3[10],migNarr4[10],migNarr5[10],migNarr6[10],migNarr7[10],migNarr8[10],migNarr9[10],migNarr10[10],migNarr11[10],migNarr12[10],migNarr13[10],migNarr14[10], migNarr15[10], migNarr16[10], migNarr17[10], migNarr18[10], payNarr[10];
extern char intAppFromNarr[10], intAppToNarr[10], intAppNarr[10];
extern char mainAccNo[20], contraAccNo[20];
extern int debug, extraDebug, tpgTimeOut, commsTimeOut, OnlineFlag, compressFlag, writeOffDpd, connectionNo, transactionBegin, isamRetry, logFileOpened;
extern pid_t PID;

FILE *inFile, *tmpFile, *logFp, *cfcpcfch, *prtFp ;
extern FILE *serverLogFp;
extern int	postThruDirectPost;
extern int	postToDormantAcc;
extern char checkTransTypes[200];
extern char restrictedPackValues[200];

int sockfd=0, onlnFlg=0, TimeoutFlag; 
extern int  finTimeOut;
extern char finHostName[50], finPortNo[20];
struct sockaddr_in serv_addr;
struct hostent *myhost;     /** Ver 2.4 **/
void   toAlarm1();

struct tm   *systemDate;  /* structure declaration in time.h */
time_t systime;

char *getpath();
char *getDateTime();
char *trim(char *);
int rtucomms();
void windup();
char    *doubleToPack();	/* Ver 3.28 */
double  packToDouble();
char    *findSubLedg();

double mainAccTotTransAmt = 0; /* defined globally as it is required for directpost() */
double pendingAmt = 0; /* defined globally as it will be required for many other functions*/

struct custInfoRequest		custInfoReqMsg;
struct custInfoResponse		custInfoResponseMsg;

struct accInfoRequest		acctInfoReqMsg;
struct accInfoResponse		acctInfoResponseMsg;

/* defined globally to get the values at validation level itself, so to avoid reading stcaltab.dat each time inserting data while Cust/Acc opening. */ /* Ver 3.28 */
char idIssueDateH[10], idIssueDateG[10], idExpiryDateH[10], idExpiryDateG[10], dobDateH[10], dobDateG[10], homeCountryIdIssueDateH[10], homeCountryIdIssueDateG[10], homeCountryIdExpiryDateH[10], homeCountryIdExpiryDateG[10], passportIssueDateH[10], passportIssueDateG[10], passportExpiryDateH[10], passportExpiryDateG[10]; 

char gccCountryCustomer, newCustNo[20], stAccountNo[20]; /* Ver 3.28 */

openRequiredFiles()
{
	char fileName[20];

	if ( extraDebug > 5 )
	{
		fprintf(serverLogFp, "%s|%5d| openRequiredFiles() : Opening log file %s...\n", getDateTime(), PID, logPathName);
		fflush(serverLogFp);
	}

	if ( (logFp = fopen(logPathName, "a+")) == NULL )
	{
		printf("%s|%5d| Error %d while opeing report file %s for append\n", getDateTime(), PID, errno, logPathName);
		fprintf(serverLogFp, "%s|%5d| Error %d while opeing report file %s for append\n", getDateTime(), PID, errno, logPathName);
		perror(fileName);
		return -1 ;
	}

	logFileOpened=YES;

	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d| openRequiredFiles() : Getting Banking date...\n", getDateTime(), PID);
		fflush(logFp);
	}

	readBankingDate();

	if ( openIsamFiles() )
	{
		fclose(logFp);
		strncpy(message.transStatus, INTERNALERR, 2);
		return -1;
	}

	return 0;
}

numericCheck(string, length)
char *string;
int length;
{
	int i;
	for ( i = 0; i < length; i++ )
		if ( !isdigit(string[i]) )
			return -1;
	return 0;
}

openReportFile()
{
	return 0;
}

getBankingDate()
{
	char cfcRec[150];

	/* reading for banking date */

	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d| getBankingDate() : Opening %s..\n", getDateTime(), PID, tpgErrPathName);
		fflush(logFp);
	}
	if ( (cfcpcfch = fopen(cfcpcfchPathName, "r")) == NULL )
	{
		fprintf(logFp, "%s|%5d| Error while opening banking date file %s\n", getDateTime(), PID, cfcpcfchPathName );
		fflush(logFp);
		perror(cfcpcfchPathName);
		return -1;
	}

	/* reading CFCPCFCH file for banking date */

	if ( (fread(cfcRec, 100, 1, cfcpcfch)) == NULL )
	{
		fprintf(logFp, "%s|%5d| Error while reading banking date file %s\n", getDateTime(), PID, cfcpcfchPathName );
		fflush(logFp);
		fclose(cfcpcfch);
		return -1;
	}
	strncpy(bmBankingDate, &cfcRec[41], 6);
	bmDateToActual(&cfcRec[41], bankingDate);
	fclose(cfcpcfch);
	return 0;
}

openIsamFiles()
{
	char tmpStr[100];

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, gldPathName);
		fflush(logFp);
	}

	if ( (gldFile = isopen(gldPathName, ISMANULOCK+ISINOUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, gldPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(gldFile, &gldKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, crdPathName);
		fflush(logFp);
	}

	if ( (crdFile = isopen(crdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, crdPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(crdFile, &crdKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, cedPathName);
		fflush(logFp);
	}

	if ( (cedFile = isopen(cedPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, cedPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(cedFile, &cedKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, cndPathName);
		fflush(logFp);
	}

	if ( (cndFile  = isopen(cndPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, cndPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(cndFile, &cndKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s with different file pointer..\n", getDateTime(), PID, cndPathName);
		fflush(logFp);
	}

	if ( (cndFile1  = isopen(cndPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, cndPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(cndFile1, &cndKey1, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, opPathName);
		fflush(logFp);
	}
	if ( (opFile  = isopen(opPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, opPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(opFile, &opKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, aadPathName);
		fflush(logFp);
	}
	if ( (aadFile = isopen(aadPathName, ISMANULOCK+ISINOUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, aadPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(aadFile, &aadKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, dzdPathName);
		fflush(logFp);
	}
	if ( (dzdFile  = isopen(dzdPathName, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, dzdPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(dzdFile, &dzdKey, 2);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s with different file pointer..\n", getDateTime(), PID, ankPathName);
		fflush(logFp);
	}
	if ( (ankFile1 = isopen(ankPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, ankPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(ankFile1, &ankKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, cedPathName);
		fflush(logFp);
	}

	if ( (cedFile = isopen(cedPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, cedPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(cedFile, &cedKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| openIsamFiles() : Opening %s..\n", getDateTime(), PID, mmdPathName);
		fflush(logFp);
	}
	if ( (mmdFile = isopen(mmdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, mmdPathName);
		fflush(logFp);
		return -1;
	}
	isindexinfo(mmdFile, &mmdKey, 1);
	
	return 0;
}

void windup()
{
	if ( logFileOpened == YES )
	{
		iscleanup();
		fclose(logFp);
		fclose(prtFp);
	}
}
/*
char *getDateTime()
{
	systime = time(NULL);	/* get the system time 
	systemDate = localtime( &systime );
	sprintf(dateTime, "%02d/%02d|%02d:%02d:%02d", systemDate->tm_mday, systemDate->tm_mon +1, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
	return dateTime;
}

unsigned char calculateBCC( buff )
char *buff;
{
	unsigned char bccValue;
	bccValue = *buff++;
	for (; *buff; buff++ )
		bccValue = bccValue ^ *buff;
	return bccValue;
}
*/

/**   						GET BALANCE 				**/

getBalance( inBuf )
struct balanceInfo *inBuf;
{
}

getEnhancedBalance( inBuf, outBuf )
struct balanceInfoRequest *inBuf;
struct balanceInfoResponse *outBuf;
{
}

/****						MINI STATEMENT 			*****/

getMiniStmt( inBuf )
struct miniStatement *inBuf;
{
}

/**   			GET BANKING DATE		**/

getBankDate( inBuf )
struct bankcomDate *inBuf;
{
	char reportBalanceDate[20];

	fprintf(logFp, "%s|%5d| Banking date[%.10s] Information sought \n", getDateTime(), PID, bankingDate);			
	fflush(logFp);
	getBankingDate();
	strncpy(inBuf->bankingDate, bankingDate, 8);
	memset(&cndRecC0.liveChar, ' ', sizeof cndRecC0);
	strncpy(cndRecC0.key, "C000000", 6);
	if ( isRead(cndFile, &cndRecC0.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| Error %d while reading CND0DATA for C00000 in order to read banking date\n", getDateTime(), PID, iserrno);
		fflush(logFp);
		strncpy(inBuf->responseStatus, INTERNALERR, 2);
		return -1;
	}
	bmDateToActual(cndRecC0.reportBalanceDate, reportBalanceDate);
	strncpy(inBuf->reportBalanceDate, reportBalanceDate, 8);
	strncpy(inBuf->responseStatus, SUCCESS, 2);
	return 0;
}

/****						FULL STATEMENT 			*****/

getFullStmt( inBuf )  /* 06- RIB Intra day statement */
struct fullStatement *inBuf;
{
	return 0;
}

/****		On demand statement (Similar to full statement ) *****/

getOndemandStmt( inBuf ) /* Service code 07 - Used for phone banking, static data, etc */
struct ondemandStatement *inBuf;
{
	int retStatus, noOfTrans = 0, totNoOfTrans = 0, statusPosition = 173, completionFlag = YES, i=0;
	double transAmt, bookBal = 0, totDebitAmt=0, totCreditAmt = 0, bfBal = 0;
	char tmpStr[20], tmpStr1[20], bmAccNo[15], bmCustNo[10], *statusPtr, lastTransPtr[10], strTransAmt[20];

	statusPtr = (char *) &inBuf->msgLen;
	strncpy(inBuf->noOfTransHere, "000", 3);

	fprintf(logFp, "%s|%5d| ondemandStatement sought for %.14s from %.8s to %.8s with transPointer as [%.5s] from branch [%.10s]\n", getDateTime(), PID, inBuf->accNo, inBuf->fromDate, inBuf->toDate, inBuf->lastTransPtr, inBuf->branchName);			
	fflush(logFp);

	if ( readCnd(inBuf->accNo) )
	{
		fprintf(logFp, "%s|%5d| (ondemand) Invalid currency on the main account %.14s!!\n", getDateTime(), PID, inBuf->accNo);
		fflush(logFp);
		memset(&cndRecXC.liveChar, ' ', sizeof cndRecXC);  
		cndRecXC.decimalPlace = '2';
		strncpy(cndRecXC.exchangeRateExt, "00000100000000", 14 ); /* new interest rate of 14 chars length */
	}

	if ( strncmp(inBuf->accNo+5, "6199999", 7) > 0 )
	{
		fprintf(logFp, "%s|%5d| Encountered wrong alphanumeric customer number %.7s which is greater than 6199999 in Account Number\n", getDateTime(), PID, inBuf->accNo+5);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, NOMAINACC, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return 0;
	}

	sprintf(tmpStr, "%.8s", inBuf->fromDate);
	if ( strncmp(inBuf->lastTransPtr, "00000", 5) == 0 || strncmp(inBuf->lastTransPtr, "     ", 5) == 0 )
	{
		if ( validate(tmpStr) < 0 )
		{
			fprintf(logFp, "%s|%5d| (ondemand) Invalid from date [%.8s]\n", getDateTime(), PID, inBuf->fromDate);			
			fflush(logFp);
			statusPtr += statusPosition;
			strncpy(statusPtr, INCORRECTMSG, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
	}

	sprintf(tmpStr, "%.8s", inBuf->toDate);
	if ( validate(tmpStr) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) Invalid to date [%.8s]\n", getDateTime(), PID, inBuf->toDate);			
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INCORRECTMSG, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return 0;
	}

	/* check the presense of an account */

	actualToBmAcc(inBuf->accNo, bmAccNo);

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(gldRec.accNo, bmAccNo, 13);
	if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISREAD/ISEQUAL error %d on gld0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			statusPtr += statusPosition;
			strncpy(statusPtr, NOMAINACC, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}

	/* read the corresponding customer register to get his name & address */

	actualToBmCust(&inBuf->accNo[5], bmCustNo);

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, bmCustNo, 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISREAD/ISEQUAL error %d on crd0data for %.6s[%.14s]\n", getDateTime(), PID, iserrno, bmCustNo,inBuf->accNo);			
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			statusPtr += statusPosition;
			strncpy(statusPtr, NOMAINACC, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}

	/* copy Name, address, languagecode, branchCode */
	if ( crdRec.language == '1' )
		inBuf->languageCode = '1';
	else
		inBuf->languageCode = '0';
	for ( i=0; i < 30; i++ )
		if ( crdRec.shortName[i] >= 0 && crdRec.shortName[i] < 27 )
			crdRec.shortName[i] = ' ';
	strncpy(inBuf->custName, crdRec.shortName, 30);
	for ( i=0; i < 60; i++ )
		if ( crdRec.address1[i] >= 0 && crdRec.address1[i] < 27 )
			crdRec.address1[i] = ' ';
	strncpy(inBuf->custAddress, crdRec.address1, 60);
	strncpy(inBuf->branchCode, gldRec.branchCode, 4);


	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d| getOndemandStmt() : Opening %s..\n", getDateTime(), PID, thdPathName);
		fflush(logFp);
	}
	if ( (thdFile = isopen(thdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, thdPathName);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}
	isindexinfo(thdFile, &thdKey, 1);

	if ( (thdFile1 = isopen(thdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, thdPathName);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		isclose(thdFile);
		return -1;
	}
	isindexinfo(thdFile1, &thdKey1, 1);

	inBuf->completionFlag = '1';
	strncpy(inBuf->totNoOfTrans, "00000", 5);
	strncpy(inBuf->noOfTransHere, "000", 3);
	strncpy(inBuf->responseStatus, SUCCESS, 2);
	inBuf->decimalPlace = cndRecXC.decimalPlace;
	bookBal = bmAmtToDbl(gldRec.bookBal, 14);

	memset(&thdRec.liveChar, ' ', sizeof thdRec);
	strncpy(thdRec.accNo, bmAccNo, 13);
	thdRec.recType = '0';
	strncpy(thdRec.transCounter, inBuf->lastTransPtr, 5);
	if ( isstart(thdFile, &thdKey, 26, &thdRec.liveChar, ISGREAT) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISSTART/ISGREAT error %d on thd0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
		fflush(logFp);
		if ( iserrno == 111 ||  iserrno == 112 || iserrno == 110 )
		{
			strncpy(inBuf->lastTransPtr, "00000", 5); /* just for any error */
			statusPtr += statusPosition;
			strncpy(statusPtr, SUCCESS, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			isclose(thdFile);
			isclose(thdFile1);
			return 0;
		}
		strncpy(inBuf->lastTransPtr, "00000", 5); /* just for any error */
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		isclose(thdFile);
		isclose(thdFile1);
		return -1;
	}

	/* Read next available transactions */

	completionFlag = YES;
	strncpy(lastTransPtr, "0000000", 5);
	while ( isRead(thdFile, &thdRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(thdRec.accNo, bmAccNo, 13) )
			break;

		if ( thdRec.recType != '0' ||  	/* only the main record */
			 thdRec.statmentFlag >= '1' ) /* allowed to be in statement */
			continue;

		bmDateToActual(thdRec.postDate, tmpStr);
		if ( strncmp(tmpStr, inBuf->fromDate, 8) < 0 )
			 continue;


		sprintf(tmpStr, "%.14s", thdRec.transAmt);
		if ( tmpStr[13] >= 'P' )
		{
			tmpStr[13] = tmpStr[13] - 'P' + '0';
			transAmt = atof(tmpStr) * -1;
			sprintf(strTransAmt, "%015.0f", transAmt);
			totDebitAmt += transAmt;
		}
		else
		{
			transAmt = atof(tmpStr);
			sprintf(strTransAmt, "+%014.0f", transAmt);
			totCreditAmt += transAmt;
		}

		bmDateToActual(thdRec.postDate, tmpStr);
		if ( strncmp(tmpStr, inBuf->toDate, 8) > 0 )
			 continue;

		totNoOfTrans++; /* total # of trans. falls in this category */
		if ( noOfTrans < 50 )
		{
			noOfTrans++;
			strncpy(lastTransPtr, thdRec.transCounter, 5);
			statusPosition += sizeof(struct ondemandStmtTrans);
			strncpy(inBuf->transDetails[noOfTrans-1].userId, thdRec.userId, 3);
			bmDateToActual(thdRec.postDate, tmpStr);
			strncpy(inBuf->transDetails[noOfTrans-1].postDate, tmpStr, 8);
			bmDateToActual(thdRec.valueDate, tmpStr);
			strncpy(inBuf->transDetails[noOfTrans-1].valueDate, tmpStr, 8);
			strncpy(inBuf->transDetails[noOfTrans-1].transType, thdRec.transType, 2);
			for (i=0;i<25;i++ )
				if ( thdRec.narrative1[i] >= 0 && thdRec.narrative1[i] < 27 )
					thdRec.narrative1[i] = ' ';
			strncpy(inBuf->transDetails[noOfTrans-1].narrative1, thdRec.narrative1, 25);
			strncpy(inBuf->transDetails[noOfTrans-1].transAmt, strTransAmt, 15);
			/*fprintf(logFp, "%.5s %.6s %.6s %.2s %.14s %.25s\n", thdRec.transCounter, thdRec.postDate, thdRec.valueDate, thdRec.transType, thdRec.transAmt, thdRec.narrative1);*/
			/* narrative2 & narrative 3 */

			strncpy(thd1Rec.accNo, thdRec.accNo, 26);
			thd1Rec.recType = '1';
			if (isRead(thdFile1, &thd1Rec, ISEQUAL) < 0 )
			{
				if ( iserrno != 111 && iserrno != 112 && iserrno != 110 )
					fprintf(logFp, "%s|%5d| (ondemand) ISSTART/ISGTEQ error %d on thd0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
				fflush(logFp);
			}
			else
			{
				for (i=0; i<25; i++ )
				{
					if (thd1Rec.narrative2[i] >= 0 && thd1Rec.narrative2[i] < 27 )
						thd1Rec.narrative2[i] = ' ';
					if (thd1Rec.narrative3[i] >= 0 && thd1Rec.narrative3[i] < 27 )
						thd1Rec.narrative3[i] = ' ';
				}
				strncpy(inBuf->transDetails[noOfTrans-1].narrative2, thd1Rec.narrative2, 25); 
				strncpy(inBuf->transDetails[noOfTrans-1].narrative3, thd1Rec.narrative3, 25); 
			}
		}
		else
		{
			completionFlag = NO;
			if ( strncmp(inBuf->lastTransPtr, "00000", 5) )
				break; /* not to scan the whole history for subsequent calls*/
		}
	}
	/* calculate B/F balance */
	if ( strncmp(inBuf->lastTransPtr, "00000", 5) == 0 ) /* only for the first time */
	{
		bfBal = bookBal + -totDebitAmt - totCreditAmt;
		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d| (ondemand) BookBal=%.f;totDebitTrans=%.f;totCreditTrans=%.f; so B/FBal=%.f\n", getDateTime(), PID, bookBal, totDebitAmt, totCreditAmt, bfBal);
			fflush(logFp);
		}
		if ( bfBal < 0 )
			sprintf(tmpStr, "%015.0f", bfBal);
		else
			sprintf(tmpStr, "+%014.0f", bfBal);
		strncpy(inBuf->bfBal, tmpStr, 15);
	}
	else
		strncpy(inBuf->bfBal, "0000000000000000000", 15);

	/* fill totNoOfTrans; noOfTrans, lastTransPtr; completion flag */
	if ( strncmp(inBuf->lastTransPtr, "00000", 5) == 0 ) /* only for the first time */
	{
		sprintf(tmpStr, "%05d", totNoOfTrans);
		strncpy(inBuf->totNoOfTrans, tmpStr, 5);
	}
	else
		strncpy(inBuf->totNoOfTrans, "0000000", 5);
	sprintf(tmpStr, "%03d", noOfTrans);
	strncpy(inBuf->noOfTransHere, tmpStr, 3);
	strncpy(inBuf->lastTransPtr, lastTransPtr, 5);
	if ( completionFlag == YES )
		inBuf->completionFlag = '1';
	else
		inBuf->completionFlag = '0';
	statusPtr += statusPosition;
	strncpy(statusPtr, SUCCESS, 2);
	statusPtr += 2;
	*statusPtr++ = cndRecXC.decimalPlace;
	*statusPtr++ = 'Z';
	*statusPtr = NULL;
	sprintf(tmpStr, "%04d", strlen(inBuf));
	strncpy(inBuf->msgLen, tmpStr, 4);
	isclose(thdFile);
	isclose(thdFile1);
	fflush(logFp);
	return 0;
}

/****		On demand statement (ver.3.7 to add referenceNo) *****/

getTransEnquiry( inBuf )
struct transEnquiry *inBuf;
{
	int retStatus, noOfTrans = 0, totNoOfTrans = 0, statusPosition = 173, completionFlag = YES, i=0;
	double transAmt, bookBal = 0, totDebitAmt=0, totCreditAmt = 0, bfBal = 0;
	char tmpStr[20], tmpStr1[20], bmAccNo[15], bmCustNo[10], *statusPtr, lastTransPtr[10], strTransAmt[20];

	statusPtr = (char *) &inBuf->msgLen;
	strncpy(inBuf->noOfTransHere, "000", 3);

	fprintf(logFp, "%s|%5d| transactionEnquiry sought for %.14s from %.8s to %.8s with transPointer as %.5s from %.10s\n", getDateTime(), PID, inBuf->accNo, inBuf->fromDate, inBuf->toDate, inBuf->lastTransPtr, inBuf->branchName);			
	fflush(logFp);

	if ( readCnd(inBuf->accNo) )
	{
		fprintf(logFp, "%s|%5d| (ondemand) Invalid currency on the main account %.14s!!\n", getDateTime(), PID, inBuf->accNo);
		fflush(logFp);
		memset(&cndRecXC.liveChar, ' ', sizeof cndRecXC);  
		cndRecXC.decimalPlace = '2';
		strncpy(cndRecXC.exchangeRateExt, "00000100000000", 14 ); /* new interest rate of 14 chars length */
	}
	if ( strncmp(inBuf->accNo+5, "6199999", 7) > 0 )
	{
		fprintf(logFp, "%s|%5d| Encountered wrong alphanumeric customer number %.7s which is greater than 6199999 in Account Number\n", getDateTime(), PID, inBuf->accNo+5);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, NOMAINACC, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return 0;
	}


	sprintf(tmpStr, "%.8s", inBuf->fromDate);
	if ( strncmp(inBuf->lastTransPtr, "00000") == 0 || strncmp(inBuf->lastTransPtr, "     ", 5) == 0 )
	{
		if ( validate(tmpStr) < 0 )
		{
			fprintf(logFp, "%s|%5d| (ondemand) Invalid from date [%.8s]\n", getDateTime(), PID, inBuf->fromDate);			
			fflush(logFp);
			statusPtr += statusPosition;
			strncpy(statusPtr, INCORRECTMSG, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
	}

	if ( strncmp(inBuf->toDate, "          ", 8) == 0 ) /* If the toDate is coming as space, move the system date */
	{
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(inBuf->toDate, tmpStr, 8);
	}

	sprintf(tmpStr, "%.8s", inBuf->toDate);
	if ( validate(tmpStr) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) Invalid to date [%.8s]\n", getDateTime(), PID, inBuf->toDate);			
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INCORRECTMSG, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return 0;
	}

	/* check the presense of an account */

	actualToBmAcc(inBuf->accNo, bmAccNo);

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(gldRec.accNo, bmAccNo, 13);
	if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISREAD/ISEQUAL error %d on gld0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			statusPtr += statusPosition;
			strncpy(statusPtr, NOMAINACC, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}

	/* read the corresponding customer register to get his name & address */

	actualToBmCust(&inBuf->accNo[5], bmCustNo);

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, bmCustNo, 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISREAD/ISEQUAL error %d on crd0data for %.6s[%.14s]\n", getDateTime(), PID, iserrno, bmCustNo,inBuf->accNo);			
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			statusPtr += statusPosition;
			strncpy(statusPtr, NOMAINACC, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			return 0;
		}
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}

	/* copy Name, address, languagecode, branchCode */
	if ( crdRec.language == '1' )
		inBuf->languageCode = '1';
	else
		inBuf->languageCode = '0';
	for ( i=0; i < 30; i++ )
		if ( crdRec.shortName[i] >= 0 && crdRec.shortName[i] < 27 )
			crdRec.shortName[i] = ' ';
	strncpy(inBuf->custName, crdRec.shortName, 30);
	for ( i=0; i < 60; i++ )
		if ( crdRec.address1[i] >= 0 && crdRec.address1[i] < 27 )
			crdRec.address1[i] = ' ';
	strncpy(inBuf->custAddress, crdRec.address1, 60);
	strncpy(inBuf->branchCode, gldRec.branchCode, 4);


	if ( (thdFile = isopen(thdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, thdPathName);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		return -1;
	}
	isindexinfo(thdFile, &thdKey, 1);

	if ( (thdFile1 = isopen(thdPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, thdPathName);
		fflush(logFp);
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		isclose(thdFile);
		return -1;
	}
	isindexinfo(thdFile1, &thdKey1, 1);

	inBuf->completionFlag = '1';
	strncpy(inBuf->totNoOfTrans, "00000", 5);
	strncpy(inBuf->noOfTransHere, "000", 3);
	strncpy(inBuf->responseStatus, SUCCESS, 2);
	inBuf->decimalPlace = cndRecXC.decimalPlace;
	bookBal = bmAmtToDbl(gldRec.bookBal, 14);

	memset(&thdRec.liveChar, ' ', sizeof thdRec);
	strncpy(thdRec.accNo, bmAccNo, 13);
	thdRec.recType = '0';
	strncpy(thdRec.transCounter, inBuf->lastTransPtr, 5);
	if ( isstart(thdFile, &thdKey, 26, &thdRec.liveChar, ISGREAT) < 0 )
	{
		fprintf(logFp, "%s|%5d| (ondemand) ISSTART/ISGREAT error %d on thd0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
		fflush(logFp);
		if ( iserrno == 111 ||  iserrno == 112 || iserrno == 110 )
		{
			strncpy(inBuf->lastTransPtr, "00000", 5); /* just for any error */
			statusPtr += statusPosition;
			strncpy(statusPtr, SUCCESS, 2);
			statusPtr += 2;
			*statusPtr++ = cndRecXC.decimalPlace;
			*statusPtr++ = 'Z';
			*statusPtr = NULL;
			sprintf(tmpStr, "%04d", strlen(inBuf));
			strncpy(inBuf->msgLen, tmpStr, 4);
			isclose(thdFile);
			isclose(thdFile1);
			return 0;
		}
		strncpy(inBuf->lastTransPtr, "00000", 5); /* just for any error */
		statusPtr += statusPosition;
		strncpy(statusPtr, INTERNALERR, 2);
		statusPtr += 2;
		*statusPtr++ = cndRecXC.decimalPlace;
		*statusPtr++ = 'Z';
		*statusPtr = NULL;
		sprintf(tmpStr, "%04d", strlen(inBuf));
		strncpy(inBuf->msgLen, tmpStr, 4);
		isclose(thdFile);
		isclose(thdFile1);
		return -1;
	}

	/* Read next available transactions */

	completionFlag = YES;
	strncpy(lastTransPtr, "0000000", 5);
	while ( isRead(thdFile, &thdRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(thdRec.accNo, bmAccNo, 13) )
			break;

		if ( thdRec.recType != '0'  )
			continue;

		bmDateToActual(thdRec.postDate, tmpStr);
		if ( strncmp(tmpStr, inBuf->fromDate, 8) < 0 )
			 continue;


		sprintf(tmpStr, "%.14s", thdRec.transAmt);
		if ( tmpStr[13] >= 'P' )
		{
			tmpStr[13] = tmpStr[13] - 'P' + '0';
			transAmt = atof(tmpStr) * -1;
			sprintf(strTransAmt, "%015.0f", transAmt);
			totDebitAmt += transAmt;
		}
		else
		{
			transAmt = atof(tmpStr);
			sprintf(strTransAmt, "+%014.0f", transAmt);
			totCreditAmt += transAmt;
		}

		bmDateToActual(thdRec.postDate, tmpStr);
		if ( strncmp(tmpStr, inBuf->toDate, 8) > 0 )
			 continue;

		totNoOfTrans++; /* total # of trans. falls in this category */

		if ( noOfTrans < 50 )
		{
			noOfTrans++;
			strncpy(lastTransPtr, thdRec.transCounter, 5);
			statusPosition += sizeof(struct transEnquiryDetails);
			strncpy(inBuf->transDetails[noOfTrans-1].userId, thdRec.userId, 3);
			bmDateToActual(thdRec.postDate, tmpStr);
			strncpy(inBuf->transDetails[noOfTrans-1].postDate, tmpStr, 8);
			bmDateToActual(thdRec.valueDate, tmpStr);
			strncpy(inBuf->transDetails[noOfTrans-1].valueDate, tmpStr, 8);
			strncpy(inBuf->transDetails[noOfTrans-1].transType, thdRec.transType, 2);
			strncpy(inBuf->transDetails[noOfTrans-1].refNo, thdRec.transRef, 10);
			strncpy(inBuf->transDetails[noOfTrans-1].transCounter, thdRec.transCounter, 5);
			strncpy(inBuf->transDetails[noOfTrans-1].supervisorId, thdRec.supervisorId, 3);
			if ( thdRec.statmentFlag != NULL )
				inBuf->transDetails[noOfTrans-1].statementFlag = thdRec.statmentFlag;
			for (i=0;i<25;i++ )
				if ( thdRec.narrative1[i] >= 0 && thdRec.narrative1[i] < 27 )
					thdRec.narrative1[i] = ' ';
			strncpy(inBuf->transDetails[noOfTrans-1].narrative1, thdRec.narrative1, 25);
			strncpy(inBuf->transDetails[noOfTrans-1].transAmt, strTransAmt, 15);
			/*fprintf(logFp, "%.5s %.6s %.6s %.2s %.14s %.25s\n", thdRec.transCounter, thdRec.postDate, thdRec.valueDate, thdRec.transType, thdRec.transAmt, thdRec.narrative1);*/
			/* narrative2 & narrative 3 */

			strncpy(thd1Rec.accNo, thdRec.accNo, 26);
			thd1Rec.recType = '1';
			if (isRead(thdFile1, &thd1Rec, ISEQUAL) < 0 )
			{
				if ( iserrno != 111 && iserrno != 112 && iserrno != 110 )
					fprintf(logFp, "%s|%5d| (ondemand) ISSTART/ISGTEQ error %d on thd0data for %.13s\n", getDateTime(), PID, iserrno, bmAccNo);			
				fflush(logFp);
			}
			else
			{
				for (i=0; i<25; i++ )
				{
					if (thd1Rec.narrative2[i] >= 0 && thd1Rec.narrative2[i] < 27 )
						thd1Rec.narrative2[i] = ' ';
					if (thd1Rec.narrative3[i] >= 0 && thd1Rec.narrative3[i] < 27 )
						thd1Rec.narrative3[i] = ' ';
				}
				strncpy(inBuf->transDetails[noOfTrans-1].narrative2, thd1Rec.narrative2, 25); 
				strncpy(inBuf->transDetails[noOfTrans-1].narrative3, thd1Rec.narrative3, 25); 
			}
		}
		else
		{
			completionFlag = NO;
			if ( strncmp(inBuf->lastTransPtr, "00000", 5) )
				break; /* not to scan the whole history for subsequent calls*/
		}
	}
	/* calculate B/F balance */
	if ( strncmp(inBuf->lastTransPtr, "00000", 5) == 0 ) /* only for the first time */
	{
		bfBal = bookBal + -totDebitAmt - totCreditAmt;
		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d| (ondemand) BookBal=%.f;totDebitTrans=%.f;totCreditTrans=%.f; so B/FBal=%.f\n", getDateTime(), PID, bookBal, totDebitAmt, totCreditAmt, bfBal);
			fflush(logFp);
		}
		if ( bfBal < 0 )
			sprintf(tmpStr, "%015.0f", bfBal);
		else
			sprintf(tmpStr, "+%014.0f", bfBal);
		strncpy(inBuf->bfBal, tmpStr, 15);
	}
	else
		strncpy(inBuf->bfBal, "0000000000000000000", 15);

	/* fill totNoOfTrans; noOfTrans, lastTransPtr; completion flag */
	if ( strncmp(inBuf->lastTransPtr, "00000", 5) == 0 ) /* only for the first time */
	{
		sprintf(tmpStr, "%05d", totNoOfTrans);
		strncpy(inBuf->totNoOfTrans, tmpStr, 5);
	}
	else
		strncpy(inBuf->totNoOfTrans, "0000000", 5);
	sprintf(tmpStr, "%03d", noOfTrans);
	strncpy(inBuf->noOfTransHere, tmpStr, 3);
	strncpy(inBuf->lastTransPtr, lastTransPtr, 5);
	if ( completionFlag == YES )
		inBuf->completionFlag = '1';
	else
		inBuf->completionFlag = '0';
	statusPtr += statusPosition;
	strncpy(statusPtr, SUCCESS, 2);
	statusPtr += 2;
	*statusPtr++ = cndRecXC.decimalPlace;
	*statusPtr++ = 'Z';
	*statusPtr = NULL;
	sprintf(tmpStr, "%04d", strlen(inBuf));
	strncpy(inBuf->msgLen, tmpStr, 4);
	isclose(thdFile);
	isclose(thdFile1);
	fflush(logFp);
	return 0;
}

validateUser( char *userId, char *auth)
{
	char tmpStr[100];
	char tmpAuthLevel[100];
	int i=0;

	fprintf(logFp, "%s|%5d|[validateUser] Validation routine for staticData Userid [%.10s] & Auth [%.2s]\n", getDateTime(), PID, userId, auth);			
	fflush(logFp);
	memset(tmpStr,'\0',sizeof tmpStr);
	memset(tmpAuthLevel,'\0',sizeof tmpAuthLevel);

	memset(&stUserRec.liveChar, ' ', sizeof stUserRec);
	strncpy(stUserRec.userId, userId, 10);

	if ( isstart(stUserFile, &stUserKey, 0,  &stUserRec.liveChar, ISGTEQ) < 0 )
	{
	    fprintf(logFp, "%s|%5d|[validateUser] ISSTART/ISGTEQ error %d on STUSER.DAT for staticData Userid [%.10s] \n", getDateTime(), PID, iserrno, userId);			
		fflush(logFp);
		return -1;
	}
	if ( isRead(stUserFile, &stUserRec.liveChar, ISEQUAL) < 0 )
	{
	    fprintf(logFp, "%s|%5d|[validateUser] ISREAD error %d on STUSER.DAT for staticData Userid [%.10s] \n", getDateTime(), PID, iserrno, userId);			
		fflush(logFp);
		return -1;
	}

	if ( stUserRec.liveStatus != '1' && stUserRec.liveStatus != '0' ) /* Check for either ACTIVE(1) / OPEN-RESET(0) status */
	{
	    fprintf(logFp, "%s|%5d|[validateUser] LiveStatus of staticData Userid [%.10s] is not in active status/Open-reset but in [%c] status\n", getDateTime(), PID, userId, stUserRec.liveStatus);			
		fflush(logFp);
		return -1;
	}

	sprintf(tmpStr, "%.20s", stUserRec.authorityLevel);
	sprintf(tmpAuthLevel, "~%.2s", tmpStr);
	for (i=2; i < strlen(tmpStr); i += 2 )
	{
		sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);
	}
	memset(tmpStr,'\0',sizeof tmpStr);
	sprintf(tmpStr, "~%.2s", auth);
	if ( strstr(tmpAuthLevel, tmpStr) == NULL )
	{
	    fprintf(logFp, "%s|%5d|[validateUser] StaticData Userid [%.10s] does not have [%.2s] privilege\n", getDateTime(), PID, userId, auth);			
		fflush(logFp);
		return -1;
	}
	return 0;
}

char *trim(char *str)
{
	int i;
	for(i=strlen(str)-1; i>=0 && str[i] == ' '; str[i--] = '\0');
	return str;
}

debitCardEnquiry(inBuf, outBuf)
struct	debitCardEnquiryRequest	 *inBuf;
struct	debitCardEnquiryResponse *outBuf;
{
	char tmpStr[100]; 
	int noOfCards=0;
	int  i=0, retStatus=0;

	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d| debitCardEnquiry() sought for the customer number %.8s\n", getDateTime(), PID, inBuf->custNo);
		fflush(logFp);
	}

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| debitCardEnquiry() : Opening %s..\n", getDateTime(), PID, stCardPathName);
		fflush(logFp);
	}
	if ( (stCardFile  = isopen(stCardTabPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, stCardPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		outBuf->cardInfo[0].source[0] = NULL;
		return -1;
	}
	/*isindexinfo(stCardFile, &stCardKey, 4); /* key on customer number **/
	isindexinfo(stCardFile, &stCardKey, 10); /* key on CBS customer number */

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| debitCardEnquiry() : Opening %s..\n", getDateTime(), PID, stCtlTabPathName);
		fflush(logFp);
	}
	if ( (stCtlFile  = isopen(stCtlTabPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, stCtlTabPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		outBuf->cardInfo[0].source[0] = NULL;
		isclose(stCardFile);
		return -1;
	}
	isindexinfo(stCtlFile, &stCtlKey, 1);

	memset(&stCardRec.liveChar, ' ', sizeof stCardRec);
	strncpy(stCardRec.coreCustNo, inBuf->custNo, 8);
	isstart(stCardFile, &stCardKey, 0, &stCardRec.liveChar, ISGTEQ);

	while ( isRead(stCardFile, &stCardRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(stCardRec.coreCustNo, inBuf->custNo, 8) )
			break;

		strncpy(outBuf->cardInfo[noOfCards].source, "BM", 2);
		strncpy(outBuf->cardInfo[noOfCards].cardNo, stCardRec.cardNo, 19);
		strncpy(outBuf->cardInfo[noOfCards].nameOnTheCard, stCardRec.nameOnTheCard, 26);
		outBuf->cardInfo[noOfCards].cardType[0] = stCardRec.cardType;

		/* read card Type detail from static control file */
		memset(&stCtlRec.liveChar, ' ', sizeof stCtlRec);
		sprintf(tmpStr, "CY%c    ", stCardRec.cardType);
		strncpy(stCtlRec.recType, tmpStr, 6 );
		if ( isRead(stCtlFile, &stCtlRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISREAD/ISEQUAL error %d on stctltab for %.6s;while getting card type info; Description defaulted to spaces\n", getDateTime(), PID, iserrno, tmpStr);			
			fflush(logFp);
			memset(stCtlRec.englishName, ' ', 30);
			memset(stCtlRec.arabicName, ' ', 30);
		}
		strncpy(outBuf->cardInfo[noOfCards].engCardTypeDesc, stCtlRec.englishName, 30);
		strncpy(outBuf->cardInfo[noOfCards].arbCardTypeDesc, stCtlRec.arabicName, 30);
		outBuf->cardInfo[noOfCards].cardSubType = stCardRec.primaryOrSupplementary;
		strncpy(outBuf->cardInfo[noOfCards].issueDate, stCardRec.firstIssueDate, 8);
		strncpy(outBuf->cardInfo[noOfCards].expiryDate, stCardRec.expireDate, 8);
		outBuf->cardInfo[noOfCards].cardStatus = stCardRec.cardStatus;
		noOfCards++;
		if ( noOfCards >= 50 ) /* Max. is set as 50 in the layout*/
			break;
	}
	isclose(stCardFile);
	isclose(stCtlFile);

	sprintf(tmpStr, "%03d", noOfCards);
	strncpy(outBuf->noOfAtmCards, tmpStr, 3);
	strncpy(outBuf->responseStatus, SUCCESS, 2);
	outBuf->cardInfo[noOfCards].source[0] = NULL;
	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d|  debitCardEnquiry() Information for customer number %.7s provided\n", getDateTime(), PID, inBuf->custNo);
		fflush(logFp);
	}
	return 0;
}

cardDetailUsingCardNo( inBuf, outBuf )
struct	cardDetailsRequest	 	*inBuf;
struct	cardDetailsResponse 	*outBuf;
{
	char tmpStr[100], bmAccNo[20]; 
	char logCardNo[50];
	int noOfCards=0;
	int  i=0, retStatus=0;

	sprintf(logCardNo, "%.19s ", inBuf->atmCardNo);
	if ( extraDebug < 9 )
		sprintf(logCardNo, "%.19s ", maskCardNo(logCardNo, tmpStr));;

	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d| cardDetailusingCardNo() sought for the card number %.19s\n", getDateTime(), PID, logCardNo);
		fflush(logFp);
	}

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| cardDetailsUsingCardNo() : Opening %s..\n", getDateTime(), PID, stCardTabPathName);
		fflush(logFp);
	}
	if ( (stCardFile  = isopen(stCardTabPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, stCardTabPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		outBuf->nullPad = NULL;
		return -1;
	}
	isindexinfo(stCardFile, &stCardKey, 1); 

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| cardDetailsUsingCardNo() : Opening %s..\n", getDateTime(), PID, stCtlTabPathName);
		fflush(logFp);
	}
	if ( (stCtlFile  = isopen(stCtlTabPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, stCtlTabPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		outBuf->nullPad = NULL;
		isclose(stCardFile);
		return -1;
	}
	isindexinfo(stCtlFile, &stCtlKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| cardDetailsUsingCardNo() : Opening %s..\n", getDateTime(), PID, stCustTabPathName);
		fflush(logFp);
	}
	if ( (stCustTabFile  = isopen(stCustTabPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s file\n", getDateTime(), PID, iserrno, stCustTabPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		outBuf->nullPad = NULL;
		isclose(stCardFile);
		isclose(stCtlFile);
		return -1;
	}
	isindexinfo(stCustTabFile, &stCustTabKey, 1);

	/* Read the required card details from stcardtab */

	memset(&stCardTabRec.liveChar, ' ', sizeof stCardTabRec);
	strncpy(stCardTabRec.cardNo, inBuf->atmCardNo, 19);
	if ( isRead(stCardFile, &stCardTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| cardDetailUsingCardNo() : ISREAD/ISEQUAL error %d for card number %.19s from cbcardtab\n", getDateTime(), PID, iserrno, logCardNo);
		fflush(logFp);
		strncpy(outBuf->responseStatus, RECNOTEXISTS, 2);
		outBuf->nullPad = NULL;
		isclose(stCardFile);
		isclose(stCtlFile);
		isclose(stCustTabFile);
		return -1;
	}

	fprintf(logFp, "%s|%5d| cardDetailUsingCardNo() : Card sequence number [%.10s]\n", getDateTime(), PID, stCardTabRec.sequenceNo);
	fflush(logFp);

	/*strncpy(outBuf->accountNo, stCardTabRec.bmAccNo, 14);*/
	strncpy(outBuf->accountNo, stCardTabRec.coreAccNo, 16);
	strncpy(outBuf->nameOnTheCard, stCardTabRec.nameOnTheCard, 26);
	outBuf->cardType[0] = stCardTabRec.cardType;
	outBuf->primaryOrSupplementary = stCardTabRec.primaryOrSupplementary;
	strncpy(outBuf->cardIssueDate, stCardTabRec.firstIssueDate, 8);
	strncpy(outBuf->cardExpiryDate, stCardTabRec.expireDate, 8);
	outBuf->cardStatus = stCardTabRec.cardStatus;

	/* Read the customer detail from the linked account */

	sprintf(tmpStr, "%.8s", stCardTabRec.coreCustNo);

	if ( (retStatus=validateCustNo(tmpStr)) < 0 )
	{
		if ( retStatus == -1 )
			strncpy(outBuf->responseStatus, NOFINFI, 2);
		else if ( retStatus == -5 )
			strncpy(outBuf->responseStatus, INVALIDACC, 2);
		else
			strncpy(outBuf->responseStatus, INTERNALERR, 2);

		outBuf->nullPad = NULL;
		isclose(stCardFile);
		isclose(stCtlFile);
		isclose(stCustTabFile);
		return -1;
	}

	fprintf(logFp, "AccNo=%.16s; Custno=%.8s; packFlag=%c\n", stCardTabRec.coreAccNo, stCardTabRec.coreCustNo, custInfoResponseMsg.packageCustFlag);
	fflush(logFp);

	/*
	memset(&cbCustTabRec.liveChar, ' ', sizeof cbCustTabRec);
	strncpy(cbCustTabRec.custNo, stCardTabRec.coreCustNo, 8);

	if ( isRead(cbCustTabFile, &cbCustTabKey, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| cardDetailUsingCardNo() : ISREAD/ISEQUAL error %d for customer number [%.8s] for the card %.19s from cbcusttab\n", getDateTime(), PID, iserrno, stCardTabRec.coreCustNo, logCardNo);
		fflush(logFp);
	}

	outBuf->packageFlag = cbCustTabRec.packageAcc;
	strncpy(outBuf->customerName, cbCustTabRec.longName, 60);
	strncpy(outBuf->relationshipManager, custInfoResponseMsg.relationshipManager, 50);
	*/

	outBuf->packageFlag = custInfoResponseMsg.packageCustFlag;
	strncpy(outBuf->customerName, custInfoResponseMsg.longName, 60);
	strncpy(outBuf->relationshipManager, custInfoResponseMsg.relationshipManager, 50);

	/* read package flag description from static control file */

	memset(&stCtlRec.liveChar, ' ', sizeof stCtlRec);
	sprintf(tmpStr, "PK0%c    ", custInfoResponseMsg.packageCustFlag);
	strncpy(stCtlRec.recType, tmpStr, 6 );
	if ( isRead(stCtlFile, &stCtlRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| cardDetailUsingCardNo() : ISREAD/ISEQUAL error %d on stctltab for %.6s;while getting package flag description; defaulted to spaces\n", getDateTime(), PID, iserrno, tmpStr);			
		fflush(logFp);
		memset(stCtlRec.englishName, ' ', 30);
		memset(stCtlRec.arabicName, ' ', 30);
	}
	strncpy(outBuf->packageEnglishDesc, stCtlRec.englishName, 30);
	strncpy(outBuf->packageArabicDesc, stCtlRec.arabicName, 30);

	isclose(stCardFile);
	isclose(stCtlFile);
	isclose(stCustTabFile);

	strncpy(outBuf->responseStatus, SUCCESS, 2);
	outBuf->nullPad = NULL;
	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d|  cardDetailUsingCardNo() : Information for card number %.19s provided\n", getDateTime(), PID, logCardNo);
		fflush(logFp);
	}
	return 0;
}

/** Added under Ver 3.35 - Starts **/

reportLostStolenAtmCard(inBuf, outBuf)   /* Online gateway does only the validation; actual lost/stolen reporting is done using Tuxedo call to Static server*/
struct atmCrdLtStRequest 	*inBuf;
struct atmCrdLtStResponse 	*outBuf;
{
	char tmpStr[100], *transLogPathName; 
	char userBranchCode[10], supBranchCode[10], logCardNo[50];
	int pendingStatus=NO;
	int errNo=0;
	int  i=0, retStatus=0, transLog;

	sprintf(logCardNo, "%.19s ", inBuf->atmCardNo);
	if ( extraDebug < 9 )
		sprintf(logCardNo, "%.19s ", maskCardNo(logCardNo, tmpStr));

	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d| reportLostStolenAtmCard() sought for Report Lost/Stolen ATM card %.20s request\n", getDateTime(), PID, logCardNo);
		fflush(logFp);
	}
    
	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| reportLostStolenAtmCard() : Opening %s..\n", getDateTime(), PID, stCardTabPathName);
		fflush(logFp);
	}
	if ( (stCardTabFile  = isopen(stCardTabPathName, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardTabPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stcardtab                            ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		return -1;
	}
	isindexinfo(stCardTabFile, &cardTabKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| reportLostStolenAtmCard() : Opening %s..\n", getDateTime(), PID, stCardLogPathName);
		fflush(logFp);
	}
	if ( (stCardLogFile  = isopen(stCardLogPathName, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stcardlog                               ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		isclose(stCardTabFile);
		return -1;
	}
	isindexinfo(stCardLogFile, &cardLogKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| reportLostStolenAtmCard() : Opening %s..\n", getDateTime(), PID, stUserPathName);
		fflush(logFp);
	}
	if ( (stUserFile  = isopen(stUserPathName, ISMANULOCK + ISINPUT)) < 0)
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] ISOPEN/ISINPUT/ISTRANS error %d on %s\n", getDateTime(), PID, iserrno, stUserPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stuser                                       ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		isclose(stCardTabFile); isclose(stCardLogFile);
		return -1;
	}
	isindexinfo(stUserFile, &stUserKey, 1);

	readBankingDate();

    //printf("About to read from stCardTabFile... \n");

    memset(&stCardTabRec.liveChar, ' ', sizeof stCardTabRec);
    strncpy(stCardTabRec.cardNo, inBuf->atmCardNo, 19);

    if( isRead(stCardTabFile, &stCardTabRec.liveChar, ISMANULOCK + ISEQUAL) == 0 )
    {
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] Card sequence number [%.10s]\n", getDateTime(), PID, stCardTabRec.sequenceNo);
		fflush(logFp);
        /* interested in Open/Restricted/VIP cards only */
        if ( stCardTabRec.cardStatus != '1' && stCardTabRec.cardStatus != '4' && stCardTabRec.cardStatus != '5' )
		{
			fprintf(logFp,"%s|%5d|[reportLostStolenAtmCard] ATM card Number=%.20s ; ATM Card Status=%c : ATM card status is not either '1', '4' or '5'; Report Lost/Stolen ATM card request rejected\n", getDateTime(), PID, logCardNo, stCardTabRec.cardStatus);
			fflush(logFp);

			outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
			sprintf(tmpStr, "ATM card status [%c] is not either 1, 4 or 5             ", stCardTabRec.cardStatus);
			strncpy(outBuf->errorDescription, tmpStr, 50);
			strncpy(outBuf->responseStatus, INVALIDSTATUS, 2);
			isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
			return 1;
		}

        /* interested only in International cards */
        if ( stCardTabRec.cardType != 'I' && 		// International
			 stCardTabRec.cardType != 'V' && 		// VIP
			 stCardTabRec.cardType != 'C' && 		// CPS
			 stCardTabRec.cardType != 'S' && 		// International Chip card
			 stCardTabRec.cardType != 'L' )			// Local Chip card
        {
            fprintf(logFp,"%s|%5d|[reportLostStolenAtmCard] ATM card Number=%.20s ; ATM Card Type=%c : ATM card Type is not either 'I' or 'V' or 'C' or 'S' or 'L' ; Report Lost/Stolen ATM card request rejected\n", getDateTime(),PID,logCardNo,stCardTabRec.cardType);
            fflush(logFp);

			outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
            sprintf(tmpStr, "ATM Crd type [%c] is not either 'I'|'V'|'C'|'S'|'L'   ", stCardTabRec.cardType);
            strncpy(outBuf->errorDescription, tmpStr, 50);
            strncpy(outBuf->responseStatus, INVALIDTYPE, 2);
            isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
            return 1;
        }
	}
	else
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] ISREAD/ISEQUAL error %d while reading card table for card number:%.20s\n",getDateTime(),PID, iserrno, logCardNo);
        fflush(logFp);
		sprintf(tmpStr, "Err %d while reading card for %.19s     ", iserrno, maskCardNo(inBuf->atmCardNo, tmpStr));
		strncpy(outBuf->errorDescription, tmpStr, 50);
		errNo=iserrno;
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
		if ( errNo == 111 || errNo == 110 )
		{
			strncpy(outBuf->responseStatus, RECNOTEXISTS, 2);
			return 1;
		}
		strncpy(outBuf->responseStatus, INTERNALERR, 2); 
		return -1;
	}

	/* validate the BM user ID is available */
	/*
	memset(&opRec.liveChar, ' ', sizeof opRec);
	strncpy(opRec.userId, inBuf->userId, 3);
	if ( isRead(opFile, &opRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| reportLostStolenAtmCard() : Error %d while reading opfile\n", getDateTime(), PID, iserrno);
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard]: Invalid bankmaster user id %.3s; report Lost/Stolen ATM request rejected\n", getDateTime(), PID, inBuf->userId);
		fflush(logFp);
		outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
		strncpy(outBuf->responseStatus, NOTVALIDUSER, 2);
		sprintf(tmpStr, "Invalid BM user Id                                   ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
		return 1;
	}
	*/

	if ( validateUser(inBuf->staticDataUserId, CARDUPDATE)  < 0 )
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] Invalid Static data user ID [%.10s]\n", getDateTime(), PID, inBuf->staticDataUserId);
		fflush(logFp);

		outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
		sprintf(tmpStr, "Invalid Static Data UserId for the update                                    ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, NOTVALIDUSER, 2);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile); 
		return 1;
	}
	sprintf(userBranchCode, "%.4s", stUserRec.branchCode);

	if ( validateUser(inBuf->staticDataSupervisorId, CARDSUPERVISOR)  < 0 )
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] Invalid Static data superviosr ID [%.10s]\n", getDateTime(), PID, inBuf->staticDataSupervisorId);
		fflush(logFp);

		outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
		sprintf(tmpStr, "Invalid Static Data Supervisor Id                                     ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, NOTVALIDSUPV, 2);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile); 
		return 1;
	}
	sprintf(supBranchCode, "%.4s", stUserRec.branchCode);

	if ( strncmp(userBranchCode, supBranchCode, 4) )
	{
		fprintf(logFp, "%s|%5d|[reportLostStolenAtmCard] Static Data user Id [%.10s] and Supervisor ID [%.10s] does not belong to same branch.\n", getDateTime(), PID, inBuf->staticDataUserId, inBuf->staticDataSupervisorId);
		fflush(logFp);

		outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
		sprintf(tmpStr, "Static Data User IDs are not from same branch                         ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, NOTSAMEBRN, 2);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile); 
		return 1;
	}

	isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);

	outBuf->currentAtmCrdStatus = stCardTabRec.cardStatus;
	strncpy(outBuf->errorDescription, "Report Lost/Stolen ATM card Successfully validated         " , 50);
	strncpy(outBuf->responseStatus, SUCCESS, 2);
	fprintf(logFp,"%s|%5d|[reportLostStolenAtmCard] The Report Lost/Stolen ATM card validation request has been performed successfully for the card Number %.20s\n", getDateTime(),PID,logCardNo);
	fflush(logFp);
	return 0;
}

formatCardRecord(char cardType, char newOrReplacement, char primaryOrSupplementary, char *nameOnCard, char *idNo )
{
	char  tmpStr[100];
	int tYear=0;
	char monthDays[15][4] = {"31", "29", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"};

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatCardRecord]\n", getDateTime(), PID);

	memset(&stCardTabRec.liveChar, ' ', sizeof stCardTabRec);
	stCardTabRec.liveChar = '@';
	if ( cardType == 'R' || cardType == 'L' ) /* Regular or Local chip card */
	{
		if ( primaryOrSupplementary == 'P' ) /* Primary */
			sprintf(tmpStr, "588848%c0%.7s001", stCardLogRec.customerBranch[1], &stCardLogRec.coreCustNo[1]);
		else
			sprintf(tmpStr, "588848%c0%.7s002", stCardLogRec.customerBranch[1], &stCardLogRec.coreCustNo[1]);
		strncpy(stCardTabRec.cardNo, tmpStr, 18);
		stCardTabRec.cardNo[18] = luhnCheckDigit(tmpStr)+'0';
	}
	else if ( cardType == 'I' || cardType == 'S' )  /* Electron International/ Smart Card  */
	{
		if ( primaryOrSupplementary == 'P' )
			sprintf(tmpStr, "45503601%.7s", &stCardLogRec.coreCustNo[1]);
		else
			sprintf(tmpStr, "45503602%.7s", &stCardLogRec.coreCustNo[1]);
		strncpy(stCardTabRec.cardNo, tmpStr, 15);
		stCardTabRec.cardNo[15] = luhnCheckDigit(tmpStr)+'0';
	}
	else if ( cardType == 'A' ) /* Admin Card */
	{
		sprintf(tmpStr,"588848%c00000%.3s001", stCardLogRec.customerBranch[1], &stCardLogRec.customerBranch[1]);
		strncpy(stCardTabRec.cardNo, tmpStr, 18);
		stCardTabRec.cardNo[18] = luhnCheckDigit(tmpStr)+'0';
	}

	strncpy(stCardTabRec.requestDateTime, stCardLogRec.dateTime, 14);
	stCardTabRec.requestStatus = '0'; /* Requested */
	strncpy(stCardTabRec.requestBranch, stCardLogRec.branchCode, 4);
	strncpy(stCardTabRec.requestUserId, stCardLogRec.userId, 10);
	stCardTabRec.cardType = cardType; 
	stCardTabRec.newOrReplacement=newOrReplacement;
	stCardTabRec.primaryOrSupplementary=primaryOrSupplementary;
	stCardTabRec.cardStatus = '0'; /* Requested */
	stCardTabRec.regionCode = stCardLogRec.regionCode;
	strncpy(stCardTabRec.coreAccNo, stCardLogRec.coreAccNo, 16);
	strncpy(stCardTabRec.coreCustNo, stCardLogRec.coreCustNo, 8);
	stCardTabRec.languageCode = stCardLogRec.languageCode; 
	strncpy(stCardTabRec.customerBranch, stCardLogRec.customerBranch, 4);
	strncpy(stCardTabRec.nameOnTheCard, nameOnCard, 26);
	strncpy(stCardTabRec.address1, stCardLogRec.address1, 30);
	strncpy(stCardTabRec.address2, stCardLogRec.address2, 30);
	strncpy(stCardTabRec.poBox, stCardLogRec.poBox, 10);
	strncpy(stCardTabRec.cityName, stCardLogRec.cityName, 20);
	strncpy(stCardTabRec.zipCode, stCardLogRec.zipCode, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardTabRec.firstIssueDate, tmpStr, 8);
	strncpy(stCardTabRec.renewalDate, tmpStr, 8);

	sprintf(tmpStr,"%04d", systemDate->tm_year+1900+2);
	tYear = atoi(tmpStr);

	if ( tYear % 400 == 0 || (tYear % 4 == 0 && tYear % 100 == 0) )
		strcpy(monthDays[1],"29");
	else
		strcpy(monthDays[1],"28");

	sprintf(tmpStr, "%04d%02d%.2s", systemDate->tm_year+1900+2, systemDate->tm_mon+1, monthDays[systemDate->tm_mon]);
	strncpy(stCardTabRec.expireDate, tmpStr, 8);

	/*strncpy(stCardTabRec.titleCode, custInfoResponseMsg.titleCode, 2);*/
	strncpy(stCardTabRec.idNo, idNo, 15);

	stCardTabRec.deliveryToBranchOrPO = stCardLogRec.deliveryToBranchOrPO;

	if ( extraDebug )
	{
		fprintf(logFp, "Delivery to branch or Po flag : %c\n", stCardTabRec.deliveryToBranchOrPO);
		fflush(logFp);
	}

	strcpy(tmpStr,"(*)");

	sprintf(tmpStr,"%s   ",tmpStr);
	
	sprintf(tmpStr,"%s   ",tmpStr);

	sprintf(tmpStr,"%sBR.CODE:%.3s", tmpStr, &stCardLogRec.customerBranch[1]);

	sprintf(tmpStr,"%-30.30s", tmpStr);

	strncpy(stCardTabRec.address2, tmpStr, 30);

	stCardTabRec.requestType = '0';  /* Initial Card */
	stCardTabRec.pinRequestStatus = '0'; /* Requested */
	stCardTabRec.source = 'F' ; /* Requested from Finacle */

	strncpy(stCardTabRec.lastUpdateUser, stCardLogRec.userId, 10);	
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardTabRec.lastUpdateDateTime, tmpStr, 14);
	strncpy(stCardTabRec.processDateTime, tmpStr, 14);

	return SUCCESS;
}

luhnCheckDigit(inString)
char *inString;
{
	int strLen = strlen(inString);
	int checkDigit, digit, multiplyFactor = 2, accumValue = 0;

	for ( strLen--; strLen >= 0; strLen-- )
	{
		digit = inString[strLen] - '0';
		digit *= multiplyFactor;
		if ( digit <= 9 )
			accumValue += digit;
		else
			accumValue += (digit % 10 + 1 );
		if ( multiplyFactor == 2 )
			multiplyFactor = 1;
		else
			multiplyFactor = 2;
	}
	return ( (accumValue % 10 ) == 0 ? 0 : (10 - accumValue % 10));
}

incCard(char cardType, char *cardNo)
{
	int seqNo;
	char tmpStr[10];

	fprintf(logFp, "%s|%5d|[incCard] : Entered incCard(); Card No  : %.19s and Type : %c\n", getDateTime(), PID, maskCardNo(cardNo, tmpStr), cardType);

	if ( cardType == 'R' || cardType == 'D' || cardType == 'L' ) /* Regular or Deposit or Local chip */
	{
		sprintf(tmpStr, "%.3s", &cardNo[15]);
		seqNo = atoi(tmpStr);
		seqNo++;
		if ( seqNo > 999 )
		{
			fprintf(logFp, "%s|%5d|[incCard] : Exceed the maximum sequence number 999 for Electron Local card\n", getDateTime(), PID);
			return -1;
		}

		sprintf(tmpStr,"%03d", seqNo);
		strncpy(&cardNo[15], tmpStr,3);
		sprintf(tmpStr, "%.18s", cardNo);
		cardNo[18] = luhnCheckDigit(tmpStr)+'0';
	}
	else if ( cardType == 'I' || cardType == 'V' || cardType == 'S' ) /* Electron International/Smart Card */
	{
		sprintf(tmpStr, "%.2s", &cardNo[6]);
		seqNo = atoi(tmpStr);
		seqNo++;

		if( seqNo > 99 )
		{
			fprintf(logFp, "%s|%5d|[incCard] : Exceed the maximum sequence number 99 for Electron Intl card\n", getDateTime(), PID);
			return -1;
		}

		sprintf(tmpStr, "%02d", seqNo);
		strncpy(&cardNo[6], tmpStr, 2);
		sprintf(tmpStr, "%.15s", cardNo);
		cardNo[15] = luhnCheckDigit(tmpStr)+'0';
	}
	else if ( cardType == 'A' ) /* Admin Card */
	{
		sprintf(tmpStr, "%.3s", &cardNo[15]);
		seqNo = atoi(tmpStr);
		seqNo++;

		if ( seqNo > 999 )
		{
			fprintf(logFp, "%s|%5d|[incCard] : Exceed the maximum sequence number 999 for Admin card\n", getDateTime(), PID);
			return -1;
		}

		sprintf(tmpStr,"%03d", seqNo);
		strncpy(&cardNo[15], tmpStr, 3);
		sprintf(tmpStr, "%.18s", cardNo);
		cardNo[18] = luhnCheckDigit(tmpStr)+'0';
	}
	else if ( cardType == 'C' ) /* CPS Card */
	{
		sprintf(tmpStr, "%.2s", &cardNo[16]);
		seqNo = atoi(tmpStr);
		seqNo++;

		if( seqNo > 99 )
		{
			fprintf(logFp, "%s|%5d|[incCard] : Exceed the maximum sequence number 99 for CPS card\n", getDateTime(), PID);
			return -1;
		}

		sprintf(tmpStr, "%02d", seqNo);
		strncpy(&cardNo[16], tmpStr, 2);
		sprintf(tmpStr, "%.18s", cardNo);
		cardNo[18] = luhnCheckDigit(tmpStr)+'0';
	}
	else
	{
		fprintf(logFp, "%s|%5d|[incCard] : Invalid card type[%c] received\n", getDateTime(), PID, cardType);
		fflush(logFp);
		return -1;
	}
	fprintf(logFp, "%s|%5d|[incCard] : Card Number after incCard() is %.19s\n", getDateTime(), PID, maskCardNo(cardNo, tmpStr));
	fflush(logFp);
	return SUCCESS;
}

newAtmCardRequestFromFinacle(inBuf, outBuf)
struct newAtmCardRequest 	*inBuf;
struct newAtmCardResponse 	*outBuf;
{
	char tmpStr[100], *transLogPathName, tCardNo[50], tmpCurrentNo[30]; 
	char logCardNo[50];
	unsigned char unsignedTmpChar;
	int pendingStatus=NO;
	int errNo=0;
	int  i=0, retStatus=0, transLog;

	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() requested from branch [%.4s] for the account %.16s \n", getDateTime(), PID, inBuf->branchCode, inBuf->accNo);
		fflush(logFp);
	}

	if ( strncmp(inBuf->nameOnTheCard, "                            ", 26) == 0 )
	{
		fprintf(logFp, "%s|%5d| Name on the card is coming as blank [%.26s] .. ATM care request is rejected\n", getDateTime(), PID, inBuf->nameOnTheCard);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INCORRECTMSG, 2);
		return 1;
	}

	sprintf(tmpStr, "%.26s", inBuf->nameOnTheCard);
	for (i=0; i<26; i++)
	{
		unsignedTmpChar = tmpStr[i];
		if ( unsignedTmpChar > 128 )
		{
			fprintf(logFp, "%s|%5d| : Arabic character [%c] encounted at %d position of Name on the card field [%.26s] .. ATM card request is rejected\n", getDateTime(), PID, unsignedTmpChar, i, inBuf->nameOnTheCard);
			fflush(logFp);
			strncpy(outBuf->responseStatus, INCORRECTMSG, 2);
			return 1;
		}
	}
      
	sprintf(tmpStr, "newAtm%d.log", PID);
	transLogPathName = getpath(tmpStr, "log");
	if ( (transLog = creat(transLogPathName, 0660)) < 0)
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] : Error %d while creating txn log file %s. New ATM request rejected\n", getDateTime(), PID,  errno, transLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		free(transLogPathName);
		return -1;
	}
	close(transLog);
	
	if ( islogopen(transLogPathName) < 0 )
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] : Error %d while opening txn log file %s. New ATM request rejected\n", getDateTime(), PID, iserrno, transLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] : Transaction log file opened successfully\n", getDateTime(), PID);			
		fflush(logFp);
	}

   	if (isbegin() < 0)
	{
   		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] : ISBEGIN error %d, ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	transactionBegin = YES;

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : Opening %s..\n", getDateTime(), PID, stCardTabPathName);
		fflush(logFp);
	}
	if ( (stCardTabFile  = isopen(stCardTabPathName, ISMANULOCK + ISINOUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardTabPathName);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stCardTabFile, &cardTabKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : Opening %s..\n", getDateTime(), PID, stCardLogPathName);
		fflush(logFp);
	}
	if ( (stCardLogFile  = isopen(stCardLogPathName, ISMANULOCK + ISINOUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stCardLogFile, &cardLogKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : Opening %s..\n", getDateTime(), PID, cardSeqPathName);
		fflush(logFp);
	}

	if ( (cardSeqFile  = isopen(cardSeqPathName, ISMANULOCK + ISINOUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, cardSeqPathName);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(cardSeqFile, &cardSeqKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : Opening %s..\n", getDateTime(), PID, stCtlTabPathName);
		fflush(logFp);
	}

   	if ( (stCtlTabFile = isopen(stCtlTabPathName, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : ISOPEN/ISTRANS error %d while opening %s. New ATM cards request rejected\n", getDateTime(), PID, iserrno, stCtlTabPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening STCTLTAB. Report to support                ", iserrno);
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stCtlTabFile, &stCtlTabKey, 1);

	readBankingDate();

	memset(&stCardLogRec.liveChar, ' ', sizeof stCardLogRec);

	stCardLogRec.liveChar = '@';
	strncpy(stCardLogRec.userId, inBuf->branchCode,8);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardLogRec.dateTime, tmpStr, 14);
	strncpy(stCardLogRec.branchCode, inBuf->branchCode, 4);

	stCardLogRec.newOrUpdate = 'N';
	stCardLogRec.bmUpdateStatus = 'C'; /* Pending with Branch as request from CORE */

	stCardLogRec.cardType = 'I'; /* defaulted to I ( international) */
	if ( cbsCardType != ' ' && cbsCardType != NULL )
		stCardLogRec.cardType = cbsCardType;

	if ( checkPrevStatus(inBuf->accNo, stCardLogRec.cardType, outBuf->responseStatus) < 0 )
	{
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	stCardLogRec.newOrReplacement = 'N';
	stCardLogRec.primaryOrSupplementary = 'P';
	stCardLogRec.cardStatus = '0';

	stCardLogRec.regionCode = inBuf->branchCode[1];

	stCardLogRec.languageCode = '2'; /* Arabic/English */
	strncpy(stCardLogRec.nameOnTheCard, inBuf->nameOnTheCard, 26);

	/* Customer Branch Code validation */

	memset(&stCtlRecBD.liveChar, ' ', sizeof stCtlRecBD);
	sprintf(tmpStr, "BD%.4s", inBuf->branchCode );
	strncpy(stCtlRecBD.recType, tmpStr, 6 );
	if ( isRead(stCtlTabFile, &stCtlRecBD.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : ISREAD/ISEQUAL error %d on stctltab for %.6s; while validating customer branch code existance. ATM card request rejected\n", getDateTime(), PID, iserrno, tmpStr);			
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INCORRECTMSG);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	stCardLogRec.deliveryToBranchOrPO = 'C'; /* Defaulted to Customer Branch; */

	sprintf(tmpStr, "Branch : %.30s                        ", stCtlRecBD.englishName);
	strncpy(stCardLogRec.address1, tmpStr, 30);

	strncpy(stCardLogRec.poBox, stCtlRecBD.poBox, 10);
	strncpy(stCardLogRec.zipCode, stCtlRecBD.zipCode, 10);

	memset(&ctlRec.liveChar, ' ', sizeof ctlRec);
	sprintf(tmpStr, "CT%.4s", stCtlRecBD.cityCode );
	strncpy(ctlRec.recType, tmpStr, 6);

	if ( isRead(stCtlTabFile, &ctlRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : ISREAD/ISEQUAL error %d on stctltab for %.6s; while validating city code [%.4s] existance. IGNORED and moved as SPACES \n", getDateTime(), PID, iserrno, tmpStr, stCtlRecBD.cityCode);			
		fflush(logFp);
	}

	/* Incoming finacle a/c validation */

	sprintf(tmpStr, "%.16s", inBuf->accNo);

	if ( strlen(trim(tmpStr)) != 16 )
	{
		fprintf(logFp, "%s|%5d| newAtmCardRequestFromFinacle() : Incoming account [%.16s] is less than 16 characters ; not seems to be valid finacle account; Please check & resend\n", getDateTime(), PID, inBuf->accNo);			
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", INVALIDACC, 2);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	/*
	if ( validateAccNo(tmpStr) < 0  )
	{
		sprintf(tmpStr, "000%.2s", INVALIDACC, 2);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	*/

	strncpy(stCardLogRec.cityName, ctlRec.englishName, 20);
						
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardLogRec.firstIssueDate, tmpStr, 8);

	strncpy(stCardLogRec.coreCustNo, inBuf->custNo, 8);
	strncpy(stCardLogRec.customerBranch, inBuf->branchCode, 4);
	strncpy(stCardLogRec.renewalDate, stCardLogRec.firstIssueDate, 8);
	strncpy(stCardLogRec.coreAccNo, inBuf->accNo, 16);
	stCardLogRec.requestType = '0'; /* Initial Card */
	stCardLogRec.requestStatus = '0'; /* Requested */ 
	stCardLogRec.pinRequestStatus = '0'; /* Requested */

	strncpy(stCardLogRec.lastUpdateUser, inBuf->branchCode, 8);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( formatCardRecord(stCardLogRec.cardType, stCardLogRec.newOrReplacement, stCardLogRec.primaryOrSupplementary, stCardLogRec.nameOnTheCard, inBuf->ninId ) == -1 )
	{
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	strncpy(stCardLogRec.address2, stCardTabRec.address2,30);

	sprintf(tCardNo, "%.19s", stCardTabRec.cardNo);
	do
	{
		if ( checkExistance(tCardNo) == -1 )
			break;

		if ( incCard(stCardTabRec.cardType, tCardNo) == -1 )
		{
			sprintf(tmpStr, "000%.2s", SUPPCARDLIMITEXCEED);
			strncpy(outBuf->responseStatus, tmpStr, 5);
			isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
			return -1;
		}
	} while(1);

	strncpy(stCardTabRec.cardNo, tCardNo, 19);

	if ( getNextCardSeqNoFromCtl(tmpCurrentNo) == -1 )
		memset(tmpCurrentNo, ' ', sizeof tmpCurrentNo);

	fprintf(logFp, "%s: Obtained sequence number=%.10s\n", getDateTime(), tmpCurrentNo);
	fflush(logFp);
	strncpy(stCardTabRec.sequenceNo, tmpCurrentNo, 10);

	strcpy(logCardNo, stCardTabRec.cardNo);
	if ( extraDebug < 9 )
		sprintf(logCardNo, "%-19.19s", maskCardNo(stCardTabRec.cardNo, tmpStr));

	strncpy(stCardLogRec.cardNo, stCardTabRec.cardNo, 19);
	strncpy(stCardLogRec.coreAccNo, stCardTabRec.coreAccNo,16);
	strncpy(stCardLogRec.idNo, stCardTabRec.idNo, 15);
	/*strncpy(stCardLogRec.titleCode, stCardTabRec.titleCode,2);*/


	strncpy(stCardLogRec.expireDate, stCardTabRec.expireDate, 8);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(stCardLogRec.lastUpdateDateTime, tmpStr, 14);
	stCardLogRec.branchPinSelect = 'N';
	stCardLogRec.branchCardPrdn  = 'N'; 
	strncpy(stCardLogRec.processDateTime, stCardTabRec.processDateTime, 14);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| [newAtmCardRequestFromFinacle] Before writing to stCardTabFile (%d) ..\n", getDateTime(), PID, stCardTabFile);
		fflush(logFp);
	}
	if ( isWrite(stCardTabFile, &stCardTabRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] :ISWRITE error %d while writing card request into card file for card # %.19s\n", getDateTime(), PID, iserrno, logCardNo);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.19s] on cbcardtab", logCardNo);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stcardtab"); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on cbcardtab", iserrno);
		}
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| [newAtmCardRequestFromFinacle] Before writing to stCardLogFile (%d) ..\n", getDateTime(), PID, stCardLogFile);
		fflush(logFp);
	}
	if ( isWrite(stCardLogFile, &stCardLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] ISWRITE error %d on stcardlog while creating a new card/update key is [%.28s] and the card #[%.19s] \n", getDateTime(), PID, iserrno, stCardLogRec.branchCode, logCardNo );
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.28s]",stCardLogRec.branchCode);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stcardlog");
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcardlog", iserrno);
		}
		sprintf(tmpStr, "000%.2s", INTERNALERR);
		strncpy(outBuf->responseStatus, tmpStr, 5);
		isrollback();
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	strncpy(outBuf->atmCardNo, stCardLogRec.cardNo, 19);

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[newAtmCardRequestFromFinacle] ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
		/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage */
	}

	isclose(stCardTabFile); isclose(stCardLogFile); isclose(cardSeqFile); isclose(stCtlTabFile);
	sprintf(tmpStr, "000%.2s", SUCCESS);
	strncpy(outBuf->responseStatus, tmpStr, 5);
	fprintf(logFp,"%s|%5d|[newAtmCardRequestFromFinacle] The new ATM card request from finacle has been registered successfully for the account Number %.16s & the card number generated is [%.20s]\n", getDateTime(), PID, inBuf->accNo, logCardNo);
	fflush(logFp);
	islogclose();
	unlink(transLogPathName);
	free(transLogPathName);
	return 0;
}

getNextCardSeqNoFromCtl(char *tmpCurrentNo)
{
	char tmpStr[200], tmpJointNo[5], *isLogPathName;
	int noOfJoint, isappLogFp, returnError, retErr, noOfTries=0;
	int recordTaken = NO;
	long currentNo;

	fprintf(logFp, "%s:[getNextCardSeqNoFromCtl]\n", getDateTime());

	memset(tmpCurrentNo, ' ', sizeof tmpCurrentNo);

	memset(&cardSeqRec.liveChar, ' ', sizeof cardSeqRec);
	strncpy(cardSeqRec.recType,"SQ",2);

	isindexinfo(cardSeqFile, &cardSeqKey,1);

	recordTaken=NO;
	noOfTries=0;
	do 
	{
		if ( isRead(cardSeqFile,&cardSeqRec.liveChar,ISEQUAL+ISLOCK) == 0 )
		{
			recordTaken = YES;

			if(strncmp(cardSeqRec.lastSequenceNo,"000000000000", 10) == 0)
				currentNo = 1;
			else
			{
				sprintf(tmpCurrentNo, "%.10s", cardSeqRec.lastSequenceNo);
				currentNo = atol(tmpCurrentNo)+1;
			}

			sprintf(tmpCurrentNo,"%010ld", currentNo); 
			strncpy(cardSeqRec.lastSequenceNo,tmpCurrentNo,10);

			fprintf(logFp, "%s[getNextCustNoFromCtl] Got the sequence number=%.10s\n", getDateTime(), tmpCurrentNo);

			if( isRewcurr(cardSeqFile,&cardSeqRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s[getNextCardSeqNoFromCtl] ISREWCURR error %d on cbcardseq for key=%.2s\n", getDateTime(), iserrno, cardSeqRec.recType);
				fflush(logFp);
				if  ( iserrno == 100 )
					sprintf(tmpStr, "Duplicate record [%.2s] on cbcardseq", cardSeqRec.recType);
				else if ( iserrno == 107 || iserrno == 113 )
					sprintf(tmpStr, "Record/File locked on cbcardseq");
				else
					sprintf(tmpStr, "CISAM Error %d occured on cbcardseq", iserrno);
				isrelease(cardSeqFile);
				return -1;
			}
		}
		else
		{
			if ( iserrno == 107 || iserrno == 113 )
			{
				noOfTries++;
				continue;
			}
			else if ( iserrno == 111 || iserrno == 110 )
			{
				currentNo = 1;

				sprintf(tmpCurrentNo,"%010ld", currentNo); 
				memset(&cardSeqRec.liveChar, ' ', sizeof cardSeqRec);
				cardSeqRec.liveChar = '@';
				strncpy(cardSeqRec.recType, "SQ", 2);
				strncpy(cardSeqRec.lastSequenceNo, tmpCurrentNo, 10);

				recordTaken = YES;

				fprintf(logFp, "%s[getNextCardSeqNoFromCtl] Got the sequence number=%.10s\n", getDateTime(), tmpCurrentNo);
				fflush(logFp);

				if( isWrite(cardSeqFile,&cardSeqRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s:[getNextCardSeqNoFromCtl] ISWRITE error %d on cbcardseq for key=%.2s\n", getDateTime(), iserrno, cardSeqRec.recType);
					fflush(logFp);
					if  ( iserrno == 100 )
						sprintf(tmpStr, "Duplicate record [%.2s] on cbcardseq", cardSeqRec.recType);
					else if ( iserrno == 107 || iserrno == 113 )
						sprintf(tmpStr, "Record/File locked on cbcardseq");
					else
						sprintf(tmpStr, "CISAM Error %d occured on cbcardseq", iserrno);
					isrelease(cardSeqFile);
					return -1;
				}
			}
			else
			{
				sprintf(tmpStr, "Err %d occured while getting next sequence number      ", iserrno);
				isrelease(cardSeqFile);
				return -1;		
			}
		}
	} while ( noOfTries < 5 && recordTaken == NO );

	if ( noOfTries >= 5 )
	{
		fprintf(logFp, "%s[getNextCardSeqNoFromCtl]  Error %d occured while reading next card sequence number even after %d times;\n", getDateTime(), iserrno, noOfTries);
		fflush(logFp);
		if ( iserrno == 107 )
			sprintf(tmpStr, "Record locked while getting next card seq number");
		else
			sprintf(tmpStr, "Error %d occured while getting next card seq number", iserrno);
		return -1;		
	}
	isrelease(cardSeqFile);
	return SUCCESS;
}

checkExistance( char *cardNo )
{
	char logCardNo[50], tmpStr[50];
	memset(&stCardRec.liveChar, ' ', sizeof stCardRec);

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkExistance]\n", getDateTime(), PID);

	strncpy(stCardRec.cardNo, cardNo, 19);
	isindexinfo(stCardTabFile, &cardTabKey, 1);
	if( isstart(stCardTabFile, &cardTabKey, 0, &stCardRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[checkExistance] ISSTART/ISEQUAL error %d occured on stcardtab file for card # [%.19s]\n", getDateTime(), PID, iserrno, maskCardNo(stCardRec.cardNo, tmpStr));
		fflush(logFp);
		if ( iserrno != 111 )
			return -1;
	}

	if ( isRead(stCardTabFile, &stCardRec.liveChar, ISEQUAL) < 0 )
	{
		if ( iserrno != 111 )
		{
			fprintf(logFp, "%s|%5d|[checkExistance] ISREAD/ISEQUAL error %d while reading stcardtab for card # [%.19s]\n", getDateTime(), PID, iserrno, maskCardNo(stCardRec.cardNo, tmpStr));
			fflush(logFp);
		}
		return -1;
	}
	return 0;
}

/** Added under Ver 3.24 - Starts **/
forceAtmCard(inBuf, outBuf)
struct forceAtmCrdRequest 	*inBuf;
struct forceAtmCrdResponse 	*outBuf;
{
	char tmpStr[100], *transLogPathName, logCardNo[50]; 
	int pendingStatus=NO;
	int errNo=0;
	int  i=0, retStatus=0, transLog;

	sprintf(logCardNo, "%.19s", inBuf->atmCardNo);
	if ( extraDebug < 9 )
		sprintf(logCardNo, "%.19s", maskCardNo(inBuf->atmCardNo, tmpStr));

	if ( extraDebug > 5)
	{
		fprintf(logFp, "%s|%5d| forceAtmCard() sought for ATM card %.19s request\n", getDateTime(), PID, logCardNo);
		fflush(logFp);
	}
      
	sprintf(tmpStr, "forceAtm%d.log", PID);
	transLogPathName = getpath(tmpStr, "log");
	if ( (transLog = creat(transLogPathName, 0660)) < 0)
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] : Error %d while creating txn log file %s. Force ATM request rejected\n", getDateTime(), PID,  errno, transLogPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		strncpy(outBuf->errorDescription, "Error while translog creation                          " , 50);
		free(transLogPathName);
		return -1;
	}
	close(transLog);
	
	if ( islogopen(transLogPathName) < 0 )
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] : Error %d while opening txn log file %s. Force ATM request rejected\n", getDateTime(), PID, iserrno, transLogPathName);
		fflush(logFp);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		sprintf(tmpStr, "Translog open error %d                                 ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr , 50);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] : Transaction log file opened successfully\n", getDateTime(), PID);			
		fflush(logFp);
	}

   	if (isbegin() < 0)
	{
   		fprintf(logFp, "%s|%5d|[forceAtmCard] : ISBEGIN error %d, ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	// Whatz its significance -- transactionBegin = YES;

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| forceAtmCard() : Opening %s..\n", getDateTime(), PID, stCardTabPathName);
		fflush(logFp);
	}
	if ( (stCardTabFile  = isopen(stCardTabPathName, ISMANULOCK + ISINOUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardTabPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stcardtab                            ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stCardTabFile, &cardTabKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| forceAtmCard() : Opening %s..\n", getDateTime(), PID, stCardLogPathName);
		fflush(logFp);
	}
	if ( (stCardLogFile  = isopen(stCardLogPathName, ISMANULOCK + ISINOUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] ISOPEN/ISINOUT/ISTRANS error %d for %s file\n", getDateTime(), PID, iserrno, stCardLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stcardlog                               ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		isclose(stCardTabFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stCardLogFile, &cardLogKey, 1);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| forceAtmCard() : Opening %s..\n", getDateTime(), PID, stUserPathName);
		fflush(logFp);
	}
	if ( (stUserFile  = isopen(stUserPathName, ISMANULOCK + ISINPUT + ISTRANS)) < 0)
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] ISOPEN/ISINPUT/ISTRANS error %d on %s\n", getDateTime(), PID, iserrno, stUserPathName);
		fflush(logFp);
		sprintf(tmpStr, "Err %d opening stuser                                       ", iserrno);
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, INTERNALERR, 2);
		isclose(stCardTabFile); isclose(stCardLogFile);
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}
	isindexinfo(stUserFile, &stUserKey, 1);

	readBankingDate();

	if ( validateUser(inBuf->staticDataUserId, CARDUPDATE)  < 0 )
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] Invalid Static data user ID [%.10s]\n", getDateTime(), PID, inBuf->staticDataUserId);
		fflush(logFp);
		sprintf(tmpStr, "Invalid Static Data UserId for the update                                    ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, NOTVALIDUSER, 2);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile); 
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return 1;
	}
	if ( validateUser(inBuf->staticDataSupervisorId, CARDSUPERVISOR)  < 0 )
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] Invalid Static data superviosr ID [%.10s]\n", getDateTime(), PID, inBuf->staticDataSupervisorId);
		fflush(logFp);
		sprintf(tmpStr, "Invalid Static Data Supervisor Id                                     ");
		strncpy(outBuf->errorDescription, tmpStr, 50);
		strncpy(outBuf->responseStatus, NOTVALIDSUPV, 2);
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile); 
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return 1;
	}

    //printf("About to read from stCardTabFile... \n");

    memset(&stCardTabRec.liveChar, ' ', sizeof stCardTabRec);
    strncpy(stCardTabRec.cardNo, inBuf->atmCardNo, 19);

    if( isRead(stCardTabFile, &stCardTabRec.liveChar, ISEQUAL+ISLOCK) == 0 )
    {
		fprintf(logFp, "%s|%5d|[forceAtmCard] Card sequence number [%.10s]\n", getDateTime(), PID, stCardTabRec.sequenceNo);
		fflush(logFp);
        /* interested in Open/Restricted/VIP cards only */
        if ( stCardTabRec.cardStatus != '1' && stCardTabRec.cardStatus != '4' && stCardTabRec.cardStatus != '5' )
		{
			fprintf(logFp,"%s|%5d|[forceAtmCard] ATM card Number=%.20s ; ATM Card Status=%c : ATM card status is not either '1', '4' or '5'; ATM force card request rejected\n", getDateTime(), PID, logCardNo, stCardTabRec.cardStatus);
			fflush(logFp);
			sprintf(tmpStr, "ATM card status [%c] is not either 1, 4 or 5             ", stCardTabRec.cardStatus);
			strncpy(outBuf->errorDescription, tmpStr, 50);
			strncpy(outBuf->responseStatus, INVALIDSTATUS, 2);
			isrelease(stCardTabFile);
			isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
			return 1;
		}

        /* interested only in International cards */
        if ( stCardTabRec.cardType != 'I' && stCardTabRec.cardType != 'V' && stCardTabRec.cardType != 'S' )
        {
            fprintf(logFp,"%s|%5d|[forceAtmCard] ATM card Number=%.19s ; ATM Card Type=%c : ATM card Type is not either 'I' or 'V' or 'S' ; Force ATM card request rejected\n", getDateTime(),PID,logCardNo,stCardTabRec.cardType);
            fflush(logFp);
            sprintf(tmpStr, "ATM Card type [%c] is not either 'I' or 'V' or 'S'         ", stCardTabRec.cardType);
            strncpy(outBuf->errorDescription, tmpStr, 50);
            strncpy(outBuf->responseStatus, INVALIDTYPE, 2);
            isrelease(stCardTabFile);
            isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
            return 1;
        }

        /* Checking If any other request is approved and is not yet processed*/
        if ( strncmp(stCardTabRec.processDateTime, "                 ", 14) == 0 )
        {
			fprintf(logFp, "%s|%5d|[forceAtmCard] ATM card Number=%.19s : Another request with request type [%c] is approved from branch %.4s on %.8s and still not yet processed; so, Force ATM card request rejected.\n", getDateTime(),PID, logCardNo, stCardTabRec.requestType, stCardTabRec.requestBranch, stCardTabRec.requestDateTime);
            fflush(logFp);
			sprintf(tmpStr, "Another request is pending for processing                   ");
			strncpy(outBuf->errorDescription, tmpStr, 50);
			strncpy(outBuf->responseStatus, TRYLATER, 2);
			isrelease(stCardTabFile);
			isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
			return 1;
		}

    	pendingStatus = NO;
    	pendingStatus = checkCardPendingStatus();
    	if ( pendingStatus == YES )
    	{
    		fprintf(logFp, "%s|%5d|[forceAtmCard] Card # [%.19s] already in pending status [%c:%s] in branch [%.4s] for the request [%c] ; Request User Id [%.10s]; request DateTime [%.14s]; so, Force ATM card request is rejected\n", getDateTime(),PID, logCardNo, stCardLogRec.bmUpdateStatus, stCardLogRec.bmUpdateStatus=='1'?"with supervisor":"with CSO", stCardLogRec.branchCode, stCardLogRec.requestType, stCardLogRec.userId, stCardLogRec.dateTime);
        	fflush(logFp);
        	sprintf(tmpStr, "Another request is pending for approval. Br[%.4s]     ", stCardLogRec.branchCode);
        	strncpy(outBuf->errorDescription, tmpStr, 50);
        	strncpy(outBuf->responseStatus, TRYLATER, 2);
			isrelease(stCardTabFile);
        	isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
        	return 1;
		}

        /* Make a force card request */

		/* UPDATING stcardtab */

        memset(stCardTabRec.processDateTime,' ', sizeof stCardTabRec.processDateTime);
   		strncpy(stCardTabRec.requestBranch, stCardTabRec.customerBranch, 4);
        strncpy(stCardTabRec.requestUserId, inBuf->staticDataUserId, 10);
        getDateTime();
        sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon +1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
        strncpy(stCardTabRec.requestDateTime, tmpStr, 14);
        strncpy(stCardTabRec.lastUpdateDateTime, tmpStr, 14);
        stCardTabRec.requestStatus = '1'; /* Approved */
        stCardTabRec.requestType = '2'; /* Force Card */
        memset(stCardTabRec.cardGeneratedDate, ' ', 54);
   		stCardTabRec.requestFromClo = '0'; 
   		stCardTabRec.branchCardPrdn = 'N';
		if ( strncmp(stCardTabRec.pvv, "     ", 4) == 0 )
   			strncpy(stCardTabRec.pvv, "4321", 4); /* To prevent rejection in DC9000 */
   		strncpy(stCardTabRec.lastUpdateUser, inBuf->staticDataSupervisorId, 10);

		if ( isRewcurr(stCardTabFile, &stCardTabRec.liveChar) < 0 )
        {	
        	fprintf(logFp,"%s|%5d|[forceAtmCard]  ISWRITE error %d on stcardtab while updating card record,  key is [%.28s] and the card # is [%.19s] not done\n", getDateTime(),PID, iserrno, stCardTabRec.requestBranch, logCardNo );
            fflush(logFp);
			sprintf(tmpStr, "Err %d while updating card %.20s         ",iserrno,logCardNo);
			strncpy(outBuf->errorDescription, tmpStr, 50);
			strncpy(outBuf->responseStatus, INTERNALERR, 2); 
			isrelease(stCardTabFile);
			isclose(stCardTabFile); isclose(stCardLogFile);isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
			return -1;
        }

		/* FINISHED updating stcardtab */

        /* FORCE CARDS - Adding a record into stcardlog */

        memset(&stCardLogRec.liveChar, ' ', sizeof stCardLogRec);
        stCardLogRec.liveChar = '@';
        strncpy(stCardLogRec.branchCode, stCardTabRec.requestBranch, 4);
        strncpy(stCardLogRec.userId, stCardTabRec.requestUserId, 10);
        getDateTime();
        sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon +1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
        strncpy(stCardLogRec.dateTime, stCardTabRec.requestDateTime, 14);
        strncpy(stCardLogRec.lastUpdateDateTime, tmpStr, 14);
   		stCardLogRec.newOrUpdate = 'U';
        stCardLogRec.bmUpdateStatus = '9';
        strncpy(stCardLogRec.supervisorId, inBuf->staticDataSupervisorId, 10);
        strncpy(stCardLogRec.cardNo, stCardTabRec.cardNo, 19);
        stCardLogRec.requestStatus = '1'; /* APPROVED */
        strncpy(&stCardLogRec.cardType, &stCardTabRec.cardType, 374); /* Copy same fields to cardlog fiele */
		strncpy(stCardLogRec.coreAccNo, stCardTabRec.coreAccNo, 16); /* Added for CBS-interim solution */
		strncpy(stCardLogRec.pbfAccNo, stCardTabRec.pbfAccNo, 19); /* Added for CBS-interim solution */
        memset(stCardLogRec.cardGeneratedDate, ' ', 54);
        stCardLogRec.requestType = '2'; /* Force card */
        strncpy(stCardLogRec.lastUpdateUser, stCardTabRec.lastUpdateUser, 10);

        if ( isWrite(stCardLogFile, &stCardLogRec.liveChar) < 0 )
        {
			isrollback();
        	fprintf(logFp,"%s|%5d|[forceAtmCard]  ISWRITE error %d on stcardlog while creating the history record,  key is [%.28s] and the card # is [%.19s] ignored \n", getDateTime(),PID,iserrno, stCardLogRec.branchCode, logCardNo);
            fflush(logFp);
			sprintf(tmpStr, "Err %d while creating Card history           ",iserrno);
			strncpy(outBuf->errorDescription, tmpStr, 50);
			strncpy(outBuf->responseStatus, INTERNALERR, 2); 
			isrelease(stCardTabFile);
			isclose(stCardTabFile); isclose(stCardLogFile);isclose(stUserFile);
			islogclose();
			unlink(transLogPathName);
			free(transLogPathName);
			return -1;
        }
	}
	else
	{
		fprintf(logFp, "%s|%5d|[forceAtmCard] ISREAD/ISEQUAL error %d while reading card table for card number:%.20s\n",getDateTime(),PID, iserrno, logCardNo);
        fflush(logFp);
		sprintf(tmpStr, "Err %d while reading card for %.20s     ", iserrno, maskCardNo(inBuf->atmCardNo, tmpStr));
		strncpy(outBuf->errorDescription, tmpStr, 50);
		errNo=iserrno;
		isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
		if ( errNo == 111 || errNo == 110 )
		{
			strncpy(outBuf->responseStatus, RECNOTEXISTS, 2);
			return 1;
		}
		strncpy(outBuf->responseStatus, INTERNALERR, 2); 
		islogclose();
		unlink(transLogPathName);
		free(transLogPathName);
		return -1;
	}

	isclose(stCardTabFile); isclose(stCardLogFile); isclose(stUserFile);
	strncpy(outBuf->errorDescription, "Force ATM card Successfully requested                  " , 50);
	strncpy(outBuf->responseStatus, SUCCESS, 2);
	fprintf(logFp,"%s|%5d|[forceAtmCard] The Force ATM card request has been performed successfully for the card Number %.20s\n", getDateTime(),PID,logCardNo);
	fflush(logFp);
	islogclose();
	unlink(transLogPathName);
	free(transLogPathName);
	return 0;
}

checkCardPendingStatus()
{
	char tmpStr[50];
    memset(&stCardLogRec.liveChar, ' ', sizeof stCardLogRec);
    strncpy(stCardLogRec.cardNo, stCardTabRec.cardNo,19);
    isindexinfo(stCardLogFile, &cardLogKey, 2);
    if( isstart(stCardLogFile, &cardLogKey, 0, &stCardLogRec.liveChar,ISGTEQ) < 0 )
    {
        fprintf(logFp, "%s|%5d|[checkCardPendingStatus] ISSTART/ISGTEQ error %d on stcardlog for card # [%.19s]ignored..\n", getDateTime(),PID, iserrno, maskCardNo(stCardLogRec.cardNo, tmpStr));
        fflush(logFp);
    }

    while ( isRead(stCardLogFile, &stCardLogRec.liveChar, ISNEXT) == 0 )
    {
        if ( strncmp(stCardLogRec.cardNo, stCardTabRec.cardNo,19) )
            break;

        if (stCardLogRec.bmUpdateStatus == '1' || stCardLogRec.bmUpdateStatus == '2')
            return YES;
    }
    return NO;
}

calculateHashTotal(unsigned char *recdMsg) 
{
	char tmpStr[100];
	int calculatedHashTotal=0;
	int i=0, messageLength;

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d| CalculateHashTotal() :  strlen=%d\n", getDateTime(), PID, strlen(recdMsg));
		fflush(logFp);
	}
	messageLength = strlen(recdMsg);

	for (i=0;i<messageLength-4;i++)
	{
		calculatedHashTotal += recdMsg[i];
		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d| CalculateHashTotal() : Hash Total [%d] ; RecdMsg[%d;%c] = [%d] \n", getDateTime(), PID, calculatedHashTotal, i, recdMsg[i], recdMsg[i]);
			fflush(logFp);
		}

		if ( calculatedHashTotal > 9999 )
			calculatedHashTotal -= 9999;
	}

	return (calculatedHashTotal);
}

asmoToWindow(unsigned char *buffer)
{
	unsigned c, c1; 
	int noOfSpaces=0;
	int i=0;

	for ( i=0; i < strlen(buffer); i++)
	{
		c = buffer[i];
		if ( c >= 215 && c <= 218 )
			c = c + 1;
		else if ( c >= 224 && c <= 227 )
			c = c - 4;
		else if ( c == 228 )
			c = 225;
		else if ( c >= 229 && c <= 232 )
			c = c - 2;
		else if ( c >= 233 && c <= 234 )
			c = c + 3;
		else if ( c == 160 )
		{
			buffer[i] = ' ';
			c = 254 ;
		}
		buffer[i] = c;
	}
	return 0;
}

windowToAsmo(unsigned char *buffer)
{
	int i;
	unsigned char ch;

	for ( i = 0; i < strlen(buffer); i++ )
	{
		ch = buffer[i];

		if ( ch >= 216 && ch <= 219 )
			buffer[i] = ch - 1;
		else if( ch >= 220 && ch <= 223 )
			buffer[i] = ch + 4;
		else if( ch == 225 )
			buffer[i] = 228;
		else if ( ch >= 227 && ch <= 230 )
			buffer[i] = ch + 2;
		else if ( ch >= 236 && ch <= 237 )
			buffer[i] = ch - 3;
		else
			buffer[i] = ch;
	}

	return 0;
}

validateCustNo(char *custNo)
{
	char tmpStr[100];
	int retStatus=0;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[validateCustNo] for customer number [%.8s]\n", getDateTime(), PID, custNo);

	memset(custInfoResponseMsg.msgLen, ' ', sizeof custInfoResponseMsg);
	memset(custInfoReqMsg.msgLen, ' ', sizeof custInfoReqMsg);
	strncpy(custInfoReqMsg.branchName,"CB-CMS          ",10);
	strncpy(custInfoReqMsg.source,"CM", 2);
	strncpy(custInfoReqMsg.service,"05", 2);
	strncpy(custInfoReqMsg.custNo, custNo, 8);
	strncpy(custInfoReqMsg.userId, cbsIntUserId, 3); /* cbsIntUserId is taken from cbsrtu.cfg file */
	custInfoReqMsg.endOfText = 'Z';
	custInfoReqMsg.nullPad = '\0';

	sprintf(tmpStr,"%04d",strlen(custInfoReqMsg.msgLen));
	strncpy(custInfoReqMsg.msgLen, tmpStr,4);

	fprintf(logFp, "%s|%5d|[validateCustNo] Send to Finacle FI [%s] \n", getDateTime(), PID, custInfoReqMsg.msgLen);
	fflush(logFp);

	retStatus = dealWithFingw(custInfoReqMsg.msgLen, custInfoResponseMsg.msgLen);

	if ( retStatus < 0 )
		return retStatus;

	/*
	if ( dealWithTuxedo("FINONLNGWENQ", custInfoReqMsg.msgLen, custInfoResponseMsg.msgLen) < 0 )
		return -1;
	*/

	if ( strncmp(custInfoResponseMsg.responseStatus, "00000", 5) )
	{
		fprintf(logFp, "%s|%5d|[validateCustNo] Error [%.5s] received from  FINACLE online gateway ; Please check \n", getDateTime(), PID, custInfoResponseMsg.responseStatus);
		fflush(logFp);
		return -5;
	}

	return 0;
}

validateAccNo(char *accNo)
{
	char bmCustNo[10], tmpStr[50];
	char officeTelNo[50], homeTelNo[50], mobileNo[30], faxNo[50], emailAddr[50];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[validateAccNo] for account number [%.16s]\n", getDateTime(), PID, accNo);

	memset(acctInfoReqMsg.msgLen, ' ', sizeof acctInfoReqMsg);
	strncpy(acctInfoReqMsg.branchName,"CB-CMS          ",10);
	strncpy(acctInfoReqMsg.source,"CM", 2);
	strncpy(acctInfoReqMsg.service,"04", 2);
	strncpy(acctInfoReqMsg.accNo, accNo, 16);
	strncpy(acctInfoReqMsg.userId, cbsIntUserId, 3); /* cbsIntUserId is taken from cbsrtu.cfg file */
	acctInfoReqMsg.endOfText = 'Z';
	acctInfoReqMsg.nullPad = '\0';

	sprintf(tmpStr,"%04d",strlen(acctInfoReqMsg.msgLen));
	strncpy(acctInfoReqMsg.msgLen, tmpStr,4);

	fprintf(logFp, "%s|%5d|[validateAccNo] Send to TUXEDO [%s] \n", getDateTime(), PID, acctInfoReqMsg.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("FINONLNGWENQ", acctInfoReqMsg.msgLen, acctInfoResponseMsg.msgLen) < 0 )
		return -1;

	if ( strncmp(acctInfoResponseMsg.responseStatus, "00000",5) )
	{
		fprintf(logFp, "%s|%5d|[validateAccNo] Error [%.5s] received from  FINACLE online gateway for the account # [%.16s] ; Please check \n", getDateTime(), PID, acctInfoResponseMsg.responseStatus, accNo);
		fflush(logFp);
		return -1;
	}

	return 0;
}

checkPrevStatus(char *accNo, char cardType, char *responseStatus)
{
	int intlSuppCount = 0;
	char tmpStr[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkPrevStatus] for the account [%.16s]; card type [%c] \n", getDateTime(), PID, accNo, cardType);

	isindexinfo(stCardTabFile, &cardTabKey, 9);
	strncpy(stCardTabRec.coreAccNo, accNo, 16);
	isstart(stCardTabFile, &cardTabKey, 0, &stCardTabRec.liveChar, ISGTEQ);
	while ( isRead(stCardTabFile, &stCardTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(stCardTabRec.coreAccNo, accNo, 16) )
			break;

		intlSuppCount++;

		if ( stCardTabRec.requestStatus == '9' || stCardTabRec.requestStatus == '8' )
			continue;

		if ( stCardTabRec.cardStatus != '1' && stCardTabRec.cardStatus != '4'  && stCardTabRec.cardStatus != '5' )
			continue;

		if ( stCardTabRec.cardType != cardType )
			continue;

		if ( stCardTabRec.primaryOrSupplementary == 'P' )
		{
			fprintf(logFp, "%s|%5d| Already a primary card [%.19s] with card Type [%c] is available for the account number ; so, NEW atm card request is rejected \n", getDateTime(), PID, maskCardNo(stCardTabRec.cardNo, tmpStr), stCardTabRec.cardType);
			fflush(logFp);
			sprintf(tmpStr, "000%.2s", ALREADYEXISTS);
			strncpy(responseStatus, tmpStr, 5);
			return -1;
		}
	}

	if ( intlSuppCount >= 99 )
	{
		fprintf(logFp, "%s|%5d| Number of cards for the customer exceeded the limit of 99 cards [%.2s]; so, NEW atm card request is rejected \n", getDateTime(), PID, intlSuppCount);
		fflush(logFp);
		sprintf(tmpStr, "000%.2s", SUPPCARDLIMITEXCEED);
		strncpy(responseStatus, tmpStr, 5);
		return -1;
	}

	return 0;
}

/* Read Currency Decimal Places into memory */
int readCnd(currCode)
{
	char tmpStr[5];
	memset(&cndRecXC.liveChar, ' ',  sizeof cndRecXC);
	strncpy(cndRecXC.key, "XC00", 4);
	strncpy(&cndRecXC.key[4], currCode, 2);
	if ( isRead(cndFile, &cndRecXC.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISREAD error %d on cnd0data for XC00%.2s\n", getDateTime(), PID, iserrno, currCode);
		fflush(logFp);
		cndRecXC.decimalPlace = '2';
		return -1;
	}
	return 0;
}

establishCon(char *hostName, char *port)
{
	bzero((char *)&serv_addr,sizeof(serv_addr));
	serv_addr.sin_family=AF_INET;

    if ( isalpha(hostName[0]) )    // Host Name
    {
        if ((myhost = gethostbyname(hostName)) == NULL )
        {
            fprintf(logFp, "%s: Host [%s] not defined in host table. \n", getDateTime(), PID, hostName);
            fflush(logFp);
            return -1;
        }

        memcpy(&serv_addr.sin_addr,myhost->h_addr_list[0],myhost->h_length);
    }
    else    // Host address
        serv_addr.sin_addr.s_addr=inet_addr(hostName);

    serv_addr.sin_port=htons(atoi(port));

	if ( (sockfd=socket(AF_INET,SOCK_STREAM,0)) < 0 )	
	{
          fprintf(logFp,"%s|%5d|: Socket Preparation Failed Error : %d\n", getDateTime(), PID, errno);
	      fflush(logFp);
	      return -1;
	}

	fprintf(logFp,"%s|%5d|: Establishing Connection with %d Port %.5s\n", getDateTime(), PID, sockfd, port);
	fflush(logFp);
    if(connect(sockfd,(struct sockaddr *)&serv_addr,sizeof(serv_addr))<0)
	{
        printf("Connection Failed with %d  Host Name [%s] Port %s  Error : %d\n", sockfd, hostName, port, errno);
        fprintf(logFp, "%s|%5d| : Connection Failed with %d  Host Name [%s] Port %s  Error : %d\n", getDateTime(), PID, sockfd, hostName, port, errno);
	    fflush(logFp);
	    close(sockfd);
		return -1;
	}
	fprintf(logFp,"%s|%5d|: Connection successfully Established with FI ; HostName [%s] ; Port %.5s\n", getDateTime(), PID, hostName, port);
	fflush(logFp);
	return 0;
}

dealWithFingw(char *requestMsg, char *responseMsg)
{
	int retStatus, i, hashTotal=0; 
	int noOfTries = 0, resendTxnTries=0, resendFxTxnTries=0;
	double transAmt=0, baseEquivalent=0;
	char tmpStr[100], errMsg[50];
	char errorDesc[100];


    onlnFlg = establishCon(finHostName, finPortNo);
	if ( onlnFlg == -1 )
	{
		fprintf(logFp, "%s|%5d|: Finacle integrator service is not running ; Please coordinate with Support to start the FI service and try again \n", getDateTime(), PID); 
		fflush(logFp);
		return -1;
	}

	noOfTries = 0;

	memset(errMsg,'\0',sizeof(errMsg));
	while(1)
	{
		if(onlnFlg == -1)  /*if Host connection failed during booting or connection found tampered in any service call*/
		{
			fprintf(logFp, "%s|%5d|: Trying to reEstablish Connection\n", getDateTime(), PID);
			fflush(logFp);
			onlnFlg = establishCon(finHostName, finPortNo); /*Connect again on service call*/

			if (onlnFlg == -1 || noOfTries >= 2 )
			{
				if(onlnFlg == -1)  /*if still connection failed with host*/
				{
					printf("FI service is not running ; Please coordinate with SUPPORT to start the FI and try again \n"); 
					fprintf(logFp, "%s|%5d|: FI service is not running ; Please coordinate with SUPPORT to start the FI and try again \n", getDateTime(), PID); 
					fflush(logFp);
					return -1;
				}
				else if( noOfTries >= 2 )
				{
					printf("Communication failed even after reEstablishing connection : Please report to SUPPORT \n");
					fprintf(logFp,"%s|%5d| : Communication failed even after reEstablishing connection; Please report to SUPPORT \n", getDateTime(), PID);
					fflush(logFp);
					return -2;
				}
			}
		}

		fprintf(logFp, "%s|%5d|: Sending Request message to FI \n", getDateTime(), PID);
		fflush(logFp);

		if ((retStatus=writeToHost(requestMsg, responseMsg, errMsg, BOTH)) < 0)
		{
			noOfTries++;
			fprintf(logFp, "%s|%5d| : write To Host retured : %d|onlnFlg : %d\n",getDateTime(), PID, retStatus, onlnFlg);
			fflush(logFp);
			continue;  /*Redirected to try again after reestablishing conxn*/
		}

		resendTxnTries=0;
		break;
	} /*while loop End*/

	onlnFlg = -1;
	close(sockfd);

	return 0;
}

int writeToHost(char *tmpInbuf, char *tmpOutbuf, char *errMsg, char *mode)
{
	int NoOfBytes;
	int Ret=0;
	char tmpStr[10000];
	int msgLen, noOfBytesReceived=0, retStatus; 

	memset(tmpStr,'\0',sizeof(tmpStr));

	errno = 0;

	if ( strncmp(mode, "recv", 4) ) /*other than recv; could be send or both*/
	{
		fprintf(logFp, "%s|%5d|: Request sent to FI=[%s] \n", getDateTime(), PID, tmpInbuf);
		fflush(logFp);
		TimeoutFlag = 0;
		signal(SIGALRM, toAlarm1);
		alarm(finTimeOut);

		if ( send(sockfd, tmpInbuf, strlen(tmpInbuf), 0) <= 0 )
		{
			fprintf(logFp, "%s|%5d|: Problem while sending  to Host [%d]\n", getDateTime(), PID, errno);
			fflush(logFp);
			if(TimeoutFlag == 1)
			{
				 TimeoutFlag =0;
				 sprintf(errMsg,"Timedout While sending Request to Host");
			}
			else
			{
				 sprintf(errMsg,"Some Error %d in Connection with Host",errno);
			}
			alarm(0);
			onlnFlg = -1;
			close(sockfd);
			return(-1);
		}
	}

	if ( strncmp(mode, "send", 4) == 0 ) /* if it is send only, no need to progress further */
		return 0;

	TimeoutFlag = 0;
	signal(SIGALRM, toAlarm1);
	alarm(finTimeOut);

	memset(tmpOutbuf,'\0',sizeof tmpOutbuf);
	errno=0;

	if ( (Ret=recv(sockfd, tmpOutbuf, 4, 0)) <= 0 )
	{
        fprintf(logFp, "%s|%5d|: Problem while receiving from Host [%d] - FirstTime \n", getDateTime(), PID, errno );
	    fflush(logFp);
	    if(TimeoutFlag == 1)
		{
	        TimeoutFlag =0;
		    sprintf(errMsg,"Timedout While receiving Response From Host");
		}
		else
		{
		    sprintf(errMsg,"Some Error [%d] in Connection with Host",errno);
		}
		alarm(0);
		close(sockfd);
	    onlnFlg = -1;
		return(-1);
	}

	noOfBytesReceived=4;
	sprintf(tmpStr, "%.4s", tmpOutbuf);
	msgLen = atoi(tmpStr);
	if ( (retStatus = recv(sockfd, &tmpOutbuf[4], msgLen-4, 0 )) <= 0 )
	{
        fprintf(logFp, "%s|%5d|: Problem while receiving from Host [%d] - SecondTime\n", getDateTime(), PID, errno );
	    fflush(logFp);
		if( TimeoutFlag == 1 )
		{
           TimeoutFlag =0;
		   sprintf(errMsg,"Timedout While receiving Response From Host");
		}
		else
		{
		   sprintf(errMsg,"Some Error [%d] in Connection with Host",errno);
		}
		alarm(0);
        close(sockfd);
	    onlnFlg = -1;
		return(-1);
	}

	noOfBytesReceived += retStatus;
	while ( noOfBytesReceived <  msgLen )
	{
		fprintf(logFp,"%s|%5d| : The complete message has not been received; msgLen=%d;bytesReceived=%d\n", getDateTime(), PID, msgLen, noOfBytesReceived);
		fflush(logFp);
		if ( (retStatus = recv(sockfd, tmpStr, msgLen-noOfBytesReceived, 0 )) <= 0 )
		{
            fprintf(logFp, "%s|%5d|: Problem while receiving from Host [%d] - Remaining \n", getDateTime(), PID, errno );
		    fflush(logFp);
			if ( TimeoutFlag == 1 )
			{
	                TimeoutFlag =0;
		            sprintf(errMsg,"Timedout While receiving Response From Host");
			}
			else
			{
		           sprintf(errMsg,"Some Error [%d] in Connection with Host",errno);
			}
		    alarm(0);
            close(sockfd);
	        onlnFlg = -1;
		    return(-1);
		}

		strncpy(&tmpOutbuf[noOfBytesReceived], tmpStr, retStatus);
		noOfBytesReceived += retStatus;
	}
	alarm(0);
	tmpOutbuf[msgLen]='\0';

	fprintf(logFp, "%s|%5d|: Response From FI=[%s]\n", getDateTime(), PID, tmpOutbuf); 
    fflush(logFp);

	return(0);
}

void toAlarm1(int i)
{
	TimeoutFlag = 1;
	fprintf(logFp, "%s|%5d|: toAlarm fn called=[%d]\n", getDateTime(), PID, i); 
	fflush(logFp);
}
