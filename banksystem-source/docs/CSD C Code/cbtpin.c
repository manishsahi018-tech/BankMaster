/*
	Objective       :       Static data maintenance server 
				            (T-PIN Interface from Static Data through TUXEDO)

	Date            :       04/07/2003.

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

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define INVALID_CUSTOMER 	"002"
#define DATABASE_ERROR		"006"
#define WEAK_TPIN			"008"
#define ATM_PIN_MATCH		"009"

extern struct keydesc  crdKey, tpinHistKey, custTabKey, cardTabKey;
struct dictinfo fileInfo;
extern int  crdFile, tpinHistFile, custTabFile, cardTabFile;
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr ;
extern char progName[30];
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath;

extern int page, line;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];

struct crd0data						crdRec;
struct customerInfo					custTabRec;
struct tpinHistory					tpinHistRec;
struct cardInfo						cardTabRec;

extern FILE *logFp, *errLogFp, *expPrtFp;

extern struct tm *systemDate;  /* structure declaration in time.h */
extern time_t systime;

char	*getpath();
char	*getDateTime();
double   bmAmtToDbl();
char    *dblToBmAmt();
char    *bmCustToAcutal();
char    *doubleToPack();
double   packToDouble();

extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, crdFileOpen, tpinHistFileOpen, cardTabFileOpen, custTabFileOpen;
extern int PID;

processTpinRequest()
{
	char tmpStr[100];
	char encTpin[10];
	int pendingStatus;

	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.tpinRequest.msgType == '0' ) // Get the existing TPIN status 
	{
		if ( processTpinStatus() == FAILURE )
			return FAILURE;

		return SUCCESS;

	}
	if ( receivedMsg.tpinRequest.msgType == '3' ) // T-PIN check request 
	{
		if ( openCardTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTpinCheck() == FAILURE )
			return FAILURE;

		return SUCCESS;

	}
	else if ( receivedMsg.tpinRequest.msgType == '2' ) // T-PIN Approval request 
	{
		if ( openCustTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTpinApproval() == FAILURE )
			return FAILURE;

		return SUCCESS;
	}

	pendingStatus = checkTpinPendingStatus();
	if( pendingStatus == SUCCESS )
	{
		sprintf(tmpStr, "TpinReqst is pending with supervisor of Br.[%.4s]", tpinHistRec.branchCode );
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	responseMsg.customer.nullPad = '\0';

	memset(&tpinHistRec.liveChar, ' ', sizeof tpinHistRec);

	tpinHistRec.liveChar = '@';

	strncpy(tpinHistRec.branchCode, receivedMsg.tpinRequest.homeBranch, 4);
	strncpy(tpinHistRec.userId, receivedMsg.tpinRequest.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	if ( strncmp(receivedMsg.tpinRequest.dateTime, "                         ", 14) == 0 ) /* request is coming from TPIN portion */
	{
		strncpy(tpinHistRec.dateTime, tmpStr, 14);
		tpinHistRec.pendingStatus = '1';   /* Pending with supervisor */
	} 
	else /* TPIN request is coming along with customer opening */
	{
		strncpy(tpinHistRec.dateTime, receivedMsg.tpinRequest.dateTime, 14);
	}

	tpinHistRec.newOrUpdate = receivedMsg.tpinRequest.newOrUpdate;
	strncpy(tpinHistRec.custNo, receivedMsg.tpinRequest.custNo, 7);

	strncpy(tpinHistRec.tPin, receivedMsg.tpinRequest.tpinNo, 4);  /* Encrypted T-Pin */

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(tpinHistRec.custNo, tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| [processTpinRequest] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer branch code for TPIN History file ; Recd branch is moved to tpin history file\n", getDateTime(), PID, iserrno, tpinHistRec.custNo, crdRec.accNo);
		fflush(logFp);
		strncpy(tpinHistRec.custBranchCode, receivedMsg.tpinRequest.homeBranch, 4);
	}
	else
		strncpy(tpinHistRec.custBranchCode, crdRec.branchCode, 4);

	strncpy(tpinHistRec.lastUpdateUser, receivedMsg.tpinRequest.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(tpinHistRec.lastUpdateDateTime, tmpStr, 14);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| [processTpinRequest] Before writing to tpinHistFile (%d)....\n", getDateTime(), PID, tpinHistFile);
		fflush(logFp);
	}
	if ( isWrite(tpinHistFile, &tpinHistRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d| [processTpinRequest] ISWRITE error %d occured while writing to sttpinhist for the customer # [%.7s] ; key [%.28s]\n", getDateTime, PID, iserrno, tpinHistRec.custNo, tpinHistRec.branchCode);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured while writing sttpinhist", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

checkTpinPendingStatus()
{
	char tmpStr[100];
	
	isindexinfo(tpinHistFile,&tpinHistKey,2);

	memset(&tpinHistRec.liveChar, ' ', sizeof tpinHistRec);
	strncpy(tpinHistRec.custNo, receivedMsg.tpinRequest.custNo,7);

	if ( isstart(tpinHistFile,&tpinHistKey, 0, &tpinHistRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			return FAILURE;
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttpinhist", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	while ( isRead(tpinHistFile, &tpinHistRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(tpinHistRec.custNo, receivedMsg.tpinRequest.custNo, 7) )
			break;
		if ( tpinHistRec.pendingStatus == '1' )
		{
			fprintf(logFp, "%s|%5d| [checkTpinPendingStatus] Customer [%.7s] is already in pending status [%c] and the branch code [%.4s] and userId created was [%.10s] and the date & time is [%.14s]\n", getDateTime(), PID, tpinHistRec.custNo, tpinHistRec.pendingStatus, tpinHistRec.branchCode, tpinHistRec.userId, tpinHistRec.dateTime);
			fflush(logFp);
			return SUCCESS;
		}
	}
	return FAILURE;
}

readTpinPendingList()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, i ;
	char tmpStr[100]; 
	char tAccNo[20],tCustNo[15];

	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(responseMsg.tpinPendingList.msgLen, ' ', sizeof responseMsg.tpinPendingList);
	responseMsg.tpinPendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.tpinPendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&tpinHistRec.liveChar, ' ', sizeof tpinHistRec);

	isindexinfo(tpinHistFile,&tpinHistKey,3);
	strncpy(tpinHistRec.branchCode, receivedMsg.tpinPendingList.homeBranch, 4);
	tpinHistRec.pendingStatus  = '1';

	if ( isstart(tpinHistFile, &tpinHistKey, 0, &tpinHistRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISSTART/ISGTEQ error %d occured on sttpinhist, key [%.4s %c]\n", getDateTime(), PID, iserrno, tpinHistRec.branchCode, tpinHistRec.pendingStatus);
		fflush(logFp);
		responseMsg.tpinPendingList.details[recsInThisMsg+1].userId[0] = '\0';
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatTpinPendingListResponse(END_OF_FILE,"No more Records to fetch....", "No more Records to fetch....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttpinhist file", iserrno);
			formatTpinPendingListResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.tpinPendingList.msgLen);
		return FAILURE;
	 }

	 while ( isRead(tpinHistFile, &tpinHistRec.liveChar, ISNEXT) == 0 )
	 {

		if ( strncmp(receivedMsg.tpinPendingList.homeBranch, tpinHistRec.branchCode, 4) != 0 || 
			 tpinHistRec.pendingStatus !=  '1' ) 
			break;

		if ( strncmp(receivedMsg.tpinPendingList.custNo, "           ", 7) && receivedMsg.tpinPendingList.custNo[0] != NULL && 
			 strncmp(receivedMsg.tpinPendingList.custNo, "0000000", 7) )
		{
			if ( strncmp(receivedMsg.tpinPendingList.custNo, tpinHistRec.custNo, 7) )
				continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */
		
		strncpy(responseMsg.tpinPendingList.details[recsInThisMsg].userId, tpinHistRec.userId, 10);
		strncpy(responseMsg.tpinPendingList.details[recsInThisMsg].dateTime, tpinHistRec.dateTime, 14);
		strncpy(responseMsg.tpinPendingList.details[recsInThisMsg].custNo, tpinHistRec.custNo, 7);
		strncpy(responseMsg.tpinPendingList.details[recsInThisMsg].custBranchCode, tpinHistRec.custBranchCode, 7);

		memset(&crdRec.liveChar, ' ', sizeof crdRec);
		strncpy(crdRec.accNo, (char *)actualToBmCust(tpinHistRec.custNo, tmpStr), 6);

		if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer name for TPIN pending list request ; IGNORED  \n", getDateTime(), PID, iserrno, tpinHistRec.custNo, crdRec.accNo);
			fflush(logFp);
			strncpy(crdRec.shortName, "Could not read name from CRD", 30);
		}

		strncpy(responseMsg.tpinPendingList.details[recsInThisMsg].custShortName, crdRec.shortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.tpinPendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	responseMsg.tpinPendingList.details[recsInThisMsg+1].userId[0] = '\0';
	strncpy(responseMsg.tpinPendingList.noOfRecs, tmpStr, 2);
	formatTpinPendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.tpinPendingList.msgLen);
	return SUCCESS;
}

processTpinApproval()
{
	char tmpStr[200]; 

	memset(&tpinHistRec.liveChar, ' ', sizeof tpinHistRec);

	strncpy(tpinHistRec.branchCode, receivedMsg.tpinRequest.homeBranch,4);
	strncpy(tpinHistRec.userId, receivedMsg.tpinRequest.userId,10);
	strncpy(tpinHistRec.dateTime, receivedMsg.tpinRequest.dateTime,14);
	isindexinfo(tpinHistFile, &tpinHistKey, 1);
	if(isstart(tpinHistFile, &tpinHistKey, 0, &tpinHistRec.liveChar,ISGTEQ) < 0)
	{
		fprintf(logFp, "%s|%5d| ISSTART/ISGTEQ error %d occured on sttpinhist for the key [%.28s] \n", getDateTime(), PID, iserrno, tpinHistRec.branchCode);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			 formatBranchResponse(END_OF_FILE,"No TPIN request found for this customer ....", "No TPIN request found for this customer ....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttpinhist file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( readTpinHistoryFile(ISEQUAL+ISLOCK) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* If Rejected the changes; just update the log file */

	if ( receivedMsg.tpinRequest.appRejectFlag == 'R' ) 
	{
		/* Update sttpinhist file to include supervisorId  and his comments */

		tpinHistRec.pendingStatus = '3';  /* 3 is for rejecting  the entry */

		strncpy(tpinHistRec.supervisorId, receivedMsg.tpinRequest.supervisorId,10);
		strncpy(tpinHistRec.supervisorComments, receivedMsg.tpinRequest.supervisorComments, 200);
		strncpy(tpinHistRec.lastUpdateUser, receivedMsg.tpinRequest.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(tpinHistRec.lastUpdateDateTime, tmpStr, 14);

		if( isRewcurr(tpinHistFile, &tpinHistRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISREWCURR error %d on sttpinhist for key=%.28s\n", getDateTime(), PID, iserrno, tpinHistRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s] on sttpinhist", tpinHistRec.branchCode);
				formatBranchResponse( DUPLICATE,tmpStr , tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on sttpinhist" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttpinhist", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrelease(tpinHistFile);
			return FAILURE;
		}

		isrelease(tpinHistFile);
		formatBranchResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}
	isrelease(tpinHistFile);

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(tpinHistRec.custNo, tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| [processTpinApproval] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer name \n", getDateTime(), PID, iserrno, tpinHistRec.custNo, crdRec.accNo);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Customer [%.7s] Not found in crd0data     ", custTabRec.custNo);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr,"Error %d occured while reading crd0data", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.custNo, tpinHistRec.custNo, 7);
	isindexinfo(custTabFile, &custTabKey, 1);
	isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);

	if ( readCustTabFile(ISEQUAL) <  0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* Send a request to TUXEDO to update the T-PIN in phone banking system ; if it is successful, then update sttpinhist file */

	memset(tpinRequestMsg.tpinUpdate.msgLen, ' ', sizeof tpinRequestMsg.tpinUpdate);
	memset(tpinResponseMsg.tpinUpdate.msgLen, ' ', sizeof tpinResponseMsg.tpinUpdate);

	strncpy(tpinRequestMsg.tpinUpdate.reqSource, "CSD               ", 10);
	strncpy(tpinRequestMsg.tpinUpdate.service, "02", 2);
	strncpy(tpinRequestMsg.tpinUpdate.custNo, tpinHistRec.custNo, 7);
	strncpy(tpinRequestMsg.tpinUpdate.tpinNo, tpinHistRec.tPin, 4);
	strncpy(tpinRequestMsg.tpinUpdate.customerBranchCode, tpinHistRec.custBranchCode, 4);
	strncpy(tpinRequestMsg.tpinUpdate.requestBranchCode, tpinHistRec.branchCode, 4);
	strncpy(tpinRequestMsg.tpinUpdate.custName, crdRec.custName, 30);
	strncpy(tpinRequestMsg.tpinUpdate.address1, custTabRec.address1, 30);
	strncpy(tpinRequestMsg.tpinUpdate.address2, custTabRec.address2, 30);
	strncpy(tpinRequestMsg.tpinUpdate.poBox, custTabRec.poBox, 10);
	strncpy(tpinRequestMsg.tpinUpdate.cityName, custTabRec.cityName, 20);
	strncpy(tpinRequestMsg.tpinUpdate.zipCode, custTabRec.zipCode, 10);
	tpinRequestMsg.tpinUpdate.nullPad = '\0';
	sprintf(tmpStr, "%05d", strlen(tpinRequestMsg.tpinUpdate.msgLen));
	strncpy(tpinRequestMsg.tpinUpdate.msgLen, tmpStr, 5);

	fprintf(logFp, "%s|%5d|: Send to TUXEDO [%s] \n", getDateTime(), PID, tpinRequestMsg.tpinUpdate.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("TPINSERVICES", tpinRequestMsg.tpinUpdate.msgLen, tpinResponseMsg.tpinUpdate.msgLen) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, tpinResponseMsg.tpinUpdate.msgLen);
	fflush(logFp);

	if ( strncmp(tpinResponseMsg.tpinUpdate.responseStatus, "00", 2) == 0 ) /* Success */
	{
		memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

		tpinHistRec.pendingStatus = '9' ; /* Completed */
		strncpy(tpinHistRec.supervisorId, receivedMsg.tpinRequest.supervisorId, 10);

		strncpy(tpinHistRec.lastUpdateUser, receivedMsg.tpinRequest.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(tpinHistRec.lastUpdateDateTime, tmpStr, 14);

		if( isRewcurr(tpinHistFile, &tpinHistRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISREWCURR error %d on sttpinhist for key=%.28s\n", getDateTime(), PID, iserrno, tpinHistRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s] on sttpinhist", tpinHistRec.branchCode);
				formatBranchResponse( DUPLICATE,tmpStr , tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on sttpinhist" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttpinhist", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrelease(tpinHistFile);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		isrelease(tpinHistFile);
		formatBranchResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinUpdate.responseStatus, "02", 2) == 0 )/* Invalid customer */
	{
		sprintf(tmpStr, "Invalid customer [%.7s] ; Please check", tpinRequestMsg.tpinUpdate.custNo);
		formatBranchResponse(INVALID_CUSTOMER, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinUpdate.responseStatus, "06", 2) == 0 )/* Database error */
	{
		formatBranchResponse(DATABASE_ERROR, "Database error occured ;", "Database error occured ;");
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	else
	{
		fprintf(logFp, "%s|%5d| Internal error response (%.2s) received from Tuxedo ; Please check \n", getDateTime(), PID, tpinResponseMsg.tpinStatus.responseStatus);
		formatBranchResponse(INTERNALERR, "Internal error ; Please call support", "Internal error ; please call support");
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
}

processTpinStatus()
{
	char tmpStr[100];

	memset(responseMsg.tpinRequest.msgLen, ' ', sizeof responseMsg.tpinRequest);
	responseMsg.tpinRequest.nullPad = '\0';

	memset(tpinRequestMsg.tpinStatus.msgLen, ' ', sizeof tpinRequestMsg.tpinStatus);
	memset(tpinResponseMsg.tpinStatus.msgLen, ' ', sizeof tpinResponseMsg.tpinStatus);

	strncpy(tpinRequestMsg.tpinStatus.reqSource, "CSD               ", 10);
	strncpy(tpinRequestMsg.tpinStatus.service, "01", 2);
	strncpy(tpinRequestMsg.tpinStatus.cardNo, receivedMsg.tpinRequest.custNo, 7);
	tpinRequestMsg.tpinStatus.nullPad = '\0';
	sprintf(tmpStr, "%05d", strlen(tpinRequestMsg.tpinStatus.msgLen));
	strncpy(tpinRequestMsg.tpinStatus.msgLen, tmpStr, 5);

	fprintf(logFp, "%s|%5d| Send to TUXEDO [%s] \n", getDateTime(), PID, tpinRequestMsg.tpinStatus.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("TPINSERVICES", tpinRequestMsg.tpinStatus.msgLen, tpinResponseMsg.tpinStatus.msgLen) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(tpinResponseMsg.tpinStatus.responseStatus, "00", 2) == 0 ) /* Success */
	{
		responseMsg.tpinRequest.tpinExistFlag = '1'; /* Tpin Selected */
		responseMsg.tpinRequest.tpinStatus = tpinResponseMsg.tpinStatus.tpinStatus;
		formatTpinStatusResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinStatus.responseStatus, "02", 2) == 0 )/* Invalid customer */
	{
		responseMsg.tpinRequest.tpinExistFlag = '0'; /* Tpin Not Selected */
		formatTpinStatusResponse(DONE, "TPIN not available for this customer", "TPIN not available for this customer");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinStatus.responseStatus, "06", 2) == 0 )/* Database error */
	{
		formatTpinStatusResponse(DATABASE_ERROR, "Database error occured ;", "Database error occured ;");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return FAILURE;
	}
	else
	{
		fprintf(logFp, "%s|%5d| Internal error response (%.2s) received from Tuxedo ; Please check \n", getDateTime(), PID, tpinResponseMsg.tpinStatus.responseStatus);
		fflush(logFp);
		formatTpinStatusResponse(INTERNALERR, "Internal error ; Please call support", "Internal error ; please call support");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return FAILURE;
	}
}

processTpinCheck()
{
	char tmpStr[100], activeCardNo[25];
	int  primaryActiveCardFound = NO;

	memset(responseMsg.tpinRequest.msgLen, ' ', sizeof responseMsg.tpinRequest);
	responseMsg.tpinRequest.nullPad = '\0';


	memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);
	isindexinfo(cardTabFile, &cardTabKey, 4);
	strncpy(&cardTabRec.bmAccNo[5], receivedMsg.tpinRequest.custNo, 7);
	isstart(cardTabFile, &cardTabKey, 0 , &cardTabRec.liveChar, ISGTEQ);
	while ( isRead(cardTabFile, &cardTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(&cardTabRec.bmAccNo[5], receivedMsg.tpinRequest.custNo, 7) )
			break;

		if ( cardTabRec.cardStatus != '1' && cardTabRec.cardStatus != '4' )
			continue;

		if ( cardTabRec.primaryOrSupplementary != 'P' )
			continue;

		primaryActiveCardFound = YES;
		break;
	}

	if ( primaryActiveCardFound == YES )
		strncpy(activeCardNo, cardTabRec.cardNo, 19);
	else
		strncpy(activeCardNo, "                     ", 19);

	memset(tpinRequestMsg.tpinCheck.msgLen, ' ', sizeof tpinRequestMsg.tpinCheck);
	memset(tpinResponseMsg.tpinCheck.msgLen, ' ', sizeof tpinResponseMsg.tpinCheck);

	strncpy(tpinRequestMsg.tpinCheck.reqSource, "CSD               ", 10);
	strncpy(tpinRequestMsg.tpinCheck.service, "03", 2);
	strncpy(tpinRequestMsg.tpinCheck.custNo, receivedMsg.tpinRequest.custNo, 7);
	strncpy(tpinRequestMsg.tpinCheck.cardNo, activeCardNo, 19);
	strncpy(tpinRequestMsg.tpinCheck.tpinNo, receivedMsg.tpinRequest.tpinNo, 4);
	tpinRequestMsg.tpinCheck.nullPad = '\0';
	sprintf(tmpStr, "%05d", strlen(tpinRequestMsg.tpinCheck.msgLen));
	strncpy(tpinRequestMsg.tpinCheck.msgLen, tmpStr, 5);

	fprintf(logFp, "%s|%5d| Send to TUXEDO [%s] \n", getDateTime(), PID, tpinRequestMsg.tpinStatus.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("TPINSERVICES", tpinRequestMsg.tpinCheck.msgLen, tpinResponseMsg.tpinCheck.msgLen) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(tpinResponseMsg.tpinCheck.responseStatus, "00", 2) == 0 ) /* Success */
	{
		formatTpinStatusResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinCheck.responseStatus, "01", 2) == 0 )/* Invalid card number */
	{
		formatTpinStatusResponse(DONE, "Invalid card number...", "Invalid card number...");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinCheck.responseStatus, "04", 2) == 0 )/* Weak Tpin */
	{
		formatTpinStatusResponse(WEAK_TPIN, "Weak TPIN entered..Please enter a different TPIN ", "Weak TPIN entered..Please enter a different TPIN ");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinCheck.responseStatus, "05", 2) == 0 )/* ATM pin same as TPIN */
	{
		formatTpinStatusResponse(ATM_PIN_MATCH, "ATM pin matches with this TPIN;Please try again", "ATM pin matches with this TPIN;Please try again");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return SUCCESS;
	}
	else if ( strncmp(tpinResponseMsg.tpinCheck.responseStatus, "06", 2) == 0 )/* Database error */
	{
		formatTpinStatusResponse(DATABASE_ERROR, "Database error occured ;", "Database error occured ;");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return FAILURE;
	}
	else
	{
		fprintf(logFp, "%s|%5d| Internal error response (%.2s) received from Tuxedo ; Please check \n", getDateTime(), PID, tpinResponseMsg.tpinStatus.responseStatus);
		formatTpinStatusResponse(INTERNALERR, "Internal error ; Please call support", "Internal error ; please call support");
		sendResponse(responseMsg.tpinRequest.msgLen);
		return FAILURE;
	}
}

processTpinHistory()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, i ;
	int len;
	char tmpStr[100];

	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	
	memset(responseMsg.custHistory.msgLen, ' ', sizeof responseMsg.custHistory);
	responseMsg.custHistory.nullPad = '\0';

	memset(&tpinHistRec.liveChar, ' ', sizeof tpinHistRec);
	isindexinfo(tpinHistFile, &tpinHistKey, 2);

	sprintf(tmpStr, "%.5s", receivedMsg.custHistory.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	sprintf(tmpStr, "%.7s", receivedMsg.custHistory.custNo);
	if ( getCustName(tmpStr) == SUCCESS )
	{
		if ( strncmp(custTabRec.aShortName, "                                 ", 30) == 0 )
			strncpy(responseMsg.custHistory.shortName, custTabRec.eShortName, 30);
		else
			strncpy(responseMsg.custHistory.shortName, custTabRec.aShortName, 30);

		strncpy(responseMsg.custHistory.custBranchCode, custTabRec.branchCode, 4);
	}
	strncpy(responseMsg.custHistory.custNo, receivedMsg.custHistory.custNo, 7);
	strncpy(tpinHistRec.custNo, receivedMsg.custHistory.custNo, 7);

	isstart(tpinHistFile,&tpinHistKey, 0, &tpinHistRec.liveChar,ISGTEQ);

	while ( isRead(tpinHistFile, &tpinHistRec.liveChar, ISNEXT) == 0 )
	{
		/* Remove NULL char from the record */
		len = sizeof tpinHistRec;
		for (i = 0 ; i < len; i++)
			if ( tpinHistRec.branchCode[i] == NULL )
				tpinHistRec.branchCode[i] = ' ';

		if ( strncmp(tpinHistRec.custNo, receivedMsg.custHistory.custNo, 7) )
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.custHistory.details[recsInThisMsg].branchCode, tpinHistRec.branchCode, 4);
		strncpy(responseMsg.custHistory.details[recsInThisMsg].userId, tpinHistRec.userId, 10);
		strncpy(responseMsg.custHistory.details[recsInThisMsg].dateTime, tpinHistRec.dateTime, 14);
		responseMsg.custHistory.details[recsInThisMsg].pendingStatus = tpinHistRec.pendingStatus;
		if ( tpinHistRec.pendingStatus != '1' )
		{
			strncpy(responseMsg.custHistory.details[recsInThisMsg].supervisorId, tpinHistRec.supervisorId, 10);
			strncpy(responseMsg.custHistory.details[recsInThisMsg].lastUpdateDateTime, tpinHistRec.lastUpdateDateTime, 14);
		}
		
		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.custHistory.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.custHistory.noOfRecs, tmpStr, 2);
	responseMsg.custHistory.details[recsInThisMsg+1].branchCode[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.custHistory.msgLen);
	return SUCCESS;
}
	

formatTpinPendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];
	if ( extraDebug )
	     fprintf(logFp, "Formating the response\n");
	strncpy(responseMsg.tpinPendingList.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.tpinPendingList.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.tpinPendingList.eRemarks,tmpStr,50);
	strncpy(responseMsg.tpinPendingList.service, receivedMsg.tpinPendingList.service, 2);
	responseMsg.tpinPendingList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.tpinPendingList.msgLen));
	strncpy(responseMsg.tpinPendingList.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTpinStatusResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks; 
{
	char tmpStr[120];
	if ( extraDebug )
	     fprintf(logFp, "Formating the response\n");
	strncpy(responseMsg.tpinRequest.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.tpinRequest.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.tpinRequest.eRemarks,tmpStr,50);
	strncpy(responseMsg.tpinRequest.service, receivedMsg.tpinRequest.service, 2);
	strncpy(responseMsg.tpinRequest.custNo,  receivedMsg.tpinRequest.custNo, 7);
	responseMsg.tpinRequest.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.tpinRequest.msgLen));
	strncpy(responseMsg.tpinRequest.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

readTpinHistoryFile(mode)
int mode;
{
	char tmpStr[55];

	fprintf(logFp, "readTpinHistFile() for key value %.28s\n", tpinHistRec.branchCode);
	fflush(logFp);
	if ( isRead(tpinHistFile, &tpinHistRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISREAD/%s error %d on sttpinhist for the key=%.28s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, tpinHistRec.branchCode);
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
			sprintf(tmpStr, "Record/File locked on sttpinhist file");
			formatBranchResponse(RECORD_LOCKED,  tmpStr, tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttpinhist file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

openTpinHistoryFile(int mode)
{
	char tmpStr[100];

	if ( tpinHistFileOpen == YES )
		return SUCCESS;

	/* Open Tpin history table */
	if ( (tpinHistFile  = isopen(tpinHistFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, tpinHistFilePath);
		sprintf(tmpStr,"Error  %d occured while opening sttpinhist.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr );
		return FAILURE;
	}
	isindexinfo(tpinHistFile, &tpinHistKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Tpin History file (%d) successfully opened....\n", getDateTime(), PID, tpinHistFile);
		fflush(logFp);
	}

	tpinHistFileOpen = YES;
	return SUCCESS;
}
