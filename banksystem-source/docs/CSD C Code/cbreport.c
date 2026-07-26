/*
	Objective       :       Static data management server 
				            (included for Online reporting for ATM Card/ATM Pin/TPin )

	Date            :       25/03/2007.

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
#include "../cbslib/cblayout.h"
#include "../cbslib/layout.h"
#include "cbserver.h"
#include "cbrouter.h"

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

#define MANDATE_ACTION			'M'
#define CALL_CENTRE_ACTION		'C'
#define BRANCH_ACTION     		'B'
#define BRANCH_ACTION_CUST 		'P'
#define SPECIFIC_CUST_ENQ		'S'

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, tdLogKey, sadadCtlKey, sadadCtlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, letterKey, retMailKey, ctlKey, tdLogKey, acctLogKey, ankKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,tdLogFile, sadadCtlFile, sadadCtlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, acctLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, letterFile, retMailFile,ctlFile, tdLogFile, ankFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *tdLogFilePath, *sadadCtlFilePath, *sadadCtlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *retMailFilePath, *tdLogFilePath, *acctLogFilePath, *ankFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30], sadadMaxBills[5], sadadAccessChannel[30];
extern char postingUserId[10], tdPostingUserId[10], postingTransType[5];

extern FILE *logFp, *errLogFp;

struct crd0data					crdRec;
struct gld0data					gldRec;
struct cardInfo					cardTabRec;
struct branchActivityOnCard		cardLogRec; 

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, tdLogFileOpen,staticFileOpen, sadadCtlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, retMailFileOpen, tdLogFileOpen, ankFileOpen;

int stOnlineReporting(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stOnlineReporting]\n", getDateTime(), PID);
		fflush(logFp);
	}

	systime = time(NULL);                  /* get the system time */
	systemDate = localtime( &systime );
	readBankingDate();

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

	if ( strncmp(&headerBuf[6], "AL", 2) == 0 ) /* Online report for ATM card activity */
	{
		logCardActivityReportDetails();

		if ( receivedMsg.cardActivityReport.reportType == 'C' )
		{
			if ( openCardLogFile(ISMANULOCK + ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openCardTabFile(ISMANULOCK + ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( processCardActivityReport() == FAILURE )
				return FAILURE;
		}
		else if ( receivedMsg.cardActivityReport.reportType == 'P' )
		{
			if ( openCardLogFile(ISMANULOCK + ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openCardTabFile(ISMANULOCK + ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( processPinActivityReport() == FAILURE )
				return FAILURE;
		}
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

processCardActivityReport() 
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0; 
	char tmpStr[100], requiredDate[10], letterTypeDesc[50], currentDate[20];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processCardActivityReport]\n", getDateTime(), PID);

	memset(responseMsg.cardActivityReport.msgLen, ' ', sizeof responseMsg.cardActivityReport);
	responseMsg.cardActivityReport.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.cardActivityReport.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(responseMsg.cardActivityReport.msgLen, ' ', sizeof responseMsg.cardActivityReport);

	memset(&cardLogRec.liveChar, ' ', sizeof cardLogRec);

	isindexinfo(cardLogFile, &cardLogKey, 3); /* on date&Time */
	strncpy(cardLogRec.dateTime, receivedMsg.cardActivityReport.reportDate, 8);
	isstart(cardLogFile, &cardLogKey, 8, &cardLogRec.liveChar, ISGTEQ);

	while ( isRead(cardLogFile, &cardLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cardLogRec.dateTime, receivedMsg.cardActivityReport.reportDate, 8) )
			break;

		if ( cardLogRec.bmUpdateStatus != '1' && cardLogRec.bmUpdateStatus != '2' && 
			 cardLogRec.bmUpdateStatus != '9' )
			 continue;

		if ( cardLogRec.requestType == '1' ) /* Ignore RENEWAL */
			continue;

		if ( strncmp(cardLogRec.branchCode, receivedMsg.cardActivityReport.homeBranch, 4) )
			continue;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].requestStatus = cardLogRec.requestStatus;
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].coreAccNo, cardLogRec.coreAccNo, 16);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].cardNo, cardLogRec.cardNo, 19);
		sprintf(tmpStr, "%-8.8s", cardLogRec.firstIssueDate);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].issueDate, tmpStr, 8);
		sprintf(tmpStr, "%-8.8s", cardLogRec.expireDate);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].expireDate, tmpStr, 8);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].requestBranch, cardLogRec.customerBranch, 4);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].requestUser, cardLogRec.userId, 10);
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].nameOnProduct, cardLogRec.nameOnTheCard, 26);
		responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].requestType = cardLogRec.requestType;
		responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].deliveryToBranchOrPO = cardLogRec.deliveryToBranchOrPO;
		if ( cardLogRec.deliveryToBranchOrPO != 'R' && cardLogRec.deliveryToBranchOrPO != 'C' && cardLogRec.deliveryToBranchOrPO != 'P'  && cardLogRec.deliveryToBranchOrPO != 'G' )
			responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].deliveryToBranchOrPO = 'C';
		responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].pendingStatus = cardLogRec.bmUpdateStatus;
		strncpy(responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg].supervisorId, cardLogRec.supervisorId, 10);

		if ( ++recsInThisMsg >=  50 )
			break;
	}
	strncpy(responseMsg.cardActivityReport.reportDate, receivedMsg.cardActivityReport.reportDate, 8);
	responseMsg.cardActivityReport.reportType=receivedMsg.cardActivityReport.reportType;
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.cardActivityReport.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.cardActivityReport.noOfRecs, tmpStr, 2);
	responseMsg.cardActivityReport.reportDetail.cardDetails[recsInThisMsg+1].coreAccNo[0] = '\0';
	formatCardActivityReportResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.cardActivityReport.msgLen);
	return SUCCESS;
}

processPinActivityReport()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0; 
	char tmpStr[100], requiredDate[10], letterTypeDesc[50], currentDate[20];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processPinActivityReport]\n", getDateTime(), PID);

	memset(responseMsg.cardActivityReport.msgLen, ' ', sizeof responseMsg.cardActivityReport);
	responseMsg.cardActivityReport.nullPad = '\0';

	getDateTime();
	sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);

	sprintf(tmpStr, "%.5s", receivedMsg.cardActivityReport.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(responseMsg.cardActivityReport.msgLen, ' ', sizeof responseMsg.cardActivityReport);

	memset(&cardLogRec.liveChar, ' ', sizeof cardLogRec);

	readBankingDate();

	isindexinfo(cardLogFile, &cardLogKey, 3); /* on date&Time */
	strncpy(cardLogRec.dateTime, receivedMsg.cardActivityReport.reportDate, 8);
	isstart(cardLogFile, &cardLogKey, 8, &cardLogRec.liveChar, ISGTEQ);

	while ( isRead(cardLogFile, &cardLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cardLogRec.dateTime, receivedMsg.cardActivityReport.reportDate, 8) )
			break;

		if ( cardLogRec.bmUpdateStatus != '1' && cardLogRec.bmUpdateStatus != '2' && 
			 cardLogRec.bmUpdateStatus != '9' )
			continue;

		if ( cardLogRec.requestType != '0' && cardLogRec.requestType != '3' ) /* Consider only Initial & forcePin request */
			continue;

		if ( cardLogRec.branchPinSelect != 'Y' )
			continue;

		if ( strncmp(cardLogRec.branchCode, receivedMsg.cardActivityReport.homeBranch, 4) )
			continue;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].requestStatus = cardLogRec.requestStatus;
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].coreAccNo, cardLogRec.coreAccNo, 16);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].cardNo, cardLogRec.cardNo, 19);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].issueDate, cardLogRec.firstIssueDate, 8);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].expireDate, cardLogRec.expireDate, 8);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].customerBranch, cardLogRec.customerBranch, 4);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].requestUser, cardLogRec.userId, 10);
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].nameOnProduct, cardLogRec.nameOnTheCard, 26);
		responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].requestType = cardLogRec.requestType;
		responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].deliveryToBranchOrPO = cardLogRec.deliveryToBranchOrPO;
		responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].pendingStatus = cardLogRec.bmUpdateStatus;
		strncpy(responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg].supervisorId, cardLogRec.supervisorId, 10);

		if ( ++recsInThisMsg >=  50 )
			break;
	}
	strncpy(responseMsg.cardActivityReport.reportDate, receivedMsg.cardActivityReport.reportDate, 8);
	responseMsg.cardActivityReport.reportType=receivedMsg.cardActivityReport.reportType;
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.cardActivityReport.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.cardActivityReport.noOfRecs, tmpStr, 2);
	responseMsg.cardActivityReport.reportDetail.pinDetails[recsInThisMsg+1].coreAccNo[0] = '\0';
	formatCardActivityReportResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.cardActivityReport.msgLen);
	return SUCCESS;
}

formatCardActivityReportResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatCardActivityReportResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.cardActivityReport.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.cardActivityReport.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.cardActivityReport.eRemarks,tmpStr,50);
	strncpy(responseMsg.cardActivityReport.service, receivedMsg.cardActivityReport.service, 2);
	responseMsg.cardActivityReport.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.cardActivityReport.msgLen));
	strncpy(responseMsg.cardActivityReport.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logCardActivityReportDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[ATM Card Activity Reporte]\n", receivedMsg.cardActivityReport.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.cardActivityReport.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.cardActivityReport.userId);
	fprintf(logFp, "Last record count   : %.5s\n", receivedMsg.cardActivityReport.lastRecCount);
	fprintf(logFp, "Report Date         : %.8s\n", receivedMsg.cardActivityReport.reportDate);
	fprintf(logFp, "Report Type         : %c\n", receivedMsg.cardActivityReport.reportType);
	fflush(logFp);
	return 0;
}
