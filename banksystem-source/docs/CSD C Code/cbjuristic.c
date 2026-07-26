/*
	Objective       :       Static data maintenance server 
				            (Modules related to Juristic customer opening)

	Date            :       03/08/2003.

	Author          :       S. Rajesh.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
---------------------------------------------------------------------
1.1		Mohit		13-Dec-2006		Under Quick Pension Customer opening
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

#define INDIVIDUAL_SAUDI		'1'
#define INDIVIDUAL_OTHERS 		'2'
#define JURISTIC		 		'3'
#define EMBASSIES		 		'4'
#define DIPLOMATS		 		'5'
#define NON_RESIDENT_JURISTIC	'6'
#define QUICK_CUSTOMER			'7'
#define INTERNAL_CUSTOMER		'8'
#define PENSION_CUSTOMER		'9'		/* Ver 1.1 */
#define INDIVIDUAL_HEIR			'A'

#define ARABIC			'0'
#define ENGLISH			'1'

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define IDEXPIRYACTION		0
#define CUSTUPDACTION		1

extern struct keydesc  userKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerLogKey, ownerTabKey, idTabKey1, o3dKey, heirLogKey, heirTabKey;
struct dictinfo fileInfo;
extern int   userFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerLogFile, ownerTabFile, idTabFile1, o3dFile, heirLogFile, heirTabFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;
extern int hsmKey1, hsmKey2, b24Key1, b24Key2;
extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath;

extern  int page, line;
extern 	char pinOffset[4], trk1[80], trk2[40];

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];
extern char ignoreMemoForBrnUpd[500];
char tCustNo[15];

struct branchActivityOnCustomer		custLogRec, custLogRec1 ;
struct branchActivityOnJointAccounts jointLogRec;
struct branchActivityOnAccounts 	acctLogRec;
struct branchInfo					ctlRec;
struct userProfile					userRec;
struct refreshInfo					refreshRec;
struct customerInfo					custTabRec;
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
struct branchActivityOnId			idLogRec;
struct branchActivityOnAddress		addrLogRec;
struct calendarInfo					calendarRec;
struct idInfo						idTabRec, idTabRec1;
struct addressInfo					addrTabRec;
struct branchActivityOnSignatory	signLogRec;
struct signatoryInfo				signTabRec;
struct branchActivityOnOwner		ownerLogRec;
struct ownerInfo					ownerTabRec;
struct categoryConfig				categoryConfigRec;
struct branchActivityOnCustRef		cRefLogRec;
struct customerReferenceInfo		cRefTabRec;
struct o2d0data						o3dRec;
struct acctBm						acctBmRec;
struct branchActivityOnHeir			heirLogRec;
struct heirInfo						heirTabRec;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen, ownerLogFileOpen, ownerTabFileOpen, heirLogFileOpen, heirTabFileOpen;

updateIdLogForJuristic()
{
	char tmpStr[100], tmpStr1[50];
	int idFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateIdLogForJuristic]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	idLogRec.liveChar = '@';
	strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
	strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
	strncpy(idLogRec.custNo, custLogRec.custNo,  7);
	idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
	idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
	strncpy(idLogRec.idRefNo, "0000", 4);

	idLogRec.idCategory = 'C'; /* Customer */

	idFoundFlag = NO;
	idLogRec.idType = 'C';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'C' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.crNo, "                                 ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('C');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'C';
		strncpy(idLogRec.idNo, receivedMsg.juristic.crNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.juristic.crIssuedAt,20);
		idLogRec.idDateType = receivedMsg.juristic.crDateType;
		if( receivedMsg.juristic.crDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.crIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.crIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.crExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.crExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.crIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.crIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE ) 
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.crExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.crExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'L';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'L' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	/* Write License details if available */
	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.licNo, "                   ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('L');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'L';
		strncpy(idLogRec.idNo, receivedMsg.juristic.licNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.licDateType;
		if( receivedMsg.juristic.licDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.licIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.licIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.licExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.licExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.licIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.licIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.licExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.licExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'S';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'S' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}
	/* Write Sama authorization number details if available */
	if ( strncmp(receivedMsg.juristic.samaAuthNo, "                          ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('S');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'S';  /* Sama Authorization number */
		strncpy(idLogRec.idNo, receivedMsg.juristic.samaAuthNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.samaAuthDateType;
		if( receivedMsg.juristic.samaAuthDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.samaAuthIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.samaAuthIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.samaAuthExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.samaAuthExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.samaAuthIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.samaAuthIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.samaAuthExpiryDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.samaAuthExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}

		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'P';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'P' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	/* Write Passport number details if available */
	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.ppNo, "                                 ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('P');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'P';
		strncpy(idLogRec.idNo, receivedMsg.juristic.ppNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.ppDateType;
		if( receivedMsg.juristic.ppDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.ppIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.ppIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.ppExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.ppExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.ppIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.ppIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.ppExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.ppExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'D';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'D' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';
	/* Write Diplomatic Card  number details if available */

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.dcNo, "                                 ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('D');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'D';
		strncpy(idLogRec.idNo, receivedMsg.juristic.dcNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.dcDateType;
		if( receivedMsg.juristic.dcDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.dcIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.dcIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.dcExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.dcExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.dcIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.dcIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.dcExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.dcExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'V';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'V' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';
	/* Write Visa number details if available */
	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.visaNo, "                                 ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('V');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'V';
		strncpy(idLogRec.idNo, receivedMsg.juristic.visaNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.visaDateType;
		if( receivedMsg.juristic.visaDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.visaIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.visaIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.visaExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.visaExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.visaIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.visaIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.visaExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.visaExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}


	idFoundFlag = NO;
	idLogRec.idType = 'T';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'T' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';
	/* Write Contract number details if available */
	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.contractNo, "                                 ", 15) )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('T');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'T';
		strncpy(idLogRec.idNo, receivedMsg.juristic.contractNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.contractDateType;
		if( receivedMsg.juristic.contractDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.contractIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.contractIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.contractExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.contractExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.contractIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.contractIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.contractExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.contractExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'A'; /* Approval Document reference number */
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.juristic.dateTime, 14) ||
			 idLogRec.idType != 'A' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(idLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( strncmp(receivedMsg.juristic.approvalRefNo, "                 ", 15) && receivedMsg.juristic.approvalRefNo[0] != NULL )
	{
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('A');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'A';
		strncpy(idLogRec.idNo, receivedMsg.juristic.approvalRefNo, 15);
		idLogRec.idDateType = receivedMsg.juristic.appDateType;
		if( receivedMsg.juristic.appDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.juristic.appIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.appIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.juristic.appExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.appExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.juristic.appIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.juristic.appIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE ) 
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.juristic.appExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.juristic.appExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.idRefName, receivedMsg.juristic.appRefName, 30);
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForJuristic] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	return SUCCESS;
}

updateAddrLogForJuristic()
{
	char tmpStr[100];
	int addressFoundFlag =NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode,receivedMsg.juristic.branchCode,4);
	strncpy(addrLogRec.userId, receivedMsg.juristic.userId,10);
	strncpy(addrLogRec.dateTime,receivedMsg.juristic.dateTime,14);
	strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
	addrLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
	addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
	/*strncpy(addrLogRec.supervisorId, receivedMsg.juristic.supervisorId, 10);*/
	strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */

	/* Write the customer local address */
	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.juristic.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "00", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}
	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(addrLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(addrLogRec.dateTime,receivedMsg.juristic.dateTime,14);
		strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
		addrLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
		addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		/*strncpy(addrLogRec.supervisorId, receivedMsg.juristic.supervisorId, 10);*/
		strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */
	}
	if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
		 receivedMsg.juristic.newOrUpdate == 'U' )
	{
		retStatus = checkAddrTabExistance("00"); /* Check the existance of local address in staddrtab */
		if ( retStatus == SUCCESS )
			addrLogRec.newOrUpdate = 'U';
		else
			addrLogRec.newOrUpdate = 'N';
	}

	strncpy(addrLogRec.addressType, "00", 2);

	addrLogRec.addrType = receivedMsg.juristic.addressType;
	if ( receivedMsg.juristic.addressType == '1' ) /* Saudi Postal address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.juristic.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.juristic.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.juristic.poBox, 5);
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.juristic.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.juristic.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.juristic.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.juristic.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.juristic.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.juristic.country, 3);
	if ( strncmp(receivedMsg.juristic.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode,receivedMsg.juristic.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.juristic.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.juristic.telOffExt, 4);
	if ( strncmp(receivedMsg.juristic.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode,receivedMsg.juristic.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.juristic.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.juristic.telHomeExt, 4);
	if ( strncmp(receivedMsg.juristic.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode,receivedMsg.juristic.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.juristic.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.juristic.faxExt, 4);
	if ( strncmp(receivedMsg.juristic.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo,receivedMsg.juristic.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.juristic.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.juristic.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(addrLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
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
			fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] Before writing to AddrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
			fflush(logFp);
		}
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}

	/* Now, write the customer's abroad address in staddrlog if available */
	addressFoundFlag = NO;
	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, receivedMsg.juristic.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.juristic.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.juristic.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "01", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}
	if ( addressFoundFlag == NO && receivedMsg.juristic.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( strncmp(receivedMsg.juristic.homeAddress1, "                                 ", 30) &&
		 strncmp(receivedMsg.juristic.homePoBox, "               ", 10 ) && 
		 strncmp(receivedMsg.juristic.homeCityName, "                          ", 20) && 
		 strncmp(receivedMsg.juristic.homeZipCode, "             ", 10) )
	{
		if ( addressFoundFlag == NO )
		{
			memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

			addrLogRec.liveChar = '@';
			strncpy(addrLogRec.branchCode,receivedMsg.juristic.branchCode,4);
			strncpy(addrLogRec.userId, receivedMsg.juristic.userId,10);
			strncpy(addrLogRec.dateTime,receivedMsg.juristic.dateTime,14);
			strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
			addrLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
			addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
			/*strncpy(addrLogRec.supervisorId, receivedMsg.juristic.supervisorId, 10);*/
			strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */
		}
		if ( receivedMsg.juristic.creationOrUpdate == 'C' && 
			 receivedMsg.juristic.newOrUpdate == 'U' )
		{
			retStatus = checkAddrTabExistance("01"); /* Check the existance of local address in staddrtab */
			if ( retStatus == SUCCESS )
				addrLogRec.newOrUpdate = 'U';
			else
				addrLogRec.newOrUpdate = 'N';
		}
		strncpy(addrLogRec.addressType, "01", 2);

		strncpy(addrLogRec.address1, receivedMsg.juristic.homeAddress1, 30);
		strncpy(addrLogRec.address2, receivedMsg.juristic.homeAddress2, 30);
		strncpy(addrLogRec.poBox, receivedMsg.juristic.homePoBox, 10);
		strncpy(addrLogRec.cityName, receivedMsg.juristic.homeCityName, 20);
		strncpy(addrLogRec.zipCode, receivedMsg.juristic.homeZipCode, 10);
		strncpy(addrLogRec.country, receivedMsg.juristic.homeCountry, 3);
		if ( strncmp(receivedMsg.juristic.homeTelOffNo, "           ", 10) )
			strncpy(addrLogRec.telOffAreaCode,receivedMsg.juristic.homeTelOffAreaCode,4);
		strncpy(addrLogRec.telOffNo, receivedMsg.juristic.homeTelOffNo, 10);
		strncpy(addrLogRec.telOffExt, receivedMsg.juristic.homeTelOffExt, 4);
		if ( strncmp(receivedMsg.juristic.homeTelHomeNo, "           ", 10) )
			strncpy(addrLogRec.telHomeAreaCode,receivedMsg.juristic.homeTelHomeAreaCode,4);
		strncpy(addrLogRec.telHomeNo, receivedMsg.juristic.homeTelHomeNo, 10);
		strncpy(addrLogRec.telHomeExt, receivedMsg.juristic.homeTelHomeExt, 4);
		if ( strncmp(receivedMsg.juristic.homeFaxNo, "           ", 10) )
			strncpy(addrLogRec.faxAreaCode,receivedMsg.juristic.homeFaxAreaCode,4);
		strncpy(addrLogRec.faxNo, receivedMsg.juristic.homeFaxNo, 10); 
		strncpy(addrLogRec.faxExt, receivedMsg.juristic.homeFaxExt, 4);
		if ( strncmp(receivedMsg.juristic.homeMobileNo, "05         ", 10) )
			strncpy(addrLogRec.mobileNo,receivedMsg.juristic.homeMobileNo,10);
		strncpy(addrLogRec.pagerNo, receivedMsg.juristic.homePagerNo, 10);
		strncpy(addrLogRec.eMail, receivedMsg.juristic.homeEmail, 30);

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( addressFoundFlag == YES )
		{
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] Before writing to AddrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
				fflush(logFp);
			}
			if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	else
	{
		if ( addressFoundFlag == YES )
		{
			if ( isDelcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForJuristic] ISDELCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	return SUCCESS;
}

processJuristicCustRequest() 
{
	char tmpStr[100], tmpStr1[100];
	char recdIdType, recdIdNo[20];
	char recdIdIssuedAt[25], recdIdDateType, recdIdIssueDateH[10], recdIdIssueDateG[10] ;
	char recdIdExpiryDateH[10], recdIdExpiryDateG[10], tmpCustNo[20] ;
	int i, mode,pendingStatus;
	int noOfOwner = 0, noOfSignatory = 0, oneManOwner=NO, saudiSignatoryFound=NO;
	char *isLogPathName;
	int zeroUpdateReqd=NO;
	int isalicLogFp ;
	int errorNo;
	long oldSigMask;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.juristic.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.juristic.dateTime);
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

	if ( acctLogFileOpen == YES )
	{
		isclose(acctLogFile);
		acctLogFileOpen=NO;
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
	if ( (isalicLogFp = creat(isLogPathName, 0660)) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while creating CISAM log file ", errno);
		formatBranchResponse( INTERNALERR, tmpStr, tmpStr );
		sigsetmask(oldSigMask);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	close(isalicLogFp);
	if ( islogopen(isLogPathName) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] ISBEGIN error %d;  while customer creation \n", getDateTime(), PID, iserrno);
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

	if ( openCtlFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); 
		custLogFileOpen=ctlFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAcctLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);
		custLogFileOpen=ctlFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCalendarFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCustTabFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openOwnerLogFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openSignLogFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	/* temporary fix for Phase-II; valid until the client is changed */

	if ( strncmp(receivedMsg.juristic.altBranchCode, "-Inv",4) ==  0 || receivedMsg.juristic.altBranchCode[0] == NULL )
		strncpy(receivedMsg.juristic.altBranchCode, "000000", 4);

	/* Phase-II fixes - ends here */

	memset(&custLogRec.liveChar,' ',sizeof custLogRec);

	if ( receivedMsg.juristic.newOrUpdate == 'U' && 
		 receivedMsg.juristic.creationOrUpdate == 'C' )
	{
		pendingStatus = checkPendingStatus(receivedMsg.juristic.custNo);
		if( pendingStatus == SUCCESS )
		{
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Customer [%.7s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, receivedMsg.juristic.custNo, custLogRec.bmUpdateStatus, custLogRec.userId, custLogRec.branchCode);
			fflush(logFp);
			if ( custLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", custLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", custLogRec.userId, custLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		zeroUpdateReqd = checkZeroUpdateReqd(receivedMsg.juristic.custNo);

		if ( zeroUpdateReqd == YES )
		{
			memset(&custTabRec.liveChar, ' ', sizeof(custTabRec));
			strncpy(custTabRec.custNo, receivedMsg.juristic.custNo, 7);
			isindexinfo(custTabFile, &custTabKey, 1);
			isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);
			if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicCustRequest]: ISREAD/ISEQUAL error %d on stcusttab while reading for the customer [%.7s]  to write 0th update record in stcustlog ;IGNORED\n", getDateTime(), PID, iserrno,custTabRec.custNo);
				fflush(logFp);
			}
			else
			{
				memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

				/*strncpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);*/
				custLogRec1.liveChar = '@';
				strncpy(custLogRec1.branchCode, receivedMsg.juristic.homeBranch, 4);
				strncpy(custLogRec1.userId, "MIGRATION              ",20);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(custLogRec1.dateTime, tmpStr, 14);
				custLogRec1.bmUpdateStatus = '9'; 
				strncpy(custLogRec1.custNo, custTabRec.custNo, 7);
				strncpy(custLogRec1.supervisorId, "MIGRATION              ", 20);
				strncpy(custLogRec1.custBranchCode, custTabRec.branchCode, 4);

				strncpy(custLogRec1.idNo,custTabRec.idNo,1024);
				custLogRec1.custType = custTabRec.custType;
				strncpy(custLogRec1.samaMainCategory, custTabRec.samaMainCategory, 4);
				strncpy(custLogRec1.lastUpdateUser,custTabRec.lastUpdateUser,34);
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Before writing to custLogFile (%d) for 0th Update..\n", getDateTime(), PID, custLogFile);
					fflush(logFp);
				}
				if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicCustRequest] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
					fflush(logFp);
					fprintf(errLogFp, "%s : processJuristicCustRequest :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]\n", getDateTime(), iserrno,custLogRec1.branchCode);
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
		strncpy(custLogRec.branchCode,receivedMsg.juristic.branchCode, 4);
		strncpy(custLogRec.userId, receivedMsg.juristic.userId, 10);
		strncpy(custLogRec.dateTime,receivedMsg.juristic.dateTime, 14);
		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicCustRequest] No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), PID, custLogRec.branchCode);
				fflush(logFp);
				fprintf(errLogFp, "%s :processCustRequest(): No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), custLogRec.branchCode);
				fflush(errLogFp);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processJuristicCustRequest] CISAM Error %d occured on stcustlog for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode);
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
				isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	recdIdType = ' ';
	memset(recdIdNo, ' ', sizeof recdIdNo);
	memset(recdIdIssuedAt, ' ', sizeof recdIdIssuedAt);
	recdIdDateType = ' ';
	memset(recdIdIssueDateH, ' ', sizeof recdIdIssueDateH);
	memset(recdIdIssueDateG, ' ', sizeof recdIdIssueDateG);
	memset(recdIdExpiryDateH, ' ', sizeof recdIdExpiryDateH);
	memset(recdIdExpiryDateG, ' ', sizeof recdIdExpiryDateG);
	if ( receivedMsg.juristic.screenSetNo == JURISTIC || receivedMsg.juristic.screenSetNo == EMBASSIES )
	{
		if ( strncmp(receivedMsg.juristic.crNo, "                      ", 15) )
		{
			recdIdType = 'C';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.crNo);
			sprintf(recdIdIssuedAt, "%.20s", receivedMsg.juristic.crIssuedAt);
			recdIdDateType = receivedMsg.juristic.crDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.crIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.crIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.crExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.crExpiryDateG);
		}
		else if (strncmp(receivedMsg.juristic.licNo, "                      ", 15) )
		{
			recdIdType = 'L';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.licNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.licDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.licIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.licIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.licExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.licExpiryDateG);
		}
		else if ( strncmp(receivedMsg.juristic.samaAuthNo, "                   ", 15) )
		{
			recdIdType = 'S';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.samaAuthNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.samaAuthDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.samaAuthIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.samaAuthIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.samaAuthExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.samaAuthExpiryDateG);
		}
	}
	else if ( receivedMsg.juristic.screenSetNo == DIPLOMATS )
	{
		if ( strncmp(receivedMsg.juristic.ppNo, "                      ", 15) )
		{
			recdIdType = 'P';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.ppNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.ppDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.ppIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.ppIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.ppExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.ppExpiryDateG);
		}
		else if (strncmp(receivedMsg.juristic.dcNo, "                      ", 15) )
		{
			recdIdType = 'D';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.dcNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.dcDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.dcIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.dcIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.dcExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.dcExpiryDateG);
		}
		else if ( strncmp(receivedMsg.juristic.visaNo, "                        ", 15) )
		{
			recdIdType = 'V';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.visaNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.visaDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.visaIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.visaIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.visaExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.visaExpiryDateG);
		}
	}
	else if ( receivedMsg.juristic.screenSetNo == NON_RESIDENT_JURISTIC)
	{
		if ( strncmp(receivedMsg.juristic.licNo, "                      ", 15) )
		{
			recdIdType = 'L';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.licNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.licDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.licIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.licIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.licExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.licExpiryDateG);
		}
		else if ( strncmp(receivedMsg.juristic.contractNo, "                        ", 15) )
		{
			recdIdType = 'T';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.contractNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.contractDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.contractIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.contractIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.contractExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.contractExpiryDateG);
		}
		else if ( strncmp(receivedMsg.juristic.samaAuthNo, "                        ", 15) )
		{
			recdIdType = 'S';
			sprintf(recdIdNo, "%.15s", receivedMsg.juristic.samaAuthNo);
			sprintf(recdIdIssuedAt, "%20s", " ");
			recdIdDateType = receivedMsg.juristic.samaAuthDateType;
			sprintf(recdIdIssueDateH, "%.8s", receivedMsg.juristic.samaAuthIssueDateH);
			sprintf(recdIdIssueDateG, "%.8s", receivedMsg.juristic.samaAuthIssueDateG);
			sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.juristic.samaAuthExpiryDateH);
			sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.juristic.samaAuthExpiryDateG);
		}
	}

	if( receivedMsg.juristic.creationOrUpdate == 'U' )
	{
		strncpy(custLogRec.branchCode,receivedMsg.juristic.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.juristic.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.juristic.dateTime,14);

		if ( readCustLogFile(ISEQUAL) < 0 )
		{
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
	     	sendResponse(responseMsg.customer.msgLen);
	     	return FAILURE;
		}

	}

	custLogRec.liveChar = '@';
	strncpy(custLogRec.branchCode,receivedMsg.juristic.branchCode,4);
	strncpy(custLogRec.userId, receivedMsg.juristic.userId,10);
	strncpy(custLogRec.dateTime,receivedMsg.juristic.dateTime,14);
	custLogRec.newOrUpdate = receivedMsg.juristic.newOrUpdate;
	custLogRec.bmUpdateStatus = receivedMsg.juristic.bmUpdateStatus;
	if ( receivedMsg.juristic.newOrUpdate == 'N' && receivedMsg.juristic.creationOrUpdate == 'C' )
	{
		memset(tmpCustNo, NULL, sizeof tmpCustNo);
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Getting next customer number \n", getDateTime(), PID);
		if ( getNextCustNoFromCtl(tmpCustNo) == FAILURE )
		{
			isrollback();
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Obtained number=%.7s\n", getDateTime(), PID, tmpCustNo);
		strncpy(custLogRec.custNo, tmpCustNo, 7);
	}
	else
		strncpy(custLogRec.custNo, receivedMsg.juristic.custNo,7);

	if ( receivedMsg.juristic.creationOrUpdate == 'C' )
	{
		custLogRec.foundInAList = '0';
		custLogRec.foundInBList = '0';
		custLogRec.foundInCList = '0';

		/* Now, check for existance of the customer in stcusttab */

		if ( checkSarCustomerExistance(recdIdType, recdIdNo) == FAILURE )
		{
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	strncpy(custLogRec.supervisorId,receivedMsg.juristic.supervisorId,10);
	strncpy(custLogRec.custBranchCode,receivedMsg.juristic.custBranchCode,4);
	strncpy(custLogRec.samaMainCategory, receivedMsg.juristic.samaMainCategory, 2);
	strncpy(custLogRec.samaSubCategory, receivedMsg.juristic.samaSubCategory, 2);
	custLogRec.preferredLang = receivedMsg.juristic.preferredLang;
	strncpy(custLogRec.nationality,receivedMsg.juristic.nationality,3);

	if ( recdIdType == 'C' ) /* CR Number */
	{
		strncpy(custLogRec.crNo,receivedMsg.juristic.crNo,15);
		strncpy(custLogRec.crIssuedAt,receivedMsg.juristic.crIssuedAt,20);
		strncpy(custLogRec.crIssueDateH,receivedMsg.juristic.crIssueDateH,8);
		strncpy(custLogRec.crIssueDateG,receivedMsg.juristic.crIssueDateG,8);
		custLogRec.crIssueDateType = receivedMsg.juristic.crDateType;
	}

	strncpy(custLogRec.idNo,recdIdNo,15);
	custLogRec.idType = recdIdType; 
	custLogRec.idDateType = recdIdDateType;

	strncpy(custLogRec.idIssuedAt,recdIdIssuedAt, 20);
	if( recdIdDateType == HIJRI ) 
	{	
		strncpy(custLogRec.idIssueDateH,recdIdIssueDateH,8);
		sprintf(tmpStr, "%.8s", recdIdIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr,tmpStr1); 
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.idIssueDateG,tmpStr1,8);
		strncpy(custLogRec.idExpiryDateH,recdIdExpiryDateH,8);
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
		strncpy(custLogRec.idExpiryDateG,recdIdExpiryDateG,8);
		sprintf(tmpStr, "%.8s", recdIdExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.idExpiryDateH,tmpStr1,8);
	}

	custLogRec.dobDateType  = receivedMsg.juristic.doeDateType;

	if ( receivedMsg.juristic.doeDateType == HIJRI ) 
	{
		strncpy(custLogRec.dobDateH,receivedMsg.juristic.doeDateH,8);
		sprintf(tmpStr,"%.8s", receivedMsg.juristic.doeDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.dobDateG, tmpStr1, 8);
	}
	else
	{
		strncpy(custLogRec.dobDateG,receivedMsg.juristic.doeDateG,8);
		sprintf(tmpStr,"%.8s", receivedMsg.juristic.doeDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.dobDateH, tmpStr1, 8);
	}

	custLogRec.residentStatus = receivedMsg.juristic.residentStatus;
	strncpy(custLogRec.businessType,receivedMsg.juristic.businessType,3);
	strncpy(custLogRec.purposeOfAccount, receivedMsg.juristic.purposeOfAccount, 50);
	strncpy(custLogRec.govtShareHoldingPerc, receivedMsg.juristic.govtShareHoldingPerc,3);
	strncpy(custLogRec.saudiShareHoldingPerc, receivedMsg.juristic.saudiShareHoldingPerc, 3);
	strncpy(custLogRec.foreignShareHoldingPerc, receivedMsg.juristic.foreignShareHoldingPerc, 3);

	strncpy(custLogRec.aOrgName1,receivedMsg.juristic.aOrgName1,30);
	strncpy(custLogRec.aOrgName2,receivedMsg.juristic.aOrgName2,30);
	strncpy(custLogRec.aOrgShortName,receivedMsg.juristic.aOrgShortName,30);
	strncpy(custLogRec.eOrgName1,receivedMsg.juristic.eOrgName1,30);
	strncpy(custLogRec.eOrgName2,receivedMsg.juristic.eOrgName2,30);
	strncpy(custLogRec.eOrgShortName,receivedMsg.juristic.eOrgShortName,30);
	strncpy(custLogRec.orgAlphaSearchCode, receivedMsg.juristic.alphaSearchCode, 6);

	custLogRec.addressType = receivedMsg.juristic.addressType;
	if ( receivedMsg.juristic.addressType == '1' ) /* Saudi POST */
	{
		strncpy(custLogRec.unitNo, receivedMsg.juristic.poBox, 5); /* The first 5 digits of POBOX is unit No */
		strncpy(custLogRec.gprsNo, receivedMsg.juristic.address1, 5); /* The first 5 digits of address1 is GPRS No */
		strncpy(custLogRec.poBox, receivedMsg.juristic.poBox, 5); 

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.juristic.address1[5] == '-' )
			receivedMsg.juristic.address1[5] = ' ';
	}
	else
		strncpy(custLogRec.poBox,receivedMsg.juristic.poBox,10);

    strncpy(custLogRec.address1,receivedMsg.juristic.address1,30);
	strncpy(custLogRec.address2,receivedMsg.juristic.address2,30);
	strncpy(custLogRec.cityName,receivedMsg.juristic.cityName,20);
	strncpy(custLogRec.zipCode,receivedMsg.juristic.zipCode,10);
	strncpy(custLogRec.country,receivedMsg.juristic.country,3);
	if ( strncmp(receivedMsg.juristic.telOffNo, "           ", 10) )
		strncpy(custLogRec.telOffAreaCode,receivedMsg.juristic.telOffAreaCode,4);
	strncpy(custLogRec.telOffNo,receivedMsg.juristic.telOffNo,10);
	strncpy(custLogRec.telOffExt,receivedMsg.juristic.telOffExt,4);
	if ( strncmp(receivedMsg.juristic.telHomeNo, "           ", 10) )
		strncpy(custLogRec.telHomeAreaCode,receivedMsg.juristic.telHomeAreaCode,4);
	strncpy(custLogRec.telHomeNo,receivedMsg.juristic.telHomeNo,10);
	strncpy(custLogRec.telHomeExt,receivedMsg.juristic.telHomeExt,4);
	if ( strncmp(receivedMsg.juristic.faxNo, "           ", 10) )
		strncpy(custLogRec.faxAreaCode,receivedMsg.juristic.faxAreaCode,4);
	strncpy(custLogRec.faxNo,receivedMsg.juristic.faxNo,10);
	strncpy(custLogRec.faxExt,receivedMsg.juristic.faxExt,4);
	if ( strncmp(receivedMsg.juristic.mobileNo, "05         ", 10) )
		strncpy(custLogRec.mobileNo,receivedMsg.juristic.mobileNo,10);
	strncpy(custLogRec.pagerNo,receivedMsg.juristic.pagerNo,10);
	strncpy(custLogRec.eMail,receivedMsg.juristic.eMail,30);

	/* The Below two lines were added on 8th May to avoid getting updated by bmstrecon program */
	custLogRec.vipCode = '0';
	strncpy(custLogRec.titleCode, "00", 2);

	strncpy(custLogRec.documentsSupplied,receivedMsg.juristic.documents,60);
	strncpy(custLogRec.documentOther,receivedMsg.juristic.documentOther,50);
	custLogRec.signatureNature = receivedMsg.juristic.signatureNature;

	strncpy(custLogRec.supervisorComments,receivedMsg.juristic.supervisorComments,200);

	custLogRec.custType = '1'; /* customer type is moved as Corporate since the existing version should display correctly*/
	strncpy(custLogRec.altBranchCode, receivedMsg.juristic.altBranchCode,4);
	custLogRec.internetBankAcc = receivedMsg.juristic.internetBankAcc;
	custLogRec.custAdviceFlag = receivedMsg.juristic.custAdviceFlag;

	custLogRec.updatedForSama = receivedMsg.juristic.updatedForSama; 
	strncpy(custLogRec.relationshipManager, receivedMsg.juristic.relationshipManager, 25); 
	strncpy(custLogRec.generalMemo, receivedMsg.juristic.generalMemo, 25); 
	if ( receivedMsg.juristic.marketingMemo[0] != NULL ) /* to support the previous version */
		strncpy(custLogRec.marketingMemo, receivedMsg.juristic.marketingMemo, 25);

	strncpy(custLogRec.passportNo, receivedMsg.juristic.ppNo, 15);
	strncpy(custLogRec.visaNo, receivedMsg.juristic.visaNo, 15);
	strncpy(custLogRec.diplomaticCardNo, receivedMsg.juristic.dcNo, 15);
	strncpy(custLogRec.licenseNo, receivedMsg.juristic.licNo, 15);
	strncpy(custLogRec.samaAuthNo, receivedMsg.juristic.samaAuthNo, 15);
	strncpy(custLogRec.contractNo, receivedMsg.juristic.contractNo, 15);
	if ( receivedMsg.juristic.approvalRefNo[0] != NULL )
		strncpy(custLogRec.approvalRefNo, receivedMsg.juristic.approvalRefNo, 15);
	custLogRec.overrideForExistingCust = custLogRec.existingCustomer;
	if ( receivedMsg.juristic.accFreezingGracePeriod[0] != NULL )
		strncpy(custLogRec.accFreezingGracePeriod, receivedMsg.juristic.accFreezingGracePeriod, 3);

    memset(&categoryConfigRec.liveChar, ' ', sizeof categoryConfigRec);

	strncpy(categoryConfigRec.recType, "CC", 2);
	strncpy(categoryConfigRec.samaMainCategory, custLogRec.samaMainCategory, 4);
	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &categoryConfigRec.liveChar, ISGTEQ);

	if ( isRead(ctlFile, &categoryConfigRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicCustRequest] ISREAD/ISEQUAL error %d occured while reading Control File for Code No [%.6s]\n", getDateTime(), PID, iserrno,categoryConfigRec.recType);
		fflush(logFp);
	}
	else
	{
		if ( categoryConfigRec.samaApprovalReqd == '1' ) /* SAMA approval required  */
		{
			fprintf(logFp, "%s|%5d|[processJuristicCustRequest] SAMA approval required is set as YES [%c] in the category configuration for the main category [%.2s] and the sub category [%.2s]\n", getDateTime(), PID, categoryConfigRec.samaApprovalReqd, categoryConfigRec.samaMainCategory, categoryConfigRec.samaSubCategory);
			fflush(logFp);

			if ( strncmp(custLogRec.samaAuthNo, "                            ", 15) == 0 )
				custLogRec.overrideForNoSamaAuth = '1';
			else
				custLogRec.overrideForNoSamaAuth = '0';
		}
	}

	memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);

	strncpy(ownerLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(ownerLogRec.userId, custLogRec.userId, 10);
	strncpy(ownerLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(ownerLogFile, &ownerLogKey, 1);
	isstart(ownerLogFile, &ownerLogKey, 28, &ownerLogRec.liveChar, ISGTEQ);

	noOfOwner=0;
	while ( isRead(ownerLogFile, &ownerLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(ownerLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(ownerLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		noOfOwner++;
	}

	custLogRec.overrideForNonSaudi = '0';
	if ( strncmp(custLogRec.samaSubCategory, "10", 2) == 0 || strncmp(custLogRec.samaSubCategory, "11", 2) == 0 ||
		 strncmp(custLogRec.samaSubCategory, "12", 2) == 0 || strncmp(custLogRec.samaSubCategory, "13", 2) == 0 ||
		 strncmp(custLogRec.samaSubCategory, "14", 2) == 0 || strncmp(custLogRec.samaSubCategory, "16", 2) == 0 ||
		 strncmp(custLogRec.samaSubCategory, "17", 2) == 0 )
	{
		if ( noOfOwner == 1 ) /* If the company is one man ownership */
		{
			memset(&signLogRec.liveChar, ' ', sizeof signLogRec);

			strncpy(signLogRec.branchCode, custLogRec.branchCode,4);
			strncpy(signLogRec.userId, custLogRec.userId, 10);
			strncpy(signLogRec.dateTime, custLogRec.dateTime, 14);

			isindexinfo(signLogFile, &signLogKey, 1);
			isstart(signLogFile, &signLogKey, 28, &signLogRec.liveChar, ISGTEQ);

			saudiSignatoryFound=NO;
			noOfSignatory=0;
			while ( isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(signLogRec.branchCode, custLogRec.branchCode, 4) ||
					 strncmp(signLogRec.userId, custLogRec.userId, 10) ||
					 strncmp(signLogRec.dateTime, custLogRec.dateTime, 14) )
					 break;

				noOfSignatory++;
				if ( signLogRec.idType == 'I' || signLogRec.idType == 'H' || signLogRec.idType == 'F' )
				{
					saudiSignatoryFound = YES;
					break;
				}
			}

			if ( saudiSignatoryFound == NO && noOfSignatory > 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Customer [%.7s] is a one man ownership company and has non-saudi signatory; so, override flag is set..\n", getDateTime(), PID, custLogRec.custNo);
				fflush(logFp);
				custLogRec.overrideForNonSaudi = '1';
			}
		}
	}

	if ( updateIdLogForJuristic() == FAILURE ) /* Write/Update stidlog for juristic others */
	{
		isrollback();
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); 
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( updateAddrLogForJuristic() == FAILURE ) /* Write/update staddrlog for Juristic */
	{
		isrollback();
		isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); 
		custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(custLogRec.lastUpdateUser, receivedMsg.juristic.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if( receivedMsg.juristic.creationOrUpdate == 'U' )
	{
		if ( isRewcurr(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicCustRequest] : ISREWCURR error %d on stcustlog  for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
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
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
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
			fprintf(logFp, "%s|%5d|[processJuristicCustRequest] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristricCustRequest] : ISWRITE error %d on stcustlog while creating a new customer/update for key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
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
			isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
			custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( receivedMsg.juristic.newOrUpdate == 'N' )
	{
		/* Write to stacclog if any account requested */

		if ( strncmp(receivedMsg.juristic.currentAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.juristic.currentAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		if ( strncmp(receivedMsg.juristic.savingAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.juristic.savingAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		if ( strncmp(receivedMsg.juristic.otherAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.juristic.otherAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
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
	isclose(custLogFile); isclose(ctlFile); ;isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
	custLogFileOpen=ctlFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
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

formatJuristicDetailResponse( responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatJuristicDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.juristicPendingDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.juristicPendingDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.juristicPendingDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.juristicPendingDetail.service, receivedMsg.pendingDetail.service, 2);
	responseMsg.juristicPendingDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.juristicPendingDetail.msgLen));
	strncpy(responseMsg.juristicPendingDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

moveTabRecToLog(char screenSetNo)
{
	char keyDateTime[20], tmpStr[100], bmCustNo[10];
	char *tmpPtr;
	int  mainBrCodeUpdAllowed=NO;

	if ( openOwnerLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openOwnerTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openCrefLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openCrefTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openJointLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openJointTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openHeirLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openHeirTabFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( openGldFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	getDateTime();
	sprintf(keyDateTime, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);

	memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);
	strncpy(ownerTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(ownerTabFile, &ownerTabKey, 1);
	isstart(ownerTabFile, &ownerTabKey, 7, &ownerTabRec.liveChar, ISGTEQ);

	while ( isRead(ownerTabFile, &ownerTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);
		ownerLogRec.liveChar = '@';
		strncpy(ownerLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(ownerLogRec.userId, authorisedUser, 10);
		strncpy(ownerLogRec.dateTime, keyDateTime, 14);

		ownerLogRec.newOrUpdate = 'U';

		strncpy(ownerLogRec.custNo, ownerTabRec.custNo, 7);
		strncpy(ownerLogRec.ownerNo, ownerTabRec.ownerNo, 4);
		ownerLogRec.ownerType = ownerTabRec.ownerType;
		strncpy(ownerLogRec.custBranchCode, ownerTabRec.branchCode, 4);
		ownerLogRec.idType = ownerTabRec.idType;
		strncpy(ownerLogRec.idNo, ownerTabRec.idNo, 229); /* from idNo to ownerEnabled */
		strncpy(ownerLogRec.lastUpdateBmDate, bankingDate, 8);
		ownerLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(ownerLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(ownerLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to ownerLogFile (%d) ..\n", getDateTime(), PID, ownerLogFile);
			fflush(logFp);
		}
		if ( isWrite(ownerLogFile, &ownerLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on stownlog for customer No [%.7s] ; owner No [%.4s] ; owner Type [%c] ; the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, ownerLogRec.custNo, ownerLogRec.ownerNo, ownerLogRec.ownerType, ownerLogRec.branchCode);
			fflush(logFp);
		}
	}

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	strncpy(idTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(idTabFile, &idTabKey, 1);
	isstart(idTabFile, &idTabKey, 7, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(idLogRec.userId, authorisedUser, 10);
		strncpy(idLogRec.dateTime, keyDateTime, 14);

		idLogRec.newOrUpdate = 'U';
		strncpy(idLogRec.custNo, idTabRec.custNo, 7);
		idLogRec.idType = idTabRec.idType;
		strncpy(idLogRec.idNo, idTabRec.idNo, 96); /* From idNo to grace2ActionDate */
		strncpy(idLogRec.idRefNo, idTabRec.idRefNo, 4);
		strncpy(idLogRec.idRefName, idTabRec.idRefName, 30);
		if ( idTabRec.idType == 'Q' ) /* For Iqama, Iqama type also to be copied */
			idLogRec.iqamaType = idTabRec.iqamaType;
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		idLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(idLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
			fflush(logFp);
		}
		if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on stidlog for customer No [%.7s] ; id type & id No [%c ; %.15s] ; id Ref No [%.4s] ; id category [%c] and the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, idLogRec.custNo, idLogRec.idType , idLogRec.idNo,idLogRec.idRefNo,  idLogRec.idCategory, idLogRec.branchCode);
			fflush(logFp);
		}
	}

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

	strncpy(addrTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 7, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrTabFile, &addrTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(addrLogRec.userId, authorisedUser, 10);
		strncpy(addrLogRec.dateTime, keyDateTime, 14);

		addrLogRec.newOrUpdate =  'U';
		strncpy(addrLogRec.custNo, addrTabRec.custNo, 7);
		strncpy(addrLogRec.addressType, addrTabRec.addressType, 2);
		strncpy(addrLogRec.addressNo, addrTabRec.addressNo, 7);
		strncpy(addrLogRec.address1, addrTabRec.address1, 211); /* From address1 to eMail */
		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		addrLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(addrLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to addrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
			fflush(logFp);
		}
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on staddrlog for customer No [%.7s] ; address type & address No [%.2s ; %.4s] ; and the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType , addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);
		}
	}

	memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);

	strncpy(cRefTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(cRefTabFile, &cRefTabKey, 1);
	isstart(cRefTabFile, &cRefTabKey, 7, &cRefTabRec.liveChar, ISGTEQ);

	while ( isRead(cRefTabFile, &cRefTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cRefTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);

		cRefLogRec.liveChar = '@';
		strncpy(cRefLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(cRefLogRec.userId, authorisedUser, 10);
		strncpy(cRefLogRec.dateTime, keyDateTime, 14);

		cRefLogRec.newOrUpdate =  'U';
		strncpy(cRefLogRec.custNo, cRefTabRec.custNo, 7);
		strncpy(cRefLogRec.referenceNo, cRefTabRec.referenceNo, 4);
		strncpy(cRefLogRec.referenceReqdFor, cRefTabRec.referenceReqdFor, 10);
		cRefLogRec.referenceType = cRefTabRec.referenceType;
		strncpy(cRefLogRec.custBranchCode, cRefTabRec.branchCode, 4);
		strncpy(cRefLogRec.aFirstName, cRefTabRec.aFirstName, 205); /* from aFirstName to disableDate */
		strncpy(cRefLogRec.lastUpdateBmDate, bankingDate, 8);
		cRefLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(cRefLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(cRefLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to cRefLogFile (%d) ..\n", getDateTime(), PID, cRefLogFile);
			fflush(logFp);
		}
		if ( isWrite(cRefLogFile, &cRefLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on stcreflog for customer No [%.7s] ; reference type & reference No [%c ; %.4s] ; and the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, cRefLogRec.custNo, cRefLogRec.referenceType , cRefLogRec.referenceNo, cRefLogRec.branchCode);
			fflush(logFp);
		}
	}

	memset(&jointTabRec.liveChar, ' ', sizeof jointTabRec);

	strncpy(jointTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(jointTabFile, &jointTabKey, 1);
	isstart(jointTabFile, &jointTabKey, 7, &jointTabRec.liveChar, ISGTEQ);

	while ( isRead(jointTabFile, &jointTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(jointTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&jointLogRec.liveChar, ' ', sizeof jointLogRec);

		jointLogRec.liveChar = '@';
		strncpy(jointLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(jointLogRec.userId, authorisedUser, 10);
		strncpy(jointLogRec.dateTime, keyDateTime, 14);

		strncpy(jointLogRec.custNo, jointTabRec.custNo, 7);
		strncpy(jointLogRec.jointCustNo, jointTabRec.jointCustNo, 2);

		jointLogRec.newOrUpdate = 'U';
		strncpy(jointLogRec.idNo, jointTabRec.idNo, 632); /* From idNo to employerZipCode */
		strncpy(jointLogRec.jointOpenDate, jointTabRec.jointOpenDate, 8);
		strncpy(jointLogRec.lastUpdateBmDate, bankingDate, 8);
		jointLogRec.activeStatus = jointTabRec.activeStatus;
		jointLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(jointLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(jointLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to jointLogFile (%d) ..\n", getDateTime(), PID, jointLogFile);
			fflush(logFp);
		}
		if ( isWrite(jointLogFile, &jointLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on stjointlog for customer No [%.7s] ; joint Customer No [%.2s] ; and the key is [%.38s] IGNORED \n", getDateTime(), PID, iserrno, jointLogRec.custNo, jointLogRec.jointCustNo, jointLogRec.branchCode);
			fflush(logFp);
		}
	}

	memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);

	strncpy(heirTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);
	isindexinfo(heirTabFile, &heirTabKey, 1);
	isstart(heirTabFile, &heirTabKey, 7, &heirTabRec.liveChar, ISGTEQ);

	while ( isRead(heirTabFile, &heirTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(heirTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7) )
			break;

		memset(&heirLogRec.liveChar, ' ', sizeof heirLogRec);

		heirLogRec.liveChar = '@';
		strncpy(heirLogRec.branchCode, receivedMsg.pendingDetail.homeBranch, 4);
		strncpy(heirLogRec.userId, authorisedUser, 10);
		strncpy(heirLogRec.dateTime, keyDateTime, 14);

		heirLogRec.newOrUpdate =  'U';
		strncpy(heirLogRec.custNo, heirTabRec.custNo, 7);
		strncpy(heirLogRec.heirNo, heirTabRec.heirNo, 4);
		strncpy(heirLogRec.custBranchCode, heirTabRec.branchCode, 4);
		strncpy(heirLogRec.aFirstName, heirTabRec.aFirstName, 205); /* from aFirstName to disableDate */
		strncpy(heirLogRec.lastUpdateBmDate, bankingDate, 8);
		heirLogRec.recordChanged = 'N';  /* Not changed */

		strncpy(heirLogRec.lastUpdateUser, authorisedUser, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(heirLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] Before writing to heirLogFile (%d) ..\n", getDateTime(), PID, heirLogFile);
			fflush(logFp);
		}
		if ( isWrite(heirLogFile, &heirLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[moveTabRecToLog] ISWRITE error %d on stheirlog for customer No [%.7s] ; heir type & heir No [%c ; %.4s] ; and the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, heirLogRec.custNo, heirLogRec.heirType , heirLogRec.heirNo, heirLogRec.branchCode);
			fflush(logFp);
		}
	}
	mainBrCodeUpdAllowed=NO;
	if ( ctlRec.realOrPseudoBranch == '0' )
	{
		isindexinfo(gldFile, &gldKey, 3);
		memset(&gldRec.liveChar, ' ', sizeof gldRec);
		strncpy(&gldRec.accNo[5], actualToBmCust(receivedMsg.pendingDetail.branchCode, bmCustNo), 6);
		isstart(gldFile, &gldKey, 6, &gldRec.liveChar, ISGTEQ);
		mainBrCodeUpdAllowed=YES;
		while ( isRead(gldFile, &gldRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(&gldRec.accNo[5], bmCustNo, 6) )
				break;

			sprintf(tmpStr, "~%.3s", &gldRec.accNo[2]);
			if ( (tmpPtr=strstr(ignoreMemoForBrnUpd, tmpStr)) != NULL )
				continue;

			mainBrCodeUpdAllowed=NO;
			break;
		}
	}
	if ( screenSetNo == JURISTIC )
	{
		strncpy(responseMsg.juristicPendingDetail.keyDateTime, keyDateTime, 14);
		responseMsg.juristicPendingDetail.mainBrCodeUpdAllowed = (mainBrCodeUpdAllowed==YES?'1':'0');
	}
	else if ( screenSetNo == INDIVIDUAL_SAUDI || screenSetNo == INDIVIDUAL_HEIR )
	{
		strncpy(responseMsg.saudiIndividualPendingDetail.keyDateTime, keyDateTime, 14);
		responseMsg.saudiIndividualPendingDetail.mainBrCodeUpdAllowed = (mainBrCodeUpdAllowed==YES?'1':'0');
	}
	else if ( screenSetNo == INDIVIDUAL_OTHERS )
	{
		strncpy(responseMsg.individualOthersPendingDetail.keyDateTime, keyDateTime, 14);
		responseMsg.individualOthersPendingDetail.mainBrCodeUpdAllowed = (mainBrCodeUpdAllowed==YES?'1':'0');
	}
	else if ( screenSetNo == QUICK_CUSTOMER || screenSetNo == INTERNAL_CUSTOMER || screenSetNo == PENSION_CUSTOMER ) /* Ver 1.1 */
	{
		strncpy(responseMsg.quickCustPendingDetail.keyDateTime, keyDateTime, 14);
		responseMsg.quickCustPendingDetail.mainBrCodeUpdAllowed = (mainBrCodeUpdAllowed==YES?'1':'0');
	}
}

processJuristicDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	int  i, len;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);

	memset(responseMsg.juristicPendingDetail.msgLen, ' ', sizeof responseMsg.juristicPendingDetail);
	responseMsg.juristicPendingDetail.nullPad = '\0';
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);

	isindexinfo(custTabFile, &custTabKey, 1);
	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicDetail] ISSTART/ISGTEQ error %d on stcusttab for the customer number [%.7s]\n", getDateTime(), PID, iserrno, custTabRec.custNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatBranchResponse(END_OF_FILE, "No Record found for this key ....", "No Records found for this key ....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.juristicPendingDetail.msgLen);
		return FAILURE;
	}

	if ( readCustTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.juristicPendingDetail.msgLen);
		return FAILURE;
	}

	/* read crd0data for the said customer */
	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(custTabRec.custNo, tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicDetail] ISREAD/ISEQUAL error %d on crd0data for the customer number [%.7s] [%.6s]\n", getDateTime(), PID, iserrno, custTabRec.custNo, crdRec.accNo);
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
		moveTabRecToLog(JURISTIC);
	}

	responseMsg.juristicPendingDetail.restrictedBranchFlag = ctlRec.updateRestricted; 
	responseMsg.juristicPendingDetail.updatedForSama = custTabRec.updatedForSama; 
	strncpy(responseMsg.juristicPendingDetail.relationshipManager, custTabRec.relationshipManager, 25); 
	strncpy(responseMsg.juristicPendingDetail.generalMemo, custTabRec.generalMemo, 25); 

	strncpy(responseMsg.juristicPendingDetail.custNo, custTabRec.custNo, 7);
	strncpy(responseMsg.juristicPendingDetail.custBranchCode, crdRec.branchCode,4);
	if ( custTabRec.idType == 'C' ) 
	{
		strncpy(responseMsg.juristicPendingDetail.crNo, custTabRec.crNo, 15);
		strncpy(responseMsg.juristicPendingDetail.crIssuedAt, custTabRec.crIssuedAt, 20);
		responseMsg.juristicPendingDetail.crDateType = custTabRec.crIssueDateType;
		strncpy(responseMsg.juristicPendingDetail.crIssueDateH, custTabRec.crIssueDateH, 8);
		strncpy(responseMsg.juristicPendingDetail.crIssueDateG, custTabRec.crIssueDateG, 8);
	}

	strncpy(responseMsg.juristicPendingDetail.address1, custTabRec.address1, 30);
	strncpy(responseMsg.juristicPendingDetail.address2, custTabRec.address2, 30);
	strncpy(responseMsg.juristicPendingDetail.poBox, custTabRec.poBox, 10);
	strncpy(responseMsg.juristicPendingDetail.cityName, custTabRec.cityName, 20);
	strncpy(responseMsg.juristicPendingDetail.zipCode, custTabRec.zipCode, 10);
	strncpy(responseMsg.juristicPendingDetail.country, custTabRec.country, 3);
	responseMsg.juristicPendingDetail.addrType = custTabRec.addressType;
	if ( custTabRec.addressType == '1' ) /* Saudi Postal address */
		strncpy(responseMsg.juristicPendingDetail.poBox, custTabRec.unitNo, 5);
	strncpy(responseMsg.juristicPendingDetail.telOffAreaCode, custTabRec.telOffAreaCode, 4);
	strncpy(responseMsg.juristicPendingDetail.telOffNo, custTabRec.telOffNo, 10);
	strncpy(responseMsg.juristicPendingDetail.telOffExt, custTabRec.telOffExt, 4);
	strncpy(responseMsg.juristicPendingDetail.telHomeAreaCode, custTabRec.telHomeAreaCode, 4);
	strncpy(responseMsg.juristicPendingDetail.telHomeNo, custTabRec.telHomeNo, 10);
	strncpy(responseMsg.juristicPendingDetail.telHomeExt, custTabRec.telHomeExt, 4);
	strncpy(responseMsg.juristicPendingDetail.faxAreaCode, custTabRec.faxAreaCode, 4);
	strncpy(responseMsg.juristicPendingDetail.faxNo, custTabRec.faxNo, 10);
	strncpy(responseMsg.juristicPendingDetail.faxExt, custTabRec.faxExt, 4);
	strncpy(responseMsg.juristicPendingDetail.mobileNo, custTabRec.mobileNo, 10);
	strncpy(responseMsg.juristicPendingDetail.pagerNo, custTabRec.pagerNo, 10);
	strncpy(responseMsg.juristicPendingDetail.eMail, custTabRec.eMail, 30);

	strncpy(responseMsg.juristicPendingDetail.samaMainCategory, custTabRec.samaMainCategory,  2);
	strncpy(responseMsg.juristicPendingDetail.samaSubCategory, custTabRec.samaSubCategory, 2);

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	strncpy(idTabRec.custNo, custTabRec.custNo, 7);

	isindexinfo(idTabFile, &idTabKey, 1); /* Arul changed from 5 to 1 */
	isstart(idTabFile, &idTabKey, 7, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, custTabRec.custNo, 7) )
			 break;

		if ( idTabRec.idCategory != 'C' )
			continue;

		if ( idTabRec.idType == 'C' ) /* CR No details */
		{
			strncpy(responseMsg.juristicPendingDetail.crNo, idTabRec.idNo, 15);
			strncpy(responseMsg.juristicPendingDetail.crIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.juristicPendingDetail.crDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.crIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'L' ) /* License  details */
		{
			strncpy(responseMsg.juristicPendingDetail.licNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.licDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.licIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'S' ) /* Sama Authority No details */
		{
			strncpy(responseMsg.juristicPendingDetail.samaAuthNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.samaAuthDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'P' ) /* Passport No details */
		{
			strncpy(responseMsg.juristicPendingDetail.ppNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.ppDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'D' ) /* Diplomatic card No details */
		{
			strncpy(responseMsg.juristicPendingDetail.dcNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.dcDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'V' ) /* Visa No details */
		{
			strncpy(responseMsg.juristicPendingDetail.visaNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.visaDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'T' ) /* Contract No details */
		{
			strncpy(responseMsg.juristicPendingDetail.contractNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.contractDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'A' ) /* Approval document reference No details */
		{
			strncpy(responseMsg.juristicPendingDetail.approvalRefNo, idTabRec.idNo, 15);
			responseMsg.juristicPendingDetail.appDateType = idTabRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.appIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateG, idTabRec.idExpiryDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.appRefName, idTabRec.idRefName, 30);
		}
	}
	/* fields taken from crd0data */
	responseMsg.juristicPendingDetail.preferredLang = crdRec.language;
	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		/* Added on 19th Mar 2006 to avoid blank long name update to CRD during the update from branches who does not have name update privilege */
		if ( crdRec.language == ARABIC )
		{
			/*
			if ( strncmp(custTabRec.aOrgName1, "                                                              ", 60) == 0 && 
				 strncmp(custTabRec.aFirstName,"                                                              ", 60) )
			{
				 strncpy(custTabRec.aOrgName1, custTabRec.aFirstName, 60);
				 strncpy(custTabRec.aOrgShortName, custTabRec.aShortName, 30);
			}
			*/
			if ( strncmp(custTabRec.aOrgName1, "                                                              ", 60) == 0 )
				responseMsg.juristicPendingDetail.preferredLang = ENGLISH;
		}
		else if ( crdRec.language == ENGLISH )
		{
			/*
			if ( strncmp(custTabRec.eOrgName1, "                                                              ", 60) == 0 && 
				 strncmp(custTabRec.eFirstName,"                                                              ", 60) )
			{
				 strncpy(custTabRec.eOrgName1, custTabRec.eFirstName, 60);
				 strncpy(custTabRec.eOrgShortName, custTabRec.eShortName, 30);
			}
			*/
			if ( strncmp(custTabRec.eOrgName1, "                                                              ", 60) == 0 )
				responseMsg.juristicPendingDetail.preferredLang = ARABIC;
		}
	}
	strncpy(responseMsg.juristicPendingDetail.nationality, crdRec.nationality, 3);	
	strncpy(responseMsg.juristicPendingDetail.businessType, crdRec.businessType, 3);	

	responseMsg.juristicPendingDetail.internetBankAcc = custTabRec.internetBankAcc;
	responseMsg.juristicPendingDetail.custAdviceFlag = custTabRec.custAdviceFlag;
	strncpy(responseMsg.juristicPendingDetail.altBranchCode, crdRec.alternativeBranchCode,4);
	strncpy(responseMsg.juristicPendingDetail.custBranchCode, crdRec.branchCode,4);
	strncpy(responseMsg.juristicPendingDetail.alphaSearchCode, crdRec.alphaSearchCode, 6);

	responseMsg.juristicPendingDetail.doeDateType = custTabRec.dobDateType;
	strncpy(responseMsg.juristicPendingDetail.doeDateH, custTabRec.dobDateH, 8);
	strncpy(responseMsg.juristicPendingDetail.doeDateG, custTabRec.dobDateG, 8);

	strncpy(responseMsg.juristicPendingDetail.aOrgFirstName, custTabRec.aOrgName1, 30);
	strncpy(responseMsg.juristicPendingDetail.aOrg2ndName, custTabRec.aOrgName2, 30);
	strncpy(responseMsg.juristicPendingDetail.aOrgShortName, custTabRec.aOrgShortName, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrgFirstName, custTabRec.eOrgName1, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrg2ndName, custTabRec.eOrgName2, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrgShortName, custTabRec.eOrgShortName, 30);

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
	strncpy(addrTabRec.custNo, custTabRec.custNo, 7);
	strncpy(addrTabRec.addressType, "00", 2);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 9, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrTabFile, &addrTabRec.liveChar, ISNEXT) ==  0 )
	{
		if ( strncmp(addrTabRec.custNo, custTabRec.custNo, 7) )
			 break;

		if ( strncmp(addrTabRec.addressNo, "0000", 4) )
			continue;

		if ( strncmp(addrTabRec.addressType, "00", 2) == 0 ) /* Customer Local address */
		{
			strncpy(responseMsg.juristicPendingDetail.address1, addrTabRec.address1, 30);
			strncpy(responseMsg.juristicPendingDetail.address2, addrTabRec.address2, 30);
			strncpy(responseMsg.juristicPendingDetail.poBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.juristicPendingDetail.cityName, addrTabRec.cityName, 20);
			strncpy(responseMsg.juristicPendingDetail.zipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.juristicPendingDetail.country, addrTabRec.country, 3);
			responseMsg.juristicPendingDetail.addrType = addrTabRec.addrType;
			if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.juristicPendingDetail.poBox, addrTabRec.unitNo, 5);
			strncpy(responseMsg.juristicPendingDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.telOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.juristicPendingDetail.telOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.juristicPendingDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.telHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.juristicPendingDetail.telHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.juristicPendingDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.faxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.juristicPendingDetail.faxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.juristicPendingDetail.mobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.juristicPendingDetail.pagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.juristicPendingDetail.eMail, addrTabRec.eMail, 30);
		}
		else if ( strncmp(addrTabRec.addressType, "01", 2) == 0 ) /* customer abroad/home address */
		{
			strncpy(responseMsg.juristicPendingDetail.homeAddress1, addrTabRec.address1, 30);
			strncpy(responseMsg.juristicPendingDetail.homeAddress2, addrTabRec.address2, 30);
			strncpy(responseMsg.juristicPendingDetail.homePoBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.juristicPendingDetail.homeCityName, addrTabRec.cityName, 10);
			strncpy(responseMsg.juristicPendingDetail.homeZipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.juristicPendingDetail.homeCountry, addrTabRec.country, 3);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeFaxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeFaxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeFaxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeMobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homePagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeEmail, addrTabRec.eMail, 30);
		}
	}

	strncpy(responseMsg.juristicPendingDetail.purposeOfAccount, custTabRec.purposeOfAccount, 50);
	strncpy(responseMsg.juristicPendingDetail.govtShareHoldingPerc, custTabRec.govtShareHoldingPerc, 3);
	strncpy(responseMsg.juristicPendingDetail.saudiShareHoldingPerc, custTabRec.saudiShareHoldingPerc, 3);
	strncpy(responseMsg.juristicPendingDetail.foreignShareHoldingPerc, custTabRec.foreignShareHoldingPerc, 3);

	strncpy(responseMsg.juristicPendingDetail.documents, custTabRec.documentsSupplied, 60);
	strncpy(responseMsg.juristicPendingDetail.documentOther, custTabRec.documentOther, 50);
	responseMsg.juristicPendingDetail.signatureNature = custTabRec.signatureNature;

	responseMsg.juristicPendingDetail.internetBankAcc = custTabRec.internetBankAcc;
	responseMsg.juristicPendingDetail.custAdviceFlag = custTabRec.custAdviceFlag;
	strncpy(responseMsg.juristicPendingDetail.altBranchCode, custTabRec.altBranchCode, 4);
	responseMsg.juristicPendingDetail.updatedForSama = custTabRec.updatedForSama; 
	strncpy(responseMsg.juristicPendingDetail.relationshipManager, custTabRec.relationshipManager, 25); 
	strncpy(responseMsg.juristicPendingDetail.generalMemo, custTabRec.generalMemo, 25);
	strncpy(responseMsg.juristicPendingDetail.marketingMemo, custTabRec.marketingMemo, 25); 
	strncpy(responseMsg.juristicPendingDetail.accFreezingGracePeriod, custTabRec.accFreezingGracePeriod, 3);

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	/* form the key for reading the Acct File  */
	strncpy(acctLogRec.branchCode, custTabRec.branchCode, 4);
	strncpy(acctLogRec.userId, custTabRec.createdUserId, 10);
	strncpy(acctLogRec.dateTime, custTabRec.createdDateTime,14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.juristicPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.juristicPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.juristicPendingDetail.otherAccInfo, otherAccInfo, 11);
	responseMsg.juristicPendingDetail.foundInTList = '0';
	responseMsg.juristicPendingDetail.details[0].englishName[0] = NULL;

	getCustomerOpenUpdateInfo(&responseMsg.juristicPendingDetail.openUpdateInfo);
    formatJuristicDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.juristicPendingDetail.msgLen);
	return SUCCESS;
}

processJuristicPendingDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	int  i, len;
	int idLogRecFound=NO, addrLogRecFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicPendingDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( openSignLogFile(ISMANULOCK + ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);
	memset(responseMsg.juristicPendingDetail.msgLen, ' ', sizeof responseMsg.juristicPendingDetail);

	if ( extraDebug )
	{
		fprintf(logFp, "processJuristicPendingDetail entered....\n");
		fflush(logFp);
	}
	/* Remove NULL char from the record */
	len = sizeof custLogRec;
	for (i = 0 ; i < len; i++)
		if ( custLogRec.branchCode[i] == NULL )
			custLogRec.branchCode[i] = ' ';
	
	strncpy(responseMsg.juristicPendingDetail.custNo, custLogRec.custNo,7); 
	strncpy(responseMsg.juristicPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);
	strncpy(responseMsg.juristicPendingDetail.samaMainCategory, custLogRec.samaMainCategory,  2);
	strncpy(responseMsg.juristicPendingDetail.samaSubCategory, custLogRec.samaSubCategory, 2);

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

		if ( idLogRec.idCategory != 'C' )
			continue;

		if ( idLogRec.idType == 'C' ) /* CR No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.crNo, idLogRec.idNo, 15);
			strncpy(responseMsg.juristicPendingDetail.crIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.juristicPendingDetail.crDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.crIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'L' ) /* License  details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.licNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.licDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.licIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'S' ) /* Sama Authority No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.samaAuthNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.samaAuthDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'P' ) /* Passport No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.ppNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.ppDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'D' ) /* Diplomatic card No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.dcNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.dcDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'V' ) /* Visa No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.visaNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.visaDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'T' ) /* Contract No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.contractNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.contractDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'A' ) /* Approval document reference No details */
		{
			idLogRecFound = YES;
			strncpy(responseMsg.juristicPendingDetail.approvalRefNo, idLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.appDateType = idLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.appIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateG, idLogRec.idExpiryDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.appRefName, idLogRec.idRefName, 30);
		}
	}
	if ( idLogRecFound == NO )
	{
		if ( custLogRec.idType == 'C' ) /* CR No details */
		{
			strncpy(responseMsg.juristicPendingDetail.crNo, custLogRec.idNo, 15);
			strncpy(responseMsg.juristicPendingDetail.crIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.juristicPendingDetail.crDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.crIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'L' ) /* License  details */
		{
			strncpy(responseMsg.juristicPendingDetail.licNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.licDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.licIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.licExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'S' ) /* Sama Authority No details */
		{
			strncpy(responseMsg.juristicPendingDetail.samaAuthNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.samaAuthDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.samaAuthExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'P' ) /* Passport No details */
		{
			strncpy(responseMsg.juristicPendingDetail.ppNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.ppDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.ppExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'D' ) /* Diplomatic card No details */
		{
			strncpy(responseMsg.juristicPendingDetail.dcNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.dcDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.dcExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'V' ) /* Visa No details */
		{
			strncpy(responseMsg.juristicPendingDetail.visaNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.visaDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.visaExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'T' ) /* Contract No details */
		{
			strncpy(responseMsg.juristicPendingDetail.contractNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.contractDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.contractExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'A' ) /* Approval Document reference No details */
		{
			strncpy(responseMsg.juristicPendingDetail.approvalRefNo, custLogRec.idNo, 15);
			responseMsg.juristicPendingDetail.appDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.appIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.appExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else
		{
			strncpy(responseMsg.juristicPendingDetail.crNo, custLogRec.idNo, 15);
			strncpy(responseMsg.juristicPendingDetail.crIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.juristicPendingDetail.crDateType = custLogRec.idDateType;
			strncpy(responseMsg.juristicPendingDetail.crIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.juristicPendingDetail.crExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
	}

	responseMsg.juristicPendingDetail.preferredLang = custLogRec.preferredLang;
	strncpy(responseMsg.juristicPendingDetail.nationality, custLogRec.nationality, 3);
	responseMsg.juristicPendingDetail.doeDateType = custLogRec.dobDateType;
	strncpy(responseMsg.juristicPendingDetail.doeDateH, custLogRec.dobDateH, 8);
	strncpy(responseMsg.juristicPendingDetail.doeDateG, custLogRec.dobDateG, 8);
	strncpy(responseMsg.juristicPendingDetail.businessType, custLogRec.businessType, 3);
	strncpy(responseMsg.juristicPendingDetail.aOrgFirstName, custLogRec.aOrgName1, 30);
	strncpy(responseMsg.juristicPendingDetail.aOrg2ndName, custLogRec.aOrgName2, 30);
	strncpy(responseMsg.juristicPendingDetail.aOrgShortName, custLogRec.aOrgShortName, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrgFirstName, custLogRec.eOrgName1, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrg2ndName, custLogRec.eOrgName2, 30);
	strncpy(responseMsg.juristicPendingDetail.eOrgShortName, custLogRec.eOrgShortName, 30);
	strncpy(responseMsg.juristicPendingDetail.alphaSearchCode, custLogRec.orgAlphaSearchCode, 6);

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
	strncpy(addrLogRec.custNo, custLogRec.custNo, 7);
	strncpy(addrLogRec.addressType, "00", 2);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 37, &addrLogRec.liveChar, ISGTEQ);

	addrLogRecFound = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) ==  0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10 ) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer address */
			continue;

		addrLogRecFound = YES;

		if ( strncmp(addrLogRec.addressType, "00", 2) == 0 ) /* Customer Local address */
		{
			strncpy(responseMsg.juristicPendingDetail.address1, addrLogRec.address1, 30);
			strncpy(responseMsg.juristicPendingDetail.address2, addrLogRec.address2, 30);
			strncpy(responseMsg.juristicPendingDetail.poBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.juristicPendingDetail.cityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.juristicPendingDetail.zipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.juristicPendingDetail.country, addrLogRec.country, 3);
			responseMsg.juristicPendingDetail.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.juristicPendingDetail.poBox, addrLogRec.unitNo, 5);
			strncpy(responseMsg.juristicPendingDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.telOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.juristicPendingDetail.telOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.juristicPendingDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.telHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.juristicPendingDetail.telHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.juristicPendingDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.faxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.juristicPendingDetail.faxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.juristicPendingDetail.mobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.juristicPendingDetail.pagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.juristicPendingDetail.eMail, addrLogRec.eMail, 30);
		}
		else if ( strncmp(addrLogRec.addressType, "01", 2) == 0 ) /* customer abroad/home address */
		{
			strncpy(responseMsg.juristicPendingDetail.homeAddress1, addrLogRec.address1, 30);
			strncpy(responseMsg.juristicPendingDetail.homeAddress2, addrLogRec.address2, 30);
			strncpy(responseMsg.juristicPendingDetail.homePoBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.juristicPendingDetail.homeCityName, addrLogRec.cityName, 10);
			strncpy(responseMsg.juristicPendingDetail.homeZipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.juristicPendingDetail.homeCountry, addrLogRec.country, 3);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeTelOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeTelHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeFaxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.juristicPendingDetail.homeFaxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeFaxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.juristicPendingDetail.homeMobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homePagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.juristicPendingDetail.homeEmail, addrLogRec.eMail, 30);
		}
	}

	if ( addrLogRecFound == NO )
	{
		strncpy(responseMsg.juristicPendingDetail.address1, custLogRec.address1, 30);
		strncpy(responseMsg.juristicPendingDetail.address2, custLogRec.address2, 30);
		strncpy(responseMsg.juristicPendingDetail.poBox, custLogRec.poBox, 10);
		strncpy(responseMsg.juristicPendingDetail.cityName, custLogRec.cityName, 20);
		strncpy(responseMsg.juristicPendingDetail.zipCode, custLogRec.zipCode, 10);
		strncpy(responseMsg.juristicPendingDetail.country, custLogRec.country, 3);
		responseMsg.juristicPendingDetail.addrType = custLogRec.addressType;
		if ( custLogRec.addressType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.juristicPendingDetail.poBox, custLogRec.unitNo, 5);
		strncpy(responseMsg.juristicPendingDetail.telOffAreaCode, custLogRec.telOffAreaCode, 4);
		strncpy(responseMsg.juristicPendingDetail.telOffNo, custLogRec.telOffNo, 10);
		strncpy(responseMsg.juristicPendingDetail.telOffExt, custLogRec.telOffExt, 4);
		strncpy(responseMsg.juristicPendingDetail.telHomeAreaCode, custLogRec.telHomeAreaCode, 4);
		strncpy(responseMsg.juristicPendingDetail.telHomeNo, custLogRec.telHomeNo, 10);
		strncpy(responseMsg.juristicPendingDetail.telHomeExt, custLogRec.telHomeExt, 4);
		strncpy(responseMsg.juristicPendingDetail.faxAreaCode, custLogRec.faxAreaCode, 4);
		strncpy(responseMsg.juristicPendingDetail.faxNo, custLogRec.faxNo, 10);
		strncpy(responseMsg.juristicPendingDetail.faxExt, custLogRec.faxExt, 4);
		strncpy(responseMsg.juristicPendingDetail.mobileNo, custLogRec.mobileNo, 10);
		strncpy(responseMsg.juristicPendingDetail.pagerNo, custLogRec.pagerNo, 10);
		strncpy(responseMsg.juristicPendingDetail.eMail, custLogRec.eMail, 30);
	}

	strncpy(responseMsg.juristicPendingDetail.purposeOfAccount, custLogRec.purposeOfAccount, 50);
	strncpy(responseMsg.juristicPendingDetail.govtShareHoldingPerc, custLogRec.govtShareHoldingPerc, 3);
	strncpy(responseMsg.juristicPendingDetail.saudiShareHoldingPerc, custLogRec.saudiShareHoldingPerc, 3);
	strncpy(responseMsg.juristicPendingDetail.foreignShareHoldingPerc, custLogRec.foreignShareHoldingPerc, 3);

	strncpy(responseMsg.juristicPendingDetail.documents, custLogRec.documentsSupplied, 60);
	strncpy(responseMsg.juristicPendingDetail.documentOther, custLogRec.documentOther, 50);
	responseMsg.juristicPendingDetail.signatureNature = custLogRec.signatureNature;

	responseMsg.juristicPendingDetail.newOrUpdate = custLogRec.newOrUpdate;
	responseMsg.juristicPendingDetail.internetBankAcc = custLogRec.internetBankAcc;
	responseMsg.juristicPendingDetail.custAdviceFlag = custLogRec.custAdviceFlag;
	strncpy(responseMsg.juristicPendingDetail.altBranchCode, custLogRec.altBranchCode, 4);
	responseMsg.juristicPendingDetail.updatedForSama = custLogRec.updatedForSama; 
	strncpy(responseMsg.juristicPendingDetail.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(responseMsg.juristicPendingDetail.generalMemo, custLogRec.generalMemo, 25);
	strncpy(responseMsg.juristicPendingDetail.marketingMemo, custLogRec.marketingMemo, 25); 
	strncpy(responseMsg.juristicPendingDetail.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3); 

	strncpy(responseMsg.juristicPendingDetail.supervisorComments, custLogRec.supervisorComments, 200);

	responseMsg.juristicPendingDetail.existingCustomer = '0';
	if ( custLogRec.newOrUpdate == 'N' )
	{
		if ( getSarCustDetails() == FAILURE )
		{
			sendResponse(responseMsg.juristicPendingDetail.msgLen);
			return FAILURE;
		}
		responseMsg.juristicPendingDetail.existingCustomer = abcSrchCustDetails.existingCustomer;
		strncpy(responseMsg.juristicPendingDetail.existCustNo, abcSrchCustDetails.existCustNo, 7);
		strncpy(responseMsg.juristicPendingDetail.existCustName, abcSrchCustDetails.existCustName, 30);
	}

	responseMsg.juristicPendingDetail.foundInTList = '0';
	responseMsg.juristicPendingDetail.details[0].englishName[0] = NULL;

	if ( getSarABCdetails() == FAILURE )
	{
		sendResponse(responseMsg.juristicPendingDetail.msgLen);
		return FAILURE;
	}

	/* custBranchCode is copied again to response message to avoid NULL problem when SRCHENGINE tuxedo service is not running; we ignore the failure */
	strncpy(responseMsg.juristicPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);

	responseMsg.juristicPendingDetail.foundInTList = abcSrchCustDetails.foundInTList;
	strncpy(responseMsg.juristicPendingDetail.noOfRecs, abcSrchCustDetails.noOfRecs, 2);
	strncpy(responseMsg.juristicPendingDetail.details, abcSrchCustDetails.details, sizeof abcSrchCustDetails.details);
	sprintf(tmpStr, "%.2s", responseMsg.juristicPendingDetail.noOfRecs);
	responseMsg.juristicPendingDetail.details[atoi(tmpStr)].englishName[0] = NULL;

	responseMsg.juristicPendingDetail.overrideForNoSamaAuth = custLogRec.overrideForNoSamaAuth;
	responseMsg.juristicPendingDetail.overrideForNonSaudi = custLogRec.overrideForNonSaudi;

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	/* form the key for reading the Acct File  */
	strncpy(acctLogRec.branchCode, receivedMsg.pendingDetail.branchCode,4);
	strncpy(acctLogRec.userId, receivedMsg.pendingDetail.userId, 10);
	strncpy(acctLogRec.dateTime, receivedMsg.pendingDetail.dateTime,14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.juristicPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.juristicPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.juristicPendingDetail.otherAccInfo, otherAccInfo, 11);

	memset(&signLogRec.liveChar, ' ', sizeof signLogRec);
	strncpy(signLogRec.branchCode, receivedMsg.pendingDetail.branchCode, 4);
	strncpy(signLogRec.userId, receivedMsg.pendingDetail.userId, 10);
	strncpy(signLogRec.dateTime, receivedMsg.pendingDetail.dateTime, 14);
	isindexinfo(signLogFile, &signLogKey, 1);
	isstart(signLogFile, &signLogKey, 0, &signLogRec.liveChar,ISGTEQ);

	responseMsg.juristicPendingDetail.signatoryForOthers = '0';
	while (  isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0 )
	{
		if (strncmp(receivedMsg.pendingDetail.branchCode, signLogRec.branchCode, 4) || strncmp(receivedMsg.pendingDetail.userId, signLogRec.userId, 10) || strncmp(receivedMsg.pendingDetail.dateTime, signLogRec.dateTime, 14) )
			break;

		if ( signLogRec.signatoryForOthers == '1' )
		{
			responseMsg.juristicPendingDetail.signatoryForOthers = '1';
			break;
		}				
	}

    formatJuristicDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.juristicPendingDetail.msgLen);
	return SUCCESS;
}

processJuristicSuperDecision(reqAction)
char reqAction; /* A - Accept; F - Forward to Teller R - Reject */
{ 
	char tmpStr[200], tmpCurrentNo[10], tmpAddressNo[10], *isLogPathName;
	char ibanAccNo[30];
	char currentDate[15], tmpCustNo[15];
	char tmpPackageAcc;
	int isappLogFp, returnError, retErr;
	long currentNo, oldSigMask;
	char tmpAuthLevel[150];
	char *tmpPtr;
	int i, updateSignatory = NO, custFoundInIdTab = NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] with reqAction as %c\n", getDateTime(), PID, reqAction);
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
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] This customer record has already been approved by %.20s [%c] and the customer number assigned is [%.7s] while rejection/forwarding\n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
			fflush(logFp);
			isrelease(custLogFile);
			sprintf(tmpStr," This Record has already approved by %.20s", custLogRec.supervisorId);
			formatSuperDecisionResponse(INCORRECTMSG,tmpStr,tmpStr); 
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( reqAction == SUP_FORWARD )
			custLogRec.bmUpdateStatus = '2';  /* 2 is for Pending with Teller */
		else
			custLogRec.bmUpdateStatus = '3';  /* 3 is for Rejecting the entry */

		strncpy(custLogRec.supervisorId,receivedMsg.supDecision.supervisorId,10);
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

			idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus ; 

			strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		/* Read corresponding Address log record */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, custLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
				 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
				 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
				 break;

			addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		closeAllFiles();

		strcpy(tmpStr,"Successful");
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}


	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Supervisor has approved the update and the update process starts now\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

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
	if ( ctlFileOpen == YES )
	{
		isclose(ctlFile);
		ctlFileOpen=NO;
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
	if ( signLogFileOpen == YES )
	{
		isclose(signLogFile);
		signLogFileOpen=NO;
	}
	if ( signTabFileOpen == YES )
	{
		isclose(signTabFile);
		signTabFileOpen=NO;
	}
	if ( ownerLogFileOpen == YES )
	{
		isclose(ownerLogFile);
		ownerLogFileOpen=NO;
	}
	if ( ownerTabFileOpen == YES )
	{
		isclose(ownerTabFile);
		ownerTabFileOpen=NO;
	}

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
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while creating CISAM log file ", errno);
		formatSuperDecisionResponse( INTERNALERR, tmpStr, tmpStr );
		sigsetmask(oldSigMask);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	close(isappLogFp);
	if ( islogopen(isLogPathName) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening CISAM log file ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( isbegin() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISBEGIN error %d;  while supervisor approval\n", getDateTime(), PID, iserrno);
		sprintf(tmpStr, "ISBEGIN error %d while supervisor approval", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

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
	if ( openCustTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); 
		custLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openCtlFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) /* for Reading CustomerNo Range info */
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(custTabFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(custTabFile);isclose(ctlFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(custTabFile);isclose(ctlFile);isclose(idLogFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(custTabFile);isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(custTabFile);isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openSignLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); 
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openSignTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openOwnerLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openOwnerTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Opened all required files\n", getDateTime(), PID);
		fflush(logFp);
	}
	
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
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] This customer record has already been approved by [%.20s] [%c] and the customer number assigned is [%.7s] while approving \n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
		fflush(logFp);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( custLogRec.preferredLang == ARABIC )
		{
			if ( strncmp(custTabRec.aOrgName1, custLogRec.aOrgName1, 60) != 0 || strncmp(custTabRec.aOrgShortName, custLogRec.aOrgShortName, 30) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
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
		else /* ENGLISH CUSTOMER */
		{
			if ( strncmp(custTabRec.eOrgName1, custLogRec.eOrgName1, 60) != 0 || strncmp(custTabRec.eOrgShortName, custLogRec.eOrgShortName, 30) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
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

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Read the related custLog record\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custLogRec.custOpenDate, bankingDate, 8);
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
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	isrelease(custLogFile); 
	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| updateCustLogFile() successful\n", getDateTime(), PID);
		fflush(logFp);
	}


	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] stcustlog update is complete; about to read ID details\n", getDateTime(), PID);
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

			/*if ( readIdTabFile(ISEQUAL) == FAILURE )*/
			if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer # [%.7s] , id type [%c], id category [%c] \n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idCategory);
				fflush(logFp);
				if ( iserrno != 111 )
				{
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

				idTabRec.liveChar = '@';
				strncpy(idTabRec.custNo, idLogRec.custNo, 7);
				idTabRec.idType = idLogRec.idType;
				idTabRec.idCategory = idLogRec.idCategory;
				idLogRec.newOrUpdate = 'N';
			}
		}

		strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
		strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
		strncpy(idTabRec.idRefName, idLogRec.idRefName, 30);
		idTabRec.newOrUpdate = idLogRec.newOrUpdate;

		strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
		/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
		if ( idLogRec.newOrUpdate == 'N' )
		{
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
		}

		/* Unfreeze account if action taken from SAMA freezing program */
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
					if ( idTabRec.grace1ActionTaken == '1' || idTabRec.grace2ActionTaken == '1' )
					{
						if ( idLogRec.idType == 'T' || idLogRec.idType == 'V' || idLogRec.idType == 'C' || 
							 idLogRec.idType == 'L' )
						{
							sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
							if ( unfreezeAccounts(tmpCustNo, IDEXPIRYACTION) == FAILURE )
							{
								isrollback();
								isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
								custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
		}
		*/

		if ( receivedMsg.supDecision.newOrUpdate == 'U' )
		{
			if ( idLogRec.idType == custLogRec.idType ) /* do the unfreezing for primary id only */
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
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
							custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				isclose(gldFile);
				gldFileOpen=NO;
				custTabRec.custUpdActionTaken = '0'; /* NO */
				strncpy(custTabRec.custUpdActionDate, "            ",8);
				custTabRec.custUpdWarningLetterGenerated = '0'; /* NO */
			}
		}

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
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				if ( iserrno != 100 && iserrno != 108 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] IGNORED \n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
			}
		}

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( custTabRec.custUpdActionTaken == '1' ) /* YES */
		{
			sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
			if ( unfreezeAccounts(tmpCustNo, CUSTUPDACTION) == FAILURE )
			{
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isclose(gldFile);
			gldFileOpen=NO;
			custTabRec.custUpdActionTaken = '0'; /* NO */
			strncpy(custTabRec.custUpdActionDate, "            ",8);
			custTabRec.custUpdWarningLetterGenerated = '0'; /* NO */
		}

		if ( deleteUnwantedIdTabRecord() == FAILURE )
		{
			sprintf(tmpStr, "Error %d while deleting id info in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}


	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Customer Id details update is complete; about to update customer address\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* Read corresponding Address log record */
	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "00", 2) && strncmp(addrLogRec.addressType, "01", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) 
			continue;

		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

		addrTabRec.liveChar = '@';
		strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
		strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
		strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

		if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) == 0 )
		{
			strncpy(addrTabRec.address1, addrLogRec.address1, 207);
			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			addrTabRec.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
			{
				strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
				strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
				strncpy(addrTabRec.poBox, addrLogRec.unitNo, 5);
			}

			strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Record not found on staddrtab to update for customer # [%.7s] , addressType=%.2s; addressNo=%.4s; and hence it will be added\n", getDateTime(), PID, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo);
			fflush(logFp);
			memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

			addrTabRec.liveChar = '@';
			strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
			strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
			strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
			addrLogRec.newOrUpdate='N';
			strncpy(addrTabRec.address1, addrLogRec.address1, 207);
			addrTabRec.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
			{
				strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
				strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
				strncpy(addrTabRec.poBox, addrLogRec.unitNo, 5);
			}

			strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);
			addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

			/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
			if ( addrLogRec.newOrUpdate == 'N' )
			{
				strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
				strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
			}

			strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
				fflush(logFp);
			}
			if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}/* while read(addrLogFile)  */

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Customer address update is complete; About to insert 0th record\n", getDateTime(), PID);
		fflush(logFp);
	}

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
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
			fflush(logFp);
			fprintf(errLogFp, "%s : processSuperDecision :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), iserrno,custLogRec1.branchCode);
			fflush(errLogFp);
		}
		else
		{
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|0th update record has been added successfully\n", getDateTime(), PID);
		}
	}
	*/


	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] About to update stcusttab\n", getDateTime(), PID);
		fflush(logFp);
	}

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
		memset(&crdRec.liveChar, ' ', sizeof crdRec);
		strncpy(crdRec.accNo, (char *)actualToBmCust(custLogRec.custNo, tmpStr), 6);

		if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|processJuristicSuperDecision] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer %.7s [%.6s] ..\n", getDateTime(), PID, iserrno, custLogRec.custNo, crdRec.accNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d on crd0data for customer [%.7s]", iserrno, custLogRec.custNo );
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecsion] ISSTART/ISGTEQ error %d on stuser.dat for %.10s\n", getDateTime(), PID, iserrno, custLogRec.userId);
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] UserFile value is %d\n", getDateTime(), PID, userFile);

	strncpy(userRec.userId, custLogRec.userId, 10);
	isRead(userFile, &userRec.liveChar, ISEQUAL);

	if ( iserrno || strncmp(userRec.userId, custLogRec.userId, 10) )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d occured while reading userId [%.10s] and obtained userId from stuser [%.10s]\n", getDateTime(), PID, iserrno, custLogRec.userId, userRec.userId);
		fflush(logFp);
		sprintf(tmpStr, "UserID[%.10s:%.10s] could not be read", custLogRec.userId, userRec.userId);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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

	strncpy(custTabRec.noOfJointCustomer, "00", 2); /* Hardcoded since no joint account for juristic */

	if ( strncmp(&custTabRec.mobileNo[2], "               ", 8) == 0 )
		strncpy(custTabRec.mobileNo, "                   ", 10 );
										
	custTabRec.custType = custLogRec.custType;  /* Customer type is moved since the existing version should be able to enquire */
	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision]SAMA Main category [%.2s] ; Sub Category [%.2s] in stcustlog; Preparing for stcusttab \n", getDateTime(), PID, custLogRec.samaMainCategory, custLogRec.samaSubCategory);
		fflush(logFp);
	}
	strncpy(custTabRec.samaMainCategory, custLogRec.samaMainCategory, 2);
	strncpy(custTabRec.samaSubCategory, custLogRec.samaSubCategory, 2);

	custTabRec.internetBankAcc = custLogRec.internetBankAcc;
	custTabRec.custAdviceFlag = custLogRec.custAdviceFlag;
	strncpy(custTabRec.altBranchCode, custLogRec.altBranchCode,4);

	custTabRec.updatedForSama = custLogRec.updatedForSama; 
	strncpy(custTabRec.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(custTabRec.generalMemo, custLogRec.generalMemo, 25); 
	strncpy(custTabRec.marketingMemo, custLogRec.marketingMemo, 25); 
	strncpy(custTabRec.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3);

	strncpy(custTabRec.passportNo, custLogRec.passportNo, 15);
	strncpy(custTabRec.diplomaticCardNo, custLogRec.diplomaticCardNo, 15);
	strncpy(custTabRec.licenseNo, custLogRec.licenseNo, 15);
	strncpy(custTabRec.samaAuthNo, custLogRec.samaAuthNo, 15);
	strncpy(custTabRec.visaNo, custLogRec.visaNo, 15);
	strncpy(custTabRec.contractNo, custLogRec.contractNo, 15);
	strncpy(custTabRec.approvalRefNo, custLogRec.approvalRefNo, 15);
	strncpy(custTabRec.purposeOfAccount, custLogRec.purposeOfAccount, 50);
	strncpy(custTabRec.govtShareHoldingPerc, custLogRec.govtShareHoldingPerc, 3);
	strncpy(custTabRec.saudiShareHoldingPerc, custLogRec.saudiShareHoldingPerc, 3);
	strncpy(custTabRec.foreignShareHoldingPerc, custLogRec.foreignShareHoldingPerc, 3);
	strncpy(custTabRec.documentsSupplied, custLogRec.documentsSupplied, 60);
	custTabRec.overrideForExistingCust = custLogRec.overrideForExistingCust;
	custTabRec.overrideForNoSamaAuth = custLogRec.overrideForNoSamaAuth;
	custTabRec.overrideForNonSaudi = custLogRec.overrideForNonSaudi;

	strncpy(custTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custTabRec.lastUpdateDateTime, tmpStr, 14);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( isRewcurr(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] : ISREWCURR error %d on stcusttab for the key [%.7s]\n", getDateTime(), PID, iserrno, custTabRec.custNo );
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
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
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to custTabFile (%d) ..\n", getDateTime(), PID, custTabFile);
			fflush(logFp);
		}
		if ( isWrite(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stcusttab for key=%.7s\n", getDateTime(), PID, iserrno, custTabRec.custNo);
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "add action : iswrite on stcusttab successful\n");
			fflush(logFp);
		}
	}

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] stcusttab update is complete; About to update Owner information\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* Update/write owner information */
	memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);
	memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);
	strncpy(ownerTabRec.ownerNo, "0000", 4);

	strncpy(ownerLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(ownerLogRec.userId, custLogRec.userId, 10);
	strncpy(ownerLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(ownerLogFile, &ownerLogKey, 1);
	isstart(ownerLogFile, &ownerLogKey, 28, &ownerLogRec.liveChar, ISGTEQ);

	while( isRead(ownerLogFile, &ownerLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(ownerLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(ownerLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( extraDebug )
		{
			fprintf(logFp, "entered while(ownerlogfile); iserrno [%d] ; ownerLogKey [%.28s] ; custlogkey[%.38s]; newOrUpdat [%c] ; Log.ownerNo [%.4s]; Tab.ownerNo [%.4s]\n", iserrno, ownerLogRec.branchCode, custLogRec.branchCode, receivedMsg.supDecision.newOrUpdate, ownerLogRec.ownerNo, ownerTabRec.ownerNo);
			fflush(logFp);
		}

		if ( receivedMsg.supDecision.newOrUpdate == 'N' )
		{
			if ( strncmp(ownerLogRec.ownerNo, ownerTabRec.ownerNo, 4) <= 0 )
				break;
		}

		if ( ownerLogRec.recordChanged == 'N' )
			continue;

		ownerLogRec.recordChanged = 'N';
		
		strncpy(ownerLogRec.custNo, custLogRec.custNo, 7);

		ownerLogRec.bmUpdateStatus = '9'; /* completed */

		strncpy(ownerLogRec.lastUpdateBmDate, bankingDate, 8);

		strncpy(ownerLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(ownerLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(ownerLogFile, &ownerLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stownlog for the key [%.28s %.7s]\n", getDateTime(), PID, iserrno, ownerLogRec.branchCode, ownerLogRec.custNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record on stownlog");
				formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stownlog" );
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stownlog", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Owner log update is complete; About to read Owner ID details from stidlog\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Read corresponding Id Log */

		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
		strncpy(idLogRec.branchCode, custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
		idLogRec.idType = ownerLogRec.idType;
		strncpy(idLogRec.idNo, ownerLogRec.idNo, 15);
		idLogRec.idCategory = 'W';

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

		if ( readIdLogFile(ISEQUAL) < 0 )
		{
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		strncpy(idLogRec.custNo, ownerLogRec.custNo, 7);

		idLogRec.bmUpdateStatus = '9'; /* completed */

		strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);


		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Read the stidlog and about to update stidtab\n", getDateTime(), PID);
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

		/*if ( readIdTabFile(ISEQUAL) == SUCCESS )*/
		if ( isRead(idTabFile, &idTabRec.liveChar,ISEQUAL) == 0 )
		{
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */

			strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
			idTabRec.newOrUpdate = idLogRec.newOrUpdate;

			sprintf(tmpStr, "%.8s", idLogRec.idExpiryDateG);
			if ( validate(tmpStr) >= 0 )  /* only valid dates to be considered */
			{
				getDateTime();
				sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
				if ( strncmp(tmpStr, currentDate, 8) > 0 )
				{
					if (idTabRec.grace1ActionTaken == '1' || idTabRec.grace2ActionTaken == '1' )
					{
						idLogRec.grace1ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace1ActionDate, "            ",8);
						idLogRec.grace2ActionTaken = '0'; /* NO */
						strncpy(idLogRec.grace2ActionDate, "            ",8);
						ownerLogRec.ownerEnabled = '1'; /* Activate the owner */
					}
				}
			}
			idTabRec.grace1ActionTaken = idLogRec.grace1ActionTaken ; 
			strncpy(idTabRec.grace1ActionDate, idLogRec.grace1ActionDate, 8);
			idTabRec.grace2ActionTaken = idLogRec.grace2ActionTaken ; 
			strncpy(idTabRec.grace2ActionDate, idLogRec.grace2ActionDate, 8);

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s]; and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
			memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
			idTabRec.liveChar='@';
			strncpy(idTabRec.custNo, idLogRec.custNo, 7);
			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 15);
			idTabRec.idCategory = idLogRec.idCategory; /* Owner (W) */
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
			if ( isWrcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing owner Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while reading owner Id in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating owner id in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/* Read corresponding address log */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
		strncpy(addrTabRec.addressNo, "0000", 4);

		strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, custLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
		strncpy(addrLogRec.addressType, "03", 2); /* owner local address */
		strncpy(addrLogRec.addressNo, "0001", 4);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|entered while(addrlogfile); iserrno [%d] ; addrlogkey [%.28s] address type [%.2s]; custlogkey[%.38s]\n", getDateTime(), PID, iserrno, addrLogRec.branchCode, addrLogRec.addressType, custLogRec.branchCode);
				fflush(logFp);
			}
			if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
				 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
				 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
				 break;

			if ( strncmp(addrLogRec.addressNo, ownerLogRec.ownerNo, 4) ) 
				continue;

			if ( receivedMsg.supDecision.newOrUpdate == 'N' )
			{
				if ( strncmp(addrLogRec.addressType, "03", 2) && strncmp(addrLogRec.addressType, "04", 2) )
					break; /* Earlier, it was continue */
				if ( strncmp(addrLogRec.addressNo, addrTabRec.addressNo, 4) <= 0 && 
					 strncmp(addrLogRec.addressType, addrTabRec.addressType, 2) <= 0 )
					break;
			}

			strncpy(addrLogRec.custNo, custLogRec.custNo,7);
			addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision]Update addrlog succeessful...during owner update  addresstype [%.2s]\n", getDateTime(), PID, addrLogRec.addressType);
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before isstart addrlog iserrno [%d]...key [%.28s;%.13s]\n", getDateTime(), PID, iserrno, addrLogRec.branchCode, addrLogRec.custNo);
				fflush(logFp);
			}

			memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

			addrTabRec.liveChar = '@';
			strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
			strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
			strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

			if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) ==  0 )
			{
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.unitNo, 5);
				}

				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);
				if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while updating staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else if ( iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Record not found on staddrtab to update for customer # [%.7s] , addressType=%.2s; addressNo=%.4s; and hence it will be added\n", getDateTime(), PID, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo);
				fflush(logFp);
				memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

				addrTabRec.liveChar = '@';
				strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
				strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
				strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
				strncpy(addrTabRec.address1, addrLogRec.address1, 207);
				addrTabRec.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				{
					strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
					strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
					strncpy(addrTabRec.poBox, addrLogRec.unitNo, 5);
				}

				strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

				addrTabRec.newOrUpdate = 'N';
				strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
				strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
				strncpy(addrTabRec.lastUpdateUser, addrLogRec.lastUpdateUser, 10);
				strncpy(addrTabRec.lastUpdateDateTime, addrLogRec.lastUpdateDateTime, 14);
				if ( isWrcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRCURR error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else 
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}


			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Write to staddrtab is successful for owner address\n", getDateTime(), PID);
				fflush(logFp);
			}
			if ( receivedMsg.supDecision.newOrUpdate == 'N' )
			{
				/* Again start staddrlog so that it will read the next address */
				memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

				strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
				strncpy(addrLogRec.userId, custLogRec.userId, 10);
				strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
				strncpy(addrLogRec.addressType, addrTabRec.addressType, 2);
				strncpy(addrLogRec.addressNo, addrTabRec.addressNo, 4);
				isstart(addrLogFile, &addrLogKey, 0, &addrLogRec.liveChar, ISGTEQ);
			}
			if ( extraDebug )
			{
				fprintf(logFp, " After isstart addrlog iserrno [%d]...key [%.28s;%.13s]\n", iserrno, addrLogRec.branchCode, addrLogRec.custNo);
				fflush(logFp);
			}
		}/* while read(addrLogFile)  */

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Owner address detail update is complete; About to read  stowntab\n", getDateTime(), PID);
			fflush(logFp);
		}

		/* Now, Write/Update stowntab for the above */

		memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);

		ownerTabRec.liveChar = '@';
		strncpy(ownerTabRec.custNo, ownerLogRec.custNo, 7);
		strncpy(ownerTabRec.ownerNo, ownerLogRec.ownerNo, 4);

		if ( isRead(ownerTabFile, &ownerTabRec.liveChar, ISEQUAL) == 0 )
		{
			ownerTabRec.ownerType = ownerLogRec.ownerType;

			strncpy(ownerTabRec.idNo, ownerLogRec.idNo, 15);
			ownerTabRec.idType = ownerLogRec.idType;

			strncpy(ownerTabRec.parentCompanyName, ownerLogRec.parentCompanyName, 213); /*From parentCompanyName to eShortName */
			ownerTabRec.ownerEnabled = ownerLogRec.ownerEnabled;
			strncpy(ownerTabRec.branchCode, ownerLogRec.custBranchCode, 4);

			strncpy(ownerTabRec.lastUpdateBmDate, bankingDate, 8);

			if ( ownerLogRec.newOrUpdate == 'N' )
			{
				strncpy(ownerTabRec.createdUserId, ownerLogRec.userId, 10);
				strncpy(ownerTabRec.createdDateTime, ownerLogRec.dateTime, 14);
			}

			strncpy(ownerTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(ownerTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( isRewcurr(ownerTabFile, &ownerTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stowntab for customer number [%.7s] and owner No [%.4s]\n", getDateTime(), PID, iserrno, ownerTabRec.custNo, ownerTabRec.ownerNo );
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stowntab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Record not found on stowntab to update for customer # [%.7s] and the owner #[%.4s]\n", getDateTime(), PID, ownerLogRec.custNo, ownerLogRec.ownerNo);
			memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);
			ownerTabRec.liveChar = '@';
			strncpy(ownerTabRec.custNo, ownerLogRec.custNo, 7);
			strncpy(ownerTabRec.ownerNo, ownerLogRec.ownerNo, 4);
			ownerTabRec.ownerType = ownerLogRec.ownerType;
			strncpy(ownerTabRec.idNo, ownerLogRec.idNo, 15);
			ownerTabRec.idType = ownerLogRec.idType;
			strncpy(ownerTabRec.parentCompanyName, ownerLogRec.parentCompanyName, 213); /*From parentCompanyName to eShortName */
			ownerTabRec.ownerEnabled = ownerLogRec.ownerEnabled;
			strncpy(ownerTabRec.branchCode, ownerLogRec.custBranchCode, 4);
			strncpy(ownerTabRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(ownerTabRec.createdUserId, ownerLogRec.userId, 10);
			strncpy(ownerTabRec.createdDateTime, ownerLogRec.dateTime, 14);
			strncpy(ownerTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(ownerTabRec.lastUpdateDateTime, tmpStr, 14);
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to ownerTabFile (%d) ..\n", getDateTime(), PID, ownerTabFile);
				fflush(logFp);
			}
			if ( isWrite(ownerTabFile, &ownerTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stowntab for customer number [%.7s] and owner No [%.4s]\n", getDateTime(), PID, iserrno, ownerTabRec.custNo, ownerTabRec.ownerNo );
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stowntab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREAD/ISEQUAL error %d occured on stowntab for customer # [%.7s] and the owner #[%.4s]\n", getDateTime(), PID, iserrno, ownerTabRec.custNo, ownerTabRec.ownerNo);
			fflush(logFp);

			sprintf(tmpStr, "Error %d occured while reading stowntab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] stowntab record is updated\n", getDateTime(), PID);
			fflush(logFp);
		}
		memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);

		strncpy(ownerLogRec.branchCode, custLogRec.branchCode,4);
		strncpy(ownerLogRec.userId, custLogRec.userId, 10);
		strncpy(ownerLogRec.dateTime, custLogRec.dateTime, 14);
		strncpy(ownerLogRec.ownerNo, ownerTabRec.ownerNo, 4);

		isindexinfo(ownerLogFile, &ownerLogKey, 1);
		isstart(ownerLogFile, &ownerLogKey, 28, &ownerLogRec.liveChar, ISGTEQ);
	} /* while read(ownerLogFile) */

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Owner information detail update complete; About to update Bankmaster\n", getDateTime(), PID);
		fflush(logFp);
	}

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
	strncpy(bmCustRec.orgAlphaSearchCode, custLogRec.orgAlphaSearchCode,6);
	strncpy(bmCustRec.primaryMemo, receivedMsg.supDecision.primaryAcc,5);
	bmCustRec.addressType = custLogRec.addressType;
	strncpy(bmCustRec.gprsNo, custLogRec.gprsNo, 8);
	strncpy(bmCustRec.unitNo, custLogRec.unitNo, 5);
	strncpy(bmCustRec.saudiPostalZipCode, custLogRec.zipCode, 10); 
	bmCustRec.nullPad = '\0';


	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] About to update BM customer register\n", getDateTime(), PID);
		fflush(logFp);
	}
	if ( (returnError = updateCrd(bmCustRec)) != SUCCESS )
	{
		sprintf(tmpStr,"Error %d occured while updating CustInfo in BM", returnError);
		fprintf(logFp,"%s|%5d|[processJuristicSuperDecision] : Error %d occured while updating CustInfo in BM for the key [%.7s]\n", getDateTime(), PID, returnError, bmCustRec.custNo);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] BM customer register update is successful; About to commit the updates\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* Successfully wrote into bankmaster  */

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
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
		islogclose();
		sigsetmask(oldSigMask);
		if ( extraDebug )
		{
			fprintf(logFp, "Supervisor update decision action successful\n");
			fflush(logFp);
		}
		closeAllFiles();
		strcpy(tmpStr,"Successful");
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Update activities are completed; Rest is only for addition of account/cards for new customer request\n", getDateTime(), PID);
		fflush(logFp);
	}

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
			fprintf(logFp,"%s : No Account details found for the key %.38s ignored\n", getDateTime(), acctLogRec.branchCode);
			fflush(logFp);
			fprintf(errLogFp,"%s : processSuperDecision() : No Account details found for the key %.38s ignored\n", getDateTime(), acctLogRec.branchCode);
			fflush(errLogFp);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stacclog file", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Stacclog update is accessful. Signatory information will be read from stsignlog for accNo=%.14s\n", getDateTime(), PID, acctLogRec.accNo);
			fflush(logFp);
		}

		/* Read the corresponding Signatory log file */

		memset(&signLogRec.liveChar, ' ', sizeof signLogRec);
		memset(&signTabRec.liveChar, ' ', sizeof signTabRec);
		strncpy(signTabRec.signatoryNo, "0000", 4); /* to prevent repeatation of update */

		strncpy(signLogRec.branchCode, acctLogRec.branchCode,4);
		strncpy(signLogRec.userId, acctLogRec.userId, 10);
		strncpy(signLogRec.dateTime, acctLogRec.dateTime, 14);

		isindexinfo(signLogFile, &signLogKey, 1);
		isstart(signLogFile, &signLogKey, 28, &signLogRec.liveChar, ISGTEQ);
		updateSignatory = NO;

		while ( isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(signLogRec.branchCode, acctLogRec.branchCode, 4) ||
				 strncmp(signLogRec.userId, acctLogRec.userId, 10) ||
				 strncmp(signLogRec.dateTime, acctLogRec.dateTime, 14) )
				 break;

			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Inside while (signLogFile) , signLogRec.accNo [%.14s] ; signTabRec.accNo [%.14s],  acctLogRec.accNo [%.14s] ; signLogRec.signatoryNo, id type , Id No [%.4s] [%c,%.15s] ; signTabRec.signatoryNo , id type, id no [%.4s] [%c,%.15s] \n", getDateTime(), PID, signLogRec.accNo, signTabRec.accNo, acctLogRec.accNo, signLogRec.signatoryNo, signLogRec.idType, signLogRec.idNo, signTabRec.signatoryNo, signTabRec.idType, signTabRec.idNo);
				fflush(logFp);
			}

			if ( receivedMsg.supDecision.newOrUpdate == 'N' )
			{
				if ( strncmp(signLogRec.signatoryNo, signTabRec.signatoryNo, 4) <= 0 ) /*  to prevent signLog update which is already updated */
					break;
			}

/* If signatory already added for this account , then update ; otherwise Write a record in stsignlog for this account */
			if ( strncmp(signLogRec.accNo, acctLogRec.accNo, 14) && strncmp(signLogRec.accNo, "                 ",14) ) 
				updateSignatory = NO;
			else
				updateSignatory = YES;

			strncpy(signLogRec.accNo, acctLogRec.accNo, 14);

			signLogRec.bmUpdateStatus = '9'; /* completed */

			strncpy(signLogRec.lastUpdateBmDate, bankingDate, 8);
			if ( signLogRec.signatoryForOthers == '1' )
				signLogRec.overrideOtherExpatSign = '1';
			else
				signLogRec.overrideOtherExpatSign = '0';

			strncpy(signLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(signLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( updateSignatory == YES )
			{
				if ( isRewcurr(signLogFile, &signLogRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stsignlog for the key [%.28s %.14s]\n", getDateTime(), PID, iserrno, signLogRec.branchCode, signLogRec.accNo );
					fflush(logFp);
					if  ( iserrno == 100 || iserrno == 108 )
					{
						sprintf(tmpStr, "Duplicate record on stsignlog");
						formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
					}
					else if ( iserrno == 107 || iserrno == 113 )
					{
						sprintf(tmpStr, "Record/File locked on stsignlog" );
						formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
					}
					else
					{ 
						sprintf(tmpStr, "CISAM Error %d occured on stsignlog", iserrno);
						formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
					}
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
			}
			else
			{
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to signLogFile (%d) ..\n", getDateTime(), PID, signLogFile);
					fflush(logFp);
				}
				if ( isWrite(signLogFile, &signLogRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stsignlog for the key [%.28s %.14s] IGNORED ;\n", getDateTime(), PID, iserrno, signLogRec.branchCode, signLogRec.accNo );
					fflush(logFp);
					/*
					if  ( iserrno == 100 || iserrno == 108 ) 
					{
						sprintf(tmpStr, "Duplicate record on stsignlog");
						formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
					}
					else if ( iserrno == 107 || iserrno == 113 )
					{
						sprintf(tmpStr, "Record/File locked on stsignlog" );
						formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
					}
					else
					{ 
						sprintf(tmpStr, "CISAM Error %d occured on stsignlog", iserrno);
						formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
					}
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
					*/
				}
			}

			/* Read & Modify the correponding Id Log file */

			memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

			strncpy(idLogRec.branchCode, signLogRec.branchCode, 4);
			strncpy(idLogRec.userId, signLogRec.userId, 10);
			strncpy(idLogRec.dateTime, signLogRec.dateTime, 14);
			idLogRec.idType = signLogRec.idType;
			strncpy(idLogRec.idNo, signLogRec.idNo, 15);
			idLogRec.idCategory = 'S'; /* Signatory */

			isindexinfo(idLogFile, &idLogKey, 1);
			isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

			if ( readIdLogFile(ISEQUAL) < 0 )
			{
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
			strncpy(idLogRec.custNo, &signLogRec.accNo[5], 7);
			idLogRec.bmUpdateStatus = '9'; /* Completed */
			strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating signatory id in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			/* Now , write/update stidtab for the above */

			memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

			idTabRec.liveChar = '@';
			strncpy(idTabRec.custNo, idLogRec.custNo, 7);
			idTabRec.idCategory = idLogRec.idCategory;
			strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);

			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			idTabRec.newOrUpdate = idLogRec.newOrUpdate;

			strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);

			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				if ( iserrno != 100 && iserrno != 108 ) /* Ignore duplicates */
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing signatory Id in stidtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] IGNORED\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
			}

			/* Write stsigntab */

			memset(&signTabRec.liveChar, ' ', sizeof signTabRec);

			signTabRec.liveChar = '@';
			strncpy(signTabRec.accNo, signLogRec.accNo, 14);
			strncpy(signTabRec.signatoryNo, signLogRec.signatoryNo, 4);

			strncpy(signTabRec.idNo, signLogRec.idNo, 15);
			signTabRec.idType = signLogRec.idType;

			strncpy(signTabRec.aFirstName, signLogRec.aFirstName, 221); /*From aFirstName to disbable reason */
			strncpy(signTabRec.branchCode, signLogRec.custBranchCode, 4);

			strncpy(signTabRec.lastUpdateBmDate, bankingDate, 8);

			strncpy(signTabRec.createdUserId, signLogRec.userId, 10);
			strncpy(signTabRec.createdDateTime, signLogRec.dateTime, 14);

			signTabRec.overrideOtherExpatSign = signLogRec.overrideOtherExpatSign;

			strncpy(signTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(signTabRec.lastUpdateDateTime, tmpStr, 14);

			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Before writing to signTabFile (%d) ..\n", getDateTime(), PID, signTabFile);
				fflush(logFp);
			}
			if ( isWrite(signTabFile, &signTabRec.liveChar) < 0 )
			{
				if ( iserrno != 100 && iserrno != 108 ) /* Ignore duplicates */
				{
					fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stsigntab for account number [%.14s] and signatory No [%.4s]\n", getDateTime(), PID, iserrno, signTabRec.accNo, signTabRec.signatoryNo );
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing stsigntab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(signLogFile);isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] ISWRITE error %d on stsigntab for account number [%.14s] and signatory No [%.4s] IGNORED\n", getDateTime(), PID, iserrno, signTabRec.accNo, signTabRec.signatoryNo );
				fflush(logFp);
			}
			if ( receivedMsg.supDecision.newOrUpdate == 'N' )
			{
				/*memset(&signLogRec.liveChar, ' ', sizeof signLogRec);*/

				strncpy(signLogRec.branchCode, acctLogRec.branchCode,4);
				strncpy(signLogRec.userId, acctLogRec.userId, 10);
				strncpy(signLogRec.dateTime, acctLogRec.dateTime, 14);
				if ( strncmp(signLogRec.accNo, signTabRec.accNo, 14) == 0)
					strncpy(signLogRec.accNo, "                       ", 14);
				strncpy(signLogRec.signatoryNo, signTabRec.signatoryNo, 4);

				isindexinfo(signLogFile, &signLogKey, 1);
				isstart(signLogFile, &signLogKey, 0, &signLogRec.liveChar, ISGTEQ);
			}
		} /* while read(signlog) */

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] Signatory Update is complete; About to update BM GL\n", getDateTime(), PID);
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
			fprintf(logFp,"%s :Error %d occured while updating AcctInfo in BM for the accNo [%.14s]\n", getDateTime(), returnError, bmAccRec.accNo);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
			sigsetmask(oldSigMask);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		/* Sucessfully updated in BankMaster  */
		if ( strncmp(ibanAccNo, "                  ", 15) == 0 )
			sprintf(ibanAccNo, "%.24s", gldRec.iban);

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] BM GL Update is complete for this account %.14s\n", getDateTime(), PID, acctLogRec.accNo);
			fflush(logFp);
		}
	}  /* while read acct log file == success  */ 

	/*strncpy(responseMsg.superDecision.ibanAccNo, ibanAccNo, 24);*/

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
	isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile); isclose(signLogFile); isclose(signTabFile); isclose(ownerLogFile); isclose(ownerTabFile);
	custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJuristicSuperDecision] All update process are complete\n", getDateTime(), PID);
		fflush(logFp);
	}
	closeAllFiles();
	responseMsg.superDecision.tpinSelected = 'N';
	memset(responseMsg.superDecision.primaryCard.cardNo, ' ', sizeof responseMsg.superDecision.primaryCard);
	memset(responseMsg.superDecision.suppCard.cardNo, ' ', sizeof responseMsg.superDecision.suppCard);
	strncpy(responseMsg.superDecision.ibanAccNo, ibanAccNo, 24);
	formatSuperDecisionResponse(DONE, "Successful", "Successful");
	unlink(isLogPathName);
	free(isLogPathName);
	sendResponse(responseMsg.superDecision.msgLen);
	return SUCCESS;
}

logJuristicCustomerDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Juristic Customer Detail]\n", receivedMsg.juristic.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.juristic.branchCode); 
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.juristic.userId);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.juristic.dateTime);
	fprintf(logFp, "Creation Or Update Flag  : %c\n", receivedMsg.juristic.creationOrUpdate);
	fprintf(logFp, "bm Update Status	: %c\n", receivedMsg.juristic.bmUpdateStatus);
	fprintf(logFp, "New Or Update Flag	: %c\n", receivedMsg.juristic.newOrUpdate);
	
	fprintf(logFp, "SAMA main category	: %.2s\n", receivedMsg.juristic.samaMainCategory);
	fprintf(logFp, "SAMA sub category	: %.2s\n", receivedMsg.juristic.samaSubCategory);

	fprintf(logFp, "Customer Number		: %.7s\n", receivedMsg.juristic.custNo);
	fprintf(logFp, "Supervisor Id		: %.10s\n", receivedMsg.juristic.supervisorId);
	fprintf(logFp, "Customer Branch Code : %.4s\n", receivedMsg.juristic.custBranchCode);
	fprintf(logFp, "Alternative Branch Code : %.4s\n", receivedMsg.juristic.altBranchCode);
	fflush(logFp);
}
