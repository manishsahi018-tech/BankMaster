/*
	Objective       :       Static data management server 
				            (included for Block amount breakup/manual blocking , etc.. )

	Date            :       25/01/2005.

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
#include "cbrouter.h"
#include "ccenqmsg.h"

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, ridKey, thdKey, thd1Key, aadKey, bkdKey, arrBlkKey, o3dKey, arrBlkLogKey, dzdKey, accBlkKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, ridFile, thdFile, thd1File, aadFile, bkdFile, arrBlkFile, o3dFile, arrBlkLogFile, dzdFile, accBlkFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *aadFilePath, *bkdFilePath, *arrBlkFilePath, *arrBlkLogFilePath, *dzdFilePath, *accBlkFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];

extern FILE *logFp, *errLogFp, *expPrtFp;

struct 	crd0data					crdRec;
struct 	customerInfo				custTabRec;
struct 	branchActivityOnAccounts	acctLogRec;
struct 	gld0data					gldRec;
struct 	aad0data					aadRec;
struct 	dzd0data					dzdRec;
struct 	bkd0data					bkdRec;
struct 	ccarrblk					arrBlkRec;
struct  staccblk					accBlkRec;
struct 	ccblklog					arrBlkLogRec;
struct 	o2d0data					o3dRec;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, aadFileOpen, bkdFileOpen, arrBlkFileOpen, arrBlkLogFileOpen, dzdFileOpen, accBlkFileOpen;

int stBlocking(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stBlocking]\n", getDateTime(), PID);
		fflush(logFp);
	}

	systime = time(NULL);                  /* get the system time */
	systemDate = localtime( &systime );

	sprintf(tmpStr, "%.6s", headerBuf);
	msgLen = atoi(tmpStr);

	/* receive the main details */

	memset(receivedMsg.customer.msgLen, NULL, sizeof receivedMsg.customer);
	memset(responseMsg.customer.msgLen,  ' ', sizeof responseMsg.customer);
	strncpy(receivedMsg.customer.msgLen, headerBuf, 12);
	if ( getMessage(receivedMsg.customer.userId, msgLen - 12) < 0 )
	{
		formatBranchResponse(COMMSERR, "Comms Error:Check your connnection or call Support ","Comms Error:Check your connnection or call Support ");
		sendResponse(responseMsg.customer.msgLen);
		return COMMSFAILURE;
	}
	     
	if ( loginAuthorised == NO )
	{
		formatBranchResponse(NOT_LOGIN, "Not yet logged in", "Not yet logged in");
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(&headerBuf[6], "86", 2) == 0 ) /* Breakup details of GL Account */
	{
		logBlockAmtBreakupDetails();

		if ( openGldFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAadFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openBkdFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openArrBlkFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAccBlkFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( getBlockingBreakup() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "87", 2) == 0 ) /* Account update history details */
	{
		logAccountUpdateHistory();

		if ( openAcctLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCustTabFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( getAcctUpdateHistory() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "88", 2) == 0 ) /* Manual blocking maintenance */
	{
		logManualBlockingDetails();

		if ( openArrBlkFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openArrBlkLogFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAccBlkFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processManualBlocking() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "89", 2) == 0 ) /* Get Manual blocking pending list */
	{
		logManualBlockingPendingList();

		if ( openArrBlkLogFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readBlockPendingList() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "92", 2) == 0 ) /* Manual blocking Approval */
	{
		logBlockingApprovalDetails();

		if ( processBlockApproval(receivedMsg.blockApproval.appRejectFlag) == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "93", 2) == 0 ) /* Diary Detail Enquiry */
	{
		logDiaryEnquiryDetails();

		if ( openDzdFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/*if ( processDiarySearch() == FAILURE )*/
			return FAILURE;
	}
	else 
	{
		sprintf(tmpStr, "Invalid Service Code %.2s received", &headerBuf[6]);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

getBlockingBreakup() 
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	double blockedAmt=0;
	char tmpStr[100], bmAccNo[20];

	memset(responseMsg.blockBreakup.msgLen, ' ', sizeof responseMsg.blockBreakup);
	responseMsg.blockBreakup.nullPad = '\0';

	actualToBmAcc(receivedMsg.blockBreakup.accNo, bmAccNo);

	/* Obtain total blocked amount from GL */

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	isindexinfo(gldFile, &gldKey, 1); /* based on account number */
	strncpy(gldRec.accNo, bmAccNo, 13);
	isstart(gldFile, &gldKey, 0, &gldRec.liveChar, ISGTEQ);

	if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getBlockingBreakup] ISREAD/ISEQUAL error %d for the account number [%.14s:%.13s] while trying to get the blocked amount \n", getDateTime(), PID, iserrno,  receivedMsg.blockBreakup.accNo, bmAccNo);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid Account number ...Please check");
			formatBlockBreakupResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading gld0data", iserrno);
			formatBlockBreakupResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.blockBreakup.msgLen);
		return FAILURE;
	}

	blockedAmt = bmAmtToDbl(gldRec.blockedAmt, 14);
	sprintf(tmpStr, "%014.0f", blockedAmt);
	strncpy(responseMsg.blockBreakup.blockedBal, tmpStr, 14);

	/* Collect break-up for BM loan blocked amount */

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	isindexinfo(gldFile, &gldKey, 3); /* based on customer number */
	strncpy(&gldRec.accNo[5], &bmAccNo[5], 6);
	isstart(gldFile, &gldKey, 6, &gldRec.liveChar, ISGTEQ);

	while ( isread(gldFile, &gldRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(&gldRec.accNo[5], &bmAccNo[5], 6) )
			break;

		if ( strncmp(gldRec.settlementAccNo, bmAccNo, 13) )
			continue;

		blockedAmt = bmAmtToDbl(gldRec.blockedArrear2, 14);
		if ( blockedAmt == 0 )
			continue;
		if ( blockedAmt < 0 )
			blockedAmt *= -1;
		responseMsg.blockBreakup.details[recsInThisMsg].productType = 'B';
		if ( strncmp(gldRec.matchingLoan, "                ", 13) == 0 )
			strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, bmAccToActual(gldRec.accNo, tmpStr), 14);
		else
			strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, bmAccToActual(gldRec.matchingLoan, tmpStr), 14);
		sprintf(tmpStr, "%014.0f", blockedAmt);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].blockedAmt, tmpStr, 14);
		recsInThisMsg++;

		if ( recsInThisMsg > 30 )
		{
			sprintf(tmpStr, "%02d", recsInThisMsg);
			strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
			strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

			formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
			sendResponse(responseMsg.blockBreakup.msgLen);
			return SUCCESS;
		}
	}

	/* Collect break-up for FINNONE loan blocked amount */

	memset(&aadRec.liveChar, ' ', sizeof aadRec);
	isindexinfo(aadFile, &aadKey, 3); 
	strncpy(aadRec.settlementAccNo, bmAccNo, 13);
	isstart(aadFile, &aadKey, 0, &aadRec.liveChar, ISGTEQ);

	blockedAmt=0;
	while ( isread(aadFile, &aadRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(aadRec.settlementAccNo, bmAccNo, 13) )
			break;

		blockedAmt = bmAmtToDbl(aadRec.loanBlockBal, 14);
		if ( blockedAmt == 0 )
			continue;
		if ( blockedAmt < 0 )
			blockedAmt *= -1;
		responseMsg.blockBreakup.details[recsInThisMsg].productType = 'F';
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, bmAccToActual(aadRec.accNo, tmpStr), 14);
		sprintf(tmpStr, "%014.0f", blockedAmt);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].blockedAmt, tmpStr, 14);
		recsInThisMsg++;

		if ( recsInThisMsg > 30 )
		{
			sprintf(tmpStr, "%02d", recsInThisMsg);
			strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
			strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

			formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
			sendResponse(responseMsg.blockBreakup.msgLen);
			return SUCCESS;
		}
	}

	/* Collect break-up for other BM blocked amount */

	memset(&bkdRec.liveChar, ' ', sizeof bkdRec);
	isindexinfo(bkdFile, &bkdKey, 1); 
	strncpy(bkdRec.accNo, bmAccNo, 13);
	isstart(bkdFile, &bkdKey, 0, &bkdRec.liveChar, ISGTEQ);

	blockedAmt=0;
	while ( isread(bkdFile, &bkdRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(bkdRec.accNo, bmAccNo, 13) )
			break;

		if ( bkdRec.recType != '1' )
			continue;

		blockedAmt = bmAmtToDbl(bkdRec.blockedAmt, 14);
		if ( blockedAmt == 0 )
			continue;
		if ( blockedAmt < 0 )
			blockedAmt *= -1;
		responseMsg.blockBreakup.details[recsInThisMsg].productType = 'O';
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, bkdRec.refNo, 10);
		sprintf(tmpStr, "%014.0f", blockedAmt);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].blockedAmt, tmpStr, 14);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked, bkdRec.userId, 3);
		recsInThisMsg++;

		if ( recsInThisMsg > 30 )
		{
			sprintf(tmpStr, "%02d", recsInThisMsg);
			strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
			strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

			formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
			sendResponse(responseMsg.blockBreakup.msgLen);
			return SUCCESS;
		}
	}

	/* Collect break-up for Credit Card arrear blocked amount */

	memset(&arrBlkRec.liveChar, ' ', sizeof arrBlkRec);
	isindexinfo(arrBlkFile, &arrBlkKey, 2); 
	strncpy(arrBlkRec.bmAccNo, receivedMsg.blockBreakup.accNo, 14);
	isstart(arrBlkFile, &arrBlkKey, 0, &arrBlkRec.liveChar, ISGTEQ);

	blockedAmt=0;
	while ( isread(arrBlkFile, &arrBlkRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(arrBlkRec.bmAccNo, receivedMsg.blockBreakup.accNo, 14) )
			break;

		blockedAmt = bmAmtToDbl(arrBlkRec.blockedAmt, 14);
		if ( blockedAmt < 0 )
			blockedAmt *= -1;

		if ( arrBlkRec.autoManualFlag == 'M' ) /* Manual Blocking */
		{
			responseMsg.blockBreakup.details[recsInThisMsg].productType = 'M';
			strncpy(responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked, arrBlkRec.lastBlockedUserId , 10);
			if ( arrBlkRec.lastBlockedUserId[0] >= '0' && arrBlkRec.lastBlockedUserId[0] <= '9' )
				strncpy(&responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked[7], &arrBlkRec.requestBranch[1], 3);
		}
		else
		{
			if ( blockedAmt == 0 )
				continue;
			responseMsg.blockBreakup.details[recsInThisMsg].productType = 'C';
			strncpy(responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked, "CCARRBLK     ", 10);
		}
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, arrBlkRec.cardNo, 16);
		sprintf(tmpStr, "%014.0f", blockedAmt);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].blockedAmt, tmpStr, 14);
		recsInThisMsg++;

		if ( recsInThisMsg > 30 )
		{
			sprintf(tmpStr, "%02d", recsInThisMsg);
			strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
			strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

			formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
			sendResponse(responseMsg.blockBreakup.msgLen);
			return SUCCESS;
		}
	}

	/* Collect break-up for Manual account blocking amount */

	memset(&accBlkRec.liveChar, ' ', sizeof accBlkRec);
	isindexinfo(accBlkFile, &accBlkKey, 1); 
	strncpy(accBlkRec.bmAccNo, receivedMsg.blockBreakup.accNo, 14);
	isstart(accBlkFile, &accBlkKey, 0, &accBlkRec.liveChar, ISGTEQ);

	blockedAmt=0;
	while ( isread(accBlkFile, &accBlkRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(accBlkRec.bmAccNo, receivedMsg.blockBreakup.accNo, 14) )
			break;

		blockedAmt = bmAmtToDbl(accBlkRec.blockedAmt, 14);
		if ( blockedAmt < 0 )
			blockedAmt *= -1;

		if ( blockedAmt == 0 )
			continue;
		responseMsg.blockBreakup.details[recsInThisMsg].productType = 'A';
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked, accBlkRec.lastBlockedUserId , 10);
		if ( accBlkRec.lastBlockedUserId[0] >= '0' && accBlkRec.lastBlockedUserId[0] <= '9' )
			strncpy(&responseMsg.blockBreakup.details[recsInThisMsg].userIdBlocked[7], &accBlkRec.requestBranch[1], 3);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].productNo, accBlkRec.bmAccNo, 14);
		sprintf(tmpStr, "%014.0f", blockedAmt);
		strncpy(responseMsg.blockBreakup.details[recsInThisMsg].blockedAmt, tmpStr, 14);
		recsInThisMsg++;

		if ( recsInThisMsg > 30 )
		{
			sprintf(tmpStr, "%02d", recsInThisMsg);
			strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
			strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

			formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
			sendResponse(responseMsg.blockBreakup.msgLen);
			return SUCCESS;
		}
	}
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.blockBreakup.noOfRecs, tmpStr, 2);
	strncpy(responseMsg.blockBreakup.accNo, receivedMsg.blockBreakup.accNo, 14);

	formatBlockBreakupResponse(DONE, "Successful.....", "Successfull.....");
	sendResponse(responseMsg.blockBreakup.msgLen);
	return SUCCESS;
}

getAcctUpdateHistory() 
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, i ;
	int len;
	char tmpStr[100], tmpLastRecCount[10];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getAcctUpdateHistory]\n", getDateTime(), PID);
	
	memset(responseMsg.acctHistory.msgLen, ' ', sizeof responseMsg.acctHistory);
	responseMsg.acctHistory.nullPad = '\0';
	sprintf(tmpLastRecCount, "%.5s", receivedMsg.acctHistory.lastRecCount);

	strncpy(receivedMsg.acctStatusHistory.msgLen, "000042", 6);
	strncpy(receivedMsg.acctStatusHistory.service, "57", 2);
	strncpy(receivedMsg.acctStatusHistory.homeBranch, receivedMsg.acctHistory.homeBranch, 4);
	strncpy(receivedMsg.acctStatusHistory.accNo, receivedMsg.acctHistory.accNo, 14);
	receivedMsg.acctStatusHistory.requestType = '2'; /* Account update history */
	strncpy(receivedMsg.acctStatusHistory.lastRecCount, tmpLastRecCount, 5);

	if ( getAcctStatusHistory() == FAILURE )
		return FAILURE;
	else
		return SUCCESS;

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	isindexinfo(acctLogFile, &acctLogKey, 2);

	sprintf(tmpStr, "%.5s", receivedMsg.acctHistory.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	strncpy(responseMsg.acctHistory.accNo, receivedMsg.acctHistory.accNo, 14);
	strncpy(acctLogRec.accNo, receivedMsg.acctHistory.accNo, 14);

	isstart(acctLogFile,&acctLogKey, 0, &acctLogRec.liveChar,ISGTEQ);

	while ( isread(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
	{
		/* Remove NULL char from the record */
		len = sizeof acctLogRec;
		for (i = 0 ; i < len; i++)
			if ( acctLogRec.branchCode[i] == NULL )
				acctLogRec.branchCode[i] = ' ';

		if ( strncmp(acctLogRec.accNo, receivedMsg.acctHistory.accNo, 14) )
			break;

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
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.acctHistory.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.acctHistory.noOfRecs, tmpStr, 2);
	responseMsg.acctHistory.details[recsInThisMsg+1].branchCode[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.acctHistory.msgLen);
	return SUCCESS;
}

processManualBlocking() 
{
	char tmpStr[100], action;
	int  readStatus;
	double blockAmt=0;

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

	memset(&arrBlkLogRec.liveChar, ' ', sizeof arrBlkLogRec);
	if ( receivedMsg.manualBlocking.creationOrUpdate == 'U' ) /* tellerAction */
	{
		strncpy(arrBlkLogRec.branchCode, receivedMsg.manualBlocking.homeBranch, 4);
		strncpy(arrBlkLogRec.userId, receivedMsg.manualBlocking.userId, 10);
		strncpy(arrBlkLogRec.dateTime, receivedMsg.manualBlocking.dateTime, 14);
		strncpy(arrBlkLogRec.cardNo, receivedMsg.manualBlocking.cardNo, 16);

		isindexinfo(arrBlkLogFile, &arrBlkLogKey, 1);
		isstart(arrBlkLogFile, &arrBlkLogKey, 0, &arrBlkLogRec.liveChar, ISGTEQ);

		if ( readArrBlkLogFile(ISEQUAL) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( receivedMsg.manualBlocking.cardOrAcct != 'A' ) /* If it is not account */
		{
			strncpy(arrBlkLogRec.cardNo, receivedMsg.manualBlocking.cardNo, 16);

			isindexinfo(arrBlkLogFile, &arrBlkLogKey, 2);
			if( isstart(arrBlkLogFile, &arrBlkLogKey, 0, &arrBlkLogRec.liveChar,ISGTEQ) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] ISSTART/ISGTEQ error %d on ccblklog for card # [%.16s]ignored..\n", getDateTime(), PID, iserrno, arrBlkLogRec.cardNo);
				fflush(logFp);
				fprintf(errLogFp, "%s|%5d|processManualBlocking(): ISSTART/ISGTEQ error %d on ccblklog for card # [%.16s]ignored..\n", getDateTime(), iserrno, arrBlkLogRec.cardNo);
				fflush(errLogFp);
			}

			while ( isRead(arrBlkLogFile, &arrBlkLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(arrBlkLogRec.cardNo, receivedMsg.manualBlocking.cardNo, 16) )
					break;

				if ( arrBlkLogRec.pendingStatus == '1' || arrBlkLogRec.pendingStatus == '2')
				{
					fprintf(logFp, "%s|%5d|[processManualBlocking] : Card # [%.16s] already in pending status [%c] in branch [%.4s] for ; Request User Id [%.10s]\n", getDateTime(), PID, arrBlkLogRec.cardNo, arrBlkLogRec.pendingStatus, arrBlkLogRec.branchCode, arrBlkLogRec.userId);
					fflush(logFp);

					if ( arrBlkLogRec.pendingStatus == '1' ) /* Pending with supervisor */
						sprintf(tmpStr, "Card is Pending with Supervisor of Br.Code [%.4s]", arrBlkLogRec.branchCode);
					else /* pending with CSO */
						sprintf(tmpStr, "Card is pending with User[%.10s];Br.[%.4s]", arrBlkLogRec.userId, arrBlkLogRec.branchCode);

					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
		}
		else
		{
			strncpy(arrBlkLogRec.bmAccNo, receivedMsg.manualBlocking.accNo, 14);

			isindexinfo(arrBlkLogFile, &arrBlkLogKey, 3);
			if( isstart(arrBlkLogFile, &arrBlkLogKey, 0, &arrBlkLogRec.liveChar,ISGTEQ) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] ISSTART/ISGTEQ error %d on ccblklog for account # [%.14s]ignored..\n", getDateTime(), PID, iserrno, arrBlkLogRec.bmAccNo);
				fflush(logFp);
				fprintf(errLogFp, "%s|%5d|processManualBlocking(): ISSTART/ISGTEQ error %d on ccblklog for account # [%.16s]ignored..\n", getDateTime(), iserrno, arrBlkLogRec.bmAccNo);
				fflush(errLogFp);
			}

			while ( isRead(arrBlkLogFile, &arrBlkLogRec.liveChar, ISNEXT) == 0 )
			{
				if ( strncmp(arrBlkLogRec.bmAccNo, receivedMsg.manualBlocking.accNo, 14) )
					break;

				if ( arrBlkLogRec.pendingStatus == '1' || arrBlkLogRec.pendingStatus == '2')
				{
					fprintf(logFp, "%s|%5d|[processManualBlocking] : Account # [%.14s] already in pending status [%c] in branch [%.4s] for ; Request User Id [%.10s]\n", getDateTime(), PID, arrBlkLogRec.bmAccNo, arrBlkLogRec.pendingStatus, arrBlkLogRec.branchCode, arrBlkLogRec.userId);
					fflush(logFp);

					if ( arrBlkLogRec.pendingStatus == '1' ) /* Pending with supervisor */
						sprintf(tmpStr, "A/c is Pending with Supervisor of Br.Code [%.4s]", arrBlkLogRec.branchCode);
					else /* pending with CSO */
						sprintf(tmpStr, "Account is pending with User[%.10s];Br.[%.4s]", arrBlkLogRec.userId, arrBlkLogRec.branchCode);

					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
		}
		memset(&arrBlkLogRec.liveChar, ' ', sizeof arrBlkLogRec);
	}

	action = receivedMsg.manualBlocking.action;
	if ( receivedMsg.manualBlocking.cardOrAcct != 'A' ) /* If it is not account */
	{
		memset(&arrBlkRec.liveChar, ' ', sizeof arrBlkRec);
		strncpy(arrBlkRec.cardNo, receivedMsg.manualBlocking.cardNo, 16);
		isindexinfo(arrBlkFile, &arrBlkKey, 1); /* based on card number */
		isstart(arrBlkFile, &arrBlkKey, 0, &arrBlkRec.liveChar, ISGTEQ);
		readStatus = isRead(arrBlkFile, &arrBlkRec.liveChar, ISEQUAL); 

		if ( action == 'N' ) /* Introduce new blocking */
		{
			if ( readStatus == 0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming card number [%.16s] already exists in ccarrblk with attached BM account number [%.14s]; so, manual blocking is rejected  \n", getDateTime(), PID, arrBlkRec.cardNo, arrBlkRec.bmAccNo);
				fflush(logFp);
				sprintf(tmpStr, "%.14s", arrBlkRec.bmAccNo);
				formatBranchResponse(ALREADY_BLOCKED, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			memset(reqMsgCcEnq.msgLen, ' ', sizeof reqMsgCcEnq);
			memset(resMsgCcEnq.msgLen, ' ', sizeof resMsgCcEnq);
			strncpy(reqMsgCcEnq.reqSource, "CSD          ", 10);
			strncpy(reqMsgCcEnq.service, "02", 2);
			strncpy(reqMsgCcEnq.creditCardNo, receivedMsg.manualBlocking.cardNo, 16);
			reqMsgCcEnq.nullPad = '\0';
			sprintf(tmpStr, "%05d", strlen(reqMsgCcEnq.msgLen));
			strncpy(reqMsgCcEnq.msgLen, tmpStr, 5);
			if ( dealWithTuxedo("CCSERVICES", reqMsgCcEnq.msgLen, resMsgCcEnq.msgLen) == FAILURE )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( strncmp(resMsgCcEnq.responseStatus, "00", 2) )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking]: Error [%.2s] received from TUXEDO after calling CCSERVICES for the card number [%.16s]\n", getDateTime(), PID, resMsgCcEnq.responseStatus, receivedMsg.manualBlocking.cardNo);
				fflush(logFp);

				if ( strncmp(resMsgCcEnq.responseStatus, "02", 2) == 0  )
				{
					sprintf(tmpStr, "Invalid  credit card number.. Please check....");
					formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else if ( strncmp(resMsgCcEnq.responseStatus, "03", 2) == 0  )
				{
					sprintf(tmpStr, "Incorrect message sent to TUXEDO..Please check....");
					formatBranchResponse(INCORRECTMSG, tmpStr, tmpStr);
				}
				else if ( strncmp(resMsgCcEnq.responseStatus, "04", 2) == 0  )
				{
					sprintf(tmpStr, "MQ-Series error occured..Please check with SUPPORT.");
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				else if ( strncmp(resMsgCcEnq.responseStatus, "05", 2) == 0  )
				{
					sprintf(tmpStr, "FDR error occured..Please check with SUPPORT.");
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				else if ( strncmp(resMsgCcEnq.responseStatus, "99", 2) == 0  )
				{
					sprintf(tmpStr, "Internal error from TUXEDO..Please check.");
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "Error [%.2s] received from TUXEDO...Please check..", resMsgCcEnq.responseStatus);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( strncmp(resMsgCcEnq.checkingAccNo, receivedMsg.manualBlocking.accNo, 14) )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking]: Incoming account number [%.14s] does not match with account number returned from FDR [%.14s] for the card number [%.16s]; so, manual blocking is rejected  \n", getDateTime(), PID, receivedMsg.manualBlocking.accNo, resMsgCcEnq.checkingAccNo, receivedMsg.manualBlocking.cardNo);
				fflush(logFp);
				sprintf(tmpStr, "[%.14s]", resMsgCcEnq.checkingAccNo);
				formatBranchResponse(ACCOUNT_MISMATCH, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			strncpy(arrBlkLogRec.nameOnTheCard, resMsgCcEnq.embossedName, 26);
			arrBlkLogRec.cardInternalStatus = resMsgCcEnq.internalStatus;
			arrBlkLogRec.cardExternalStatus = resMsgCcEnq.externalStatus;
		}
		else
		{
			if ( readStatus <  0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming card number [%.16s] does not exists in ccarrblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, arrBlkRec.cardNo, iserrno);
				fflush(logFp);
				if ( iserrno == 111 || iserrno == 110 )
				{
					sprintf(tmpStr, "Invalid card number; Please check ");
					formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "Error %d while reading ccarrblk", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( strncmp(receivedMsg.manualBlocking.homeBranch, arrBlkRec.requestBranch, 4) && strncmp(arrBlkRec.requestBranch,"    ", 4) )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming card number [%.16s] ; account number [%.14s] is blocked by different branch [%.4s] ; so, blocking cannot be amended/deleted  \n", getDateTime(), PID, arrBlkRec.cardNo, arrBlkRec.bmAccNo, arrBlkRec.requestBranch);
				fflush(logFp);
				sprintf(tmpStr, "Blocking done by another branch;update not allowed");
				formatBranchResponse(BLOCKING_PROHIBITED, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	else
	{
		memset(&accBlkRec.liveChar, ' ', sizeof accBlkRec);
		strncpy(accBlkRec.bmAccNo, receivedMsg.manualBlocking.accNo, 14);
		isindexinfo(accBlkFile, &accBlkKey, 1); /* based on account number */
		isstart(accBlkFile, &accBlkKey, 0, &accBlkRec.liveChar, ISGTEQ);
		readStatus = isRead(accBlkFile, &accBlkRec.liveChar, ISEQUAL); 

		if ( action == 'N' ) /* Introduce new blocking */
		{
			if ( readStatus == 0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming account number [%.16s] already exists in staccblk ; so, manual blocking is rejected  \n", getDateTime(), PID, accBlkRec.bmAccNo);
				fflush(logFp);
				sprintf(tmpStr, "The account is already blocked ; try amend action");
				formatBranchResponse(ALREADY_BLOCKED, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			if ( readStatus <  0 )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming account number [%.14s] does not exists in staccblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, accBlkRec.bmAccNo, iserrno);
				fflush(logFp);
				if ( iserrno == 111 || iserrno == 110 )
				{
					sprintf(tmpStr, "Invalid account number; Please check ");
					formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "Error %d while reading staccblk", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( strncmp(receivedMsg.manualBlocking.homeBranch, accBlkRec.requestBranch, 4) )
			{
				fprintf(logFp, "%s|%5d|[processManualBlocking] : Incoming account number [%.14s] is blocked by different branch [%.4s] user [%.10s] ; so, blocking cannot be amended/deleted  \n", getDateTime(), PID, accBlkRec.bmAccNo, accBlkRec.requestBranch, accBlkRec.requestUserId);
				fflush(logFp);
				sprintf(tmpStr, "Blocking done by another branch;update not allowed");
				formatBranchResponse(BLOCKING_PROHIBITED, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	/* Add a record into ccblklog as pending */

	arrBlkLogRec.liveChar = '@';
	strncpy(arrBlkLogRec.branchCode, receivedMsg.manualBlocking.homeBranch, 4);
	strncpy(arrBlkLogRec.userId, receivedMsg.manualBlocking.userId, 10);
	if ( receivedMsg.manualBlocking.creationOrUpdate != 'U' )
	{
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(arrBlkLogRec.dateTime, tmpStr, 14);
	}
	strncpy(arrBlkLogRec.lastUpdateDateTime, tmpStr, 14);
	strncpy(arrBlkLogRec.cardNo, receivedMsg.manualBlocking.cardNo, 16);
	strncpy(arrBlkLogRec.bmAccNo, receivedMsg.manualBlocking.accNo, 14);
	arrBlkLogRec.action = receivedMsg.manualBlocking.action;
	strncpy(arrBlkLogRec.oldBlockAmt, receivedMsg.manualBlocking.oldAmt, 14);
	sprintf(tmpStr, "%.14s", receivedMsg.manualBlocking.blockAmt);
	blockAmt = atof(tmpStr);
	sprintf(tmpStr, "%014.0f", blockAmt);
	strncpy(arrBlkLogRec.blockedAmt , tmpStr, 14);
	arrBlkLogRec.pendingStatus = '1'; /* Pending with supervisor */
	if ( receivedMsg.manualBlocking.cardOrAcct != NULL ) /* to take care of previous version (CC manual blocking) */
		arrBlkLogRec.cardOrAcct = receivedMsg.manualBlocking.cardOrAcct;

	if ( receivedMsg.manualBlocking.creationOrUpdate == 'U' )
	{
		if ( updateArrBlkLogFile() < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(arrBlkLogFile, &arrBlkLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processManualBlocking] ISWRITE error %d on ccblklog for the card # [%.16s] with BM AccNo [%.14s] and key as [%.28s] \n", getDateTime(), PID, iserrno , arrBlkLogRec.cardNo, arrBlkLogRec.bmAccNo, arrBlkLogRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record on ccblklog");
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on ccblklog"); 
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on ccblklog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	
	sprintf(tmpStr, "Successful"); 
	formatBranchResponse(DONE, tmpStr, tmpStr);
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

readBlockPendingList()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	char tAccNo[20],tCustNo[15];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[readBlockPendingList]\n", getDateTime(), PID);


	memset(responseMsg.blockPendingList.msgLen, ' ', sizeof responseMsg.blockPendingList);
	responseMsg.blockPendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.blockPendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&arrBlkLogRec.liveChar, ' ', sizeof arrBlkLogRec);

	isindexinfo(arrBlkLogFile, &arrBlkLogKey, 4);
	if( receivedMsg.blockPendingList.activityFlag == 'S' ) 
	{		
		strncpy(arrBlkLogRec.branchCode, receivedMsg.blockPendingList.homeBranch,4);
		arrBlkLogRec.pendingStatus  = '1'; /* Pending with Supervisor */
		memset( arrBlkLogRec.userId, ' ' ,10 );
	}
	else /* TELLER_ACTION */
	{
		strncpy(arrBlkLogRec.branchCode,receivedMsg.blockPendingList.homeBranch,4);
		arrBlkLogRec.pendingStatus  = '2'; /* Pending with CSO */
		strncpy( arrBlkLogRec.userId, receivedMsg.blockPendingList.userId ,10 ); 
	}

	if ( isstart(arrBlkLogFile,&arrBlkLogKey, 0, &arrBlkLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatBlockPendingListResponse(END_OF_FILE,"No more Records to fetch....", "No more Records to fetch....");
		else
		{
			fprintf(logFp,"%s|%5d|[readBlockPendingList] C-ISAM Error %d occured during ISSTART on ccblklog, key [%.14s %c]\n", getDateTime(), PID, iserrno, arrBlkLogRec.branchCode, arrBlkLogRec.pendingStatus);
			sprintf(tmpStr, "CISAM Error %d occured on ccblklog file", iserrno);
			formatBlockPendingListResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.blockPendingList.msgLen);
		return FAILURE;
	}

	while ( isRead(arrBlkLogFile, &arrBlkLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( receivedMsg.blockPendingList.activityFlag == 'S' )
		{	
		 	if ( strncmp(receivedMsg.blockPendingList.homeBranch, arrBlkLogRec.branchCode, 4) != 0 || arrBlkLogRec.pendingStatus !=  '1' ) 
				break;
		}
		else
		{
		 	if ( strncmp(receivedMsg.blockPendingList.homeBranch, arrBlkLogRec.branchCode,4) != 0 || strncmp(receivedMsg.blockPendingList.userId, arrBlkLogRec.userId, 10) != 0 || arrBlkLogRec.pendingStatus !=  '2') 
				break;
		}

		if ( strncmp(receivedMsg.blockPendingList.custNo, "           ", 7) && receivedMsg.blockPendingList.custNo[0] != NULL && 
			 strncmp(receivedMsg.blockPendingList.custNo, "0000000", 7) )
		{
			if ( strncmp(receivedMsg.blockPendingList.custNo, &arrBlkLogRec.bmAccNo[5], 7) )
				continue;
		}

		if ( receivedMsg.blockPendingList.cardOrAcct == 'A' ) /* Account */
		{
			if ( arrBlkLogRec.cardOrAcct != 'A' )
				continue;
		}
		else
		{
			if ( arrBlkLogRec.cardOrAcct == 'A' )
				continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */
		
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].userId, arrBlkLogRec.userId, 10);
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].dateTime, arrBlkLogRec.dateTime, 14);
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].cardNo, arrBlkLogRec.cardNo, 16);
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].bmAccNo, arrBlkLogRec.bmAccNo, 14);
		responseMsg.blockPendingList.details[recsInThisMsg].action = arrBlkLogRec.action;
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].oldAmt, arrBlkLogRec.oldBlockAmt, 14);
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].blockAmt, arrBlkLogRec.blockedAmt, 14);
		strncpy(responseMsg.blockPendingList.details[recsInThisMsg].supervisorComments, arrBlkLogRec.supervisorComments, 200);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.blockPendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.blockPendingList.noOfRecs, tmpStr, 2);
	responseMsg.blockPendingList.details[recsInThisMsg+1].userId[0] = '\0';
	formatBlockPendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.blockPendingList.msgLen);
	return SUCCESS;
}

processBlockApproval(char reqAction)
{
	char tmpStr[200], *isLogPathName;
	char tCardNo[25];
	int  isappLogFp ;
	long oldSigMask;
	int i;
	char *tmpPtr;


	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processBlockApproval]\n", getDateTime(), PID);

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

	/* If ForwardedToTeller or Rejected the changes; just update the log file */

	if( reqAction != SUP_ACCEPTED ) 
	{
		if ( openArrBlkLogFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/*Update ccblklog file to include supervisorId and his comments*/

		memset(&arrBlkLogRec.liveChar, ' ', sizeof arrBlkLogRec);

		strncpy(arrBlkLogRec.branchCode, receivedMsg.cardApproval.homeBranch,4);
		strncpy(arrBlkLogRec.userId, receivedMsg.cardApproval.userId, 10);
		strncpy(arrBlkLogRec.dateTime, receivedMsg.cardApproval.dateTime,14);
		strncpy(arrBlkLogRec.cardNo, receivedMsg.cardApproval.cardNo,16);
		isindexinfo(arrBlkLogFile, &arrBlkLogKey, 1);
		if ( isstart(arrBlkLogFile, &arrBlkLogKey, 0, &arrBlkLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processBlockApproval]: ISSTART error %d on ccarrblk for the key [%.28s] & card number [%.16s]\n", getDateTime(), PID, iserrno, arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
			fflush(logFp);
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				 formatBranchResponse(END_OF_FILE,"No block Record(s) found for this key ....", "No block Record(s) found for this key ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on ccblklog file", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readArrBlkLogFile(ISEQUAL+ISLOCK) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( arrBlkLogRec.pendingStatus == '9' || arrBlkLogRec.pendingStatus == '3') /* Completed or Rejected */
		{
			fprintf(logFp, "%s|%5d|[processBlockApproval] This manual blocking record has already been approved by %.10s\n", getDateTime(), PID, arrBlkLogRec.supervisorId);
			fflush(logFp);
			sprintf(tmpStr," This Record has been already approved by %.10s", arrBlkLogRec.supervisorId);
			formatBranchResponse(INCORRECTMSG,tmpStr,tmpStr); 
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( reqAction == 'F' ) /* supervisor forwarded the request to CSO */
			arrBlkLogRec.pendingStatus = '2';  /* 2 is for Pending with Teller */
		else
			arrBlkLogRec.pendingStatus = '3';  /* 3 is for Rejecting the entry */

		strncpy(arrBlkLogRec.supervisorId, receivedMsg.blockApproval.supervisorId,10);
		strncpy(arrBlkLogRec.supervisorComments, receivedMsg.blockApproval.supervisorComments, 200);
		strncpy(arrBlkLogRec.lastUpdateUser, receivedMsg.blockApproval.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(arrBlkLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( updateArrBlkLogFile() < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		closeAllFiles();
		formatBranchResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

	/* Portion introduced for atomic update */

	if ( arrBlkFileOpen == YES )
	{
		isclose(arrBlkFile); 
		arrBlkFileOpen=NO;
	}

	if ( arrBlkLogFileOpen == YES )
	{
		isclose(arrBlkLogFile); 
		arrBlkLogFileOpen=NO;
	}

	if ( gldFileOpen == YES )
	{
		isclose(gldFile); 
		gldFileOpen=NO;
	}

	if ( accBlkFileOpen == YES )
	{
		isclose(accBlkFile); 
		accBlkFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processBlockApproval]Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processBlockApproval] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processBlockApproval] ISBEGIN error %d;  while introducing new blocking \n", getDateTime(), PID, iserrno);
		sprintf(tmpStr, "ISBEGIN error %d while while new blocking", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openArrBlkFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openGldFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(arrBlkFile);
		arrBlkFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openArrBlkLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(arrBlkFile); isclose(gldFile);
		arrBlkFileOpen=gldFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAccBlkFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(arrBlkFile); isclose(gldFile); isclose(arrBlkLogFile);
		arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	responseMsg.customer.nullPad = '\0';

	memset(&arrBlkLogRec.liveChar, ' ', sizeof arrBlkLogRec);

	strncpy(arrBlkLogRec.branchCode, receivedMsg.cardApproval.homeBranch,4);
	strncpy(arrBlkLogRec.userId, receivedMsg.cardApproval.userId, 10);
	strncpy(arrBlkLogRec.dateTime, receivedMsg.cardApproval.dateTime,14);
	strncpy(arrBlkLogRec.cardNo, receivedMsg.cardApproval.cardNo,16);
	isindexinfo(arrBlkLogFile, &arrBlkLogKey, 1);
	if ( isstart(arrBlkLogFile, &arrBlkLogKey, 0, &arrBlkLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processBlockApproval]: ISSTART error %d on ccarrblk for the key [%.28s] & card number [%.16s]\n", getDateTime(), PID, iserrno, arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			 formatBranchResponse(END_OF_FILE,"No block Record(s) found for this key ....", "No block Record(s) found for this key ....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on ccblklog file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
		arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( readArrBlkLogFile(ISEQUAL+ISLOCK) < 0 )
	{
		isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
		arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( arrBlkLogRec.pendingStatus == '9' || arrBlkLogRec.pendingStatus == '3') /* Completed or Rejected */
	{
		fprintf(logFp, "%s|%5d|[processBlockApproval] This manual blocking record has already been approved by %.10s\n", getDateTime(), PID, arrBlkLogRec.supervisorId);
		fflush(logFp);
		sprintf(tmpStr," This Record has been already approved by %.10s", arrBlkLogRec.supervisorId);
		formatBranchResponse(INCORRECTMSG, tmpStr, tmpStr); 
		isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
		arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
		isrelease(arrBlkLogFile);
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	arrBlkLogRec.pendingStatus = '9'; /* Completed */

	strncpy(arrBlkLogRec.supervisorId, receivedMsg.blockApproval.supervisorId, 10);	
	/*strncpy(arrBlkLogRec.lastBlockUser, receivedMsg.blockApproval.supervisorId, 10);	*/
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(arrBlkLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( updateArrBlkLogFile() < 0)
	{
		isrollback();
		isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
		arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
		isrelease(arrBlkLogFile); 
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	isrelease(arrBlkLogFile); 

	if ( arrBlkLogRec.action == 'N' ) /* New blocking */
	{
		if ( introduceNewBlocking() < 0 )
		{
			isrollback();
			isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
			arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else if ( arrBlkLogRec.action == 'A' ) /* Amend blocking */
	{
		if ( amendBlocking() < 0 )
		{
			isrollback();
			isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
			arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else if ( arrBlkLogRec.action == 'D' ) /* Delete the manual blocking */
	{
		if ( deleteManualBlocking() < 0 )
		{
			isrollback();
			isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
			arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processBlockApproval]: ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatCardApprovalResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		sendResponse(responseMsg.cardApproval.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}

	if ( extraDebug )
	{
		fprintf(logFp, "After iscommit()...\n");
		fflush(logFp);
	}

	isclose(arrBlkFile); isclose(gldFile);isclose(arrBlkLogFile);isclose(accBlkFile);
	arrBlkFileOpen=gldFileOpen=arrBlkLogFileOpen=accBlkFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);

	if ( extraDebug )
	{
		fprintf(logFp, "Supervisor Approval action on manual blocking successful\n");
		fflush(logFp);
	}
	closeAllFiles();
	unlink(isLogPathName);
	free(isLogPathName);
	formatBranchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

introduceNewBlocking() 
{
	char tmpStr[100];
	char *isLogPathName;
	int isappLogFp, retErr;
	long oldSigMask;
	double blockAmt=0;

	if ( arrBlkLogRec.cardOrAcct == 'A' ) /* account blocking */
	{
		memset(&accBlkRec.liveChar, '0', sizeof accBlkRec);
		accBlkRec.liveChar = '@';
		strncpy(accBlkRec.bmAccNo, arrBlkLogRec.bmAccNo, 14);

		sprintf(tmpStr, "%.14s", arrBlkLogRec.blockedAmt);
		blockAmt = atof(tmpStr);
		sprintf(tmpStr, "%014.0f", blockAmt);
		strncpy(accBlkRec.blockedAmt , tmpStr, 14);

		strncpy(accBlkRec.blockedBmDate, bankingDate, 8);
		strncpy(accBlkRec.requestUserId, receivedMsg.blockApproval.userId, 10);
		strncpy(accBlkRec.requestBranch, receivedMsg.blockApproval.homeBranch, 4);
		strncpy(accBlkRec.lastBlockedUserId, receivedMsg.blockApproval.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(accBlkRec.lastBlockedDateTime, tmpStr, 14);
		if ( isWrite(accBlkFile, &accBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[introduceNewBlocking] ISWRITE error %d on staccblk for the BM AccNo [%.14s] while introducing manual blocked amount \n", getDateTime(), PID, iserrno , accBlkRec.bmAccNo);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.14s] on staccblk", accBlkRec.bmAccNo);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on staccblk"); 
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on staccblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}
	}
	else
	{
		memset(&arrBlkRec.liveChar, '0', sizeof arrBlkRec);
		arrBlkRec.liveChar = '@';
		strncpy(arrBlkRec.cardNo, arrBlkLogRec.cardNo, 16);
		strncpy(arrBlkRec.bmAccNo, arrBlkLogRec.bmAccNo, 14);
		strncpy(arrBlkRec.nameOnTheCard, arrBlkLogRec.nameOnTheCard, 26);
		arrBlkRec.cardInternalStatus = arrBlkLogRec.cardInternalStatus;
		arrBlkRec.cardExternalStatus = arrBlkLogRec.cardExternalStatus;
		arrBlkRec.autoManualFlag = 'M'; /* Manual */

		sprintf(tmpStr, "%.14s", arrBlkLogRec.blockedAmt);
		blockAmt = atof(tmpStr);
		sprintf(tmpStr, "%014.0f", blockAmt);
		strncpy(arrBlkRec.blockedAmt , tmpStr, 14);

		strncpy(arrBlkRec.requestBranch, receivedMsg.blockApproval.homeBranch, 4);
		strncpy(arrBlkRec.lastBlockedUserId, receivedMsg.blockApproval.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(arrBlkRec.lastBlockedDateTime, tmpStr, 14);
		if ( isWrite(arrBlkFile, &arrBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[introduceNewBlocking] ISWRITE error %d on ccarrblk for the card # [%.16s] with BM AccNo [%.14s] while introducing manual blocked amount \n", getDateTime(), PID, iserrno , arrBlkRec.cardNo, arrBlkRec.bmAccNo);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.16s] on ccarrblk", arrBlkRec.cardNo);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on ccarrblk"); 
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on ccarrblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}
	}

	if ( (retErr = updGlBlockedAmt(gldFile, arrBlkLogRec.bmAccNo, blockAmt)) < 0 )
	{
		return FAILURE;
	}
	return SUCCESS;
}

amendBlocking()
{
	char tmpStr[100];
	char *isLogPathName;
	int isappLogFp, retErr;
	long oldSigMask;
	double blockAmt=0, existingBlockAmt=0;

	sprintf(tmpStr, "%.14s", arrBlkLogRec.blockedAmt);
	blockAmt = atof(tmpStr);
	if ( arrBlkLogRec.cardOrAcct != 'A' )
	{
		memset(&arrBlkRec.liveChar, ' ', sizeof arrBlkRec);
		strncpy(arrBlkRec.cardNo, arrBlkLogRec.cardNo, 16);

		if ( isRead(arrBlkFile, &arrBlkRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[amendBlocking] : Incoming card number [%.16s] does not exists in ccarrblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, arrBlkRec.cardNo, iserrno);
			fflush(logFp);
			if ( iserrno == 111 || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid card number; Please check ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading ccarrblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}

		arrBlkRec.autoManualFlag = 'M'; /* Manual */

		sprintf(tmpStr, "%.14s", arrBlkRec.blockedAmt);
		existingBlockAmt = atof(tmpStr);
		/* Unblock the existing amount */
		if ( (retErr = updGlBlockedAmt(gldFile, arrBlkRec.bmAccNo, -existingBlockAmt)) < 0 )
		{
			return FAILURE;
		}

		sprintf(tmpStr, "%014.0f", blockAmt);
		strncpy(arrBlkRec.blockedAmt , tmpStr, 14);

		strncpy(arrBlkRec.requestBranch, receivedMsg.blockApproval.homeBranch, 4);
		strncpy(arrBlkRec.lastBlockedUserId, receivedMsg.blockApproval.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(arrBlkRec.lastBlockedDateTime, tmpStr, 14);
		if ( isRewcurr(arrBlkFile, &arrBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[amendBlocking] ISREWCURR error %d on ccarrblk for the card # [%.16s] with BM AccNo [%.14s] while modifying the  blocked amount \n", getDateTime(), PID, iserrno , arrBlkRec.cardNo, arrBlkRec.bmAccNo);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.16s] on ccarrblk", arrBlkRec.cardNo);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on ccarrblk");
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on ccarrblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}
	}
	else
	{
		memset(&accBlkRec.liveChar, ' ', sizeof accBlkRec);
		strncpy(accBlkRec.bmAccNo, arrBlkLogRec.bmAccNo, 14);

		if ( isRead(accBlkFile, &accBlkRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[amendBlocking] : Incoming account number [%.14s] does not exists in staccblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, accBlkRec.bmAccNo, iserrno);
			fflush(logFp);
			if ( iserrno == 111 || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid account number; Please check ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading staccblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}

		sprintf(tmpStr, "%.14s", accBlkRec.blockedAmt);
		existingBlockAmt = atof(tmpStr);
		/* Unblock the existing amount */
		if ( (retErr = updGlBlockedAmt(gldFile, accBlkRec.bmAccNo, -existingBlockAmt)) < 0 )
		{
			return FAILURE;
		}

		sprintf(tmpStr, "%014.0f", blockAmt);
		strncpy(accBlkRec.blockedAmt , tmpStr, 14);

		strncpy(accBlkRec.blockedBmDate, bankingDate, 8);
		strncpy(accBlkRec.requestUserId, receivedMsg.blockApproval.userId, 10);
		strncpy(accBlkRec.requestBranch, receivedMsg.blockApproval.homeBranch, 4);
		strncpy(accBlkRec.lastBlockedUserId, receivedMsg.blockApproval.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(accBlkRec.lastBlockedDateTime, tmpStr, 14);
		if ( isRewcurr(accBlkFile, &accBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[amendBlocking] ISREWCURR error %d on staccblk for the BM AccNo [%.14s] while modifying the  blocked amount \n", getDateTime(), PID, iserrno , accBlkRec.bmAccNo);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.16s] on staccblk", accBlkRec.bmAccNo);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on staccblk");
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on staccblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}
	}
	/* block the new amount */
	if ( (retErr = updGlBlockedAmt(gldFile, arrBlkLogRec.bmAccNo, blockAmt)) < 0 )
	{
		return FAILURE;
	}
	return SUCCESS;
}

deleteManualBlocking()
{
	char tmpStr[100];
	char *isLogPathName;
	int isappLogFp, retErr;
	long oldSigMask;
	double blockAmt=0, existingBlockAmt=0;

	if ( arrBlkLogRec.cardOrAcct != 'A' )
	{
		memset(&arrBlkRec.liveChar, ' ', sizeof arrBlkRec);
		strncpy(arrBlkRec.cardNo, arrBlkLogRec.cardNo, 16);

		if ( isRead(arrBlkFile, &arrBlkRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[deleteManualBlocking] : Incoming card number [%.16s] does not exists in ccarrblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, arrBlkRec.cardNo, iserrno);
			fflush(logFp);
			if ( iserrno == 111 || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid card number; Please check ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading ccarrblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}

		sprintf(tmpStr, "%.14s", arrBlkRec.blockedAmt);
		existingBlockAmt = atof(tmpStr);

		if ( isDelcurr(arrBlkFile, &arrBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[deleteManualBlocking] ISDELCURR error %d on ccarrblk for the card # [%.16s] with BM AccNo [%.14s] while deleting manual blocked amount \n", getDateTime(), PID, iserrno , arrBlkRec.cardNo, arrBlkRec.bmAccNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while deleting from arrear blocking file", iserrno); 
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	else
	{
		memset(&accBlkRec.liveChar, ' ', sizeof accBlkRec);
		strncpy(accBlkRec.bmAccNo, arrBlkLogRec.bmAccNo, 14);

		if ( isRead(accBlkFile, &accBlkRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[amendBlocking] : Incoming account number [%.14s] does not exists in staccblk; iserrno [%d] ; so, manual blocking is rejected  \n", getDateTime(), PID, accBlkRec.bmAccNo, iserrno);
			fflush(logFp);
			if ( iserrno == 111 || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid account number; Please check ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading staccblk", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			return FAILURE;
		}

		sprintf(tmpStr, "%.14s", accBlkRec.blockedAmt);
		existingBlockAmt = atof(tmpStr);

		if ( isDelcurr(accBlkFile, &accBlkRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[deleteManualBlocking] ISDELCURR error %d on staccblk for the BM AccNo [%.14s] while deleting the  manual blocked amount \n", getDateTime(), PID, iserrno , accBlkRec.bmAccNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while deleting from staccblk", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}

	/* Unblock the existing amount */
	if ( (retErr = updGlBlockedAmt(gldFile, arrBlkLogRec.bmAccNo, -existingBlockAmt)) < 0 )
	{
		return FAILURE;
	}
	return SUCCESS;
}

updGlBlockedAmt(int glFileId, char *accNo, double blockAmt)
{
	char tmpStr[100];
	double tmpAmt=0, existingGlBlockAmt=0;

	if ( blockAmt == 0 )
		return 0;

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(gldRec.accNo, actualToBmAcc(accNo, tmpStr), 13);

	if ( isRead(glFileId, &gldRec.liveChar, ISEQUAL+ISLOCK) < 0 )
	{
		fprintf(logFp, "%s|%5d|[updGlBlockedAmt]: ISREAD/ISEQUAL error %d on gld0data for the account number [%.14s:%.13s]\n", getDateTime(), PID, iserrno, accNo, gldRec.accNo);
		fflush(logFp);

		sprintf(tmpStr, "Error %d while reading a/c in bankmaster", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( gldRec.passwd == '2' || gldRec.passwd == '3' )
	{
		fprintf(logFp, "%s|%5d|[updGlBlockedAmt]: Account number [%.14s:%.13s] is closed (%c) and hence will not be blocked \n", getDateTime(), PID, accNo, gldRec.accNo, gldRec.passwd);
		fflush(logFp);
		isrelease(glFileId);

		sprintf(tmpStr, "Account  is closed in Bankmaster..... ");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	existingGlBlockAmt = bmAmtToDbl(gldRec.blockedAmt, 14);

	tmpAmt = existingGlBlockAmt + blockAmt ;

	if ( tmpAmt < 0 )
		tmpAmt = 0;

	strncpy(gldRec.blockedAmt, dblToBmAmt(tmpAmt, 14), 14);

	if ( isRewcurr(glFileId, &gldRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[updGlBlockedAmt] ISREWCURR error %d on gld0data for the account number [%.14s:%.13s]\n", getDateTime(), PID, iserrno, accNo, gldRec.accNo);
		fflush(logFp);
		isrelease(glFileId);
		sprintf(tmpStr, "Error %d while blocking the amount in Bankmaster...");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	fprintf(logFp, "%s|%5d|[updGlBlockedAmt] Account # [%.14s] is updated with : Existing Block amount [%.2f] ; Amount adjusted now [%.2f] ; the new GL block amount [%.2f]\n", getDateTime(), PID, accNo, existingGlBlockAmt/100, blockAmt/100, tmpAmt/100);
	fflush(logFp);

	if ( arrBlkLogRec.cardOrAcct == 'A' ) /* Manual Account Blocking */
		writeO3dRec(accNo, "ACCMANUALBLK         "); 
	else
		writeO3dRec(accNo, "CCMANUALBLK         "); 
	isrelease(glFileId);
	return SUCCESS;
}

writeO3dRec( char *accNo, char *refNo ) 
{
	char bmAccNo[20];

	actualToBmAcc(accNo, bmAccNo);
	memset (&o3dRec.liveChar, ' ', sizeof o3dRec);
	o3dRec.liveChar = '@';
	memcpy (o3dRec.recType, "01", 2);     /* 01 for Daily Txn */
	memset (o3dRec.batchNumber, '0',7);
	o3dRec.continueFlag =  'L';
	strncpy (o3dRec.accNo, bmAccNo, 13);
	strncpy (o3dRec.reference, refNo, 10);
	memset (o3dRec.oldBal, '0', 14);
	strncpy (o3dRec.transType, "U0", 2); /* update PBF */
	memset (o3dRec.transAmt, '0', 14);
	/* may not be required....
	memset (o3dRec.newBal, '0', 14);
	memset (o3dRec.valueDate, '0', 6);
	memset (o3dRec.exceptionCode, '0', 2);
	memset (o3dRec.interestRate, '0', 9);
	memset (o3dRec.maturityDate, '0', 6);
	memset (o3dRec.brokerNumber, '0', 6);
	memset (o3dRec.atmReqTime,     '0' ,6 );
	memset (o3dRec.atmCardNo,      '0' ,13);
	o3dRec.atmCardSeq = '0';
	memset (o3dRec.atmTranCode,    '0' ,3 );
	o3dRec.atmTranType = '0';
	o3dRec.atmAcctType = '0';
	o3dRec.atmStatType = '0';
	memset(o3dRec.atmBatch,        '0' ,7 );
	o3dRec.atmPostFlag = '0';
	o3dRec.atmRevFlag 	= '0';
	memset (o3dRec.atmAcctAmt,     '0' ,8 );
	memset (o3dRec.atmDispensed,    '0' ,8 );
	o3dRec.contraAcctType = '0';
	memset (o3dRec.countryCode,     '0' ,3 );
	memset (o3dRec.imdNumber,       '0' ,6 );
	memset (o3dRec.branchCode,      '0' ,4 );
	memset (o3dRec.commission,       '0' ,7 );
	memset (o3dRec.currDispensed,   '0' ,2 );
	memset (o3dRec.atmLocalCurr,   '0' ,2 );
	memset (o3dRec.oldMaturityDate, '0', 6);
	memset (o3dRec.oldInterestRate, '0', 9);
	o3dRec.confirmationFlag = '0';
	memset (o3dRec.lastStartDate,   '0', 6);
	memset (o3dRec.interestAmt,   '0', 14);
	memset (o3dRec.t_6filler2, ' ', 2);
	memset (o3dRec.accountLimit, '0', 12);
	memset (o3dRec.t_7filler2, ' ', 2);
	memset (o3dRec.serviceFee, '0', 14);
	memset (o3dRec.confirmationCode, '0', 2);
	memset (o3dRec.contraAccount, '0', 20); /* card_no+member_no
	strncpy (o3dRec.contraType, "00", 2);
	o3dRec.intApplFlag = '0';
	memset (o3dRec.dateTelex, '0', 6);
	memset (o3dRec.tellerId, '0', 3);
	memset (o3dRec.baseEquivalent, '0', 14);
	memset (o3dRec.couponDiscountRate, '0', 9);
	memset (o3dRec.supervisorId, '0', 3);
	memset (o3dRec.witholdingAmt, '0', 14);
	o3dRec.multiCurrencyInd =  '0';
	memset (o3dRec.verifierId, '0', 3);
	memset (o3dRec.exchangeRate, '0', 12);
	memset (o3dRec.nominalValue, '0', 14);
	memset (o3dRec.sortCode, '0', 10);
	memset (o3dRec.dealNumber, '0', 5);
	o3dRec.passBookPrinted =  '0';
	memset (o3dRec.timeStamp, '0', 6);
	memset (o3dRec.issueDate, '0', 6);
	*/
	o3dRec.sourceFlag =  'M'; 	/* [R]efresh,[O]n2update,[P]rod, [H]atifBank, [C]carrblk [M]anual cc block */
	o3dRec.intRecalcFlag = '0';
	memset (o3dRec.destAccount, '0', 13);
	if ( isWrite(o3dFile, &o3dRec.liveChar) < 0 )
	{
		fprintf(logFp,"%s|%5d|[writeO3dRec] Error %d while ISWRITE into o3d0data for mainAcc=%.14s \n", getDateTime(), PID, iserrno,  accNo);
		fflush(logFp);
		return FAILURE;
	}
	return SUCCESS;
}

readArrBlkLogFile(mode)
int mode;
{
	char tmpStr[50];

	fprintf(logFp, "%s|%5d|[readArrBlkLogFile] for key value [%.28s] [%.19s]\n", getDateTime(), PID, arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
	fflush(logFp);
	if ( isRead(arrBlkLogFile, &arrBlkLogRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readArrBlkLogFile] ISREAD/%s error %d on stcardlog for the key=%.28s and the card number is [%.19s]\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found in ccblklog with this key ");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached in ccblklog ");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on ccblklog");
			formatBranchResponse(RECORD_LOCKED,  tmpStr, tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on ccblklog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

updateArrBlkLogFile()
{
	char tmpStr[120];

	if ( isRewcurr(arrBlkLogFile, &arrBlkLogRec.liveChar) < 0 ) 
	{
		fprintf(logFp, "%s|%5d|[updateArrBlkLogFile] : ISREWCURR error %d on stcardlog for key=[%.28s] [%.19s]\n", getDateTime(), PID, iserrno, arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.28s] [%.16s] on ccbllklog", arrBlkLogRec.branchCode, arrBlkLogRec.cardNo);
			formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on ccblklog");
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on ccblklog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(arrBlkLogFile);
		return FAILURE;
	}
	/* send resonse will be taken care of calling function */
	isrelease(arrBlkLogFile);
	return SUCCESS;
}

openAadFile(int mode)
{
	char tmpStr[100];
	if ( aadFileOpen == YES )
		return SUCCESS;

	if ( (aadFile  = isopen(aadFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openAadFile] : ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, aadFilePath);
		sprintf(tmpStr,"Error  %d occured while opening aad0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(aadFile, &aadKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openAadFile] : aad0data file [%d] successfully opened...\n", getDateTime(), PID, aadFile);
		fflush(logFp);
	}

	aadFileOpen = YES;
	return SUCCESS;
}

openBkdFile(int mode)
{
	char tmpStr[100];
	if ( bkdFileOpen == YES )
		return SUCCESS;

	if ( (bkdFile  = isopen(bkdFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openBkdFile] : ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, bkdFilePath);
		sprintf(tmpStr,"Error  %d occured while opening bkd0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(bkdFile, &bkdKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openBkdFile] : bkd0data file [%d] successfully opened...\n", getDateTime(), PID, bkdFile);
		fflush(logFp);
	}

	bkdFileOpen = YES;
	return SUCCESS;
}

openArrBlkFile(int mode)
{
	char tmpStr[100];
	if ( arrBlkFileOpen == YES )
		return SUCCESS;

	if ( (arrBlkFile  = isopen(arrBlkFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openArrBlkFile] : ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, arrBlkFilePath);
		sprintf(tmpStr,"Error  %d occured while opening ccarrblk.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(arrBlkFile, &arrBlkKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openArrBlkFile] : ccarrblk file [%d] successfully opened...\n", getDateTime(), PID, arrBlkFile);
		fflush(logFp);
	}

	arrBlkFileOpen = YES;
	return SUCCESS;
}

openAccBlkFile(int mode)
{
	char tmpStr[100];
	if ( accBlkFileOpen == YES )
		return SUCCESS;

	if ( (accBlkFile  = isopen(accBlkFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openAccBlkFile] : ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, accBlkFilePath);
		sprintf(tmpStr,"Error  %d occured while opening staccblk.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(accBlkFile, &accBlkKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openAccBlkFile] : staccblk file [%d] successfully opened...\n", getDateTime(), PID, accBlkFile);
		fflush(logFp);
	}

	accBlkFileOpen = YES;
	return SUCCESS;
}

openArrBlkLogFile(int mode)
{
	char tmpStr[100];

	if ( arrBlkLogFileOpen == YES )
		return SUCCESS;

	if ( (arrBlkLogFile  = isopen(arrBlkLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openArrBlkLogFile]:ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, arrBlkLogFilePath);
		fflush(logFp);
		sprintf(tmpStr,"Error  %d occured while opening ccblklog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(arrBlkLogFile, &arrBlkLogKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openArrBlkLogFile] : ccblklog file [%d] successfully opened...\n",getDateTime(),PID, arrBlkLogFile);
		fflush(logFp);
	}

	arrBlkLogFileOpen = YES;
	return SUCCESS;
}

openDzdFile(int mode)
{
	char tmpStr[100];

	if ( dzdFileOpen == YES )
		return SUCCESS;

	if ( (dzdFile= isopen(dzdFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openDzdFile]:ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, dzdFilePath);
		fflush(logFp);
		sprintf(tmpStr,"Error  %d occured while opening dzd0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(dzdFile, &dzdKey, 2);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d|[openDzdFile] : dzd0data file [%d] successfully opened...\n",getDateTime(),PID, dzdFile);
		fflush(logFp);
	}

	dzdFileOpen = YES;
	return SUCCESS;
}


formatBlockPendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatBlockPendingListResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.blockPendingList.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.blockPendingList.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.blockPendingList.eRemarks,tmpStr,50);
	strncpy(responseMsg.blockPendingList.service, receivedMsg.blockPendingList.service, 2);
	responseMsg.blockPendingList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.blockPendingList.msgLen));
	strncpy(responseMsg.blockPendingList.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatBlockBreakupResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatBlockBreakupResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.blockBreakup.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.blockBreakup.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.blockBreakup.eRemarks,tmpStr,50);
	strncpy(responseMsg.blockBreakup.service, receivedMsg.blockBreakup.service, 2);
	responseMsg.blockBreakup.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.blockBreakup.msgLen));
	strncpy(responseMsg.blockBreakup.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logBlockAmtBreakupDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Block Amount breakup Details]\n", receivedMsg.blockBreakup.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.blockBreakup.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.blockBreakup.userId);
	fprintf(logFp, "Account number  : %.14s\n", receivedMsg.blockBreakup.accNo);
	fflush(logFp);
}

logAccountUpdateHistory()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Account Update History]\n", receivedMsg.acctHistory.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.acctHistory.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.acctHistory.userId);
	fprintf(logFp, "Last Rec Count	: %.5s\n", receivedMsg.acctHistory.lastRecCount);
	fprintf(logFp, "Account No 		: %.14s\n", receivedMsg.acctHistory.accNo);
	fflush(logFp);
}

logManualBlockingDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Manual Blocking Maintenance]\n", receivedMsg.manualBlocking.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.manualBlocking.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.manualBlocking.userId);
	fprintf(logFp, "Action          : %c\n", receivedMsg.manualBlocking.action);
	fprintf(logFp, "Card number     : %.16s\n", receivedMsg.manualBlocking.cardNo);
	fprintf(logFp, "Account No      : %.14s\n", receivedMsg.manualBlocking.accNo);
	fprintf(logFp, "Old Amount      : %.14s\n", receivedMsg.manualBlocking.oldAmt);
	fprintf(logFp, "Block Amount    : %.14s\n", receivedMsg.manualBlocking.blockAmt);
	fprintf(logFp, "Card or Account : %c\n", receivedMsg.manualBlocking.cardOrAcct);
	fflush(logFp);
}

logManualBlockingPendingList()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Manual blocking Pending List]\n", receivedMsg.blockPendingList.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.blockPendingList.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.blockPendingList.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.blockPendingList.lastRecCount);
	fprintf(logFp, "Activity Flag   : %c\n", receivedMsg.blockPendingList.activityFlag);
	fprintf(logFp, "Card or Account : %c\n", receivedMsg.blockPendingList.cardOrAcct);
	fflush(logFp);
}

logBlockingApprovalDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Manual blocking Approval]\n", receivedMsg.blockApproval.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.blockApproval.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.blockApproval.userId);
	fprintf(logFp, "Date & Time         : %.14s\n", receivedMsg.blockApproval.dateTime);
	fprintf(logFp, "Approve/Reject flag : %c\n", receivedMsg.blockApproval.appRejectFlag);
	fprintf(logFp, "Supervisor Id       : %.10s\n", receivedMsg.blockApproval.supervisorId);
	fprintf(logFp, "Supervisor Comments	: %.200s\n", receivedMsg.blockApproval.supervisorComments);
	fprintf(logFp, "Card No             : %.16s\n", receivedMsg.blockApproval.cardNo);
	fflush(logFp);
}

logDiaryEnquiryDetails()
{

}
