/*
	Objective       :       Static data maintenance server 
				            (Modules related to saudi customer opening)

	Date            :       03/08/2003.

	Author          :       S. Rajesh.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
---------------------------------------------------------------------
*/

#include <stdio.h>
#include <curses.h>
#include <stdlib.h>
#include <strings.h>
#include <string.h>
#include <isam.h>
#include <time.h>
#include <signal.h>
#include <dirent.h>
#include <sys/stat.h>
#include <ctype.h>
#include <unistd.h>
#include "../cbslib/stlayout.h"
#include "../cbslib/layout.h"
#include "../cbslib/hsmb24int.h"
#include "cbserver.h"
#include "tpinint.h"
#include "stbmupdate.h"
#include "cbrouter.h"
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

#define YES              1
#define NO               0

#define HIJRI			'0'
#define GREGORIAN		'1'

#define ARABIC			'0'
#define ENGLISH			'1'

#define INDIVIDUAL_SAUDI		'1'
#define INDIVIDUAL_OTHERS 		'2'
#define JURISTIC		 		'3'
#define EMBASSIES		 		'4'
#define DIPLOMATS		 		'5'
#define NON_RESIDENT_JURISTIC	'6'
#define QUICK_CUSTOMER			'7'

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define IDEXPIRYACTION		0
#define CUSTUPDACTION		1

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, acctBmKey, o3dKey, idTabKey1, pbCustKey, heirLogKey, heirTabKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, acctBmFile, o3dFile, idTabFile1, pbCustFile, heirLogFile, heirTabFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;
extern int hsmKey1, hsmKey2, b24Key1, b24Key2;
extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *pbCustFilePath, *heirLogFilePath, *heirTabFilePath;

extern  int page, line, alphaFlag;
extern 	char pinOffset[4], trk1[80], trk2[40];

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];
extern char displayWarningMsgOnDuplicateId;
char tCustNo[15];

struct branchActivityOnCustomer		custLogRec, custLogRec1 ;
struct branchActivityOnJointAccounts jointLogRec;
struct branchActivityOnAccounts 	acctLogRec;
struct branchInfo					ctlRec;
struct userProfile					userRec;
struct refreshInfo					refreshRec;
struct customerInfo					custTabRec, custTabRec1;
struct jointAccountInfo				jointTabRec;
struct customerRangeInfo			custRangeRec;
struct crdUpdate					bmCustRec;
struct gldUpdate					bmAccRec;
struct crd0data 					crdRec;
struct gld0data						gldRec;
struct cnd0dataBR 					cndRec;
struct req0data 					reqRec;
struct gld0data05 					gldMemoRec;
struct abcList						abcRec;
struct cardInfo						cardTabRec, cardTabRec1;
struct branchActivityOnCard			cardLogRec;
struct hsmrequestmsg				hsmRequestMsg;
struct hsmreplymsg					hsmReplyMsg;
struct b24requestmsg				b24RequestMsg;
struct b24replymsg					b24ReplyMsg;
struct tpinHistory					tpinHistRec;
struct branchActivityOnId			idLogRec, idLogRec1;
struct idInfo						idTabRec, idTabRec1;
struct branchActivityOnAddress		addrLogRec, addrLogRec1;
struct addressInfo					addrTabRec, addrTabRec1;
struct calendarInfo					calendarRec;
struct branchActivityOnCustRef		cRefLogRec;
struct customerReferenceInfo		cRefTabRec;
struct o2d0data						o3dRec;
struct acctBm						acctBmRec;
struct stcustpb						pbCustRec;
struct heirInfo						heirTabRec;
struct branchActivityOnHeir			heirLogRec;


extern FILE *logFp, *errLogFp, *expPrtFp;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;

char            *getpath();
char            *getDateTime();
double          bmAmtToDbl();
char            *dblToBmAmt();
char            *bmCustToAcutal();
char            *doubleToPack();
double          packToDouble();

extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, cRefLogFileOpen, cRefTabFileOpen, pbCustFileOpen, heirLogFileOpen, heirTabFileOpen ;

char getPrevStatus(char *accNo);

updateIdLogForSaudiIndividual()
{
	char tmpStr[100], tmpStr1[50];
	int idFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	idLogRec.liveChar = '@';
	strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	strncpy(idLogRec.custNo, custLogRec.custNo,  7);
	idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
	idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
	strncpy(idLogRec.idRefNo, "0000", 4);

	idLogRec.idCategory = 'C'; /* Customer */

	idFoundFlag = NO;
	idLogRec.idType = 'I';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'I' )
			 break;
		/*
		if ( strncmp(idLogRec.branchCode, receivedMsg.saudiIndividual.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'I' )
			 break; 
		*/

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	/* If the customer is opened through phone, then the branch userid and the new date&Time 
	   should be replaced */
	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.idNo, "                  ", 15) )
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('I');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}

		idLogRec.idType = 'I';
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.idNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.idIssuedAt,20);
		idLogRec.idDateType = receivedMsg.saudiIndividual.idDateType;
		if( receivedMsg.saudiIndividual.idDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.idIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.idIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.idExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.idExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.idIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.idIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.idExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.idExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo=[%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	idLogRec.idType = 'P';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'P' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode, 4);
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.passportNo,"                  ", 15) ) /* Write passport details */
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('P');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'P';
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.passportNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.ppIssuedAt,20);
		idLogRec.idDateType = receivedMsg.saudiIndividual.ppDateType;
		if( receivedMsg.saudiIndividual.ppDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.ppIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.ppIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.ppExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.ppExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.ppIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.ppIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.ppExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.ppExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	idLogRec.idType = 'H';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'H' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.hafizaNo, "                  ", 15) ) 
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('H');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'H';  /* Hafiza No */
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.hafizaNo, 15);
		idLogRec.idDateType = receivedMsg.saudiIndividual.hafDateType;
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.hafIssuedAt,20);
		if( receivedMsg.saudiIndividual.hafDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.hafIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.hafIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.hafExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.hafExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.hafIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.hafIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.hafExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.hafExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s]  custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	idLogRec.idType = 'F';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'F' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.familyRegnNo, "                        ", 15) )
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('F');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'F';  /* Family Registration No */
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.familyRegnNo, 15);
		idLogRec.idDateType = receivedMsg.saudiIndividual.frDateType;
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.frIssuedAt,20);
		if( receivedMsg.saudiIndividual.frDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.frIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.frIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.frExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.frExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.frIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.frIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.frExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.frExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}

		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	idLogRec.idType = 'S';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'S' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.samaAuthNo, "                        ", 15) &&
				 receivedMsg.saudiIndividual.samaAuthNo[0] != NULL && 	
				 receivedMsg.saudiIndividual.screenSetNo != 'A' )
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('S');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'S';  /* Sama Authorization No */
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.samaAuthNo, 15);
		idLogRec.idDateType = receivedMsg.saudiIndividual.samaAuthDateType;
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.samaAuthIssuedAt,20);
		if( receivedMsg.saudiIndividual.samaAuthDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.samaAuthIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.samaAuthExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.samaAuthIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.samaAuthIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.samaAuthExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}

		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	idLogRec.idType = 'E'; /* Succession deed number */
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.saudiIndividual.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.saudiIndividual.dateTime, 14) ||
			 idLogRec.idType != 'E' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.saudiIndividual.samaAuthNo, "                        ", 15) && 
				 receivedMsg.saudiIndividual.screenSetNo == 'A' )
	{
		if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
			 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('E');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'E';  /* Succession deed number */
		strncpy(idLogRec.idNo, receivedMsg.saudiIndividual.samaAuthNo, 15);
		idLogRec.idDateType = receivedMsg.saudiIndividual.samaAuthDateType;
		strncpy(idLogRec.idIssuedAt,receivedMsg.saudiIndividual.samaAuthIssuedAt,20);
		if( receivedMsg.saudiIndividual.samaAuthDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.saudiIndividual.samaAuthIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.saudiIndividual.samaAuthExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.saudiIndividual.samaAuthIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.saudiIndividual.samaAuthIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.saudiIndividual.samaAuthExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}

		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForSaudiIndividual] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	return SUCCESS;
}

updateAddrLogForSaudiIndividual()
{
	char tmpStr[100];
	int addressFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updteAddrLogForSaudiIndividual]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
	strncpy(addrLogRec.userId, receivedMsg.saudiIndividual.userId,10);
	strncpy(addrLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
	addrLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
	addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

	strncpy(addrLogRec.addressType, "00", 2);  /* Since only local address is available for saudi */
	strncpy(addrLogRec.addressNo, "0000", 4);
	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' && 
		 receivedMsg.saudiIndividual.newOrUpdate == 'U' )
	{
		retStatus = checkAddrTabExistance("00"); /* Check the existance of local address in staddrtab */
		if ( retStatus == SUCCESS )
			addrLogRec.newOrUpdate = 'U';
		else
			addrLogRec.newOrUpdate = 'N';
	}

	/* Read corresponding Address log record */

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 0, &addrLogRec.liveChar, ISGTEQ);
	addressFoundFlag = NO;

	if ( isRead(addrLogFile, &addrLogRec.liveChar, ISEQUAL) == 0 )
	{
		addressFoundFlag = YES;
		/*
		fprintf(logFp, "%s|%5d|[updateAddrLogForSaudiIndividual] ISREAD/ISEQUAL error %d on staddrlog for key [%.28s]; customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrLogRec.branchCode, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured while reading staddrlog", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
		*/
	}
	else
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(addrLogRec.userId, custLogRec.userId,10);
		strncpy(addrLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
		addrLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;
		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(addrLogRec.addressType, "00", 2);  /* Since only local address is available for saudi */
		strncpy(addrLogRec.addressNo, "0000", 4);
	}
	strncpy(addrLogRec.custNo, custLogRec.custNo, 7);

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(addrLogRec.userId, custLogRec.userId,10);
		strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
	}

	addrLogRec.addrType = receivedMsg.saudiIndividual.addressType;
	if ( receivedMsg.saudiIndividual.addressType == '1' ) /* Saudi Postal address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.saudiIndividual.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.saudiIndividual.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.saudiIndividual.poBox, 5); /* The unit number is copied in POBOX field for purpose
																			of CPDB loading */
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.saudiIndividual.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.saudiIndividual.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.saudiIndividual.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.saudiIndividual.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.saudiIndividual.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.saudiIndividual.country, 3);
	if ( strncmp(receivedMsg.saudiIndividual.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode,receivedMsg.saudiIndividual.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.saudiIndividual.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.saudiIndividual.telOffExt, 4);
	if ( strncmp(receivedMsg.saudiIndividual.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode,receivedMsg.saudiIndividual.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.saudiIndividual.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.saudiIndividual.telHomeExt, 4);
	if ( strncmp(receivedMsg.saudiIndividual.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode,receivedMsg.saudiIndividual.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.saudiIndividual.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.saudiIndividual.faxExt, 4);
	if ( strncmp(receivedMsg.saudiIndividual.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo,receivedMsg.saudiIndividual.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.saudiIndividual.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.saudiIndividual.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(addrLogRec.lastUpdateUser, custLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForSaudiIndividual] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	else 
	{
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForSaudiIndividual] Before writing to addrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
			fflush(logFp);
		}
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForSaudiIndividual] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}

	/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
		writeAddrLogForPhoneHistory(receivedMsg.saudiIndividual.branchCode);  

	return SUCCESS;
}

processSaudiIndividualCustRequest() 
{
	char tmpStr[100], tmpStr1[100];
	char recdIdType, recdIdNo[20]; 
	char recdIdIssuedAt[25], recdIdDateType, recdIdIssueDateH[10], recdIdIssueDateG[10] ;
	char recdIdExpiryDateH[10], recdIdExpiryDateG[10] ;
	int  thisHijriYear, dobHijriYear, customerAge=0;
	char todayHijriDate[10], tmpCustNo[20];
	int i, mode,pendingStatus;
	char *isLogPathName;
	int zeroUpdateReqd=NO; 
	int custTabRecFound=NO, primaryAcc=0;
	int pbCustRecFound=NO;
	int isappLogFp ;
	int errorNo;
	long oldSigMask;
	char referenceFound[10], referenceReqdFor[15];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|processSaudiIndividualCustRequest() Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.saudiIndividual.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.saudiIndividual.dateTime);
		fflush(logFp);
		sprintf(tmpStr, "Encountered problem in date&time;retry your action");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( custLogFileOpen == YES )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
	}

	if ( idLogFileOpen == YES )
	{
		isclose(idLogFile);
		idLogFileOpen=NO;
	}

	if ( addrLogFileOpen == YES )
	{
		isclose(addrLogFile);
		addrLogFileOpen=NO;
	}

	if ( ctlFileOpen == YES )
	{
		isclose(ctlFile);
		ctlFileOpen=NO;
	}
	if ( cardTabFileOpen == YES )
	{
		isclose(cardTabFile);
		cardTabFileOpen=NO;
	}
	if ( cardLogFileOpen == YES )
	{
		isclose(cardLogFile); 
		cardLogFileOpen=NO;
	}
	if ( acctLogFileOpen == YES )
	{
		isclose(acctLogFile);
		acctLogFileOpen=NO;
	}
	if ( pbCustFileOpen == YES )
	{
		isclose(pbCustFile);
		pbCustFileOpen=NO;
	}

	readBankingDate();


	oldSigMask = sigblock(sigmask(SIGINT)  |      /* Interrupt  */
						  sigmask(SIGHUP)  |      /* Hangup     */
						  sigmask(SIGQUIT) |      /* Quit       */
						  sigmask(SIGPIPE) |      /* child process terminated  */
						  sigmask(SIGUSR1) |      /* user defined signal-16*/
						  sigmask(SIGUSR2) |      /* user defined signal-17*/
						  sigmask(SIGTERM) |      /* Quit       */
						  sigmask(SIGALRM) );     /* Alarm      */

	sprintf(tmpStr, "isst%d.log", getpid());
	isLogPathName = getpath(tmpStr, "log");
	if ( (isappLogFp = creat(isLogPathName, 0660)) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while creating CISAM log file ", errno);
		formatBranchResponse( INTERNALERR, tmpStr, tmpStr );
		sigsetmask(oldSigMask);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	close(isappLogFp);
	if ( islogopen(isLogPathName) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening CISAM log file ", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( isbegin() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] ISBEGIN error %d;  while customer creation \n", getDateTime(), PID, iserrno);
		fflush(logFp);
		sprintf(tmpStr, "ISBEGIN error %d while customer creation ", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCustLogFile(ISMANULOCK + ISINOUT+ISTRANS)  < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(cardLogFile);
		custLogFileOpen=cardLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCtlFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);
		custLogFileOpen=cardTabFileOpen=cardLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAcctLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openPbCustFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); 
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCalendarFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCustTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrefLogFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	/* temporary fix for Phase-II; valid until the client is changed */

	if ( strncmp(receivedMsg.saudiIndividual.altBranchCode, "-Inv",4) ==  0 || receivedMsg.saudiIndividual.altBranchCode[0] == NULL )
		strncpy(receivedMsg.saudiIndividual.altBranchCode, "000000", 4);
	if ( receivedMsg.saudiIndividual.updateCardAddressReqd == NULL )
		receivedMsg.saudiIndividual.updateCardAddressReqd = '0';

	/* Phase-II fixes - ends here */

	memset(&custLogRec.liveChar,' ',sizeof custLogRec);
	custLogRec.liveChar='@';

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'U' && 
		 receivedMsg.saudiIndividual.creationOrUpdate == 'C' )
	{
		pendingStatus = checkPendingStatus(receivedMsg.saudiIndividual.custNo);
		if( pendingStatus == SUCCESS )
		{
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Customer [%.7s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, receivedMsg.saudiIndividual.custNo, custLogRec.bmUpdateStatus, custLogRec.userId, custLogRec.branchCode);
			fflush(logFp);
			if ( custLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", custLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", custLogRec.userId, custLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		custTabRecFound=NO;
		/* custTab read is moved outside of zeroUpdateReqd(if) since custTab record is required during minorOrMajor check */
		memset(&custTabRec1.liveChar, ' ', sizeof(custTabRec1));
		strncpy(custTabRec1.custNo, receivedMsg.saudiIndividual.custNo, 7);
		isindexinfo(custTabFile, &custTabKey, 1);
		isstart(custTabFile, &custTabKey, 0, &custTabRec1.liveChar, ISGTEQ);
		if ( isRead(custTabFile, &custTabRec1.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]: ISREAD/ISEQUAL error %d on stcusttab while reading for the customer [%.7s]  to write 0th update record in stcustlog ;IGNORED\n", getDateTime(), PID, iserrno,custTabRec1.custNo);
			fflush(logFp);
		}
		else
			custTabRecFound = YES;

		zeroUpdateReqd = checkZeroUpdateReqd(receivedMsg.saudiIndividual.custNo);

		if ( zeroUpdateReqd == YES )
		{
			if ( custTabRecFound == YES )
			{
				memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

				/*strncpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);*/
				custLogRec1.liveChar = '@';
				strncpy(custLogRec1.branchCode, receivedMsg.saudiIndividual.homeBranch, 4);
				strncpy(custLogRec1.userId, "MIGRATION              ",20);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(custLogRec1.dateTime, tmpStr, 14);
				custLogRec1.bmUpdateStatus = '9'; 
				strncpy(custLogRec1.custNo, custTabRec1.custNo, 7);
				strncpy(custLogRec1.supervisorId, "MIGRATION              ", 20);
				strncpy(custLogRec1.custBranchCode, custTabRec1.branchCode, 4);

				strncpy(custLogRec1.idNo,custTabRec1.idNo,1024);
				custLogRec1.custType = custTabRec1.custType;
				strncpy(custLogRec1.samaMainCategory, custTabRec1.samaMainCategory, 4);
				strncpy(custLogRec1.lastUpdateUser, custTabRec1.lastUpdateUser, 34);
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Before writing to custLogFile (%d) for 0th Update..\n", getDateTime(), PID, custLogFile);
					fflush(logFp);
				}
				if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
					fflush(logFp);
					fprintf(errLogFp, "%s : processSuperDecision :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]\n", getDateTime(), iserrno,custLogRec1.branchCode);
					fflush(errLogFp);
				}
				else
				{
					if ( extraDebug )
						fprintf(logFp, "0th update record has been added successfully\n");
				}
			}
		}

		memset(&custLogRec.liveChar,' ',sizeof custLogRec);
		strncpy(custLogRec.branchCode,receivedMsg.saudiIndividual.branchCode, 4);
		strncpy(custLogRec.userId, receivedMsg.saudiIndividual.userId, 10);
		strncpy(custLogRec.dateTime,receivedMsg.saudiIndividual.dateTime, 14);
		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] :No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), PID, custLogRec.branchCode);
				fflush(logFp);
				fprintf(errLogFp, "%s :processCustRequest(): No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), custLogRec.branchCode);
				fflush(errLogFp);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] :CISAM Error %d occured on stcustlog for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode);
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( strncmp(receivedMsg.saudiIndividual.idNo, "                       ", 15) )
	{
		recdIdType = 'I'; /* Saudi Id */
		sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.idNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.idIssuedAt);
		recdIdDateType = receivedMsg.saudiIndividual.idDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.idIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.idIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.idExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.idExpiryDateG);
	}
	else if ( strncmp(receivedMsg.saudiIndividual.passportNo, "                  ", 15) )
	{
		recdIdType = 'P'; /* Passport */
		sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.passportNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.ppIssuedAt);
		recdIdDateType = receivedMsg.saudiIndividual.ppDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.ppIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.ppIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.ppExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.ppExpiryDateG);
	}
	else if ( strncmp(receivedMsg.saudiIndividual.hafizaNo, "                 ", 15) )
	{
		recdIdType = 'H'; /* Hafiza */
		sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.hafizaNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.hafIssuedAt);
		recdIdDateType = receivedMsg.saudiIndividual.hafDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.hafIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.hafIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.hafExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.hafExpiryDateG);
	}
	else if ( strncmp(receivedMsg.saudiIndividual.familyRegnNo, "                   ", 15) )
	{
		recdIdType = 'F';
		sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.familyRegnNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.frIssuedAt);
		recdIdDateType = receivedMsg.saudiIndividual.frDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.frIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.frIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.frExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.frExpiryDateG);
	}
	else if ( strncmp(receivedMsg.saudiIndividual.samaAuthNo, "                   ", 15) )
	{
		if ( receivedMsg.saudiIndividual.screenSetNo == 'A' ) /* Accounts of heirs */
			recdIdType = 'E'; /* Succession deed number */
		else
			recdIdType = 'S'; /* SAMA authorization number */
		sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.samaAuthNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.samaAuthIssuedAt);
		recdIdDateType = receivedMsg.saudiIndividual.samaAuthDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateG);
	}

	if ( receivedMsg.saudiIndividual.samaAuthNo[0] != NULL )
	{
		if ( strncmp(receivedMsg.saudiIndividual.samaAuthNo, "                   ", 15) && 
			 receivedMsg.saudiIndividual.screenSetNo == 'A' ) /* For a/c of heirs, make the succession deed number as Primary ID */
		{
			recdIdType = 'E'; /* Succession deed number */
			sprintf(recdIdNo, "%.15s", receivedMsg.saudiIndividual.samaAuthNo);
			sprintf(recdIdIssuedAt, "%.20s", receivedMsg.saudiIndividual.samaAuthIssuedAt);
			recdIdDateType = receivedMsg.saudiIndividual.samaAuthDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.saudiIndividual.samaAuthIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.saudiIndividual.samaAuthExpiryDateG);
		}
	}

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		strncpy(custLogRec.branchCode,receivedMsg.saudiIndividual.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.saudiIndividual.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);

		if ( readCustLogFile(ISEQUAL) < 0 )
		{
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
	     	sendResponse(responseMsg.customer.msgLen);
	     	return FAILURE;
		}
	}

	custLogRec.liveChar = '@';
	/* If the customer opened through phone; then the customer entry should be made as pending with the customer branch */
	if ( receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
	{
		strncpy(custLogRec.branchCode,receivedMsg.saudiIndividual.custBranchCode,4);
		custLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */
	}
	else
		strncpy(custLogRec.branchCode,receivedMsg.saudiIndividual.branchCode,4);
		/* custLogRec.custOpenSource  should not be set to B as it will overwrite the source flag to "B" for the customers
		   opened through phone */

	/* For the customer record opened through phone, customer branch CSO ID should be replaced in UserId for further use (i.e.,after the customer visits the branch) */
	if ( strncmp(receivedMsg.saudiIndividual.branchCsoId, "                ", 10) && receivedMsg.saudiIndividual.branchCsoId[0] != NULL )
	{
		strncpy(custLogRec.userId, receivedMsg.saudiIndividual.branchCsoId, 10); /* Key change */
		strncpy(custLogRec.dateTime,receivedMsg.saudiIndividual.branchActionDateTime,14); /* Key change */
	}
	else
	{
		strncpy(custLogRec.userId, receivedMsg.saudiIndividual.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
	}
	custLogRec.newOrUpdate = receivedMsg.saudiIndividual.newOrUpdate;

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' && receivedMsg.saudiIndividual.creationOrUpdate == 'C' )
	{
		memset(tmpCustNo, NULL, sizeof tmpCustNo);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Getting next customer number \n", getDateTime(), PID);
		fflush(logFp);
		if ( getNextCustNoFromCtl(tmpCustNo) == FAILURE )
		{
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Obtained number=%.7s\n", getDateTime(), PID, tmpCustNo);
		fflush(logFp);
		strncpy(custLogRec.custNo, tmpCustNo, 7);
	}
	else
		strncpy(custLogRec.custNo, receivedMsg.saudiIndividual.custNo,7);

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' && custLogRec.custOpenSource == 'P' )
	{
		/* Write/Update the  record in customers created through Phone banking file (stcustpb) */
		memset(&pbCustRec.liveChar, ' ', sizeof pbCustRec);
		pbCustRec.liveChar = '@';
		strncpy(pbCustRec.custNo, custLogRec.custNo, 7);
		isindexinfo(pbCustFile, &pbCustKey, 1);
		isstart(pbCustFile, &pbCustKey, 0, &pbCustRec.liveChar, ISGTEQ);

		pbCustRecFound = YES;
		if ( isRead(pbCustFile, &pbCustRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);

			if ( iserrno != 111  && iserrno != 110 )
			{
				sprintf(tmpStr, "CISAM Error %d occured on crd0data", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			pbCustRecFound = NO;
		}

		if ( receivedMsg.saudiIndividual.custOpenSource == 'P' )  /* If it is opened through phone for the first time */
		{
			strncpy(pbCustRec.branchCode, receivedMsg.saudiIndividual.branchCode, 4);
			strncpy(pbCustRec.userId, receivedMsg.saudiIndividual.userId,10);
			strncpy(pbCustRec.dateTime,receivedMsg.saudiIndividual.dateTime,14);
		}

		pbCustRec.pendingStatus = receivedMsg.saudiIndividual.bmUpdateStatus;
		if ( strncmp(receivedMsg.saudiIndividual.branchCsoId, "                ", 10) && receivedMsg.saudiIndividual.branchCsoId[0] != NULL )
		{
			strncpy(pbCustRec.branchCsoId, receivedMsg.saudiIndividual.branchCsoId, 10); 
			strncpy(pbCustRec.branchActionDateTime, receivedMsg.saudiIndividual.branchActionDateTime, 14);
		}

		strncpy(pbCustRec.custBranchCode, receivedMsg.saudiIndividual.custBranchCode, 4);

		strncpy(pbCustRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(pbCustRec.lastUpdateDateTime, tmpStr, 14);

		if ( pbCustRecFound == YES )
		{
			if ( isRewcurr(pbCustFile, &pbCustRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]  : ISREWCURR error %d on stcustpb  for the customer number [%.7]\n", getDateTime(), PID, iserrno, pbCustRec.custNo );
				fflush(logFp);
				if  ( iserrno == 100 || iserrno == 108 )
				{
					sprintf(tmpStr, "Duplicate record [%.7s] on stcustpb",pbCustRec.custNo);
					formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stcustpb" );
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{ 
					sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			if ( isWrite(pbCustFile, &pbCustRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]  : ISWRITE error %d on stcustpb for the customer # [%.7s]\n", getDateTime(), PID, iserrno, pbCustRec.custNo );
				fflush(logFp);
				if  ( iserrno == 100 || iserrno == 108 )
				{
					sprintf(tmpStr, "Duplicate record [%.7s] on stcustpb",custLogRec.custNo);
					formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stcustpb" );
					formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	custLogRec.bmUpdateStatus = receivedMsg.saudiIndividual.bmUpdateStatus;

	if ( receivedMsg.saudiIndividual.creationOrUpdate == 'C' )
	{
		if ( checkAList  || checkBList || checkCList )
		{
			if ( checkSarABCList(recdIdType, recdIdNo) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			custLogRec.foundInAList = '0';
			custLogRec.foundInBList = '0';
			custLogRec.foundInCList = '0';
		}	

		/* Checking the ABC List is Over */

		/* Now, check for existance of the customer in stcusttab */

		if ( checkSarCustomerExistance(recdIdType, recdIdNo) == FAILURE )
		{
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	strncpy(custLogRec.supervisorId,receivedMsg.saudiIndividual.supervisorId,10);
	strncpy(custLogRec.custBranchCode,receivedMsg.saudiIndividual.custBranchCode,4);
	strncpy(custLogRec.samaMainCategory, receivedMsg.saudiIndividual.samaMainCategory, 2);
	strncpy(custLogRec.samaSubCategory, receivedMsg.saudiIndividual.samaSubCategory, 2);
	custLogRec.preferredLang = receivedMsg.saudiIndividual.preferredLang;
	strncpy(custLogRec.nationality,receivedMsg.saudiIndividual.nationality,3);

	custLogRec.idType = recdIdType;
	strncpy(custLogRec.idNo,recdIdNo,15);
	custLogRec.idDateType = recdIdDateType;

	strncpy(custLogRec.idIssuedAt, recdIdIssuedAt, 20);
	if( recdIdDateType == HIJRI ) 
	{	
		strncpy(custLogRec.idIssueDateH, recdIdIssueDateH,8);
		sprintf(tmpStr, "%.8s", recdIdIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr,tmpStr1); 
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.idIssueDateG,tmpStr1,8);
		strncpy(custLogRec.idExpiryDateH, recdIdExpiryDateH,8);
		sprintf(tmpStr, "%.8s", recdIdExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);

		strncpy(custLogRec.idExpiryDateG,tmpStr1,8);
	}
	else
	{
		strncpy(custLogRec.idIssueDateG,recdIdIssueDateG,8);
		sprintf(tmpStr,"%.8s",recdIdIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(custLogRec.idExpiryDateG, recdIdExpiryDateG,8);
		sprintf(tmpStr, "%.8s", recdIdExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.idExpiryDateH,tmpStr1,8);
	}
	strncpy(custLogRec.titleCode,receivedMsg.saudiIndividual.titleCode,2);
	custLogRec.sexCode = receivedMsg.saudiIndividual.sexCode;
	custLogRec.maritalStatus = receivedMsg.saudiIndividual.maritalStatus;
	strncpy(custLogRec.noOfDependents,receivedMsg.saudiIndividual.noOfDependents,2);
	strncpy(custLogRec.educationCode,receivedMsg.saudiIndividual.educationCode,2);
	strncpy(custLogRec.professionCode,receivedMsg.saudiIndividual.professionCode,2);
	strncpy(custLogRec.positionCode,receivedMsg.saudiIndividual.positionCode,2);
	strncpy(custLogRec.monthlyIncome,receivedMsg.saudiIndividual.monthlyIncome,2);
	strncpy(custLogRec.ownerShip,receivedMsg.saudiIndividual.ownerShip,10);
	custLogRec.packageAcc = receivedMsg.saudiIndividual.packageAcc;
	custLogRec.dobDateType  = receivedMsg.saudiIndividual.dobDateType;

	if ( receivedMsg.saudiIndividual.dobDateType == HIJRI ) 
	{
		strncpy(custLogRec.dobDateH,receivedMsg.saudiIndividual.dobDateH,8);
		sprintf(tmpStr,"%.8s", receivedMsg.saudiIndividual.dobDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.dobDateG, tmpStr1, 8);
	}
	else
	{
		strncpy(custLogRec.dobDateG,receivedMsg.saudiIndividual.dobDateG,8);
		sprintf(tmpStr,"%.8s", receivedMsg.saudiIndividual.dobDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.dobDateH, tmpStr1, 8);
	}

	sprintf(tmpStr, "%.8s", custLogRec.dobDateG);
	if ( validate(tmpStr) >= 0 ) /* only for those holding valid birth dates */
	{
		/* get the current date in hijri*/
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
		gregToHijri(tmpStr, todayHijriDate);
		sprintf(tmpStr, "%.4s", todayHijriDate);
		thisHijriYear = atoi(tmpStr);
		sprintf(tmpStr, "%.4s", custLogRec.dobDateH);
		dobHijriYear = atoi(tmpStr);
		customerAge = thisHijriYear - dobHijriYear;
		if ( strncmp(&todayHijriDate[4], &custLogRec.dobDateH[4], 4) < 0 )
			customerAge --;
	}

	if ( custLogRec.minorOrMajor != '1' )
	{
		sprintf(tmpStr, "%.8s", custLogRec.dobDateG);
		if ( validate(tmpStr) >= 0 ) /* only for those holding valid birth dates */
		{
			if ( customerAge < 18 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] %.7s having DOB as %.8s is still a minor and hence flagging him as minor\n", getDateTime(), PID, custLogRec.custNo, custLogRec.dobDateH);
				custLogRec.minorOrMajor = '1';
			}
		}
	}

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'U' && 
		 receivedMsg.saudiIndividual.creationOrUpdate == 'C' )
	{ 
		if ( custTabRecFound == YES ) 
		{
			if ( custTabRec1.minorOrMajor == '1' ) /* customer is defined as MINOR */
			{
				sprintf(tmpStr, "%.8s", custLogRec.idExpiryDateG); /* Expiry Date of primary ID */
				if ( validate(tmpStr) >= 0 ) /* only valid expiry dates */
				{
					getDateTime();
					sprintf(tmpStr1, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
					if ( strncmp(tmpStr, tmpStr1, 8) > 0 ) /* check if his primary ID is not expired */
					{
						sprintf(tmpStr, "%.8s", custLogRec.dobDateG);
						if ( validate(tmpStr) >= 0 ) /* only for those holding valid birth dates */
						{
							if ( customerAge >= 18 )
							{
								fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] %.7s having DOB as [H%.8s;G%.8s] is reached a major age and hence removing the minor flagg \n", getDateTime(), PID, custLogRec.custNo, custLogRec.dobDateH, custLogRec.dobDateG);
								custLogRec.minorOrMajor = '0';
							}
						}
					}
				}
			}
		}
	}

	if ( strncmp(receivedMsg.saudiIndividual.samaSubCategory, "02", 2) == 0 && 
		   receivedMsg.saudiIndividual.referenceReqdFor[4] == '1' )   /* referenceReqdFor[4] - Minor with special circumstances */
		custLogRec.childWithSpecialCase = '1';

	custLogRec.vipCode = receivedMsg.saudiIndividual.vipCode;
	custLogRec.residentStatus = receivedMsg.saudiIndividual.residentStatus;
	strncpy(custLogRec.businessType,receivedMsg.saudiIndividual.businessType,3);

	strncpy(custLogRec.aFirstName,receivedMsg.saudiIndividual.aFirstName,15);
	strncpy(custLogRec.a2ndName,receivedMsg.saudiIndividual.a2ndName,15);
	strncpy(custLogRec.a3rdName,receivedMsg.saudiIndividual.a3rdName,15);
	strncpy(custLogRec.aLastName,receivedMsg.saudiIndividual.aLastName,15);
	strncpy(custLogRec.aShortName,receivedMsg.saudiIndividual.aShortName,30);
	strncpy(custLogRec.eFirstName,receivedMsg.saudiIndividual.eFirstName,15);
	strncpy(custLogRec.e2ndName,receivedMsg.saudiIndividual.e2ndName,15);
	strncpy(custLogRec.e3rdName,receivedMsg.saudiIndividual.e3rdName,15);
	strncpy(custLogRec.eLastName,receivedMsg.saudiIndividual.eLastName,15);
	strncpy(custLogRec.eShortName,receivedMsg.saudiIndividual.eShortName,30);

	custLogRec.addressType = receivedMsg.saudiIndividual.addressType;
	if ( receivedMsg.saudiIndividual.addressType == '1' ) /* Saudi POST */
	{
		strncpy(custLogRec.unitNo, receivedMsg.saudiIndividual.poBox, 5); /* The first 5 digits of POBOX is unit No */
		strncpy(custLogRec.gprsNo, receivedMsg.saudiIndividual.address1, 5); /* The first 5 digits of address1 is GPRS No */
		strncpy(custLogRec.poBox, receivedMsg.saudiIndividual.poBox, 5); /* The unit number is copied in POBOX field for purpose
																			of CPDB loading */

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.saudiIndividual.address1[5] == '-' )
			receivedMsg.saudiIndividual.address1[5] = ' ';
	}
	else
		strncpy(custLogRec.poBox,receivedMsg.saudiIndividual.poBox,10);


    strncpy(custLogRec.address1,receivedMsg.saudiIndividual.address1,30);
	strncpy(custLogRec.address2,receivedMsg.saudiIndividual.address2,30);
	strncpy(custLogRec.cityName,receivedMsg.saudiIndividual.cityName,20);
	strncpy(custLogRec.zipCode,receivedMsg.saudiIndividual.zipCode,10);
	strncpy(custLogRec.country,receivedMsg.saudiIndividual.country,3);
	if ( strncmp(receivedMsg.saudiIndividual.telOffNo, "           ", 10) )
		strncpy(custLogRec.telOffAreaCode,receivedMsg.saudiIndividual.telOffAreaCode,4);
	strncpy(custLogRec.telOffNo,receivedMsg.saudiIndividual.telOffNo,10);
	strncpy(custLogRec.telOffExt,receivedMsg.saudiIndividual.telOffExt,4);
	if ( strncmp(receivedMsg.saudiIndividual.telHomeNo, "           ", 10) )
		strncpy(custLogRec.telHomeAreaCode,receivedMsg.saudiIndividual.telHomeAreaCode,4);
	strncpy(custLogRec.telHomeNo,receivedMsg.saudiIndividual.telHomeNo,10);
	strncpy(custLogRec.telHomeExt,receivedMsg.saudiIndividual.telHomeExt,4);
	if ( strncmp(receivedMsg.saudiIndividual.faxNo, "           ", 10) )
		strncpy(custLogRec.faxAreaCode,receivedMsg.saudiIndividual.faxAreaCode,4);
	strncpy(custLogRec.faxNo,receivedMsg.saudiIndividual.faxNo,10);
	strncpy(custLogRec.faxExt,receivedMsg.saudiIndividual.faxExt,4);
	if ( strncmp(receivedMsg.saudiIndividual.mobileNo, "05         ", 10) )
		strncpy(custLogRec.mobileNo,receivedMsg.saudiIndividual.mobileNo,10);
	strncpy(custLogRec.pagerNo,receivedMsg.saudiIndividual.pagerNo,10);
	strncpy(custLogRec.eMail,receivedMsg.saudiIndividual.eMail,30);

	custLogRec.segmentation = receivedMsg.saudiIndividual.segmentation;
	strncpy(custLogRec.employerName,receivedMsg.saudiIndividual.employerName,30);
    strncpy(custLogRec.department,receivedMsg.saudiIndividual.department,20);
	strncpy(custLogRec.employerPoBox,receivedMsg.saudiIndividual.employerPoBox,10);
	strncpy(custLogRec.employerCity,receivedMsg.saudiIndividual.employerCity,20);
	strncpy(custLogRec.employerZipCode,receivedMsg.saudiIndividual.employerZipCode,10);
	strncpy(custLogRec.documentsSupplied,receivedMsg.saudiIndividual.documents,60);/*SAR */
	strncpy(custLogRec.documentOther,receivedMsg.saudiIndividual.documentOther,50);
	custLogRec.singleJointAcc = receivedMsg.saudiIndividual.singleJointAcc;
	strncpy(custLogRec.noOfJointCustomer, receivedMsg.saudiIndividual.noOfJointCustomer, 2);
	strncpy(custLogRec.jointAccNameOnCheck, receivedMsg.saudiIndividual.jointAccNameOnCheck,60); 
	strncpy(custLogRec.jointAccNameOnReports,receivedMsg.saudiIndividual.jointAccNameOnReports,30);  
	custLogRec.signatureNature = receivedMsg.saudiIndividual.signatureNature;

	custLogRec.cardType = receivedMsg.saudiIndividual.cardType;
	custLogRec.electronIntlRequired = receivedMsg.saudiIndividual.electronIntlRequired;
	strncpy(custLogRec.electronIntlName,receivedMsg.saudiIndividual.electronIntlName,26);
	custLogRec.electronIntlSuppRequired = receivedMsg.saudiIndividual.electronIntlSuppRequired;
	strncpy(custLogRec.electronIntlSuppName,receivedMsg.saudiIndividual.electronIntlSuppName,26);
	custLogRec.deliveryToBranchOrPO = receivedMsg.saudiIndividual.deliveryToBranchOrPO;
	strncpy(custLogRec.deliveryAddress1,receivedMsg.saudiIndividual.deliveryAddress1,30);
	strncpy(custLogRec.deliveryAddress2,receivedMsg.saudiIndividual.deliveryAddress2,30);
	strncpy(custLogRec.deliveryPoBox,receivedMsg.saudiIndividual.deliveryPoBox,10);
	strncpy(custLogRec.deliveryCity,receivedMsg.saudiIndividual.deliveryCity,20);
	strncpy(custLogRec.deliveryZip,receivedMsg.saudiIndividual.deliveryZip,10);
	strncpy(custLogRec.supervisorComments,receivedMsg.saudiIndividual.supervisorComments,200);

	custLogRec.custType = '0'; /* customer type is moved as Consumer since the existing version should display correctly*/
	custLogRec.updateCardAddressReqd = receivedMsg.saudiIndividual.updateCardAddressReqd;
	strncpy(custLogRec.altBranchCode, receivedMsg.saudiIndividual.altBranchCode,4);
	custLogRec.internetBankAcc = receivedMsg.saudiIndividual.internetBankAcc;
	custLogRec.custAdviceFlag = receivedMsg.saudiIndividual.custAdviceFlag;

	if ( receivedMsg.saudiIndividual.excludeFromAtmFees == ' ' || receivedMsg.saudiIndividual.excludeFromAtmFees == NULL )/*Ver8.2*/
		custLogRec.excludeFromAtmFees = 'N'; /* Ver 8.2 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.2 */
		custLogRec.excludeFromAtmFees = receivedMsg.saudiIndividual.excludeFromAtmFees; /* Ver 8.2 */

	if ( receivedMsg.saudiIndividual.excludeFromMinBalFees == ' ' || receivedMsg.saudiIndividual.excludeFromMinBalFees == NULL )/* Ver 8.2 */
		custLogRec.excludeFromMinBalFees = 'N'; /* Ver 8.2 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.2 */
		custLogRec.excludeFromMinBalFees = receivedMsg.saudiIndividual.excludeFromMinBalFees; /* Ver 8.2 */

	if ( receivedMsg.saudiIndividual.pkgStmtFreqOverride == ' ' || receivedMsg.saudiIndividual.pkgStmtFreqOverride == NULL )/* Ver 8.7 */
		custLogRec.pkgStmtFreqOverride = 'N'; /* Ver 8.7 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.7 */
		custLogRec.pkgStmtFreqOverride = receivedMsg.saudiIndividual.pkgStmtFreqOverride; /* Ver 8.7 */

	custLogRec.overrideForCList = custLogRec.foundInCList;
	custLogRec.overrideForExistingCust = custLogRec.existingCustomer;

	custLogRec.updatedForSama = receivedMsg.saudiIndividual.updatedForSama; 
	strncpy(custLogRec.relationshipManager, receivedMsg.saudiIndividual.relationshipManager, 25); 
	strncpy(custLogRec.generalMemo, receivedMsg.saudiIndividual.generalMemo, 25); 
	if ( receivedMsg.saudiIndividual.marketingMemo[0]  != NULL ) /* to support the previous version also */
		strncpy(custLogRec.marketingMemo, receivedMsg.saudiIndividual.marketingMemo, 25); 

	if ( receivedMsg.saudiIndividual.accFreezingGracePeriod[0] != NULL )
		strncpy(custLogRec.accFreezingGracePeriod, receivedMsg.saudiIndividual.accFreezingGracePeriod, 3);

	strncpy(custLogRec.passportNo, receivedMsg.saudiIndividual.passportNo, 15);
	strncpy(custLogRec.hafizaNo, receivedMsg.saudiIndividual.hafizaNo, 15);
	strncpy(custLogRec.familyRegnNo, receivedMsg.saudiIndividual.familyRegnNo, 15);
	if ( receivedMsg.saudiIndividual.samaAuthNo[0] != NULL )
	{
		if ( receivedMsg.saudiIndividual.screenSetNo == 'A' )
			strncpy(custLogRec.succDeedNo, receivedMsg.saudiIndividual.samaAuthNo, 10);
		else
			strncpy(custLogRec.samaAuthNo, receivedMsg.saudiIndividual.samaAuthNo, 15);
	}
	strncpy(custLogRec.certificateOfBirthNo, receivedMsg.saudiIndividual.certBirthNo, 15);
	strncpy(custLogRec.referenceReqdFor, receivedMsg.saudiIndividual.referenceReqdFor, 10);

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' && receivedMsg.saudiIndividual.creationOrUpdate == 'C' )
	{
		if ( strncmp(receivedMsg.saudiIndividual.referenceReqdFor, "00000000000000", 10)  )
		{
			sprintf(referenceReqdFor, "%.10s", receivedMsg.saudiIndividual.referenceReqdFor);
			memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);
			cRefLogRec.liveChar='@';

			strncpy(cRefLogRec.branchCode, custLogRec.branchCode,4);
			strncpy(cRefLogRec.userId, custLogRec.userId, 10);
			strncpy(cRefLogRec.dateTime, custLogRec.dateTime, 14);

			isindexinfo(cRefLogFile, &cRefLogKey, 1);
			isstart(cRefLogFile, &cRefLogKey, 28, &cRefLogRec.liveChar, ISGTEQ);

			memset(referenceFound,NULL,sizeof referenceFound);
			i = 0;
			while ( isRead(cRefLogFile, &cRefLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(cRefLogRec.branchCode, custLogRec.branchCode, 4) ||
					 strncmp(cRefLogRec.userId, custLogRec.userId, 10) ||
					 strncmp(cRefLogRec.dateTime, custLogRec.dateTime, 14) )
					 break;
			
				referenceFound[i++] = cRefLogRec.referenceType;
			}
			referenceFound[i]='\0';

			/* If Blind or Veiled women or incompetent */
			if ( referenceReqdFor[0] == '1' || referenceReqdFor[1] == '1' || referenceReqdFor[2] == '1' )
			{
				if ( strstr(referenceFound, "0") == NULL )
				{
					sprintf(tmpStr, "Personal reference should be entered;Please enter.");
					formatBranchResponse(REFERENCE_NOT_FOUND, tmpStr, tmpStr);
					isrollback();
					isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
					custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}

			if ( referenceReqdFor[2] == '1' ) /* Incompetent */
			{
				if ( strstr(referenceFound, "1") == NULL )
				{
					sprintf(tmpStr, "Legal Representative should be entered;Please enter.");
					formatBranchResponse(LEGALREP_NOT_FOUND, tmpStr, tmpStr);
					isrollback();
					isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
					custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}

			if ( referenceReqdFor[3] == '1' || referenceReqdFor[5] == '1' ) /* Minor  or  Mentally Disabled */
			{
				if ( strstr(referenceFound, "2") == NULL && strstr(referenceFound, "3") == NULL )
				{
					sprintf(tmpStr, "Foster Parent/Guardian details should be entered;Please enter.");
					formatBranchResponse(PARENT_NOT_FOUND, tmpStr, tmpStr);
					isrollback();
					isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
					custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
		}
	}

	if ( updateIdLogForSaudiIndividual() == FAILURE ) /* Write/Update stidlog for saudi individual */
	{
		isrollback();
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( updateAddrLogForSaudiIndividual() == FAILURE ) /* Write/update staddrlog for saudi individual */
	{
		isrollback();
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(custLogRec.lastUpdateUser, receivedMsg.saudiIndividual.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if( receivedMsg.saudiIndividual.creationOrUpdate == 'U' )
	{
		if ( isRewcurr(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] : ISREWCURR error %d on stcustlog  for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",custLogRec.branchCode);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcustlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] : ISWRITE error %d on stcustlog while creating a new customer/update for key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",custLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcustlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	/* If the customer opening is done through phone , write one more record in stcustlog for history purposes */
	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' &&  receivedMsg.saudiIndividual.custOpenSource == 'P' ) 
	{
		memset(&custLogRec1.liveChar, ' ', sizeof custLogRec1);
		memcpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);
		strncpy(custLogRec1.branchCode, receivedMsg.saudiIndividual.branchCode, 4);
		custLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest] Before writing to custLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualCustRequest]  : ISWRITE error %d on stcustlog while creating a history record for new customer created through phone ; the key is [%.38s] IGNORED \n", getDateTime(), PID, iserrno, custLogRec1.branchCode );
			fflush(logFp);
			/*
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",custLogRec1.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcustlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
			*/
		}
	}

	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' )
	{
		/* Write to stacclog if any account requested */

		if ( strncmp(receivedMsg.saudiIndividual.currentAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.saudiIndividual.currentAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			primaryAcc=8; /* primary account : 008-current a/c */
		}

		if ( strncmp(receivedMsg.saudiIndividual.savingAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.saudiIndividual.savingAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( primaryAcc == 0 )
				primaryAcc=9; /* primary account : 009-saving a/c */
		}

		if ( strncmp(receivedMsg.saudiIndividual.otherAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.saudiIndividual.otherAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( receivedMsg.saudiIndividual.cardType == ' ' ) /* If the request coming from old version */
		receivedMsg.saudiIndividual.cardType = 'I';


	if ( receivedMsg.saudiIndividual.newOrUpdate == 'N' && strncmp(custLogRec.custNo, "          ", 7) ) /* if it is New request and                                                                       the request is not coming from static data client ver 2.3.2 */
	{
		if ( receivedMsg.saudiIndividual.electronIntlRequired == '1' ) 
		{
			if ( formatAddCardRequest(receivedMsg.saudiIndividual.cardType, 'N', 'P', custLogRec.electronIntlName, primaryAcc) == FAILURE ) 
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		if ( receivedMsg.saudiIndividual.electronIntlSuppRequired == '1' ) 
		{
			if ( formatAddCardRequest(receivedMsg.saudiIndividual.cardType, 'N', 'S', custLogRec.electronIntlSuppName, primaryAcc) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s :ISCOMMIT error %d; ignored\n", getDateTime(), iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);isclose(pbCustFile);
	custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);
	unlink(isLogPathName);
	free(isLogPathName);
	closeAllFiles();

	strncpy(responseMsg.customer.custNo, custLogRec.custNo, 7);
	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
    sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processIndividualSaudiDetail()
{
	char tmpStr[200];
	char currentAccInfo[15], savingsAccInfo[15], otherAccInfo[15];
	char *pathName;
	int  tmpCustLogFile;
	struct keydesc  tmpCustLogKey;
	char yearFileToRead[50], currentDateTime[20];
	int  custLogRecFound = NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);

	memset(responseMsg.saudiIndividualPendingDetail.msgLen,' ',sizeof responseMsg.saudiIndividualPendingDetail);

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	custTabRec.liveChar='@';
	strncpy(custTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);

	isindexinfo(custTabFile, &custTabKey, 1);

	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail] ISSTART/ISEQUAL error %d occured on stcusttab for the customer number [%.7s] \n", getDateTime(), PID, iserrno, custTabRec.custNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatBranchResponse(END_OF_FILE, "No more Records to fetch....", "No more Records to fetch....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( readCustTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	/* read crd0data for the said customer */
	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(custTabRec.custNo, tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail] ISREAD/ISEQUAL error %d occured on crd0data for the customer number [%.7s] [%.6s]\n", getDateTime(), PID, iserrno, custTabRec.custNo, crdRec.accNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatBranchResponse(END_OF_FILE, "Not found in customer register....", "Not found in customer register....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on crd0data", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( getRestrictedFlag(crdRec.branchCode) == FAILURE )
	{
		sprintf(tmpStr, "Branch record is missing in ctlFile [%.4s]", ctlRec.branchCode);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		moveTabRecToLog(INDIVIDUAL_SAUDI);
	}

	responseMsg.saudiIndividualPendingDetail.restrictedBranchFlag = ctlRec.updateRestricted; 

	responseMsg.saudiIndividualPendingDetail.updatedForSama = custTabRec.updatedForSama; /* MISYS */
	strncpy(responseMsg.saudiIndividualPendingDetail.relationshipManager, custTabRec.relationshipManager, 25); /* MISYS */
	strncpy(responseMsg.saudiIndividualPendingDetail.generalMemo, custTabRec.generalMemo, 25); /* MISYS */
	strncpy(responseMsg.saudiIndividualPendingDetail.referenceReqdFor, custTabRec.referenceReqdFor, 10);
	strncpy(responseMsg.saudiIndividualPendingDetail.marketingMemo, custTabRec.marketingMemo, 25); 
	responseMsg.saudiIndividualPendingDetail.custOpenSource = custTabRec.custOpenSource;

	strncpy(responseMsg.saudiIndividualPendingDetail.custNo,custTabRec.custNo,7);
	/*strncpy(responseMsg.saudiIndividualPendingDetail.supervisorId, custTabRec.createdUserId,20);*/
	/* If the customer created through quick pension customer opening screen, and the customer 
	   visits a branch for updating the record, then move the home branch as customer branch code 
	*/
	if ( receivedMsg.pendingDetail.updateFlag == '1' && custTabRec.createdFromQuickScreen == '3' &&
		 strncmp(custTabRec.samaMainCategory, "0099", 4) == 0 ) /* Pension customer */
		strncpy(responseMsg.quickCustPendingDetail.custBranchCode, receivedMsg.pendingDetail.homeBranch,4);
	else
		strncpy(responseMsg.saudiIndividualPendingDetail.custBranchCode, crdRec.branchCode,4);
	strncpy(responseMsg.saudiIndividualPendingDetail.samaMainCategory, custTabRec.samaMainCategory,  2);
	strncpy(responseMsg.saudiIndividualPendingDetail.samaSubCategory, custTabRec.samaSubCategory, 2);

	if  ( custTabRec.idType == 'I' )
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.idNo, custTabRec.idNo, 15);
		strncpy(responseMsg.saudiIndividualPendingDetail.idIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.saudiIndividualPendingDetail.idDateType = custTabRec.idDateType;
		strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'P' ) 
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.passportNo, custTabRec.idNo, 15);
		strncpy(responseMsg.saudiIndividualPendingDetail.ppIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.saudiIndividualPendingDetail.ppDateType = custTabRec.idDateType;
		strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'H' ) 
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.hafizaNo, custTabRec.idNo, 15);
		responseMsg.saudiIndividualPendingDetail.hafDateType = custTabRec.idDateType;
		strncpy(responseMsg.saudiIndividualPendingDetail.hafIssuedAt, custTabRec.idIssuedAt, 20);
		strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	/* Added by Arul on 06 Dec 03 to handle Family registration NO */
	else if ( custTabRec.idType == 'F' ) /* Family Registration number details */
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.familyRegnNo, custTabRec.idNo, 15);
		strncpy(responseMsg.saudiIndividualPendingDetail.frIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.saudiIndividualPendingDetail.frDateType = custTabRec.idDateType;
		strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'S' || custTabRec.idType == 'E' ) /* Sama Authorization number/Succession deed number details */
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthNo, custTabRec.idNo, 15);
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.saudiIndividualPendingDetail.samaAuthDateType = custTabRec.idDateType;
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateG, custTabRec.idExpiryDateG, 8);
	}

	getDateTime();
	sprintf(currentDateTime, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);

	custLogRecFound=NO;
	if ( strncmp(currentDateTime, custTabRec.createdDateTime, 4) )
	{
		sprintf(yearFileToRead, "custlog%.4s", custTabRec.createdDateTime);
		pathName = getpath(yearFileToRead, "static");
		if ( (tmpCustLogFile  = isopen(pathName, ISMANULOCK+ISINPUT)) < 0)
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail] ISOPEN error %d for %s File IGNORED\n",getDateTime(), PID, iserrno, pathName);
				fflush(logFp);
			}
			free(pathName);
		}
		else
		{
			free(pathName);
			isindexinfo(tmpCustLogFile, &tmpCustLogKey, 1); 
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "reading information from the file [%s]......\n", yearFileToRead);
				fprintf(logFp, "branch code  : %.4s\n", custTabRec.branchCode);
				fprintf(logFp, "user Id      : %.10s\n", custTabRec.createdUserId);
				fprintf(logFp, "date Time    : %.14s\n", custTabRec.createdDateTime);
			}
			/* form the key for reading the custLogFile for getting the Card Information */
			memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
			strncpy(custLogRec.branchCode, custTabRec.branchCode, 4);
			strncpy(custLogRec.userId, custTabRec.createdUserId, 20);
			strncpy(custLogRec.dateTime, custTabRec.createdDateTime, 14);

			if ( isRead(tmpCustLogFile, &custLogRec.liveChar, ISEQUAL) < 0 )
			{
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail] : ISREAD/ISEQUAL error %d on %s for key=%.38s IGNORED and trying to read from stcustlog file\n", getDateTime(), PID, iserrno, yearFileToRead, custLogRec.branchCode);
					fflush(logFp);
				}
			}
			else
			{
				custLogRecFound=YES;
				responseMsg.saudiIndividualPendingDetail.cardType = custLogRec.cardType;
				strncpy(&responseMsg.saudiIndividualPendingDetail.electronIntlRequired, &custLogRec.electronIntlRequired, 155);
			}

			isclose(tmpCustLogFile);
		}
	}

	if ( custLogRecFound == NO )
	{
		/* form the key for reading the custLogFile for getting the Card Information */
		memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
		custLogRec.liveChar='@';
		strncpy(custLogRec.branchCode, custTabRec.branchCode,4);
		strncpy(custLogRec.userId, custTabRec.createdUserId, 20);
		strncpy(custLogRec.dateTime, custTabRec.createdDateTime,14);

		isindexinfo(custLogFile, &custLogKey, 1);
		isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar, ISGTEQ);
		if ( extraDebug )
			fprintf(logFp,"isstart[%d] on stcustlog during enquiry \n", iserrno);

		if ( isRead(custLogFile, &custLogRec.liveChar, ISEQUAL) == 0 )
		{
			if ( extraDebug )
			{
				fprintf(logFp, "read customer info from custlog during enquiry success \n");
				fprintf(logFp, "Card Info  : [%.155s]\n", &custLogRec.electronIntlRequired);
			}
			responseMsg.saudiIndividualPendingDetail.cardType = custLogRec.cardType;
			strncpy(&responseMsg.saudiIndividualPendingDetail.electronIntlRequired, &custLogRec.electronIntlRequired, 155);
		}
	}
   
	/* form the key for reading the Acct File  */
	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	acctLogRec.liveChar='@';
	strncpy(acctLogRec.branchCode, custTabRec.branchCode,4);
	strncpy(acctLogRec.userId, custTabRec.createdUserId, 20);
	strncpy(acctLogRec.dateTime, custTabRec.createdDateTime,14);
	memset(acctLogRec.accNo, ' ',14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.saudiIndividualPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.saudiIndividualPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.saudiIndividualPendingDetail.otherAccInfo, otherAccInfo, 11);

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	idTabRec.liveChar='@';
	strncpy(idTabRec.custNo, custTabRec.custNo, 7);
	idTabRec.idCategory = 'C';

	isindexinfo(idTabFile, &idTabKey, 6);
	isstart(idTabFile, &idTabKey, 8, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, custTabRec.custNo, 7) || idTabRec.idCategory != 'C' )
			 break;

		if ( idTabRec.idType == 'I' ) /* Saudi Id details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.idNo, idTabRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.idDateType = idTabRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'P' ) /* Passport details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.passportNo, idTabRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.ppDateType = idTabRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'H' ) /* Hafiza No details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.hafizaNo, idTabRec.idNo, 15);
			responseMsg.saudiIndividualPendingDetail.hafDateType = idTabRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssuedAt, idTabRec.idIssuedAt, 20);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'F' ) /* Family Registration number details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.familyRegnNo, idTabRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.frDateType = idTabRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'S' || idTabRec.idType == 'E' ) /* Sama Authorization number/succession deed number */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthNo, idTabRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.samaAuthDateType = idTabRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
	}
	/* fields taken from crd0data */
	responseMsg.saudiIndividualPendingDetail.preferredLang = crdRec.language;
	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		/* Added on 19th Mar 2006 to avoid blank long name update to CRD during the update from branches who does not have name update privilege */
		if ( crdRec.language == ARABIC )
		{
			if ( strncmp(custTabRec.aFirstName, "                                                              ", 60) == 0 )
				responseMsg.saudiIndividualPendingDetail.preferredLang = ENGLISH;
		}
		else if ( crdRec.language == ENGLISH )
		{
			if ( strncmp(custTabRec.eFirstName, "                                                              ", 60) == 0 )
				responseMsg.saudiIndividualPendingDetail.preferredLang = ARABIC;
		}
	}
	strncpy(responseMsg.saudiIndividualPendingDetail.nationality, crdRec.nationality, 3);	
	strncpy(responseMsg.saudiIndividualPendingDetail.titleCode, crdRec.titleCode, 2);
	responseMsg.saudiIndividualPendingDetail.vipCode = crdRec.vipFlag;
	responseMsg.saudiIndividualPendingDetail.residentStatus =crdRec.nonResident;
	strncpy(responseMsg.saudiIndividualPendingDetail.businessType, crdRec.businessType, 3);	
	responseMsg.saudiIndividualPendingDetail.packageAcc = crdRec.packageAcc;
	strncpy(responseMsg.saudiIndividualPendingDetail.altBranchCode, crdRec.alternativeBranchCode,4);
	/*strncpy(responseMsg.saudiIndividualPendingDetail.custBranchCode, crdRec.branchCode,4);commented by Rajesh on 8th Feb07 since the customer branch code is already moved in the beginning of this function*/
	responseMsg.saudiIndividualPendingDetail.excludeFromAtmFees = crdRec.excludeFromAtmFees; /* Ver 8.2 */
	responseMsg.saudiIndividualPendingDetail.excludeFromMinBalFees = crdRec.excludeFromMinBalFees; /* Ver 8.2 */
	responseMsg.saudiIndividualPendingDetail.pkgStmtFreqOverride = crdRec.pkgStmtFreqOverride; /* Ver 8.7 */

	responseMsg.saudiIndividualPendingDetail.internetBankAcc = custTabRec.internetBankAcc;
	responseMsg.saudiIndividualPendingDetail.custAdviceFlag = custTabRec.custAdviceFlag;

	responseMsg.saudiIndividualPendingDetail.dobDateType = custTabRec.dobDateType;
	strncpy(responseMsg.saudiIndividualPendingDetail.dobDateH, custTabRec.dobDateH, 8);
	strncpy(responseMsg.saudiIndividualPendingDetail.dobDateG, custTabRec.dobDateG, 8);
	responseMsg.saudiIndividualPendingDetail.sexCode = custTabRec.sexCode;
	responseMsg.saudiIndividualPendingDetail.maritalStatus = custTabRec.marritalStatus;
	strncpy(responseMsg.saudiIndividualPendingDetail.noOfDependents, custTabRec.noOfDependents, 2);
	strncpy(responseMsg.saudiIndividualPendingDetail.aFirstName, custTabRec.aFirstName, 180); /* from aFirstname to eShortName */
	strncpy(responseMsg.saudiIndividualPendingDetail.certBirthNo, custTabRec.certificateOfBirthNo, 15);

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
	strncpy(addrTabRec.custNo, custTabRec.custNo, 7);
	strncpy(addrTabRec.addressType, "00", 2); /* local address; since only one address for saudi */
	strncpy(addrTabRec.addressNo, "0000", 4);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

	if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) <  0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiDetail] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] ; moving the address info from stcusttab \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
		fflush(logFp);
		strncpy(responseMsg.saudiIndividualPendingDetail.address1, custTabRec.address1, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.address2, custTabRec.address2, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.poBox, custTabRec.poBox, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.cityName, custTabRec.cityName, 20);
		strncpy(responseMsg.saudiIndividualPendingDetail.zipCode, custTabRec.zipCode, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.country, custTabRec.country, 3);
		responseMsg.saudiIndividualPendingDetail.addrType = custTabRec.addressType;
		if ( custTabRec.addressType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.saudiIndividualPendingDetail.poBox, custTabRec.unitNo, 5);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffAreaCode, custTabRec.telOffAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffNo, custTabRec.telOffNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffExt, custTabRec.telOffExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeAreaCode, custTabRec.telHomeAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeNo, custTabRec.telHomeNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeExt, custTabRec.telHomeExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxAreaCode, custTabRec.faxAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxNo, custTabRec.faxNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxExt, custTabRec.faxExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.mobileNo, custTabRec.mobileNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.pagerNo, custTabRec.pagerNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.eMail, custTabRec.eMail, 30);
	}
	else
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.address1, addrTabRec.address1, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.address2, addrTabRec.address2, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.poBox, addrTabRec.poBox, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.cityName, addrTabRec.cityName, 20);
		strncpy(responseMsg.saudiIndividualPendingDetail.zipCode, addrTabRec.zipCode, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.country, addrTabRec.country, 3);
		responseMsg.saudiIndividualPendingDetail.addrType = addrTabRec.addrType;
		if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.saudiIndividualPendingDetail.poBox, addrTabRec.unitNo, 5);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffNo, addrTabRec.telOffNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffExt, addrTabRec.telOffExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeNo, addrTabRec.telHomeNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeExt, addrTabRec.telHomeExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxNo, addrTabRec.faxNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxExt, addrTabRec.faxExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.mobileNo, addrTabRec.mobileNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.pagerNo, addrTabRec.pagerNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.eMail, addrTabRec.eMail, 30);
	}

	strncpy(responseMsg.saudiIndividualPendingDetail.educationCode, custTabRec.educationCode, 109);/* from eduCode to employerzipcode*/
	strncpy(responseMsg.saudiIndividualPendingDetail.documents, custTabRec.documentsSupplied, 60);
	strncpy(responseMsg.saudiIndividualPendingDetail.documentOther, custTabRec.documentOther, 50);
	responseMsg.saudiIndividualPendingDetail.singleJointAcc = custTabRec.singleJointAcc;
	strncpy(responseMsg.saudiIndividualPendingDetail.noOfJointCustomer, custTabRec.noOfJointCustomer, 2);
	strncpy(responseMsg.saudiIndividualPendingDetail.jointAccNameOnCheck, custTabRec.jointAccNameOnCheck, 60);
	strncpy(responseMsg.saudiIndividualPendingDetail.jointAccNameOnReports, custTabRec.jointAccNameOnReports, 30);
	responseMsg.saudiIndividualPendingDetail.signatureNature = custTabRec.signatureNature;
	strncpy(responseMsg.saudiIndividualPendingDetail.referenceReqdFor, custTabRec.referenceReqdFor, 10);
	responseMsg.saudiIndividualPendingDetail.foundInTList = '0';
	responseMsg.saudiIndividualPendingDetail.details[0].englishName[0] = NULL;
	strncpy(responseMsg.saudiIndividualPendingDetail.accFreezingGracePeriod, custTabRec.accFreezingGracePeriod, 3);

	getCustomerOpenUpdateInfo(&responseMsg.saudiIndividualPendingDetail.openUpdateInfo);
    formatSaudiIndividualDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.saudiIndividualPendingDetail.msgLen);
	return SUCCESS;
}

processIndividualSaudiPendingDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	int  idLogRecFound=NO;
	int  i, len;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiPendingDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);
	memset(responseMsg.saudiIndividualPendingDetail.msgLen,' ',sizeof responseMsg.saudiIndividualPendingDetail);

	/* Remove NULL char from the record */
	len = sizeof custLogRec;
	for (i = 0 ; i < len; i++)
		if ( custLogRec.branchCode[i] == NULL )
			custLogRec.branchCode[i] = ' ';

	strncpy(responseMsg.saudiIndividualPendingDetail.custNo, custLogRec.custNo,7); 
	strncpy(responseMsg.saudiIndividualPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);
	strncpy(responseMsg.saudiIndividualPendingDetail.samaMainCategory, custLogRec.samaMainCategory,  2);
	strncpy(responseMsg.saudiIndividualPendingDetail.samaSubCategory, custLogRec.samaSubCategory, 2);

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
	strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(idLogRec.userId, custLogRec.userId, 10);
	strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idLogRecFound = NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10 ) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		/* Arul added on 04 Dec 03 to get only the ID of customer */
		if ( idLogRec.idCategory != 'C' )
			continue;


		if ( idLogRec.idType == 'I' ) /* Saudi Id details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.saudiIndividualPendingDetail.idNo, idLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.idDateType = idLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'P' ) /* Passport details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.saudiIndividualPendingDetail.passportNo, idLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.ppDateType = idLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'H' ) /* Hafiza No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.saudiIndividualPendingDetail.hafizaNo, idLogRec.idNo, 15);
			responseMsg.saudiIndividualPendingDetail.hafDateType = idLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssuedAt, idLogRec.idIssuedAt, 20);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'F' ) /* Family Registration number details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.saudiIndividualPendingDetail.familyRegnNo, idLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.frDateType = idLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'S' || idLogRec.idType == 'E' ) /* Sama Authorization number or succession deed number */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthNo, idLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.samaAuthDateType = idLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
	}
	if ( idLogRecFound == NO )
	{
		if ( custLogRec.idType == 'I' ) /* Saudi Id details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.idNo, custLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.idDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'P' ) /* Passport details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.passportNo, custLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.ppDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.ppExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'H' ) /* Hafiza No details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.hafizaNo, custLogRec.idNo, 15);
			responseMsg.saudiIndividualPendingDetail.hafDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssuedAt, custLogRec.idIssuedAt, 20);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.hafExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'F' ) /* Family Registration number details */
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.familyRegnNo, custLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.frDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.frExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'S' || custLogRec.idType == 'E'  )/*Sama Authorization number/succession deed number details*/
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthNo, custLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.samaAuthDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.samaAuthExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else
		{
			strncpy(responseMsg.saudiIndividualPendingDetail.idNo, custLogRec.idNo, 15);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.saudiIndividualPendingDetail.idDateType = custLogRec.idDateType;
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.saudiIndividualPendingDetail.idExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
	}

	strncpy(responseMsg.saudiIndividualPendingDetail.certBirthNo, custLogRec.certificateOfBirthNo, 15);
	responseMsg.saudiIndividualPendingDetail.preferredLang = custLogRec.preferredLang;
	strncpy(responseMsg.saudiIndividualPendingDetail.nationality, custLogRec.nationality, 3);
	strncpy(responseMsg.saudiIndividualPendingDetail.titleCode, custLogRec.titleCode, 2);
	responseMsg.saudiIndividualPendingDetail.dobDateType = custLogRec.dobDateType;
	strncpy(responseMsg.saudiIndividualPendingDetail.dobDateH, custLogRec.dobDateH, 8);
	strncpy(responseMsg.saudiIndividualPendingDetail.dobDateG, custLogRec.dobDateG, 8);
	responseMsg.saudiIndividualPendingDetail.sexCode = custLogRec.sexCode;
	responseMsg.saudiIndividualPendingDetail.vipCode = custLogRec.vipCode;
	responseMsg.saudiIndividualPendingDetail.maritalStatus = custLogRec.maritalStatus;
	strncpy(responseMsg.saudiIndividualPendingDetail.noOfDependents, custLogRec.noOfDependents, 2);
	responseMsg.saudiIndividualPendingDetail.residentStatus = custLogRec.residentStatus;
	strncpy(responseMsg.saudiIndividualPendingDetail.businessType, custLogRec.businessType, 3);
	strncpy(responseMsg.saudiIndividualPendingDetail.aFirstName, custLogRec.aFirstName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.a2ndName, custLogRec.a2ndName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.a3rdName, custLogRec.a3rdName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.aLastName, custLogRec.aLastName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.aShortName, custLogRec.aShortName, 30);
	strncpy(responseMsg.saudiIndividualPendingDetail.eFirstName, custLogRec.eFirstName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.e2ndName, custLogRec.e2ndName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.e3rdName, custLogRec.e3rdName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.eLastName, custLogRec.eLastName, 15);
	strncpy(responseMsg.saudiIndividualPendingDetail.eShortName, custLogRec.eShortName, 30);

	/*strncpy(responseMsg.saudiIndividualPendingDetail.aFirstName, custLogRec.aFirstName, 180); /* from aFirstname to eShortName **/

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
	strncpy(addrLogRec.custNo, custLogRec.custNo, 7);
	strncpy(addrLogRec.addressType, "00", 2); /* Local address ; since only local address is available for saudi */
	strncpy(addrLogRec.addressNo, "0000", 4);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 0, &addrLogRec.liveChar, ISGTEQ);

	if ( isRead(addrLogFile, &addrLogRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualSaudiPendingDetail] ISREAD/ISEQUAL error %d on staddrlog for key [%.28s]; customer # [%.7s] , address type [%.2s], address number [%.4s] ; taking the address info from stcustlog\n", getDateTime(), PID, iserrno, addrLogRec.branchCode, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo);
		strncpy(responseMsg.saudiIndividualPendingDetail.address1, custLogRec.address1, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.address2, custLogRec.address2, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.poBox, custLogRec.poBox, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.cityName, custLogRec.cityName, 20);
		strncpy(responseMsg.saudiIndividualPendingDetail.zipCode, custLogRec.zipCode, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.country, custLogRec.country, 3);
		responseMsg.saudiIndividualPendingDetail.addrType = custLogRec.addressType;
		if ( custLogRec.addressType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.saudiIndividualPendingDetail.poBox, custLogRec.unitNo, 5);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffAreaCode, custLogRec.telOffAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffNo, custLogRec.telOffNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffExt, custLogRec.telOffExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeAreaCode, custLogRec.telHomeAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeNo, custLogRec.telHomeNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeExt, custLogRec.telHomeExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxAreaCode, custLogRec.faxAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxNo, custLogRec.faxNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxExt, custLogRec.faxExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.mobileNo, custLogRec.mobileNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.pagerNo, custLogRec.pagerNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.eMail, custLogRec.eMail, 30);
	}
	else
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.address1, addrLogRec.address1, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.address2, addrLogRec.address2, 30);
		strncpy(responseMsg.saudiIndividualPendingDetail.poBox, addrLogRec.poBox, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.cityName, addrLogRec.cityName, 20);
		strncpy(responseMsg.saudiIndividualPendingDetail.zipCode, addrLogRec.zipCode, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.country, addrLogRec.country, 3);
		responseMsg.saudiIndividualPendingDetail.addrType = addrLogRec.addrType;
		if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.saudiIndividualPendingDetail.poBox, addrLogRec.unitNo, 5);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffNo, addrLogRec.telOffNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telOffExt, addrLogRec.telOffExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeNo, addrLogRec.telHomeNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.telHomeExt, addrLogRec.telHomeExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxNo, addrLogRec.faxNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.faxExt, addrLogRec.faxExt, 4);
		strncpy(responseMsg.saudiIndividualPendingDetail.mobileNo, addrLogRec.mobileNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.pagerNo, addrLogRec.pagerNo, 10);
		strncpy(responseMsg.saudiIndividualPendingDetail.eMail, addrLogRec.eMail, 30);
	}

	strncpy(responseMsg.saudiIndividualPendingDetail.educationCode, custLogRec.educationCode, 109);/* from eduCode to employerzipcode*/
	strncpy(responseMsg.saudiIndividualPendingDetail.documents, custLogRec.documentsSupplied, 60);
	strncpy(responseMsg.saudiIndividualPendingDetail.documentOther, custLogRec.documentOther, 50);
	responseMsg.saudiIndividualPendingDetail.singleJointAcc = custLogRec.singleJointAcc;
	responseMsg.saudiIndividualPendingDetail.packageAcc = custLogRec.packageAcc;
	strncpy(responseMsg.saudiIndividualPendingDetail.noOfJointCustomer, custLogRec.noOfJointCustomer, 2);
	strncpy(responseMsg.saudiIndividualPendingDetail.jointAccNameOnCheck, custLogRec.jointAccNameOnCheck, 60);
	strncpy(responseMsg.saudiIndividualPendingDetail.jointAccNameOnReports, custLogRec.jointAccNameOnReports, 30);
	responseMsg.saudiIndividualPendingDetail.signatureNature = custLogRec.signatureNature;
	responseMsg.saudiIndividualPendingDetail.electronIntlRequired = custLogRec.electronIntlRequired;
	strncpy(responseMsg.saudiIndividualPendingDetail.electronIntlName, custLogRec.electronIntlName, 26);
	responseMsg.saudiIndividualPendingDetail.electronIntlSuppRequired = custLogRec.electronIntlSuppRequired;
	strncpy(responseMsg.saudiIndividualPendingDetail.electronIntlSuppName, custLogRec.electronIntlSuppName, 26);
	strncpy(&responseMsg.saudiIndividualPendingDetail.deliveryToBranchOrPO, &custLogRec.deliveryToBranchOrPO, 101); 
																				/* from delivery toBranOrPo to deliveryZipCode */

	responseMsg.saudiIndividualPendingDetail.newOrUpdate = custLogRec.newOrUpdate;
	responseMsg.saudiIndividualPendingDetail.internetBankAcc = custLogRec.internetBankAcc;
	responseMsg.saudiIndividualPendingDetail.custAdviceFlag = custLogRec.custAdviceFlag;
	responseMsg.saudiIndividualPendingDetail.excludeFromAtmFees = custLogRec.excludeFromAtmFees; /* Ver 8.2 */
	responseMsg.saudiIndividualPendingDetail.excludeFromMinBalFees = custLogRec.excludeFromMinBalFees; /* Ver 8.2 */
	responseMsg.saudiIndividualPendingDetail.pkgStmtFreqOverride = custLogRec.pkgStmtFreqOverride; /* Ver 8.7 */
	strncpy(responseMsg.saudiIndividualPendingDetail.altBranchCode, custLogRec.altBranchCode, 4);
	responseMsg.saudiIndividualPendingDetail.updatedForSama = custLogRec.updatedForSama; 
	strncpy(responseMsg.saudiIndividualPendingDetail.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(responseMsg.saudiIndividualPendingDetail.generalMemo, custLogRec.generalMemo, 25);
	strncpy(responseMsg.saudiIndividualPendingDetail.referenceReqdFor, custLogRec.referenceReqdFor, 10);
	strncpy(responseMsg.saudiIndividualPendingDetail.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3);

	strncpy(responseMsg.saudiIndividualPendingDetail.supervisorComments, custLogRec.supervisorComments, 200);

	responseMsg.saudiIndividualPendingDetail.existingCustomer = '0';

	if ( getSarCustDetails() == FAILURE )
	{
		sendResponse(responseMsg.saudiIndividualPendingDetail.msgLen);
		return FAILURE;
	}
	responseMsg.saudiIndividualPendingDetail.existingCustomer = abcSrchCustDetails.existingCustomer;
	responseMsg.saudiIndividualPendingDetail.displayWarningMsgOnDuplicateId = '1'; /* display warning message */
	if ( abcSrchCustDetails.existingCustomer == '1' )
	{
		if ( custLogRec.newOrUpdate == 'N' )  
		{
			if ( custLogRec.idType == 'I' || custLogRec.idType == 'Q' )
			{
				if ( displayWarningMsgOnDuplicateId == NO )
					responseMsg.saudiIndividualPendingDetail.displayWarningMsgOnDuplicateId = '0'; /* Stop opening customer */
				else
					responseMsg.saudiIndividualPendingDetail.displayWarningMsgOnDuplicateId = '1'; /* display warning message */
			}
		}
	}
	strncpy(responseMsg.saudiIndividualPendingDetail.existCustNo, abcSrchCustDetails.existCustNo, 7);
	strncpy(responseMsg.saudiIndividualPendingDetail.existCustName, abcSrchCustDetails.existCustName, 30);

	responseMsg.saudiIndividualPendingDetail.foundInAList = '0';
	responseMsg.saudiIndividualPendingDetail.foundInBList = '0';
	responseMsg.saudiIndividualPendingDetail.foundInCList = '0';
	responseMsg.saudiIndividualPendingDetail.foundInTList = '0';
	responseMsg.saudiIndividualPendingDetail.details[0].englishName[0] = NULL;

	if ( getSarABCdetails() == FAILURE )
	{
		sendResponse(responseMsg.saudiIndividualPendingDetail.msgLen);
		return FAILURE;
	}
	/* custBranchCode is copied again to response message to avoid NULL problem when SRCHENGINE tuxedo service is not running; we ignore the failure */
	strncpy(responseMsg.saudiIndividualPendingDetail.custBranchCode, custLogRec.custBranchCode, 4); 

	responseMsg.saudiIndividualPendingDetail.foundInAList =  abcSrchCustDetails.foundInAList;
	responseMsg.saudiIndividualPendingDetail.foundInBList =  abcSrchCustDetails.foundInBList;
	responseMsg.saudiIndividualPendingDetail.foundInCList =  abcSrchCustDetails.foundInCList;
	strncpy(responseMsg.saudiIndividualPendingDetail.reportedBank, abcSrchCustDetails.reportedBank, 4);
	strncpy(responseMsg.saudiIndividualPendingDetail.nameInABCList, abcSrchCustDetails.nameInABCList, 30);

	responseMsg.saudiIndividualPendingDetail.foundInTList = abcSrchCustDetails.foundInTList;
	strncpy(responseMsg.saudiIndividualPendingDetail.marketingMemo, custLogRec.marketingMemo, 25);
	responseMsg.saudiIndividualPendingDetail.custOpenSource = custLogRec.custOpenSource;
	responseMsg.saudiIndividualPendingDetail.bmUpdateStatus = custLogRec.bmUpdateStatus;

	strncpy(responseMsg.saudiIndividualPendingDetail.noOfRecs, abcSrchCustDetails.noOfRecs, 2);
	responseMsg.saudiIndividualPendingDetail.cardType = custLogRec.cardType;
	strncpy(responseMsg.saudiIndividualPendingDetail.details, abcSrchCustDetails.details, sizeof abcSrchCustDetails.details);
	sprintf(tmpStr, "%.2s", responseMsg.saudiIndividualPendingDetail.noOfRecs);
	responseMsg.saudiIndividualPendingDetail.details[atoi(tmpStr)].englishName[0] = NULL;


	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	/* form the key for reading the Acct File  */
	strncpy(acctLogRec.branchCode, receivedMsg.pendingDetail.branchCode,4);
	strncpy(acctLogRec.userId, receivedMsg.pendingDetail.userId, 10);
	strncpy(acctLogRec.dateTime, receivedMsg.pendingDetail.dateTime,14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.saudiIndividualPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.saudiIndividualPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.saudiIndividualPendingDetail.otherAccInfo, otherAccInfo, 11);

    formatSaudiIndividualDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.saudiIndividualPendingDetail.msgLen);
	return SUCCESS;
}

char getPrevStatus(char *accNo)
{
	char tmpStr[100], tmpBmCustNo[15], tmpAccNo[20];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[getPrevStatus]\n", getDateTime(), PID);
		fflush(logFp);
	}


	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	isindexinfo(acctLogFile, &acctLogKey, 5);
	strncpy(acctLogRec.accNo, bmAccToActual(accNo, tmpAccNo), 14);
	strncpy(acctLogRec.lastUpdateDateTime, "999999999999999999", 14);
	isstart(acctLogFile, &acctLogKey, 0, &acctLogRec.liveChar, ISGTEQ);

	if ( isRead(acctLogFile, &acctLogRec.liveChar, ISPREV) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getPrevStatus] ISREAD/ISPREV error %d occured on stacclog for the account [%.14s] while getting previous account status \n", getDateTime(), PID, iserrno, acctLogRec.accNo);
		fflush(logFp);
		return 'E';
	}

	if ( strncmp(acctLogRec.accNo, tmpAccNo, 14) )
	{
		fprintf(logFp, "%s|%5d|[getPrevStatus] Account number differs after reading stacclog for last account status ; acctLogRec.accNo[%.14s] ; gldAccNo [%.14s] ; so skipping ... \n", getDateTime(), PID, acctLogRec.accNo, tmpAccNo);
		fflush(logFp);
		return 'E';
	}

	return (acctLogRec.fromStatus[1]);
}

unfreezeAccounts(char *custNo, int action) 
{
	char tmpStr[100], tmpBmCustNo[15], tmpAccNo[20];
	char prevStatus, oldAccStatus[5];
	int  blockedBySarProgram=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[unfreezeAccounts] for custNo[%.7s]\n", getDateTime(), PID, custNo);
		fflush(logFp);
	}

	if ( gldFileOpen == YES )
	{
		isclose(gldFile);
		gldFileOpen = NO;
	}

	if ( extraDebug )
	{
		fprintf(logFp, "Inside unFreeze Accounts; Customer number received [%s]\n", custNo);
		fflush(logFp);
	}


	if ( openGldFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		return FAILURE;
	}

	memset(&gldRec.liveChar, ' ', sizeof gldRec);

	isindexinfo(gldFile, &gldKey, 3);
	strncpy(&gldRec.accNo[5], (char *)actualToBmCust(custNo, tmpBmCustNo), 6);
	isstart(gldFile, &gldKey, 6, &gldRec.liveChar, ISGTEQ);

	while ( isRead(gldFile, &gldRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(&gldRec.accNo[5], tmpBmCustNo, 6) )
			break;

		if ( gldRec.passwd != '4' && gldRec.passwd != '5' ) 
			continue;

		sprintf(oldAccStatus, "0%c", gldRec.passwd);

		if ( gldRec.passwdBeforeFreeze == ' ' ) /* Consider the SPACE passwd as OPEN as it is affecting unfreezing */
			gldRec.passwdBeforeFreeze = '0';

		if ( ! ( gldRec.passwdBeforeFreeze >= '0' && gldRec.passwdBeforeFreeze <= '9') ) 
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts] Invalid character [%c] found in passwdBeforeFreeze flag for the Account number [%.13s] ; so, skipped\n", getDateTime(), PID, gldRec.passwdBeforeFreeze, gldRec.accNo);
			fflush(logFp);
			continue;
		}
		/* Check whether the account is updated by SAR programs from stacclog file */
		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
		isindexinfo(acctLogFile,&acctLogKey, 5);
		strncpy(acctLogRec.accNo, bmAccToActual(gldRec.accNo, tmpAccNo), 14);
		strncpy(acctLogRec.lastUpdateDateTime, "9999999999999999999", 14);
		isstart(acctLogFile, &acctLogKey, 0, &acctLogRec.liveChar, ISGTEQ);

		blockedBySarProgram = NO;
		while ( isRead(acctLogFile, &acctLogRec.liveChar, ISPREV) == 0 )
		{
			if ( strncmp(acctLogRec.accNo, tmpAccNo, 14) )
				break;

			if ( gldRec.passwd != acctLogRec.accStatus[1] )
				continue;

			if ( acctLogRec.statusChanged != '1' )
				continue;

			if ( acctLogRec.samaBlockAccStatusChanged ==  '1' ) /* Ignore the status changed by Branch Admin */
				continue;

			if ( gldRec.passwd == '4' )
			{
				if ( action == CUSTUPDACTION )
				{
					if ( acctLogRec.fromStatus[1] != gldRec.passwdBeforeFreeze )
						break; /* earlier, it was continue */
				}
			}

			if ( action == CUSTUPDACTION )
			{
				if ( strncmp(acctLogRec.userId, "SAMA2_UPDT   ", 10) == 0 )
					blockedBySarProgram = YES;
			}
			else
			{
				if ( strncmp(acctLogRec.userId, "SAMA_BLOCK   ", 10) == 0 || strncmp(acctLogRec.userId, "SAMA_BLK_T  ", 10) == 0 )
					blockedBySarProgram = YES;
			}
			break;
		}

		if ( blockedBySarProgram == NO )
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts]: Account number [%.14s] is found to be not blocked by any of the SAR programs ; IGNORED \n", getDateTime(), PID, tmpAccNo);
			fflush(logFp);
			continue;
		}

		gldRec.passwd = gldRec.passwdBeforeFreeze;

		gldRec.passwdBeforeFreeze =  ' ';
		strncpy(gldRec.lastAmendmentDate, actualToBmDate(bankingDate, tmpStr), 6);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts] Before updating gldFie (%d) \n", getDateTime(), PID, gldFile);
			fflush(logFp);
		}
		if ( isRewcurr(gldFile, &gldRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts] ISREWCURR error %d occured on gld0data for the account number [%.14s]\n", getDateTime(), PID, iserrno, bmAccToActual(gldRec.accNo, tmpStr));
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured during unfreezing account", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}

		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);

		acctLogRec.liveChar = '@';
		strncpy(acctLogRec.branchCode, receivedMsg.supDecision.branchCode, 4);
		strncpy(acctLogRec.userId, receivedMsg.supDecision.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.dateTime, tmpStr, 14);
		strncpy(acctLogRec.accNo, bmAccToActual(gldRec.accNo, tmpStr), 14);
		acctLogRec.newOrUpdate = 'U';
		if ( action == CUSTUPDACTION )
		{
			strncpy(acctLogRec.supervisorId, "SAMA2UNBLK", 10);
			strncpy(acctLogRec.accStatusChangeReason, "A/c unfreezed after Cust update      ", 30);
		}
		else
		{
			strncpy(acctLogRec.supervisorId, "SAMA_UNBLK", 10);
			strncpy(acctLogRec.accStatusChangeReason, "A/c unfreezed after ID update      ", 30);
		}
		sprintf(tmpStr, "0%c", gldRec.passwd);
		strncpy(acctLogRec.accStatus, tmpStr, 2);

		sprintf(tmpStr, "0%c", gldRec.samaAccStatus);
		strncpy(acctLogRec.samaAccStatus, tmpStr, 2);
		if ( gldRec.statementFrequency[0] == 'D' || gldRec.statementFrequency[0] == 'A' ) /* Daily */
			strncpy(acctLogRec.statementFreq, "02",2);
		else if ( gldRec.statementFrequency[0] == 'W' || gldRec.statementFrequency[0] == 'B' ) /* Weekly */
			strncpy(acctLogRec.statementFreq, "03",2);
		else if ( gldRec.statementFrequency[0] == 'M' || gldRec.statementFrequency[0] == 'C' ) /* Monthly */
			strncpy(acctLogRec.statementFreq, "04",2);
		else if ( gldRec.statementFrequency[0] == 'Q' || gldRec.statementFrequency[0] == 'E' ) /* Quarterly */
			strncpy(acctLogRec.statementFreq, "05",2);
		else if ( gldRec.statementFrequency[0] == 'H' || gldRec.statementFrequency[0] == 'F' ) /* Half yearly */
			strncpy(acctLogRec.statementFreq, "06",2);
		else if ( gldRec.statementFrequency[0] == 'Y' || gldRec.statementFrequency[0] == 'G' ) /* Yearly */
			strncpy(acctLogRec.statementFreq, "07",2);
		else if ( gldRec.statementFrequency[0] == 'N' || gldRec.statementFrequency[0] == 'I' ) /* Non-Auto */
			strncpy(acctLogRec.statementFreq, "01",2);

		if ( gldRec.statementFrequency[0] == 'M' || gldRec.statementFrequency[0] == 'C' )
		{
			if ( strncmp(&gldRec.statementFrequency[1], "01", 2) ==  0 )
				acctLogRec.statementDay = '0'; /* Branch Statement Day */
			else
				acctLogRec.statementDay = '1'; /* Month End */
		}
		else
			acctLogRec.statementDay = '0';

		acctLogRec.bmUpdateStatus = '9'; /* completed */ 
		strncpy(acctLogRec.custBranchCode, gldRec.branchCode, 4);
		strncpy(acctLogRec.acctDesc, gldRec.accDesc, 30);
		strncpy(acctLogRec.creditLimit, gldRec.accLimit, 12);
		strncpy(acctLogRec.intLastRun, gldRec.intLastRun, 14);
		strncpy(acctLogRec.intApplDay, gldRec.intApplicationDay, 2);
		strncpy(acctLogRec.intFreqCode, gldRec.intApplicationFreq, 3);
		acctLogRec.inactiveAccFlag = gldRec.inactiveAccFlag;
		acctLogRec.intApplication = gldRec.intApplication;
		strncpy(acctLogRec.crIntRate, gldRec.crIntRate, 9);
		strncpy(acctLogRec.drIntRate, gldRec.drIntRate, 9);
		strncpy(acctLogRec.payAccNo, bmAccToActual(gldRec.payAccNo,tmpStr), 14);
		strncpy(acctLogRec.uniqueNo, gldRec.uniqueNo, 5);
		strncpy(acctLogRec.uniqueSub, gldRec.uniqueSubNo1, 2);

		acctLogRec.statusChanged = '1'; /* YES */
		strncpy(acctLogRec.fromStatus, oldAccStatus, 2);
		strncpy(acctLogRec.toStatus , acctLogRec.accStatus, 2);
		strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
		strncpy(acctLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts] Before writing to acctLogFile (%d) ..\n", getDateTime(), PID, acctLogFile);
			fflush(logFp);
		}
		if ( isWrite(acctLogFile, &acctLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[unfreezeAccounts] ISWRITE error %d occured on stacclog for the acc # [%.14s] [%.13s] \n", getDateTime(), PID, iserrno, acctLogRec.accNo, gldRec.accNo);
			fflush(logFp);
		}
	}
	return SUCCESS;
}


processSaudiIndividualSuperDecision(reqAction)
char reqAction; /* A - Accept; F - Forward to Teller R - Reject */
{ 
	char tmpStr[200], tmpCurrentNo[10], tmpJointNo[5], tmpAddressNo[10], *isLogPathName;
	char ibanAccNo[30];
	char tNoOfJointCust[10], currentDate[15], tmpCustNo[15];
	int noOfJoint, isappLogFp, returnError, retErr;
	long currentNo, oldSigMask;
	char tmpPackageAcc;
	char tmpAuthLevel[150];
	char *tmpPtr;
	int i;
	int idTabRecFound = NO, custFoundInIdTab=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]\n", getDateTime(), PID);
		fflush(logFp);
	}

	readBankingDate();
	memset(tCustNo, ' ', sizeof tCustNo); 

	memset(responseMsg.superDecision.msgLen, ' ', sizeof responseMsg.superDecision);
	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);

	/* If ForwaredToTeller or Rejected the changes; just update the log file */

	if( reqAction != SUP_ACCEPTED ) 
	{
		if ( openCustLogFile(ISMANULOCK + ISINOUT)  < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openPbCustFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/*Update stcustlog file to include supervisorId and his comments*/

		strncpy(custLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.supDecision.userId,10);
		strncpy(custLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile,&custLogKey,0,&custLogRec.liveChar,ISEQUAL) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				 formatSuperDecisionResponse(END_OF_FILE,"No customer Record(s) found for this key ....", "No customer Record(s) found for this key ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog file", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( readCustLogFile(ISEQUAL+ISLOCK) < 0 )
		{
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		/* The following 7 lines were added to prevent two supervisor approving the same pending record  */

		if ( custLogRec.bmUpdateStatus == '9' || custLogRec.bmUpdateStatus == '3' )  /* approved or rejected */
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] This customer record has already been approved by %.20s [%c] and the customer number assigned is [%.7s] while rejection/forwarding\n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
			fflush(logFp);
			sprintf(tmpStr," This Record has already approved by %.20s", custLogRec.supervisorId);
			formatSuperDecisionResponse(INCORRECTMSG,tmpStr,tmpStr); 
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( reqAction == SUP_FORWARD )
			custLogRec.bmUpdateStatus = '2';  /* 2 is for Pending with Teller */
		else
		{
			custLogRec.bmUpdateStatus = '3';  /* 3 is for Rejecting the entry */
			if ( custLogRec.newOrUpdate == 'N' && custLogRec.electronIntlRequired == '1' && strncmp(custLogRec.custNo, "          ", 7) )
			{
				if ( openCardLogFile(ISMANULOCK + ISINOUT)  < 0 )
				{
					fprintf(errLogFp, "%s : processSuperDecision(): ISOPEN error %d on stcardlog, IGNORED \n", getDateTime(), iserrno);
					fflush(errLogFp);
				}

				if ( openCardTabFile(ISMANULOCK + ISINOUT) < 0 )
				{
					fprintf(errLogFp, "%s : processSuperDecision(): ISOPEN error %d on stcardtab, IGNORED \n", getDateTime(), iserrno);
					fflush(errLogFp);
				}

				isindexinfo(cardTabFile, &cardTabKey, 1);
				memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);
				isstart(cardTabFile, &cardTabKey, 0, &cardTabRec.liveChar, ISGTEQ);

				memset(&cardLogRec.liveChar, ' ', sizeof cardLogRec);

				strncpy(cardLogRec.branchCode, custLogRec.branchCode,4);
				strncpy(cardLogRec.userId, custLogRec.userId, 10);
				strncpy(cardLogRec.dateTime, custLogRec.dateTime,14);
				isindexinfo(cardLogFile, &cardLogKey, 1);
				if ( isstart(cardLogFile,&cardLogKey,28,&cardLogRec.liveChar,ISGTEQ) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]: ISSTART error %d on stcardlog for the key [%.28s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode);
					fflush(logFp);
					if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
					{
						fprintf(errLogFp, "%s: processSuperDecision() : No Record found in stcardlog for the key [%.28s]\n", getDateTime(), cardLogRec.branchCode);
					}
					else
					{
						fprintf(errLogFp, "%s: processSuperDecision() : CISAM error %d occured on stcardlog for the key [%.28s]\n", getDateTime(), iserrno, cardLogRec.branchCode);
						fflush(errLogFp);
					}
				}

				while ( isRead(cardLogFile, &cardLogRec.liveChar, ISNEXT) == 0 )
				{
					if ( strncmp(cardLogRec.branchCode, custLogRec.branchCode, 4) ||
						 strncmp(cardLogRec.userId, custLogRec.userId, 10)  ||
						 strncmp(cardLogRec.dateTime, custLogRec.dateTime,14) )
						 break;

					memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);

					strncpy(cardTabRec.cardNo, cardLogRec.cardNo, 19);
					if ( readCardTabFile(ISEQUAL) < 0 )
					{
						fprintf(errLogFp, "%s : processSuperDecision() : ISREAD/ISEQUAL error %d on stcardtab for the card # [%.19s]\n", getDateTime(), iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}

					if ( extraDebug )
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before delete cardTabFile\n", getDateTime(), PID);
					if ( isDelcurr(cardTabFile, &cardTabRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s : processSuperDecision : ISDELCURR error %d on stcardtab for the card # [%.19s]\n", getDateTime(), iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}
					if ( extraDebug )
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just after delete cardTabFile\n", getDateTime(), PID);

					if ( extraDebug )
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before delete cardLogFile\n", getDateTime(), PID);
					if ( isDelcurr(cardLogFile, &cardLogRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s : processSuperDecision : ISDELCURR error %d on stcardlog for the key [%.28s] and the card # [%.19s]\n", getDateTime(), iserrno, cardLogRec.branchCode, cardLogRec.cardNo);
						fflush(errLogFp);
					}
					if ( extraDebug )
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before delete cardLogFile\n", getDateTime(), PID);
				}
			}
		}

		if ( receivedMsg.supDecision.activityFlag == 'P' )
		{
			custLogRec.bmUpdateStatus = '5'; /* Rejected by CSO of the branch */
			strncpy(custLogRec.userId, receivedMsg.supDecision.branchCsoId, 10); /* Key change */
			strncpy(custLogRec.dateTime, receivedMsg.supDecision.branchActionDateTime, 14); /* Key change */
		}

		strncpy(custLogRec.supervisorId, receivedMsg.supDecision.supervisorId, 10);
		strncpy(custLogRec.supervisorComments, receivedMsg.supDecision.supervisorComments,200);
		strncpy(custLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( updateCustLogFile() < 0)
		{
			isrelease(custLogFile);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		isrelease(custLogFile);

		if ( custLogRec.newOrUpdate == 'N' && custLogRec.custOpenSource == 'P' )
		{
			/* Update the  record in customers created through Phone banking file (stcustpb) */
			memset(&pbCustRec.liveChar, ' ', sizeof pbCustRec);
			pbCustRec.liveChar = '@';
			strncpy(pbCustRec.custNo, custLogRec.custNo, 7);
			isindexinfo(pbCustFile, &pbCustKey, 1);
			isstart(pbCustFile, &pbCustKey, 0, &pbCustRec.liveChar, ISGTEQ);

			if ( isRead(pbCustFile, &pbCustRec.liveChar, ISEQUAL+ISLOCK) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
				fflush(logFp);

				if ( iserrno != 111  && iserrno != 110 )
				{
					sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrelease(pbCustFile);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else
				{
					sprintf(tmpStr, "Record not found in stcustpb file");
					formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
					isrelease(pbCustFile);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			pbCustRec.pendingStatus =  custLogRec.bmUpdateStatus;
			strncpy(pbCustRec.branchSupervisorId, receivedMsg.supDecision.supervisorId, 10);
			strncpy(pbCustRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(pbCustRec.approvedDateTime, tmpStr, 14);
			strncpy(pbCustRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(pbCustFile, &pbCustRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stcustpb for customer number [%.7s] \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating info in stcustpb", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrelease(pbCustFile);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isrelease(pbCustFile);
		}

		/* Read corresponding ID log record */
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.supDecision.userId,10);
		strncpy(idLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

		while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(idLogRec.branchCode, receivedMsg.supDecision.branchCode, 4) ||
				 strncmp(idLogRec.userId, receivedMsg.supDecision.userId, 10) ||
				 strncmp(idLogRec.dateTime, receivedMsg.supDecision.dateTime, 14) )
				 break;

			idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus ; 

			if ( receivedMsg.supDecision.activityFlag == 'P' )
			{
				strncpy(idLogRec.userId, receivedMsg.supDecision.branchCsoId, 10); /* Key change */
				strncpy(idLogRec.dateTime, receivedMsg.supDecision.branchActionDateTime,14); /* Key change */
			}

			strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s] while updating the record to be processed\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( receivedMsg.supDecision.activityFlag == 'P' )
			{
				memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
				strncpy(idLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
				strncpy(idLogRec.userId, receivedMsg.supDecision.userId,10);
				strncpy(idLogRec.dateTime, receivedMsg.supDecision.dateTime,14);
				isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);
			}
		}

		/* Read corresponding Address log record */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
		strncpy(addrLogRec.userId, receivedMsg.supDecision.userId,10);
		strncpy(addrLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(addrLogRec.branchCode, receivedMsg.supDecision.branchCode, 4) ||
				 strncmp(addrLogRec.userId, receivedMsg.supDecision.userId, 10) ||
				 strncmp(addrLogRec.dateTime, receivedMsg.supDecision.dateTime, 14) )
				 break;

			addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

			if ( receivedMsg.supDecision.activityFlag == 'P' )
			{
				strncpy(addrLogRec.userId, receivedMsg.supDecision.branchCsoId, 10); /* Key change */
				strncpy(addrLogRec.dateTime,receivedMsg.supDecision.branchActionDateTime,14); /* Key change */
			}

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				/* Added by Arul on 03 Dec 03 to avoid error 100 while rewriting- Why does it happen? Need investigation */
				if ( iserrno != 100 && iserrno != 108 ) 
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					fflush(logFp);

					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s] while supervisor rejects; IGNORED but needs investigation\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			}

			if ( receivedMsg.supDecision.activityFlag == 'P' )
			{
				memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
				strncpy(addrLogRec.branchCode, receivedMsg.supDecision.branchCode, 4);
				strncpy(addrLogRec.userId, receivedMsg.supDecision.userId, 10);
				strncpy(addrLogRec.dateTime, receivedMsg.supDecision.dateTime, 14);
				isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);
			}
		}
		closeAllFiles();

		strcpy(tmpStr,"Successful");
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Supervisor has approved; so progressing to update all files \n", getDateTime(), PID);

	/* Portion introduced for atomic update */
	
	if ( custTabFileOpen == YES )
	{
		isclose(custTabFile); 
		custTabFileOpen=NO;
	}
	if ( custLogFileOpen == YES )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
	}
	if ( acctLogFileOpen == YES )
	{
		isclose(acctLogFile); 
		acctLogFileOpen=NO;
	}
	if ( jointTabFileOpen == YES )
	{
		isclose(jointTabFile); 
		jointTabFileOpen=NO;
	}
	if ( jointLogFileOpen == YES )
	{
		isclose(jointLogFile);
		jointLogFileOpen=NO;
	}
	if ( ctlFileOpen == YES )
	{
		isclose(ctlFile);
		ctlFileOpen=NO;
	}
	if ( cardTabFileOpen == YES )
	{
		isclose(cardTabFile);
		cardTabFileOpen=NO;
	}
	if ( cardLogFileOpen == YES )
	{
		isclose(cardLogFile);
		cardLogFileOpen=NO;
	}
	if ( idLogFileOpen == YES )
	{
		isclose(idLogFile);
		idLogFileOpen=NO;
	}
	if ( idTabFileOpen == YES )
	{
		isclose(idTabFile);
		idTabFileOpen=NO;
	}
	if ( addrLogFileOpen == YES )
	{
		isclose(addrLogFile);
		addrLogFileOpen=NO;
	}
	if ( addrTabFileOpen == YES )
	{
		isclose(addrTabFile);
		addrTabFileOpen=NO;
	}
	if ( cRefLogFileOpen == YES )
	{
		isclose(cRefLogFile);
		cRefLogFileOpen=NO;
	}
	if ( cRefTabFileOpen == YES )
	{
		isclose(cRefTabFile);
		cRefTabFileOpen=NO;
	}
	if ( pbCustFileOpen == YES )
	{
		isclose(pbCustFile);
		pbCustFileOpen=NO;
	}
	if ( heirLogFileOpen == YES )
	{
		isclose(heirLogFile);
		heirLogFileOpen=NO;
	}
	if ( heirTabFileOpen == YES )
	{
		isclose(heirTabFile);
		heirTabFileOpen=NO;
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] All Required files have been closed ; \n", getDateTime(), PID);

	oldSigMask = sigblock(sigmask(SIGINT)  |      /* Interrupt  */
						  sigmask(SIGHUP)  |      /* Hangup     */
						  sigmask(SIGQUIT) |      /* Quit       */
						  sigmask(SIGPIPE) |      /* child process terminated  */
						  sigmask(SIGUSR1) |      /* user defined signal-16*/
						  sigmask(SIGUSR2) |      /* user defined signal-17*/
						  sigmask(SIGTERM) |      /* Quit       */
						  sigmask(SIGALRM) );     /* Alarm      */

	sprintf(tmpStr, "isst%d.log", getpid());
	isLogPathName = getpath(tmpStr, "log");
	if ( (isappLogFp = creat(isLogPathName, 0660)) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while creating CISAM log file ", errno);
		formatSuperDecisionResponse( INTERNALERR, tmpStr, tmpStr );
		sigsetmask(oldSigMask);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	close(isappLogFp);
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] CISAM log file created \n", getDateTime(), PID, isLogPathName);
	if ( islogopen(isLogPathName) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening CISAM log file ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] CISAM log file opened ; \n", getDateTime(), PID);
	if ( isbegin() < 0 )
	{
		printf("ISBEGIN error %d while supervisor approval\n", iserrno);
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]ISBEGIN error %d;  while supervisor approval\n", getDateTime(), PID, iserrno);
		sprintf(tmpStr, "ISBEGIN error %d while supervisor approval", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISBEGIN successful ; Proceeding to open all the required file in TRANS facility\n", getDateTime(), PID);

	if ( openCustLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openAcctLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);
		custLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openJointLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile);
		custLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openCustTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openJointTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openCtlFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) /* for Reading CustomerNo Range info */
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardRequestFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrefLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrefTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openPbCustFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openHeirLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openHeirTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	
	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] All required files have been opened with TRANS facility\n", getDateTime(), PID);

	memset(responseMsg.superDecision.msgLen, ' ', sizeof responseMsg.superDecision);

	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);

    /*Now,Updating the stcustlog file to include supervisorId and his comments*/

	strncpy(custLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
	strncpy(custLogRec.userId, receivedMsg.supDecision.userId,10);
	strncpy(custLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

	if ( readCustLogFile(ISEQUAL+ISLOCK) < 0 )
	{
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	/* The following 7 lines were added to prevent two supervisor approving the same pending record  */

	if ( custLogRec.bmUpdateStatus == '9' || custLogRec.bmUpdateStatus == '3' )
				/* approved or rejected */
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]: This customer record has already been approved by [%.20s] [%c] and the customer number assigned is [%.7s] while approving \n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
		fflush(logFp);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sprintf(tmpStr," This Record has already approved by %.20s", custLogRec.supervisorId);
		formatSuperDecisionResponse(INCORRECTMSG,tmpStr,tmpStr); 
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		strncpy(custTabRec.custNo, custLogRec.custNo, 7);

		if ( readCustTabFile(ISEQUAL+ISLOCK) < 0 )
		{
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( custLogRec.preferredLang == ARABIC )
		{
			if ( custLogRec.singleJointAcc == '0' )
			{
				if (strncmp(custTabRec.aFirstName, custLogRec.aFirstName, 60) != 0 || strncmp(custTabRec.aShortName, custLogRec.aShortName, 30 ) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
				{

					custTabRec.nameChanged = '1';
					custLogRec.nameChanged = '1';
					custTabRec.incorrectName = '0';
				}
				else
				{
					custTabRec.nameChanged = '0';
					custLogRec.nameChanged = '0';
					custTabRec.incorrectName = ' ';
				}
			}
			else /* if it is joint; no check required on first/second... names */
			{
				if ( strncmp(custTabRec.jointAccNameOnCheck, custLogRec.jointAccNameOnCheck, 60) != 0 || strncmp(custTabRec.jointAccNameOnReports, custLogRec.jointAccNameOnReports, 30) != 0 )
				{

					custTabRec.nameChanged = '1';
					custLogRec.nameChanged = '1';
					custTabRec.incorrectName = '0';
				}
				else
				{
					custTabRec.nameChanged = '0';
					custLogRec.nameChanged = '0';
					custTabRec.incorrectName = ' ';
				}
			}
		}
		else /* ENGLISH CUSTOMER */
		{
			if ( custLogRec.singleJointAcc == '0' )
			{
				if ( strncmp(custTabRec.eFirstName, custLogRec.eFirstName, 60) != 0 || strncmp(custTabRec.eShortName, custLogRec.eShortName, 30) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
				{
					custTabRec.nameChanged = '1';
					custLogRec.nameChanged = '1';
					custTabRec.incorrectName = '0';
				}
				else
				{
					custTabRec.nameChanged = '0';
					custLogRec.nameChanged = '0';
					custTabRec.incorrectName = ' ';
				}
			}
			else /* if it is joint; no check required on first/second... names */
			{
				if ( strncmp(custTabRec.jointAccNameOnCheck, custLogRec.jointAccNameOnCheck, 60) != 0 || strncmp(custTabRec.jointAccNameOnReports, custLogRec.jointAccNameOnReports, 30) != 0 )
				{

					custTabRec.nameChanged = '1';
					custLogRec.nameChanged = '1';
					custTabRec.incorrectName = '0';
				}
				else
				{
					custTabRec.nameChanged = '0';
					custLogRec.nameChanged = '0';
					custTabRec.incorrectName = ' ';
				}
			}
		}

		if( strncmp(custTabRec.address1, custLogRec.address1, 30) != 0 ||
			strncmp(custTabRec.address2, custLogRec.address2, 30) != 0 ||
			strncmp(custTabRec.poBox, custLogRec.poBox, 10) != 0 ||
			strncmp(custTabRec.cityName, custLogRec.cityName, 20) != 0 ||
			strncmp(custTabRec.zipCode, custLogRec.zipCode,10) != 0 ||
			custTabRec.preferredLang != custLogRec.preferredLang )
		{
			custLogRec.addressChanged = '1';

			custTabRec.addressChanged = '1';
		}
		else
		{
			custTabRec.addressChanged = '0';
			custLogRec.addressChanged = '0';
		}
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custLogRec.custOpenDate, bankingDate, 8);
		/* Arul - 04 Dec 03 Looks like unnecessary action; tCustNo is not initialized at all : could lead to problems and hence commented
		if ( strncmp(receivedMsg.supDecision.custNo, "          ", 7) == 0 ) /* RAJESH . CHECK whether this if reqd or not * 
			strncpy(custLogRec.custNo, tCustNo, 7);
			*/
	}

	strncpy(custLogRec.lastUpdateBmDate, bankingDate, 8);

	custLogRec.bmUpdateStatus = '9';  /* 9 is for Completed  */

	strncpy(custLogRec.supervisorId, receivedMsg.supDecision.supervisorId,10);

	/*strncpy(custLogRec.supervisorComments, receivedMsg.supDecision.supervisorComments,200); will hold only the last comment; just for information*/

	strncpy(custLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( updateCustLogFile() < 0 )
	{
		isrelease(custLogFile);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	isrelease(custLogFile);

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update stcustlog  successful; proceeding to update CUSTOMER ID INFORMATION\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(idLogRec.userId, custLogRec.userId, 10);
	strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'C' ) /* Only Customer Info */
			continue;

		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Within the while loop of idLogFile; Read branchCode=%.4s; userId=%.10s;dateTime=%.14s, idType=%c; idNo=%.15s; idCategory=%c\n", getDateTime(), PID, idLogRec.branchCode, idLogRec.userId, idLogRec.dateTime, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory);
			fflush(logFp);
		}

		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus ; 

		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);


		/* Now , write/update stidtab for the above */

		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

		idTabRec.liveChar = '@';
		strncpy(idTabRec.custNo, idLogRec.custNo, 7);
		idTabRec.idType = idLogRec.idType;
		idTabRec.idCategory = idLogRec.idCategory;

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			isindexinfo(idTabFile, &idTabKey, 2);

			isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

			if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) == FAILURE )
			{
				if ( iserrno != 111 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] ; ID Category [%c]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo, idTabRec.idCategory);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while reading customer ID in stidtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else
				{
					memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
					idTabRec.liveChar = '@';
					strncpy(idTabRec.custNo, idLogRec.custNo, 7);
					idTabRec.idType = idLogRec.idType;
					idTabRec.idCategory = idLogRec.idCategory;

					idLogRec.newOrUpdate = 'N';
				}
			}
		}
		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Within the while loop of idLogFile; Read the stidtab for customer ID[%c%.16s]\n", getDateTime(), PID, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
		}

		strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
		strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);

		/* Unfreeze Accounts if expiry date is updated */
		/*
		if ( idLogRec.newOrUpdate == 'U' )
		{
			sprintf(tmpStr, "%.8s", idLogRec.idExpiryDateG);
			if ( validate(tmpStr) >= 0 )  /* only valid dates to be considered *
			{
				getDateTime();
				sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
				if ( strncmp(tmpStr, currentDate, 8) > 0 )
				{
					sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
					if ( idTabRec.grace1ActionTaken == '1' || idTabRec.grace2ActionTaken == '1' ) /* if action taken from SAMA 
																									 freezing program *
					{
						if ( unfreezeAccounts(tmpCustNo, IDEXPIRYACTION) == FAILURE )
						{
							isrollback();
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile); isclose(gldFile);isclose(heirLogFile);isclose(heirTabFile);
							custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=gldFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
							sigsetmask(oldSigMask);
							unlink(isLogPathName);
							free(isLogPathName);

							sendResponse(responseMsg.customer.msgLen);
							return FAILURE;
						}
						isclose(gldFile);
						gldFileOpen=NO;
						idLogRec.grace1ActionTaken = '0'; /* NO *
						strncpy(idLogRec.grace1ActionDate, "            ",8);
						idLogRec.grace2ActionTaken = '0'; /* NO *
						strncpy(idLogRec.grace2ActionDate, "            ",8);
					}
				}
			}
		}
		*/

		if ( receivedMsg.supDecision.newOrUpdate == 'U' )
		{
			if ( idLogRec.idType == custLogRec.idType ) /* If the Id type is a primary Id type */
			{
				sprintf(tmpStr, "%.8s", idLogRec.idExpiryDateG);
				if ( validate(tmpStr) >= 0 )  /* only valid dates to be considered */
				{
					getDateTime();
					sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
					if ( strncmp(tmpStr, currentDate, 8) > 0 )
					{
						sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
						if ( unfreezeAccounts(tmpCustNo, IDEXPIRYACTION) == FAILURE )
						{
							isrollback();
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(gldFile);isclose(heirLogFile);isclose(heirTabFile);
							custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=NO;gldFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
							sigsetmask(oldSigMask);
							unlink(isLogPathName);
							free(isLogPathName);

							sendResponse(responseMsg.customer.msgLen);
							return FAILURE;
						}
						isclose(gldFile);
						gldFileOpen=NO;
						idLogRec.grace1ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace1ActionDate, "            ",8);
						idLogRec.grace2ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace2ActionDate, "            ",8);
					}
				}
			}

			if ( custTabRec.custUpdActionTaken == '1' ) /* YES */
			{
				sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
				if ( unfreezeAccounts(tmpCustNo, CUSTUPDACTION) == FAILURE )
				{
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(gldFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=NO;gldFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				isclose(gldFile);
				gldFileOpen=NO;
				custTabRec.custUpdActionTaken = '0'; /* NO */
				custTabRec.custUpdWarningLetterGenerated = '0'; /* NO */
				strncpy(custTabRec.custUpdActionDate, "            ",8);
			}
		}

		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Within the while loop of idLogFile; Activities fo unfreezing account over; about to update stidtab\n", getDateTime(), PID, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
		}

		strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
		/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
		if ( idLogRec.newOrUpdate == 'N' )
		{
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
		}
		idTabRec.newOrUpdate = idLogRec.newOrUpdate;
		idTabRec.grace1ActionTaken = idLogRec.grace1ActionTaken ; 
		strncpy(idTabRec.grace1ActionDate, idLogRec.grace1ActionDate, 8);
		idTabRec.grace2ActionTaken = idLogRec.grace2ActionTaken ; 
		strncpy(idTabRec.grace2ActionDate, idLogRec.grace2ActionDate, 8);

		strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before isrewcurr on stidtab\n", getDateTime(), PID);
				fflush(logFp);
			}
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 ) 
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][CUSTOMER]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just after isrewcurr on stidtab\n", getDateTime(), PID);
				fflush(logFp);
			}
		}
		else
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before iswrite on stidtab (%d)\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				if ( iserrno != 100 && iserrno != 108  ) /* Arul added on 06 Dec 03 - needs investigation - CHECK-CHECK*/
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][CUSTOMER]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][CUSTOMER] IGNORED\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
			}
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just after iswrite on stidtab\n", getDateTime(), PID);
				fflush(logFp);
			}
		}
		if ( extraDebug > 8 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Within the while loop of idLogFile; Updated stidtab; about to update stidlog\n", getDateTime(), PID);
			fflush(logFp);
		}


		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s]  and the key is [%.28s][CUSTOMER]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update of customer ID in stidtab & stidlog completed; about to update Address for customer\n", getDateTime(), PID);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( deleteUnwantedIdTabRecord() == FAILURE )
		{
			sprintf(tmpStr, "Error %d while deleting id info in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Delete unwatend records from stidtab over; about to update Address for customer\n", getDateTime(), PID);

	/* Read corresponding Address log record */
	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "00", 2) && strncmp(addrLogRec.addressType, "01", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer Address No , For joint, it will start with 0001 */
			continue;

		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			/* Added by Arul on 03 Dec 03 to avoid error 100 while rewriting- Why does it happen? Need investigation */
			if ( iserrno != 100 && iserrno != 108 ) /* the current record is not read */
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][CUSTOMER] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
		}

		if ( extraDebug )
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update on staddrlog complete for address type %.2s & address No=%.4s; About to update staddrtab\n", getDateTime(), PID, addrLogRec.addressType, addrLogRec.addressNo);


		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

		addrTabRec.liveChar = '@';
		strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
		strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
		strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

		/* Arul added the following statement to simplify the address info update */
		if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL+ISLOCK) == 0 )
		{
			strncpy(addrTabRec.address1, addrLogRec.address1, 207);
			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			addrTabRec.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
			{
				strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
				strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
				strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
			}
			strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Just before isRewrite\n", getDateTime(), PID);
			if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][CUSTOMER]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrelease(addrTabFile);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isrelease(addrTabFile);
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update on staddrtab complete for address type %.2s & address No=%.4s; About to check for next address\n", getDateTime(), PID, addrLogRec.addressType, addrLogRec.addressNo);
		}
		else if ( iserrno == 111 )
		{
			memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

			addrTabRec.liveChar = '@';
			strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
			strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
			strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
			addrLogRec.newOrUpdate = 'N';
			strncpy(addrTabRec.address1, addrLogRec.address1, 207);
			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			addrTabRec.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
			{
				strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
				strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
				strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
			}

			strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

			/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
			if ( addrLogRec.newOrUpdate == 'N' )
			{
				strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
				strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
			}
			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
				fflush(logFp);
			}
			if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][CUSTOMER]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update (added as the record does not exists) on staddrtab complete for address type %.2s & address No=%.4s; About to check for next address\n", getDateTime(), PID, addrLogRec.addressType, addrLogRec.addressNo);
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][CUSTOMER]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
			sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		isrelease(idTabFile);
	} /* while read(addrLogFile)  */

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Customer address update completed\n", getDateTime(), PID);

	/* insert one more record in stcustlog from stcusttab for keeping track 
	   of the updates (0th Update)

	   Commented by Rajesh on 19th June 06; as 0th Update is done during CSO update itself ; since custTabRec.lastUpdateUser 
	   is modified by bmstrecon program  as BMUPDATE, 0th update is not happening here 

	if (strncmp(custTabRec.lastUpdateUser,"MIGRATION            ",15) == 0 &&
		receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

		strncpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);
		strncpy(custLogRec1.userId, "MIGRATION              ",20);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(custLogRec1.dateTime, tmpStr, 14);
		custLogRec1.bmUpdateStatus = '9'; 

		strncpy(custLogRec1.idNo,custTabRec.idNo,1024);
		strncpy(custLogRec1.lastUpdateUser,custTabRec.lastUpdateUser,34);
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
			fflush(logFp);
			fprintf(errLogFp, "%s : processSuperDecision :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]\n", getDateTime(), iserrno,custLogRec1.branchCode);
			fflush(errLogFp);
		}
		else
		{
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] 0th record update completed\n", getDateTime(), PID);
		}
	}
	*/
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] About to update Customer Table file(stcusttab)\n", getDateTime(), PID);

	/* add/update a record to custTab */

	custTabRec.liveChar = '@';

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custTabRec.custNo,custLogRec.custNo,7);
		strncpy(custTabRec.custOpenDate, bankingDate, 8);
	}

	strncpy(custTabRec.lastUpdateBmDate, bankingDate, 8);

	strncpy(custTabRec.branchCode,custLogRec.custBranchCode,4); /* Earlier, this line was kept inside newOrUpdate = 'N' if group */  																/* MISYS */
	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		/*strncpy(custTabRec.branchCode,custLogRec.custBranchCode,4); */
		strncpy(custTabRec.createdUserId, custLogRec.userId,20);
		strncpy(custTabRec.createdDateTime, custLogRec.dateTime,14);
	}

	if( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		strncpy(tNoOfJointCust, custTabRec.noOfJointCustomer, 2);
		memset(&crdRec.liveChar, ' ', sizeof crdRec);
		strncpy(crdRec.accNo, (char *)actualToBmCust(custLogRec.custNo, tmpStr), 6);

		if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISREAD/ISEQUAL error %d occured while reading crd0data for the customer %.7s [%.6s] ..\n", getDateTime(), PID, iserrno, custLogRec.custNo, crdRec.accNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d on crd0data for customer [%.7s]", iserrno, custLogRec.custNo );
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		tmpPackageAcc = crdRec.packageAcc;
	}

	strncpy(custTabRec.idNo, custLogRec.idNo,1024); 

	isindexinfo(userFile, &userKey, 1);
	memset(&userRec.liveChar, ' ', sizeof userRec);
	if ( isstart(userFile, &userKey, 0, &userRec.liveChar, ISGTEQ) < 0 )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]ISSTART/ISGTEQ error %d on stuser.dat for %.10s\n", getDateTime(), PID, iserrno, custLogRec.userId);
	fprintf(logFp, "UserFile value is %d\n", userFile);
	strncpy(userRec.userId, custLogRec.userId, 10);
	isRead(userFile, &userRec.liveChar, ISEQUAL);

	if ( iserrno || strncmp(userRec.userId, custLogRec.userId, 10) )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISREAD/ISEQUAL error %d occured while reading userId [%.10s] and obtained userId from stuser [%.10s]\n", getDateTime(), PID, iserrno, custLogRec.userId, userRec.userId);
		fflush(logFp);
		sprintf(tmpStr, "UserID[%.10s:%.10s] could not be read", custLogRec.userId, userRec.userId);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	sprintf(tmpStr, "%.20s", userRec.authorityLevel);
	sprintf(tmpAuthLevel, "~%.2s", tmpStr);
	for (i=2; i < strlen(tmpStr); i += 2 )
		sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

	sprintf(tmpStr, "%.60s", userRec.authorityLevel2);
	for (i=0; i < strlen(tmpStr); i += 2 )
		sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

	/* if user does not have package account previledge during update, then, move the original package acc flag existing 
	in crd */
	if ( (tmpPtr = strstr(tmpAuthLevel, "~7")) == NULL && receivedMsg.supDecision.newOrUpdate == 'U' )  
		custTabRec.packageAcc =  tmpPackageAcc;

	isclose(userFile); userFileOpen=NO;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Passed all user authentication for update\n", getDateTime(), PID);

	if( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		strncpy(custTabRec.noOfJointCustomer, tNoOfJointCust, 2);
		/* If the customer created through quick pension customer opening screen, and the customer 
		   visits a branch for updating the record, then move the home branch as customer branch code in GLD
		*/
		if ( custTabRec.createdFromQuickScreen == '3' &&
			 strncmp(custTabRec.samaMainCategory, "0099", 4) == 0 ) /* Pension customer */
			updateBrCodeInGl(custTabRec.custNo, custTabRec.branchCode);
	}

	if ( strncmp(&custTabRec.mobileNo[2], "               ", 8) == 0 )
		strncpy(custTabRec.mobileNo, "                   ", 10 );
										
	custTabRec.custType = custLogRec.custType;  /* Customer type is moved since the existing should be able to enquire */
	strncpy(custTabRec.samaMainCategory, custLogRec.samaMainCategory, 2);
	strncpy(custTabRec.samaSubCategory, custLogRec.samaSubCategory, 2);

	custTabRec.internetBankAcc = custLogRec.internetBankAcc;
	custTabRec.custAdviceFlag = custLogRec.custAdviceFlag;
	custTabRec.excludeFromAtmFees = custLogRec.excludeFromAtmFees;
	custTabRec.excludeFromMinBalFees = custLogRec.excludeFromMinBalFees;
	custTabRec.pkgStmtFreqOverride = custLogRec.pkgStmtFreqOverride;
	strncpy(custTabRec.altBranchCode, custLogRec.altBranchCode,4);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( custLogRec.custType == '0' ) /* Only consumer customers to be considered */
		{
			if ( custTabRec.updatedForSama != '1' && custLogRec.updatedForSama == '1' )
			{
				if ( unblockCardForSama() == FAILURE )
				{
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
			}
		}
	}
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] unblocked the cards for sama; updating stcusttab\n", getDateTime(), PID);

	custTabRec.updatedForSama = custLogRec.updatedForSama; 
	strncpy(custTabRec.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(custTabRec.generalMemo, custLogRec.generalMemo, 25); 
	strncpy(custTabRec.marketingMemo, custLogRec.marketingMemo, 25); 
	strncpy(custTabRec.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3);

	strncpy(custTabRec.passportNo, custLogRec.passportNo, 15);
	strncpy(custTabRec.samaAuthNo, custLogRec.samaAuthNo, 15);
	strncpy(custTabRec.hafizaNo, custLogRec.hafizaNo, 15);
	strncpy(custTabRec.familyRegnNo, custLogRec.familyRegnNo, 15);
	strncpy(custTabRec.certificateOfBirthNo, custLogRec.certificateOfBirthNo, 15);
	strncpy(custTabRec.documentsSupplied, custLogRec.documentsSupplied, 60);
	custTabRec.overrideForCList = custLogRec.overrideForCList;
	custTabRec.overrideForExistingCust = custLogRec.overrideForExistingCust;
	custTabRec.minorOrMajor = custLogRec.minorOrMajor;
	custTabRec.childWithSpecialCase = custLogRec.childWithSpecialCase;
	strncpy(custTabRec.referenceReqdFor,custLogRec.referenceReqdFor, 10);
	strncpy(custTabRec.succDeedNo, custLogRec.succDeedNo, 10);

	strncpy(custTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custTabRec.lastUpdateDateTime, tmpStr, 14);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( isRewcurr(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISREWCURR error %d on stcusttab for the key [%.7s]\n", getDateTime(), PID, iserrno, custTabRec.custNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.7s] on stcusttab",custTabRec.custNo);
				formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcusttab" );
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|update action : isrewcurr on stcusttab successful\n", getDateTime(), PID);
			fflush(logFp);
		}
		isrelease(custTabFile); 
		if ( custLogRec.updateCardAddressReqd == '1' )
		{
			sprintf(tmpStr, "%.7s", custTabRec.custNo);
			updateCardAddress(tmpStr);
		}
	}
	else
	{
		custTabRec.custOpenSource = custLogRec.custOpenSource;
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to custTabFile (%d) ..\n", getDateTime(), PID, custTabFile);
			fflush(logFp);
		}
		if ( isWrite(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISWRITE error %d on stcusttab for key=%.7s\n", getDateTime(), PID, iserrno, custTabRec.custNo);
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.7s] on stcusttab", custTabRec.custNo);
				formatSuperDecisionResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcusttab"); 
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|add action : iswrite on stcusttab successful\n", getDateTime(), PID);
			fflush(logFp);
		}
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] stcusttab update completed; proceeding to update REFERENCE information\n", getDateTime(), PID);

	if ( custLogRec.newOrUpdate == 'N' && custLogRec.custOpenSource == 'P' )
	{
		/* Update the  record in customers created through Phone banking file (stcustpb) */
		memset(&pbCustRec.liveChar, ' ', sizeof pbCustRec);
		pbCustRec.liveChar = '@';
		strncpy(pbCustRec.custNo, custLogRec.custNo, 7);
		isindexinfo(pbCustFile, &pbCustKey, 1);
		isstart(pbCustFile, &pbCustKey, 0, &pbCustRec.liveChar, ISGTEQ);

		if ( isRead(pbCustFile, &pbCustRec.liveChar, ISEQUAL+ISLOCK) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);

			if ( iserrno != 111  && iserrno != 110 )
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrelease(pbCustFile);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				sprintf(tmpStr, "Record not found in stcustpb file");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
				isrelease(pbCustFile);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		pbCustRec.pendingStatus =  custLogRec.bmUpdateStatus;
		strncpy(pbCustRec.branchSupervisorId, receivedMsg.supDecision.supervisorId, 10);
		strncpy(pbCustRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(pbCustRec.custOpenDate, bankingDate, 8);
		strncpy(pbCustRec.approvedDateTime, tmpStr, 14);
		strncpy(pbCustRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(pbCustFile, &pbCustRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stcustpb for customer number [%.7s] \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating info in stcustpb", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isrelease(pbCustFile);
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		isrelease(pbCustFile);
	}

	/* Read the corresponding reference log file */

	memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);
	memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);
	strncpy(cRefTabRec.referenceNo, "0000", 4); /* to prevent repeatation of update */

	strncpy(cRefLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(cRefLogRec.userId, custLogRec.userId, 10);
	strncpy(cRefLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(cRefLogFile, &cRefLogKey, 1);
	isstart(cRefLogFile, &cRefLogKey, 28, &cRefLogRec.liveChar, ISGTEQ);

	while ( isRead(cRefLogFile, &cRefLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cRefLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(cRefLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(cRefLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( extraDebug )
		{
			fprintf(logFp, "%s:%5d|[processSaudiIndividualSuperDecision] Rerence update: while read(cRefLogFile) entered ; cRefLogKey [%.28s]; custLogKey [%.28s]; reference number [%.4s]; Record Changed=%s\n", getDateTime(), PID, cRefLogRec.branchCode, custLogRec.branchCode, cRefLogRec.referenceNo, cRefLogRec.recordChanged);
			fflush(logFp);
		}

		if ( receivedMsg.supDecision.newOrUpdate == 'N' )
		{
			if ( strncmp(cRefLogRec.referenceNo, cRefTabRec.referenceNo, 4) <= 0 ) /*  RAJESH : to prevent cRefLog update which is already updated */
				break;
		}

		if ( cRefLogRec.recordChanged == 'N' )
			continue;

		strncpy(cRefLogRec.custNo, custLogRec.custNo, 7);
		cRefLogRec.bmUpdateStatus = '9'; /* completed */

		strncpy(cRefLogRec.lastUpdateBmDate, bankingDate, 8);

		strncpy(cRefLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(cRefLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(cRefLogFile, &cRefLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stcreflog for the key [%.28s %.7s]\n", getDateTime(), PID, iserrno, cRefLogRec.branchCode, cRefLogRec.custNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record on stcreflog");
				formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcreflog" );
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Reference log file update successful for reference # %.4s\n", getDateTime(), PID, cRefLogRec.referenceNo);
			fflush(logFp);
		}

		/* Read & Modify the correponding Id Log file */

		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, cRefLogRec.branchCode, 4);
		strncpy(idLogRec.userId, cRefLogRec.userId, 10);
		strncpy(idLogRec.dateTime, cRefLogRec.dateTime, 14);
		idLogRec.idType = cRefLogRec.idType;
		strncpy(idLogRec.idNo, cRefLogRec.idNo, 15);
		idLogRec.idCategory = 'R'; /* Reference */

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

		if ( readIdLogFile(ISEQUAL) < 0 )
		{
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		strncpy(idLogRec.custNo, custLogRec.custNo, 7);
		idLogRec.bmUpdateStatus = '9'; /* Completed */
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s][REFERENCE]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Currently in Reference info update :Rewcurr idLogFile successful.... idlogkey [%.28s] ; customer no [%.7s] ;id type , id No , id category [%c;%.15s;%c] id Reference number [%.4s]\n", getDateTime(), PID, idLogRec.branchCode, idLogRec.custNo, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory, idLogRec.idRefNo);
			fflush(logFp);
		}

		/* Now , write/update stidtab for the above */

		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

		idTabRec.liveChar = '@';
		strncpy(idTabRec.custNo, idLogRec.custNo, 7);
		idTabRec.idCategory = idLogRec.idCategory;
		strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
		isindexinfo(idTabFile, &idTabKey, 6);
		isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);
		if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) == SUCCESS )
		{
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
			idTabRec.newOrUpdate = idLogRec.newOrUpdate;

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s][REFERENCE]; and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
			memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
			idTabRec.liveChar='@';
			strncpy(idTabRec.custNo, idLogRec.custNo, 7);
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
			idTabRec.newOrUpdate = 'N';
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
			strncpy(idTabRec.lastUpdateUser, idLogRec.lastUpdateUser, 10);
			strncpy(idTabRec.lastUpdateDateTime, idLogRec.lastUpdateDateTime, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing reference Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while reading referenceId in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] stidtab update for this REFERENCE completed; about to update address info\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Read corresponding Address log record */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, cRefLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, cRefLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, cRefLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) ==  0 )
		{
			if ( strncmp(addrLogRec.branchCode, cRefLogRec.branchCode, 4) ||
				 strncmp(addrLogRec.userId, cRefLogRec.userId, 10) ||
				 strncmp(addrLogRec.dateTime, cRefLogRec.dateTime, 14) )
				 break;
			
			if ( strncmp(addrLogRec.addressType, "02", 2) ) /* Reference local address */
				continue;

			if ( strncmp(addrLogRec.addressNo, cRefLogRec.referenceNo, 4) )
				continue;

			strncpy(addrLogRec.custNo, cRefLogRec.custNo, 7);
			addrLogRec.bmUpdateStatus = '9'; /* Completed */

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				/* Added by Arul on 03 Dec 03 to avoid error 100 while rewriting- Why does it happen? Need investigation */
				if ( iserrno != 100  && iserrno != 108 ) /* the current record is not read */
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					fflush(logFp);

					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE] and the key is [%.28s]: IGNORED but requires investigation\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
			}
			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrlog update for this Reference competed\n", getDateTime(), PID);
				fflush(logFp);
			}

			memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

			addrTabRec.liveChar = '@';
			strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
			strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
			strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

			/* Arul added the following statement to simplyfy the address info update */
			if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) == 0 )
			{
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
				}
				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
				if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWRCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab update competed; About to look for any more address for this reference\n", getDateTime(), PID);
					fflush(logFp);
				}
			}
			else if ( iserrno == 111 )/* add the record into address */
			{
				memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

				addrTabRec.liveChar = '@';
				strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
				strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
				strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
				addrLogRec.newOrUpdate = 'N';
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
				}

				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
				if ( addrLogRec.newOrUpdate == 'N' )
				{
					strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
					strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
				}
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
					fflush(logFp);
				}
				if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab record added; About to look for any more address for this reference\n", getDateTime(), PID);
					fflush(logFp);
				}
			}
			else /* ISREAD/ISEQUAL error occurred */
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab update for this Reference competed; About to read stcreftab\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Write stcreftab */

		memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);

		cRefTabRec.liveChar = '@';
		strncpy(cRefTabRec.custNo, cRefLogRec.custNo, 7);
		strncpy(cRefTabRec.referenceNo, cRefLogRec.referenceNo, 4);
		if ( isRead(cRefTabFile, &cRefTabRec.liveChar, ISEQUAL) == 0 )
		{
			strncpy(cRefTabRec.referenceReqdFor, cRefLogRec.referenceReqdFor, 10);
			strncpy(cRefTabRec.branchCode, cRefLogRec.custBranchCode, 4);
			cRefTabRec.referenceType = cRefLogRec.referenceType;

			strncpy(cRefTabRec.aFirstName, cRefLogRec.aFirstName, 205); /* From aFirstName to disableDate */

			strncpy(cRefTabRec.lastUpdateBmDate, bankingDate, 8);

			strncpy(cRefTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(cRefTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(cRefTabFile, &cRefTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stcreftab for customer number [%.7s] and reference No [%.4s]\n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stcreftab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Record not found on stcreftab to update for customer # [%.7s] , reference no [%.4s]; and hence it will be added\n", getDateTime(), PID, cRefTabRec.custNo, cRefTabRec.referenceNo);
			memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);
			cRefTabRec.liveChar = '@';
			strncpy(cRefTabRec.custNo, cRefLogRec.custNo, 7);
			strncpy(cRefTabRec.referenceNo, cRefLogRec.referenceNo, 4);
			strncpy(cRefTabRec.referenceReqdFor, cRefLogRec.referenceReqdFor, 10);
			strncpy(cRefTabRec.branchCode, cRefLogRec.custBranchCode, 4);
			cRefTabRec.referenceType = cRefLogRec.referenceType;
			cRefTabRec.custOpenSource = cRefLogRec.custOpenSource;

			strncpy(cRefTabRec.aFirstName, cRefLogRec.aFirstName, 205); /* From aFirstName to disableDate */
			strncpy(cRefTabRec.lastUpdateBmDate, bankingDate, 8);

			strncpy(cRefTabRec.createdUserId, cRefLogRec.userId, 10);
			strncpy(cRefTabRec.createdDateTime, cRefLogRec.dateTime, 14);
			strncpy(cRefTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(cRefTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to cRefTabFile (%d) ..\n", getDateTime(), PID, cRefTabFile);
				fflush(logFp);
			}
			if ( isWrite(cRefTabFile, &cRefTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stcreftab for customer number [%.7s] and reference No [%.4s]\n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo );
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stcreftab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stcreftab for customer # [%.7s] , reference no [%.4s] \n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while reading stcreftab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update for this Reference competed; Moving on to next reference, if any\n", getDateTime(), PID);
			fflush(logFp);
		}
		if ( receivedMsg.supDecision.newOrUpdate == 'N' )
		{
			memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);

			strncpy(cRefLogRec.branchCode, custLogRec.branchCode,4);
			strncpy(cRefLogRec.userId, custLogRec.userId, 10);
			strncpy(cRefLogRec.dateTime, custLogRec.dateTime, 14);
			strncpy(cRefLogRec.referenceNo, cRefTabRec.referenceNo, 4);

			isindexinfo(cRefLogFile, &cRefLogKey, 1);
			isstart(cRefLogFile, &cRefLogKey, 0, &cRefLogRec.liveChar, ISGTEQ);
			if ( extraDebug )
			{
				fprintf(logFp, "After isstart before continuing while loop; status [%d]; Reflogkey [%.28s] ; custNo [%.7s]; reference number [%.4s] \n", iserrno, cRefLogRec.branchCode, cRefLogRec.custNo, cRefLogRec.referenceNo);
				fflush(logFp);
			}
		}
	} /* while read(creflog) */

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Reference Log Information are updated; proceeding to update heir information, if any\n", getDateTime(), PID);

	/* Read the corresponding heir log file */

	memset(&heirLogRec.liveChar, ' ', sizeof heirLogRec);
	memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);
	strncpy(heirTabRec.heirNo, "0000", 4); /* to prevent repeatation of update */

	strncpy(heirLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(heirLogRec.userId, custLogRec.userId, 10);
	strncpy(heirLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(heirLogFile, &heirLogKey, 1);
	isstart(heirLogFile, &heirLogKey, 28, &heirLogRec.liveChar, ISGTEQ);

	while ( isRead(heirLogFile, &heirLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(heirLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(heirLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(heirLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( extraDebug )
		{
			fprintf(logFp, "%s:%5d|[processSaudiIndividualSuperDecision] Heir update: while read(heirLogFile) entered ; heirLogKey [%.28s]; custLogKey [%.28s]; heir number [%.4s]; Record Changed=%s\n", getDateTime(), PID, heirLogRec.branchCode, custLogRec.branchCode, heirLogRec.heirNo, heirLogRec.recordChanged);
			fflush(logFp);
		}

		if ( receivedMsg.supDecision.newOrUpdate == 'N' )
		{
			if ( strncmp(heirLogRec.heirNo, heirTabRec.heirNo, 4) <= 0 ) /*  RAJESH : to prevent heirLog update which is already updated */
				break;
		}

		if ( heirLogRec.recordChanged == 'N' )
			continue;

		strncpy(heirLogRec.custNo, custLogRec.custNo, 7);
		heirLogRec.bmUpdateStatus = '9'; /* completed */

		strncpy(heirLogRec.lastUpdateBmDate, bankingDate, 8);

		strncpy(heirLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(heirLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(heirLogFile, &heirLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stheirlog for the key [%.28s %.7s]\n", getDateTime(), PID, iserrno, heirLogRec.branchCode, heirLogRec.custNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record on stheirlog");
				formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stheirlog" );
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stheirlog", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Heir log file update successful for heir # %.4s\n", getDateTime(), PID, heirLogRec.heirNo);
			fflush(logFp);
		}

		/* Read & Modify the correponding Id Log file */

		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, heirLogRec.branchCode, 4);
		strncpy(idLogRec.userId, heirLogRec.userId, 10);
		strncpy(idLogRec.dateTime, heirLogRec.dateTime, 14);
		idLogRec.idType = heirLogRec.idType;
		strncpy(idLogRec.idNo, heirLogRec.idNo, 15);
		idLogRec.idCategory = 'H'; /* Heir */

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

		if ( readIdLogFile(ISEQUAL) < 0 )
		{
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		strncpy(idLogRec.custNo, custLogRec.custNo, 7);
		idLogRec.bmUpdateStatus = '9'; /* Completed */
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s][HEIR]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Currently in Heir info update :Rewcurr idLogFile successful.... idlogkey [%.28s] ; customer no [%.7s] ;id type , id No , id category [%c;%.15s;%c] id Reference number [%.4s]\n", getDateTime(), PID, idLogRec.branchCode, idLogRec.custNo, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory, idLogRec.idRefNo);
			fflush(logFp);
		}

		/* Now , write/update stidtab for the above */

		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

		idTabRec.liveChar = '@';
		strncpy(idTabRec.custNo, idLogRec.custNo, 7);
		idTabRec.idCategory = idLogRec.idCategory;
		strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
		isindexinfo(idTabFile, &idTabKey, 6);
		isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);
		if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) == SUCCESS )
		{
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
			idTabRec.newOrUpdate = idLogRec.newOrUpdate;

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][HEIR]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s][HEIR]; and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
			memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
			idTabRec.liveChar='@';
			strncpy(idTabRec.custNo, idLogRec.custNo, 7);
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
			idTabRec.newOrUpdate = 'N';
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
			strncpy(idTabRec.lastUpdateUser, idLogRec.lastUpdateUser, 10);
			strncpy(idTabRec.lastUpdateDateTime, idLogRec.lastUpdateDateTime, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][HEIR]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing heir Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][HEIR]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while reading heir ID in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] stidtab update for this HEIR completed; about to update address info\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Read corresponding Address log record */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, heirLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, heirLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, heirLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) ==  0 )
		{
			if ( strncmp(addrLogRec.branchCode, heirLogRec.branchCode, 4) ||
				 strncmp(addrLogRec.userId, heirLogRec.userId, 10) ||
				 strncmp(addrLogRec.dateTime, heirLogRec.dateTime, 14) )
				 break;
			
			if ( strncmp(addrLogRec.addressType, "05", 2) ) /* Reference local address */
				continue;

			if ( strncmp(addrLogRec.addressNo, heirLogRec.heirNo, 4) )
				continue;

			strncpy(addrLogRec.custNo, heirLogRec.custNo, 7);
			addrLogRec.bmUpdateStatus = '9'; /* Completed */

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				/* Added by Arul on 03 Dec 03 to avoid error 100 while rewriting- Why does it happen? Need investigation */
				if ( iserrno != 100  && iserrno != 108 ) /* the current record is not read */
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][HEIR] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					fflush(logFp);

					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][HEIR] and the key is [%.28s]: IGNORED but requires investigation\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
			}
			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrlog update for this Heir competed\n", getDateTime(), PID);
				fflush(logFp);
			}

			memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

			addrTabRec.liveChar = '@';
			strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
			strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
			strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

			/* Arul added the following statement to simplyfy the address info update */
			if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) == 0 )
			{
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
				}
				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
				if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWRCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][HEIR]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab update competed; About to look for any more address for this heir\n", getDateTime(), PID);
					fflush(logFp);
				}
			}
			else if ( iserrno == 111 )/* add the record into address */
			{
				memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

				addrTabRec.liveChar = '@';
				strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
				strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
				strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
				addrLogRec.newOrUpdate = 'N';
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
				}

				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
				if ( addrLogRec.newOrUpdate == 'N' )
				{
					strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
					strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
				}
				addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

				strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
					fflush(logFp);
				}
				if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][HEIR]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab record added; About to look for any more address for this heir\n", getDateTime(), PID);
					fflush(logFp);
				}
			}
			else /* ISREAD/ISEQUAL error occurred */
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][HEIR]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] staddrtab update for this Heir competed; About to read stheirtab\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Write stheirtab */

		memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);

		heirTabRec.liveChar = '@';
		strncpy(heirTabRec.custNo, heirLogRec.custNo, 7);
		strncpy(heirTabRec.heirNo, heirLogRec.heirNo, 4);
		if ( isRead(heirTabFile, &heirTabRec.liveChar, ISEQUAL) == 0 )
		{
			strncpy(heirTabRec.branchCode, heirLogRec.custBranchCode, 4);
			heirTabRec.heirType = heirLogRec.heirType;

			strncpy(heirTabRec.aFirstName, heirLogRec.aFirstName, 205); /* From aFirstName to disableDate */
			strncpy(heirTabRec.proxyNo, heirLogRec.proxyNo, 32); /* From proxyNo to proxyIssueDateG */

			strncpy(heirTabRec.lastUpdateBmDate, bankingDate, 8);

			strncpy(heirTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(cRefTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(heirTabFile, &heirTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stheirtab for customer number [%.7s] and heir No [%.4s]\n", getDateTime(), PID, iserrno, heirTabRec.custNo, heirTabRec.heirNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stheirtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Record not found on stheirtab to update for customer # [%.7s] , heir no [%.4s]; and hence it will be added\n", getDateTime(), PID, heirTabRec.custNo, heirTabRec.heirNo);
			memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);
			heirTabRec.liveChar = '@';
			strncpy(heirTabRec.custNo, heirLogRec.custNo, 7);
			strncpy(heirTabRec.heirNo, heirLogRec.heirNo, 4);
			strncpy(heirTabRec.branchCode, heirLogRec.custBranchCode, 4);
			heirTabRec.heirType = heirLogRec.heirType;
			heirTabRec.custOpenSource = heirLogRec.custOpenSource;

			strncpy(heirTabRec.aFirstName, heirLogRec.aFirstName, 205); /* From aFirstName to disableDate */
			strncpy(heirTabRec.lastUpdateBmDate, bankingDate, 8);

			strncpy(heirTabRec.createdUserId, heirLogRec.userId, 10);
			strncpy(heirTabRec.createdDateTime, heirLogRec.dateTime, 14);
			strncpy(heirTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(heirTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to heirTabFile (%d) ..\n", getDateTime(), PID, cRefTabFile);
				fflush(logFp);
			}
			if ( isWrite(heirTabFile, &heirTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stheirtab for customer number [%.7s] and heir No [%.4s]\n", getDateTime(), PID, iserrno, heirTabRec.custNo, heirTabRec.heirNo );
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stheirtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stheirtab for customer # [%.7s] , heir no [%.4s] \n", getDateTime(), PID, iserrno, heirTabRec.custNo, heirTabRec.heirNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while reading stheirtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Update for this Heir competed; Moving on to next heir, if any\n", getDateTime(), PID);
			fflush(logFp);
		}
		if ( receivedMsg.supDecision.newOrUpdate == 'N' )
		{
			memset(&heirLogRec.liveChar, ' ', sizeof heirLogRec);

			strncpy(heirLogRec.branchCode, custLogRec.branchCode,4);
			strncpy(heirLogRec.userId, custLogRec.userId, 10);
			strncpy(heirLogRec.dateTime, custLogRec.dateTime, 14);
			strncpy(heirLogRec.heirNo, heirTabRec.heirNo, 4);

			isindexinfo(heirLogFile, &heirLogKey, 1);
			isstart(heirLogFile, &heirLogKey, 0, &heirLogRec.liveChar, ISGTEQ);
			if ( extraDebug )
			{
				fprintf(logFp, "After isstart before continuing while loop; status [%d]; Heirlogkey [%.28s] ; custNo [%.7s]; heir number [%.4s] \n", iserrno, heirLogRec.branchCode, heirLogRec.custNo, heirLogRec.heirNo);
				fflush(logFp);
			}
		}
	} /* while read(heirlog) */

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Heir Log Information are updated; proceeding to update Bankmaster\n", getDateTime(), PID);


	/* update BankMaster  */

	memset( bmCustRec.custNo, ' ', sizeof bmCustRec );

	strncpy(bmCustRec.custNo, custTabRec.custNo,7);

	bmCustRec.newOrUpdate =  receivedMsg.supDecision.newOrUpdate;
	strncpy(bmCustRec.branchCode, custLogRec.custBranchCode,4);
	bmCustRec.customerType = custLogRec.custType;
	bmCustRec.languageCode = custLogRec.preferredLang;
	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		bmCustRec.nameUpdateRequired = custTabRec.nameChanged;
		bmCustRec.addressUpdateRequired = custTabRec.addressChanged;
	}
	else
	{
		bmCustRec.nameUpdateRequired = '1';
		bmCustRec.addressUpdateRequired = '1';
	}

	if( custLogRec.preferredLang == ARABIC )
	{
		strncpy(bmCustRec.firstName, custLogRec.aFirstName, 15);
		strncpy(bmCustRec.secondName,custLogRec.a2ndName, 15);
		strncpy(bmCustRec.thirdName, custLogRec.a3rdName, 15);
		strncpy(bmCustRec.lastName, custLogRec.aLastName, 15);
		if ( strncmp(custLogRec.aShortName, "                               ", 30) )
			strncpy(bmCustRec.shortName, custLogRec.aShortName, 30);
		else
			strncpy(bmCustRec.shortName, custLogRec.eShortName, 30);
		strncpy(bmCustRec.orgName1, custLogRec.aOrgName1, 30);
		strncpy(bmCustRec.orgName2, custLogRec.aOrgName2, 30);
		strncpy(bmCustRec.orgShortName, custLogRec.aOrgShortName, 30);
	}
	else
	{
		strncpy(bmCustRec.firstName, custLogRec.eFirstName, 15);
		strncpy(bmCustRec.secondName,custLogRec.e2ndName, 15);
		strncpy(bmCustRec.thirdName, custLogRec.e3rdName, 15);
		strncpy(bmCustRec.lastName, custLogRec.eLastName, 15);
		if ( strncmp(custLogRec.eShortName, "                               ", 30) )
			strncpy(bmCustRec.shortName, custLogRec.eShortName, 30);
		else
			strncpy(bmCustRec.shortName, custLogRec.aShortName, 30);

		strncpy(bmCustRec.orgName1, custLogRec.eOrgName1, 30);
		strncpy(bmCustRec.orgName2, custLogRec.eOrgName2, 30);
		strncpy(bmCustRec.orgShortName, custLogRec.eOrgShortName, 30);
	}
	bmCustRec.singleJointAcc = custLogRec.singleJointAcc;
	strncpy(bmCustRec.jointAccLongName, custLogRec.jointAccNameOnCheck, 60);
	strncpy(bmCustRec.jointAccShortName, custLogRec.jointAccNameOnReports, 30);
	strncpy(bmCustRec.address1, custLogRec.address1, 30);
	strncpy(bmCustRec.address2, custLogRec.address2, 30);
	strncpy(bmCustRec.poBox, custLogRec.poBox, 10);
	strncpy(bmCustRec.cityName, custLogRec.cityName, 15);
	strncpy(bmCustRec.zipCode, custLogRec.zipCode, 8);
	strncpy(bmCustRec.nationalityCode, custLogRec.nationality,3);
	bmCustRec.sexCode = custLogRec.sexCode;
	bmCustRec.residentCode = custLogRec.residentStatus;
	bmCustRec.idType = custLogRec.idType;
	strncpy(bmCustRec.idNo, custLogRec.idNo,15);
	if ( strncmp(custLogRec.telOffNo,"          ", 10) != 0 )
	{
		strncpy(bmCustRec.telCityCode, custLogRec.telOffAreaCode, 2);
		strncpy(bmCustRec.telNo, custLogRec.telOffNo, 10);
		strncpy(bmCustRec.telExt, custLogRec.telOffExt, 4);
	}
	else
	{
		strncpy(bmCustRec.telCityCode, custLogRec.telHomeAreaCode, 2);
		strncpy(bmCustRec.telNo, custLogRec.telHomeNo, 10);
		strncpy(bmCustRec.telExt, custLogRec.telHomeExt, 4);
	}
	strncpy(bmCustRec.businessType, custLogRec.businessType, 3);
	strncpy(bmCustRec.titleCode, custLogRec.titleCode, 2 );
	if ( custLogRec.dobDateType == HIJRI ) 
		strncpy( bmCustRec.dateOfBirth, custLogRec.dobDateH, 8 );
	else
		strncpy( bmCustRec.dateOfBirth, custLogRec.dobDateG, 8 );

	bmCustRec.packageAcc = custTabRec.packageAcc; /* packageAcc authorization check is done at custTabRec */
	bmCustRec.vipFlag = custLogRec.vipCode;
	strncpy(bmCustRec.altBranchCode, custLogRec.altBranchCode, 4);
	strncpy(bmCustRec.primaryMemo, receivedMsg.supDecision.primaryAcc,5);
	bmCustRec.addressType = custLogRec.addressType;
	strncpy(bmCustRec.gprsNo, custLogRec.gprsNo, 8);
	strncpy(bmCustRec.unitNo, custLogRec.unitNo, 5);
	strncpy(bmCustRec.saudiPostalZipCode, custLogRec.zipCode, 10); 
	bmCustRec.excludeFromAtmFees = custLogRec.excludeFromAtmFees;
	bmCustRec.excludeFromMinBalFees = custLogRec.excludeFromMinBalFees;
	bmCustRec.pkgStmtFreqOverride = custLogRec.pkgStmtFreqOverride;
	bmCustRec.nullPad = '\0';

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] About to update BM customer Regiser\n", getDateTime(), PID);
		fflush(logFp);
	}
	if ( (returnError = updateCrd(bmCustRec)) != SUCCESS )
	{
		sprintf(tmpStr,"Error %d occured while updating CustInfo in BM", returnError);
		fprintf(logFp,"%s|%5d|[processSaudiIndividualSuperDecision] : Error %d occured while updating CustInfo in BM for the key [%.7s]\n", getDateTime(), PID, returnError, bmCustRec.custNo);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	/* Successfully wrote into bankmaster  */

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] BM Update completed; About to update Joint Account information\n", getDateTime(), PID);
	/* update Joint Account details */

	sprintf(tmpJointNo, "%.2s", custLogRec.noOfJointCustomer);
	noOfJoint = atoi(tmpJointNo); 

	if ( noOfJoint > 0 )
	{
		memset(&jointLogRec.liveChar, ' ', sizeof jointLogRec);
		strncpy(jointLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
		strncpy(jointLogRec.userId, receivedMsg.supDecision.userId,10);
		strncpy(jointLogRec.dateTime, receivedMsg.supDecision.dateTime,14);
		memset(jointLogRec.custNo, ' ',7);
		memset(jointLogRec.jointCustNo, ' ', 2);
		isindexinfo(jointLogFile,&jointLogKey,1);
		if ( isstart(jointLogFile,&jointLogKey,0,&jointLogRec.liveChar,ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision]ISSTART/ISGTEQ error %d occured on stjointlog for the key [%.38s%.2s]\n", getDateTime(), PID, iserrno, jointLogRec.branchCode, jointLogRec.jointCustNo);
			fflush(logFp);
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				formatSuperDecisionResponse(END_OF_FILE,"No joint Account Info exists ....", "No joint Account Info exists ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stjointlog", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		while( isRead(jointLogFile,&jointLogRec.liveChar,ISNEXT) == 0 )
		{
			if ( strncmp(receivedMsg.supDecision.branchCode,jointLogRec.branchCode,4) != 0 || strncmp(receivedMsg.supDecision.userId,jointLogRec.userId,10) != 0 || strncmp(receivedMsg.supDecision.dateTime,jointLogRec.dateTime,14) != 0 )
				break;

			if ( jointLogRec.recordChanged == 'N' )
				continue;

			/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
			if ( jointLogRec.newOrUpdate == 'N' )
			{
				strncpy(jointLogRec.custNo, custLogRec.custNo,7);
				strncpy(jointLogRec.jointOpenDate, bankingDate, 8);
			}
			strncpy(jointLogRec.lastUpdateBmDate, bankingDate, 8);
			
			strncpy(jointLogRec.supervisorId, receivedMsg.supDecision.supervisorId,10);
			strncpy(jointLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(jointLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( updateJointLogFile(SUPERVISOR_ACTION) < 0 )
			{
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
			/* update to jointcustlog SUCCESS  */

			/* Read corresponding Id Log */
			memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

			strncpy(idLogRec.branchCode, jointLogRec.branchCode, 4);
			strncpy(idLogRec.userId, jointLogRec.userId, 10);
			strncpy(idLogRec.dateTime, jointLogRec.dateTime, 14);
			strncpy(idLogRec.custNo, jointLogRec.custNo, 7);
			idLogRec.idType = jointLogRec.idType;
			strncpy(idLogRec.idNo, jointLogRec.idNo, 15);
			idLogRec.idCategory = 'J'; /* Joint */

			isindexinfo(idLogFile, &idLogKey, 1);
			isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

			if ( readIdLogFile(ISEQUAL) < 0 )
			{
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;

			}/* readidLog */

			if ( jointLogRec.newOrUpdate == 'N' )
				strncpy(idLogRec.custNo, custLogRec.custNo, 7);
			idLogRec.bmUpdateStatus = '9'; /* Completed */

			strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

			/* Now , write/update stidtab for the above */

			memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

			idTabRec.liveChar = '@';
			strncpy(idTabRec.custNo, idLogRec.custNo, 7);
			idTabRec.idCategory = idLogRec.idCategory;
			strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
			isindexinfo(idTabFile, &idTabKey, 6);
			isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);
			idTabRecFound = NO;
			if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) == SUCCESS )
			{
				idTabRec.idType = idLogRec.idType;
				strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */

				strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
				idTabRec.newOrUpdate = idLogRec.newOrUpdate;
				idTabRecFound = YES;
			}
			else if ( iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s]; for JOINT A/C  and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
				memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
				idTabRec.liveChar='@';
				strncpy(idTabRec.custNo, idLogRec.custNo, 7);
				idTabRec.idType = idLogRec.idType;
				strncpy(idTabRec.idNo, idLogRec.idNo, 15);
				idTabRec.idCategory = idLogRec.idCategory; /* Joint */
				strncpy(idTabRec.idIssuedAt, idLogRec.idIssuedAt, 20);
				idTabRec.idDateType = idLogRec.idDateType;
				strncpy(idTabRec.idIssueDateH, idLogRec.idIssueDateH, 8);
				strncpy(idTabRec.idIssueDateG, idLogRec.idIssueDateG, 8);
				strncpy(idTabRec.idExpiryDateH, idLogRec.idExpiryDateH, 8);
				strncpy(idTabRec.idExpiryDateG, idLogRec.idExpiryDateG, 8);
				strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
				idTabRec.newOrUpdate = 'N';
				strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
				strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
				strncpy(idTabRec.lastUpdateUser, idLogRec.lastUpdateUser, 10);
				strncpy(idTabRec.lastUpdateDateTime, idLogRec.lastUpdateDateTime, 14);
				idTabRecFound = NO;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][JOINT]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading joint Acct Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			/* Unfreeze Accounts if expiry date is updated */
			if ( jointLogRec.newOrUpdate == 'U' )
			{
				sprintf(tmpStr, "%.8s", idLogRec.idExpiryDateG);
				if ( validate(tmpStr) >= 0 )  /* only valid dates to be considered */
				{
					getDateTime();
					sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
					if ( strncmp(tmpStr, currentDate, 8) > 0 )
					{
						sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
						if ( unfreezeAccounts(tmpCustNo, IDEXPIRYACTION) == FAILURE )
						{
							isrollback();
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile); isclose(gldFile);isclose(heirLogFile);isclose(heirTabFile);
							custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=gldFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
							sigsetmask(oldSigMask);
							unlink(isLogPathName);
							free(isLogPathName);

							sendResponse(responseMsg.customer.msgLen);
							return FAILURE;
						}
						isclose(gldFile);
						gldFileOpen=NO;
						idLogRec.grace1ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace1ActionDate, "            ",8);
						idLogRec.grace2ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace2ActionDate, "            ",8);
					}
				}
			}

			idTabRec.grace1ActionTaken = idLogRec.grace1ActionTaken ; /* NO */
			strncpy(idTabRec.grace1ActionDate, idLogRec.grace1ActionDate, 8);
			idTabRec.grace2ActionTaken = idLogRec.grace2ActionTaken ; /* NO */
			strncpy(idTabRec.grace2ActionDate, idLogRec.grace2ActionDate, 8);

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);

			if (  idTabRecFound == YES )
			{
				if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] for JOINT\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else
			{
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
					fflush(logFp);
				}
				if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
				{
					if ( iserrno != 100 && iserrno != 108  ) /* Arul introduced on 06 Dec 03- Requires investigation */
					{
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] for JOINT\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
						fflush(logFp);
						sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						isrollback();
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);

						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
					else
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] for JOINT- IGNORED\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				}
			}

			/* Update Id Log */
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s] for JOINT\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			/* Read corresponding Address log record */

			memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

			strncpy(addrLogRec.branchCode, jointLogRec.branchCode, 4);
			strncpy(addrLogRec.userId, jointLogRec.userId, 10);
			strncpy(addrLogRec.dateTime, jointLogRec.dateTime, 14);

			sprintf(tmpStr, "%.2s", jointLogRec.jointCustNo, 2);
			sprintf(tmpAddressNo, "%04d", atoi(tmpStr));
			strncpy(addrLogRec.addressNo, tmpAddressNo, 4);

			isindexinfo(addrLogFile, &addrLogKey, 1);
			isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

			while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(addrLogRec.branchCode, jointLogRec.branchCode, 4) ||
					 strncmp(addrLogRec.userId, jointLogRec.userId, 10) ||
					 strncmp(addrLogRec.dateTime, jointLogRec.dateTime, 14) )
					 break;

				if ( strncmp(addrLogRec.addressType, "00", 2) )
					continue;

				if ( strncmp(addrLogRec.addressNo, tmpAddressNo, 4) )
					continue;

				strncpy(addrLogRec.custNo, jointLogRec.custNo, 7);
				strncpy(addrLogRec.addressType, "00", 2); /* Local ; Since only one address available for joint */
				addrLogRec.bmUpdateStatus = '9'; /* Completed */

				strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
				strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

				memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
				if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
				{
					/* Added by Arul on 03 Dec 03 to avoid error 100 while rewriting- Why does it happen? Need investigation */
					if ( iserrno != 100  && iserrno != 108 ) 
					{
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][JOINT] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
						fflush(logFp);

						sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						isrollback();
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);

						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][JOINT] and the key is [%.28s]; IGNORED but requires investigation\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
				}

				memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

				addrTabRec.liveChar = '@';
				strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
				strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
				strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

				/* Arul added the following statement to simplyfy the address info update */
				if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) == 0 )
				{
					strncpy(addrTabRec.address1, addrLogRec.address1, 207);
					addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;
					addrTabRec.addrType = addrLogRec.addrType;
					if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
					{
						strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
						strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
						strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
					}

					strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

					addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

					strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
					getDateTime();
					sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
					strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
					if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
					{
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREWRCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
						sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						isrollback();
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);

						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
				}
				else if ( iserrno == 111 )/* add the record into address */
				{
					memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

					addrTabRec.liveChar = '@';
					strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
					strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
					strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
					addrLogRec.newOrUpdate = 'N';
					strncpy(addrTabRec.address1, addrLogRec.address1, 207);
					addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;
					addrTabRec.addrType = addrLogRec.addrType;
					if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
					{
						strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
						strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
						strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
					}

					strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

					/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
					if ( addrLogRec.newOrUpdate == 'N' )
					{
						strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
						strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
					}
					addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

					strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
					getDateTime();
					sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
					strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
					if ( extraDebug > 4 )
					{
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
						fflush(logFp);
					}
					if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
					{
						fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
						fflush(logFp);
						sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						isrollback();
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);

						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
				}
				else /* ISREAD/ISEQUAL error occurred */
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}

			memset(&jointTabRec.liveChar, ' ', sizeof jointTabRec);
			strncpy(jointTabRec.custNo, jointLogRec.custNo, 7);
			strncpy(jointTabRec.jointCustNo, jointLogRec.jointCustNo,2);
			/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
			if ( jointLogRec.newOrUpdate == 'U' )
			{
				if ( readJointTabFile(ISEQUAL+ISLOCK) < 0 )
				{
					if ( iserrno == 111 || iserrno == 110 ) /* If the record not found, then add it */
						jointLogRec.newOrUpdate = 'N';
					else
					{
						isrollback();
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);
						sendResponse(responseMsg.superDecision.msgLen);
						return FAILURE;
					}
				}
			}
			
			jointTabRec.liveChar = '@';
			/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
			if ( jointLogRec.newOrUpdate == 'N' )
			{
				strncpy(jointTabRec.custNo,custLogRec.custNo,7);
				strncpy(jointTabRec.jointOpenDate, bankingDate, 8);
			}
			else
				strncpy(jointTabRec.custNo, jointLogRec.custNo,7);

			strncpy(jointTabRec.jointCustNo,jointLogRec.jointCustNo,2);
			strncpy(jointTabRec.branchCode, receivedMsg.supDecision.branchCode,4);
			strncpy(jointTabRec.createdUserId, receivedMsg.supDecision.userId,10);
			strncpy(jointTabRec.createdDateTime, receivedMsg.supDecision.dateTime,14);
			strncpy(jointTabRec.idNo, jointLogRec.idNo,632);
			jointTabRec.activeStatus = jointLogRec.activeStatus;
			strncpy(jointTabRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(jointTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(jointTabRec.lastUpdateDateTime, tmpStr, 14);

			/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
			if ( jointLogRec.newOrUpdate == 'U' )
			{
				if (isRewcurr(jointTabFile, &jointTabRec.liveChar) < 0)
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISREWRITE error %d on stjointtab for the cust # [%.7s] and joint Cust No[%.2s]\n", getDateTime(), PID, iserrno, jointTabRec.custNo, jointTabRec.jointCustNo );
					fflush(logFp);
					if  ( iserrno == 100 || iserrno == 108 )
					{
						sprintf(tmpStr, "Duplicate record [%.7s%.2s] on stjointtab",jointTabRec.custNo, jointTabRec.jointCustNo);
						formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
					}
					else if ( iserrno == 107 || iserrno == 113 )
					{
						sprintf(tmpStr, "Record/File locked on stjointtab" );
						formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
					}
					else
					{ 
						sprintf(tmpStr, "CISAM Error %d occured on stjointtab", iserrno);
						formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
					}
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
				isrelease(jointTabFile);
			}
			else
			{
				jointTabRec.custOpenSource = jointLogRec.custOpenSource;
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Before writing to jointTabFile (%d) ..\n", getDateTime(), PID, jointTabFile);
					fflush(logFp);
				}
				if ( isWrite(jointTabFile, &jointTabRec.liveChar) < 0)
				{
					fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] : ISWRITE error %d on stjointtab for key=%.7s%.2s\n", getDateTime(), PID, iserrno, jointTabRec.custNo,jointTabRec.jointCustNo);
					fflush(logFp);
					if  ( iserrno == 100 || iserrno == 108 )
					{
						sprintf(tmpStr, "Duplicate record [%.7s%.2s] on stjointtab", jointTabRec.custNo,jointTabRec.jointCustNo);
						formatSuperDecisionResponse(DUPLICATE, tmpStr, tmpStr);
					}
					else if ( iserrno == 107 || iserrno == 113 )
					{
						sprintf(tmpStr, "Record/File locked on stjointtab"); 
						formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
					}
					else
					{
						sprintf(tmpStr, "CISAM Error %d occured on stjointtab", iserrno);
						formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
					}
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
			}
		} /* while read jointcustlog NEXT is success */
	}  /* if noOfJoint > 0 */

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Joint Account Information are updated; committing all updates\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( iscommit() < 0 )
		{
			fprintf(logFp, "ISCOMMIT error %d; ignored\n", iserrno);
			fprintf(errLogFp, "%s : processSuperDecision : ISCOMMIT error %d ; ignored \n", getDateTime(), iserrno); 
			fflush(errLogFp);
		/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
			sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			unlink(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			sigsetmask(oldSigMask);
			return FAILURE;
		*/
		}
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
		islogclose();
		sigsetmask(oldSigMask);
		strcpy(tmpStr,"Successful");
		if ( extraDebug )
		{
			fprintf(logFp, "Supervisor update decision action successful\n");
			fflush(logFp);
		}
		closeAllFiles();
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] All Customer related updates are completed; proceeding to update accounts\n", getDateTime(), PID);

	/* update account details in acctLog */

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);

	strncpy(acctLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(acctLogRec.userId, custLogRec.userId,20);
	strncpy(acctLogRec.dateTime, custLogRec.dateTime,14);

	if ( extraDebug )
		fprintf(logFp, "account key  : %.38s\n", acctLogRec.branchCode);

	isindexinfo(acctLogFile, &acctLogKey,1);

	if ( isstart(acctLogFile,&acctLogKey,0,&acctLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		{
			fprintf(logFp,"%s|%5d|[processSaudiIndividualSuperDecision] : No Account details found for the key %.38s ignored\n", getDateTime(), PID, acctLogRec.branchCode);
			fflush(logFp);
			fprintf(errLogFp,"%s : processSuperDecision() : No Account details found for the key %.38s ignored\n", getDateTime(), acctLogRec.branchCode);
			fflush(errLogFp);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stacclog file", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
	}

	memset(ibanAccNo, ' ', sizeof ibanAccNo);
	while ( isRead(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
	{
		if (strncmp(receivedMsg.supDecision.branchCode,acctLogRec.branchCode,4) != 0 || strncmp(receivedMsg.supDecision.userId,acctLogRec.userId,10) != 0 || strncmp(receivedMsg.supDecision.dateTime,acctLogRec.dateTime,14) != 0)
			break;
	
		if ( acctLogRec.droppedAcc == '1' ) /* 1 for DroppedAcc */
			continue;

		sprintf(tmpStr,"%.5s%.7s%.2s",acctLogRec.accNo,custLogRec.custNo,"00");

		strncpy(acctLogRec.accNo,tmpStr,14);
		strncpy(acctLogRec.accOpenDate, bankingDate, 8);
		strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);

		if ( extraDebug )
			fprintf(logFp, "account number is %.14s\n", acctLogRec.accNo);

		strncpy(acctLogRec.supervisorId,receivedMsg.supDecision.supervisorId,10);
		acctLogRec.bmUpdateStatus = '9'; /* Added during phase II */
		strncpy(acctLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
		
		if( updateAcctLogFile(SUPERVISOR_ACTION) < 0 ) 
		{
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] stacclog update completed; About to update BM GL details\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Now Update BankMaster Account Info  */

		memset(bmAccRec.accNo, ' ', sizeof bmAccRec);

		strncpy(bmAccRec.accNo, acctLogRec.accNo, 14);
		/*strncpy(bmAccRec.branchCode, acctLogRec.branchCode,4);*/
		strncpy(bmAccRec.branchCode, acctLogRec.custBranchCode,4);/* MISYS */
		strncpy(bmAccRec.accountStatus, acctLogRec.accStatus, 2);
		strncpy(bmAccRec.statementFrequency, acctLogRec.statementFreq, 2);
		bmAccRec.residentCode = custLogRec.residentStatus;
		bmAccRec.customerType = custLogRec.custType;
		bmAccRec.checkBookRequired = acctLogRec.checkBook;
		bmAccRec.newOrUpdate = 'N'; /*  newOrUpdate flag is hard coded as 'N' as there is no update option on account in phase-I*/
		strncpy(bmAccRec.userId, receivedMsg.supDecision.userId, 10);
		strncpy(bmAccRec.supervisorId, receivedMsg.supDecision.supervisorId, 10);
		strncpy(bmAccRec.altBranchCode, bmCustRec.altBranchCode, 4);
		strncpy(bmAccRec.requestBranchCode, acctLogRec.branchCode, 4); /* to update it for the cheque book request */
		bmAccRec.nullPad = '\0';

		if ( (returnError = updateGld(bmAccRec)) != SUCCESS )
		{
			sprintf(tmpStr,"Error %d occured while updating AcctInfo in BM", returnError);
			fprintf(logFp,"%s|%5d|[processSaudiIndividualSuperDecision] :Error %d occured while updating AcctInfo in BM for the accNo [%.14s]\n", getDateTime(), PID,  returnError, bmAccRec.accNo);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
			sigsetmask(oldSigMask);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( strncmp(ibanAccNo, "                  ", 15) == 0 )
			strncpy(ibanAccNo, gldRec.iban, 24);
		/* Sucessfully updated in BankMaster  */
	}  /* while read acct log file == success  */ 

	strncpy(responseMsg.superDecision.ibanAccNo, ibanAccNo, 24);

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] All update for Accounts completed; proceeding to Card Information update\n", getDateTime(), PID);

	if ( custLogRec.cardType == ' ' || custLogRec.cardType == NULL ) /* if the request coming from old CSD version (before 2.5.9)*/
		custLogRec.cardType = 'I'; 

	if ( strncmp(receivedMsg.supDecision.custNo, "         ",7) )
	{
		if ( custLogRec.electronIntlRequired == '1' )
		{
			if ( updateCardRequest(custLogRec.cardType, 'N', 'P') == FAILURE )
			{
				sprintf(tmpStr,"Error occured while updating primary Intl cardInfo ");
				fprintf(logFp,"%s|%5d|[processSaudiIndividualSuperDecision] : Error occured while updating primary intl cardinfo for the card # [%.19s]\n", getDateTime(), PID, cardTabRec.cardNo);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
		}

		if ( custLogRec.electronIntlSuppRequired == '1' )
		{
			if ( updateCardRequest(custLogRec.cardType, 'N', 'S') == FAILURE )
			{
				sprintf(tmpStr,"Error occured while updating supplementary Intl cardInfo ");
				fprintf(logFp,"%s|%5d|[processSaudiIndividualSuperDecision] : Error occured while updating supplementary intl cardinfo for the card # [%.19s]\n", getDateTime(), PID, cardTabRec.cardNo);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
				sigsetmask(oldSigMask);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
		}
	}

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] Card Info updated. Committing all updates to database\n", getDateTime(), PID);

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSaudiIndividualSuperDecision] :ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(cRefLogFile);isclose(cRefTabFile);isclose(pbCustFile);isclose(heirLogFile);isclose(heirTabFile);
	custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=pbCustFileOpen=heirLogFileOpen=heirTabFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);
	if ( extraDebug )
	{
		fprintf(logFp, "Supervisor add decision successful\n");
		fflush(logFp);
	}
	closeAllFiles();
	formatSuperDecisionResponse(DONE, "Successful", "Successful");
	unlink(isLogPathName);
	free(isLogPathName);
	sendResponse(responseMsg.superDecision.msgLen);
	return SUCCESS;
}

updateBrCodeInGl(char *custNo, char *branchCode)
{
	char bmCustNo[10], oldPasswd;
	char tmpStr[50];

	if ( openGldFile(ISMANULOCK + ISINOUT)  < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openAcctLogFile(ISMANULOCK + ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(&gldRec.accNo[5], actualToBmCust(custNo, bmCustNo), 6);
	isindexinfo(gldFile, &gldKey, 3);
	isstart(gldFile, &gldKey, 0, &gldRec.liveChar, ISGTEQ);

	while ( isRead(gldFile, &gldRec.liveChar, ISNEXT) ==  0 )
	{
		if ( strncmp(&gldRec.accNo[5], bmCustNo, 6) )
			break;

		if ( gldRec.passwd == '2' || gldRec.passwd == '3' ) /* Account is closed */
			continue;

		if ( strncmp(gldRec.branchCode, branchCode, 4) == 0 ) /* If the account is already having this branch code, skip */
			continue;

		strncpy(gldRec.branchCode, branchCode, 4);

		if ( isRewcurr(gldFile, &gldRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| [updateBrCodeInGl] ISREWCURR error %d on gld0data for the account number [%.13s] \n", getDateTime(), PID, iserrno, gldRec.accNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while updating gld0data for the account [%.13s]", iserrno, gldRec.accNo);
			writeToExceptionReport(branchCode, "updateBrCodeInGl", tmpStr);
			continue; 
		}

		/* Now , write a record in stacclog for history purpose */

		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);

		acctLogRec.liveChar = '@';
		strncpy(acctLogRec.branchCode, receivedMsg.supDecision.branchCode, 4);
		strncpy(acctLogRec.userId, receivedMsg.supDecision.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.dateTime, tmpStr, 14);
		strncpy(acctLogRec.accNo, bmAccToActual(gldRec.accNo, tmpStr), 14);
		acctLogRec.newOrUpdate = 'U';
		strncpy(acctLogRec.supervisorId, "1_PEN_UPDATE   ", 10);
		sprintf(tmpStr, "0%c", gldRec.passwd);
		strncpy(acctLogRec.accStatus, tmpStr, 2);

		sprintf(tmpStr, "0%c", gldRec.samaAccStatus);
		strncpy(acctLogRec.samaAccStatus, tmpStr, 2);
		if ( gldRec.statementFrequency[0] == 'D' || gldRec.statementFrequency[0] == 'A' ) /* Daily */
			strncpy(acctLogRec.statementFreq, "02",2);
		else if ( gldRec.statementFrequency[0] == 'W' || gldRec.statementFrequency[0] == 'B' ) /* Weekly */
			strncpy(acctLogRec.statementFreq, "03",2);
		else if ( gldRec.statementFrequency[0] == 'M' || gldRec.statementFrequency[0] == 'C' ) /* Monthly */
			strncpy(acctLogRec.statementFreq, "04",2);
		else if ( gldRec.statementFrequency[0] == 'Q' || gldRec.statementFrequency[0] == 'E' ) /* Quarterly */
			strncpy(acctLogRec.statementFreq, "05",2);
		else if ( gldRec.statementFrequency[0] == 'H' || gldRec.statementFrequency[0] == 'F' ) /* Half yearly */
			strncpy(acctLogRec.statementFreq, "06",2);
		else if ( gldRec.statementFrequency[0] == 'Y' || gldRec.statementFrequency[0] == 'G' ) /* Yearly */
			strncpy(acctLogRec.statementFreq, "07",2);
		else if ( gldRec.statementFrequency[0] == 'N' || gldRec.statementFrequency[0] == 'I' ) /* Non-Auto */
			strncpy(acctLogRec.statementFreq, "01",2);

		if ( gldRec.statementFrequency[0] == 'M' || gldRec.statementFrequency[0] == 'C' )
		{
			if ( strncmp(&gldRec.statementFrequency[1], "01", 2) ==  0 )
				acctLogRec.statementDay = '0'; /* Branch Statement Day */
			else
				acctLogRec.statementDay = '1'; /* Month End */
		}
		else
			acctLogRec.statementDay = '0';

		acctLogRec.bmUpdateStatus = '9'; /* completed */ 
		strncpy(acctLogRec.custBranchCode, gldRec.branchCode, 4);
		strncpy(acctLogRec.creditLimit, gldRec.accLimit, 12);
		strncpy(acctLogRec.intLastRun, gldRec.intLastRun, 14);
		strncpy(acctLogRec.intApplDay, gldRec.intApplicationDay, 2);
		strncpy(acctLogRec.intFreqCode, gldRec.intApplicationFreq, 3);
		acctLogRec.inactiveAccFlag = gldRec.inactiveAccFlag;
		acctLogRec.intApplication = gldRec.intApplication;
		strncpy(acctLogRec.crIntRate, gldRec.crIntRate, 9);
		strncpy(acctLogRec.drIntRate, gldRec.drIntRate, 9);
		strncpy(acctLogRec.payAccNo, bmAccToActual(gldRec.payAccNo,tmpStr), 14);
		strncpy(acctLogRec.uniqueNo, gldRec.uniqueNo, 5);
		strncpy(acctLogRec.uniqueSub, gldRec.uniqueSubNo1, 2);

		acctLogRec.statusChanged = '0'; /* NO */
		strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
		strncpy(acctLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[updateBrCodeInGl] Before writing to acctLogFile (%d) ..\n", getDateTime(), PID, acctLogFile);
			fflush(logFp);
		}
		if ( isWrite(acctLogFile, &acctLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[BrCodeInGl] ISWRITE error %d occured on stacclog for the acc # [%.14s] [%.13s] \n", getDateTime(), PID, iserrno, acctLogRec.accNo, gldRec.accNo);
			fflush(logFp);
		}
	}

	return SUCCESS;
}

unblockCardForSama()
{
	char tmpStr[100];
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[unblockCardForSama] About to unblock the cards for customer %.7s\n", getDateTime(), PID, custTabRec.custNo);

	memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);

	isindexinfo(cardTabFile, &cardTabKey, 4);

	strncpy(&cardTabRec.bmAccNo[5], custTabRec.custNo, 7);

	isstart(cardTabFile, &cardTabKey, 0, &cardTabRec.liveChar, ISGTEQ);

	while ( isRead(cardTabFile, &cardTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(&cardTabRec.bmAccNo[5], custTabRec.custNo, 7) )
			break;

		if ( cardTabRec.cardStatus != '4' )
			continue;

		if ( cardTabRec.restrictedReason != '2' && cardTabRec.restrictedReason != '1' ) /* If the card is not restricted for SAMA, skip */
			continue;
			
		cardTabRec.cardStatus = '1'; /* Open */

		cardTabRec.requestType = '8'; /* Unrestrict */

		cardTabRec.restrictedReason = '0';

		if ( callB24Int() == FAILURE )
		{
			return FAILURE;
		}

		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);

		strncpy(cardTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		strncpy(cardTabRec.lastUpdateDateTime, tmpStr, 14);

		if ( updateCardTabFile() < 0 )
		{
			return FAILURE;
		}

		/* Now, write a record in stcardlog for history purpose */
		memset(&cardLogRec.liveChar, ' ', sizeof cardLogRec);

		cardLogRec.liveChar = '@';

		strncpy(cardLogRec.branchCode, cardTabRec.requestBranch, 4);
		strncpy(cardLogRec.userId, receivedMsg.supDecision.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(cardLogRec.dateTime, tmpStr, 14);

		cardLogRec.newOrUpdate = 'U'; 
		cardLogRec.bmUpdateStatus = '9'; /* Completed */
		strncpy(cardLogRec.supervisorId, "SAMA_UNBLK    ", 10);

		strncpy(cardLogRec.cardNo, cardTabRec.cardNo, 19);
		cardLogRec.requestStatus = '1'; /* Approved */

		strncpy(&cardLogRec.cardType, &cardTabRec.cardType, 374);
		cardLogRec.requestType = '8'; /* Unrestrict  */ 
		cardLogRec.restrictedReason = cardTabRec.restrictedReason;

		strncpy(cardLogRec.lastUpdateUser, "SAMA_UNBLK    ", 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(cardLogRec.lastUpdateDateTime, tmpStr, 14);
		strncpy(cardLogRec.processDateTime, cardTabRec.processDateTime,14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[unblockCardForSama] Before writing to cardLogFile (%d) ..\n", getDateTime(), PID, cardLogFile);
			fflush(logFp);
		}
		if ( isWrite(cardLogFile, &cardLogRec.liveChar) < 0 )
		{
			fprintf(logFp,"%s|%5d|[unblockCardForSama] ISWRITE error %d on stcardlog while creating the history record ,  key is [%.28s] and the card # is [%.19s] ignored \n", getDateTime(), PID, iserrno, cardLogRec.branchCode, cardLogRec.cardNo );
			fflush(logFp);
		}
	}

	return SUCCESS;
}

formatSaudiIndividualDetailResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120], tmpARemarks[55], tmpERemarks[55];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatSaudiIndividualDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}
	sprintf(tmpARemarks, "%-50.50s", aRemarks);
	sprintf(tmpERemarks, "%-50.50s", eRemarks);
    
	strncpy(responseMsg.saudiIndividualPendingDetail.status,responseCode,3);
	strncpy(responseMsg.saudiIndividualPendingDetail.service,receivedMsg.pendingDetail.service,2);
	strncpy(responseMsg.saudiIndividualPendingDetail.aRemarks,tmpARemarks,50);
	strncpy(responseMsg.saudiIndividualPendingDetail.eRemarks,tmpARemarks,50);
    responseMsg.saudiIndividualPendingDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.saudiIndividualPendingDetail.msgLen));
	strncpy(responseMsg.saudiIndividualPendingDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
	      iscleanup();
		  fclose(logFp);
	}
	return SUCCESS;
}

logSaudiIndividualCustomerDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Individual Saudi Customer Detail]\n", receivedMsg.saudiIndividual.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.saudiIndividual.branchCode); 
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.saudiIndividual.userId);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.saudiIndividual.dateTime);
	fprintf(logFp, "Creation Or Update Flag  : %c\n", receivedMsg.saudiIndividual.creationOrUpdate);
	fprintf(logFp, "bm Update Status	: %c\n", receivedMsg.saudiIndividual.bmUpdateStatus);
	fprintf(logFp, "New Or Update Flag	: %c\n", receivedMsg.saudiIndividual.newOrUpdate);
	
	fprintf(logFp, "SAMA main category	: %.2s\n", receivedMsg.saudiIndividual.samaMainCategory);
	fprintf(logFp, "SAMA sub category	: %.2s\n", receivedMsg.saudiIndividual.samaSubCategory);

	fprintf(logFp, "Customer Number		: %.7s\n", receivedMsg.saudiIndividual.custNo);
	fprintf(logFp, "Supervisor Id		: %.10s\n", receivedMsg.saudiIndividual.supervisorId);
	fprintf(logFp, "Customer Branch Code : %.4s\n", receivedMsg.saudiIndividual.custBranchCode);
	fprintf(logFp, "Alternative Branch Code : %.4s\n", receivedMsg.saudiIndividual.altBranchCode);
	fprintf(logFp, "Package Acc Flag    : %c\n", receivedMsg.saudiIndividual.packageAcc);
	fprintf(logFp, "Branch CSO ID       : [%.10s]\n", receivedMsg.saudiIndividual.branchCsoId);
	fprintf(logFp, "Branch ActionDt&Time: [%.14s]\n", receivedMsg.saudiIndividual.branchActionDateTime);
	fprintf(logFp, "Activity Flag       : [%c]\n", receivedMsg.saudiIndividual.activityFlag);
	fflush(logFp);
}

readIdTabFile(mode)
int mode;
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|[readIdTabFile] for customer no [%.7s] and id Type,No [%c,%.15s]; id Category [%c] and id Ref No [%.4s]\n", getDateTime(), PID, idTabRec.custNo, idTabRec.idType, idTabRec.idNo, idTabRec.idCategory, idTabRec.idRefNo);
	fflush(logFp);
	if ( isRead(idTabFile, &idTabRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readIdTabFile] ISREAD/%s error %d on stidtab for customer no=%.7s and idType, idNo [%c,%.16s]\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key on stidtab");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached on stidtab");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stidtab");
			formatBranchResponse(RECORD_LOCKED,  tmpStr,tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}
