/*
	Objective       :       Static data management server 
				            (included for Time Deposit Opening)

	Date            :       17/01/2007.

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
#include "bmint.h"

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

struct crd0data		crdRec;
struct gld0data		gldRec, gldRec1;
struct branchActivityOnAccounts 	acctLogRec;
struct cnd0dataXC	cndRecXC; 
struct cnd0dataSP	cndRecSP; 
struct ank0dataM1	ankRecM1;
struct addressInfo	addrTabRec;
struct customerInfo	custTabRec;
struct sttdlog		tdLogRec;
struct ctlInfo		tdNarrRec;
struct bmLedgers	bmMemoRec;

/* Tuxedo request & response messages */

struct timeDepositIntRateEnqRequest 	tdIntRateEnqReqMsg;
struct timeDepositIntRateEnqResponse 	tdIntRateEnqResponseMsg;

struct exchangeRateEnqRequest 			exchangeRateEnqReqMsg;
struct exchangeRateEnqResponse 			exchangeRateEnqResponseMsg;

struct timeDepositOpenRequest1 			tdOpenReqMsg;
struct timeDepositOpenResponse1			tdOpenResponseMsg;

struct timeDepositRenewRequest			tdRenewReqMsg;
struct timeDepositRenewResponse 		tdRenewResponseMsg;

struct timeDepositEnqRequest 			timeDepositEnqReqMsg;
struct timeDepositEnqResponse 			timeDepositEnqResponseMsg;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, tdLogFileOpen,staticFileOpen, sadadCtlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, retMailFileOpen, tdLogFileOpen, ankFileOpen, cndFileOpen;

int stTimeDepositOpening(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stTimeDepositOpening]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "AG", 2) == 0 ) /* Time Deposit Interest rate enquiry */
	{
		logTdIntRateEnqDetails();

		if ( openGldFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCndFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAnkFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTdIntRateEnq() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AH", 2) == 0 ) /*  Time deposit request */
	{
		logTimeDepositRequestDetails();

		if ( openTdLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCndFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openGldFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTimeDepositRequest() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AI",2) == 0 ) /*Time Deposit Pending List */
	{
		logTimeDepositPendingListDetails();

		if ( openTdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readTimeDepositPendingList() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AJ",2) == 0 ) /* Time Deposit Detail Request (current & history) */
	{
		logTimeDepositDetailRequest();
		if ( openCustTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			fprintf(logFp, "%s|%5d|[stTimeDepositOpening()] Open Error on stcusttab ignored as it is just for taking customer name ..\n", getDateTime(), PID);
			fflush(logFp);
		}

		if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
		{
			fprintf(logFp, "%s|%5d|[stTimeDepositOpening()] Open Error on crd0data ignored as it is just for taking customer name ..\n", getDateTime(),PID);
			fflush(logFp);
		}

		if ( openGldFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCndFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openTdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( strncmp(receivedMsg.timeDepositDetail.requestType, "02",2) == 0 ) /* get detail from existing TD */
		{
			if ( getTimeDepositDetails() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.timeDepositDetail.requestType, "01",2) == 0 ) /* get TD detail from history log */
		{
			if ( getTimeDepositDetailFromLog() == FAILURE )
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6], "AK", 2) == 0 ) /*  Time Deposit Approval request */
	{
		logTimeDepositApprovalDetails();

		if ( openTdLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

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

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTimeDepositApproval() == FAILURE )
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

processTdIntRateEnq() 
{
	char tmpStr[100];
	char maturityDate[10], crossCurrency[10], maxBackValueDate[10];
	int depositPeriod=0, daysBetween=0, fdValueDateTolerance=0;
	int maturityMonth=0, maturityYear=0;
	int depositTenor=0;
	int dateErr=0;
	double tmpDbl=0;
	char monthDays[15][4] = {"31", "29", "31", "30", "31", "30", "31", "31", "30", "31", "30", "31"};

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(gldRec.accNo, actualToBmAcc(receivedMsg.timeDepositIntRateEnq.debitAccNo, tmpStr), 13);
	isindexinfo(gldFile, &gldKey, 1);
	isstart(gldFile, &gldKey, 0, &gldRec.liveChar, ISGTEQ);

	if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] :ISREAD/ISEQUAL error %d occured while reading gld0data for the debit account no [%.14s]  [%.13s] \n", getDateTime(), PID, iserrno, receivedMsg.timeDepositIntRateEnq.debitAccNo, gldRec.accNo);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid Debit Account No %.14s", receivedMsg.timeDepositIntRateEnq.debitAccNo);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading gld0data for %.14s", iserrno, receivedMsg.timeDepositIntRateEnq.debitAccNo);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&gldRec1.liveChar, ' ', sizeof gldRec1);
	strncpy(gldRec1.accNo, actualToBmAcc(receivedMsg.timeDepositIntRateEnq.payAccNo, tmpStr), 13);

	if ( isRead(gldFile, &gldRec1.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] :ISREAD/ISEQUAL error %d occured while reading gld0data for the payee account no [%.14s]  [%.13s] \n", getDateTime(), PID, iserrno, receivedMsg.timeDepositIntRateEnq.payAccNo, gldRec1.accNo);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid Payee Account No %.14s", receivedMsg.timeDepositIntRateEnq.payAccNo);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading gld0data for %.14s", iserrno, receivedMsg.timeDepositIntRateEnq.payAccNo);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( gldRec1.passwd == '2' || gldRec1.passwd == '3')
	{
		fprintf(logFp, "%s|%5d| [ProcessTdIntRateEnq] Payee account [%.14s] is closed\n", getDateTime(), PID, receivedMsg.timeDepositIntRateEnq.payAccNo);
		fflush(logFp);
		sprintf(tmpStr, "Payee Account is closed                           ");
		formatBranchResponse(ACCOUNT_CLOSED, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( gldRec1.passwd == '6' || gldRec1.passwd == '7' )
	{
		fprintf(logFp, "%s|%5d| [ProcessTdIntRateEnq] Payee account [%.14s] is restricted for credit\n", getDateTime(), PID, receivedMsg.timeDepositIntRateEnq.payAccNo);
		fflush(logFp);
		sprintf(tmpStr, "Credit not allowed in payee Account               ");
		formatBranchResponse(ACCOUNT_RESTRICTED, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* get the payee account customer number to display the payee customer name - required while payee customer is different than deposit customer */

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(&receivedMsg.timeDepositIntRateEnq.payAccNo[5], tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] ISREAD/ISEQUAL error %d occured while reading crd0data for the payee customer # [%.7s] [%.6s] while getting customer name ; IGNORED  \n", getDateTime(), PID, iserrno, &receivedMsg.timeDepositIntRateEnq.payAccNo[5], crdRec.accNo);
		fflush(logFp);
		strncpy(crdRec.shortName, "Could not read name from CRD", 30);
	}

	memset(&ankRecM1.liveChar, ' ', sizeof ankRecM1);
	strncpy(ankRecM1.recType, "M1", 2);
	strncpy(ankRecM1.ledgerCode, receivedMsg.timeDepositIntRateEnq.tdLedger, 3);
	if ( isRead(ankFile, &ankRecM1.liveChar, ISEQUAL) < 0 ) //if rec not found
	{
		fprintf(logFp, "%s|%5d| [processTdIntRateEnq] ISREAD/ISEQUAL error %d on ank0data for Key %.5s\n", getDateTime(), PID, iserrno, ankRecM1.recType);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid Time deposit ledger %.3s", receivedMsg.timeDepositIntRateEnq.tdLedger);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading ank0data for M1%.3s", iserrno, receivedMsg.timeDepositIntRateEnq.tdLedger);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	else
	{
		 if ( ankRecM1.timeDepositFlag != '1' ) //Not time deposit
		 {
		    fprintf(logFp, "%s|%5d| [processTdIntRateEnq]  This ledger [%.3s] has not been configured as time Deposit in ank0data (TimeDepositFlag [%c])\n", getDateTime(), PID, receivedMsg.timeDepositIntRateEnq.tdLedger, ankRecM1.timeDepositFlag);
		    fflush(logFp);
			sprintf(tmpStr, "Ledger %.3s is not configured as Time Deposit           ", receivedMsg.timeDepositIntRateEnq.tdLedger);
			formatBranchResponse(INVALID_TDMEMO, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		 }
	}

	init_date();

	/* Get the Funding rate using Tuxedo service */

	memset(responseMsg.timeDepositIntRateEnq.msgLen, ' ', sizeof responseMsg.timeDepositIntRateEnq);
	strncpy(responseMsg.timeDepositIntRateEnq.valueDate, receivedMsg.timeDepositIntRateEnq.valueDate, 8);
	strncpy(responseMsg.timeDepositIntRateEnq.payAccCustName, crdRec.shortName, 30);
	responseMsg.timeDepositIntRateEnq.nullPad = '\0';

	memset(tdIntRateEnqReqMsg.msgLen, ' ', sizeof tdIntRateEnqReqMsg);
	memset(tdIntRateEnqResponseMsg.msgLen, ' ', sizeof tdIntRateEnqResponseMsg);

	strncpy(tdIntRateEnqReqMsg.branchName, "StaticData  ", 10);
	strncpy(tdIntRateEnqReqMsg.source, "CS", 2);
	strncpy(tdIntRateEnqReqMsg.service, "23", 2);
	strncpy(tdIntRateEnqReqMsg.userId, tdPostingUserId, 4); /* tdPostingUserId is taken from stsarserv.cfg file */
	strncpy(tdIntRateEnqReqMsg.currency, receivedMsg.timeDepositIntRateEnq.tdCurrency, 2);
	strncpy(tdIntRateEnqReqMsg.depositAmt, receivedMsg.timeDepositIntRateEnq.depositAmt, 15);
	sprintf(tmpStr, "%.3s", receivedMsg.timeDepositIntRateEnq.tenor);
	if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'D' ) /* If the tenorType is Days */
		depositPeriod = atoi(tmpStr);
	else if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'M' ) /* If the tenorType is Months */
		depositPeriod = atoi(tmpStr) * 30; /* Month = 30 days ; CHECK */
	else if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'W' ) /* If the tenorType is Weeks */
		depositPeriod = atoi(tmpStr) * 7; /* Week = 7 days ; CHECK */
	else if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'Y' ) /* If the tenorType is Years */
		depositPeriod = atoi(tmpStr) * 365; /* Year = 365 days ; CHECK */

	sprintf(tmpStr, "%04d", depositPeriod);
	strncpy(tdIntRateEnqReqMsg.depositPrd, tmpStr, 4);
	strncpy(tdIntRateEnqReqMsg.valueDate, receivedMsg.timeDepositIntRateEnq.valueDate, 8);
	tdIntRateEnqReqMsg.nullPad = '\0';
	sprintf(tmpStr, "%04d", strlen(tdIntRateEnqReqMsg.msgLen));
	strncpy(tdIntRateEnqReqMsg.msgLen, tmpStr, 4);

	fprintf(logFp, "%s|%5d| Send to TUXEDO [%s] \n", getDateTime(), PID, tdIntRateEnqReqMsg.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("ONLNGWENQ", tdIntRateEnqReqMsg.msgLen, tdIntRateEnqResponseMsg.msgLen) == FAILURE )
	{
		end_date();
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(tdIntRateEnqResponseMsg.responseStatus, "00", 2) ) /* Not Success */
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] Error [%.2s] received from  online gateway ; Please check \n", getDateTime(), PID, tdIntRateEnqResponseMsg.responseStatus);
		fflush(logFp);

		if ( strncmp(tdIntRateEnqResponseMsg.responseStatus, "42", 2) == 0 )
		{
			sprintf(tmpStr, "Funding Rate not exists in fud0data.. Please check");
			formatTimeDepositIntRateEnqResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error [%.2s] received from online g/w;Please check", tdIntRateEnqResponseMsg.responseStatus);
			formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
		}
		end_date();
		sendResponse(responseMsg.timeDepositIntRateEnq.msgLen);
		return FAILURE;
	}
	strncpy(responseMsg.timeDepositIntRateEnq.intRate, tdIntRateEnqResponseMsg.intRate, 9);
	strncpy(responseMsg.timeDepositIntRateEnq.minIntRate, tdIntRateEnqResponseMsg.minIntRate, 9);
	strncpy(responseMsg.timeDepositIntRateEnq.maxIntRate, tdIntRateEnqResponseMsg.maxIntRate, 9);

	/* Get the selling/buying  rate using Tuxedo service for cross currency transaction */

	if ( strncmp(receivedMsg.timeDepositIntRateEnq.tdCurrency, receivedMsg.timeDepositIntRateEnq.debitAccNo, 2) )
	{
		memset(exchangeRateEnqReqMsg.msgLen, ' ', sizeof exchangeRateEnqReqMsg);
		memset(exchangeRateEnqResponseMsg.msgLen, ' ', sizeof exchangeRateEnqResponseMsg);

		strncpy(exchangeRateEnqReqMsg.branchName, "StaticData  ", 10);
		strncpy(exchangeRateEnqReqMsg.source, "CS", 2);
		strncpy(exchangeRateEnqReqMsg.service, "03", 2);
		strncpy(exchangeRateEnqReqMsg.bmCurrCode, (strncmp(receivedMsg.timeDepositIntRateEnq.tdCurrency, "01", 2) == 0 ? receivedMsg.timeDepositIntRateEnq.debitAccNo : receivedMsg.timeDepositIntRateEnq.tdCurrency), 2); 
		strncpy(exchangeRateEnqReqMsg.exchangeRateDate, receivedMsg.timeDepositIntRateEnq.valueDate, 8); 

		exchangeRateEnqReqMsg.nullPad = '\0';
		sprintf(tmpStr, "%04d", strlen(exchangeRateEnqReqMsg.msgLen));
		strncpy(exchangeRateEnqReqMsg.msgLen, tmpStr, 4);

		fprintf(logFp, "%s|%5d| Send to TUXEDO [%s] \n", getDateTime(), PID, exchangeRateEnqReqMsg.msgLen);
		fflush(logFp);

		if ( dealWithTuxedo("ODSSERVICE", exchangeRateEnqReqMsg.msgLen, exchangeRateEnqResponseMsg.msgLen) == FAILURE )
		{ 
			end_date();
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( strncmp(exchangeRateEnqResponseMsg.responseStatus, "00", 2) ) 
		{
			fprintf(logFp, "%s|%5d|[processTdIntRateEnq] Error [%.2s] received from  Tuxedo while calling exchange rate service for date %.8s & currency=%.2s; Please check \n", getDateTime(), PID, exchangeRateEnqResponseMsg.responseStatus, receivedMsg.timeDepositIntRateEnq.valueDate, exchangeRateEnqReqMsg.bmCurrCode);
			fflush(logFp);

			if ( strncmp(exchangeRateEnqResponseMsg.responseStatus, "18", 2) == 0 )
			{
				sprintf(tmpStr, "Buy/Sell Rate not exists in CPDB.. Please check");
				formatTimeDepositIntRateEnqResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Err.[%.2s] received from Tuxedo for exchange rate;Please check", exchangeRateEnqResponseMsg.responseStatus);
				formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
			}
			formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
			end_date();
			sendResponse(responseMsg.timeDepositIntRateEnq.msgLen);
			return FAILURE;
		}
		sprintf(tmpStr, "000%.11s", exchangeRateEnqResponseMsg.sellingRate);  
		strncpy(responseMsg.timeDepositIntRateEnq.sellingRate, tmpStr, 14);
		sprintf(tmpStr, "000%.11s", exchangeRateEnqResponseMsg.buyingRate);  
		strncpy(responseMsg.timeDepositIntRateEnq.buyingRate, tmpStr, 14);
		sprintf(tmpStr, "000%.11s", exchangeRateEnqResponseMsg.costRate);  
		strncpy(responseMsg.timeDepositIntRateEnq.costRate, tmpStr, 14);
	}
	else
	{
		strncpy(responseMsg.timeDepositIntRateEnq.sellingRate,  "00000100000000", 14);
		strncpy(responseMsg.timeDepositIntRateEnq.buyingRate, "00000100000000", 14);
		strncpy(responseMsg.timeDepositIntRateEnq.costRate, "00000100000000", 14);
	}

	/* Get the Bankmaster exchange rate */

	memset(&cndRecXC.liveChar, ' ',  sizeof cndRecXC);
	strncpy(cndRecXC.key, "XC00", 4);
	sprintf(crossCurrency, "%.2s", (strncmp(receivedMsg.timeDepositIntRateEnq.tdCurrency, "01", 2) == 0 ? receivedMsg.timeDepositIntRateEnq.debitAccNo : receivedMsg.timeDepositIntRateEnq.tdCurrency)); 
	strncpy(&cndRecXC.key[4], crossCurrency, 2); 
	if ( isRead(cndFile, &cndRecXC.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] ISREAD/ISEQUAL error %d on cnd0data for XC00%.2s\n", getDateTime(), PID, iserrno, crossCurrency);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid currency code %.2s ", crossCurrency);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading cnd0data for %.6s", iserrno, cndRecXC.key);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		end_date();
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.timeDepositIntRateEnq.exRate, cndRecXC.exchangeRateExt, 14); /*new exrate of 14 chars length */
	strncpy(responseMsg.timeDepositIntRateEnq.crBaseDays, cndRecXC.crBaseDays, 3);

	/* Read the system parameter from cnd0data SP record for getting the FX-EXCHANGE RATE Tolerance */
	memset(&cndRecSP.liveChar, ' ', sizeof (cndRecSP));
	strncpy(cndRecSP.recType, "SP0000", 6);
	if ( isRead(cndFile, &cndRecSP.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq()] : ISREAD/ISEQUAL error %d while reading cnd0data(SP) for system Parameter record; \n", getDateTime(), PID, iserrno);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "System parameter record not found in BM");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading cnd0data for SP0000", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}  
		end_date();
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.timeDepositIntRateEnq.fxTolerance, cndRecSP.fxTolerance, 2);

	if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'M' ) /* If the tenorType is Months */
	{
		sprintf(tmpStr, "%.2s", &receivedMsg.timeDepositIntRateEnq.valueDate[4]);
		maturityMonth=atoi(tmpStr);
		sprintf(tmpStr, "%.4s", receivedMsg.timeDepositIntRateEnq.valueDate);
		maturityYear=atoi(tmpStr);
		sprintf(tmpStr, "%.3s", receivedMsg.timeDepositIntRateEnq.tenor);
		depositTenor=atoi(tmpStr);
		maturityMonth += depositTenor;
		while ( maturityMonth > 12 )
		{
			maturityMonth -= 12;
			maturityYear++;
		}

		if ( maturityYear % 400 == 0 || (maturityYear % 4 == 0 && maturityYear % 100 > 0) )
			strcpy(monthDays[1],"29");
		else
			strcpy(monthDays[1],"28");

		if ( strncmp(&receivedMsg.timeDepositIntRateEnq.valueDate[6], "31", 2) == 0 )  
			sprintf(maturityDate, "%04d%02d%.2s", maturityYear, maturityMonth, monthDays[maturityMonth-1]);
		else
			sprintf(maturityDate, "%04d%02d%.2s", maturityYear, maturityMonth, &receivedMsg.timeDepositIntRateEnq.valueDate[6]);

	}
	else if ( receivedMsg.timeDepositIntRateEnq.tenorType == 'Y' ) /* If the tenorType is Year */
	{
		sprintf(tmpStr, "%.4s", receivedMsg.timeDepositIntRateEnq.valueDate);
		maturityYear=atoi(tmpStr);
		sprintf(tmpStr, "%.3s", receivedMsg.timeDepositIntRateEnq.tenor);
		depositTenor=atoi(tmpStr);
		maturityYear += depositTenor;

		if ( maturityYear % 400 == 0 || (maturityYear % 4 == 0 && maturityYear % 100 > 0) )
			strcpy(monthDays[1],"29");
		else
			strcpy(monthDays[1],"28");

		if ( strncmp(&receivedMsg.timeDepositIntRateEnq.valueDate[6], "29",2) == 0 && 
			 strncmp(&receivedMsg.timeDepositIntRateEnq.valueDate[4], "02",2) == 0  )
			sprintf(maturityDate, "%04d%.2s%.2s", maturityYear, &receivedMsg.timeDepositIntRateEnq.valueDate[4], monthDays[1]);
		else
			sprintf(maturityDate, "%04d%.2s%.2s", maturityYear, &receivedMsg.timeDepositIntRateEnq.valueDate[4], &receivedMsg.timeDepositIntRateEnq.valueDate[6]);
	}
	else
	{
		sprintf(tmpStr, "%.8s", receivedMsg.timeDepositIntRateEnq.valueDate);
		if((dateErr = new_date(tmpStr, depositPeriod, maturityDate)) < 0)
		{
			fprintf(logFp, "%s|%5d|[processTdIntRateEnq] : Error %d [ahaerr=%d] returned by new_date function ; Value Date=%.8s Deposit Period : %d\n", getDateTime(), PID, dateErr, ahaerr, receivedMsg.timeDepositIntRateEnq.valueDate, depositPeriod);
			fflush(logFp);
			end_date();
			sprintf(tmpStr, "Error during maturity date calculation;Please check");
			formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.timeDepositIntRateEnq.msgLen);
			return FAILURE;
		}
	}

	strncpy(responseMsg.timeDepositIntRateEnq.maturityDate, maturityDate, 8);

	fprintf(logFp, "%s|%5d|[processTdIntRateEnq] Value Date : %.8s; Maturity date : %.8s\n", getDateTime(), PID, receivedMsg.timeDepositIntRateEnq.valueDate, maturityDate);
	sprintf(tmpStr, "%.8s", receivedMsg.timeDepositIntRateEnq.valueDate);
	if ( (dateErr = days_between_2dates(maturityDate, tmpStr,  &daysBetween)) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTdIntRateEnq] Error %d returned by days_between_2dates for maturityDate=%.8s; receivedMsg.timeDepositIntRateEnq.valueDate=%.8s\n", getDateTime(), PID, dateErr, maturityDate, receivedMsg.timeDepositIntRateEnq.valueDate);
		fflush(logFp);
		daysBetween=1; /* CHECK */
	}
	fprintf(logFp,"%s|%5d|[processTdIntRateEnq] Daysbetween return from date library : %d ; error flag : %d\n", getDateTime(), PID, daysBetween, dateErr);

	sprintf(tmpStr, "%03d", daysBetween);
	strncpy(responseMsg.timeDepositIntRateEnq.diffDays, tmpStr, 3);

	/* Get the narrative1 from stctltab TD record type */
	memset(&bmMemoRec.liveChar, ' ', sizeof bmMemoRec);
	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &bmMemoRec.liveChar, ISGTEQ);
	strncpy(bmMemoRec.recType, "MM", 2);
	strncpy(bmMemoRec.ledgerCode, receivedMsg.timeDepositIntRateEnq.tdLedger, 3);
	if ( isRead(ctlFile, &bmMemoRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| [processTdIntRateEnq] ISREAD/ISEQUAL error %d occured while reading stctltab for the key [MM%.3s ] while getting Time deposit narrative1 \n", getDateTime(), PID, iserrno, receivedMsg.timeDepositIntRateEnq.tdLedger);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Deposit Memo %.3s not found in stctltab       ", receivedMsg.timeDepositIntRateEnq.tdLedger);
			formatTimeDepositIntRateEnqResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr,"Error %d while reading stctltab for memo[%.3s]", iserrno, receivedMsg.timeDepositIntRateEnq.tdLedger);
			formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	fprintf(logFp, "%s|%5d|[processTdIntRateEnq] Tolerance in back value date is [%.3s] defined for memo[%.3s] in stctltab\n", getDateTime(), PID, bmMemoRec.fdValueDateTolerance, receivedMsg.timeDepositIntRateEnq.tdLedger);
	sprintf(tmpStr, "%.3s", bmMemoRec.fdValueDateTolerance);
	fdValueDateTolerance = atoi(tmpStr);
	if ( fdValueDateTolerance )
	{
		if ( (dateErr = new_date(bankingDate, -fdValueDateTolerance,  maxBackValueDate)) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processTdIntRateEnq] : Error %d [ahaerr=%d] returned by new_date function ; Banking Date=%.8s fdValueDateTolerance : %d\n", getDateTime(), PID, dateErr, ahaerr, bankingDate, fdValueDateTolerance);
			fflush(logFp);
			end_date();
			sprintf(tmpStr, "Error during back value date calculation;Report to Support");
			formatTimeDepositIntRateEnqResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.timeDepositIntRateEnq.msgLen);
			return FAILURE;
		}
		fprintf(logFp,"%s|%5d|[processTdIntRateEnq] Tollerance in Value Date=%d & Max.back value date allowed=%.8s\n", getDateTime(), PID, fdValueDateTolerance, maxBackValueDate);
		strncpy(responseMsg.timeDepositIntRateEnq.maxBackValueDate, maxBackValueDate, 8);
	}
	else
	{
		fprintf(logFp,"%s|%5d|[processTdIntRateEnq] Tollerance in value date is zero & hence banking date is send as maximum back value date\n", getDateTime(), PID, daysBetween, dateErr);
		strncpy(responseMsg.timeDepositIntRateEnq.maxBackValueDate, bankingDate, 8);
	}

	end_date();

	strncpy(responseMsg.timeDepositIntRateEnq.tdCurrency, receivedMsg.timeDepositIntRateEnq.tdCurrency, 2);
	strncpy(responseMsg.timeDepositIntRateEnq.tdLedger, receivedMsg.timeDepositIntRateEnq.tdLedger, 3);
	strncpy(responseMsg.timeDepositIntRateEnq.depositAmt, receivedMsg.timeDepositIntRateEnq.depositAmt, 15);
	strncpy(responseMsg.timeDepositIntRateEnq.debitAccNo, receivedMsg.timeDepositIntRateEnq.debitAccNo, 14);
	responseMsg.timeDepositIntRateEnq.tenorType =  receivedMsg.timeDepositIntRateEnq.tenorType;
	strncpy(responseMsg.timeDepositIntRateEnq.tenor, receivedMsg.timeDepositIntRateEnq.tenor, 3);
	formatTimeDepositIntRateEnqResponse(DONE, "Successful...", "Successful...");
	sendResponse(responseMsg.timeDepositIntRateEnq.msgLen);
	return SUCCESS;
}

processTimeDepositRequest() 
{
	char tmpStr[200];
	int  gldExistFlag;
	double tmpDbl=0, debitAmt=0;
	double availableBal =0, exRate=0;
	int  zeroUpdateReqd=NO, amtDenom=0;
	int  decimalPlace=0;
	int  tdLogDateTimeExist=NO;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processTimeDepositRequest]\n", getDateTime(), PID);

	if ( receivedMsg.timeDeposit.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processTimeDepositRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.timeDeposit.dateTime);
		fflush(logFp);
		sprintf(tmpStr, "Encountered problem in date&time;retry your action");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&tdLogRec.liveChar,' ',sizeof tdLogRec);

	if ( receivedMsg.timeDeposit.creationOrUpdate == 'U' )
	{
		strncpy(tdLogRec.branchCode,receivedMsg.timeDeposit.homeBranch,4);
		strncpy(tdLogRec.userId, receivedMsg.timeDeposit.userId,10);
		strncpy(tdLogRec.dateTime, receivedMsg.timeDeposit.dateTime,14);

		isindexinfo(tdLogFile, &tdLogKey, 1);

		if ( isstart(tdLogFile, &tdLogKey, 0, &tdLogRec.liveChar, ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     	formatBranchResponse(END_OF_FILE,"No Time Deposit Records found....", "No Time Deposit Records found....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
			}
     		sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		while ( isRead(tdLogFile, &tdLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(receivedMsg.timeDeposit.homeBranch, tdLogRec.branchCode, 4) || strncmp(receivedMsg.timeDeposit.userId, tdLogRec.userId, 10) || strncmp(receivedMsg.timeDeposit.dateTime, tdLogRec.dateTime, 14) )
			{
				formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
				sendResponse(responseMsg.customer.msgLen);
				return SUCCESS;
			}
		
			break;
		}
	}

	if ( receivedMsg.timeDeposit.newOrUpdate == 'U' && receivedMsg.timeDeposit.creationOrUpdate == 'C' )
	{
		isindexinfo(tdLogFile, &tdLogKey, 3);

		memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);
		strncpy(tdLogRec.tdAccNo, receivedMsg.timeDeposit.accNo, 14);

		if ( isstart(tdLogFile,&tdLogKey, 0, &tdLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno != 110 && iserrno != 112 && iserrno != 111 )
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		while ( isRead(tdLogFile, &tdLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(tdLogRec.tdAccNo, receivedMsg.timeDeposit.accNo, 14) )
				break;

			if ( tdLogRec.bmUpdateStatus == '1' || tdLogRec.bmUpdateStatus == '2' )
			{
				fprintf(logFp, "%s|%5d| [processTimeDepositRequest] Account [%.14s] is already in pending status [%c] and the branch code [%.4s] and userId created was [%.10s]\n", getDateTime(), PID, tdLogRec.tdAccNo, tdLogRec.bmUpdateStatus, tdLogRec.branchCode, tdLogRec.userId);
				fflush(logFp);
				if ( tdLogRec.bmUpdateStatus == '1' )
					sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", tdLogRec.branchCode );
				else
					sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", tdLogRec.userId, tdLogRec.branchCode);

				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( receivedMsg.timeDeposit.newOrUpdate == 'N' )
	{
		memset(&cndRecXC.liveChar, ' ',  sizeof cndRecXC);
		strncpy(cndRecXC.key, "XC00", 4);
		strncpy(&cndRecXC.key[4], receivedMsg.timeDeposit.debitAccNo, 2); 
		if ( isRead(cndFile, &cndRecXC.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processTimeDepositRequest] ISREAD/ISEQUAL error %d on cnd0data for XC00%.2s\n", getDateTime(), PID, iserrno, receivedMsg.timeDeposit.debitAccNo);
			fflush(logFp);
			if ( iserrno == 111  || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid currency code %.2s ", receivedMsg.timeDeposit.debitAccNo);
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading cnd0data for %.6s", iserrno, cndRecXC.key);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		decimalPlace = cndRecXC.decimalPlace - '0';
		/*
		sprintf(tmpStr, "%.14s", receivedMsg.timeDeposit.depositAmt);
		debitAmt = atof(tmpStr);
		sprintf(tmpStr, "%.14s", receivedMsg.timeDeposit.exRate);
		exRate = atof(tmpStr)/100000000;

		debitAmt *= exRate;
		*/
		debitAmt = bmAmtToDbl(receivedMsg.timeDeposit.debitAmt, 14);

		memset(&gldRec.liveChar, ' ', sizeof gldRec);
		strncpy(gldRec.accNo, actualToBmAcc(receivedMsg.timeDeposit.debitAccNo, tmpStr), 13);
		isindexinfo(gldFile, &gldKey, 1);
		isstart(gldFile, &gldKey, 0, &gldRec.liveChar, ISGTEQ);

		if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processTimeDepositRequest] :ISREAD/ISEQUAL error %d occured while reading gld0data for the debit account no [%.14s]  [%.13s] \n", getDateTime(), PID, iserrno, receivedMsg.timeDeposit.debitAccNo, gldRec.accNo);
			fflush(logFp);
			if ( iserrno == 111  || iserrno == 110 )
			{
				sprintf(tmpStr, "Invalid Debit Account No %.14s", receivedMsg.timeDeposit.debitAccNo);
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "Error %d while reading gld0data for %.14s", iserrno, receivedMsg.timeDeposit.debitAccNo);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		availableBal = bmAmtToDbl(gldRec.clearedBal, 14) - bmAmtToDbl(gldRec.blockedAmt, 14) - bmAmtToDbl(gldRec.accLimit,12)*100;

		if ( decimalPlace == 0 )
			amtDenom = 1;
		else if ( decimalPlace == 1 )
			amtDenom = 10;
		else if ( decimalPlace == 2 )
			amtDenom = 100;
		else if ( decimalPlace == 3 )
			amtDenom = 1000;
		else 
			amtDenom = 100; /* defaulted to 100 */

		if ( availableBal < debitAmt )
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositRequest] Customer's Debit account [%.14s] does not have sufficient balance [%.*f] to cover the deposit Amount [%.*f] \n", getDateTime(), PID, receivedMsg.timeDeposit.debitAccNo, decimalPlace, availableBal/amtDenom, decimalPlace, debitAmt/amtDenom);
			fflush(logFp);
			sprintf(tmpStr, "Insufficient balance in Debit Account             ");
			formatBranchResponse(NO_FUND, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( gldRec.passwd == '2' || gldRec.passwd == '3')
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositRequest] Customer's Debit account [%.14s] is closed\n", getDateTime(), PID, receivedMsg.timeDeposit.debitAccNo);
			fflush(logFp);
			sprintf(tmpStr, "Debit Account is closed                           ");
			formatBranchResponse(ACCOUNT_CLOSED, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( gldRec.passwd == '4' || gldRec.passwd == '5')
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositRequest] Customer's Debit account [%.14s] does not allow any debit[%c]\n", getDateTime(), PID, receivedMsg.timeDeposit.debitAccNo, gldRec.passwd);
			fflush(logFp);
			sprintf(tmpStr, "Debit Account is restricted for debit             ");
			formatBranchResponse(ACCOUNT_RESTRICTED, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( gldRec.inactiveAccFlag == '1' )
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositRequest] Customer's Debit account [%.14s] is dormant\n", getDateTime(), PID, receivedMsg.timeDeposit.debitAccNo);
			fflush(logFp);
			sprintf(tmpStr, "Debit Account is dormant                          ");
			formatBranchResponse(DORMANT, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);
	tdLogRec.liveChar = '@';
	strncpy(tdLogRec.branchCode,receivedMsg.timeDeposit.homeBranch,4);
	strncpy(tdLogRec.userId, receivedMsg.timeDeposit.userId,10);
	if ( strncmp(receivedMsg.timeDeposit.dateTime, "                 ", 14) == 0 )
	{
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(tdLogRec.dateTime, tmpStr, 14);
	}
	else
		strncpy(tdLogRec.dateTime, receivedMsg.timeDeposit.dateTime,14);
	strncpy(tdLogRec.tdAccNo, receivedMsg.timeDeposit.accNo, 14);
	strncpy(tdLogRec.supervisorId, receivedMsg.timeDeposit.supervisorId,10);
	strncpy(tdLogRec.custNo, receivedMsg.timeDeposit.custNo, 7);

	strncpy(tdLogRec.tdLedger, receivedMsg.timeDeposit.tdLedger, 3);
	strncpy(tdLogRec.tdCurrency, receivedMsg.timeDeposit.tdCurrency, 2);
	strncpy(tdLogRec.debitAccNo, receivedMsg.timeDeposit.debitAccNo, 14);
	strncpy(tdLogRec.depositAmt, receivedMsg.timeDeposit.depositAmt, 14);
	strncpy(tdLogRec.debitAmt, receivedMsg.timeDeposit.debitAmt, 14);
	tdLogRec.tenorType = receivedMsg.timeDeposit.tenorType;
	strncpy(tdLogRec.tenorPeriod, receivedMsg.timeDeposit.tenorPeriod, 3);
	strncpy(tdLogRec.fundIntRate, receivedMsg.timeDeposit.fundIntRate, 9);
	strncpy(tdLogRec.exRate, receivedMsg.timeDeposit.exRate, 14);

	strncpy(tdLogRec.orgFundIntRate, receivedMsg.timeDeposit.bmFundIntRate, 9);
	strncpy(tdLogRec.orgExRate, receivedMsg.timeDeposit.bmExRate, 14);

	strncpy(tdLogRec.maturityAmt, receivedMsg.timeDeposit.maturityAmt, 14);
	strncpy(tdLogRec.maturityDate, receivedMsg.timeDeposit.maturityDate, 8);
	strncpy(tdLogRec.valueDate, receivedMsg.timeDeposit.valueDate, 8);
	tdLogRec.overrideIntRate = receivedMsg.timeDeposit.overrideIntRate;
	tdLogRec.overrideExRate = receivedMsg.timeDeposit.overrideExRate;
	tdLogRec.overrideValueDate = receivedMsg.timeDeposit.overrideValueDate;
	strncpy(tdLogRec.supervisorComments, receivedMsg.timeDeposit.supervisorComments, 200);
	tdLogRec.bmUpdateStatus = '1'; 
	tdLogRec.newOrUpdate = receivedMsg.timeDeposit.newOrUpdate; 
	tdLogRec.autoRenewFlag = receivedMsg.timeDeposit.autoRenewFlag;
	strncpy(tdLogRec.diffDays, receivedMsg.timeDeposit.diffDays, 3);
	tdLogRec.intAppln = receivedMsg.timeDeposit.intAppln;
	strncpy(tdLogRec.payAccNo, receivedMsg.timeDeposit.payAccNo, 14);
	strncpy(tdLogRec.bookingDate, bankingDate, 8);
	strncpy(tdLogRec.lastUpdateUser, receivedMsg.timeDeposit.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(tdLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( receivedMsg.timeDeposit.creationOrUpdate == 'U' )
	{
		if( isRewcurr(tdLogFile, &tdLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processTimeDepositRequest]  ISREWCURR error %d on sttdlog for key=%.28s\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s] on sttdlog", tdLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on sttdlog");
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr );
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrelease(tdLogFile);
			sendResponse( responseMsg.customer.msgLen );
			return FAILURE;
		}

		isrelease(tdLogFile);
	}
	else
	{
		if ( extraDebug > 4 )
		{
			fprintf(logFp,"%s|%5d| [processTimeDepositRequest] Before writing to sttdlog file (%d)...\n",getDateTime(), PID, tdLogFile);
			fflush(logFp);
		}
		if ( isWrite(tdLogFile, &tdLogRec.liveChar ) < 0 )
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositRequest] ISWRITE error %d on sttdlog for key [%.28s]\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s] in sttdlog", tdLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on sttdlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	closeAllFiles();
	formatBranchResponse(DONE,"Successfully Added...", "Successfully Added...");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

readTimeDepositPendingList()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, i, nameLen;
	char tmpStr[100]; 

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[readTimeDepositPendingList]\n", getDateTime(), PID);


	memset(responseMsg.timeDepositPendingList.msgLen, ' ', sizeof responseMsg.timeDepositPendingList);
	responseMsg.timeDepositPendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.timeDepositPendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);

	isindexinfo(tdLogFile, &tdLogKey, 4);
	if( receivedMsg.timeDepositPendingList.activityFlag == SUPERVISOR_ACTION ) 
	{		
		strncpy(tdLogRec.branchCode, receivedMsg.timeDepositPendingList.homeBranch,4);
		tdLogRec.bmUpdateStatus  = '1';
	}
	else /* TELLER_ACTION */
	{
		strncpy(tdLogRec.branchCode,receivedMsg.timeDepositPendingList.homeBranch,4);
		tdLogRec.bmUpdateStatus  = '2';
		strncpy( tdLogRec.userId, receivedMsg.timeDepositPendingList.userId ,10 ); 
	}

	if ( isstart(tdLogFile,&tdLogKey,0,&tdLogRec.liveChar,ISGTEQ) < 0 )
	{
		responseMsg.timeDepositPendingList.details[recsInThisMsg+1].userId[0] = '\0';
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatTimeDepositPendingListResponse(END_OF_FILE,"No more Records to fetch....", "No more Records to fetch....");
		else
		{
			fprintf(logFp,"%s|%5d|[readTimeDepositPendingList] :C-ISAM Error %d occured during ISSTART on sttdlog, key [%.28s %c]\n",getDateTime(), PID, iserrno, tdLogRec.branchCode, tdLogRec.bmUpdateStatus);
			sprintf(tmpStr, "CISAM Error %d occured on sttdlog file", iserrno);
			formatTimeDepositPendingListResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.timeDepositPendingList.msgLen);
		return FAILURE;
	 }

	 while ( isRead(tdLogFile, &tdLogRec.liveChar, ISNEXT) == 0 )
	 {

		if ( receivedMsg.timeDepositPendingList.activityFlag == SUPERVISOR_ACTION )
		{	
		 	if (strncmp(receivedMsg.timeDepositPendingList.homeBranch,tdLogRec.branchCode,4) != 0 || tdLogRec.bmUpdateStatus != '1')
				break;
		}
		else
		{
		 	if (strncmp(receivedMsg.timeDepositPendingList.homeBranch,tdLogRec.branchCode,4) != 0 || strncmp(receivedMsg.timeDepositPendingList.userId,tdLogRec.userId,10) != 0 || tdLogRec.bmUpdateStatus !=  '2') 
				break;
		}

		if ( strncmp(receivedMsg.timeDepositPendingList.custNo, "           ", 7) && 
			 receivedMsg.timeDepositPendingList.custNo[0] != NULL && 
			 strncmp(receivedMsg.timeDepositPendingList.custNo, "0000000", 7) )
		{
			if ( strncmp(receivedMsg.timeDepositPendingList.custNo, tdLogRec.custNo, 7) )
				continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */
		
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].userId, tdLogRec.userId, 10);
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].dateTime, tdLogRec.dateTime, 14);
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].custNo, tdLogRec.custNo, 7);
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].accNo, tdLogRec.tdAccNo, 14);

		memset(&crdRec.liveChar, ' ', sizeof crdRec);
		strncpy(crdRec.accNo, (char *)actualToBmCust(tdLogRec.custNo, tmpStr), 6);

		if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[readTimeDepositPendingList] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer name for Time Deposit pending list request ; IGNORED  \n", getDateTime(), PID, iserrno, tdLogRec.custNo, crdRec.accNo);
			fflush(logFp);
			strncpy(crdRec.shortName, "Could not read name from CRD", 30);
		}

		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].custName, crdRec.shortName, 30);
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].tdCurrency, tdLogRec.tdCurrency, 2);
		strncpy(responseMsg.timeDepositPendingList.details[recsInThisMsg].tdLedger, tdLogRec.tdLedger, 3);
		responseMsg.timeDepositPendingList.details[recsInThisMsg].newOrUpdate =  tdLogRec.newOrUpdate;

		if ( ++recsInThisMsg >=  20 )
			break;
	}	
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.timeDepositPendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	responseMsg.timeDepositPendingList.details[recsInThisMsg+1].userId[0] = '\0';
	strncpy(responseMsg.timeDepositPendingList.noOfRecs, tmpStr, 2);
	formatTimeDepositPendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.timeDepositPendingList.msgLen);
	return SUCCESS;
}

getTimeDepositDetails() 
{
	char tmpStr[100], tAccNo[20], tBmAccNo[20];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getTimeDepositDetails]\n", getDateTime(), PID);


	memset(responseMsg.timeDepositDetail.msgLen, ' ', sizeof responseMsg.timeDepositDetail);

	memset(timeDepositEnqReqMsg.msgLen, ' ', sizeof timeDepositEnqReqMsg);
	memset(timeDepositEnqResponseMsg.msgLen, ' ', sizeof timeDepositEnqResponseMsg);

	strncpy(timeDepositEnqReqMsg.branchName, "StaticData  ", 10);
	strncpy(timeDepositEnqReqMsg.source, "CS", 2);
	strncpy(timeDepositEnqReqMsg.service, "20", 2);
	strncpy(timeDepositEnqReqMsg.userId, tdPostingUserId, 4); /* tdPostingUserId is taken from stsarserv.cfg file */
	strncpy(timeDepositEnqReqMsg.accNo, receivedMsg.timeDepositDetail.dateTime, 14); /* During Enq, datetime will be filled with 
																						   Account number */
	timeDepositEnqReqMsg.nullPad = '\0';
	sprintf(tmpStr, "%04d", strlen(timeDepositEnqReqMsg.msgLen));
	strncpy(timeDepositEnqReqMsg.msgLen, tmpStr, 4);

	fprintf(logFp, "%s|%5d| Send to TUXEDO [%s] \n", getDateTime(), PID, timeDepositEnqReqMsg.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("ONLNGWENQ", timeDepositEnqReqMsg.msgLen, timeDepositEnqResponseMsg.msgLen) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(timeDepositEnqResponseMsg.responseStatus, "00", 2) ) /* Not Success */
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetails] Error [%.2s] received from  online gateway ; Please check \n", getDateTime(), PID, timeDepositEnqResponseMsg.responseStatus);
		fflush(logFp);

		sprintf(tmpStr, "Error [%.2s] received from online g/w;Please check", timeDepositEnqResponseMsg.responseStatus);
		formatTimeDepositDetailResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.timeDepositDetail.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.timeDepositDetail.accNo, timeDepositEnqResponseMsg.accNo, 14);
	/*responseMsg.timeDepositDetail.newOrUpdate = tdLogRec.newOrUpdate;*/
	strncpy(responseMsg.timeDepositDetail.custNo, &timeDepositEnqResponseMsg.accNo[5], 7);
	strncpy(responseMsg.timeDepositDetail.tdCurrency, timeDepositEnqResponseMsg.accNo, 2);
	strncpy(responseMsg.timeDepositDetail.tdLedger, &timeDepositEnqResponseMsg.accNo[2], 3);
	responseMsg.timeDepositDetail.tenorType = timeDepositEnqResponseMsg.renewType;
	responseMsg.timeDepositDetail.tenor[0] = '0';
	strncpy(&responseMsg.timeDepositDetail.tenor[1], timeDepositEnqResponseMsg.renewPrd, 2);
	strncpy(responseMsg.timeDepositDetail.maturityDate, timeDepositEnqResponseMsg.maturityDate, 8);
	strncpy(responseMsg.timeDepositDetail.maturityAmt, &timeDepositEnqResponseMsg.maturityAmt[1], 14);
	strncpy(responseMsg.timeDepositDetail.depositAmt, &timeDepositEnqResponseMsg.depositAmt[1], 14);
	/*strncpy(responseMsg.timeDepositDetail.debitAccNo, timeDepositEnqResponseMsg.payAccNo, 14);*/
	strncpy(responseMsg.timeDepositDetail.payAccNo, timeDepositEnqResponseMsg.payAccNo, 14);

	/* get the payee customer name */

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(&timeDepositEnqResponseMsg.payAccNo[5], tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetail] ISREAD/ISEQUAL error %d occured while reading crd0data for the payee customer # [%.7s] [%.6s] while getting customer name ; IGNORED  \n", getDateTime(), PID, iserrno, &timeDepositEnqResponseMsg.payAccNo[5], crdRec.accNo);
		fflush(logFp);
		strncpy(crdRec.shortName, "Could not read name from CRD", 30);
	}
	strncpy(responseMsg.timeDepositDetail.payAccCustName, crdRec.shortName, 30);

	strncpy(responseMsg.timeDepositDetail.fundIntRate, timeDepositEnqResponseMsg.intRate, 9);
	strncpy(responseMsg.timeDepositDetail.valueDate, timeDepositEnqResponseMsg.accOpenDate, 8);

	/* Add extra details if the time deposit is opened through CSD */

	memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);
	strncpy(tdLogRec.tdAccNo, timeDepositEnqResponseMsg.accNo, 14);
	isindexinfo(tdLogFile, &tdLogKey, 3);
	isstart(tdLogFile, &tdLogKey, 0, &tdLogRec.liveChar, ISGTEQ);

	while ( isRead(tdLogFile, &tdLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(tdLogRec.tdAccNo, timeDepositEnqResponseMsg.accNo, 14) )
			break;

		if ( tdLogRec.bmUpdateStatus != '9' )
			continue;

		if ( tdLogRec.newOrUpdate != 'N' )
			continue;

		strncpy(responseMsg.timeDepositDetail.exRate, tdLogRec.exRate, 14);
		strncpy(responseMsg.timeDepositDetail.debitAccNo, tdLogRec.debitAccNo, 14);
		strncpy(responseMsg.timeDepositDetail.valueDate, tdLogRec.valueDate, 8);
		strncpy(responseMsg.timeDepositDetail.debitAmt, tdLogRec.debitAmt, 14);
		break;
	}

	/*
	strncpy(responseMsg.timeDepositDetail.orgFundIntRate, tdLogRec.orgFundIntRate, 9);
	strncpy(responseMsg.timeDepositDetail.orgExRate, tdLogRec.orgExRate, 14);
	strncpy(responseMsg.timeDepositDetail.supervisorComments, tdLogRec.supervisorComments, 200);

	responseMsg.timeDepositDetail.overrideIntRate = tdLogRec.overrideIntRate;
	responseMsg.timeDepositDetail.overrideExRate = tdLogRec.overrideExRate;
	responseMsg.timeDepositDetail.overrideValueDate = tdLogRec.overrideValueDate;
	*/
	responseMsg.timeDepositDetail.autoRenewFlag = timeDepositEnqResponseMsg.autoRenewFlag;

	strncpy(responseMsg.timeDepositDetail.custName, timeDepositEnqResponseMsg.custName, 30);

	responseMsg.timeDepositDetail.intAppln = timeDepositEnqResponseMsg.intAppFlag;
	strncpy(responseMsg.timeDepositDetail.payAccNo, timeDepositEnqResponseMsg.payAccNo, 14);

	formatTimeDepositDetailResponse(DONE, "Successful","Successful");
	sendResponse(responseMsg.timeDepositDetail.msgLen);
	return SUCCESS;
}

getTimeDepositDetailFromLog() 
{
	char tmpStr[100], tAccNo[20], tBmAccNo[20];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[getTimeDepositDetailFromLog]\n", getDateTime(), PID);


	memset(responseMsg.timeDepositDetail.msgLen, ' ', sizeof responseMsg.timeDepositDetail);
	memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);

	strncpy(tdLogRec.userId, receivedMsg.timeDepositDetail.userId, 10);
	strncpy(tdLogRec.branchCode, receivedMsg.timeDepositDetail.homeBranch, 4);
	strncpy(tdLogRec.dateTime, receivedMsg.timeDepositDetail.dateTime,14);

	isindexinfo(tdLogFile, &tdLogKey, 1);
	if( isstart(tdLogFile, &tdLogKey, 0, &tdLogRec.liveChar,ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetailFromLog] ISSTART/ISEQUAL error %d occured on sttdLog for key [%.28s]\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatTimeDepositDetailResponse(END_OF_FILE, "Not booked using CSD. Hence no history available..   ", "Not booked using CSD. Hence no history available..  ");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
			formatTimeDepositDetailResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.timeDepositDetail.msgLen);
		return FAILURE;
	}

	if ( readTdLogFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE ;
	}

	strncpy(responseMsg.timeDepositDetail.accNo, tdLogRec.tdAccNo, 14);
	responseMsg.timeDepositDetail.newOrUpdate = tdLogRec.newOrUpdate;
	strncpy(responseMsg.timeDepositDetail.supervisorId, tdLogRec.supervisorId, 10);
	strncpy(responseMsg.timeDepositDetail.custNo, tdLogRec.custNo, 7);
	strncpy(responseMsg.timeDepositDetail.tdCurrency, tdLogRec.tdCurrency, 2);
	strncpy(responseMsg.timeDepositDetail.tdLedger, tdLogRec.tdLedger, 3);
	responseMsg.timeDepositDetail.tenorType = tdLogRec.tenorType;
	strncpy(responseMsg.timeDepositDetail.tenor, tdLogRec.tenorPeriod, 3);
	strncpy(responseMsg.timeDepositDetail.maturityDate, tdLogRec.maturityDate, 8);
	strncpy(responseMsg.timeDepositDetail.valueDate, tdLogRec.valueDate, 8);
	strncpy(responseMsg.timeDepositDetail.maturityAmt, tdLogRec.maturityAmt, 14);
	strncpy(responseMsg.timeDepositDetail.depositAmt, tdLogRec.depositAmt, 14);
	strncpy(responseMsg.timeDepositDetail.debitAmt, tdLogRec.debitAmt, 14);
	strncpy(responseMsg.timeDepositDetail.debitAccNo, tdLogRec.debitAccNo, 14);
	strncpy(responseMsg.timeDepositDetail.fundIntRate, tdLogRec.fundIntRate, 9);
	strncpy(responseMsg.timeDepositDetail.exRate, tdLogRec.exRate, 14);
	strncpy(responseMsg.timeDepositDetail.orgFundIntRate, tdLogRec.orgFundIntRate, 9);
	strncpy(responseMsg.timeDepositDetail.orgExRate, tdLogRec.orgExRate, 14);
	strncpy(responseMsg.timeDepositDetail.supervisorComments, tdLogRec.supervisorComments, 200);

	responseMsg.timeDepositDetail.overrideIntRate = tdLogRec.overrideIntRate;
	responseMsg.timeDepositDetail.overrideExRate = tdLogRec.overrideExRate;
	responseMsg.timeDepositDetail.overrideValueDate = tdLogRec.overrideValueDate;
	responseMsg.timeDepositDetail.autoRenewFlag = tdLogRec.autoRenewFlag;
	strncpy(responseMsg.timeDepositDetail.diffDays, tdLogRec.diffDays, 3);
	responseMsg.timeDepositDetail.intAppln = tdLogRec.intAppln;
	strncpy(responseMsg.timeDepositDetail.payAccNo, tdLogRec.payAccNo, 14);

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(&tdLogRec.payAccNo[5], tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetailFromLog] ISREAD/ISEQUAL error %d occured while reading crd0data for the payee customer # [%.7s] [%.6s] while getting customer name for Time Deposit pending list request ; IGNORED  \n", getDateTime(), PID, iserrno, &tdLogRec.payAccNo[5], crdRec.accNo);
		fflush(logFp);
		strncpy(crdRec.shortName, "Could not read name from CRD", 30);
	}
	strncpy(responseMsg.timeDepositDetail.payAccCustName, crdRec.shortName, 30);

	memset(&cndRecXC.liveChar, ' ',  sizeof cndRecXC);
	strncpy(cndRecXC.key, "XC00", 4);
	strncpy(&cndRecXC.key[4], tdLogRec.tdCurrency, 2);
	if ( isRead(cndFile, &cndRecXC.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetailFromLog] ISREAD/ISEQUAL error %d on cnd0data for XC00%.2s\n", getDateTime(), PID, iserrno, tdLogRec.tdCurrency);
		fflush(logFp);
		if ( iserrno == 111  || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid currency code %.2s ", tdLogRec.tdCurrency);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "Error %d while reading cnd0data for %.6s", iserrno, cndRecXC.key);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	strncpy(responseMsg.timeDepositDetail.crBaseDays, cndRecXC.crBaseDays, 3);

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(tdLogRec.custNo, tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getTimeDepositDetailFromLog] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer name for Time Deposit pending list request ; IGNORED  \n", getDateTime(), PID, iserrno, tdLogRec.custNo, crdRec.accNo);
		fflush(logFp);
		strncpy(crdRec.shortName, "Could not read name from CRD", 30);
	}

	strncpy(responseMsg.timeDepositDetail.custName, crdRec.shortName, 30);

	/*
	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(gldRec.accNo, sodLogRec.accNo, 13);
	isindexinfo(gldFile, &gldKey, 1);
	isstart(gldFile, &gldKey, 13, &gldRec.liveChar, ISGTEQ);

	if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processStdOrdPendingDetail] :ISREAD/ISEQUAL error %d occured while reading gld0data for the account no [%.14s]  [%.13s] IGNORED \n", getDateTime(), PID, iserrno, sodLogRec.accNo );
		fflush(logFp);
	}
	strncpy(responseMsg.stdOrdDetail.custBranchCode, gldRec.branchCode, 4);
	*/

	formatTimeDepositDetailResponse(DONE, "Successful","Successful");
	sendResponse(responseMsg.timeDepositDetail.msgLen);
	return SUCCESS;
}

processTimeDepositApproval()
{
	char tmpStr[200], depPeriod[10];; 

	memset(&tdLogRec.liveChar, ' ', sizeof tdLogRec);

	strncpy(tdLogRec.branchCode, receivedMsg.timeDepositApproval.homeBranch,4);
	strncpy(tdLogRec.userId, receivedMsg.timeDepositApproval.userId,10);
	strncpy(tdLogRec.dateTime, receivedMsg.timeDepositApproval.dateTime,14);
	isindexinfo(tdLogFile, &tdLogKey, 1);
	if(isstart(tdLogFile, &tdLogKey, 0, &tdLogRec.liveChar,ISGTEQ) < 0)
	{
		fprintf(logFp, "%s|%5d|[processTimeDepositApproval] ISSTART/ISGTEQ error %d occured on sttdlog for the key [%.28s] \n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			 formatBranchResponse(END_OF_FILE,"No Time Deposit request found for this customer ....", "No Time Deposit request found for this customer ....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttdlog file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( readTdLogFile(ISEQUAL+ISLOCK) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* If Rejected the changes; just update the log file */

	if ( receivedMsg.timeDepositApproval.appRejectFlag != 'A' ) 
	{
		/* Update sttdlog file to include supervisorId  and his comments */

		if ( receivedMsg.timeDepositApproval.appRejectFlag == 'F' ) 
			tdLogRec.bmUpdateStatus = '2';  /* 2 is for forwarding the entry to CSO */
		else
			tdLogRec.bmUpdateStatus = '3';  /* 3 is for rejecting  the entry */

		strncpy(tdLogRec.supervisorId, receivedMsg.timeDepositApproval.supervisorId,10);
		strncpy(tdLogRec.supervisorComments, receivedMsg.timeDepositApproval.supervisorComments, 200);
		strncpy(tdLogRec.lastUpdateUser, receivedMsg.timeDepositApproval.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(tdLogRec.lastUpdateDateTime, tmpStr, 14);

		if( isRewcurr(tdLogFile, &tdLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISREWCURR error %d on sttdlog for key=%.28s\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
			fflush(logFp);
			if  ( iserrno == 100 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s] on sttdlog", tdLogRec.branchCode);
				formatBranchResponse( DUPLICATE,tmpStr , tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on sttdlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrelease(tdLogFile);
			return FAILURE;
		}

		isrelease(tdLogFile);
		formatBranchResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}
	isrelease(tdLogFile);

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(receivedMsg.timeDepositApproval.custNo, tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| [processTimeDepositApproval] ISREAD/ISEQUAL error %d occured while reading crd0data for the customer # [%.7s] [%.6s] while getting customer name \n", getDateTime(), PID, iserrno, receivedMsg.timeDepositApproval.custNo, crdRec.accNo);
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
	strncpy(custTabRec.custNo, receivedMsg.timeDepositApproval.custNo, 7);
	isindexinfo(custTabFile, &custTabKey, 1);
	isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);

	if ( readCustTabFile(ISEQUAL) <  0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.timeDepositApproval.newOrUpdate == 'N' ) /* NEW TIME DEPOSIT */
	{
		/* Get the narrative1 from stctltab TD record type */
		memset(&tdNarrRec.liveChar, ' ', sizeof tdNarrRec);
		isindexinfo(ctlFile, &ctlKey, 1);
		isstart(ctlFile, &ctlKey, 0, &tdNarrRec.liveChar, ISGTEQ);
		strncpy(tdNarrRec.recType, "TD", 2);
		strncpy(tdNarrRec.ctlCode, tdLogRec.tdLedger, 3);
		if ( isRead(ctlFile, &tdNarrRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d| [processTimeDepositApproval] ISREAD/ISEQUAL error %d occured while reading stctltab for the key [TD%.3s ] while getting Time deposit narrative1 \n", getDateTime(), PID, iserrno, tdLogRec.tdLedger);
			fflush(logFp);
			if ( iserrno == 111 || iserrno == 110 )
			{
				sprintf(tmpStr, "Deposit Txn Narrative not found in stctltab   ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr,"Error %d occured while reading stctltab", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/* Send a request to TUXEDO to open the Time Deposit account in Bankmaster; if it is successful, then update sttdlog file */

		memset(tdOpenReqMsg.msgLen, ' ', sizeof tdOpenReqMsg);
		memset(tdOpenResponseMsg.msgLen, ' ', sizeof tdOpenResponseMsg);
		strncpy(tdOpenReqMsg.branchName, "StaticData  ", 10);
		strncpy(tdOpenReqMsg.source, "CS", 2);
		/*strncpy(tdOpenReqMsg.service, "21", 2);*/
		strncpy(tdOpenReqMsg.service, "60", 2);
		strncpy(tdOpenReqMsg.userId, tdPostingUserId, 4);
		strncpy(tdOpenReqMsg.custNo, tdLogRec.custNo, 7);
		strncpy(tdOpenReqMsg.tranDate, bankingDate, 8);
		getDateTime();
		sprintf(tmpStr, "%02d%02d%02d000", systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); /* Milliseconds is hard coded as 000  */
		strncpy(tdOpenReqMsg.tranTime, tmpStr, 9);
		strncpy(tdOpenReqMsg.tranRef, tdOpenReqMsg.tranTime, 9); /* CHECK */
		strncpy(tdOpenReqMsg.arabicNarrative1, tdNarrRec.arabicName, 25);
		strncpy(tdOpenReqMsg.englishNarrative1, tdNarrRec.englishName, 25);

		strncpy(tdOpenReqMsg.currency, tdLogRec.tdCurrency, 2);
		strncpy(tdOpenReqMsg.ledgCode, tdLogRec.tdLedger, 3);
		strncpy(tdOpenReqMsg.debitAccNo, tdLogRec.debitAccNo, 14);
		strncpy(tdOpenReqMsg.maturityDate, tdLogRec.maturityDate, 8);
		strncpy(tdOpenReqMsg.valueDate, tdLogRec.valueDate, 8);
		strncpy(tdOpenReqMsg.intRate, tdLogRec.fundIntRate, 9);
		sprintf(tmpStr, "+%.14s", tdLogRec.depositAmt); /* It is assumed that only +ve amount can come ; CHECK */
		strncpy(tdOpenReqMsg.depositAmt, tmpStr, 15);
		sprintf(tmpStr, "+%.14s", tdLogRec.debitAmt); 
		strncpy(tdOpenReqMsg.debitAmt, tmpStr, 15);
		if ( tdLogRec.tenorType == 'Y' )
		{
			tdOpenReqMsg.depFreq = 'M';
			sprintf(tmpStr, "%.3s", tdLogRec.tenorPeriod);
			sprintf(depPeriod, "%02d", atoi(tmpStr)*12);
			strncpy(tdOpenReqMsg.depPrd, depPeriod, 2);
		}
		else
		{
			tdOpenReqMsg.depFreq = tdLogRec.tenorType;
			sprintf(tmpStr, "%.3s", tdLogRec.tenorPeriod);
			sprintf(depPeriod, "%02d", atoi(tmpStr));
			strncpy(tdOpenReqMsg.depPrd, depPeriod, 2);
		}
		strncpy(tdOpenReqMsg.payeeAccNo, tdLogRec.payAccNo, 14); 
		tdOpenReqMsg.intApplication = tdLogRec.intAppln;
		if ( tdLogRec.autoRenewFlag == ' ' )
			tdOpenReqMsg.renewFlag = '0'; /* CHECK */
		else
			tdOpenReqMsg.renewFlag = tdLogRec.autoRenewFlag;
		strncpy(tdOpenReqMsg.exRate, tdLogRec.exRate, 14);
		tdOpenReqMsg.transCategory = '0'; /* Normal */
		tdOpenReqMsg.nullPad = '\0';
		sprintf(tmpStr, "%04d", strlen(tdOpenReqMsg.msgLen));
		strncpy(tdOpenReqMsg.msgLen, tmpStr, 4);

		fprintf(logFp, "%s|%5d|: Send to TUXEDO [%s] \n", getDateTime(), PID, tdOpenReqMsg.msgLen);
		fflush(logFp);

		/*if ( dealWithTuxedo("TIMEDEPOSITOPEN", tdOpenReqMsg.msgLen, tdOpenResponseMsg.msgLen) == FAILURE )*/
		if ( dealWithTuxedo("FIXEDEPOSITOPEN", tdOpenReqMsg.msgLen, tdOpenResponseMsg.msgLen) == FAILURE )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, tdOpenResponseMsg.msgLen);
		fflush(logFp);

		if ( strncmp(tdOpenResponseMsg.responseStatus, "00", 2) == 0 ) /* Success */
		{
			memset(responseMsg.timeDepositApproval.msgLen, ' ', sizeof responseMsg.timeDepositApproval);
			responseMsg.timeDepositApproval.appRejectFlag = receivedMsg.timeDepositApproval.appRejectFlag;
			strncpy(responseMsg.timeDepositApproval.tdAccNo, tdOpenResponseMsg.depAccNo,14);
			strncpy(responseMsg.timeDepositApproval.intRate, tdOpenResponseMsg.intRate, 9);

			tdLogRec.bmUpdateStatus = '9' ; /* Completed */
			strncpy(tdLogRec.tdAccNo, tdOpenResponseMsg.depAccNo, 14);
			strncpy(tdLogRec.supervisorId, receivedMsg.timeDepositApproval.supervisorId, 10);

			strncpy(tdLogRec.lastUpdateUser, receivedMsg.timeDepositApproval.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(tdLogRec.lastUpdateDateTime, tmpStr, 14);

			if( isRewcurr(tdLogFile, &tdLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d| ISREWCURR error %d on sttdlog for key=%.28s\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
				fflush(logFp);
				if  ( iserrno == 100 )
				{
					sprintf(tmpStr, "Duplicate record [%.28s] on sttdlog", tdLogRec.branchCode);
					formatBranchResponse( DUPLICATE,tmpStr , tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on sttdlog" );
					formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrelease(tdLogFile);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isrelease(tdLogFile);

			memset(&gldRec.liveChar, ' ', sizeof gldRec);
			strncpy(gldRec.accNo, actualToBmAcc(tdOpenResponseMsg.depAccNo, tmpStr), 13);
			isindexinfo(gldFile, &gldKey, 1);

			if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) == 0 )
			{
				memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
				acctLogRec.liveChar = '@';
				strncpy(acctLogRec.branchCode, tdLogRec.branchCode, 4);
				strncpy(acctLogRec.userId, tdLogRec.userId, 10);
				strncpy(acctLogRec.dateTime, tdLogRec.dateTime, 14);
				strncpy(acctLogRec.accNo, bmAccToActual(gldRec.accNo, tmpStr), 14);
				acctLogRec.newOrUpdate = 'N';
				strncpy(acctLogRec.supervisorId, receivedMsg.timeDepositApproval.supervisorId, 10);
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
				strncpy(acctLogRec.acctDesc, gldRec.accDesc, 30);

				acctLogRec.statusChanged = '0'; /* NO */
				strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
				strncpy(acctLogRec.lastUpdateUser, receivedMsg.timeDepositApproval.supervisorId, 10);

				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processTimeDepositApproval] Before writing to acctLogFile (%d) ..\n", getDateTime(), PID, acctLogFile);
					fflush(logFp);
				}
				if ( isWrite(acctLogFile, &acctLogRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processTimeDepositApproval] ISWRITE error %d occured on stacclog for the acc # [%.14s] [%.13s] IGNORED \n", getDateTime(), PID, iserrno, acctLogRec.accNo, gldRec.accNo);
					fflush(logFp);
				}
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processTimeDepositApproval] ISREAD/ISEQUAL error %d occured on gld0data for the acc # [%.14s] [%.13s] IGNORED \n", getDateTime(), PID, iserrno, tdOpenResponseMsg.depAccNo, gldRec.accNo);
				fflush(logFp);
			}
			formatTimeDepositApprovalResponse(DONE, "Successful", "Successful");
			sendResponse(responseMsg.timeDepositApproval.msgLen);
			return SUCCESS;
		}
		else 
		{
			fprintf(logFp, "%s|%5d| Error response (%.2s: TPG ERR=%.12s; Error Description=%.30s) received from Tuxedo service [FIXEDEPOSITOPEN]; Please check \n", getDateTime(), PID, tdOpenResponseMsg.responseStatus, tdOpenResponseMsg.tpgErr, tdOpenResponseMsg.errDesc);
			fflush(logFp);
			sprintf(tmpStr, "BM Error: %.30s", tdOpenResponseMsg.errDesc);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	if ( receivedMsg.timeDepositApproval.newOrUpdate == 'B' ) /* Break the deposit */
	{
		/* Apply the interest - Tuxedo Service*/
		/* Move the fund to payee account & charge the penalty - Tuxedo Service */
		/* remove the record from diary */
		/* update aad0data */
		/* close the Time Deposit */
	}
	else /* RENEWAL INSTRUCTION CHANGE TIME DEPOSIT */
	{

		/* Send a request to TUXEDO to renew the Time Deposit account in Bankmaster;if it is successful, then update sttdlog file */

		memset(tdRenewReqMsg.msgLen, ' ', sizeof tdRenewReqMsg);
		memset(tdRenewResponseMsg.msgLen, ' ', sizeof tdRenewResponseMsg);
		strncpy(tdRenewReqMsg.branchName, "StaticData  ", 10);
		strncpy(tdRenewReqMsg.source, "CS", 2);
		strncpy(tdRenewReqMsg.service, "22", 2);
		strncpy(tdRenewReqMsg.userId, tdPostingUserId, 4);
		strncpy(tdRenewReqMsg.accNo, receivedMsg.timeDepositApproval.accNo, 14);

		if ( tdLogRec.tenorType == 'Y' )
		{
			tdRenewReqMsg.renewType = 'M';
			sprintf(tmpStr, "%.3s", tdLogRec.tenorPeriod);
			sprintf(depPeriod, "%03d", atoi(tmpStr)*12);
			strncpy(tdRenewReqMsg.renewPrd, depPeriod, 3);
		}
		else
		{
			tdRenewReqMsg.renewType = tdLogRec.tenorType;
			sprintf(tmpStr, "%.3s", tdLogRec.tenorPeriod);
			sprintf(depPeriod, "%03d", atoi(tmpStr));
			strncpy(tdRenewReqMsg.renewPrd, depPeriod, 3);
		}
		if ( tdLogRec.autoRenewFlag == ' ' )
			tdRenewReqMsg.autoRenewFlag = '0'; /* CHECK */
		else
			tdRenewReqMsg.autoRenewFlag = tdLogRec.autoRenewFlag;
		tdRenewReqMsg.nullPad = '\0';
		sprintf(tmpStr, "%04d", strlen(tdRenewReqMsg.msgLen));
		strncpy(tdRenewReqMsg.msgLen, tmpStr, 4);

		fprintf(logFp, "%s|%5d|: Send to TUXEDO [%s] \n", getDateTime(), PID, tdRenewReqMsg.msgLen);
		fflush(logFp);

		if ( dealWithTuxedo("TIMEDEPRENEW", tdRenewReqMsg.msgLen, tdRenewResponseMsg.msgLen) == FAILURE )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, tdRenewResponseMsg.msgLen);
		fflush(logFp);

		if ( strncmp(tdRenewResponseMsg.responseStatus, "00", 2) == 0 ) /* Success */
		{
			memset(responseMsg.timeDepositApproval.msgLen, ' ', sizeof responseMsg.timeDepositApproval);
			responseMsg.timeDepositApproval.appRejectFlag = receivedMsg.timeDepositApproval.appRejectFlag;
			strncpy(responseMsg.timeDepositApproval.tdAccNo, receivedMsg.timeDepositApproval.accNo, 14);
			/*strncpy(responseMsg.timeDepositApproval.intRate, tdRenewResponseMsg.intRate, 9);*/

			tdLogRec.bmUpdateStatus = '9' ; /* Completed */
			strncpy(tdLogRec.supervisorId, receivedMsg.timeDepositApproval.supervisorId, 10);

			strncpy(tdLogRec.lastUpdateUser, receivedMsg.timeDepositApproval.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(tdLogRec.lastUpdateDateTime, tmpStr, 14);

			if( isRewcurr(tdLogFile, &tdLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d| ISREWCURR error %d on sttdlog for key=%.28s\n", getDateTime(), PID, iserrno, tdLogRec.branchCode);
				fflush(logFp);
				if  ( iserrno == 100 )
				{
					sprintf(tmpStr, "Duplicate record [%.28s] on sttdlog", tdLogRec.branchCode);
					formatBranchResponse( DUPLICATE,tmpStr , tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on sttdlog" );
					formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on sttdlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrelease(tdLogFile);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isrelease(tdLogFile);

			/* write the account log for history purpose */

			memset(&gldRec.liveChar, ' ', sizeof gldRec);
			strncpy(gldRec.accNo, actualToBmAcc(receivedMsg.timeDepositApproval.accNo, tmpStr), 13);
			isindexinfo(gldFile, &gldKey, 1);

			if ( isRead(gldFile, &gldRec.liveChar, ISEQUAL) == 0 )
			{
				memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
				acctLogRec.liveChar = '@';
				strncpy(acctLogRec.branchCode, tdLogRec.branchCode, 4);
				strncpy(acctLogRec.userId, tdLogRec.userId, 10);
				strncpy(acctLogRec.dateTime, tdLogRec.dateTime, 14);
				strncpy(acctLogRec.accNo, tdLogRec.tdAccNo, 14);
				acctLogRec.newOrUpdate = 'U';
				strncpy(acctLogRec.supervisorId, tdLogRec.supervisorId, 10);
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
				strncpy(acctLogRec.acctDesc, gldRec.accDesc, 30);

				acctLogRec.statusChanged = '0'; /* NO */
				strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
				strncpy(acctLogRec.lastUpdateUser, tdLogRec.supervisorId, 10);

				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processTimeDepositApproval] Before writing to acctLogFile (%d) ..\n", getDateTime(), PID, acctLogFile);
					fflush(logFp);
				}
				if ( isWrite(acctLogFile, &acctLogRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processTimeDepositApproval] ISWRITE error %d occured on stacclog for the acc # [%.14s] [%.13s] IGNORED \n", getDateTime(), PID, iserrno, acctLogRec.accNo, gldRec.accNo);
					fflush(logFp);
				}
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processTimeDepositApproval] ISREAD/ISEQUAL error %d occured on gld0data for the acc # [%.14s] [%.13s] IGNORED \n", getDateTime(), PID, iserrno, tdRenewReqMsg.accNo, gldRec.accNo);
				fflush(logFp);
			}
			formatTimeDepositApprovalResponse(DONE, "Successful", "Successful");
			sendResponse(responseMsg.timeDepositApproval.msgLen);
			return SUCCESS;
		}
		else 
		{
			fprintf(logFp, "%s|%5d| Error [%.2s][%.30s] received from Tuxedo service [TIMEDEPRENEW]; Please check.\n", getDateTime(), PID, tdRenewResponseMsg.responseStatus, tdRenewResponseMsg.errorDescription);
			fflush(logFp);
			sprintf(tmpStr, "Error from BM: %.2s %.30s", tdRenewResponseMsg.responseStatus, tdRenewResponseMsg.errorDescription);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	return SUCCESS;
}

readTdLogFile(int mode)
{
	char tmpStr[55];

	fprintf(logFp, "%s|%5d|[readTdLogFile] for key value %.28s\n", getDateTime(), PID, tdLogRec.branchCode);
	fflush(logFp);
	if ( isRead(tdLogFile, &tdLogRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readTddLogFile] : ISREAD/%s error %d on sttdlog for the key=%.28s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, tdLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Record not found with this key ");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr ); 
		}
		else if ( iserrno == 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatBranchResponse(END_OF_FILE, tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on sttdlog file");
			formatBranchResponse(RECORD_LOCKED,  tmpStr, tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on sttdlog file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}


openTdLogFile(int mode)
{
	char tmpStr[100];
	if ( tdLogFileOpen == YES ) 
		return SUCCESS;

	/* Open the corresponding letter file */
	if ( (tdLogFile = isopen(tdLogFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openTdLogFile] ISOPEN error %d for %s File \n",getDateTime(), PID, iserrno, tdLogFilePath);
		sprintf(tmpStr, "Error  %d occured while opening sttdlog", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(tdLogFile, &tdLogKey, 1);

	tdLogFileOpen = YES;
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| CSD Time Deposit log file (sttdlog) (%d) successfully opened...\n", getDateTime(), PID, tdLogFile);
		fflush(logFp);
	}
	return SUCCESS;
}

formatTimeDepositDetailResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTimeDepositDetailResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.timeDepositDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.timeDepositDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.timeDepositDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.timeDepositDetail.service, receivedMsg.timeDepositDetail.service, 2);
	responseMsg.timeDepositDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.timeDepositDetail.msgLen));
	strncpy(responseMsg.timeDepositDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTimeDepositApprovalResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTimeDepositApprovalResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.timeDepositApproval.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.timeDepositApproval.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.timeDepositApproval.eRemarks,tmpStr,50);
	strncpy(responseMsg.timeDepositApproval.service, receivedMsg.timeDepositApproval.service, 2);
	responseMsg.timeDepositApproval.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.timeDepositApproval.msgLen));
	strncpy(responseMsg.timeDepositApproval.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTimeDepositIntRateEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTimeDepositIntRateEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.timeDepositIntRateEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.timeDepositIntRateEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.timeDepositIntRateEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.timeDepositIntRateEnq.service, receivedMsg.timeDepositIntRateEnq.service, 2);
	responseMsg.timeDepositIntRateEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.timeDepositIntRateEnq.msgLen));
	strncpy(responseMsg.timeDepositIntRateEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTimeDepositPendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTimeDepositPendingListResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.timeDepositPendingList.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.timeDepositPendingList.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.timeDepositPendingList.eRemarks,tmpStr,50);
	strncpy(responseMsg.timeDepositPendingList.service, receivedMsg.timeDepositPendingList.service, 2);
	responseMsg.timeDepositPendingList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.timeDepositPendingList.msgLen));
	strncpy(responseMsg.timeDepositPendingList.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logTdIntRateEnqDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Time Deposit Int.Rate Enquiry]\n", receivedMsg.timeDepositIntRateEnq.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.timeDepositIntRateEnq.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.timeDepositIntRateEnq.userId);
	fprintf(logFp, "Time Deposit Ledger : %.5s\n", receivedMsg.timeDepositIntRateEnq.tdLedger);
	fprintf(logFp, "TD Currency         : %.2s\n", receivedMsg.timeDepositIntRateEnq.tdCurrency);
	fprintf(logFp, "Deposit Amount      : %.15s\n", receivedMsg.timeDepositIntRateEnq.depositAmt);
	fprintf(logFp, "Tenor Type          : %c\n", receivedMsg.timeDepositIntRateEnq.tenorType);
	fprintf(logFp, "Tenor               : %.3s\n", receivedMsg.timeDepositIntRateEnq.tenor);
	fprintf(logFp, "Debit Account No.   : %.14s\n", receivedMsg.timeDepositIntRateEnq.debitAccNo);
	fflush(logFp);
	return 0;
}

logTimeDepositRequestDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service                : %.2s[Time Deposit Request]\n", receivedMsg.timeDeposit.service);
	fprintf(logFp, "Branch Code            : %.4s\n", receivedMsg.timeDeposit.homeBranch);
	fprintf(logFp, "User Id                : %.10s\n", receivedMsg.timeDeposit.userId);
	fprintf(logFp, "Date & Time            : %.14s\n", receivedMsg.timeDeposit.dateTime);
	fprintf(logFp, "Creation or Update     : %c\n", receivedMsg.timeDeposit.creationOrUpdate);
	fprintf(logFp, "New or update          : %c\n", receivedMsg.timeDeposit.newOrUpdate);
	fprintf(logFp, "Account Number         : %.14s\n", receivedMsg.timeDeposit.accNo);
	fprintf(logFp, "Supervisor Id          : %.10s\n", receivedMsg.timeDeposit.supervisorId);
	fprintf(logFp, "Customer Number        : %.7s\n", receivedMsg.timeDeposit.custNo);
	fprintf(logFp, "Time Deposit Ledger    : %.3s\n", receivedMsg.timeDeposit.tdLedger);
	fprintf(logFp, "TD Currency            : %.2s\n", receivedMsg.timeDeposit.tdCurrency);
	fprintf(logFp, "Deposit Amount         : %.14s\n", receivedMsg.timeDeposit.depositAmt);
	fprintf(logFp, "Tenor Type             : %c\n", receivedMsg.timeDeposit.tenorType);
	fprintf(logFp, "Tenor                  : %.3s\n", receivedMsg.timeDeposit.tenorPeriod);
	fprintf(logFp, "Debit Account No.      : %.14s\n", receivedMsg.timeDeposit.debitAccNo);
	fprintf(logFp, "Funding Int. Rate      : %.9s\n", receivedMsg.timeDeposit.fundIntRate);
	fprintf(logFp, "Exchange Rate          : %.14s\n", receivedMsg.timeDeposit.exRate);
	fprintf(logFp, "BM Funding Int. Rate   : %.9s\n", receivedMsg.timeDeposit.bmFundIntRate);
	fprintf(logFp, "BM Exchange Rate       : %.14s\n", receivedMsg.timeDeposit.bmExRate);
	fprintf(logFp, "Maturity Amount        : %.14s\n", receivedMsg.timeDeposit.maturityAmt);
	fprintf(logFp, "Maturity Date          : %.8s\n", receivedMsg.timeDeposit.maturityDate);
	fprintf(logFp, "Override Int.Rate      : %c\n", receivedMsg.timeDeposit.overrideIntRate);
	fprintf(logFp, "Override Ex.Rate       : %c\n", receivedMsg.timeDeposit.overrideExRate);
	fprintf(logFp, "Auto Renew Flag        : %c\n", receivedMsg.timeDeposit.autoRenewFlag);
	fflush(logFp);
	return 0;
}

logTimeDepositPendingListDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Time Deposit Pending List]\n", receivedMsg.timeDepositPendingList.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.timeDepositPendingList.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.timeDepositPendingList.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.timeDepositPendingList.lastRecCount);
	fprintf(logFp, "Activity Flag   : %c\n", receivedMsg.timeDepositPendingList.activityFlag);
	fflush(logFp);
	return 0;
}

logTimeDepositDetailRequest()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Time Deposit Detail]\n", receivedMsg.timeDepositDetail.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.timeDepositDetail.homeBranch);
	fprintf(logFp, "Request Type    : %.2s\n", receivedMsg.timeDepositDetail.requestType);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.timeDepositDetail.userId);
	fprintf(logFp, "Date & Time     : %.14s\n", receivedMsg.timeDepositDetail.dateTime);
	fprintf(logFp, "Customer Number : %.7s\n", receivedMsg.timeDepositDetail.custNo);
	fflush(logFp);
	return 0;
}

logTimeDepositApprovalDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Time Deposit Approval]\n", receivedMsg.timeDepositApproval.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.timeDepositApproval.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.timeDepositApproval.userId);
	fprintf(logFp, "Date & Time     : %.14s\n", receivedMsg.timeDepositApproval.dateTime);
	fprintf(logFp, "Approve/Reject flag  : %c\n", receivedMsg.timeDepositApproval.appRejectFlag);
	fprintf(logFp, "Account Number  : %.14s\n", receivedMsg.timeDepositApproval.accNo);
	fprintf(logFp, "Customer Number : %.7s\n", receivedMsg.timeDepositApproval.custNo);
	fprintf(logFp, "Supervisor Id	: %.10s\n", receivedMsg.timeDepositApproval.supervisorId);
	fprintf(logFp, "Supervisor Comments	: %.200s\n", receivedMsg.timeDepositApproval.supervisorComments);
	fprintf(logFp,"New Or Update flag	: %c\n", receivedMsg.timeDepositApproval.newOrUpdate);
	fflush(logFp);
	return 0;
}
