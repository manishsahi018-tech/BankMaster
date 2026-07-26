/*
	Objective       :       Static data maintenance server 
				            (Modules related to other individual customer opening)

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
#include "srchint.h"
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
#define PENSION_CUSTOMER		'9'			/* Ver 3.2 */

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define IDEXPIRYACTION		0
#define CUSTUPDACTION		1

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, idTabKey1, o3dKey, acctBmKey, pbCustKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, idTabFile1, o3dFile, acctBmFile, pbCustFile; 
extern struct keydesc cndKey, gldKey, thdKey, thd1Key;
extern int thdFile, cndFile, gldFile, thd1File;
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;
extern int hsmKey1, hsmKey2, b24Key1, b24Key2;
extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *pbCustFilePath;

extern  int page, line;
extern 	char pinOffset[4], trk1[80], trk2[40];

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];
char tCustNo[15];
extern char displayWarningMsgOnDuplicateId;

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
struct branchActivityOnId			idLogRec, idLogRec1;
struct branchActivityOnAddress		addrLogRec, addrLogRec1;
struct calendarInfo					calendarRec;
struct idInfo						idTabRec, idTabRec1;
struct addressInfo					addrTabRec;
struct branchActivityOnCustRef		cRefLogRec;
struct customerReferenceInfo		cRefTabRec;
struct categoryConfig				categoryConfigRec;
struct o2d0data						o3dRec;
struct acctBm						acctBmRec;
struct stcustpb						pbCustRec;

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

extern  int searchEngineCallReqd;
extern  char searchEngineLevel;
extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, cRefLogFileOpen, cRefTabFileOpen, o3dFileOpen, acctBmFileOpen, pbCustFileOpen, thdFileOpen, cndFileOpen;

writeIdLogForPhoneHistory(char *homeBranchCode)
{
	char tmpStr[100], tmpStr1[50];
	int idFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[writeIdLogForPhoneHisotry]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&idLogRec1.liveChar, ' ', sizeof idLogRec1);
	memcpy(&idLogRec1.liveChar, &idLogRec.liveChar, sizeof idLogRec);
	strncpy(idLogRec1.branchCode, homeBranchCode, 4);
	idLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[writeIdLogForPhoneHisotry] Before writing to idLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, idLogFile);
		fflush(logFp);
	}

	if ( isWrite(idLogFile, &idLogRec1.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[writeIdLogForPhoneHisotry]  : ISWRITE error %d on stidlog while creating a history record for new customer created through phone ; the key is [%.28s] ; idtype & idNo. [%c;%.15s]; idCategory [%c]\n", getDateTime(), PID, iserrno, idLogRec1.branchCode, idLogRec1.idType, idLogRec1.idNo, idLogRec1.idCategory);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.28s]",idLogRec1.branchCode);
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stidlog" );
			formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		return FAILURE;
	}

	return SUCCESS;
}

updateIdLogForIndividualOthers()
{
	char tmpStr[100], tmpStr1[50];
	int idFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	idLogRec.liveChar = '@';
	strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
	strncpy(idLogRec.userId, receivedMsg.individualOthers.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	strncpy(idLogRec.custNo, custLogRec.custNo,  7);
	idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
	idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
	strncpy(idLogRec.idRefNo, "0000", 4);

	idLogRec.idCategory = 'C'; /* Customer */

	idFoundFlag = NO;
	idLogRec.idType = 'Q';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'Q' ) 
	/*	if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) ||
			 idLogRec.idType != 'Q' ) */
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.individualOthers.iqamaNo, "                                 ", 15) )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('Q');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		
		idLogRec.idType = 'Q';
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.iqamaNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.individualOthers.iqamaIssuedAt,20);
		idLogRec.idDateType = receivedMsg.individualOthers.iqamaDateType;
		if( receivedMsg.individualOthers.iqamaDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.iqamaIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.iqamaIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.individualOthers.iqamaExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.iqamaExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.iqamaIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.iqamaIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.individualOthers.iqamaExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.iqamaExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		idLogRec.iqamaType = receivedMsg.individualOthers.iqamaType;
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
		{
			writeIdLogForPhoneHistory(receivedMsg.individualOthers.branchCode); /* return status is ignored ; please check */
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.individualOthers.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	idLogRec.idType = 'P';
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'P' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}
	/* Write passport details if available */

	if ( strncmp(receivedMsg.individualOthers.passportNo, "                   ", 15) )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('P');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'P';
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.passportNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.individualOthers.ppIssuedAt,20);
		idLogRec.idDateType = receivedMsg.individualOthers.ppDateType;
		if( receivedMsg.individualOthers.ppDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.ppIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.ppIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.individualOthers.ppExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.ppExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.ppIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.ppIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.individualOthers.ppExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.ppExpiryDateG);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before rewriting to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.individualOthers.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.individualOthers.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	idLogRec.idType = 'M'; /* Home Country Id */
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'M' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}
	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	/* Write home country id details if available */
	if ( strncmp(receivedMsg.individualOthers.homeCountryId, "                     ", 15) )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('M');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'M';  /* Home Country Id */
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.homeCountryId, 15);
		idLogRec.idDateType = receivedMsg.individualOthers.homeCountryIdDateType;
		if( receivedMsg.individualOthers.homeCountryIdDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.homeCountryIdIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.homeCountryIdIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.individualOthers.homeCountryIdExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.homeCountryIdExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.homeCountryIdIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.homeCountryIdIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.individualOthers.homeCountryIdExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.homeCountryIdExpiryDateG);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.individualOthers.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	strncpy(idLogRec.userId, receivedMsg.individualOthers.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	idLogRec.idType = 'S'; /* SAMA authorization number */
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'S' )
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	/* Write Sama authorization number details if available */
	if ( strncmp(receivedMsg.individualOthers.samaAuthNo, "                          ", 15) )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('S');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'S';  /* Sama Authorization number */
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.samaAuthNo, 15);
		idLogRec.idDateType = receivedMsg.individualOthers.samaAuthDateType;
		if( receivedMsg.individualOthers.samaAuthDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.samaAuthDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.samaAuthDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.samaAuthDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.samaAuthDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
		}

		strncpy(idLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
			writeIdLogForPhoneHistory(receivedMsg.individualOthers.branchCode); 
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	idFoundFlag = NO;
	idLogRec.idType = 'V'; /* Visa Number */
	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'V' ) 
	/*	if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) ||
			 idLogRec.idType != 'Q' ) */
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);

		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.individualOthers.visaNo, "                                 ", 15) && 
				 receivedMsg.individualOthers.visaNo[0] != NULL )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('V');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		
		idLogRec.idType = 'V';
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.visaNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.individualOthers.visaIssuedAt,20);
		idLogRec.idDateType = receivedMsg.individualOthers.visaDateType;
		if( receivedMsg.individualOthers.visaDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.visaIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.visaIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.individualOthers.visaExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.visaExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.visaIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.visaIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.individualOthers.visaExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.visaExpiryDateG);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
		{
			writeIdLogForPhoneHistory(receivedMsg.individualOthers.branchCode); /* return status is ignored ; please check */
		}
	}
	else
	{
		if ( idFoundFlag == YES )
		{
			if ( isDelcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) ||
			 idLogRec.idType != 'A' ) 
			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(idLogRec.userId, custLogRec.userId,10);
		strncpy(idLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(idLogRec.custNo, custLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(idLogRec.idRefNo, "0000", 4);
		idLogRec.idCategory = 'C'; /* Customer */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( strncmp(receivedMsg.individualOthers.approvalRefNo, "                 ", 15) && 
		 receivedMsg.individualOthers.approvalRefNo[0] != NULL )
	{
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance('A');
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idLogRec.idType = 'A';
		strncpy(idLogRec.idNo, receivedMsg.individualOthers.approvalRefNo, 15);
		idLogRec.idDateType = receivedMsg.individualOthers.appDateType;
		if( receivedMsg.individualOthers.appDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.individualOthers.appIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.appIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.individualOthers.appExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.appExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.individualOthers.appIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.individualOthers.appIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE ) 
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.individualOthers.appExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.individualOthers.appExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.idRefName, receivedMsg.individualOthers.appRefName, 30);
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.individualOthers.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] Before writing to idLogFile (%d) ..\n", getDateTime(), PID, idLogFile);
				fflush(logFp);
			}
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=%.7s and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateIdLogForIndividualOthers] ISDELCURR error %d on stidlog for id type [%c] & id No [%.16s] & custNo [%.7s] and the key is [%.28s] \n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting id info from stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	return SUCCESS;
}

checkIdTabExistance(char idType)
{
	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[checkIdTabExistance] with idType as %c\n", getDateTime(), PID, idType);
		fflush(logFp);
	}
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	isindexinfo(idTabFile, &idTabKey, 2);
	strncpy(idTabRec.custNo, custLogRec.custNo, 7);
	idTabRec.idType = idType;
	idTabRec.idCategory = 'C';

	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	/*if ( readIdTabFile(ISEQUAL) < 0 )*/
	if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) < 0 )
		return FAILURE;
	else
	    return SUCCESS;
}

checkAddrTabExistance(char *addressType)
{

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[checkAddrTabExistance] with addressType as [%.2s]\n", getDateTime(), PID, addressType);
		fflush(logFp);
	}
	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
	isindexinfo(addrTabFile, &addrTabKey, 1);
	strncpy(addrTabRec.custNo, custLogRec.custNo, 7);
	strncpy(addrTabRec.addressType, addressType, 2);
	strncpy(addrTabRec.addressNo, "0000", 4);

	isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

	if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
		return FAILURE;
	else
	    return SUCCESS;
}

writeAddrLogForPhoneHistory(char *homeBranchCode)
{
	char tmpStr[100], tmpStr1[50];
	int retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[writeAddrLogForPhoneHisotry]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrLogRec1.liveChar, ' ', sizeof addrLogRec1);
	memcpy(&addrLogRec1.liveChar, &addrLogRec.liveChar, sizeof addrLogRec);
	strncpy(addrLogRec1.branchCode, homeBranchCode, 4);
	addrLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[writeAddrLogForPhoneHisotry] Before writing to addrLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, addrLogFile);
		fflush(logFp);
	}
	if ( isWrite(addrLogFile, &addrLogRec1.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[writeAddrLogForPhoneHisotry]  : ISWRITE error %d on staddrlog while creating a history record for new customer created through phone ; the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec1.branchCode );
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.28s]",addrLogRec1.branchCode);
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on staddrlog" );
			formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		return FAILURE;
	}

	return SUCCESS;
}

updateAddrLogForIndividualOthers()
{
	char tmpStr[100];
	char addressFoundFlag =NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
	strncpy(addrLogRec.userId, receivedMsg.individualOthers.userId,10);
	strncpy(addrLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
	addrLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
	addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
	strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "00", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}
	if ( addressFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(addrLogRec.userId, custLogRec.userId,10);
		strncpy(addrLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		addrLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(addrLogRec.userId, custLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);
	}

	if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
		 receivedMsg.individualOthers.newOrUpdate == 'U' )
	{
		retStatus = checkAddrTabExistance("00"); /* Check the existance of local address in staddrtab */
		if ( retStatus == SUCCESS )
			addrLogRec.newOrUpdate = 'U';
		else
			addrLogRec.newOrUpdate = 'N';
	}

	strncpy(addrLogRec.addressType, "00", 2); /* customer local/main address */

	addrLogRec.addrType = receivedMsg.individualOthers.addressType;
	if ( receivedMsg.individualOthers.addressType == '1' ) /* Saudi Postal address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.individualOthers.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.individualOthers.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.individualOthers.poBox, 5);
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.individualOthers.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.individualOthers.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.individualOthers.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.individualOthers.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.individualOthers.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.individualOthers.country, 3);
	if ( strncmp(receivedMsg.individualOthers.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode,receivedMsg.individualOthers.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.individualOthers.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.individualOthers.telOffExt, 4);
	if ( strncmp(receivedMsg.individualOthers.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode,receivedMsg.individualOthers.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.individualOthers.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.individualOthers.telHomeExt, 4);
	if ( strncmp(receivedMsg.individualOthers.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode,receivedMsg.individualOthers.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.individualOthers.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.individualOthers.faxExt, 4);
	if ( strncmp(receivedMsg.individualOthers.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo,receivedMsg.individualOthers.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.individualOthers.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.individualOthers.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(addrLogRec.lastUpdateUser, custLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
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
			fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] Before writing to addrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
			fflush(logFp);
		}
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}

	/* If the customer opening is done through phone , write one more record in staddrlog for history purposes */
	if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
		writeAddrLogForPhoneHistory(receivedMsg.individualOthers.branchCode); 

	/* Write Home country address ; if available ; if not, delete it from staddrlog */
	addressFoundFlag = NO;
	strncpy(addrLogRec.userId, receivedMsg.individualOthers.userId, 10);
	strncpy(addrLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.individualOthers.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.individualOthers.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "01", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}
	if ( addressFoundFlag == NO && receivedMsg.individualOthers.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( strncmp(receivedMsg.individualOthers.homeAddress1, "                                 ", 30) &&
		 strncmp(receivedMsg.individualOthers.homePoBox, "               ", 10 ) && 
		 strncmp(receivedMsg.individualOthers.homeCityName, "                       ", 20) && 
		 strncmp(receivedMsg.individualOthers.homeZipCode, "               ", 10) )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
		strncpy(addrLogRec.userId, custLogRec.userId,10);
		strncpy(addrLogRec.dateTime,custLogRec.dateTime,14);
		strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
		addrLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
		strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */

		if ( addressFoundFlag == NO )
		{
			memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

			addrLogRec.liveChar = '@';
			strncpy(addrLogRec.branchCode,custLogRec.branchCode,4);
			strncpy(addrLogRec.userId, custLogRec.userId,10);
			strncpy(addrLogRec.dateTime,custLogRec.dateTime,14);
			strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
			addrLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
			addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;
			strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */
		}
		if ( receivedMsg.individualOthers.creationOrUpdate == 'C' && 
			 receivedMsg.individualOthers.newOrUpdate == 'U' )
		{
			retStatus = checkAddrTabExistance("01"); /* Check the existance of home country address in staddrtab */
			if ( retStatus == SUCCESS )
				addrLogRec.newOrUpdate = 'U';
			else
				addrLogRec.newOrUpdate = 'N';
		}
		if ( receivedMsg.individualOthers.creationOrUpdate == 'U' )
		{
			strncpy(idLogRec.userId, custLogRec.userId, 10);
			strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
		}

		strncpy(addrLogRec.addressType, "01", 2); /* Customer abroad/home country address */

		strncpy(addrLogRec.address1, receivedMsg.individualOthers.homeAddress1, 30);
		strncpy(addrLogRec.address2, receivedMsg.individualOthers.homeAddress2, 30);
		strncpy(addrLogRec.poBox, receivedMsg.individualOthers.homePoBox, 10);
		strncpy(addrLogRec.cityName, receivedMsg.individualOthers.homeCityName, 20);
		strncpy(addrLogRec.zipCode, receivedMsg.individualOthers.homeZipCode, 10);
		strncpy(addrLogRec.country, receivedMsg.individualOthers.homeCountry, 3);
		if ( strncmp(receivedMsg.individualOthers.homeTelOffNo, "           ", 10) )
			strncpy(addrLogRec.telOffAreaCode,receivedMsg.individualOthers.homeTelOffAreaCode,4);
		strncpy(addrLogRec.telOffNo, receivedMsg.individualOthers.homeTelOffNo, 10);
		strncpy(addrLogRec.telOffExt, receivedMsg.individualOthers.homeTelOffExt, 4);
		if ( strncmp(receivedMsg.individualOthers.homeTelHomeNo, "           ", 10) )
			strncpy(addrLogRec.telHomeAreaCode,receivedMsg.individualOthers.homeTelHomeAreaCode,4);
		strncpy(addrLogRec.telHomeNo, receivedMsg.individualOthers.homeTelHomeNo, 10);
		strncpy(addrLogRec.telHomeExt, receivedMsg.individualOthers.homeTelHomeExt, 4);
		if ( strncmp(receivedMsg.individualOthers.homeFaxNo, "           ", 10) )
			strncpy(addrLogRec.faxAreaCode,receivedMsg.individualOthers.homeFaxAreaCode,4);
		strncpy(addrLogRec.faxNo, receivedMsg.individualOthers.homeFaxNo, 10); 
		strncpy(addrLogRec.faxExt, receivedMsg.individualOthers.homeFaxExt, 4);
		if ( strncmp(receivedMsg.individualOthers.homeMobileNo, "05         ", 10) )
			strncpy(addrLogRec.mobileNo,receivedMsg.individualOthers.homeMobileNo,10);
		strncpy(addrLogRec.pagerNo, receivedMsg.individualOthers.homePagerNo, 10);
		strncpy(addrLogRec.eMail, receivedMsg.individualOthers.homeEmail, 30);

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( addressFoundFlag == YES )
		{
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
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
				fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] Before writing to addrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
				fflush(logFp);
			}
			if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}

		/* If the customer opening is done through phone , write one more record in staddrlog for history purposes */
		if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
			writeAddrLogForPhoneHistory(receivedMsg.individualOthers.branchCode); 
	}
	else
	{
		if ( addressFoundFlag == YES )
		{
			if ( isDelcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateAddrLogForIndividualOthers] ISDELCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while deleting address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}
	return SUCCESS;
}

processIndividualOtherCustRequest() 
{
	char tmpStr[100], tmpStr1[100];
	char recdIdType, recdIdNo[20];
	char recdIdIssuedAt[25], recdIdDateType, recdIdIssueDateH[10], recdIdIssueDateG[10] ;
	char recdIdExpiryDateH[10], recdIdExpiryDateG[10], tmpCustNo[20] ;
	int  thisHijriYear, dobHijriYear, customerAge=0;
	char todayHijriDate[10];
	int i, mode,pendingStatus;
	char *isLogPathName;
	int isappLogFp ;
	int errorNo;
	int zeroUpdateReqd=NO, pbCustRecFound=NO;
	int custTabRecFound=NO, primaryAcc=0;
	long oldSigMask;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersCustRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.individualOthers.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.individualOthers.dateTime);
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
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] ISBEGIN error %d;  while customer creation \n", getDateTime(), PID, iserrno);
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
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=NO;
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
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCustTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] : ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	/* temporary fix for Phase-II; valid until the client is changed */

	if ( strncmp(receivedMsg.individualOthers.altBranchCode, "-Inv",4) ==  0 || receivedMsg.individualOthers.altBranchCode[0] == NULL )
		strncpy(receivedMsg.individualOthers.altBranchCode, "000000", 4);
	if ( receivedMsg.individualOthers.updateCardAddressReqd == NULL )
		receivedMsg.individualOthers.updateCardAddressReqd = '0';

	/* Phase-II fixes - ends here */


	/* Check the incoming customer branch code is valid or not */
	if ( readBranchFile("BD", receivedMsg.individualOthers.custBranchCode) == FAILURE )
	{
		sprintf(tmpStr, "Invalid customer branch code received.Please check..");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&custLogRec.liveChar,' ',sizeof custLogRec);

	if ( receivedMsg.individualOthers.newOrUpdate == 'U' && 
		 receivedMsg.individualOthers.creationOrUpdate == 'C' )
	{
		pendingStatus = checkPendingStatus(receivedMsg.individualOthers.custNo);
		if( pendingStatus == SUCCESS )
		{
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  :Customer [%.7s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, receivedMsg.individualOthers.custNo, custLogRec.bmUpdateStatus, custLogRec.userId, custLogRec.branchCode);
			fflush(logFp);
			if ( custLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", custLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", custLogRec.userId, custLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		zeroUpdateReqd = checkZeroUpdateReqd(receivedMsg.individualOthers.custNo);

		custTabRecFound=NO;
		/* custTab read is moved outside of zeroUpdateReqd(if) since custTab record is required during minorOrMajor check */
		memset(&custTabRec.liveChar, ' ', sizeof(custTabRec));
		strncpy(custTabRec.custNo, receivedMsg.individualOthers.custNo, 7);
		isindexinfo(custTabFile, &custTabKey, 1);
		isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);
		if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]: ISREAD/ISEQUAL error %d on stcusttab while reading for the customer [%.7s]  to write 0th update record in stcustlog ;IGNORED\n", getDateTime(), PID, iserrno,custTabRec.custNo);
			fflush(logFp);
		}
		else
			custTabRecFound = YES;

		if ( zeroUpdateReqd == YES )
		{
			if ( custTabRecFound == YES )
			{
				memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

				/*strncpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);*/
				custLogRec1.liveChar = '@';
				strncpy(custLogRec1.branchCode, receivedMsg.individualOthers.homeBranch, 4);
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
					fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Before writing to custLogFile (%d) for 0th Update..\n", getDateTime(), PID, custLogFile);
					fflush(logFp);
				}
				if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
					fflush(logFp);
					fprintf(errLogFp, "%s : processIndividualOtherCustRequest :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]\n", getDateTime(), iserrno,custLogRec1.branchCode);
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
		strncpy(custLogRec.branchCode,receivedMsg.individualOthers.branchCode, 4);
		strncpy(custLogRec.userId, receivedMsg.individualOthers.userId, 10);
		strncpy(custLogRec.dateTime,receivedMsg.individualOthers.dateTime, 14);
		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  :No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), PID, custLogRec.branchCode);
				fflush(logFp);
				fprintf(errLogFp, "%s :processCustRequest(): No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), custLogRec.branchCode);
				fflush(errLogFp);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  :CISAM Error %d occured on stcustlog for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode);
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	if ( strncmp(receivedMsg.individualOthers.iqamaNo, "                      ", 15) )
	{
		recdIdType = 'Q'; /* Iqama No */
		sprintf(recdIdNo, "%.15s", receivedMsg.individualOthers.iqamaNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.individualOthers.iqamaIssuedAt);
		recdIdDateType = receivedMsg.individualOthers.iqamaDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.individualOthers.iqamaIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.individualOthers.iqamaIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.individualOthers.iqamaExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.individualOthers.iqamaExpiryDateG);
	}
	else if ( strncmp(receivedMsg.individualOthers.passportNo, "                         ", 15) )
	{
		recdIdType = 'P'; /* Passport No */
		sprintf(recdIdNo, "%.15s", receivedMsg.individualOthers.passportNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.individualOthers.ppIssuedAt);
		recdIdDateType = receivedMsg.individualOthers.ppDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.individualOthers.ppIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.individualOthers.ppIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.individualOthers.ppExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.individualOthers.ppExpiryDateG);
	}
	else if ( strncmp(receivedMsg.individualOthers.visaNo, "                         ", 15) )
	{
		recdIdType = 'V'; /* Visa No */
		sprintf(recdIdNo, "%.15s", receivedMsg.individualOthers.visaNo);
		sprintf(recdIdIssuedAt, "%.20s", receivedMsg.individualOthers.visaIssuedAt);
		recdIdDateType = receivedMsg.individualOthers.visaDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.individualOthers.visaIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.individualOthers.visaIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.individualOthers.visaExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.individualOthers.visaExpiryDateG);
	}
	else if ( strncmp(receivedMsg.individualOthers.homeCountryId, "                       ", 15) )
	{
		recdIdType = 'M'; /* Home Country Id No */
		sprintf(recdIdNo, "%.15s", receivedMsg.individualOthers.homeCountryId);
		sprintf(recdIdIssuedAt, "%20s", " ");
		recdIdDateType = receivedMsg.individualOthers.homeCountryIdDateType;
		sprintf(recdIdIssueDateH, "%.8s", receivedMsg.individualOthers.homeCountryIdIssueDateH);
		sprintf(recdIdIssueDateG, "%.8s", receivedMsg.individualOthers.homeCountryIdIssueDateG);
		sprintf(recdIdExpiryDateH, "%.8s", receivedMsg.individualOthers.homeCountryIdExpiryDateH);
		sprintf(recdIdExpiryDateG, "%.8s", receivedMsg.individualOthers.homeCountryIdExpiryDateG);
	}

	if( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		strncpy(custLogRec.branchCode,receivedMsg.individualOthers.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.individualOthers.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);

		if ( readCustLogFile(ISEQUAL) < 0 )
		{
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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
	if ( receivedMsg.individualOthers.custOpenSource == 'P' ) 
	{
		strncpy(custLogRec.branchCode,receivedMsg.individualOthers.custBranchCode,4);
		custLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */
	}
	else
		strncpy(custLogRec.branchCode,receivedMsg.individualOthers.branchCode,4);
		/* custLogRec.custOpenSource  should not be set to B as it will overwrite the source flag to "B" for the customers
		   opened through phone */

	/* For the customer record opened through phone, customer branch CSO ID should be replaced in UserId for further use (i.e.,after the customer visits the branch) */
	if ( strncmp(receivedMsg.individualOthers.branchCsoId, "                ", 10) && receivedMsg.individualOthers.branchCsoId[0] != NULL )
	{
		strncpy(custLogRec.userId, receivedMsg.individualOthers.branchCsoId, 10); /* Key change */
		strncpy(custLogRec.dateTime,receivedMsg.individualOthers.branchActionDateTime,14); /* Key change */
	}
	else
	{
		strncpy(custLogRec.userId, receivedMsg.individualOthers.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.individualOthers.dateTime,14);
	}
	custLogRec.newOrUpdate = receivedMsg.individualOthers.newOrUpdate;
	if ( receivedMsg.individualOthers.newOrUpdate == 'N' && receivedMsg.individualOthers.creationOrUpdate == 'C' && 
		 strncmp(receivedMsg.individualOthers.custNo, "          ", 7) == 0 )
	{
		memset(tmpCustNo, NULL, sizeof tmpCustNo);
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Getting next customer number \n", getDateTime(), PID);
		if ( getNextCustNoFromCtl(tmpCustNo) == FAILURE )
		{
			isrollback();
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Obtained number=%.7s\n", getDateTime(), PID, tmpCustNo);
		strncpy(custLogRec.custNo, tmpCustNo, 7);
	}
	else
		strncpy(custLogRec.custNo, receivedMsg.individualOthers.custNo,7);

 
	if ( receivedMsg.individualOthers.newOrUpdate == 'N' && custLogRec.custOpenSource == 'P' )
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
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);

			if ( iserrno != 111  && iserrno != 110 )
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			pbCustRecFound = NO;
		}

		if ( receivedMsg.individualOthers.custOpenSource == 'P' )  /* If it is opened through phone for the first time */
		{
			strncpy(pbCustRec.branchCode, receivedMsg.individualOthers.branchCode, 4);
			strncpy(pbCustRec.userId, receivedMsg.individualOthers.userId,10);
			strncpy(pbCustRec.dateTime,receivedMsg.individualOthers.dateTime,14);
		}

		pbCustRec.pendingStatus = receivedMsg.individualOthers.bmUpdateStatus;
		if ( strncmp(receivedMsg.individualOthers.branchCsoId, "                ", 10) && receivedMsg.individualOthers.branchCsoId[0] != NULL )
		{
			strncpy(pbCustRec.branchCsoId, receivedMsg.individualOthers.branchCsoId, 10); 
			strncpy(pbCustRec.branchActionDateTime, receivedMsg.individualOthers.branchActionDateTime, 14);
		}

		strncpy(pbCustRec.custBranchCode, receivedMsg.individualOthers.custBranchCode, 4);

		strncpy(pbCustRec.lastUpdateUser, custLogRec.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(pbCustRec.lastUpdateDateTime, tmpStr, 14);

		if ( pbCustRecFound == YES )
		{
			if ( isRewcurr(pbCustFile, &pbCustRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  : ISREWCURR error %d on stcustpb  for the customer number [%.7]\n", getDateTime(), PID, iserrno, pbCustRec.custNo );
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
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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
				fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  : ISWRITE error %d on stcustpb for the customer # [%.7s]\n", getDateTime(), PID, iserrno, pbCustRec.custNo );
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
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	custLogRec.bmUpdateStatus = receivedMsg.individualOthers.bmUpdateStatus;

	if ( receivedMsg.individualOthers.creationOrUpdate ==  'C' )
	{
		if ( checkAList  || checkBList || checkCList )
		{
			if ( checkSarABCList(recdIdType, recdIdNo) == FAILURE )
			{
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	strncpy(custLogRec.supervisorId,receivedMsg.individualOthers.supervisorId,10);
	strncpy(custLogRec.custBranchCode,receivedMsg.individualOthers.custBranchCode,4);
	strncpy(custLogRec.samaMainCategory, receivedMsg.individualOthers.samaMainCategory, 2);
	strncpy(custLogRec.samaSubCategory, receivedMsg.individualOthers.samaSubCategory, 2);

	custLogRec.preferredLang = receivedMsg.individualOthers.preferredLang;
	strncpy(custLogRec.nationality,receivedMsg.individualOthers.nationality,3);

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
	strncpy(custLogRec.titleCode,receivedMsg.individualOthers.titleCode,2);
	custLogRec.sexCode = receivedMsg.individualOthers.sexCode;
	custLogRec.maritalStatus = receivedMsg.individualOthers.maritalStatus;
	strncpy(custLogRec.noOfDependents,receivedMsg.individualOthers.noOfDependents,2);
	strncpy(custLogRec.educationCode,receivedMsg.individualOthers.educationCode,2);
	strncpy(custLogRec.professionCode,receivedMsg.individualOthers.professionCode,2);
	strncpy(custLogRec.positionCode,receivedMsg.individualOthers.positionCode,2);
	strncpy(custLogRec.monthlyIncome,receivedMsg.individualOthers.monthlyIncome,2);
	strncpy(custLogRec.ownerShip,receivedMsg.individualOthers.ownerShip,10);
	custLogRec.packageAcc = receivedMsg.individualOthers.packageAcc;
	custLogRec.dobDateType  = receivedMsg.individualOthers.dobDateType;

	if ( receivedMsg.individualOthers.dobDateType == HIJRI ) 
	{
		strncpy(custLogRec.dobDateH,receivedMsg.individualOthers.dobDateH,8);
		sprintf(tmpStr,"%.8s", receivedMsg.individualOthers.dobDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.dobDateG, tmpStr1, 8);
	}
	else
	{
		strncpy(custLogRec.dobDateG,receivedMsg.individualOthers.dobDateG,8);
		sprintf(tmpStr,"%.8s", receivedMsg.individualOthers.dobDateG);
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
			customerAge--;
	}

	if ( custLogRec.minorOrMajor != '1' )
	{
		sprintf(tmpStr, "%.8s", custLogRec.dobDateG);
		if ( validate(tmpStr) >= 0 ) /* only for those holding valid birth dates */
		{
			if ( customerAge < 18 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualCustRequest] %.7s having DOB as [%.8sH:%.8sG] is still a minor and hence flagging him as minor\n", getDateTime(), PID, custLogRec.custNo, custLogRec.dobDateH, custLogRec.dobDateG);
				custLogRec.minorOrMajor = '1';
			}
		}
	}

	if ( receivedMsg.individualOthers.newOrUpdate == 'U' && 
		 receivedMsg.individualOthers.creationOrUpdate == 'C' )
	{ 
		if ( custTabRecFound == YES ) 
		{
			if ( custTabRec.minorOrMajor == '1' ) /* customer is defined as MINOR */
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
								fprintf(logFp, "%s|%5d|[processOtherIndividualCustRequest] %.7s having DOB as [H%.8s;G%.8s] is reached a major age and hence removing the minor flagg \n", getDateTime(), PID, custLogRec.custNo, custLogRec.dobDateH, custLogRec.dobDateG);
								custLogRec.minorOrMajor = '0';
							}
						}
					}
				}
			}
		}
	}
	custLogRec.vipCode = receivedMsg.individualOthers.vipCode;
	custLogRec.residentStatus = receivedMsg.individualOthers.residentStatus;
	strncpy(custLogRec.businessType,receivedMsg.individualOthers.businessType,3);

	strncpy(custLogRec.aFirstName,receivedMsg.individualOthers.aFirstName,15);
	strncpy(custLogRec.a2ndName,receivedMsg.individualOthers.a2ndName,15);
	strncpy(custLogRec.a3rdName,receivedMsg.individualOthers.a3rdName,15);
	strncpy(custLogRec.aLastName,receivedMsg.individualOthers.aLastName,15);
	strncpy(custLogRec.aShortName,receivedMsg.individualOthers.aShortName,30);
	strncpy(custLogRec.eFirstName,receivedMsg.individualOthers.eFirstName,15);
	strncpy(custLogRec.e2ndName,receivedMsg.individualOthers.e2ndName,15);
	strncpy(custLogRec.e3rdName,receivedMsg.individualOthers.e3rdName,15);
	strncpy(custLogRec.eLastName,receivedMsg.individualOthers.eLastName,15);
	strncpy(custLogRec.eShortName,receivedMsg.individualOthers.eShortName,30);

	custLogRec.addressType = receivedMsg.individualOthers.addressType;
	if ( receivedMsg.individualOthers.addressType == '1' ) /* Saudi POST */
	{
		strncpy(custLogRec.unitNo, receivedMsg.individualOthers.poBox, 5); /* The first 5 digits of POBOX is unit No */
		strncpy(custLogRec.gprsNo, receivedMsg.individualOthers.address1, 5); /* The first 5 digits of address1 is GPRS No */
		strncpy(custLogRec.poBox, receivedMsg.individualOthers.poBox, 5); /* The unit no. is copied in POBOX field to avoid problems
																			 in loading to CPDB */

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.individualOthers.address1[5] == '-' )
			receivedMsg.individualOthers.address1[5] = ' ';
	}
	else
		strncpy(custLogRec.poBox,receivedMsg.individualOthers.poBox,10);

    strncpy(custLogRec.address1,receivedMsg.individualOthers.address1,30);
	strncpy(custLogRec.address2,receivedMsg.individualOthers.address2,30);
	strncpy(custLogRec.cityName,receivedMsg.individualOthers.cityName,20);
	strncpy(custLogRec.zipCode,receivedMsg.individualOthers.zipCode,10);
	strncpy(custLogRec.country,receivedMsg.individualOthers.country,3);

	if ( strncmp(receivedMsg.individualOthers.telOffNo, "           ", 10) )
		strncpy(custLogRec.telOffAreaCode,receivedMsg.individualOthers.telOffAreaCode,4);
	strncpy(custLogRec.telOffNo,receivedMsg.individualOthers.telOffNo,10);
	strncpy(custLogRec.telOffExt,receivedMsg.individualOthers.telOffExt,4);
	if ( strncmp(receivedMsg.individualOthers.telHomeNo, "           ", 10) )
		strncpy(custLogRec.telHomeAreaCode,receivedMsg.individualOthers.telHomeAreaCode,4);
	strncpy(custLogRec.telHomeNo,receivedMsg.individualOthers.telHomeNo,10);
	strncpy(custLogRec.telHomeExt,receivedMsg.individualOthers.telHomeExt,4);
	if ( strncmp(receivedMsg.individualOthers.faxNo, "           ", 10) )
		strncpy(custLogRec.faxAreaCode,receivedMsg.individualOthers.faxAreaCode,4);
	strncpy(custLogRec.faxNo,receivedMsg.individualOthers.faxNo,10);
	strncpy(custLogRec.faxExt,receivedMsg.individualOthers.faxExt,4);
	if ( strncmp(receivedMsg.individualOthers.mobileNo, "05         ", 10) )
		strncpy(custLogRec.mobileNo,receivedMsg.individualOthers.mobileNo,10);
	strncpy(custLogRec.pagerNo,receivedMsg.individualOthers.pagerNo,10);
	strncpy(custLogRec.eMail,receivedMsg.individualOthers.eMail,30);

	custLogRec.segmentation = receivedMsg.individualOthers.segmentation;
	strncpy(custLogRec.employerName,receivedMsg.individualOthers.employerName,30);
    strncpy(custLogRec.department,receivedMsg.individualOthers.department,20);
	strncpy(custLogRec.employerPoBox,receivedMsg.individualOthers.employerPoBox,10);
	strncpy(custLogRec.employerCity,receivedMsg.individualOthers.employerCity,20);
	strncpy(custLogRec.employerZipCode,receivedMsg.individualOthers.employerZipCode,10);
	strncpy(custLogRec.documentsSupplied,receivedMsg.individualOthers.documents,60);/*SAR */
	strncpy(custLogRec.documentOther,receivedMsg.individualOthers.documentOther,50);
	custLogRec.singleJointAcc = receivedMsg.individualOthers.singleJointAcc;
	strncpy(custLogRec.noOfJointCustomer, receivedMsg.individualOthers.noOfJointCustomer, 2);
	strncpy(custLogRec.jointAccNameOnCheck, receivedMsg.individualOthers.jointAccNameOnCheck,60); 
	strncpy(custLogRec.jointAccNameOnReports,receivedMsg.individualOthers.jointAccNameOnReports,30);  
	custLogRec.signatureNature = receivedMsg.individualOthers.signatureNature;

	custLogRec.cardType = receivedMsg.individualOthers.cardType;
	custLogRec.electronIntlRequired = receivedMsg.individualOthers.electronIntlRequired;
	strncpy(custLogRec.electronIntlName,receivedMsg.individualOthers.electronIntlName,26);
	custLogRec.electronIntlSuppRequired = receivedMsg.individualOthers.electronIntlSuppRequired;
	strncpy(custLogRec.electronIntlSuppName,receivedMsg.individualOthers.electronIntlSuppName,26);
	custLogRec.deliveryToBranchOrPO = receivedMsg.individualOthers.deliveryToBranchOrPO;
	strncpy(custLogRec.deliveryAddress1,receivedMsg.individualOthers.deliveryAddress1,30);
	strncpy(custLogRec.deliveryAddress2,receivedMsg.individualOthers.deliveryAddress2,30);
	strncpy(custLogRec.deliveryPoBox,receivedMsg.individualOthers.deliveryPoBox,10);
	strncpy(custLogRec.deliveryCity,receivedMsg.individualOthers.deliveryCity,20);
	strncpy(custLogRec.deliveryZip,receivedMsg.individualOthers.deliveryZip,10);
	strncpy(custLogRec.supervisorComments,receivedMsg.individualOthers.supervisorComments,200);

	custLogRec.custType = '0'; /* customer type is moved as Consumer since the existing version should display correctly*/
	custLogRec.updateCardAddressReqd = receivedMsg.individualOthers.updateCardAddressReqd;
	strncpy(custLogRec.altBranchCode, receivedMsg.individualOthers.altBranchCode,4);
	custLogRec.internetBankAcc = receivedMsg.individualOthers.internetBankAcc;
	custLogRec.custAdviceFlag = receivedMsg.individualOthers.custAdviceFlag;

	if ( receivedMsg.individualOthers.excludeFromAtmFees == ' ' || receivedMsg.individualOthers.excludeFromAtmFees == NULL ) /*Ver 8.2 */
		custLogRec.excludeFromAtmFees = 'N'; /* Ver 8.2 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.2 */
		custLogRec.excludeFromAtmFees = receivedMsg.individualOthers.excludeFromAtmFees; /* Ver 8.2 */

	if ( receivedMsg.individualOthers.excludeFromMinBalFees == ' ' || receivedMsg.individualOthers.excludeFromMinBalFees == NULL ) /*Ver 8.2 */
		custLogRec.excludeFromMinBalFees = 'N'; /* Ver 8.2 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.2 */
		custLogRec.excludeFromMinBalFees = receivedMsg.individualOthers.excludeFromMinBalFees; /* Ver 8.2 */

	if ( receivedMsg.individualOthers.pkgStmtFreqOverride == ' ' || receivedMsg.individualOthers.pkgStmtFreqOverride == NULL ) /*Ver 8.7 */
		custLogRec.pkgStmtFreqOverride = 'N'; /* Ver 8.7 */ /* No Update to this field if update coming from Old CSD version */
	else /* Ver 8.7 */
		custLogRec.pkgStmtFreqOverride = receivedMsg.individualOthers.pkgStmtFreqOverride; /* Ver 8.7 */

	custLogRec.updatedForSama = receivedMsg.individualOthers.updatedForSama; 
	strncpy(custLogRec.relationshipManager, receivedMsg.individualOthers.relationshipManager, 25); 
	strncpy(custLogRec.generalMemo, receivedMsg.individualOthers.generalMemo, 25); 

	if ( receivedMsg.individualOthers.accFreezingGracePeriod[0] != NULL ) 
		strncpy(custLogRec.accFreezingGracePeriod, receivedMsg.individualOthers.accFreezingGracePeriod, 3);

	if ( receivedMsg.individualOthers.visaNo[0] != NULL )
		strncpy(custLogRec.visaNo, receivedMsg.individualOthers.visaNo, 15);
	strncpy(custLogRec.passportNo, receivedMsg.individualOthers.passportNo, 15);
	strncpy(custLogRec.homeCountryId, receivedMsg.individualOthers.homeCountryId, 15);
	strncpy(custLogRec.samaAuthNo, receivedMsg.individualOthers.samaAuthNo, 15);
	if ( receivedMsg.individualOthers.approvalRefNo[0] != NULL )
		strncpy(custLogRec.approvalRefNo, receivedMsg.individualOthers.approvalRefNo, 15);
	custLogRec.overrideForCList = custLogRec.foundInCList;
	custLogRec.overrideForExistingCust = custLogRec.existingCustomer;

    memset(&categoryConfigRec.liveChar, ' ', sizeof categoryConfigRec);

	strncpy(categoryConfigRec.recType, "CC", 2);
	strncpy(categoryConfigRec.samaMainCategory, custLogRec.samaMainCategory, 4);
	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &categoryConfigRec.liveChar, ISGTEQ);

	if ( isRead(ctlFile, &categoryConfigRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  ISREAD/ISEQUAL error %d occured while reading Control File for Code No [%.6s]\n", getDateTime(), PID, iserrno,categoryConfigRec.recType);
		fflush(logFp);
	}
	else
	{
		if ( categoryConfigRec.samaApprovalReqd == '1' ) /* SAMA approval required  */
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  SAMA approval required is set as YES [%c] in the category configuration for the main category [%.2s] and the sub category [%.2s]\n", getDateTime(), PID, categoryConfigRec.samaApprovalReqd, categoryConfigRec.samaMainCategory, categoryConfigRec.samaSubCategory);
			fflush(logFp);

			if ( strncmp(custLogRec.samaAuthNo, "                            ", 15) == 0 )
				custLogRec.overrideForNoSamaAuth = '1';
			else
				custLogRec.overrideForNoSamaAuth = '0';
		}
	}

	if ( updateIdLogForIndividualOthers() == FAILURE ) /* Write/Update stidlog for individual others */
	{
		isrollback();
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( updateAddrLogForIndividualOthers() == FAILURE ) /* Write/update staddrlog for individual other */
	{
		isrollback();
		isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
		custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(custLogRec.interGroupAccNo, receivedMsg.individualOthers.interGroupAccNo, 14);
	strncpy(custLogRec.specialRefNo, receivedMsg.individualOthers.specialRefNo, 15);
	if ( receivedMsg.individualOthers.marketingMemo[0] != NULL ) /* to support the previous version */
		strncpy(custLogRec.marketingMemo, receivedMsg.individualOthers.marketingMemo, 25);

	strncpy(custLogRec.lastUpdateUser, receivedMsg.individualOthers.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if( receivedMsg.individualOthers.creationOrUpdate == 'U' )
	{
		if ( isRewcurr(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  : ISREWCURR error %d on stcustlog  for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
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
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  : ISWRITE error %d on stcustlog while creating a new customer/update for key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
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
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	/* If the customer opening is done through phone , write one more record in stcustlog for history purposes */
	if ( receivedMsg.individualOthers.newOrUpdate == 'N' &&  receivedMsg.individualOthers.custOpenSource == 'P' ) 
	{
		memset(&custLogRec1.liveChar, ' ', sizeof custLogRec1);
		memcpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);
		strncpy(custLogRec1.branchCode, receivedMsg.individualOthers.branchCode, 4);
		custLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest] Before writing to custLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  : ISWRITE error %d on stcustlog while creating a history record for new customer created through phone ; the key is [%.38s] IGNORED \n", getDateTime(), PID, iserrno, custLogRec1.branchCode );
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
			isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
			custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
			*/
		}
	}

	if ( receivedMsg.individualOthers.newOrUpdate == 'N' )
	{
		/* Write to stacclog if any account requested */

		if ( strncmp(receivedMsg.individualOthers.currentAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.individualOthers.currentAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			primaryAcc=8; /* primary account : 008-current a/c */
		}

		if ( strncmp(receivedMsg.individualOthers.savingAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.individualOthers.savingAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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

		if ( strncmp(receivedMsg.individualOthers.otherAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.individualOthers.otherAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	if ( receivedMsg.individualOthers.cardType == ' ' ) /* If the request coming from old version */
		receivedMsg.individualOthers.cardType = 'I';

	if ( receivedMsg.individualOthers.newOrUpdate == 'N' && strncmp(custLogRec.custNo, "          ", 7) ) /* if it is New request and the request is not coming from old CSD client version 2.3.2 */
	{
		if ( receivedMsg.individualOthers.electronIntlRequired == '1' ) 
		{
			if ( formatAddCardRequest(receivedMsg.individualOthers.cardType, 'N', 'P', custLogRec.electronIntlName, primaryAcc) == FAILURE ) 
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=pbCustFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		if ( receivedMsg.individualOthers.electronIntlSuppRequired == '1' ) 
		{
			if ( formatAddCardRequest(receivedMsg.individualOthers.cardType, 'N', 'S', custLogRec.electronIntlSuppName, primaryAcc) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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
		fprintf(logFp, "%s|%5d|[processIndividualOtherCustRequest]  :ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custLogFile); isclose(cardTabFile);isclose(cardLogFile);isclose(ctlFile);isclose(acctLogFile);isclose(idLogFile); isclose(addrLogFile); isclose(pbCustFile);
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

processIndividualOthersDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	char *pathName;
	int  tmpCustLogFile;
	struct keydesc  tmpCustLogKey;
	char yearFileToRead[50], currentDateTime[20];
	int  custLogRecFound = NO, addrTabRecFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);

	memset(responseMsg.individualOthersPendingDetail.msgLen,' ',sizeof responseMsg.individualOthersPendingDetail);
	responseMsg.individualOthersPendingDetail.nullPad = '\0';

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);

	isindexinfo(custTabFile, &custTabKey, 1);

	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersDetail] ISSTART/ISEQUAL error %d occured on stcusttab for the customer number [%.7s] \n", getDateTime(), PID, iserrno, custTabRec.custNo);
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
		fprintf(logFp, "%s|%5d|[processIndividualOthersDetail] ISREAD/ISEQUAL error %d occured on crd0data for the customer number [%.7s] [%.6s]\n", getDateTime(), PID, iserrno, custTabRec.custNo, crdRec.accNo);
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

	/* The following if statement is  added after giving the source code to MISYS */
	if ( getRestrictedFlag(crdRec.branchCode) == FAILURE )/* MISYS */
	{
		sprintf(tmpStr, "Branch record is missing in ctlFile [%.4s]", ctlRec.branchCode);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}/* MISYS */

	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		moveTabRecToLog(INDIVIDUAL_OTHERS);
	}

	responseMsg.individualOthersPendingDetail.restrictedBranchFlag = ctlRec.updateRestricted; 

	responseMsg.individualOthersPendingDetail.updatedForSama = custTabRec.updatedForSama; /* MISYS */
	strncpy(responseMsg.individualOthersPendingDetail.relationshipManager, custTabRec.relationshipManager, 25); /* MISYS */
	strncpy(responseMsg.individualOthersPendingDetail.generalMemo, custTabRec.generalMemo, 25); /* MISYS */

	strncpy(responseMsg.individualOthersPendingDetail.custNo,custTabRec.custNo,7);
	/*strncpy(responseMsg.individualOthersPendingDetail.supervisorId, custTabRec.createdUserId,20);*/
	strncpy(responseMsg.individualOthersPendingDetail.custBranchCode, crdRec.branchCode,4);
	strncpy(responseMsg.individualOthersPendingDetail.samaMainCategory, custTabRec.samaMainCategory,  2);
	strncpy(responseMsg.individualOthersPendingDetail.samaSubCategory, custTabRec.samaSubCategory, 2);

	if  ( custTabRec.idType == 'Q' ) /* Iqama number */
	{
		strncpy(responseMsg.individualOthersPendingDetail.iqamaNo, custTabRec.idNo, 15);
		strncpy(responseMsg.individualOthersPendingDetail.iqamaIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.individualOthersPendingDetail.iqamaDateType = custTabRec.idDateType;
		strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'P' )  /* passport number */
	{
		strncpy(responseMsg.individualOthersPendingDetail.passportNo, custTabRec.idNo, 15);
		strncpy(responseMsg.individualOthersPendingDetail.ppIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.individualOthersPendingDetail.ppDateType = custTabRec.idDateType;
		strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'V' )  /* Visa number */
	{
		strncpy(responseMsg.individualOthersPendingDetail.visaNo, custTabRec.idNo, 15);
		strncpy(responseMsg.individualOthersPendingDetail.visaIssuedAt, custTabRec.idIssuedAt, 20);
		responseMsg.individualOthersPendingDetail.visaDateType = custTabRec.idDateType;
		strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	else if ( custTabRec.idType == 'A' ) /* Approval document reference No details */
	{
		strncpy(responseMsg.individualOthersPendingDetail.approvalRefNo, custTabRec.idNo, 15);
		responseMsg.individualOthersPendingDetail.appDateType = custTabRec.idDateType;
		strncpy(responseMsg.individualOthersPendingDetail.appIssueDateH, custTabRec.idIssueDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.appIssueDateG, custTabRec.idIssueDateG, 8);
		strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateH, custTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateG, custTabRec.idExpiryDateG, 8);
	}
	strncpy(responseMsg.individualOthersPendingDetail.address1, custTabRec.address1, 30);
	strncpy(responseMsg.individualOthersPendingDetail.address2, custTabRec.address2, 30);
	strncpy(responseMsg.individualOthersPendingDetail.poBox, custTabRec.poBox, 10);
	strncpy(responseMsg.individualOthersPendingDetail.cityName, custTabRec.cityName, 20);
	strncpy(responseMsg.individualOthersPendingDetail.zipCode, custTabRec.zipCode, 10);
	strncpy(responseMsg.individualOthersPendingDetail.country, custTabRec.country, 3);
	responseMsg.individualOthersPendingDetail.addrType = custTabRec.addressType;
	if ( custTabRec.addressType == '1' ) /* Saudi Postal address */
		strncpy(responseMsg.individualOthersPendingDetail.poBox, custTabRec.unitNo, 5);
	strncpy(responseMsg.individualOthersPendingDetail.telOffAreaCode, custTabRec.telOffAreaCode, 4);
	strncpy(responseMsg.individualOthersPendingDetail.telOffNo, custTabRec.telOffNo, 10);
	strncpy(responseMsg.individualOthersPendingDetail.telOffExt, custTabRec.telOffExt, 4);
	strncpy(responseMsg.individualOthersPendingDetail.telHomeAreaCode, custTabRec.telHomeAreaCode, 4);
	strncpy(responseMsg.individualOthersPendingDetail.telHomeNo, custTabRec.telHomeNo, 10);
	strncpy(responseMsg.individualOthersPendingDetail.telHomeExt, custTabRec.telHomeExt, 4);
	strncpy(responseMsg.individualOthersPendingDetail.faxAreaCode, custTabRec.faxAreaCode, 4);
	strncpy(responseMsg.individualOthersPendingDetail.faxNo, custTabRec.faxNo, 10);
	strncpy(responseMsg.individualOthersPendingDetail.faxExt, custTabRec.faxExt, 4);
	strncpy(responseMsg.individualOthersPendingDetail.mobileNo, custTabRec.mobileNo, 10);
	strncpy(responseMsg.individualOthersPendingDetail.pagerNo, custTabRec.pagerNo, 10);
	strncpy(responseMsg.individualOthersPendingDetail.eMail, custTabRec.eMail, 30);


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
				fprintf(logFp, "%s|%5d|[processIndividualOthersDetail] ISOPEN error %d for %s File IGNORED\n",getDateTime(), PID, iserrno, pathName);
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
				fprintf(logFp, "%s|%5d|[processIndividualOthersDetail] : ISREAD/ISEQUAL error %d on %s for key=%.38s IGNORED and trying to read from stcustlog file\n", getDateTime(), PID, iserrno, yearFileToRead, custLogRec.branchCode);
				fflush(logFp);
			}
			else
			{
				custLogRecFound=YES;
				responseMsg.individualOthersPendingDetail.cardType = custLogRec.cardType ;
				strncpy(&responseMsg.individualOthersPendingDetail.electronIntlRequired, &custLogRec.electronIntlRequired, 155);
			}
			isclose(tmpCustLogFile);
		}
	}

	if ( custLogRecFound == NO )
	{
		/* form the key for reading the custLogFile for getting the Card Information */
		memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
		strncpy(custLogRec.branchCode, custTabRec.branchCode,4);
		strncpy(custLogRec.userId, custTabRec.createdUserId, 20);
		strncpy(custLogRec.dateTime, custTabRec.createdDateTime,14);

		isindexinfo(custLogFile, &custLogKey, 1);
		isstart(custLogFile, &custLogKey,0, &custLogRec.liveChar, ISGTEQ);
		if ( extraDebug )
			fprintf(logFp,"isstart[%d] on stcustlog during enquiry \n", iserrno);

		if ( isRead(custLogFile, &custLogRec.liveChar, ISEQUAL) == 0 )
		{
			if ( extraDebug )
			{
				fprintf(logFp, "read customer info from custlog during enquiry success \n");
				fprintf(logFp, "Card Info  : [%.209s]\n", &custLogRec.electronCardRequired);
			}
			responseMsg.individualOthersPendingDetail.cardType = custLogRec.cardType ;
			strncpy(&responseMsg.individualOthersPendingDetail.electronIntlRequired, &custLogRec.electronIntlRequired, 155);
		}	
	}
   
	/* form the key for reading the Acct File  */
	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	strncpy(acctLogRec.branchCode, custTabRec.branchCode,4);
	strncpy(acctLogRec.userId, custTabRec.createdUserId, 20);
	strncpy(acctLogRec.dateTime, custTabRec.createdDateTime,14);
	memset(acctLogRec.accNo, ' ',14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.individualOthersPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.individualOthersPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.individualOthersPendingDetail.otherAccInfo, otherAccInfo, 11);

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	strncpy(idTabRec.custNo, custTabRec.custNo, 7);
	idTabRec.idCategory = 'C';

	isindexinfo(idTabFile, &idTabKey, 6);
	isstart(idTabFile, &idTabKey, 8, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, custTabRec.custNo, 7) || idTabRec.idCategory != 'C' )
			 break;

		if ( idTabRec.idType == 'Q' ) /* Iqama details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.iqamaNo, idTabRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.iqamaDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateG, idTabRec.idExpiryDateG, 8);
			responseMsg.individualOthersPendingDetail.iqamaType = idTabRec.iqamaType;
		}
		else if ( idTabRec.idType == 'P' ) /* Passport details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.passportNo, idTabRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.ppDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'M' ) /* Home country id details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryId, idTabRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.homeCountryIdDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'S' ) /* Sama authorization number details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthNo, idTabRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.samaAuthDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateG, idTabRec.idIssueDateG, 8);
		}
		else if ( idTabRec.idType == 'V' ) /* Visa number */
		{
			strncpy(responseMsg.individualOthersPendingDetail.visaNo, idTabRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssuedAt, idTabRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.visaDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateG, idTabRec.idExpiryDateG, 8);
		}
		else if ( idTabRec.idType == 'A' ) /* Approval document reference No details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.approvalRefNo, idTabRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.appDateType = idTabRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateH, idTabRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateG, idTabRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateH, idTabRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateG, idTabRec.idExpiryDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appRefName, idTabRec.idRefName, 30);
		}
	}
	/* fields taken from crd0data */
	responseMsg.individualOthersPendingDetail.preferredLang = crdRec.language;
	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		/* Added on 19th Mar 2006 to avoid blank long name update to CRD during the update from branches who does not have name update privilege */
		if ( crdRec.language == ARABIC )
		{
			if ( strncmp(custTabRec.aFirstName, "                                                              ", 60) == 0 )
				responseMsg.individualOthersPendingDetail.preferredLang = ENGLISH;
		}
		else if ( crdRec.language == ENGLISH )
		{
			if ( strncmp(custTabRec.eFirstName, "                                                              ", 60) == 0 )
				responseMsg.individualOthersPendingDetail.preferredLang = ARABIC;
		}
	}
	strncpy(responseMsg.individualOthersPendingDetail.nationality, crdRec.nationality, 3);	
	strncpy(responseMsg.individualOthersPendingDetail.titleCode, crdRec.titleCode, 2);
	responseMsg.individualOthersPendingDetail.vipCode = crdRec.vipFlag;
	responseMsg.individualOthersPendingDetail.residentStatus =crdRec.nonResident;
	strncpy(responseMsg.individualOthersPendingDetail.businessType, crdRec.businessType, 3);	
	responseMsg.individualOthersPendingDetail.packageAcc = crdRec.packageAcc;
	strncpy(responseMsg.individualOthersPendingDetail.altBranchCode, crdRec.alternativeBranchCode,4);
	strncpy(responseMsg.individualOthersPendingDetail.custBranchCode, crdRec.branchCode, 4);
	responseMsg.individualOthersPendingDetail.excludeFromAtmFees = crdRec.excludeFromAtmFees; /* Ver 8.2 */
	responseMsg.individualOthersPendingDetail.excludeFromMinBalFees = crdRec.excludeFromMinBalFees; /* Ver 8.2 */
	responseMsg.individualOthersPendingDetail.pkgStmtFreqOverride = crdRec.pkgStmtFreqOverride; /* Ver 8.7 */

	responseMsg.individualOthersPendingDetail.internetBankAcc = custTabRec.internetBankAcc;
	responseMsg.individualOthersPendingDetail.custAdviceFlag = custTabRec.custAdviceFlag;

	responseMsg.individualOthersPendingDetail.dobDateType = custTabRec.dobDateType;
	strncpy(responseMsg.individualOthersPendingDetail.dobDateH, custTabRec.dobDateH, 8);
	strncpy(responseMsg.individualOthersPendingDetail.dobDateG, custTabRec.dobDateG, 8);
	responseMsg.individualOthersPendingDetail.sexCode = custTabRec.sexCode;
	responseMsg.individualOthersPendingDetail.maritalStatus = custTabRec.marritalStatus;
	strncpy(responseMsg.individualOthersPendingDetail.noOfDependents, custTabRec.noOfDependents, 2);
	strncpy(responseMsg.individualOthersPendingDetail.aFirstName, custTabRec.aFirstName, 180); /* from aFirstname to eShortName */

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
	strncpy(addrTabRec.custNo, custTabRec.custNo, 7);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 7, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrTabFile, &addrTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrTabRec.custNo, custTabRec.custNo, 7) )
			 break;

		if ( strncmp(addrTabRec.addressType, "00", 2) && strncmp(addrTabRec.addressType, "01", 2) ) /* Only customer address*/
			continue;

		if ( strncmp(addrTabRec.addressNo, "0000", 4) )
			continue;

		if ( strncmp(addrTabRec.addressType, "00", 2) == 0 ) /* customer main/local address */
		{
			strncpy(responseMsg.individualOthersPendingDetail.address1, addrTabRec.address1, 30);
			strncpy(responseMsg.individualOthersPendingDetail.address2, addrTabRec.address2, 30);
			strncpy(responseMsg.individualOthersPendingDetail.poBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.individualOthersPendingDetail.cityName, addrTabRec.cityName, 20);
			strncpy(responseMsg.individualOthersPendingDetail.zipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.individualOthersPendingDetail.country, addrTabRec.country, 3);

			responseMsg.individualOthersPendingDetail.addrType = addrTabRec.addrType;
			if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.individualOthersPendingDetail.poBox, addrTabRec.unitNo, 5);

			strncpy(responseMsg.individualOthersPendingDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.telOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.faxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.faxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.mobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.pagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.eMail, addrTabRec.eMail, 30);
		}
		else if ( strncmp(addrTabRec.addressType, "01", 2) == 0 ) /* customer abroad/home address */
		{
			strncpy(responseMsg.individualOthersPendingDetail.homeAddress1, addrTabRec.address1, 30);
			strncpy(responseMsg.individualOthersPendingDetail.homeAddress2, addrTabRec.address2, 30);
			strncpy(responseMsg.individualOthersPendingDetail.homePoBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeCityName, addrTabRec.cityName, 20);
			strncpy(responseMsg.individualOthersPendingDetail.homeZipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountry, addrTabRec.country, 3);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeMobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homePagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeEmail, addrTabRec.eMail, 30);
		}
	}

	strncpy(responseMsg.individualOthersPendingDetail.educationCode, custTabRec.educationCode, 109);/* from eduCode to employerzipcode*/
	strncpy(responseMsg.individualOthersPendingDetail.documents, custTabRec.documentsSupplied, 60);
	strncpy(responseMsg.individualOthersPendingDetail.documentOther, custTabRec.documentOther, 50);
	responseMsg.individualOthersPendingDetail.singleJointAcc = custTabRec.singleJointAcc;
	strncpy(responseMsg.individualOthersPendingDetail.noOfJointCustomer, custTabRec.noOfJointCustomer, 2);
	strncpy(responseMsg.individualOthersPendingDetail.jointAccNameOnCheck, custTabRec.jointAccNameOnCheck, 60);
	strncpy(responseMsg.individualOthersPendingDetail.jointAccNameOnReports, custTabRec.jointAccNameOnReports, 30);
	responseMsg.individualOthersPendingDetail.signatureNature = custTabRec.signatureNature;

	strncpy(responseMsg.individualOthersPendingDetail.interGroupAccNo, custTabRec.interGroupAccNo, 14);
	strncpy(responseMsg.individualOthersPendingDetail.specialRefNo, custTabRec.specialRefNo, 15);
	strncpy(responseMsg.individualOthersPendingDetail.samaAuthNo, custTabRec.samaAuthNo, 15);
	strncpy(responseMsg.individualOthersPendingDetail.marketingMemo, custTabRec.marketingMemo, 25);
	responseMsg.individualOthersPendingDetail.custOpenSource = custTabRec.custOpenSource;
	strncpy(responseMsg.individualOthersPendingDetail.accFreezingGracePeriod, custTabRec.accFreezingGracePeriod, 3);

	getCustomerOpenUpdateInfo(&responseMsg.individualOthersPendingDetail.openUpdateInfo);

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersDetails] After returning from getCustomerOpenUpdateInfo, info is [%.64s]\n", getDateTime(), PID, responseMsg.individualOthersPendingDetail.openUpdateInfo.custOpenDate);
		fflush(logFp);
	}
	responseMsg.individualOthersPendingDetail.foundInTList = '0';
	responseMsg.individualOthersPendingDetail.details[0].englishName[0] = NULL;

    formatIndividualOthersDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.individualOthersPendingDetail.msgLen);
	return SUCCESS;
}

getCustomerOpenUpdateInfo(custStatInfo)
struct customerOpenUpdateInfo *custStatInfo;
{
	char tmpStr[100];
	char *pathName;
	int  tmpCustLogFile;
	struct keydesc  tmpCustLogKey;
	char yearFileToRead[50], currentDateTime[20];
	int  custLogRecFound = NO, i=0, currentYear;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(custStatInfo->custOpenDate, ' ', sizeof custStatInfo);

	strncpy(custStatInfo->custOpenDate, custTabRec.custOpenDate, 8);
	strncpy(custStatInfo->lastUpdateSupervisorId, custTabRec.lastUpdateUser, 10);
	strncpy(custStatInfo->lastUpdateDate, custTabRec.lastUpdateDateTime, 8);

	isindexinfo(custLogFile, &custLogKey, 3);
	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	strncpy(custLogRec.custNo, custTabRec.custNo, 7);
	strncpy(custLogRec.lastUpdateDateTime, "999999999999999", 14);
	if ( isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar, ISGREAT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISSTART/ISGREAT error %d occured on stcustlog for custno & last update date time [%.7s:%.14s] IGNORED\n", getDateTime(), PID, iserrno, custLogRec.custNo, custLogRec.lastUpdateDateTime);
		fflush(logFp);
	}

	if ( isRead(custLogFile, &custLogRec.liveChar, ISPREV) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISREAD/ISPREV error %d occured on stcustlog for customer # [%.7s] & last Update DateTime [%.14s] IGNORED; \n", getDateTime(), PID, iserrno, custLogRec.custNo, custLogRec.lastUpdateDateTime);
		fflush(logFp);
	}
	else
	{
		if ( strncmp(custLogRec.custNo, custTabRec.custNo, 7) == 0 )
		{
			custLogRecFound = YES;
			strncpy(custStatInfo->lastUpdateMakerId, custLogRec.userId, 10);
			strncpy(custStatInfo->lastUpdateBranch, custLogRec.branchCode, 4);
		}
	}

	if ( custLogRecFound == NO )
	{
		getDateTime();
		currentYear = systemDate->tm_year+1900;
		for ( i=currentYear-1; i >= 2000; i-- ) /* YEAR 2000 is hard coded because static data first implemented on 2000 */
		{
			sprintf(tmpStr, "custlog%04d", i);
			pathName = getpath(tmpStr, "static");

			if ( (tmpCustLogFile  = isopen(pathName, ISMANULOCK+ISINPUT)) < 0)
			{
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISOPEN error %d for %s File IGNORED\n",getDateTime(), PID, iserrno, pathName);
					fflush(logFp);
				}
				free(pathName);
				continue;
			}
			free(pathName);
			isindexinfo(tmpCustLogFile, &tmpCustLogKey, 3);
			memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
			strncpy(custLogRec.custNo, custTabRec.custNo, 7);
			strncpy(custLogRec.lastUpdateDateTime, "999999999999999", 14);
			if ( isstart(tmpCustLogFile, &tmpCustLogKey, 0, &custLogRec.liveChar, ISGREAT) < 0 )
			{
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISSTART/ISGREAT error %d occured on custlog%d for custno & last update date time [%.7s:%.14s] IGNORED\n", getDateTime(), PID, iserrno, i, custLogRec.custNo, custLogRec.lastUpdateDateTime);
					fflush(logFp);
				}
			}

			if ( isRead(tmpCustLogFile, &custLogRec.liveChar, ISPREV) < 0 )
			{
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISREAD/ISPREV error %d occured on custlog%d for customer # [%.7s] & last Update DateTime [%.14s] IGNORED; \n", getDateTime(), PID, iserrno, i, custLogRec.custNo, custLogRec.lastUpdateDateTime);
					fflush(logFp);
				}
			}
			else
			{
				if ( strncmp(custLogRec.custNo, custTabRec.custNo, 7) == 0 )
				{
					custLogRecFound = YES;
					strncpy(custStatInfo->lastUpdateMakerId, custLogRec.userId, 10);
					strncpy(custStatInfo->lastUpdateBranch, custLogRec.branchCode, 4);
				}
			}
			isclose(tmpCustLogFile);
			if ( custLogRecFound == YES )
				break;
		}
	}

	custLogRecFound = NO;
	getDateTime();
	currentYear = systemDate->tm_year+1900;
	for ( i=2000; i < currentYear; i++ ) /* YEAR 2000 is hard coded because static data first implemented on 2000 */
	{
		sprintf(tmpStr, "custlog%04d", i);
		pathName = getpath(tmpStr, "static");

		if ( (tmpCustLogFile  = isopen(pathName, ISMANULOCK+ISINPUT)) < 0)
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISOPEN error %d for %s File IGNORED\n",getDateTime(), PID, iserrno, pathName);
				fflush(logFp);
			}
			free(pathName);
			continue;
		}
		free(pathName);
		isindexinfo(tmpCustLogFile, &tmpCustLogKey, 3);
		memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
		strncpy(custLogRec.custNo, custTabRec.custNo, 7);
		strncpy(custLogRec.lastUpdateDateTime, "               ", 14);
		if ( isstart(tmpCustLogFile, &tmpCustLogKey, 7, &custLogRec.liveChar, ISGTEQ) < 0 )
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISSTART/ISGTEQ error %d occured on custlog%d for custno & last update date time [%.7s:%.14s] IGNORED\n", getDateTime(), PID, iserrno, i, custLogRec.custNo, custLogRec.lastUpdateDateTime);
				fflush(logFp);
			}
		}

		if ( isRead(tmpCustLogFile, &custLogRec.liveChar, ISNEXT) < 0 )
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISREAD/ISNEXT error %d occured on custlog%d for customer # [%.7s] & last Update DateTime [%.14s] IGNORED; \n", getDateTime(), PID, iserrno, i, custLogRec.custNo, custLogRec.lastUpdateDateTime);
				fflush(logFp);
			}
		}
		else
		{
			if ( extraDebug )
			{
				fprintf(logFp, "After Reading custlog%d, custNo [%.7s]; custTab.custNo [%.7s]\n", i, custLogRec.custNo, custTabRec.custNo);
				fflush(logFp);
			}
			if ( strncmp(custLogRec.custNo, custTabRec.custNo, 7) == 0 )
			{
				custLogRecFound=YES;
				strncpy(custStatInfo->openMakerId, custLogRec.userId, 10);
				strncpy(custStatInfo->branchOpened, custLogRec.branchCode, 4);
				strncpy(custStatInfo->openSupervisorId, custLogRec.lastUpdateUser, 10);
			}
		}
		isclose(tmpCustLogFile);
		if ( custLogRecFound == YES )
			break;
	}

	if ( custLogRecFound == NO )
	{
		memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
		strncpy(custLogRec.custNo, custTabRec.custNo, 7);
		strncpy(custLogRec.lastUpdateDateTime, "                ", 14);
		if ( isstart(custLogFile, &custLogKey, 7, &custLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISSTART/ISGTEQ error %d occured on stcustlog for custno & last update date time [%.7s:%.14s] IGNORED\n", getDateTime(), PID, iserrno, custLogRec.custNo, custLogRec.lastUpdateDateTime);
			fflush(logFp);
		}

		if ( extraDebug )
		{
			fprintf(logFp, "issstart/isgteq status [%d]\n", iserrno);
			fflush(logFp);
		}

		if ( isRead(custLogFile, &custLogRec.liveChar, ISNEXT) < 0 )
		{
			fprintf(logFp, "%s|%5d|[getCustomerOpenUpdateInfo] ISREAD/ISNEXT error %d occured on stcustlog for customer # [%.7s] & last Update DateTime [%.14s] IGNORED; \n", getDateTime(), PID, iserrno, custLogRec.custNo, custLogRec.lastUpdateDateTime);
			fflush(logFp);
		}
		else
		{
			if ( extraDebug )
			{
				fprintf(logFp, "After Reading custlog, custNo [%.7s]; custTab.custNo [%.7s]\n", custLogRec.custNo, custTabRec.custNo);
				fflush(logFp);
			}
			if ( strncmp(custLogRec.custNo, custTabRec.custNo, 7) == 0 )
			{
				strncpy(custStatInfo->openMakerId, custLogRec.userId, 10);
				strncpy(custStatInfo->branchOpened, custLogRec.branchCode, 4);
				strncpy(custStatInfo->openSupervisorId, custLogRec.lastUpdateUser, 10);
			}
		}
	}

	if ( extraDebug )
	{
		fprintf(logFp, "After Reading stcustlog, statistical information obtained is [%.64s]\n", custStatInfo->custOpenDate);
		fflush(logFp);
	}
	return SUCCESS;
}

processIndividualOthersPendingDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	int  len, i ;
	int  idLogRecFound=NO, addrLogRecFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersPendingDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);
	memset(responseMsg.individualOthersPendingDetail.msgLen,' ',sizeof responseMsg.individualOthersPendingDetail);

	/* Remove NULL char from the record */
	len = sizeof custLogRec;
	for (i = 0 ; i < len; i++)
		if ( custLogRec.branchCode[i] == NULL )
			custLogRec.branchCode[i] = ' ';
	
	strncpy(responseMsg.individualOthersPendingDetail.custNo, custLogRec.custNo,7); 
	strncpy(responseMsg.individualOthersPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);
	strncpy(responseMsg.individualOthersPendingDetail.samaMainCategory, custLogRec.samaMainCategory,  2);
	strncpy(responseMsg.individualOthersPendingDetail.samaSubCategory, custLogRec.samaSubCategory, 2);

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
	strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(idLogRec.userId, custLogRec.userId, 10);
	strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idLogRecFound=NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10 ) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) )

			 break;

		if ( idLogRec.idCategory != 'C' )
			continue;

		if ( idLogRec.idType == 'Q' ) /* Iqama details */
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.iqamaNo, idLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.iqamaDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateG, idLogRec.idExpiryDateG, 8);
			responseMsg.individualOthersPendingDetail.iqamaType = idLogRec.iqamaType;
		}
		else if ( idLogRec.idType == 'P' ) /* Passport details */
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.passportNo, idLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.ppDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'M' ) /* Home country id details */
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryId, idLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.homeCountryIdDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'S' ) /* Sama authorization number details */
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthNo, idLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.samaAuthDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateG, idLogRec.idIssueDateG, 8);
		}
		else if ( idLogRec.idType == 'V' ) 
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.visaNo, idLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssuedAt, idLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.visaDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateG, idLogRec.idExpiryDateG, 8);
		}
		else if ( idLogRec.idType == 'A' ) /* Approval document reference No details */
		{
			idLogRecFound=YES;
			strncpy(responseMsg.individualOthersPendingDetail.approvalRefNo, idLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.appDateType = idLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateH, idLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateG, idLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateH, idLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateG, idLogRec.idExpiryDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appRefName, idLogRec.idRefName, 30);
		}
	}

	if ( idLogRecFound == NO )
	{
		if ( custLogRec.idType == 'Q' ) /* Iqama details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.iqamaNo, custLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.iqamaDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'P' ) /* Passport details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.passportNo, custLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.ppDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.ppExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'V' ) 
		{
			strncpy(responseMsg.individualOthersPendingDetail.visaNo, custLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.visaDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.visaExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'M' ) /* Home country id details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryId, custLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.homeCountryIdDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountryIdExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else if ( custLogRec.idType == 'S' ) /* Sama authorization number details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthNo, custLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.samaAuthDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.samaAuthDateG, custLogRec.idIssueDateG, 8);
		}
		else if ( custLogRec.idType == 'A' ) /* Approval document reference No details */
		{
			strncpy(responseMsg.individualOthersPendingDetail.approvalRefNo, custLogRec.idNo, 15);
			responseMsg.individualOthersPendingDetail.appDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.appExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
		else
		{
			strncpy(responseMsg.individualOthersPendingDetail.iqamaNo, custLogRec.idNo, 15);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssuedAt, custLogRec.idIssuedAt, 20);
			responseMsg.individualOthersPendingDetail.iqamaDateType = custLogRec.idDateType;
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateH, custLogRec.idIssueDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaIssueDateG, custLogRec.idIssueDateG, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateH, custLogRec.idExpiryDateH, 8);
			strncpy(responseMsg.individualOthersPendingDetail.iqamaExpiryDateG, custLogRec.idExpiryDateG, 8);
		}
	}

	responseMsg.individualOthersPendingDetail.preferredLang = custLogRec.preferredLang;
	strncpy(responseMsg.individualOthersPendingDetail.nationality, custLogRec.nationality, 3);
	strncpy(responseMsg.individualOthersPendingDetail.titleCode, custLogRec.titleCode, 2);
	responseMsg.individualOthersPendingDetail.dobDateType = custLogRec.dobDateType;
	strncpy(responseMsg.individualOthersPendingDetail.dobDateH, custLogRec.dobDateH, 8);
	strncpy(responseMsg.individualOthersPendingDetail.dobDateG, custLogRec.dobDateG, 8);
	responseMsg.individualOthersPendingDetail.sexCode = custLogRec.sexCode;
	responseMsg.individualOthersPendingDetail.vipCode = custLogRec.vipCode;
	responseMsg.individualOthersPendingDetail.maritalStatus = custLogRec.maritalStatus;
	strncpy(responseMsg.individualOthersPendingDetail.noOfDependents, custLogRec.noOfDependents, 2);
	responseMsg.individualOthersPendingDetail.residentStatus = custLogRec.residentStatus;
	strncpy(responseMsg.individualOthersPendingDetail.businessType, custLogRec.businessType, 3);
	strncpy(responseMsg.individualOthersPendingDetail.aFirstName, custLogRec.aFirstName, 180); /* from aFirstname to eShortName */

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addrLogRecFound=NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10 ) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )

			 break;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer address */
			continue;

		addrLogRecFound = YES;

		if ( strncmp(addrLogRec.addressType, "00", 2) == 0 ) /* customer main/local address */
		{
			strncpy(responseMsg.individualOthersPendingDetail.address1, addrLogRec.address1, 30);
			strncpy(responseMsg.individualOthersPendingDetail.address2, addrLogRec.address2, 30);
			strncpy(responseMsg.individualOthersPendingDetail.poBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.individualOthersPendingDetail.cityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.individualOthersPendingDetail.zipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.individualOthersPendingDetail.country, addrLogRec.country, 3);

			responseMsg.individualOthersPendingDetail.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.individualOthersPendingDetail.poBox, addrLogRec.unitNo, 5);

			strncpy(responseMsg.individualOthersPendingDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.telOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.telHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.faxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.faxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.mobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.pagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.eMail, addrLogRec.eMail, 30);
		}
		else if ( strncmp(addrLogRec.addressType, "01", 2) == 0 ) /* customer abroad/home address */
		{
			strncpy(responseMsg.individualOthersPendingDetail.homeAddress1, addrLogRec.address1, 30);
			strncpy(responseMsg.individualOthersPendingDetail.homeAddress2, addrLogRec.address2, 30);
			strncpy(responseMsg.individualOthersPendingDetail.homePoBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeCityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.individualOthersPendingDetail.homeZipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeCountry, addrLogRec.country, 3);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeTelHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeFaxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.individualOthersPendingDetail.homeMobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homePagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.individualOthersPendingDetail.homeEmail, addrLogRec.eMail, 30);
		}
	}

	if ( addrLogRecFound == NO )
	{
		strncpy(responseMsg.individualOthersPendingDetail.address1, custLogRec.address1, 30);
		strncpy(responseMsg.individualOthersPendingDetail.address2, custLogRec.address2, 30);
		strncpy(responseMsg.individualOthersPendingDetail.poBox, custLogRec.poBox, 10);
		strncpy(responseMsg.individualOthersPendingDetail.cityName, custLogRec.cityName, 20);
		strncpy(responseMsg.individualOthersPendingDetail.zipCode, custLogRec.zipCode, 10);
		strncpy(responseMsg.individualOthersPendingDetail.country, custLogRec.country, 3);

		responseMsg.individualOthersPendingDetail.addrType = custLogRec.addressType;
		if ( custLogRec.addressType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.individualOthersPendingDetail.poBox, custLogRec.unitNo, 5);

		strncpy(responseMsg.individualOthersPendingDetail.telOffAreaCode, custLogRec.telOffAreaCode, 4);
		strncpy(responseMsg.individualOthersPendingDetail.telOffNo, custLogRec.telOffNo, 10);
		strncpy(responseMsg.individualOthersPendingDetail.telOffExt, custLogRec.telOffExt, 4);
		strncpy(responseMsg.individualOthersPendingDetail.telHomeAreaCode, custLogRec.telHomeAreaCode, 4);
		strncpy(responseMsg.individualOthersPendingDetail.telHomeNo, custLogRec.telHomeNo, 10);
		strncpy(responseMsg.individualOthersPendingDetail.telHomeExt, custLogRec.telHomeExt, 4);
		strncpy(responseMsg.individualOthersPendingDetail.faxAreaCode, custLogRec.faxAreaCode, 4);
		strncpy(responseMsg.individualOthersPendingDetail.faxNo, custLogRec.faxNo, 10);
		strncpy(responseMsg.individualOthersPendingDetail.faxExt, custLogRec.faxExt, 4);
		strncpy(responseMsg.individualOthersPendingDetail.mobileNo, custLogRec.mobileNo, 10);
		strncpy(responseMsg.individualOthersPendingDetail.pagerNo, custLogRec.pagerNo, 10);
		strncpy(responseMsg.individualOthersPendingDetail.eMail, custLogRec.eMail, 30);
	}

	strncpy(responseMsg.individualOthersPendingDetail.educationCode, custLogRec.educationCode, 109);/* from eduCode to employerzipcode*/
	strncpy(responseMsg.individualOthersPendingDetail.documents, custLogRec.documentsSupplied, 60);
	strncpy(responseMsg.individualOthersPendingDetail.documentOther, custLogRec.documentOther, 50);
	responseMsg.individualOthersPendingDetail.singleJointAcc = custLogRec.singleJointAcc;
	responseMsg.individualOthersPendingDetail.packageAcc = custLogRec.packageAcc;
	strncpy(responseMsg.individualOthersPendingDetail.noOfJointCustomer, custLogRec.noOfJointCustomer, 2);
	strncpy(responseMsg.individualOthersPendingDetail.jointAccNameOnCheck, custLogRec.jointAccNameOnCheck, 60);
	strncpy(responseMsg.individualOthersPendingDetail.jointAccNameOnReports, custLogRec.jointAccNameOnReports, 30);
	responseMsg.individualOthersPendingDetail.signatureNature = custLogRec.signatureNature;
	responseMsg.individualOthersPendingDetail.cardType = custLogRec.cardType ;
	responseMsg.individualOthersPendingDetail.electronIntlRequired = custLogRec.electronIntlRequired;
	strncpy(responseMsg.individualOthersPendingDetail.electronIntlName, custLogRec.electronIntlName, 26);
	responseMsg.individualOthersPendingDetail.electronIntlSuppRequired = custLogRec.electronIntlSuppRequired;
	strncpy(responseMsg.individualOthersPendingDetail.electronIntlSuppName, custLogRec.electronIntlSuppName, 26);
	strncpy(&responseMsg.individualOthersPendingDetail.deliveryToBranchOrPO, &custLogRec.deliveryToBranchOrPO, 101); 
																				/* from delivery toBranOrPo to deliveryZipCode */

	responseMsg.individualOthersPendingDetail.newOrUpdate = custLogRec.newOrUpdate;
	responseMsg.individualOthersPendingDetail.internetBankAcc = custLogRec.internetBankAcc;
	responseMsg.individualOthersPendingDetail.custAdviceFlag = custLogRec.custAdviceFlag;
	responseMsg.individualOthersPendingDetail.excludeFromAtmFees = custLogRec.excludeFromAtmFees; /* Ver 8.2 */
	responseMsg.individualOthersPendingDetail.excludeFromMinBalFees = custLogRec.excludeFromMinBalFees; /* Ver 8.2 */
	responseMsg.individualOthersPendingDetail.pkgStmtFreqOverride = custLogRec.pkgStmtFreqOverride; /* Ver 8.7 */
	strncpy(responseMsg.individualOthersPendingDetail.altBranchCode, custLogRec.altBranchCode, 4);
	responseMsg.individualOthersPendingDetail.updatedForSama = custLogRec.updatedForSama; 
	strncpy(responseMsg.individualOthersPendingDetail.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(responseMsg.individualOthersPendingDetail.generalMemo, custLogRec.generalMemo, 25);
	strncpy(responseMsg.individualOthersPendingDetail.interGroupAccNo, custLogRec.interGroupAccNo, 14);
	strncpy(responseMsg.individualOthersPendingDetail.specialRefNo, custLogRec.specialRefNo, 15);
	strncpy(responseMsg.individualOthersPendingDetail.samaAuthNo, custLogRec.samaAuthNo, 15);
	strncpy(responseMsg.individualOthersPendingDetail.marketingMemo, custLogRec.marketingMemo, 25);
	responseMsg.individualOthersPendingDetail.custOpenSource = custLogRec.custOpenSource;
	responseMsg.individualOthersPendingDetail.bmUpdateStatus = custLogRec.bmUpdateStatus;
	strncpy(responseMsg.individualOthersPendingDetail.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3);

	strncpy(responseMsg.individualOthersPendingDetail.supervisorComments, custLogRec.supervisorComments, 200);

	responseMsg.individualOthersPendingDetail.foundInAList = '0';
	responseMsg.individualOthersPendingDetail.foundInBList = '0';
	responseMsg.individualOthersPendingDetail.foundInCList = '0';
	responseMsg.individualOthersPendingDetail.existingCustomer = '0';

	responseMsg.individualOthersPendingDetail.foundInTList = '0';
	responseMsg.individualOthersPendingDetail.details[0].englishName[0] = NULL;

	if ( getSarABCdetails() == FAILURE )
	{
		sendResponse(responseMsg.individualOthersPendingDetail.msgLen);
		return FAILURE;
	}

	responseMsg.individualOthersPendingDetail.foundInAList =  abcSrchCustDetails.foundInAList;
	responseMsg.individualOthersPendingDetail.foundInBList =  abcSrchCustDetails.foundInBList;
	responseMsg.individualOthersPendingDetail.foundInCList =  abcSrchCustDetails.foundInCList;
	strncpy(responseMsg.individualOthersPendingDetail.reportedBank, abcSrchCustDetails.reportedBank, 4);
	strncpy(responseMsg.individualOthersPendingDetail.nameInABCList,abcSrchCustDetails.nameInABCList, 30);

	responseMsg.individualOthersPendingDetail.foundInTList = abcSrchCustDetails.foundInTList;
	strncpy(responseMsg.individualOthersPendingDetail.noOfRecs, abcSrchCustDetails.noOfRecs, 2);
	strncpy(responseMsg.individualOthersPendingDetail.details, abcSrchCustDetails.details, sizeof abcSrchCustDetails.details);
	sprintf(tmpStr, "%.2s", responseMsg.individualOthersPendingDetail.noOfRecs);
	responseMsg.individualOthersPendingDetail.details[atoi(tmpStr)].englishName[0] = NULL;

	/* custBranchCode is copied again to response message to avoid NULL problem when SRCHENGINE tuxedo service is not running; we ignore the failure */
	strncpy(responseMsg.individualOthersPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);

	if ( getSarCustDetails() == FAILURE )
	{
		sendResponse(responseMsg.individualOthersPendingDetail.msgLen);
		return FAILURE;
	}
	responseMsg.individualOthersPendingDetail.existingCustomer = abcSrchCustDetails.existingCustomer;
	if ( abcSrchCustDetails.existingCustomer == '1' )
	{
		if ( custLogRec.newOrUpdate == 'N' )  
		{
			if ( custLogRec.idType == 'I' || custLogRec.idType == 'Q' )
			{
				if ( displayWarningMsgOnDuplicateId == NO )
					responseMsg.individualOthersPendingDetail.displayWarningMsgOnDuplicateId = '0'; /* Stop opening customer */
				else
					responseMsg.individualOthersPendingDetail.displayWarningMsgOnDuplicateId = '1'; /* display warning message */
			}
		}
	}
	strncpy(responseMsg.individualOthersPendingDetail.existCustNo, abcSrchCustDetails.existCustNo, 7);
	strncpy(responseMsg.individualOthersPendingDetail.existCustName, abcSrchCustDetails.existCustName, 30);

	responseMsg.individualOthersPendingDetail.overrideForNoSamaAuth = custLogRec.overrideForNoSamaAuth;

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	/* form the key for reading the Acct File  */
	/*strncpy(acctLogRec.branchCode, receivedMsg.pendingDetail.branchCode,4);*/
	strncpy(acctLogRec.branchCode, custLogRec.branchCode,4);
	strncpy(acctLogRec.userId, receivedMsg.pendingDetail.userId, 10);
	strncpy(acctLogRec.dateTime, receivedMsg.pendingDetail.dateTime,14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.individualOthersPendingDetail.currentAccInfo, currentAccInfo, 11);
	strncpy(responseMsg.individualOthersPendingDetail.savingsAccInfo, savingsAccInfo, 11);
	strncpy(responseMsg.individualOthersPendingDetail.otherAccInfo, otherAccInfo, 11);

    formatIndividualOthersDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.individualOthersPendingDetail.msgLen);
	return SUCCESS;
}

deleteUnwantedIdTabRecord() 
{
	int idTabDelete = NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[deleteUnwantedIdTabRecord]\n", getDateTime(), PID);
		fflush(logFp);
	}
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	isindexinfo(idTabFile, &idTabKey, 2);
	strncpy(idTabRec.custNo, custLogRec.custNo, 7);
	isstart(idTabFile, &idTabKey, 7, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, custLogRec.custNo, 7) )
			break;

		if ( idTabRec.idCategory != 'C' && idTabRec.idCategory != 'J' ) /* only main customer info & Joint to be considered */
			continue;

		idTabDelete = NO;
		if ( idTabRec.idCategory == 'J' ) /* Joint */
		{
			/* 19th Mar 2006:sometimes, customer is updated from joint to single ; and a/c is getting freezed if the 
			   joint id is expired; so, to avoid that, when the customer is updated from joint to single, delete 
			   the JOINT ID also
			*/
			if ( custLogRec.singleJointAcc != '1' ) /* not joint */
				idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'I' && custLogRec.idType != 'I' )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'P' && strncmp(custLogRec.passportNo, "                          ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'H' && strncmp(custLogRec.hafizaNo, "                      ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'F' && strncmp(custLogRec.familyRegnNo, "                     ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'Q' && custLogRec.idType != 'Q' )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'S' && strncmp(custLogRec.samaAuthNo, "                     ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'M' && strncmp(custLogRec.homeCountryId, "                     ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'C' && strncmp(custLogRec.crNo, "                   ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'L' && strncmp(custLogRec.licenseNo, "                             ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'T' && strncmp(custLogRec.contractNo, "                             ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'V' && strncmp(custLogRec.visaNo, "                     ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		else if ( idTabRec.idType == 'D' && strncmp(custLogRec.diplomaticCardNo, "                     ", 15) == 0 )
		{
			idTabDelete = YES;
		}
		if ( idTabRec.idType == ' ' )
			idTabDelete = YES;

		if ( idTabDelete == YES )
		{
			if ( extraDebug )
				fprintf(logFp, "%s|%5d|[deleteUnwantedIdTabRecord] Deleting id details from stidtab for id type [%c] & id No [%.16s] custNo [%.7s] \n", getDateTime(), PID, idTabRec.idType, idTabRec.idNo, idTabRec.custNo );
			if ( isDelcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[deleteUnwantedIdTabRecord] ISDELCURR error %d on stidtab for id type [%c] & id No [%.16s] custNo [%.7s] \n", getDateTime(), PID, iserrno, idTabRec.idType, idTabRec.idNo, idTabRec.custNo );
				fflush(logFp);
				return FAILURE;
			}
		}
	}	
	return SUCCESS;
}

deleteUnwantedAddrTabRecord()
{
	int addrTabDelete = NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[deleteUnWantedAddrTabRecord]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

	isindexinfo(addrTabFile, &addrTabKey, 2);
	strncpy(addrTabRec.custNo, custLogRec.custNo, 7);
	isstart(addrTabFile, &addrTabKey, 7, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrTabFile, &addrTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrTabRec.custNo, custLogRec.custNo, 7) )
			break;

		if ( strncmp(addrTabRec.addressType, "00", 2) && strncmp(addrTabRec.addressType, "01", 2)) /* only main customer info to be considered */
			continue;

		addrTabDelete = NO;
	}
}

processOtherIndividualSuperDecision(reqAction)
char reqAction; /* A - Accept; F - Forward to Teller R - Reject */
{ 
	char tmpStr[200], tmpCurrentNo[10], tmpJointNo[5], tmpAddressNo[10], *isLogPathName;
	char ibanAccNo[30];
	char tNoOfJointCust[10], tmpCustNo[15], currentDate[15];
	int noOfJoint, isappLogFp, returnError, retErr;
	long currentNo, oldSigMask;
	char tmpPackageAcc;
	char tmpAuthLevel[150];
	char *tmpPtr;
	int i, idTabRecFound = NO, addressFoundFlag = NO, custFoundInIdTab=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]\n", getDateTime(), PID);
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] This customer record has already been approved by %.20s [%c] and the customer number assigned is [%.7s] while rejection/forwarding\n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
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
		{
			custLogRec.bmUpdateStatus = '3';  /* 3 is for Rejecting the entry */
			if ( custLogRec.newOrUpdate == 'N' && custLogRec.electronIntlRequired == '1' && strncmp(custLogRec.custNo, "          ", 7) )
			{
				if ( openCardLogFile(ISMANULOCK + ISINOUT)  < 0 )
				{
					fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision()]: ISOPEN error %d on stcardlog, IGNORED \n", getDateTime(), PID, iserrno);
					fflush(errLogFp);
				}

				if ( openCardTabFile(ISMANULOCK + ISINOUT) < 0 )
				{
					fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision()]: ISOPEN error %d on stcardtab, IGNORED \n", getDateTime(), PID, iserrno);
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]: ISSTART error %d on stcardlog for the key [%.28s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode);
					fflush(logFp);
					if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
					{
						fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision()]: No Record found in stcardlog for the key [%.28s]\n", getDateTime(), PID, cardLogRec.branchCode);
					}
					else
					{
						fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision()]: CISAM error %d occured on stcardlog for the key [%.28s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode);
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
						fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision()] : ISREAD/ISEQUAL error %d on stcardtab for the card # [%.19s]\n", getDateTime(), PID, iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}

					if ( isDelcurr(cardTabFile, &cardTabRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISDELCURR error %d on stcardtab for the card # [%.19s]\n", getDateTime(), PID, iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}

					if ( isDelcurr(cardLogFile, &cardLogRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISDELCURR error %d on stcardlog for the key [%.28s] and the card # [%.19s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode, cardLogRec.cardNo);
						fflush(errLogFp);
					}
				}
			}
		}

		if ( receivedMsg.supDecision.activityFlag == 'P' )
		{
			custLogRec.bmUpdateStatus = '5'; /* Rejected by CSO of the branch */
			strncpy(custLogRec.userId, receivedMsg.supDecision.branchCsoId, 10); /* Key change */
			strncpy(custLogRec.dateTime,receivedMsg.supDecision.branchActionDateTime,14); /* Key change */
		}

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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stcustpb for customer number [%.7s] \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
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

			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
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
	if ( pbCustFileOpen == YES )
	{
		isclose(pbCustFile);
		pbCustFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		printf("ISBEGIN error %d while supervisor approval\n", iserrno);
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]ISBEGIN error %d;  while supervisor approval\n", getDateTime(), PID, iserrno);
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

	if ( openPbCustFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile); isclose(jointLogFile);isclose(custTabFile);isclose(jointTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);
		custLogFileOpen=acctLogFileOpen=jointLogFileOpen=custTabFileOpen=jointTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	if ( openCrefLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrefTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	
	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
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
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]: This customer record has already been approved by [%.20s] [%c] and the customer number assigned is [%.7s] while approving \n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
		fflush(logFp);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
		/*
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
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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

		if ( idLogRec.idCategory != 'C' ) /* Only customer information */
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
		idTabRec.idCategory = 'C'; /* Customer */

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			isindexinfo(idTabFile, &idTabKey, 2);

			isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

			if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) == FAILURE )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.15s] ; ID Category [%c]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo, idTabRec.idCategory);
				fflush(logFp);
				if ( iserrno != 111 )
				{
					sprintf(tmpStr, "Error %d while reading customer ID in stidtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				idTabRec.idCategory = 'C'; /* Customer */
				idLogRec.newOrUpdate = 'N';
			}
		}

		if ( idLogRec.idType == 'Q' ) 
			idTabRec.iqamaType = idLogRec.iqamaType;
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

		/* Unfreeze Accounts if expiry date is updated */

		if ( receivedMsg.supDecision.newOrUpdate == 'U' )
		{
			if ( idLogRec.idType == custLogRec.idType ) /* Unfreeze only if the id is a primary id */
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
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(gldFile);isclose(cRefLogFile);isclose(cRefTabFile);
							custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=gldFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(gldFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=gldFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s]  custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( deleteUnwantedIdTabRecord() == FAILURE )
		{
			sprintf(tmpStr, "Error %d while deleting id info in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

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

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer Address No , For joint, it will start with 0001 */
			continue;

		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( addrLogRec.newOrUpdate == 'U' )
		{
			if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
			{
				if ( iserrno != 111 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else /* add a new record into address table - Arul added on 29 Nov 03 */
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] and hence treted as New \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

					addrTabRec.liveChar = '@';
					strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
					strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
					strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
					addrLogRec.newOrUpdate = 'N';
				}
			}
		}

		strncpy(addrTabRec.address1, addrLogRec.address1, 207);

		strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
		if ( addrLogRec.newOrUpdate == 'N' )
		{
			strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
			strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
		}
		addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;
		addrTabRec.addrType = addrLogRec.addrType;
		if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
		{
			strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
			strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
			strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
		}

		strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( addrLogRec.newOrUpdate == 'U' )
		{
			if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
				fflush(logFp);
			}
			if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}/* while read(addrLogFile)  */

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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to custLogFile (%d) ..\n", getDateTime(), PID, custLogFile);
			fflush(logFp);
		}
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
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
	*/

	/* add/update a record to custTab */

	custTabRec.liveChar = '@';

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custTabRec.custNo,custLogRec.custNo,7);
		strncpy(custTabRec.custOpenDate, bankingDate, 8);
	}

	strncpy(custTabRec.lastUpdateBmDate, bankingDate, 8);

	strncpy(custTabRec.branchCode,custLogRec.custBranchCode,4); /* Earlier, this line was kept inside newOrUpdate = 'N' if group */  																/* Now, it is kept outside because main branch code may be updated 
																   from some branch like MANDATE & others */

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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISREAD/ISEQUAL error %d occured while reading crd0data for the customer %.7s [%.6s] ..\n", getDateTime(), PID, iserrno, custLogRec.custNo, crdRec.accNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d on crd0data for customer [%.7s]", iserrno, custLogRec.custNo );
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]ISSTART/ISGTEQ error %d on stuser.dat for %.10s\n", getDateTime(), PID, iserrno, custLogRec.userId);
	fprintf(logFp, "UserFile value is %d\n", userFile);
	strncpy(userRec.userId, custLogRec.userId, 10);
	isRead(userFile, &userRec.liveChar, ISEQUAL);

	if ( iserrno || strncmp(userRec.userId, custLogRec.userId, 10) )
	{
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISREAD/ISEQUAL error %d occured while reading userId [%.10s] and obtained userId from stuser [%.10s]\n", getDateTime(), PID, iserrno, custLogRec.userId, userRec.userId);
		fflush(logFp);
		sprintf(tmpStr, "UserID[%.10s:%.10s] could not be read", custLogRec.userId, userRec.userId);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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

	if( receivedMsg.supDecision.newOrUpdate == 'U' )
		strncpy(custTabRec.noOfJointCustomer, tNoOfJointCust, 2);

	if ( strncmp(&custTabRec.mobileNo[2], "               ", 8) == 0 )
		strncpy(custTabRec.mobileNo, "                   ", 10 );
										
	custTabRec.custType = custLogRec.custType;  /* Customer type is moved since the existing should be able to enquire */
	strncpy(custTabRec.samaMainCategory, custLogRec.samaMainCategory, 2);
	custTabRec.minorOrMajor = custLogRec.minorOrMajor;
	strncpy(custTabRec.samaSubCategory, custLogRec.samaSubCategory, 2);

	custTabRec.internetBankAcc = custLogRec.internetBankAcc;
	custTabRec.custAdviceFlag = custLogRec.custAdviceFlag;

	custTabRec.excludeFromAtmFees =  custLogRec.excludeFromAtmFees; /* Ver 8.2 */
	custTabRec.excludeFromMinBalFees =  custLogRec.excludeFromMinBalFees; /* Ver 8.2 */
	custTabRec.pkgStmtFreqOverride =  custLogRec.pkgStmtFreqOverride; /* Ver 8.7 */

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
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
			}
		}
	}

	custTabRec.updatedForSama = custLogRec.updatedForSama; 
	strncpy(custTabRec.relationshipManager, custLogRec.relationshipManager, 25); 
	strncpy(custTabRec.generalMemo, custLogRec.generalMemo, 25); 

	strncpy(custTabRec.documentsSupplied, custLogRec.documentsSupplied, 60);
	strncpy(custTabRec.passportNo, custLogRec.passportNo, 15);
	strncpy(custTabRec.visaNo, custLogRec.visaNo, 15);
	strncpy(custTabRec.homeCountryId, custLogRec.homeCountryId, 15);
	strncpy(custTabRec.samaAuthNo, custLogRec.samaAuthNo, 15);
	custTabRec.overrideForCList = custLogRec.overrideForCList;
	custTabRec.overrideForExistingCust = custLogRec.overrideForExistingCust;

	strncpy(custTabRec.interGroupAccNo, custLogRec.interGroupAccNo, 14);
	strncpy(custTabRec.specialRefNo, custLogRec.specialRefNo, 15);
	strncpy(custTabRec.marketingMemo, custLogRec.marketingMemo, 25); 
	strncpy(custTabRec.accFreezingGracePeriod, custLogRec.accFreezingGracePeriod, 3);

	strncpy(custTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custTabRec.lastUpdateDateTime, tmpStr, 14);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( isRewcurr(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISREWCURR error %d on stcusttab for the key [%.7s]\n", getDateTime(), PID, iserrno, custTabRec.custNo );
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		isrelease(custTabFile); 
		if ( extraDebug )
		{
			fprintf(logFp, " update action : isrewcurr on stcusttab successful\n");
			fflush(logFp);
		}
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to custTabFile (%d) ..\n", getDateTime(), PID, custTabFile);
			fflush(logFp);
		}
		if ( isWrite(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISWRITE error %d on stcusttab for key=%.7s\n", getDateTime(), PID, iserrno, custTabRec.custNo);
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]: ISREAD/ISEQUAL error %d on stcustpb while reading for the customer [%.7s];  \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);

			if ( iserrno != 111  && iserrno != 110 )
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustpb", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrelease(pbCustFile);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stcustpb for customer number [%.7s] \n", getDateTime(), PID, iserrno, pbCustRec.custNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating info in stcustpb", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isrelease(pbCustFile);
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			fprintf(logFp, "%s:%5d|[processOtherIndividualSuperDecision] Rerence update: while read(cRefLogFile) entered ; cRefLogKey [%.28s]; custLogKey [%.28s]; reference number [%.4s]; Record Changed=%s\n", getDateTime(), PID, cRefLogRec.branchCode, custLogRec.branchCode, cRefLogRec.referenceNo, cRefLogRec.recordChanged);
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stcreflog for the key [%.28s %.7s]\n", getDateTime(), PID, iserrno, cRefLogRec.branchCode, cRefLogRec.custNo );
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Reference log file update successful for reference # %.4s\n", getDateTime(), PID, cRefLogRec.referenceNo);
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s][REFERENCE]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Currently in Reference info update :Rewcurr idLogFile successful.... idlogkey [%.28s] ; customer no [%.7s] ;id type , id No , id category [%c;%.15s;%c] id Reference number [%.4s]\n", getDateTime(), PID, idLogRec.branchCode, idLogRec.custNo, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory, idLogRec.idRefNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s][REFERENCE]; and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
				fflush(logFp);
			}
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing reference Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][REFERENCE]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while reading referenceId in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] stidtab update for this REFERENCE completed; about to update address info\n", getDateTime(), PID);
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					fflush(logFp);

					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE] and the key is [%.28s]: IGNORED but requires investigation\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				memcpy(&addrLogRec.liveChar, &addrLogRec1.liveChar, sizeof addrLogRec);
			}
			if ( extraDebug )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] staddrlog update for this Reference competed\n", getDateTime(), PID);
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWRCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] staddrtab update competed; About to look for any more address for this reference\n", getDateTime(), PID);
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
					fflush(logFp);
				}
				if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				if ( extraDebug > 8 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] staddrtab record added; About to look for any more address for this reference\n", getDateTime(), PID);
					fflush(logFp);
				}
			}
			else /* ISREAD/ISEQUAL error occurred */
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][REFERENCE]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] staddrtab update for this Reference competed; About to read stcreftab\n", getDateTime(), PID);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stcreftab for customer number [%.7s] and reference No [%.4s]\n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stcreftab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else if ( iserrno == 111 )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Record not found on stcreftab to update for customer # [%.7s] , reference no [%.4s]; and hence it will be added\n", getDateTime(), PID, cRefTabRec.custNo, cRefTabRec.referenceNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to cRefTabFile (%d) ..\n", getDateTime(), PID, cRefTabFile);
				fflush(logFp);
			}
			if ( isWrite(cRefTabFile, &cRefTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on stcreftab for customer number [%.7s] and reference No [%.4s]\n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo );
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stcreftab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on stcreftab for customer # [%.7s] , reference no [%.4s] \n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while reading stcreftab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Update for this Reference competed; Moving on to next reference, if any\n", getDateTime(), PID);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] After isstart before continuing while loop; status [%d]; Reflogkey [%.28s] ; custNo [%.7s]; reference number [%.4s] \n", getDateTime(), PID, iserrno, cRefLogRec.branchCode, cRefLogRec.custNo, cRefLogRec.referenceNo);
				fflush(logFp);
			}
		}
	} /* while read(creflog) */

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
		fprintf(logFp, "About to update BM customer register\n");
		fflush(logFp);
	}
	if ( (returnError = updateCrd(bmCustRec)) != SUCCESS )
	{
		sprintf(tmpStr,"Error %d occured while updating CustInfo in BM", returnError);
		fprintf(logFp,"%s|%5d|[processOtherIndividualSuperDecision] : Error %d occured while updating CustInfo in BM for the key [%.7s]\n", getDateTime(), PID, returnError, bmCustRec.custNo);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( extraDebug )
	{
		fprintf(logFp, "BM customer register update successful\n");
		fflush(logFp);
	}

	/* Successfully wrote into bankmaster  */

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
			fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision]ISSTART/ISGTEQ error %d occured on stjointlog for the key [%.38s%.2s]\n", getDateTime(), PID, iserrno, jointLogRec.branchCode, jointLogRec.jointCustNo);
			fflush(logFp);
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				formatSuperDecisionResponse(END_OF_FILE,"No joint Account Info exists ....", "No joint Account Info exists ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stjointlog", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		while(isRead(jointLogFile,&jointLogRec.liveChar,ISNEXT) == 0)
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
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			idLogRec.idType = jointLogRec.idType;
			strncpy(idLogRec.idNo, jointLogRec.idNo, 15);
			idLogRec.idCategory = 'J'; /* Joint */

			isindexinfo(idLogFile, &idLogKey, 1);
			isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

			if ( readIdLogFile(ISEQUAL) < 0 )
			{
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Record not found on stidtab to update for customer # [%.7s] , idType[%c;%.16s]; for JOINT A/C  and hence it will be added\n", getDateTime(), PID, idLogRec.custNo, idLogRec.idType, idLogRec.idNo);
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
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s][JOINT]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading joint Acct Id in stidtab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			idTabRec.idType = idLogRec.idType;
			strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
			idTabRec.newOrUpdate = idLogRec.newOrUpdate;
			/* Unfreeze Accounts if expiry date is updated */
			if ( receivedMsg.supDecision.newOrUpdate == 'U' )
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
							isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(gldFile);isclose(cRefLogFile);isclose(cRefTabFile);
							custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=gldFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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

			strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
			/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
			if ( jointLogRec.newOrUpdate == 'N' )
			{
				strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
				strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
			}

			strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);

			if (  idTabRecFound == YES )
			{
				if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to idTabFile (%d) ..\n", getDateTime(), PID, idTabFile);
					fflush(logFp);
				}
				if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}

			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] , custNo [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			strncpy(addrLogRec.custNo, jointLogRec.custNo, 7);
			strncpy(addrLogRec.addressType, "00", 2); /* Local ; Since only one address available for joint */
			sprintf(tmpStr, "%.2s", jointLogRec.jointCustNo, 2);
			sprintf(tmpAddressNo, "%04d", atoi(tmpStr));
			strncpy(addrLogRec.addressNo, tmpAddressNo, 4);

			isindexinfo(addrLogFile, &addrLogKey, 1);
			isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);
			addressFoundFlag = NO;
			while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(addrLogRec.branchCode, jointLogRec.branchCode, 4) || 
					 strncmp(addrLogRec.userId,     jointLogRec.userId,    10) || 
					 strncmp(addrLogRec.dateTime,   jointLogRec.dateTime,  14) )
					 break;

				if ( strncmp(addrLogRec.addressType, "00", 2) )
					continue;

				if ( strncmp(&addrLogRec.addressNo[2], jointLogRec.jointCustNo, 2) )
					continue;

				addressFoundFlag = YES;
				break;
			}

			if ( addressFoundFlag == NO )
			{
				memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

				addrLogRec.liveChar = '@';
				strncpy(addrLogRec.branchCode, jointLogRec.branchCode, 4);
				strncpy(addrLogRec.userId, jointLogRec.userId, 10);
				strncpy(addrLogRec.dateTime, jointLogRec.dateTime, 14);
				strncpy(addrLogRec.addressType, "00", 2); /* Local ; Since only one address available for joint */
				sprintf(tmpStr, "%.2s", jointLogRec.jointCustNo, 2);
				sprintf(tmpAddressNo, "%04d", atoi(tmpStr));
				strncpy(addrLogRec.addressNo, tmpAddressNo, 4);
			}

			strncpy(addrLogRec.custNo, custLogRec.custNo, 7);
			addrLogRec.bmUpdateStatus = '9'; /* Completed */

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( addressFoundFlag == YES )
			{
				if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREWRCURR error %d on staddrtab for customer number [%.7s] & address type & address no [%.2s:%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
					fflush(logFp);
				}
				if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d while writing staddrtab; Contact Support", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else /* ISREAD/ISEQUAL error occurred */
			{
				fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s][JOINT]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while reading staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);

				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
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
						isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
						custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISREWCURR error %d on stjointtab for the cust # [%.7s] and joint Cust No[%.2s]\n", getDateTime(), PID, iserrno, jointTabRec.custNo, jointTabRec.jointCustNo );
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
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.superDecision.msgLen);
					return FAILURE;
				}
			}
			else
			{
				jointTabRec.custOpenSource = jointLogRec.custOpenSource;
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] Before writing to jointTabFile (%d) ..\n", getDateTime(), PID, jointTabFile);
					fflush(logFp);
				}
				if ( isWrite(jointTabFile, &jointTabRec.liveChar) < 0)
				{
					fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] : ISWRITE error %d on stjointtab for key=%.7s%.2s\n", getDateTime(), PID, iserrno, jointTabRec.custNo,jointTabRec.jointCustNo);
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
					isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
					custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
		fprintf(logFp, "Jointcustlog & JointcustTab update successful\n");
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
		isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile); isclose(crdFile1);isclose(gldFile1);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
		custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=crdFileOpen=gldFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			fprintf(logFp,"%s|%5d|[processOtherIndividualSuperDecision] : No Account details found for the key %.38s ignored\n", getDateTime(), PID, acctLogRec.branchCode);
			fflush(logFp);
			fprintf(errLogFp,"%s : processSuperDecision() : No Account details found for the key %.38s ignored\n", getDateTime(), acctLogRec.branchCode);
			fflush(errLogFp);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stacclog file", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| updateAcctLogFile() completed for %.14s\n", getDateTime(), PID, acctLogRec.accNo);
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

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| About to update BM GL details\n", getDateTime(), PID);
			fflush(logFp);
		}
		if ( (returnError = updateGld(bmAccRec)) != SUCCESS )
		{
			sprintf(tmpStr,"Error %d occured while updating AcctInfo in BM", returnError);
			fprintf(logFp,"%s|%5d|[processOtherIndividualSuperDecision] :Error %d occured while updating AcctInfo in BM for the accNo [%.14s]\n", getDateTime(), PID, returnError, bmAccRec.accNo);
			isrollback();
			isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
			custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| BM GL update successful\n", getDateTime(), PID);
			fflush(logFp);
		}
	}  /* while read acct log file == success  */ 

	strncpy(responseMsg.superDecision.ibanAccNo, ibanAccNo, 24);

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processOtherIndividualSuperDecision] All update for Accounts completed; proceeding to Card Information update\n", getDateTime(), PID);

	if ( custLogRec.cardType == ' ' || custLogRec.cardType == NULL ) /* if the request coming from old CSD version (before 2.5.9)*/
		custLogRec.cardType = 'I'; 

	if ( strncmp(receivedMsg.supDecision.custNo, "         ",7) )
	{
		if ( custLogRec.electronIntlRequired == '1' )
		{
			if ( updateCardRequest(custLogRec.cardType, 'N', 'P') == FAILURE )
			{
				sprintf(tmpStr,"Error occured while updating primary Intl cardInfo ");
				fprintf(logFp,"%s|%5d|[processOtherIndividualSuperDecision] : Error occured while updating primary intl cardinfo for the card # [%.19s]\n", getDateTime(), PID, cardTabRec.cardNo);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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
				fprintf(logFp,"%s|%5d|[processOtherIndividualSuperDecision] : Error occured while updating supplementary intl cardinfo for the card # [%.19s]\n", getDateTime(), PID, cardTabRec.cardNo);
				isrollback();
				isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
				custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
				sigsetmask(oldSigMask);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
		}
	}

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processIndividualOthersSuperDecision] :ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custTabFile); isclose(custLogFile); isclose(acctLogFile); isclose(jointTabFile); isclose(jointLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);isclose(pbCustFile);isclose(cRefLogFile);isclose(cRefTabFile);
	custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=jointTabFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=pbCustFileOpen=cRefLogFileOpen=cRefTabFileOpen=NO;
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

checkZeroUpdateReqd(char *custNo)
{
	char tmpStr[50];
	int zeroUpdateReqd=YES;

	memset(&custLogRec1.liveChar, ' ', sizeof custLogRec1);
	strncpy(custLogRec1.custNo, custNo, 7);
	isindexinfo(custLogFile, &custLogKey, 3);
	isstart(custLogFile, &custLogKey, 0, &custLogRec1.liveChar, ISGTEQ);

	zeroUpdateReqd=YES;
	while ( isRead(custLogFile, &custLogRec1.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(custLogRec1.custNo, custNo, 7) )
			break;

		if ( custLogRec1.bmUpdateStatus != '9' )
			continue;

		zeroUpdateReqd = NO;
		break;
	}

	return zeroUpdateReqd;
}

formatIndividualOthersDetailResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120], tmpARemarks[55], tmpERemarks[55];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatIndividualOthersDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}

	sprintf(tmpARemarks, "%-50.50s", aRemarks);
	sprintf(tmpERemarks, "%-50.50s", eRemarks);
    
	strncpy(responseMsg.individualOthersPendingDetail.status,responseCode,3);
	strncpy(responseMsg.individualOthersPendingDetail.service,receivedMsg.pendingDetail.service,2);
	strncpy(responseMsg.individualOthersPendingDetail.aRemarks,tmpARemarks,50);
	strncpy(responseMsg.individualOthersPendingDetail.eRemarks,tmpARemarks,50);
    responseMsg.individualOthersPendingDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.individualOthersPendingDetail.msgLen));
	strncpy(responseMsg.individualOthersPendingDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
	      iscleanup();
		  fclose(logFp);
	}
	return SUCCESS;
}

logOtherIndividualCustomerDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Individual Other Customer Detail]\n", receivedMsg.individualOthers.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.individualOthers.branchCode); 
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.individualOthers.userId);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.individualOthers.dateTime);
	fprintf(logFp, "Creation Or Update Flag  : %c\n", receivedMsg.individualOthers.creationOrUpdate);
	fprintf(logFp, "bm Update Status	: %c\n", receivedMsg.individualOthers.bmUpdateStatus);
	fprintf(logFp, "New Or Update Flag	: %c\n", receivedMsg.individualOthers.newOrUpdate);
	
	fprintf(logFp, "SAMA main category	: %.2s\n", receivedMsg.individualOthers.samaMainCategory);
	fprintf(logFp, "SAMA sub category	: %.2s\n", receivedMsg.individualOthers.samaSubCategory);

	fprintf(logFp, "Customer Number		: %.7s\n", receivedMsg.individualOthers.custNo);
	fprintf(logFp, "Supervisor Id		: %.10s\n", receivedMsg.individualOthers.supervisorId);
	fprintf(logFp, "Customer Branch Code : %.4s\n", receivedMsg.individualOthers.custBranchCode);
	fprintf(logFp, "Alternative Branch Code : %.4s\n", receivedMsg.individualOthers.altBranchCode);
	fprintf(logFp, "Package Acc Flag    : %c\n", receivedMsg.individualOthers.packageAcc);
	fprintf(logFp, "Branch CSO ID       : [%.10s]\n", receivedMsg.individualOthers.branchCsoId);
	fprintf(logFp, "Branch ActionDt&Time: [%.14s]\n", receivedMsg.individualOthers.branchActionDateTime);
	fprintf(logFp, "Activity Flag       : [%c]\n", receivedMsg.individualOthers.activityFlag);

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "Acc Freezing GracePeriod : [%.3s]\n", receivedMsg.individualOthers.accFreezingGracePeriod);
		fprintf(logFp, "Visa Number        : [%.15s]\n", receivedMsg.individualOthers.visaNo);
		fprintf(logFp, "Visa Date Type     : [%c]\n", receivedMsg.individualOthers.visaDateType);
		fprintf(logFp, "Visa Issue Date H  : [%.8s]\n", receivedMsg.individualOthers.visaIssueDateH);
		fprintf(logFp, "Visa Issued At 	   : [%.20s]\n", receivedMsg.individualOthers.visaIssuedAt);
		fprintf(logFp, "Visa Issue Date G  : [%.8s]\n", receivedMsg.individualOthers.visaIssueDateG);
		fprintf(logFp, "Visa Expiry Date H : [%.8s]\n", receivedMsg.individualOthers.visaExpiryDateH);
		fprintf(logFp, "Visa Expiry Date G : [%.8s]\n", receivedMsg.individualOthers.visaExpiryDateG);
	}
	fflush(logFp);
}

openPbCustFile(int mode) 
{
	char tmpStr[100];
	if ( pbCustFileOpen == YES )
		return SUCCESS;

	if ( (pbCustFile = isopen(pbCustFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openPbCustFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, pbCustFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stcustpb.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(pbCustFile, &pbCustKey, 1);

	pbCustFileOpen = YES;
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| customer opened through phone (stcustpb) file (%d) successfully opened...\n", getDateTime(), PID, pbCustFile);
		fflush(logFp);
	}
	return SUCCESS;
}

readCustTabFile(mode)
int mode;
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|readCustTabFile() for key value %.7s\n", getDateTime(), PID, custTabRec.custNo);
	if ( isRead(custTabFile, &custTabRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readCustTabFile]  ISREAD/%s error %d on stcusttab for key=%.7s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, custTabRec.custNo);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key [%.7s]",custTabRec.custNo);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached on stcusttab");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stcusttab");
			formatBranchResponse(RECORD_LOCKED,  tmpStr,tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

getAcctInfo(char *currentAccInfo,char *savingsAccInfo, char *otherAccInfo) /* Acct Key must be filled before calling this function*/
{
	char tmpStr[100];
	char tmpBranchCode[4],tmpUserId[20], tmpDateTime[14];
	char *pathName;
	int  tmpAcctLogFile;
	struct keydesc  tmpAcctLogKey;
	char yearFileToRead[50], currentDateTime[20];
	int  acctLogRecFound = NO;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getAcctInfo] with key as %.38s\n", getDateTime(), PID, acctLogRec.branchCode);

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);

	getDateTime();
	sprintf(currentDateTime, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);

	strncpy(tmpBranchCode, acctLogRec.branchCode, 4);
	strncpy(tmpUserId, acctLogRec.userId, 10);
	strncpy(tmpDateTime, acctLogRec.dateTime, 14);

	acctLogRecFound=NO;
	if ( strncmp(currentDateTime, acctLogRec.dateTime, 4) )
	{
		sprintf(yearFileToRead, "acclog%.4s", tmpDateTime);
		pathName = getpath(yearFileToRead, "static");
		if ( (tmpAcctLogFile  = isopen(pathName, ISMANULOCK+ISINPUT)) < 0)
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[getAcctInfo] ISOPEN error %d for %s File IGNORED\n",getDateTime(), PID, iserrno, pathName);
				fflush(logFp);
			}
			free(pathName);
		}
		else
		{
			free(pathName);
			isindexinfo(tmpAcctLogFile, &tmpAcctLogKey, 1); 
			if ( extraDebug )
			{
				fprintf(logFp, "reading information from the file [%s]......\n", yearFileToRead);
				fprintf(logFp, "branch code  : %.4s\n", tmpBranchCode);
				fprintf(logFp, "user Id      : %.10s\n", tmpUserId);
				fprintf(logFp, "date Time    : %.14s\n", tmpDateTime);
			}
			memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
			strncpy(acctLogRec.branchCode, tmpBranchCode, 4);
			strncpy(acctLogRec.userId, tmpUserId, 10);
			strncpy(acctLogRec.dateTime, tmpDateTime, 14);

			isstart(tmpAcctLogFile, &tmpAcctLogKey, 0,&acctLogRec.liveChar,ISGTEQ);

			while ( isRead(tmpAcctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(tmpBranchCode, acctLogRec.branchCode, 4) || strncmp(tmpUserId, acctLogRec.userId, 10) || strncmp(tmpDateTime, acctLogRec.dateTime, 14) )
					break;
				
				if ( strncmp(&acctLogRec.accNo[2],"008",3) == 0 ) /* Current Account Info */
				{
					acctLogRecFound=YES;
					sprintf(tmpStr,"%.2s%s%.2s%.2s%c%c",acctLogRec.accNo,"008",acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
					strncpy(currentAccInfo,tmpStr,11);
				}
				else if ( strncmp(&acctLogRec.accNo[2],"009",3) == 0 ) /* Savings Account Info */
				{
					acctLogRecFound=YES;
					sprintf(tmpStr,"%.2s%s%.2s%.2s%c%c",acctLogRec.accNo,"009",acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
					strncpy(savingsAccInfo,tmpStr,11);
				}
				else
				{
					acctLogRecFound=YES;
					sprintf(tmpStr,"%.2s%.3s%.2s%.2s%c%c",acctLogRec.accNo,&acctLogRec.accNo[2],acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
					strncpy(otherAccInfo,tmpStr,11);
				}
			}
			isclose(tmpAcctLogFile);
		}
	}

	if ( acctLogRecFound == NO )
	{
		isindexinfo(acctLogFile, &acctLogKey, 1);

		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
		strncpy(acctLogRec.branchCode, tmpBranchCode, 4);
		strncpy(acctLogRec.userId, tmpUserId, 10);
		strncpy(acctLogRec.dateTime, tmpDateTime, 14);

		if ( isstart(acctLogFile,&acctLogKey,0,&acctLogRec.liveChar,ISGTEQ) < 0 )
			return SUCCESS;

		if ( extraDebug )
			fprintf(logFp, "isstart success account file.... \n");

		while ( isRead(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(tmpBranchCode, acctLogRec.branchCode, 4) || strncmp(tmpUserId, acctLogRec.userId, 10) || strncmp(tmpDateTime, acctLogRec.dateTime, 14) )
				break;
			
			if ( strncmp(&acctLogRec.accNo[2],"008",3) == 0 ) /* Current Account Info */
			{
				sprintf(tmpStr,"%.2s%s%.2s%.2s%c%c",acctLogRec.accNo,"008",acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
				strncpy(currentAccInfo,tmpStr,11);
			}
			else if ( strncmp(&acctLogRec.accNo[2],"009",3) == 0 ) /* Savings Account Info */
			{
				sprintf(tmpStr,"%.2s%s%.2s%.2s%c%c",acctLogRec.accNo,"009",acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
				strncpy(savingsAccInfo,tmpStr,11);
			}
			else
			{
				sprintf(tmpStr,"%.2s%.3s%.2s%.2s%c%c",acctLogRec.accNo,&acctLogRec.accNo[2],acctLogRec.accStatus,acctLogRec.statementFreq,acctLogRec.checkBook,acctLogRec.droppedAcc);		
				strncpy(otherAccInfo,tmpStr,11);
			}
		}
	}

	return SUCCESS;
}

checkSarCustomerExistance(char idType, char *idNo)
{
	char tmpStr[100];
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkSarCustomerExistance] Id type [%c] ; Id No [%.15s]\n", getDateTime(), PID, idType, idNo);

	if ( openCustTabFile(ISMANULOCK + ISINOUT) < 0 )
		return FAILURE;

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.idNo, idNo,15);
	custTabRec.idType = idType;

	isindexinfo(custTabFile, &custTabKey, 3);
	custLogRec.existingCustomer = '0';

	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp,"%s|%5d|[checkSarCustomerExistance] ISSTART/ISGTEQ error %d on stcusttab for duplicate custNo for ID %.16s\n", getDateTime(), PID, iserrno, custTabRec.idNo);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		{
			custLogRec.existingCustomer = '0';
			return SUCCESS;
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			return FAILURE;
		}
	}

	while ( isread(custTabFile, &custTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( custTabRec.idType != idType || strncmp(custTabRec.idNo, idNo, 15) != 0 )
			break;

		if ( strncmp(custTabRec.custNo, custLogRec.custNo, 7) == 0 )
			continue;

		custLogRec.existingCustomer = '1';
	}

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[checkSarCustomerExistance] iserrno after while [%d]\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}
	
	return SUCCESS;
}


checkSarABCList(char idType, char *idNo)
{
	char tmpStr[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkSarABCList]\n", getDateTime(), PID);

	if ( openABCFile(ISMANULOCK+ISINOUT) < 0 )
		return FAILURE;

	memset(&abcRec.liveChar, ' ', sizeof abcRec);
	strncpy(abcRec.idNo, idNo,15);
	abcRec.idType = idType;

	custLogRec.foundInAList = '0';
	custLogRec.foundInBList = '0';
	custLogRec.foundInCList = '0';

	isindexinfo(abcFile, &abcKey, 1);
	if ( isstart(abcFile, &abcKey, 16, &abcRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp,"%s|%5d|[checkSarABCList] ISSTART/ISGTEQ error %d on stabclist for id=%.16s\n", getDateTime(), PID, iserrno, &abcRec.idType);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		{
			custLogRec.foundInAList = '0';
			custLogRec.foundInBList = '0';
			custLogRec.foundInCList = '0';
			return SUCCESS;
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stabclist", iserrno);
			formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			return FAILURE;
		}
	}
	
	while ( isRead(abcFile, &abcRec.liveChar, ISNEXT) == 0 )
	{
		if (abcRec.idType != idType || strncmp(abcRec.idNo, idNo, 15) != 0 )
			break;

		if ( abcRec.abcListType == 'A' && checkAList )
			custLogRec.foundInAList = '1';

		if ( abcRec.abcListType == 'B' && checkBList )
			custLogRec.foundInBList = '1';
		
		if ( abcRec.abcListType == 'C' && checkCList )
			custLogRec.foundInCList = '1';
	}

	return SUCCESS;
}


getNextCustNoFromCtl(char *tmpCustNo)
{
	char tmpStr[200], tmpCurrentNo[10], tmpJointNo[5], *isLogPathName;
	int noOfJoint, isappLogFp, returnError, retErr, noOfTries=0;
	int whileLoopEntered = NO;
	long currentNo, oldSigMask;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getNextCustNoFromCtl]\n", getDateTime(), PID);

	memset(tmpCustNo, ' ', sizeof tmpCustNo);

	memset(&custRangeRec.liveChar, ' ', sizeof custRangeRec);
	strncpy(custRangeRec.recType,"RN",2);
	memset(custRangeRec.rangeNo,' ',4);

	isindexinfo(ctlFile, &ctlKey,1);
	if ( isstart(ctlFile,&ctlKey, 0, &custRangeRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] ISSTART/ISGTEQ error %d on stctltab while getting next customer number\n", getDateTime(), PID, iserrno);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatBranchResponse(END_OF_FILE,"No customer Range info exists ....", "No customer range info exists....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stctltab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) == FAILURE )
		return FAILURE;

	whileLoopEntered=NO;
	noOfTries=0;
	do 
	{
		while( isRead(ctlFile,&custRangeRec.liveChar,ISNEXT+ISLOCK) == 0 )
		{
			if ( strncmp(custRangeRec.recType, "RN", 2) )
				break;

			whileLoopEntered = YES;
			fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] Searching customer range; endingNO=%.7s; endingNo=%.7s\n", getDateTime(), PID, custRangeRec.endingNo, custRangeRec.currentNo);
			
			if( strncmp(custRangeRec.endingNo, custRangeRec.currentNo,7) == 0 )
				continue;

			if(strncmp(custRangeRec.currentNo,"0000000",7) == 0)
			{
				strncpy(custRangeRec.currentNo, custRangeRec.startingNo, 7);
				sprintf(tmpCurrentNo, "%.7s", custRangeRec.currentNo);
				currentNo = atol(tmpCurrentNo);
			}
			else
			{
				sprintf(tmpCurrentNo, "%.7s", custRangeRec.currentNo);
				currentNo = atol(tmpCurrentNo)+1;
			}
			do 
			{
				if ( checkCustomerNoExistance(currentNo) == FAILURE )
					break;

				fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] Customer %ld has been utilized; trying to get the next number\n", getDateTime(),PID, currentNo);
				fflush(logFp);
				currentNo++;
				if ( currentNo > 6300000 ) /* gone beyond the Bankmaster Alpha customer limit */
				{
					fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] Customer search gone beyond the Bankmaster limit; returning error to the client\n", getDateTime(), PID);
					fflush(logFp);
					sprintf(tmpStr, "Please report to help desk as critical problem");
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					return FAILURE;
				}
			} while (1);

			sprintf(tmpCurrentNo,"%07ld", currentNo); 
			if ( strncmp(custRangeRec.endingNo, tmpCurrentNo, 7) < 0 )
				strncpy(custRangeRec.currentNo, custRangeRec.endingNo, 7);
			else
			{
				strncpy(custRangeRec.currentNo,tmpCurrentNo,7);
				strncpy(tmpCustNo, tmpCurrentNo, 7);
			}

			strncpy(custRangeRec.lastUpdateUser, receivedMsg.customer.userId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(custRangeRec.lastUpdateDateTime, tmpStr, 14);
			fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] Assigned number=%.7s\n", getDateTime(), PID, tmpCustNo);

			if( isRewcurr(ctlFile,&custRangeRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl] ISREWCURR error %d on stctltab for key=%.6s\n", getDateTime(), PID, iserrno, custRangeRec.recType);
				fflush(logFp);
				if  ( iserrno == 100 )
				{
					sprintf(tmpStr, "Duplicate record [%.6s] on stctltab", custRangeRec.recType);
					formatBranchResponse( DUPLICATE, tmpStr , tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stctltab", custRangeRec.recType);
					formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stctltab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrelease(ctlFile);
				isclose(crdFile);
				crdFileOpen=NO;
				return FAILURE;
			}

			if ( tmpCustNo[0] == ' ' ) /* not yet assigned; current range exhausted*/
				continue;
			else
				break;
		}
		if ( whileLoopEntered == NO )
		{
			noOfTries++;
			fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl]  While loop did not enter ; ctlFile [%d]; iserrno [%d]; ctlRecord [%.150s] ; trying for [%d] time \n", getDateTime(), PID, ctlFile, iserrno, &ctlRec.liveChar, noOfTries);
			fflush(logFp);
			/*fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl]  While loop did not enter ; need to be INVESTIGATED ; ctlFile [%d]; iserrno [%d]; ctlRecord [%.150s]\n", getDateTime(), PID, ctlFile, iserrno, &ctlRec.liveChar);*/
		}
	} while ( noOfTries < 5 && whileLoopEntered == NO );

	if ( noOfTries >= 5 )
	{
		fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl]  Error %d occured while reading next customer number even after %d times;\n", getDateTime(), PID, iserrno, noOfTries);
		fflush(logFp);
		if ( iserrno == 107 )
			sprintf(tmpStr, "Record locked while getting next cust number");
		else
			sprintf(tmpStr, "Error %d occured while getting next cust number", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		isclose(crdFile);
		crdFileOpen=NO;
		return FAILURE;		
	}
	isrelease(ctlFile);
	isclose(crdFile);
	crdFileOpen=NO;
	if ( tmpCustNo[0] == ' ' )
	{
		fprintf(logFp, "%s|%5d| [getNextCustNoFromCtl]  All customer range are exhausted; NO VALID CUSTOMER RANGE\n", getDateTime(), PID);
		fflush(logFp);
		sprintf(tmpStr, "NO VALID CUSTOMER RANGE AVAILABLE");
		formatBranchResponse(NO_CUSTOMER_RANGE, tmpStr, tmpStr);
		return FAILURE;		
	}
	return SUCCESS;
}

openIdTabFile(int mode)
{
	char tmpStr[80];

	if ( idTabFileOpen == YES )
		return SUCCESS;

	/* Open id tab table */
	if ( (idTabFile  = isopen(idTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, idTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stidtab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(idTabFile, &idTabKey, 5); /* Arul changed from 1 to 5 */
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar,ISGTEQ);
	idTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Id Tab File (%d) successfully opened....\n", getDateTime(), PID, idTabFile);
		fflush(logFp);
	}
	return SUCCESS;
}

openCustLogFile(int mode)
{
	char tmpStr[80];

	if ( custLogFileOpen == YES )
		return SUCCESS;

	/* Open customer log table */
	if ( (custLogFile  = isopen(custLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openCustLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, custLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stcustlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(custLogFile, &custLogKey, 1);
	custLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Customer Log file (%d) successfully opened....\n", getDateTime(), PID, custLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openIdLogFile(int mode)
{
	char tmpStr[80];

	if ( idLogFileOpen == YES )
		return SUCCESS;

	/* Open id log table */
	if ( (idLogFile  = isopen(idLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openIdLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, idLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stidlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(idLogFile, &idLogKey, 1);
	idLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Id Log file (%d) successfully opened....\n", getDateTime(), PID, idLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openCrefTabFile(int mode)
{
	char tmpStr[80];

	if ( cRefTabFileOpen == YES )
		return SUCCESS;

	/* Open customer reference table */
	if ( (cRefTabFile  = isopen(cRefTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openCrefTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, cRefTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stcreftab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(cRefTabFile, &cRefTabKey, 1);
	cRefTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Reference tab file (%d) successfully opened....\n", getDateTime(), PID, cRefTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

updateAcctLogFile(source)
char source;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[updateAcctLogFile]\n", getDateTime(), PID);

	if( isRewcurr(acctLogFile, &acctLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[updateAcctLogFile]  ISREWCURR error %d on stacclog for key=%.38s\n", getDateTime(), PID, iserrno, acctLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.38s] on stacclog", acctLogRec.branchCode);
			if ( source == SUPERVISOR_ACTION )		
				formatSuperDecisionResponse( DUPLICATE,tmpStr , tmpStr);
			else
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stacclog");
			if ( source == SUPERVISOR_ACTION )
				formatSuperDecisionResponse( RECORD_LOCKED, tmpStr, tmpStr);
			else
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr );
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stacclog", iserrno);
			if ( source == SUPERVISOR_ACTION )
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			else
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(acctLogFile);
		return FAILURE;
	}

	isrelease(acctLogFile);
	return SUCCESS;
}

checkPendingStatus(char *custNo)
{
	char tmpStr[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkPendingStatus] in custLogFile for the customer [%.7s]\n", getDateTime(), PID, custNo);
	
	isindexinfo(custLogFile,&custLogKey,3);

	/*strncpy(custLogRec.custNo, receivedMsg.customer.custNo,7);*/
	strncpy(custLogRec.custNo, custNo,7);
	memset(custLogRec.lastUpdateDateTime, ' ', 14);

	if ( isstart(custLogFile,&custLogKey, 0, &custLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			return FAILURE;
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	while ( isRead(custLogFile, &custLogRec.liveChar, ISNEXT) == 0 )
	{
		/*if ( strncmp(custLogRec.custNo, receivedMsg.customer.custNo, 7) )*/
		if ( strncmp(custLogRec.custNo, custNo, 7) )
			break;

		if ( custLogRec.bmUpdateStatus == '1' || custLogRec.bmUpdateStatus == '2' )
		{
			fprintf(logFp, "%s|%5d|[checkPendingStatus]Customer [%.7s] is already in pending status [%c] and the branch code [%.4s] and userId created was [%.10s]\n", getDateTime(), PID, custLogRec.custNo, custLogRec.bmUpdateStatus, custLogRec.branchCode, custLogRec.userId);
			fflush(logFp);
			return SUCCESS;
		}
	}
	return FAILURE;
}

readIdLogFile(mode)
int mode;
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|[readIdLogFile] readIdLogFile() for key value [%.28s] and id Type, Id No [%c,%.15s] , id Category [%c]; Customer no [%.7s]\n", getDateTime(), PID, idLogRec.branchCode, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory, idLogRec.custNo);
	if ( isRead(idLogFile, &idLogRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readIdLogFile] ISREAD/%s error %d on stidlog for key=%.28s; idNo[%c,%.16s] for custNo=[%.7s]\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, idLogRec.branchCode, idLogRec.idType, idLogRec.idNo, idLogRec.custNo);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key ");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatBranchResponse(RECORD_LOCKED,  tmpStr,tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

readCustLogFile(mode)
int mode;
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|[readCustLogFile] readCustLogFile() for key value %.38s\n", getDateTime(), PID, custLogRec.branchCode);
	if ( isRead(custLogFile, &custLogRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readCustLogFile] : ISREAD/%s error %d on stcustlog for key=%.38s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, custLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key ");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatBranchResponse(RECORD_LOCKED,  tmpStr,tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}
updateCustLogFile()
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[updateCustLogFile]\n", getDateTime(), PID);

	if ( isRewcurr(custLogFile, &custLogRec.liveChar) < 0 ) 
	{
		fprintf(logFp, "%s|%5d|[updateCustLogFile] ISREWCURR error %d on stcustlog for key=%.38s\n", getDateTime(), PID, iserrno, custLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.38s]", custLogRec.branchCode);
			formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stcustlog", custLogRec.branchCode);
			formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(custLogFile);
		return FAILURE;
	}

	isrelease(custLogFile);
	return SUCCESS;
}

getRestrictedFlag(char *branchCode) /* MISYS */
{
	char tmpStr[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getRestrictedFlag]\n", getDateTime(), PID);

	/* read the incoming BranchCode in stctltab to get "update restricted flag" */

	memset(&ctlRec.liveChar, ' ', sizeof ctlRec);

	strncpy(ctlRec.recType, "BD", 2);
	strncpy(ctlRec.branchCode, branchCode, 4);

	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &ctlRec.liveChar, ISGTEQ);

	if ( isRead(ctlFile, &ctlRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%d|[getRestrictedFlag] ISREAD/ISEQUAL error %d occured on stctltab for [%.6s] while reading for restricted branch flag \n", getDateTime(), PID, iserrno, ctlRec.recType);
		fflush(logFp);
		return FAILURE;
	}

	return SUCCESS;
} /* MISYS */

openAddrTabFile(int mode)
{
	char tmpStr[80];

	if ( addrTabFileOpen == YES )
		return SUCCESS;

	/* Open address tab table */
	if ( (addrTabFile  = isopen(addrTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openAddrTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, addrTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening staddrtab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(addrTabFile, &addrTabKey, 1);
	addrTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Address Tab file (%d) successfully opened....\n", getDateTime(), PID, addrTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

getAcctStatusHistory()
{
	int noOfRec, len, i, j;
	int lastRecRcvd=0, recCount=0, recsInThisMsg = 0;
	char tmpStr[10];
	int currentYear=0;
	char *pathName;
	int  tmpAcctLogFile;
	struct keydesc  tmpAcctLogKey;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getAcctStatusHistory] for the acccount number [%.14s] ; requestType = [%c]; lastRecCount [%.5s]\n", getDateTime(), PID, receivedMsg.acctStatusHistory.accNo, receivedMsg.acctStatusHistory.requestType, receivedMsg.acctStatusHistory.lastRecCount);

	noOfRec=0;

	memset(responseMsg.acctStatusHistory.msgLen, ' ', sizeof responseMsg.acctStatusHistory);

	if ( receivedMsg.acctStatusHistory.requestType == '2' ) /* Account Update history */
	{
		sprintf(tmpStr, "%.5s", receivedMsg.acctStatusHistory.lastRecCount);
		lastRecRcvd = atoi(tmpStr);
		memset(responseMsg.acctHistory.msgLen, ' ', sizeof responseMsg.acctHistory);
		responseMsg.acctHistory.nullPad = '\0';
		strncpy(responseMsg.acctHistory.accNo, receivedMsg.acctStatusHistory.accNo, 14);
	}

	getDateTime();
	currentYear = systemDate->tm_year+1900;
	for ( i=2000; i < currentYear; i++ )
	{
		sprintf(tmpStr, "acclog%04d", i);
		pathName = getpath(tmpStr, "static");

		if ( (tmpAcctLogFile  = isopen(pathName, ISMANULOCK+ISINPUT)) < 0)
		{
			if ( extraDebug > 8 )
			{
				fprintf(logFp, "%s|%5d|[getAcctStatusHistory] ISOPEN error %d for %s File IGNORED\n", getDateTime(), PID, iserrno, pathName);
				fflush(logFp);
			}
			free(pathName);
			continue;
		}
		free(pathName);
		isindexinfo(tmpAcctLogFile, &tmpAcctLogKey, 5); /* Key on account number */

		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
		strncpy(acctLogRec.accNo, receivedMsg.acctStatusHistory.accNo, 14);

		isstart(tmpAcctLogFile, &tmpAcctLogKey, 0, &acctLogRec.liveChar,ISGTEQ);
		while ( isRead(tmpAcctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
		{
			/* Remove NULL char from the record */
			len = sizeof(acctLogRec);
			for ( j=0; j < len; j++)
			{
				if ( acctLogRec.branchCode[j] == NULL )
					acctLogRec.branchCode[j] = ' ';
			}

			if ( strncmp(acctLogRec.accNo, receivedMsg.acctStatusHistory.accNo, 14) )
				break;
					
			if ( receivedMsg.acctStatusHistory.requestType == '0' ) /* GL Account status change history */
			{
				if ( acctLogRec.statusChanged != '1' )
					continue;
			}
			else if ( receivedMsg.acctStatusHistory.requestType == '1' ) /* SAMA account status change history */
			{
				if ( acctLogRec.samaAccStatusChanged != '1' )
					continue;
			}

			if ( receivedMsg.acctStatusHistory.requestType == '2' ) /* Account update history */
			{
				/* If the userid & supervisor id is not numeric, then skip it */
				if ( (isalpha(acctLogRec.userId[0]) || isalpha(acctLogRec.supervisorId[0])) && 
					  strncmp(acctLogRec.userId, "MIGRATION              ", 20) )
					continue;

				if ( recCount++ < lastRecRcvd )
					continue; /* read all records already sent */

				strncpy(responseMsg.acctHistory.details[recsInThisMsg].branchCode, acctLogRec.branchCode, 4);
				strncpy(responseMsg.acctHistory.details[recsInThisMsg].userId, acctLogRec.userId, 20);
				strncpy(responseMsg.acctHistory.details[recsInThisMsg].dateTime, acctLogRec.dateTime, 14);
				responseMsg.acctHistory.details[recsInThisMsg].pendingStatus = acctLogRec.bmUpdateStatus;
				if ( acctLogRec.bmUpdateStatus != '1' && acctLogRec.bmUpdateStatus != '2' )
				{
					strncpy(responseMsg.acctHistory.details[recsInThisMsg].supervisorId, acctLogRec.supervisorId, 20);
					strncpy(responseMsg.acctHistory.details[recsInThisMsg].lastUpdateDateTime, acctLogRec.lastUpdateDateTime, 14);
				}
				
				if ( ++recsInThisMsg >=  20 )
					break;
			}
			else /* Account status /SAMA account status change history */
			{
				/* Only completed Record is taken into consideration for status change history */
				if ( acctLogRec.bmUpdateStatus == '9' )
				{
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].userId, acctLogRec.userId,10);
					if ( acctLogRec.userId[0] >= '0' && acctLogRec.userId[0] <= '9' )
						strncpy(&responseMsg.acctStatusHistory.details[noOfRec].userId[7], &acctLogRec.branchCode[1], 3);
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].supervisorId, acctLogRec.supervisorId, 10);
					if ( acctLogRec.supervisorId[0] >= '0' && acctLogRec.supervisorId[0] <= '9' )
						strncpy(&responseMsg.acctStatusHistory.details[noOfRec].supervisorId[7], &acctLogRec.branchCode[1], 3);
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].changeDateTime, acctLogRec.dateTime,14);
					if ( receivedMsg.acctStatusHistory.requestType == '0' )
					{
						strncpy(responseMsg.acctStatusHistory.details[noOfRec].fromStatus, acctLogRec.fromStatus,2);
						strncpy(responseMsg.acctStatusHistory.details[noOfRec].toStatus, acctLogRec.toStatus, 2);
						strncpy(responseMsg.acctStatusHistory.details[noOfRec].accStatusChangeReason, acctLogRec.accStatusChangeReason, 30);
					}
					else
					{
						strncpy(responseMsg.acctStatusHistory.details[noOfRec].fromStatus, acctLogRec.fromSamaAccStatus,2);
						strncpy(responseMsg.acctStatusHistory.details[noOfRec].toStatus, acctLogRec.toSamaAccStatus, 2);
					}
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].lastUpdateDateTime, acctLogRec.lastUpdateDateTime, 14);
					noOfRec++;

					if ( noOfRec >= 50 )
						break;
				}
			}
		}
		isclose(tmpAcctLogFile);
		if ( receivedMsg.acctStatusHistory.requestType == '2' ) /* Account update history */
		{
			if ( recsInThisMsg >= 20 )
			{
				sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
				strncpy(responseMsg.acctHistory.lastRecCount, tmpStr, 5);
				sprintf(tmpStr, "%02d", recsInThisMsg);
				strncpy(responseMsg.acctHistory.noOfRecs, tmpStr, 2);
				responseMsg.acctHistory.details[recsInThisMsg+1].branchCode[0] = '\0';
				formatCardHistoryResponse(DONE, "Successful", "Successful");
				fflush(logFp);
				sendResponse(responseMsg.acctHistory.msgLen);
				return SUCCESS;
			}
		}
		else /* Account status/SAMA account status history */
		{
			if ( noOfRec >= 50 )
			{
				sprintf(tmpStr,"%02d", noOfRec);
				strncpy(responseMsg.acctStatusHistory.noOfRecs, tmpStr, 2);
				responseMsg.acctStatusHistory.details[noOfRec+1].userId[0] = '\0';
				formatCardHistoryResponse(DONE, "Successful...", "Successful...");
				sendResponse(responseMsg.acctStatusHistory.msgLen);
				return SUCCESS;
			}
		}
	}

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	strncpy(acctLogRec.accNo, receivedMsg.acctStatusHistory.accNo, 14);
	isindexinfo(acctLogFile, &acctLogKey, 5);
	isstart(acctLogFile, &acctLogKey, 0, &acctLogRec.liveChar, ISGTEQ);

	while ( isRead(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(acctLogRec.accNo, receivedMsg.acctStatusHistory.accNo, 14) )
			break;

		len = sizeof(acctLogRec);

		for (i=0; i < len; i++)
		{
			if ( acctLogRec.branchCode[i] == NULL )
				acctLogRec.branchCode[i] = ' ';
		}
				
		if ( receivedMsg.acctStatusHistory.requestType == '0' ) /* GL Account status change history */
		{
			if ( acctLogRec.statusChanged != '1' )
				continue;
		}
		else if ( receivedMsg.acctStatusHistory.requestType == '1' ) /* SAMA account status change history */
		{
			if ( acctLogRec.samaAccStatusChanged != '1' )
				continue;
		}

		if ( receivedMsg.acctStatusHistory.requestType == '2' ) /* Account update history */
		{
			/* If the userid & supervisor id is not numeric, then skip it */
			if ( (isalpha(acctLogRec.userId[0]) || isalpha(acctLogRec.supervisorId[0])) && 
				  strncmp(acctLogRec.userId, "MIGRATION              ", 20) )
				continue;

			if ( recCount++ < lastRecRcvd )
				continue; /* read all records already sent */

			strncpy(responseMsg.acctHistory.details[recsInThisMsg].branchCode, acctLogRec.branchCode, 4);
			strncpy(responseMsg.acctHistory.details[recsInThisMsg].userId, acctLogRec.userId, 20);
			strncpy(responseMsg.acctHistory.details[recsInThisMsg].dateTime, acctLogRec.dateTime, 14);
			responseMsg.acctHistory.details[recsInThisMsg].pendingStatus = acctLogRec.bmUpdateStatus;
			if ( acctLogRec.bmUpdateStatus != '1' && acctLogRec.bmUpdateStatus != '2' )
			{
				strncpy(responseMsg.acctHistory.details[recsInThisMsg].supervisorId, acctLogRec.supervisorId, 20);
				strncpy(responseMsg.acctHistory.details[recsInThisMsg].lastUpdateDateTime, acctLogRec.lastUpdateDateTime, 14);
			}
			
			if ( ++recsInThisMsg >=  20 )
				break;
		}
		else /* Account status /SAMA account status change history */
		{
			/* Only completed Record is taken into consideration for status change history */
			if ( acctLogRec.bmUpdateStatus == '9' )
			{
				strncpy(responseMsg.acctStatusHistory.details[noOfRec].userId, acctLogRec.userId,10);
				if ( acctLogRec.userId[0] >= '0' && acctLogRec.userId[0] <= '9' )
					strncpy(&responseMsg.acctStatusHistory.details[noOfRec].userId[7], &acctLogRec.branchCode[1], 3);
				strncpy(responseMsg.acctStatusHistory.details[noOfRec].supervisorId, acctLogRec.supervisorId, 10);
				if ( acctLogRec.supervisorId[0] >= '0' && acctLogRec.supervisorId[0] <= '9' )
					strncpy(&responseMsg.acctStatusHistory.details[noOfRec].supervisorId[7], &acctLogRec.branchCode[1], 3);
				strncpy(responseMsg.acctStatusHistory.details[noOfRec].changeDateTime, acctLogRec.dateTime,14);
				if ( receivedMsg.acctStatusHistory.requestType == '0' )
				{
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].fromStatus, acctLogRec.fromStatus,2);
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].toStatus, acctLogRec.toStatus, 2);
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].accStatusChangeReason, acctLogRec.accStatusChangeReason, 30);
				}
				else
				{
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].fromStatus, acctLogRec.fromSamaAccStatus,2);
					strncpy(responseMsg.acctStatusHistory.details[noOfRec].toStatus, acctLogRec.toSamaAccStatus, 2);
				}
				strncpy(responseMsg.acctStatusHistory.details[noOfRec].lastUpdateDateTime, acctLogRec.lastUpdateDateTime, 14);
				noOfRec++;

				if ( noOfRec >= 50 )
					break;
			}
		}
	}
	if ( receivedMsg.acctStatusHistory.requestType == '2' ) /* Account update history */
	{
		sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
		strncpy(responseMsg.acctHistory.lastRecCount, tmpStr, 5);
		sprintf(tmpStr, "%02d", recsInThisMsg);
		strncpy(responseMsg.acctHistory.noOfRecs, tmpStr, 2);
		responseMsg.acctHistory.details[recsInThisMsg+1].branchCode[0] = '\0';
		formatCardHistoryResponse(DONE, "Successful", "Successful");
		fflush(logFp);
		sendResponse(responseMsg.acctHistory.msgLen);
		return SUCCESS;
	}
	else
	{
		sprintf(tmpStr,"%02d", noOfRec);
		strncpy(responseMsg.acctStatusHistory.noOfRecs, tmpStr, 2);
		responseMsg.acctStatusHistory.details[noOfRec+1].userId[0] = '\0';
		formatCardHistoryResponse(DONE, "Successful...", "Successful...");
		sendResponse(responseMsg.acctStatusHistory.msgLen);
		return SUCCESS;
	}
}

getCustName(char *custNo)
{
	char bmCustNo[10];
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);

	strncpy(custTabRec.custNo, custNo, 7);

	isindexinfo(custTabFile, &custTabKey, 1);
	isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);

	if ( isread(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getCustName] ISREAD/ISEQUAL error %d occured on stcusttab while getting customer name for  customer # [%.7s]\n", getDateTime(), PID, iserrno, custNo);
		fflush(logFp);
		if ( iserrno == 111 )
		{ /* read the customer from crd0data */
			fprintf(logFp, "%s|%5d|[getCustName] %.7s does not exists in stcusttab; reading from CRD0DATA\n", getDateTime(), PID, custTabRec.custNo);
			fflush(logFp);
			memset(&crdRec.liveChar, ' ', sizeof crdRec);
			actualToBmCust(custNo, bmCustNo); 
			strncpy(crdRec.accNo, bmCustNo, 6);
			if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
			{
				fprintf(logFp, "%s|%5d|[getCustName] ISREAD/ISEQUAL error %d occured while reading crd0data for customer # [%.7s] IGNORED.. Customer name moved as Blank\n", getDateTime(), PID, iserrno, custNo);
				fflush(logFp);
				fprintf(errLogFp, "%s|%5d|[getCustName()] ISREAD/ISEQUAL error %d occured while reading crd0data for customer # [%.7s] IGNORED.. Customer name moved as Blank\n", getDateTime(), iserrno, custNo);
				fflush(errLogFp);
				return FAILURE;
			}
			else
			{
				strncpy(custTabRec.aShortName, crdRec.shortName, 30);
				strncpy(custTabRec.eShortName, crdRec.shortName, 30);
				strncpy(custTabRec.businessType, crdRec.businessType, 3);
				strncpy(custTabRec.branchCode, crdRec.branchCode, 4);
			}
		}
	}
	else
	{
		if ( custTabRec.custType != '0' )
		{
			strncpy(custTabRec.aShortName, custTabRec.aOrgShortName, 30);
			strncpy(custTabRec.eShortName, custTabRec.eOrgShortName, 30);
		}
	}

	return SUCCESS;
}

openABCFile(int mode)
{
	char tmpStr[80];

	if ( abcFileOpen == YES )
		return SUCCESS;

	/* Open ABC List table */
	if ( (abcFile  = isopen(abcFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openABCFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, abcFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stabclist.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(abcFile, &abcKey, 1);
	abcFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| ABC file (%d) successfully opened....\n", getDateTime(), PID, abcFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

checkCustomerNoExistance(long custNo)
{
	char tmpStr[20], tmpStr1[20];
	sprintf(tmpStr, "%07ld", custNo);
	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *) actualToBmCust(tmpStr, tmpStr1), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		if ( iserrno != 111 )
		{
			fprintf(logFp, "%s|%5d|[checkCustomerNoExitance] ISREAD/ISEQUAL error %d while reading CRD0DATA for customer # %07ld[%.6s]\n", getDateTime(), PID, iserrno, custNo, tmpStr);
			fflush(logFp);
		}
		return FAILURE;
	}
	return SUCCESS;
}

readJointTabFile(mode)
int mode;
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|[readJointTabFile] for key value %.7s%.2s\n", getDateTime(), PID, jointTabRec.custNo,jointTabRec.jointCustNo);
	if ( isRead(jointTabFile, &jointTabRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readJointTabFile] ISREAD/%s error %d on stjointtab for key=%.7s%.2s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, jointTabRec.custNo,jointTabRec.jointCustNo);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key [%.7s%.2s] on stjointtab",jointTabRec.custNo, jointTabRec.jointCustNo);
			formatSuperDecisionResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached on stjointtab");
			formatSuperDecisionResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stjointtab");
			formatSuperDecisionResponse(RECORD_LOCKED,  tmpStr,tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stjointtab", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

openCustTabFile( int mode )
{
	char tmpStr[80];

	if ( custTabFileOpen == YES )
		return SUCCESS;

	/* Open customer tab table */
	if ( (custTabFile  = isopen(custTabFilePath, mode )) < 0)
	{
		printf("ISOPEN error %d for %s file\n", iserrno, custTabFilePath);
		fprintf(logFp, "%s|%d|[openCustTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, custTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stcusttab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(custTabFile, &custTabKey, 1);
	custTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Customer Tab file (%d) successfully opened....\n", getDateTime(), PID, custTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openJointLogFile( int mode )
{
	char tmpStr[80];

	if ( jointLogFileOpen == YES )
		return SUCCESS;

	/* Open joint cust log table */
	if ( (jointLogFile  = isopen(jointLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openJointLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, jointLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stjointlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(jointLogFile, &jointLogKey, 1);
	jointLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Joint Log file (%d) successfully opened....\n", getDateTime(), PID, jointLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

formatSuperDecisionResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[100],tmpARemarks[55], tmpERemarks[55];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSuperDecisionResponse] formating the response\n", getDateTime(), PID);

	sprintf(tmpARemarks, "%-50.50s", aRemarks);
	sprintf(tmpERemarks, "%-50.50s", eRemarks);

	strncpy(responseMsg.superDecision.status, responseCode, 3);
	strncpy(responseMsg.superDecision.service, receivedMsg.supDecision.service, 2);
	strncpy( responseMsg.superDecision.aRemarks, tmpARemarks, 50 );
	strncpy(responseMsg.superDecision.eRemarks, tmpERemarks, 50 );

	responseMsg.superDecision.appRejectFlag = receivedMsg.supDecision.appRejectFlag;

	if (receivedMsg.supDecision.newOrUpdate == 'N')
		strncpy(responseMsg.superDecision.custNo,custTabRec.custNo,7); 
	else
	{
		if ( strncmp(responseCode, "000", 3) == 0 )
		{
			strncpy(responseMsg.superDecision.custNo,custTabRec.custNo,7);
			responseMsg.superDecision.nameChanged = custTabRec.nameChanged;
			responseMsg.superDecision.addressChanged = custTabRec.addressChanged;
		}
	}

	responseMsg.superDecision.nullPad = '\0';

	sprintf(tmpStr, "%06d", strlen(responseMsg.superDecision.msgLen));
	strncpy(responseMsg.superDecision.msgLen, tmpStr, 6);

	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

openAcctLogFile( int mode )
{
	char tmpStr[80];

	if ( acctLogFileOpen == YES )
		return SUCCESS;

	/* Open account log table */
	if ( (acctLogFile  = isopen(acctLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%d|[openAcctLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, acctLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stacclog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(acctLogFile, &acctLogKey, 1);
	acctLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Account Log file (%d) successfully opened....\n", getDateTime(), PID, acctLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

updateJointLogFile(source)
char source;
{
	char tmpStr[120];
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[updateJointLogFile]\n", getDateTime(), PID);

	if ( isRewcurr(jointLogFile, &jointLogRec.liveChar) < 0 )
	{
		printf("joint cust log file rewrite failure  %d\n",iserrno);
		fprintf(logFp, "%s|%5d|[updateJointLogFile] ISREWCURR error %d on stjointlog for key=%.38s\n", getDateTime(), PID, iserrno, jointLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.38s] on stjointlog", jointLogRec.branchCode);
			if ( source == SUPERVISOR_ACTION )
				formatSuperDecisionResponse(DUPLICATE, tmpStr, tmpStr);
			else
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);

		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stjointlog"); 
			if ( source == SUPERVISOR_ACTION )
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			else
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stjointlog", iserrno);
			if ( source == SUPERVISOR_ACTION ) 
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			else
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(jointLogFile);
		return FAILURE;
	}
	isrelease(jointLogFile);
	return SUCCESS;
}

writeToAcctLog(char *acctInfo)
{
	char tmpStr[100];
	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[writeToAcctLog]\n", getDateTime(), PID);

	struct 
	{
		char memoCode[3];
		char currCode[2];
		char acctStatus[2];
		char stmtFreq[2];
		char checkBookReqd;
		char droppedFlag;
		char creationOrUpdate;
	}tmpAcctInfo;

	strncpy(tmpAcctInfo.memoCode, acctInfo, 12);
	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	if ( tmpAcctInfo.creationOrUpdate == 'U' )
	{
		strncpy(acctLogRec.branchCode,receivedMsg.customer.branchCode,4);
		strncpy(acctLogRec.userId, receivedMsg.customer.userId,10);
		strncpy(acctLogRec.dateTime, receivedMsg.customer.dateTime,14);

		isindexinfo(acctLogFile, &acctLogKey,1);

		if ( isstart(acctLogFile,&acctLogKey,0,&acctLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     	formatBranchResponse(END_OF_FILE,"No Account Records found....", "No Account Records found....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stacclog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			}
			return FAILURE;
		}

		if ( extraDebug )
			fprintf(logFp, "isstart success account file.... \n");

		while ( isRead(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(receivedMsg.customer.homeBranch,acctLogRec.branchCode,4) != 0 || strncmp(receivedMsg.customer.userId,acctLogRec.userId,10) != 0 || strncmp(receivedMsg.customer.dateTime,acctLogRec.dateTime,14) != 0 )
			/*if ( strncmp(custLogRec.branchCode,acctLogRec.branchCode,4) != 0 || strncmp(receivedMsg.customer.userId,acctLogRec.userId,10) != 0 || strncmp(receivedMsg.customer.dateTime,acctLogRec.dateTime,14) != 0 )*/
				return SUCCESS;
		
			if ( strncmp(&acctLogRec.accNo[2], tmpAcctInfo.memoCode, 3) == 0 )
				break;
		}
	}


	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	acctLogRec.liveChar = '@';
	strncpy(acctLogRec.branchCode,custLogRec.branchCode,4);
	strncpy(acctLogRec.userId, custLogRec.userId,10);
	strncpy(acctLogRec.dateTime, custLogRec.dateTime,14);

	/*
	strncpy(acctLogRec.branchCode,receivedMsg.customer.homeBranch,4);
	strncpy(acctLogRec.userId, receivedMsg.customer.userId,10);
	strncpy(acctLogRec.dateTime, receivedMsg.customer.dateTime,14);
	*/
	
	sprintf(tmpStr, "%.2s%.3s%.7s00", tmpAcctInfo.currCode, tmpAcctInfo.memoCode, custLogRec.custNo);
	strncpy(acctLogRec.accNo, tmpStr, 14);
	strncpy(acctLogRec.supervisorId, receivedMsg.customer.supervisorId,10);
	strncpy(acctLogRec.accStatus, tmpAcctInfo.acctStatus,2);
	strncpy(acctLogRec.statementFreq,tmpAcctInfo.stmtFreq,2);
	acctLogRec.checkBook = tmpAcctInfo.checkBookReqd;
	acctLogRec.droppedAcc = tmpAcctInfo.droppedFlag;
	strncpy(acctLogRec.custBranchCode, receivedMsg.customer.custBranchCode, 4);

	strncpy(acctLogRec.lastUpdateUser, custLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( tmpAcctInfo.creationOrUpdate == 'U' )
	{
		if ( updateAcctLogFile(TELLER_ACTION) < 0 )
			return FAILURE;
	}
	else
	{
		if ( receivedMsg.individualOthers.screenSetNo == PENSION_CUSTOMER ) /* Ver 3.2 */
		{
			strncpy(acctLogRec.accStatusChangeReason, "åÊâÇÙÏ ÌÏêÏ                     ", 30); /* New Pensioner */
		}

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d| [writeToAcctLog] Before writing to stacclog file (%d)...\n", getDateTime(), PID, acctLogFile);
			fflush(logFp);
		}
		if ( isWrite(acctLogFile, &acctLogRec.liveChar ) < 0 )
		{
			fprintf(logFp, "%s|%5d| [writeToAcctLog] ISWRITE error %d on stacclog for key [%.38s]\n", getDateTime(), PID, iserrno, acctLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s] in stacclog", acctLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stacclog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stacclog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}
	}

	return SUCCESS;
}

openAddrLogFile(int mode)
{
	char tmpStr[80];

	if ( addrLogFileOpen == YES )
		return SUCCESS;

	/* Open address log table */
	if ( (addrLogFile  = isopen(addrLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openAddrLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, addrLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening staddrlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(addrLogFile, &addrLogKey, 1);
	addrLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Address log file (%d) successfully opened....\n", getDateTime(), PID, addrLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openJointTabFile( int mode )
{
	char tmpStr[80];
	if ( jointTabFileOpen == YES )
		return SUCCESS;

	/* Open joint cust tab table */
	if ( (jointTabFile  = isopen(jointTabFilePath, mode )) < 0)
	{
		printf("ISOPEN error %d for %s file\n", iserrno, jointTabFilePath);
		fprintf(logFp, "%s|%5d|[openJointTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, jointTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stjointtab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(jointTabFile, &jointTabKey, 1);
	jointTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Joint Tab file (%d) successfully opened....\n", getDateTime(), PID, jointTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

getSarABCdetails()
{
	char tmpStr[100], tmpStr1[50], tmpCustName[70];
	char name1[35], name2[35], name3[20], name4[20];
	struct resMsgSrchEngineEnq	srchEngineResponse;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getSarABCdetails] with key as [%.16s]\n", getDateTime(), PID, custLogRec.idNo);

	/*responseMsg.individualOthersPendingDetail.foundInTList = '0';*/
	/*strncpy(responseMsg.individualOthersPendingDetail.noOfRecs, "00", 2);*/

	abcSrchCustDetails.foundInTList = '0';
	strncpy(abcSrchCustDetails.noOfRecs, "00", 2);

	if ( searchEngineCallReqd == YES )
	{
		if ( custLogRec.custType > '0' )
		{
			if ( custLogRec.preferredLang == '0' ) /* ARABIC */
			{
				sprintf(name1, "%.30s", custLogRec.aOrgName1);
				trim(name1);
				sprintf(name2, "%.30s", custLogRec.aOrgName2);
				trim(name2);
				sprintf(tmpCustName, "%s %s", name1, name2);
			}
			else
			{
				sprintf(name1, "%.30s", custLogRec.eOrgName1);
				trim(name1);
				sprintf(name2, "%.30s", custLogRec.eOrgName2);
				trim(name2);
				sprintf(tmpCustName, "%s %s", name1, name2);
			}
		}
		else
		{
			if ( custLogRec.preferredLang == '0' ) /* ARABIC */
			{
				sprintf(name1, "%.15s", custLogRec.aFirstName);
				trim(name1);
				sprintf(name2, "%.15s", custLogRec.a2ndName);
				trim(name2);
				sprintf(name3, "%.15s", custLogRec.a3rdName);
				trim(name3);
				sprintf(name4, "%.15s", custLogRec.aLastName);
				trim(name4);
				sprintf(tmpCustName, "%s %s %s %s", name1, name2, name3, name4);
			}
			else
			{
				sprintf(name1, "%.15s", custLogRec.eFirstName);
				trim(name1);
				sprintf(name2, "%.15s", custLogRec.e2ndName);
				trim(name2);
				sprintf(name3, "%.15s", custLogRec.e3rdName);
				trim(name3);
				sprintf(name4, "%.15s", custLogRec.eLastName);
				trim(name4);
				sprintf(tmpCustName, "%s %s %s %s", name1, name2, name3, name4);
			}
		}

		memset(srchEngineResponse.msgLen, ' ', sizeof srchEngineResponse);
		sprintf(tmpCustName, "%-60.60s", tmpCustName);
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[getSarABCdetails]: Before calling Search Engine with Name [%.60s] and id No [%.15s]\n", getDateTime(), PID, tmpCustName, custLogRec.idNo);
			fflush(logFp);
		}
		callSrchEngine(tmpCustName, custLogRec.idNo, searchEngineLevel, srchEngineResponse.msgLen);

		if ( strncmp(srchEngineResponse.responseStatus, "00", 2) )
		{
			if ( strncmp(srchEngineResponse.responseStatus, "03", 2) == 0  )
				sprintf(tmpStr, "Incorrect Message");
			else if ( strncmp(srchEngineResponse.responseStatus, "18", 2) == 0  )
				sprintf(tmpStr, "No Such record exists");
			else if ( strncmp(srchEngineResponse.responseStatus, "99", 2) == 0 )
				sprintf(tmpStr, "Internal Errors");
			else
				sprintf(tmpStr, "Unknown error");
			fprintf(logFp, "%s|%5d| [getSarABCdetails] Error [%.2s:%s] received from SRCHENGINE service IGNORED; \n", getDateTime(), PID, srchEngineResponse.responseStatus, tmpStr);
			fflush(logFp);
		}

		if ( strncmp(srchEngineResponse.recsRetrieved, "00", 2) > 0 )
			/*responseMsg.individualOthersPendingDetail.foundInTList = '1';*/
			abcSrchCustDetails.foundInTList = '1';
		else
			/*responseMsg.individualOthersPendingDetail.foundInTList = '0';*/
			abcSrchCustDetails.foundInTList = '0';

		/*strncpy(responseMsg.individualOthersPendingDetail.noOfRecs, srchEngineResponse.recsRetrieved, 2);*/
		strncpy(abcSrchCustDetails.noOfRecs, srchEngineResponse.recsRetrieved, 2);
		strncpy(abcSrchCustDetails.details, srchEngineResponse.details, sizeof srchEngineResponse.details);
		/*strncpy(responseMsg.individualOthersPendingDetail.details, srchEngineResponse.details, sizeof srchEngineResponse.details);*/
	}

	memset(tmpStr1, ' ', sizeof tmpStr1);

	if ( openABCFile(ISMANULOCK+ISINOUT) < 0 )
		return FAILURE;

	isindexinfo(abcFile, &abcKey, 1);

	strncpy(abcRec.idNo, custLogRec.idNo, 15);
	abcRec.idType = custLogRec.idType;

	if ( isstart(abcFile,&abcKey,16,&abcRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp,"%s|%5d|[getSarABCDetails]ISSTART/ISGTEQ error %d on stabclist for %.16s \n ", getDateTime(), PID, iserrno, custLogRec.idNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			return SUCCESS;
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stabclist", iserrno);
			formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			return FAILURE;
		}
	}
	/*
	responseMsg.individualOthersPendingDetail.foundInAList = '0';
	responseMsg.individualOthersPendingDetail.foundInBList = '0';
	responseMsg.individualOthersPendingDetail.foundInCList = '0';
	strncpy(responseMsg.individualOthersPendingDetail.reportedBank, "         ", 4);
	strncpy(responseMsg.individualOthersPendingDetail.nameInABCList, "                                    ",30);
	*/
	abcSrchCustDetails.foundInAList = '0';
	abcSrchCustDetails.foundInBList = '0';
	abcSrchCustDetails.foundInCList = '0';
	strncpy(abcSrchCustDetails.reportedBank, "         ", 4);
	strncpy(abcSrchCustDetails.nameInABCList, "                                    ",30);

	while ( isRead(abcFile, &abcRec.liveChar, ISNEXT) == 0 )
	{
		if ( abcRec.idType != custLogRec.idType || strncmp(abcRec.idNo,custLogRec.idNo,15) != 0 )
			break;

		if ( abcRec.abcListType == 'A' && checkAList )
			/*responseMsg.individualOthersPendingDetail.foundInAList = '1';*/
			abcSrchCustDetails.foundInAList = '1';

		if ( abcRec.abcListType == 'B' && checkBList )
			/*responseMsg.individualOthersPendingDetail.foundInBList = '1';*/
			abcSrchCustDetails.foundInBList = '1';
		
		if ( abcRec.abcListType == 'C' && checkCList )
			/*responseMsg.individualOthersPendingDetail.foundInCList = '1';*/
			abcSrchCustDetails.foundInCList = '1';

		/*strncpy(responseMsg.individualOthersPendingDetail.reportedBank, abcRec.reportedBank,4);*/
		strncpy(abcSrchCustDetails.reportedBank, abcRec.reportedBank,4);
		strncpy(abcSrchCustDetails.nameInABCList, abcRec.custName,30);
		/*strncpy(responseMsg.individualOthersPendingDetail.nameInABCList, abcRec.custName,30);*/
	}

	return SUCCESS;
}

getSarCustDetails()
{
	char tmpStr[100], tmpStr1[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getSarCustDetails] with ID NO as [%c:%.15s]\n", getDateTime(), PID, custLogRec.idType, custLogRec.idNo);

	memset( tmpStr1, ' ', sizeof tmpStr1 );

	if ( openCustTabFile(ISMANULOCK + ISINOUT) < 0 )
		return FAILURE;

	strncpy(custTabRec.idNo, custLogRec.idNo,15);
	custTabRec.idType = custLogRec.idType;
	/*
	responseMsg.individualOthersPendingDetail.existingCustomer = '0';
	strncpy(responseMsg.individualOthersPendingDetail.existCustNo, "         ", 7);
	strncpy(responseMsg.individualOthersPendingDetail.existCustName, "                                 ",30);
	*/

	abcSrchCustDetails.existingCustomer = '0';
	strncpy(abcSrchCustDetails.existCustNo, "         ", 7);
	strncpy(abcSrchCustDetails.existCustName, "                                 ",30);

	if ( custLogRec.idType == ' ' && strncmp(custLogRec.idNo, "                              ", 15) == 0 )
		return SUCCESS;

	isindexinfo(custTabFile, &custTabKey, 3);

	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISGTEQ) < 0 )
	{
		fprintf(logFp,"%s|%5d| [getSarCustDetails] ISSTART/ISGTEQ error %d on stcusttab for ID=%.16s \n", getDateTime(), PID,iserrno, custTabRec.idNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			return SUCCESS; 
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			return FAILURE;
		}
	}

	while ( isread(custTabFile, &custTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( custTabRec.idType != custLogRec.idType || strncmp(custTabRec.idNo,custLogRec.idNo,15) != 0 )
			break;

		if ( strncmp(custTabRec.custNo, custLogRec.custNo, 7) == 0 )
			continue;

		/*
		responseMsg.individualOthersPendingDetail.existingCustomer = '1';
		strncpy(responseMsg.individualOthersPendingDetail.existCustNo, custTabRec.custNo, 7);
		*/

		abcSrchCustDetails.existingCustomer = '1';
		strncpy(abcSrchCustDetails.existCustNo, custTabRec.custNo, 7);

		if ( extraDebug > 3 )
		{
			fprintf(logFp,"%s|%5d| [getSarCustDetails] Found the matching customer number [%.7s] for ID=%.16s \n", getDateTime(), PID, custTabRec.custNo, custTabRec.idNo);
			fflush(logFp);
		}

		if ( custTabRec.custType > '0' ) /* Corporte/commercial customer */
		{
			if ( custTabRec.preferredLang == ARABIC )
			{
				if ( strncmp(custTabRec.aOrgShortName,"          ",10) )
					strncpy(abcSrchCustDetails.existCustName, custTabRec.aOrgShortName,30);
				else
					strncpy(abcSrchCustDetails.existCustName, custTabRec.eOrgShortName,30);
			}
			else
			{
				if ( strncmp(custTabRec.eOrgShortName,"          ",10) )
					strncpy(abcSrchCustDetails.existCustName, custTabRec.eOrgShortName,30);
				else
					strncpy(abcSrchCustDetails.existCustName, custTabRec.aOrgShortName,30);
			}
		}
		else
		{
			if ( custTabRec.preferredLang == ARABIC )
			{
				if ( strncmp(custTabRec.aShortName,"          ",10) )
					strncpy(abcSrchCustDetails.existCustName, custTabRec.aShortName,30);
				else
					strncpy(abcSrchCustDetails.existCustName, custTabRec.eShortName,30);
			}
			else
			{
				if ( strncmp(custTabRec.eShortName,"          ",10) )
					strncpy(abcSrchCustDetails.existCustName, custTabRec.eShortName,30);
				else
					strncpy(abcSrchCustDetails.existCustName, custTabRec.aShortName,30);
			}
		}
	}
	
	return SUCCESS;
}

openThdFile(int mode)
{
	char tmpStr[100];

	if ( thdFileOpen == YES )
		return SUCCESS;

	if ( (thdFile  = isopen(thdFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s:ISOPEN error %d for %s File\n", getDateTime(), iserrno, thdFilePath);
		sprintf(tmpStr,"Error  %d occured while opening thd0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(thdFile, &thdKey, 1);

	/* open again THD0DATA for the narrative 2 and 3 */

	if ( (thd1File  = isopen(thdFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s : ISOPEN error %d on %s file\n", getDateTime(), iserrno, thdFilePath);
		sprintf(tmpStr, "Error %d occured while opening thd0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(thd1File, &thd1Key, 1);

	thdFileOpen = YES;
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| thd0data file (thdFile=%d;thd1File=%d) successfully opened...\n", getDateTime(), PID, thdFile, thd1File);
		fflush(logFp);
	}

	return SUCCESS;
}

openCndFile(int mode)
{
	char tmpStr[100];

	if ( cndFileOpen == YES )
		return SUCCESS;

	if ( (cndFile  = isopen(cndFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s:ISOPEN error %d for %s File\n", getDateTime(), iserrno, cndFilePath);
		sprintf(tmpStr,"Error  %d occured while opening cnd0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(cndFile, &cndKey, 1);

	cndFileOpen=YES;
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| cnd0data file (%d) successfully opened...\n", getDateTime(), PID, cndFile);
		fflush(logFp);
	}

	return SUCCESS;
}

updateO2d0data()
{
	return 0;
}
