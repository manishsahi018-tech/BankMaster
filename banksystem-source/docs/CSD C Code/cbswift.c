/*
	Objective       :       Static data management server 
				            (included for SARIE/SWIFT transfer Enquiry )

	Date            :       14/08/2004.

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

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

#define SWIFT_PENDING 		1
#define SWIFT_COMPLETED		2
#define SWIFT_REJECTED		3
#define SWIFT_SUMMARY 		4

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, ridKey, thdKey, thd1Key, aadKey, bkdKey, arrBlkKey, swiftLogKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, ridFile, thdFile, thd1File, aadFile, bkdFile, arrBlkFile, swiftLogFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *aadFilePath, *bkdFilePath, *arrBlkFilePath, *swiftLogFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];

extern FILE *logFp, *errLogFp;

struct 	rid0data					ridRec;
struct 	crd0data					crdRec;
struct 	customerInfo				custTabRec;
struct 	branchInfo  				branchRec;
struct	thd0data					thdRec ;
struct	thd1data 					thdRec1;
struct 	gld0data					gldRec;
struct	stswiftlog					swiftLogRec;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;

char            *getpath();
char            *getDateTime();
double          bmAmtToDbl();
char            *dblToBmAmt();
char            *bmCustToAcutal();
char            *doubleToPack();
double          packToDouble();

extern char swiftCentralizedBranches[4000];
extern char swiftContraAccNo[15];
extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, aadFileOpen, bkdFileOpen, arrBlkFileOpen, swiftLogFileOpen, ridFileOpen;

int stTransferEnquiry(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stTransferEnquiry]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "82", 2) == 0 ) /* SWIFT/SARIE transfer enquiry */ 
	{
		logTransferEnqDetails();

		if ( openRidFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processTransferEnq() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "83", 2) == 0 ) /* SWIFT/SARIE transfer detail request */ 
	{
		logTransferDetailRequest();

		if ( openRidFile(ISMANULOCK+ISINOUT) < 0 )
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

		if ( openSwiftLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( strncmp(receivedMsg.transferDetail.requestType, "02", 2) == 0 )
		{
			if ( processSwiftTransferPendingDetail() == FAILURE )
				return FAILURE;
		}
		else
		{
			if ( processTransferDetail() == FAILURE )
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6], "84", 2) == 0 ) /* Bankmaster transaction detail request */ 
	{
		logBmTransDetailRequest();

		if ( openThdFile(ISMANULOCK+ISINPUT) < 0 )
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

		if ( processBmTransDetail() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "85", 2) == 0 ) /* Bankmaster transaction enquiry request */ 
	{
		logBmTransEnqDetails();

		if ( openThdFile(ISMANULOCK+ISINPUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processBmTransEnq() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AN", 2) == 0 ) /* Branch SWIFT transfer enquiry */ 
	{
		logBranchSwiftTransferDetails();

		if ( openRidFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processBranchSwiftTransfer() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AO", 2) == 0 ) /* Centre enters SWIFT transfer detail */ 
	{
		logSwiftTransferDetails();

		if ( openRidFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSwiftLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSwiftTransferRequest() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AP", 2) == 0 ) /* Get Swift tranfer pending list for CENTRAL UNIT*/
	{
		logSwiftCentrePendingList();

		if ( openSwiftLogFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readSwiftPendingList() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AQ", 2) == 0 ) /* Swift transfer Approval */
	{
		logSwiftTransferApprovalDetails();

		if ( processSwiftTransferApproval(receivedMsg.swiftTransferApproval.appRejectFlag) == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AR", 2) == 0 ) /* Swift tranfer report for CENTRAL UNIT*/
	{
	}
	else if ( strncmp(&headerBuf[6], "AS", 2) == 0 ) /* Swift tranfer enquiry */
	{
		logSwiftCentreEnquiryDetails();

		if ( receivedMsg.swiftTransferEnq.requestType == '0' ) /* Swift Transfer initiated from branches */
		{
			if ( openRidFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processSwiftTransferBranchEnq() == FAILURE )
				return FAILURE;
		}
		else if ( receivedMsg.swiftTransferEnq.requestType <= '4' )
		{
			if ( openSwiftLogFile(ISMANULOCK+ISINOUT) < 0 ) 
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processSwiftTransferCentreEnq() == FAILURE )
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

processBranchSwiftTransfer()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	char *tmpPtr;
	double transAmt;
	int  noOfIterations=0;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processBranchSwiftTransfer]  Entered......\n", getDateTime(), PID);

	if ( strncmp(swiftCentralizedBranches, "                 ", 15) == 0 )
		getSwiftCentralizedBranch();

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| [processBranchSwiftTransfer] : Swift transfer centralized branches [%s]\n", getDateTime(), PID, swiftCentralizedBranches);
		fflush(logFp);
	}

	memset(responseMsg.branchSwiftTransfers.msgLen, ' ', sizeof responseMsg.branchSwiftTransfers);
	responseMsg.branchSwiftTransfers.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.branchSwiftTransfers.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&branchRec.liveChar, ' ', sizeof branchRec);
	memset(&ridRec.liveChar, ' ', sizeof ridRec);

	isindexinfo(ridFile, &ridKey, 10);
	ridRec.statusFlag = 'I';  /* Extract all the records with ISSUE status */
	isstart(ridFile, &ridKey, 1, &ridRec.liveChar, ISGTEQ);

	while ( isread(ridFile, &ridRec.liveChar, ISNEXT) == 0 )
	{
		noOfIterations++;
		if ( noOfIterations > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}

		if ( ridRec.statusFlag != 'I' )
			break;

		if ( strncmp(&ridRec.crAccNo[2], swiftContraAccNo, 11) )
			continue;

		sprintf(tmpStr, "~%.4s", ridRec.branchCode);
		if ( (tmpPtr=strstr(swiftCentralizedBranches, tmpStr)) == NULL )/* skip if the branch is not defined as swift transfer centralized */
			continue;

		if ( strncmp(receivedMsg.branchSwiftTransfers.reqdDate, "            ", 8) )
		{
			bmDateToActual(ridRec.issueDate, tmpStr);
			if ( strncmp(tmpStr, receivedMsg.branchSwiftTransfers.reqdDate, 8) )
				 continue;
		}

		if ( strncmp(receivedMsg.branchSwiftTransfers.branchCode, "      ", 4) )
		{
			if ( strncmp(ridRec.branchCode, receivedMsg.branchSwiftTransfers.branchCode, 4) )
				 continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].branchCode, ridRec.branchCode, 4);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].transRefNo, ridRec.transRef, 10);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].transDate,  bmDateToActual(ridRec.issueDate,tmpStr), 8);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].valueDate,  bmDateToActual(ridRec.valueDate,tmpStr), 8);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].drAccNo, bmAccToActual(ridRec.drAccNo,tmpStr), 14);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].crAccNo, bmAccToActual(ridRec.crAccNo,tmpStr), 14);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].transCurr, ridRec.transCurrCode, 3);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].transAmt, ridRec.netAmt, 14);
		strncpy(responseMsg.branchSwiftTransfers.details[recsInThisMsg].senderName, ridRec.totAmt, 30);
		responseMsg.branchSwiftTransfers.details[recsInThisMsg].recordStatus = ridRec.statusFlag;

		if ( ++recsInThisMsg >= 20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.branchSwiftTransfers.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.branchSwiftTransfers.noOfRecs, tmpStr, 2);
	responseMsg.branchSwiftTransfers.details[recsInThisMsg+1].branchCode[0] = '\0';

	formatBranchSwiftTransferResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.transferEnq.msgLen);
	return SUCCESS;
}

processTransferEnq()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	double transAmt;
	int  noOfIterations=0;
	int completionFlag=YES;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processTransferEnq]  Entered......\n", getDateTime(), PID);


	memset(responseMsg.transferEnq.msgLen, ' ', sizeof responseMsg.transferEnq);
	responseMsg.transferEnq.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.transferEnq.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&ridRec.liveChar, ' ', sizeof ridRec);
	strncpy(ridRec.issueDate, actualToBmDate(receivedMsg.transferEnq.fromDate,tmpStr), 6);

	isindexinfo(ridFile, &ridKey, 4);
	isstart(ridFile, &ridKey, 6, &ridRec.liveChar, ISGTEQ);

	completionFlag=YES;
	while ( isread(ridFile, &ridRec.liveChar, ISNEXT) == 0 )
	{
		noOfIterations++;
		if ( noOfIterations > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}
		bmDateToActual(ridRec.issueDate, tmpStr);
		if ( strncmp(tmpStr, receivedMsg.transferEnq.toDate, 8) > 0 )
			 break;

		if ( strncmp(receivedMsg.transferEnq.bpRefNo, "             ", 10) )
		{
			if ( strncmp(ridRec.transRef, receivedMsg.transferEnq.bpRefNo, 10) )
				continue;
		}
		else
		{
			if ( receivedMsg.transferEnq.recordStatus != 'A' )
			{
				if ( ridRec.statusFlag != receivedMsg.transferEnq.recordStatus )
					continue;
			}
		}

		if ( strncmp(receivedMsg.transferEnq.accNo, bmAccToActual(ridRec.crAccNo, tmpStr), 14) )
			continue;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( recsInThisMsg < 20 )
		{
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].transRefNo, ridRec.transRef, 10);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].issueDate,  bmDateToActual(ridRec.issueDate,tmpStr), 8);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].valueDate,  bmDateToActual(ridRec.valueDate,tmpStr), 8);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].drAccNo, bmAccToActual(ridRec.drAccNo,tmpStr), 14);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].transCurr, ridRec.transCurrCode, 3);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].transAmt, ridRec.netAmt, 14);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].paymentCurr, ridRec.payCurrCode, 3);
			strncpy(responseMsg.transferEnq.details[recsInThisMsg].paymentAmt, ridRec.payAmt, 14);
			responseMsg.transferEnq.details[recsInThisMsg].recordStatus = ridRec.statusFlag;
			recsInThisMsg++;
		}
		else
			completionFlag = NO;
	}
	sprintf(tmpStr, "%05d", recCount);
	strncpy(responseMsg.transferEnq.totNoOfTrans, tmpStr, 5);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.transferEnq.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.transferEnq.noOfRecs, tmpStr, 2);
	if ( completionFlag == YES )
		responseMsg.transferEnq.completionFlag = '1';
	else
		responseMsg.transferEnq.completionFlag = '0';
	strncpy(responseMsg.transferEnq.accNo, receivedMsg.transferEnq.accNo, 14);

	formatTransferEnquiryResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.transferEnq.msgLen);
	return SUCCESS;
}

processSwiftTransferPendingDetail()
{
	char tmpStr[100], tAccNo[20], tBmAccNo[20];
	int  ridRecFound=NO;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSwiftTransferPendingDetail]\n", getDateTime(), PID);


	memset(responseMsg.transferDetail.msgLen, ' ', sizeof responseMsg.transferDetail);
	memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);

	strncpy(swiftLogRec.userId, receivedMsg.transferDetail.userId, 10);
	strncpy(swiftLogRec.branchCode, receivedMsg.transferDetail.branchCode, 4);
	strncpy(swiftLogRec.dateTime, receivedMsg.transferDetail.dateTime,14);

	isindexinfo(swiftLogFile, &swiftLogKey, 1);
	if( isstart(swiftLogFile, &swiftLogKey, 0, &swiftLogRec.liveChar,ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferPendingDetail] ISSTART/ISEQUAL error %d occured on stswiftLog for key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatTimeDepositDetailResponse(END_OF_FILE, "Record not found on stswiftlog...report to SUPPORT   ", "Record not found on stswiftlog...report to SUPPORT  ");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
			formatTimeDepositDetailResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.transferDetail.msgLen);
		return FAILURE;
	}

	if ( readSwiftLogFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.transferDetail.msgLen);
		return FAILURE ;
	}

	strncpy(responseMsg.transferDetail.accNo, swiftLogRec.crAccNo, 14);
	strncpy(responseMsg.transferDetail.drAccNo, swiftLogRec.applicantAccNo, 14);
	strncpy(responseMsg.transferDetail.transRefNo, swiftLogRec.transRefNo, 10);
	strncpy(responseMsg.transferDetail.issueDate, swiftLogRec.issueDate, 8);
	strncpy(responseMsg.transferDetail.valueDate, swiftLogRec.valueDate, 8);
	strncpy(responseMsg.transferDetail.transCurrCode, swiftLogRec.transCurrCode, 3);
	strncpy(responseMsg.transferDetail.paymentCurrCode, swiftLogRec.paymentCurrCode, 3);
	strncpy(responseMsg.transferDetail.transAmt, swiftLogRec.transAmt, 14); 
	strncpy(responseMsg.transferDetail.paymentAmt, swiftLogRec.paymentAmt, 14);

	strncpy(responseMsg.transferDetail.applicantName, swiftLogRec.applicantName, 30);
	strncpy(responseMsg.transferDetail.benefName, swiftLogRec.benefName, 30);
	strncpy(responseMsg.transferDetail.benefAddr1, swiftLogRec.benefAddress1, 35);
	strncpy(responseMsg.transferDetail.benefAddr2, swiftLogRec.benefAddress2, 35);
	strncpy(responseMsg.transferDetail.benefAddr3, swiftLogRec.benefAddress3, 35);

	strncpy(responseMsg.transferDetail.branchCode, swiftLogRec.issueBranchCode, 4);
	strncpy(responseMsg.transferDetail.message1, swiftLogRec.message1, 35);
	strncpy(responseMsg.transferDetail.message2, swiftLogRec.message2, 35);
	strncpy(responseMsg.transferDetail.message3, swiftLogRec.message3, 35);
	strncpy(responseMsg.transferDetail.message4, swiftLogRec.message4, 35);
	/*strncpy(responseMsg.transferDetail.benefBank, swiftLogRec.benefBankName, 35);*/
	strncpy(responseMsg.transferDetail.coveringBank, swiftLogRec.benefBankName, 35);

	sprintf(tmpStr, "%.7s", &responseMsg.transferDetail.accNo[5]);
	if ( getCustName(tmpStr) == SUCCESS )
	{
		if ( strncmp(custTabRec.aShortName, "                                 ", 30) == 0 )
			strncpy(responseMsg.transferDetail.custName, custTabRec.eShortName, 30);
		else
			strncpy(responseMsg.transferDetail.custName, custTabRec.aShortName, 30);
	}

	strncpy(responseMsg.transferDetail.transferPurpose, swiftLogRec.transferPurpose, 2);

	strncpy(responseMsg.transferDetail.applicantAddr1, swiftLogRec.applicantAddress1, 35);
	strncpy(responseMsg.transferDetail.applicantAddr2, swiftLogRec.applicantAddress2, 35);
	strncpy(responseMsg.transferDetail.applicantIdNo, swiftLogRec.applicantIdNo, 15); 
	strncpy(responseMsg.transferDetail.applicantAddr3, swiftLogRec.applicantAddress3, 35);
	strncpy(responseMsg.transferDetail.applicantCountryCode, swiftLogRec.applicantNationality, 3); 
	responseMsg.transferDetail.ibanOrAccNo = swiftLogRec.ibanOrAccNo;
	strncpy(responseMsg.transferDetail.benefAccNo, swiftLogRec.benefAccNo, 35);
	strncpy(responseMsg.transferDetail.benefNationality, swiftLogRec.benefCountryCode, 3);
	strncpy(responseMsg.transferDetail.benefAddr3, swiftLogRec.benefAddress3, 35);
	strncpy(responseMsg.transferDetail.benefBankAddr1, swiftLogRec.benefBankAddress1, 35);
	strncpy(responseMsg.transferDetail.benefBankAddr2, swiftLogRec.benefBankAddress2, 35);
	strncpy(responseMsg.transferDetail.benefBankBICcode, swiftLogRec.benefBankBIC, 11);

	strncpy(responseMsg.transferDetail.exchangeRate, swiftLogRec.exchangeRate, 12);

	strncpy(responseMsg.transferDetail.bankSortCode, swiftLogRec.bankSortCode, 35);
	strncpy(responseMsg.transferDetail.supervisorComments, swiftLogRec.supervisorComments, 200);
	strncpy(responseMsg.transferDetail.supervisorId, swiftLogRec.supervisorId, 10);

	formatTransferDetailResponse(DONE, "Successful...", "Successful....");
	sendResponse(responseMsg.transferDetail.msgLen);
	return SUCCESS;
}

processSwiftTransferApproval(char reqAction) 
{
	char tmpStr[200], *isLogPathName;
	char tCardNo[25];
	int  isappLogFp ;
	long oldSigMask;
	int i, ridRecFound=NO, ridUpdReqd=NO;
	char *tmpPtr;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval]\n", getDateTime(), PID);

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	readBankingDate();

	/* If ForwardedToTeller or Rejected the changes; just update the log file */

	if( reqAction != SUP_ACCEPTED ) 
	{
		if ( openSwiftLogFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openRidFile(ISMANULOCK+ISINOUT) < 0 ) 
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/*Update stswiftlog file to include supervisorId and his comments*/

		memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);

		strncpy(swiftLogRec.branchCode, receivedMsg.swiftTransferApproval.homeBranch,4);
		strncpy(swiftLogRec.userId, receivedMsg.swiftTransferApproval.userId, 10);
		strncpy(swiftLogRec.dateTime, receivedMsg.swiftTransferApproval.dateTime,14);
		isindexinfo(swiftLogFile, &swiftLogKey, 1);
		if ( isstart(swiftLogFile, &swiftLogKey, 0, &swiftLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferApproval]: ISSTART error %d on stswiftlog for the key [%.28s] \n", getDateTime(), PID, iserrno, swiftLogRec.branchCode);
			fflush(logFp);
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				 formatBranchResponse(END_OF_FILE,"No block Record(s) found for this key ....", "No block Record(s) found for this key ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stswiftlog file", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readSwiftLogFile(ISEQUAL+ISLOCK) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( swiftLogRec.bmUpdateStatus == '9' || swiftLogRec.bmUpdateStatus == '3') /* Completed or Rejected */
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] This swift transfer record has already been approved by %.10s\n", getDateTime(), PID, swiftLogRec.supervisorId);
			fflush(logFp);
			sprintf(tmpStr," This Record has been already approved by %.10s", swiftLogRec.supervisorId);
			isrelease(swiftLogFile);
			formatBranchResponse(INCORRECTMSG,tmpStr,tmpStr); 
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		if ( reqAction == 'R' )
		{
			isindexinfo(ridFile, &ridKey, 1);
			memset(&ridRec.liveChar, ' ', sizeof ridRec);
			strncpy(ridRec.transRef, swiftLogRec.transRefNo, 10);

			if ( isstart (ridFile, &ridKey, 0, &ridRec.liveChar, ISGTEQ) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISSTART/ISGTEQ error %d occured on stswiftlog for the trans.Ref.No.[%.10s] IGNORED..\n", getDateTime(), PID, iserrno, ridRec.transRef);
				fflush(logFp);
			}

			ridRecFound=NO;
			while ( isRead(ridFile, &ridRec.liveChar, ISNEXT+ISLOCK) == 0 )
			{
				if (  strncmp(ridRec.transRef, swiftLogRec.transRefNo, 10) )
				{
					isrelease(ridFile);
					break;
				}

				if ( strncmp(bmDateToActual(ridRec.issueDate, tmpStr), swiftLogRec.issueDate, 8) )
				{
					isrelease(ridFile);
					continue;
				}

				ridRecFound=YES;
				break;
			}

			if ( ridRecFound == NO )
			{
				isrelease(ridFile);
				ridUpdReqd=NO;
			}
			else
				ridUpdReqd=YES;
		}

		if ( reqAction == 'F' ) /* supervisor forwarded the request to CSO */
			swiftLogRec.bmUpdateStatus = '2';  /* 2 is for Pending with Teller */
		else
			swiftLogRec.bmUpdateStatus = '3';  /* 3 is for Rejecting the entry */

		strncpy(swiftLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(swiftLogRec.supervisorId, receivedMsg.swiftTransferApproval.supervisorId,10);
		strncpy(swiftLogRec.supervisorComments, receivedMsg.swiftTransferApproval.supervisorComments, 200);
		strncpy(swiftLogRec.lastUpdateUser, receivedMsg.swiftTransferApproval.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(swiftLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(swiftLogFile, &swiftLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISREWCURR error %d on stswiftlog  for the key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",swiftLogRec.branchCode);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stswiftlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrelease(swiftLogFile); isrelease(ridFile);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		isrelease(swiftLogFile);

		if ( reqAction == 'R' && ridUpdReqd == YES )
		{
			ridRec.statusFlag = 'D'; /* D-Cancelled */

			if ( isRewcurr(ridFile, &ridRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISREWCURR error %d on rid0data  for the trans. reference number [%.10s]\n", getDateTime(), PID, iserrno, ridRec.transRef );
				fflush(logFp);
				if  ( iserrno == 100 || iserrno == 108 )
				{
					sprintf(tmpStr, "Duplicate record [%.10s]", ridRec.transRef);
					formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on rid0data" );
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{ 
					sprintf(tmpStr, "CISAM Error %d occured on rid0data", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrelease(ridFile); 
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isrelease(ridFile); 
		}
		closeAllFiles();
		formatBranchResponse(DONE, "Successful", "Successful");
		sendResponse(responseMsg.customer.msgLen);
		return SUCCESS;
	}

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

	/* Portion introduced for atomic update */

	if ( swiftLogFileOpen == YES )
	{
		isclose(swiftLogFile); 
		swiftLogFileOpen=NO;
	}

	if ( ridFileOpen == YES )
	{
		isclose(ridFile); 
		ridFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval]Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] ISBEGIN error %d;  while approving swift transfer \n", getDateTime(), PID, iserrno);
		sprintf(tmpStr, "ISBEGIN error %d while while new blocking", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openSwiftLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openRidFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(swiftLogFile);
		swiftLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	responseMsg.customer.nullPad = '\0';

	memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);

	strncpy(swiftLogRec.branchCode, receivedMsg.swiftTransferApproval.homeBranch,4);
	strncpy(swiftLogRec.userId, receivedMsg.swiftTransferApproval.userId, 10);
	strncpy(swiftLogRec.dateTime, receivedMsg.swiftTransferApproval.dateTime,14);
	isindexinfo(swiftLogFile, &swiftLogKey, 1);
	if ( isstart(swiftLogFile, &swiftLogKey, 0, &swiftLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval]: ISSTART error %d on stswiftlog for the key [%.28s] \n", getDateTime(), PID, iserrno, swiftLogRec.branchCode);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			 formatBranchResponse(END_OF_FILE,"No block Record(s) found for this key ....", "No block Record(s) found for this key ....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog file", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( readSwiftLogFile(ISEQUAL+ISLOCK) < 0 )
	{
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( swiftLogRec.bmUpdateStatus == '9' || swiftLogRec.bmUpdateStatus == '3') /* Completed or Rejected */
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] This swift transfer record has already been approved by %.10s\n", getDateTime(), PID, swiftLogRec.supervisorId);
		fflush(logFp);
		sprintf(tmpStr," This Record has been already approved by %.10s", swiftLogRec.supervisorId);
		formatBranchResponse(INCORRECTMSG, tmpStr, tmpStr); 
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	swiftLogRec.bmUpdateStatus = '9'; /* Completed */

	strncpy(swiftLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(swiftLogRec.supervisorId, receivedMsg.swiftTransferApproval.supervisorId, 10);	
	strncpy(swiftLogRec.lastUpdateUser, receivedMsg.swiftTransferApproval.supervisorId, 10);
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(swiftLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( isRewcurr(swiftLogFile, &swiftLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISREWCURR error %d on stswiftlog  for the key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode );
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.28s]",swiftLogRec.branchCode);
			formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stswiftlog" );
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{ 
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		isrollback();
		isrelease(swiftLogFile); 
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	isrelease(swiftLogFile); 

	isindexinfo(ridFile, &ridKey, 1);
	memset(&ridRec.liveChar, ' ', sizeof ridRec);
	strncpy(ridRec.transRef, swiftLogRec.transRefNo, 10);

	if ( isstart (ridFile, &ridKey, 0, &ridRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISSTART/ISGTEQ error %d occured on stswiftlog for the trans.Ref.No.[%.10s] IGNORED..\n", getDateTime(), PID, iserrno, ridRec.transRef);
		fflush(logFp);
	}

	ridRecFound=NO;
	while ( isRead(ridFile, &ridRec.liveChar, ISNEXT+ISLOCK) == 0 )
	{
		if (  strncmp(ridRec.transRef, swiftLogRec.transRefNo, 10) )
		{
			isrelease(ridFile);
			break;
		}

		if ( strncmp(bmDateToActual(ridRec.issueDate, tmpStr), swiftLogRec.issueDate, 8) )
		{
			isrelease(ridFile);
			continue;
		}

		ridRecFound=YES;
		break;
	}

	if ( ridRecFound == NO )
	{
		if ( iserrno == 0 )
		{
			sprintf(tmpStr, "Transaction is reversed from branch; Pls.Check");
			formatTransferDetailResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] ISREAD/ISNEXT error %d occured on stswiftlog for transaction reference number [%.10s]\n", getDateTime(), PID, iserrno, swiftLogRec.transRefNo);
			fflush(logFp);
			if  ( iserrno == 111 || iserrno == 112 )
			{
				sprintf(tmpStr, "Transaction is reversed from branch; Pls.Check");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else if ( iserrno = 110 )
			{
				sprintf(tmpStr, "Begining/End of file reached");
				formatBranchResponse(END_OF_FILE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on rid0data");
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on rid0data", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
		}
		isrelease(ridFile);
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		isrollback();
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(ridRec.transferPurpose, swiftLogRec.transferPurpose, 2);
	strncpy(ridRec.totAmt, swiftLogRec.applicantName, 30); 
	strncpy(ridRec.penProxyName, swiftLogRec.benefName, 30);
	strncpy(ridRec.pensionerName, swiftLogRec.benefAddress1, 35);
	strncpy(ridRec.benefAddress2, swiftLogRec.benefAddress2, 35);
	strncpy(ridRec.message1, swiftLogRec.message1, 35);
	strncpy(ridRec.message2, swiftLogRec.message2, 35);
	strncpy(ridRec.message3, swiftLogRec.message3, 35);
	strncpy(ridRec.message4, swiftLogRec.message4, 35);
	strncpy(ridRec.coveringBank1, swiftLogRec.benefBankName, 35);
	strncpy(ridRec.senderLine1, swiftLogRec.applicantAddress1, 35);
	strncpy(ridRec.senderLine2, swiftLogRec.applicantAddress2, 35);
	strncpy(ridRec.senderLine3, swiftLogRec.applicantAddress3, 35);
	strncpy(ridRec.senderLine4, swiftLogRec.applicantIdNo, 15);
	strncpy(ridRec.benefBankBIC, swiftLogRec.applicantNationality, 3); 
	strncpy(ridRec.benefAccNo, swiftLogRec.benefAccNo, 35);
	strncpy(ridRec.benefCountryCode, swiftLogRec.benefCountryCode, 2); 
	strncpy(ridRec.benefAddress3, swiftLogRec.benefAddress3, 35);
	strncpy(ridRec.benefBank1, swiftLogRec.benefBankAddress1, 35);
	strncpy(ridRec.benefAddress5, swiftLogRec.benefBankAddress2, 35);
	strncpy(ridRec.benefBankBICcode, swiftLogRec.benefBankBIC, 11);
	strncpy(ridRec.benefAddress4, swiftLogRec.bankSortCode, 35);

	ridRec.statusFlag1 = 'T'; /* T-Settled */
	ridRec.statusFlag = 'C'; /* C-Confirmed */

	if ( isRewcurr(ridFile, &ridRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval] : ISREWCURR error %d on rid0data  for the trans. reference number [%.10s]\n", getDateTime(), PID, iserrno, ridRec.transRef );
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.10s]", ridRec.transRef);
			formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on rid0data" );
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{ 
			sprintf(tmpStr, "CISAM Error %d occured on rid0data", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isclose(swiftLogFile); isclose(ridFile);
		swiftLogFileOpen=ridFileOpen=NO;
		isrollback();
		isrelease(ridFile); 
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	isrelease(ridFile); 

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferApproval]: ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
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

	isclose(swiftLogFile); isclose(ridFile);
	swiftLogFileOpen=ridFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);

	if ( extraDebug )
	{
		fprintf(logFp, "Supervisor Approval action on swift transfer successful\n");
		fflush(logFp);
	}
	closeAllFiles();
	unlink(isLogPathName);
	free(isLogPathName);
	formatBranchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processSwiftTransferBranchEnq()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i;
	char tmpStr[100], *tmpPtr;
	char tAccNo[20], tCustNo[15];
	double transAmt;
	int  noOfIterations=0;
	int completionFlag=YES;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSwiftTransferBranchEnq]  Entered......\n", getDateTime(), PID);

	memset(responseMsg.swiftTransferEnq.msgLen, ' ', sizeof responseMsg.swiftTransferEnq);
	responseMsg.swiftTransferEnq.nullPad = '\0';

	if ( strncmp(swiftCentralizedBranches, "                 ", 15) == 0 )
		getSwiftCentralizedBranch();

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| [processSwiftTransferBranchEnq] : Swift transfer centralized branches [%s]\n", getDateTime(), PID, swiftCentralizedBranches);
		fflush(logFp);
	}

	sprintf(tmpStr, "%.5s", receivedMsg.swiftTransferEnq.lastRecCount);
	lastRecRcvd = atoi(tmpStr);
	readBankingDate();

	memset(&ridRec.liveChar, ' ', sizeof ridRec);

	isindexinfo(ridFile, &ridKey, 10);
	ridRec.statusFlag = 'I';  /* Extract all the records with ISSUE status */
	isstart(ridFile, &ridKey, 1, &ridRec.liveChar, ISGTEQ);

	while ( isread(ridFile, &ridRec.liveChar, ISNEXT) == 0 )
	{
		noOfIterations++;
		if ( noOfIterations > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}

		if ( ridRec.statusFlag != 'I' )
			break;

		if ( strncmp(&ridRec.crAccNo[2], swiftContraAccNo, 11) )
			continue;

		sprintf(tmpStr, "~%.4s", ridRec.branchCode);
		if ( (tmpPtr=strstr(swiftCentralizedBranches, tmpStr)) == NULL )/* skip if the branch is not defined as swift transfer centralized */
			continue;

		if ( strncmp(receivedMsg.swiftTransferEnq.reqdDate, "            ", 8) )
		{
			bmDateToActual(ridRec.issueDate, tmpStr);
			if ( strncmp(tmpStr, receivedMsg.swiftTransferEnq.reqdDate, 8) )
				 continue;
		}

		if ( strncmp(receivedMsg.swiftTransferEnq.reqdBranch, "      ", 4) )
		{
			if ( strncmp(ridRec.branchCode, receivedMsg.swiftTransferEnq.reqdBranch, 4) )
				 continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].branchCode, ridRec.branchCode, 4);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transRefNo, ridRec.transRef, 10);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transDate,  bmDateToActual(ridRec.issueDate,tmpStr), 8);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].valueDate,  bmDateToActual(ridRec.valueDate,tmpStr), 8);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].drAccNo, bmAccToActual(ridRec.drAccNo,tmpStr), 14);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transCurr, ridRec.transCurrCode, 3);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transAmt, ridRec.netAmt, 14);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].applicantName, ridRec.totAmt, 30);

		if ( ++recsInThisMsg >= 20 )
			break;
	}

	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.swiftTransferEnq.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.swiftTransferEnq.noOfRecs, tmpStr, 2);
	strncpy(responseMsg.swiftTransferEnq.reqdDate, receivedMsg.swiftTransferEnq.reqdDate, 8);
	responseMsg.swiftTransferEnq.requestType =  receivedMsg.swiftTransferEnq.requestType;
	responseMsg.swiftTransferEnq.details[recsInThisMsg+1].branchCode[0] = '\0';
	formatSwiftTransferEnquiryResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.swiftTransferEnq.msgLen);
	return SUCCESS;
}

processSwiftTransferCentreEnq()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	double transAmt;
	int  noOfIterations=0;
	int completionFlag=YES;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSwiftTransferCentreEnq]  Entered......\n", getDateTime(), PID);

	memset(responseMsg.swiftTransferEnq.msgLen, ' ', sizeof responseMsg.swiftTransferEnq);
	responseMsg.swiftTransferEnq.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.swiftTransferEnq.lastRecCount);
	lastRecRcvd = atoi(tmpStr);
	readBankingDate();

	memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);

	isindexinfo(swiftLogFile, &swiftLogKey, 5);
	if ( receivedMsg.swiftTransferEnq.requestType == '1' )
	{
		swiftLogRec.bmUpdateStatus = '9';
		searchType = SWIFT_COMPLETED;	
	}
	else if ( receivedMsg.swiftTransferEnq.requestType == '2' )
	{
		swiftLogRec.bmUpdateStatus = '3';
		searchType = SWIFT_REJECTED ;	
	}
	else  if ( receivedMsg.swiftTransferEnq.requestType == '3' )
	{
		swiftLogRec.bmUpdateStatus = '1';
		searchType = SWIFT_PENDING ;	
	}
	else  
	{
		swiftLogRec.bmUpdateStatus = '1';
		searchType = SWIFT_SUMMARY ;	
	}

	isstart(swiftLogFile, &swiftLogKey, 0, &swiftLogRec.liveChar, ISGTEQ);

	while ( isread(swiftLogFile, &swiftLogRec.liveChar, ISNEXT) == 0 )
	{
		noOfIterations++;
		if ( noOfIterations > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}

		if ( searchType == SWIFT_PENDING )
		{
			if ( swiftLogRec.bmUpdateStatus > '2' )
				break;
		}
		else if ( searchType == SWIFT_COMPLETED )
		{
			if ( swiftLogRec.bmUpdateStatus != '9' )
				break;
		}
		else if ( searchType == SWIFT_REJECTED )
		{
			if ( swiftLogRec.bmUpdateStatus  != '3' )
				break;
		}

		if ( strncmp(receivedMsg.swiftTransferEnq.reqdDate, "            ", 8) )
		{
			if ( strncmp(swiftLogRec.lastUpdateDateTime, receivedMsg.swiftTransferEnq.reqdDate, 8) )
				continue;
		}

		if ( strncmp(receivedMsg.swiftTransferEnq.reqdBranch, "            ", 4) )
		{
			if ( strncmp(swiftLogRec.issueBranchCode, receivedMsg.swiftTransferEnq.reqdBranch, 4)  )
				continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].branchCode, swiftLogRec.issueBranchCode, 4);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transRefNo, swiftLogRec.transRefNo, 10);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transDate,  swiftLogRec.issueDate, 8);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].valueDate,  swiftLogRec.valueDate, 8);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].drAccNo, swiftLogRec.applicantAccNo, 14);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transCurr, swiftLogRec.transCurrCode, 3);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].transAmt, swiftLogRec.transAmt, 14);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].applicantName, swiftLogRec.applicantName, 30);
		responseMsg.swiftTransferEnq.details[recsInThisMsg].pendingStatus = swiftLogRec.bmUpdateStatus;
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].homeBranch, swiftLogRec.branchCode, 4);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].csoUserId, swiftLogRec.userId, 10);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].csoActionDateTime, swiftLogRec.dateTime, 14);
		strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].supervisorId, swiftLogRec.supervisorId, 10);
		if ( strncmp(swiftLogRec.supervisorId, "                 ", 10) )
			strncpy(responseMsg.swiftTransferEnq.details[recsInThisMsg].approvedDateTime, swiftLogRec.lastUpdateDateTime, 14);

		if ( ++recsInThisMsg >= 20 )
			break;
	}

	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.swiftTransferEnq.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.swiftTransferEnq.noOfRecs, tmpStr, 2);
	strncpy(responseMsg.swiftTransferEnq.reqdDate, receivedMsg.swiftTransferEnq.reqdDate, 8);
	responseMsg.swiftTransferEnq.requestType =  receivedMsg.swiftTransferEnq.requestType;
	responseMsg.swiftTransferEnq.details[recsInThisMsg+1].branchCode[0] = '\0';
	formatSwiftTransferEnquiryResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.swiftTransferEnq.msgLen);
	return SUCCESS;
}

processTransferDetail()
{
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	int  ridRecFound=NO, pendingStatus;
	double transAmt;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processTransferDetail]  Entered......\n", getDateTime(), PID);

	memset(responseMsg.transferDetail.msgLen, ' ', sizeof responseMsg.transferDetail);

	isindexinfo(ridFile, &ridKey, 1);
	memset(&ridRec.liveChar, ' ', sizeof ridRec);
	strncpy(ridRec.transRef, receivedMsg.transferDetail.bpRefNo, 10);

	if ( isstart (ridFile, &ridKey, 0, &ridRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processTransferDetail] : ISSTART/ISGTEQ error %d occured on rid0data for the trans.Ref.No.[%.10s] IGNORED..\n", getDateTime(), PID, iserrno, ridRec.transRef);
		fflush(logFp);
	}

	ridRecFound=NO;
	while ( isRead(ridFile, &ridRec.liveChar, ISNEXT) == 0 )
	{
		if (  strncmp(ridRec.transRef, receivedMsg.transferDetail.bpRefNo, 10) )
			break;

		if ( strncmp(receivedMsg.transferDetail.transDate, "                  ", 8) &&
			 receivedMsg.transferDetail.transDate[0] != NULL )
		{
			if ( strncmp(bmDateToActual(ridRec.issueDate, tmpStr), receivedMsg.transferDetail.transDate, 8) )
				continue;
		}

		ridRecFound=YES;
		break;
	}

	if ( ridRecFound == NO )
	{
		if ( iserrno == 0 )
		{
			sprintf(tmpStr, "Record not found with this key ");
			formatTransferDetailResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			fprintf(logFp, "%s|%5d|[processTransferDetail] ISREAD/ISNEXT error %d occured on rid0data for transaction reference number [%.10s]\n", getDateTime(), PID, iserrno, receivedMsg.transferDetail.bpRefNo);
			fflush(logFp);
			if  ( iserrno == 111 || iserrno == 112 )
			{
				sprintf(tmpStr, "Record not found with this key ");
				formatTransferDetailResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else if ( iserrno = 110 )
			{
				sprintf(tmpStr, "Begining/End of file reached");
				formatTransferDetailResponse(END_OF_FILE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on rid0data");
				formatTransferDetailResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on rid0data", iserrno);
				formatTransferDetailResponse(INTERNALERR, tmpStr, tmpStr);
			}
		}
		sendResponse(responseMsg.transferDetail.msgLen);
		return FAILURE;
	}

	if ( strncmp(receivedMsg.transferDetail.requestType, "01", 2) == 0 )
	{
		pendingStatus = checkSwiftPendingStatus(ridRec.transRef, bmDateToActual(ridRec.issueDate, tmpStr));
		if( pendingStatus == SUCCESS )
		{
			fprintf(logFp, "%s|%5d|[processTransferDetail] :Transaction reference number [%.10s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, ridRec.transRef, swiftLogRec.bmUpdateStatus, swiftLogRec.userId, swiftLogRec.branchCode);
			fflush(logFp);
			if ( swiftLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", swiftLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", swiftLogRec.userId, swiftLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	strncpy(responseMsg.transferDetail.accNo, bmAccToActual(ridRec.crAccNo,tmpStr), 14);
	strncpy(responseMsg.transferDetail.drAccNo, bmAccToActual(ridRec.drAccNo,tmpStr), 14);
	strncpy(responseMsg.transferDetail.transRefNo, ridRec.transRef, 10);
	strncpy(responseMsg.transferDetail.issueDate, bmDateToActual(ridRec.issueDate, tmpStr), 8);
	strncpy(responseMsg.transferDetail.valueDate, bmDateToActual(ridRec.valueDate, tmpStr), 8);
	strncpy(responseMsg.transferDetail.transCurrCode, ridRec.transCurrCode, 3);
	strncpy(responseMsg.transferDetail.paymentCurrCode, ridRec.payCurrCode, 3);
	strncpy(responseMsg.transferDetail.transAmt, ridRec.netAmt, 14); /* Transfer Amount */
	strncpy(responseMsg.transferDetail.paymentAmt, ridRec.payAmt, 14);
	strncpy(responseMsg.transferDetail.applicantName, ridRec.totAmt, 30);
	strncpy(responseMsg.transferDetail.benefName, ridRec.penProxyName, 30);
	strncpy(responseMsg.transferDetail.benefAddr1, ridRec.pensionerName, 35);
	strncpy(responseMsg.transferDetail.benefAddr2, ridRec.benefAddress2, 35);
	responseMsg.transferDetail.transType = ridRec.paymentStatus;
	responseMsg.transferDetail.paymentType = ridRec.statusFlag;
	strncpy(responseMsg.transferDetail.branchCode, ridRec.branchCode, 4);
	strncpy(responseMsg.transferDetail.message1, ridRec.message1, 35);
	strncpy(responseMsg.transferDetail.message2, ridRec.message2, 35);
	strncpy(responseMsg.transferDetail.message3, ridRec.message3, 35);
	strncpy(responseMsg.transferDetail.message4, ridRec.message4, 35);
	strncpy(responseMsg.transferDetail.benefBank, ridRec.benefBank1, 35);
	strncpy(responseMsg.transferDetail.coveringBank, ridRec.coveringBank1, 35);

	sprintf(tmpStr, "%.7s", &responseMsg.transferDetail.accNo[5]);
	if ( getCustName(tmpStr) == SUCCESS )
	{
		if ( strncmp(custTabRec.aShortName, "                                 ", 30) == 0 )
			strncpy(responseMsg.transferDetail.custName, custTabRec.eShortName, 30);
		else
			strncpy(responseMsg.transferDetail.custName, custTabRec.aShortName, 30);
	}

	/* The following fields were added for SWIFT centralization project  on 23 Jul 2007 */
	strncpy(responseMsg.transferDetail.transferPurpose, ridRec.transferPurpose, 2);
	strncpy(responseMsg.transferDetail.applicantAddr1, ridRec.senderLine1, 35);
	strncpy(responseMsg.transferDetail.applicantAddr2, ridRec.senderLine2, 35);
	strncpy(responseMsg.transferDetail.applicantAddr3, ridRec.senderLine3, 35);
	strncpy(responseMsg.transferDetail.applicantIdNo, ridRec.senderLine4, 15); 
	strncpy(responseMsg.transferDetail.applicantCountryCode, ridRec.benefBankBIC, 3); 
	strncpy(responseMsg.transferDetail.applicantIdNo, ridRec.senderLine4, 15); 
	strncpy(responseMsg.transferDetail.benefAccNo, ridRec.benefAccNo, 35);
	strncpy(responseMsg.transferDetail.benefNationality, ridRec.benefCountryCode, 2);
	strncpy(responseMsg.transferDetail.benefAddr3, ridRec.benefAddress3, 35);
	strncpy(responseMsg.transferDetail.benefBankAddr1, ridRec.benefBank1, 35);
	strncpy(responseMsg.transferDetail.benefBankAddr2, ridRec.benefAddress5, 35);
	strncpy(responseMsg.transferDetail.benefBankBICcode, ridRec.benefBankBICcode, 11);
	strncpy(responseMsg.transferDetail.exchangeRate, ridRec.exchangeRate, 12);
	strncpy(responseMsg.transferDetail.bankSortCode, ridRec.benefAddress4, 35);

	if ( strncmp(responseMsg.transferDetail.applicantIdNo, "                ", 15) == 0 )
	{
		memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
		strncpy(custTabRec.custNo, &responseMsg.transferDetail.drAccNo[5], 7);
		isindexinfo(custTabFile, &custTabKey, 1);
		isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);
		if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processTransferDetail] ISREAD/ISEQUAL error %d on stcusttab while reading for applicant id number for the customer number [%.7s] IGNORED\n", getDateTime(), PID, iserrno, custTabRec.custNo);
			fflush(logFp);
		}
		else
			strncpy(responseMsg.transferDetail.applicantIdNo, custTabRec.idNo, 15);
	}

	formatTransferDetailResponse(DONE, "Successful...", "Successful....");
	sendResponse(responseMsg.transferDetail.msgLen);
	return SUCCESS;
}

processSwiftTransferRequest() 
{
	char tmpStr[100], tmpStr1[100], tmpCustNo[20];
	char recdIdType, recdIdNo[20];
	int ridRecFound=NO;
	int i, mode,pendingStatus;
	char *isLogPathName;
	int isappLogFp ;
	int zeroUpdateReqd = NO;
	int errorNo;
	long oldSigMask;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.swiftTransfer.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.swiftTransfer.dateTime);
		fflush(logFp);
		sprintf(tmpStr, "Encountered problem in date&time;retry your action");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	readBankingDate();

	memset(&swiftLogRec.liveChar,' ',sizeof swiftLogRec);

	if ( receivedMsg.swiftTransfer.creationOrUpdate == 'C' )
	{
		pendingStatus = checkSwiftPendingStatus(receivedMsg.swiftTransfer.transRefNo, receivedMsg.swiftTransfer.issueDate);
		if( pendingStatus == SUCCESS )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] :Transaction reference number [%.10s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, receivedMsg.swiftTransfer.transRefNo, swiftLogRec.bmUpdateStatus, swiftLogRec.userId, swiftLogRec.branchCode);
			fflush(logFp);
			if ( swiftLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", swiftLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", swiftLogRec.userId, swiftLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		memset(&swiftLogRec.liveChar,' ',sizeof swiftLogRec);
		strncpy(swiftLogRec.branchCode, receivedMsg.swiftTransfer.homeBranch, 4);
		strncpy(swiftLogRec.userId, receivedMsg.swiftTransfer.userId, 10);
		strncpy(swiftLogRec.dateTime,receivedMsg.swiftTransfer.dateTime, 14);
		isindexinfo(swiftLogFile, &swiftLogKey, 1);
		if ( isstart(swiftLogFile, &swiftLogKey, 0, &swiftLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] :No Record found on stswiftlog  for key [%.28s] ignored\n", getDateTime(), PID, swiftLogRec.branchCode);
				fflush(logFp);
				fprintf(errLogFp, "%s :processSwiftTransferRequest(): No Record found on stswiftlog  for key [%.28s] ignored\n", getDateTime(), swiftLogRec.branchCode);
				fflush(errLogFp);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] :CISAM Error %d occured on stswiftlog for the key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode);
				sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		isindexinfo(ridFile, &ridKey, 1);
		memset(&ridRec.liveChar, ' ', sizeof ridRec);
		strncpy(ridRec.transRef, receivedMsg.swiftTransfer.transRefNo, 10);

		if ( isstart (ridFile, &ridKey, 0, &ridRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] : ISSTART/ISGTEQ error %d occured on rid0data for the trans.Ref.No.[%.10s] IGNORED..\n", getDateTime(), PID, iserrno, ridRec.transRef);
			fflush(logFp);
		}

		ridRecFound=NO;
		while ( isread(ridFile, &ridRec.liveChar, ISNEXT) == 0 )
		{
			if (  strncmp(ridRec.transRef, receivedMsg.swiftTransfer.transRefNo, 10) )
				break;

			if ( strncmp(bmDateToActual(ridRec.issueDate, tmpStr), receivedMsg.swiftTransfer.issueDate, 8) )
				continue;

			ridRecFound=YES;
			break;
		}

		if ( ridRecFound == NO )
		{
			if ( iserrno == 0 )
			{
				sprintf(tmpStr, "Record not found in RID0DATA with this key ");
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] ISREAD/ISNEXT error %d occured on rid0data for transaction reference number [%.10s]\n", getDateTime(), PID, iserrno, receivedMsg.swiftTransfer.transRefNo);
				fflush(logFp);
				if  ( iserrno == 111 || iserrno == 112 )
				{
					sprintf(tmpStr, "Record not found with this key ");
					formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else if ( iserrno = 110 )
				{
					sprintf(tmpStr, "Begining/End of file reached");
					formatBranchResponse(END_OF_FILE, tmpStr, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on rid0data");
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on rid0data", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		strncpy(swiftLogRec.crAccNo, bmAccToActual(ridRec.crAccNo,tmpStr), 14);
		strncpy(swiftLogRec.applicantAccNo, bmAccToActual(ridRec.drAccNo,tmpStr), 14);
		strncpy(swiftLogRec.valueDate, bmDateToActual(ridRec.valueDate, tmpStr), 8);
		strncpy(swiftLogRec.transCurrCode, ridRec.transCurrCode, 3);
		strncpy(swiftLogRec.transferPurpose, ridRec.transferPurpose, 2);
		strncpy(swiftLogRec.paymentCurrCode, ridRec.payCurrCode, 3);
		strncpy(swiftLogRec.exchangeRate, ridRec.exchangeRate, 12);
		strncpy(swiftLogRec.transAmt, ridRec.netAmt, 14); /* Transfer Amount */
		strncpy(swiftLogRec.paymentAmt, ridRec.payAmt, 14);
	}

	if( receivedMsg.swiftTransfer.creationOrUpdate == 'U' )
	{
		memset(&swiftLogRec.liveChar,' ',sizeof swiftLogRec);
		strncpy(swiftLogRec.branchCode,receivedMsg.swiftTransfer.homeBranch,4);
		strncpy(swiftLogRec.userId, receivedMsg.swiftTransfer.userId,10);
		strncpy(swiftLogRec.dateTime,receivedMsg.swiftTransfer.dateTime,14);

		if ( readSwiftLogFile(ISEQUAL) < 0 )
		{
	     	sendResponse(responseMsg.customer.msgLen);
	     	return FAILURE;
		}
	}

	swiftLogRec.liveChar = '@';
	strncpy(swiftLogRec.branchCode, receivedMsg.swiftTransfer.homeBranch,4);
	strncpy(swiftLogRec.userId, receivedMsg.swiftTransfer.userId,10);
	strncpy(swiftLogRec.dateTime, receivedMsg.swiftTransfer.dateTime,14);
	swiftLogRec.bmUpdateStatus = receivedMsg.swiftTransfer.bmUpdateStatus;

	strncpy(swiftLogRec.supervisorId, receivedMsg.swiftTransfer.supervisorId, 10);
	strncpy(swiftLogRec.transRefNo, receivedMsg.swiftTransfer.transRefNo, 10);
	strncpy(swiftLogRec.issueDate, receivedMsg.swiftTransfer.issueDate, 8);
	strncpy(swiftLogRec.transferPurpose, receivedMsg.swiftTransfer.transferPurpose, 2);
	strncpy(swiftLogRec.applicantName, receivedMsg.swiftTransfer.applicantName, 35);
	strncpy(swiftLogRec.applicantAddress1, receivedMsg.swiftTransfer.applicantAddress1,35);
	strncpy(swiftLogRec.applicantAddress2, receivedMsg.swiftTransfer.applicantAddress2,35);
	strncpy(swiftLogRec.applicantIdNo, receivedMsg.swiftTransfer.applicantIdNo,15);
	strncpy(swiftLogRec.applicantAddress3, receivedMsg.swiftTransfer.applicantAddress3,35);
	strncpy(swiftLogRec.applicantNationality, receivedMsg.swiftTransfer.applicantNationality,3);
	strncpy(swiftLogRec.issueBranchCode, receivedMsg.swiftTransfer.issueBranchCode,4);
	strncpy(swiftLogRec.benefName, receivedMsg.swiftTransfer.benefName, 30);
	swiftLogRec.ibanOrAccNo = receivedMsg.swiftTransfer.ibanOrAccNo;
	strncpy(swiftLogRec.benefAccNo, receivedMsg.swiftTransfer.benefAccNo, 35);
	strncpy(swiftLogRec.benefBankName, receivedMsg.swiftTransfer.benefBankName, 30);
	strncpy(swiftLogRec.benefAddress1, receivedMsg.swiftTransfer.benefAddress1,35);
	strncpy(swiftLogRec.benefAddress2, receivedMsg.swiftTransfer.benefAddress2,35);
	strncpy(swiftLogRec.benefAddress3, receivedMsg.swiftTransfer.benefAddress3,35);
	strncpy(swiftLogRec.benefCountryCode,receivedMsg.swiftTransfer.benefCountryCode,2);
	strncpy(swiftLogRec.benefBankAddress1, receivedMsg.swiftTransfer.benefBankAddress1, 35);
	strncpy(swiftLogRec.benefBankAddress2, receivedMsg.swiftTransfer.benefBankAddress2, 35);
	strncpy(swiftLogRec.bankSortCode, receivedMsg.swiftTransfer.bankSortCode, 35);
	strncpy(swiftLogRec.benefBankBIC, receivedMsg.swiftTransfer.benefBankBIC, 11);
	strncpy(swiftLogRec.message1, receivedMsg.swiftTransfer.message1,35);
	strncpy(swiftLogRec.message2, receivedMsg.swiftTransfer.message2,35);
	strncpy(swiftLogRec.message3, receivedMsg.swiftTransfer.message3,35);
	strncpy(swiftLogRec.message4, receivedMsg.swiftTransfer.message4,35);

	strncpy(swiftLogRec.lastUpdateUser, receivedMsg.swiftTransfer.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(swiftLogRec.lastUpdateDateTime, tmpStr, 14);

	if( receivedMsg.swiftTransfer.creationOrUpdate == 'U' )
	{
		if ( isRewcurr(swiftLogFile, &swiftLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] : ISREWCURR error %d on stswiftlog  for the key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",swiftLogRec.branchCode);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stswiftlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(swiftLogFile, &swiftLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSwiftTransferRequest] : ISWRITE error %d on stswiftlog while creating a new SWIFT for key [%.28s]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",swiftLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stswiftlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
    sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

readSwiftPendingList() 
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	char tAccNo[20],tCustNo[15];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[readSwiftPendingList]\n", getDateTime(), PID);

	memset(responseMsg.swiftCentrePendingList.msgLen, ' ', sizeof responseMsg.swiftCentrePendingList);
	responseMsg.swiftCentrePendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.swiftCentrePendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);

	isindexinfo(swiftLogFile, &swiftLogKey, 2);
	if( receivedMsg.swiftCentrePendingList.activityFlag == 'S' ) 
	{		
		strncpy(swiftLogRec.branchCode, receivedMsg.swiftCentrePendingList.homeBranch,4);
		swiftLogRec.bmUpdateStatus  = '1'; /* Pending with Supervisor */
		memset( swiftLogRec.userId, ' ' ,10 );
	}
	else /* TELLER_ACTION */
	{
		strncpy(swiftLogRec.branchCode,receivedMsg.swiftCentrePendingList.homeBranch,4);
		swiftLogRec.bmUpdateStatus  = '2'; /* Pending with CSO */
		strncpy( swiftLogRec.userId, receivedMsg.swiftCentrePendingList.userId ,10 ); 
	}

	if ( isstart(swiftLogFile,&swiftLogKey, 0, &swiftLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatBlockPendingListResponse(END_OF_FILE,"No more Records to fetch....", "No more Records to fetch....");
		else
		{
			fprintf(logFp,"%s|%5d|[readSwiftPendingList] C-ISAM Error %d occured during ISSTART on stswiftlog, key [%.14s %c]\n", getDateTime(), PID, iserrno, swiftLogRec.branchCode, swiftLogRec.bmUpdateStatus);
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog file", iserrno);
			formatBlockPendingListResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.swiftCentrePendingList.msgLen);
		return FAILURE;
	}

	while ( isread(swiftLogFile, &swiftLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( receivedMsg.swiftCentrePendingList.activityFlag == 'S' )
		{	
		 	if ( strncmp(receivedMsg.swiftCentrePendingList.homeBranch, swiftLogRec.branchCode, 4) != 0 || swiftLogRec.bmUpdateStatus !=  '1' ) 
				break;
		}
		else
		{
		 	if ( strncmp(receivedMsg.swiftCentrePendingList.homeBranch, swiftLogRec.branchCode,4) != 0 || strncmp(receivedMsg.swiftCentrePendingList.userId, swiftLogRec.userId, 10) != 0 || swiftLogRec.bmUpdateStatus !=  '2') 
				break;
		}

		if ( strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, "                ", 4) && receivedMsg.swiftCentrePendingList.reqdBranch[0] != NULL && strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, "0000000000000", 4) )
		{
			if ( strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, swiftLogRec.issueBranchCode, 4) )
				continue;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */
		
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].userId, swiftLogRec.userId, 10);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].dateTime, swiftLogRec.dateTime, 14);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].transRefNo, swiftLogRec.transRefNo, 10);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].issueDate, swiftLogRec.issueDate, 8);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].applicantName, swiftLogRec.applicantName, 35);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].benefName, swiftLogRec.benefName, 30);
		strncpy(responseMsg.swiftCentrePendingList.details[recsInThisMsg].branchCode, swiftLogRec.issueBranchCode, 4);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.swiftCentrePendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.swiftCentrePendingList.noOfRecs, tmpStr, 2);
	responseMsg.swiftCentrePendingList.details[recsInThisMsg+1].userId[0] = '\0';
	formatSwiftCentrePendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.swiftCentrePendingList.msgLen);
	return SUCCESS;
}

processBmTransEnq()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	double transAmt;
	int  noOfIterations=0;
	int completionFlag=YES;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processBmTranEnq]  Entered......\n", getDateTime(), PID);


	memset(responseMsg.bmTransEnq.msgLen, ' ', sizeof responseMsg.bmTransEnq);
	responseMsg.bmTransEnq.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.bmTransEnq.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&thdRec.liveChar, ' ', sizeof thdRec);
	strncpy(thdRec.accNo, actualToBmAcc(receivedMsg.bmTransEnq.accNo,tmpStr), 13);

	isindexinfo(thdFile, &thdKey, 1);
	isstart(thdFile, &thdKey, 13, &thdRec.liveChar, ISGTEQ);

	completionFlag=YES;
	while ( isread(thdFile, &thdRec.liveChar, ISNEXT) == 0 )
	{
		bmAccToActual(thdRec.accNo, tmpStr);
		if ( strncmp(receivedMsg.bmTransEnq.accNo, tmpStr, 14) )
			break;

		if ( noOfIterations++ > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}

		bmDateToActual(thdRec.postDate, tmpStr);
		if ( strncmp(tmpStr, receivedMsg.bmTransEnq.fromDate, 8) < 0 ||
			 strncmp(tmpStr, receivedMsg.bmTransEnq.toDate, 8) > 0 )
			 continue;

		
		if ( strncmp(receivedMsg.bmTransEnq.transType, "  ", 2) )
		{
			if ( strncmp(receivedMsg.bmTransEnq.transType, "RR", 2) )
			{
				if ( strncmp(receivedMsg.bmTransEnq.transType, thdRec.transType, 2) )
					continue;
			}
			else /* reversal transaction */
			{
				if ( thdRec.statmentFlag <= '1' )
					continue;
			}
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( recsInThisMsg < 20 )
		{
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].transRefNo, thdRec.transRef, 10);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].transDate,  bmDateToActual(thdRec.postDate,tmpStr), 8);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].valueDate,  bmDateToActual(thdRec.valueDate,tmpStr), 8);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].userId, thdRec.userId, 3);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].transAmt, thdRec.transAmt, 14);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].transCtr, thdRec.transCounter, 5);
			strncpy(responseMsg.bmTransEnq.details[recsInThisMsg].transType, thdRec.transType, 2);
			recsInThisMsg++;
		}
		else
			completionFlag = NO;
	}
	sprintf(tmpStr, "%05d", recCount);
	strncpy(responseMsg.bmTransEnq.totNoOfTrans, tmpStr, 5);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.bmTransEnq.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.bmTransEnq.noOfRecs, tmpStr, 2);
	if ( completionFlag == YES )
		responseMsg.bmTransEnq.completionFlag = '1';
	else
		responseMsg.bmTransEnq.completionFlag = '0';
	strncpy(responseMsg.bmTransEnq.accNo, receivedMsg.bmTransEnq.accNo, 14);

	formatTransferEnquiryResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.bmTransEnq.msgLen);
	return SUCCESS;
}

processBmTransDetail()
{
	char tmpStr[100];
	char bmAccNo[20], tCustNo[15];
	double transAmt;
	int  transDetailFound = NO, i;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processBmTransDetail]  Entered......\n", getDateTime(), PID);

	memset(responseMsg.bmTransDetail.msgLen, ' ', sizeof responseMsg.bmTransDetail);

	isindexinfo(thdFile, &thdKey, 2);
	memset(&thdRec.liveChar, ' ', sizeof thdRec);
	strncpy(thdRec.accNo, actualToBmAcc(receivedMsg.bmTransDetail.accNo, bmAccNo), 13);
	strncpy(thdRec.transRef, receivedMsg.bmTransDetail.bpRefNo, 10);

	if ( isstart (thdFile, &thdKey, 0, &thdRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processBmTransDetails] : ISSTART/ISGTEQ error %d occured on thd0data for the Account number [%.14s:%.13s] & trans.Ref.No.[%.10s] IGNORED..\n", getDateTime(), PID, iserrno, receivedMsg.bmTransDetail.accNo, thdRec.accNo, thdRec.transRef);
		fflush(logFp);
	}

	transDetailFound = NO;
	while ( isread(thdFile, &thdRec.liveChar, ISNEXT) == 0 )
	{
		if ( thdRec.recType != '0' )
			continue;

		if  ( strncmp(thdRec.accNo, bmAccNo, 13) || strncmp(thdRec.transRef, receivedMsg.bmTransDetail.bpRefNo, 10) )
			break;

		transDetailFound = YES;
		break;
	}

	if ( transDetailFound == NO )
	{
		fprintf(logFp, "%s|%5d|[processBmTransDetails] Transaction details not found in thd0data for account number [%.14s:%.13s] & transaction reference number [%.10s]\n", getDateTime(), PID, receivedMsg.bmTransDetail.accNo, bmAccNo, receivedMsg.bmTransDetail.bpRefNo);
		fflush(logFp);
		sprintf(tmpStr, "Transaction details not found ; Contact Support");
		formatTransferEnquiryResponse(NOT_FOUND, tmpStr, tmpStr);
		sendResponse(responseMsg.bmTransDetail.msgLen);
		return FAILURE;
	}

	if ( (thd1File = isopen(thdFilePath, ISMANULOCK+ISINPUT)) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processBmTransDetail] ISOPEN error %d on %s\n", getDateTime(), PID, iserrno, thdFilePath);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening thd0data ; Contact Support", iserrno);
		formatTransferEnquiryResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.bmTransDetail.msgLen);
		return FAILURE;
	}
	isindexinfo(thd1File, &thd1Key, 1);

	strncpy(responseMsg.bmTransDetail.accNo, receivedMsg.bmTransDetail.accNo, 14);
	strncpy(responseMsg.bmTransDetail.transRefNo, thdRec.transRef, 10);
	sprintf(tmpStr, "%.7s", &receivedMsg.bmTransDetail.accNo[5]);
	if ( getCustName(tmpStr) == SUCCESS )
	{
		if ( strncmp(custTabRec.aShortName, "                                 ", 30) == 0 )
			strncpy(responseMsg.bmTransDetail.custName, custTabRec.eShortName, 30);
		else
			strncpy(responseMsg.bmTransDetail.custName, custTabRec.aShortName, 30);
	}
	strncpy(responseMsg.bmTransDetail.postDate, bmDateToActual(thdRec.postDate, tmpStr), 8);
	strncpy(responseMsg.bmTransDetail.valueDate, bmDateToActual(thdRec.valueDate, tmpStr), 8);
	strncpy(responseMsg.bmTransDetail.transAmt, thdRec.transAmt, 14);
	strncpy(responseMsg.bmTransDetail.transType, thdRec.transType, 2);
	strncpy(responseMsg.bmTransDetail.userId, thdRec.userId, 3);
	strncpy(responseMsg.bmTransDetail.supervisorId, thdRec.supervisorId, 3);
	responseMsg.bmTransDetail.stmtFlag = thdRec.statmentFlag;
	strncpy(responseMsg.bmTransDetail.narrative1, thdRec.narrative1, 25);

	/* narrative2 & narrative 3 */

	memset(&thdRec1.liveChar, ' ', sizeof thdRec1);
	strncpy(thdRec1.accNo, thdRec.accNo, 26);
	thdRec1.recType = '1';
	if (isRead(thd1File, &thdRec1.liveChar, ISEQUAL) < 0 )
	{
		if ( iserrno != 111 && iserrno != 112 && iserrno != 110 )
			fprintf(logFp, "%s|%5d|[processBmTransDetails] ISREAD/ISEQUAL error %d on thd0data for %.26s\n", getDateTime(), PID, iserrno, thdRec1.accNo );			
	}
	else
	{
		for (i=0; i<25; i++ )
		{
			if (thdRec1.narrative2[i] >= 0 && thdRec1.narrative2[i] < 27 )
				thdRec1.narrative2[i] = ' ';
			if (thdRec1.narrative3[i] >= 0 && thdRec1.narrative3[i] < 27 )
				thdRec1.narrative3[i] = ' ';
		}
		strncpy(responseMsg.bmTransDetail.narrative2, thdRec1.narrative2, 25);
		strncpy(responseMsg.bmTransDetail.narrative3, thdRec1.narrative3, 25);
	}

	formatTransferEnquiryResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.bmTransDetail.msgLen);
	return SUCCESS;
}

formatSwiftTransferEnquiryResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSwiftTransferEnquiryResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.swiftTransferEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.swiftTransferEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.swiftTransferEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.swiftTransferEnq.service, receivedMsg.swiftTransferEnq.service, 2);
	responseMsg.swiftTransferEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.swiftTransferEnq.msgLen));
	strncpy(responseMsg.swiftTransferEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatBranchSwiftTransferResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatBranchSwiftTransferResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.branchSwiftTransfers.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.branchSwiftTransfers.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.branchSwiftTransfers.eRemarks,tmpStr,50);
	strncpy(responseMsg.branchSwiftTransfers.service, receivedMsg.branchSwiftTransfers.service, 2);
	responseMsg.branchSwiftTransfers.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.branchSwiftTransfers.msgLen));
	strncpy(responseMsg.branchSwiftTransfers.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTransferDetailResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTransferDetailResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.transferDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.transferDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.transferDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.transferDetail.service, receivedMsg.transferDetail.service, 2);
	responseMsg.transferDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.transferDetail.msgLen));
	strncpy(responseMsg.transferDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSwiftCentrePendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSwiftCentrePendingListResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.branchSwiftTransfers.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.branchSwiftTransfers.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.branchSwiftTransfers.eRemarks,tmpStr,50);
	strncpy(responseMsg.branchSwiftTransfers.service, receivedMsg.branchSwiftTransfers.service, 2);
	responseMsg.branchSwiftTransfers.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.branchSwiftTransfers.msgLen));
	strncpy(responseMsg.branchSwiftTransfers.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatTransferEnquiryResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatTransferEnquiryResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.transferEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.transferEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.transferEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.transferEnq.service, receivedMsg.transferEnq.service, 2);
	responseMsg.transferEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.transferEnq.msgLen));
	strncpy(responseMsg.transferEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logBranchSwiftTransferDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[Branch Swfit Transfer Request]\n", receivedMsg.branchSwiftTransfers.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.branchSwiftTransfers.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.branchSwiftTransfers.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.branchSwiftTransfers.lastRecCount);
	fprintf(logFp, "Required Date 	: %.8s\n", receivedMsg.branchSwiftTransfers.reqdDate);
	fprintf(logFp, "Reqd.Branch Code: %.4s\n", receivedMsg.branchSwiftTransfers.branchCode);
	fflush(logFp);
}

logTransferEnqDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[Transfer Enquiry]\n", receivedMsg.transferEnq.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.transferEnq.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.transferEnq.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.transferEnq.lastRecCount);
	fprintf(logFp, "Account number  : %.14s\n", receivedMsg.transferEnq.accNo);
	fprintf(logFp, "Record Status   : %c\n", receivedMsg.transferEnq.recordStatus);
	fprintf(logFp, "From Date 		: %.8s\n", receivedMsg.transferEnq.fromDate);
	fprintf(logFp, "To Date 		: %.8s\n", receivedMsg.transferEnq.toDate);
	fprintf(logFp, "BP Reference No.: %.10s\n", receivedMsg.transferEnq.bpRefNo);
	fflush(logFp);
}

logTransferDetailRequest()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	if ( strncmp(receivedMsg.transferDetail.requestType, "02", 2) == 0 )
		fprintf(logFp, "Service			: %.2s[SWIFT Transfer Pending Details]\n", receivedMsg.transferDetail.service);
	else
		fprintf(logFp, "Service			: %.2s[Transfer Details]\n", receivedMsg.transferDetail.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.transferDetail.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.transferDetail.userId);
	fprintf(logFp, "BP Reference No.: %.10s\n", receivedMsg.transferDetail.bpRefNo);
	fprintf(logFp, "Trans. Date     : %.8s\n", receivedMsg.transferDetail.transDate);
	fprintf(logFp, "Request. Type   : %.2s\n", receivedMsg.transferDetail.requestType);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.transferDetail.dateTime);
	fflush(logFp);
}

logBmTransDetailRequest()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[BM Transaction Details]\n", receivedMsg.transferDetail.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.bmTransDetail.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.bmTransDetail.userId);
	fprintf(logFp, "Account Number	: %.14s\n", receivedMsg.bmTransDetail.accNo);
	fprintf(logFp, "Transaction Reference No.: %.10s\n", receivedMsg.bmTransDetail.bpRefNo);
	fflush(logFp);

}

logBmTransEnqDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[BM Transaction Enquiry]\n", receivedMsg.bmTransEnq.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.bmTransEnq.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.bmTransEnq.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.bmTransEnq.lastRecCount);
	fprintf(logFp, "Account number  : %.14s\n", receivedMsg.bmTransEnq.accNo);
	fprintf(logFp, "From Date 		: %.8s\n", receivedMsg.bmTransEnq.fromDate);
	fprintf(logFp, "To Date 		: %.8s\n", receivedMsg.bmTransEnq.toDate);
	fprintf(logFp, "Transaction Type: %.2s\n", receivedMsg.bmTransEnq.transType);
	fflush(logFp);
}

logSwiftTransferDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[SWIFT Transfer Details entered by transfer centre]\n",receivedMsg.swiftTransfer.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.swiftTransfer.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.swiftTransfer.userId);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.swiftTransfer.dateTime);
	fprintf(logFp, "CreationOrUpdate: %c\n", receivedMsg.swiftTransfer.creationOrUpdate);

	fprintf(logFp, "BP Reference No.: %.10s\n", receivedMsg.swiftTransfer.transRefNo);
	fprintf(logFp, "Trans. Date     : %.8s\n", receivedMsg.swiftTransfer.issueDate);
	fprintf(logFp, "Supervisor ID   : %.10s\n", receivedMsg.swiftTransfer.supervisorId);
	fprintf(logFp, "Applicant Name  : %.35s\n", receivedMsg.swiftTransfer.applicantName);
	fprintf(logFp, "Applicant Address1:  %.35s\n", receivedMsg.swiftTransfer.applicantAddress1);
	fprintf(logFp, "Applicant Address2:  %.35s\n", receivedMsg.swiftTransfer.applicantAddress2);
	fprintf(logFp, "Applicant Address3:  %.35s\n", receivedMsg.swiftTransfer.applicantAddress3);
	fprintf(logFp, "Issue Branch code :  %.4s\n", receivedMsg.swiftTransfer.issueBranchCode);
	fprintf(logFp, "IBAN or Acc No.   :  %c\n", receivedMsg.swiftTransfer.ibanOrAccNo);
	fprintf(logFp, "Beneficiary Acc.No:  %.35s\n", receivedMsg.swiftTransfer.benefAccNo);
	fflush(logFp);
}

readSwiftLogFile(int mode)
{
	char tmpStr[100];

	fprintf(logFp, "%s|%5d|[readSwiftLogFile] readSwiftLogFile() for key value %.28s\n", getDateTime(), PID, swiftLogRec.branchCode);
	if ( isRead(swiftLogFile, &swiftLogRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readSwiftLogFile] : ISREAD/%s error %d on stswiftlog for key=%.28s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, swiftLogRec.branchCode);
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
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}

	fflush(logFp);
	return SUCCESS;
}

openSwiftLogFile(int mode)
{
	char tmpStr[100];

	if ( swiftLogFileOpen == YES )
		return SUCCESS;

	if ( (swiftLogFile  = isopen(swiftLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openSwiftLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, swiftLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stswiftlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(swiftLogFile, &swiftLogKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stswiftlog file (%d) successfully opened...\n", getDateTime(), PID, swiftLogFile);
		fflush(logFp);
	}

	swiftLogFileOpen = YES;
	return SUCCESS;
}

checkSwiftPendingStatus(char *transRefNo, char *issueDate)
{
	char tmpStr[100];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[checkSwiftPendingStatus] in swiftLogFile\n", getDateTime(), PID);
	
	isindexinfo(swiftLogFile,&swiftLogKey, 3);

	memset(&swiftLogRec.liveChar, ' ', sizeof swiftLogRec);
	strncpy(swiftLogRec.transRefNo, transRefNo, 10);
	strncpy(swiftLogRec.issueDate,  issueDate, 8);

	if ( isstart(swiftLogFile,&swiftLogKey, 0, &swiftLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			return FAILURE;
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stswiftlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	while ( isread(swiftLogFile, &swiftLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(swiftLogRec.transRefNo, transRefNo, 10) || strncmp(swiftLogRec.issueDate, issueDate, 8) )
			break;

		if ( swiftLogRec.bmUpdateStatus == '1' || swiftLogRec.bmUpdateStatus == '2' )
		{
			fprintf(logFp, "%s|%5d|[checkSwiftPendingStatus]Transaction reference number [%.10s];issue Date [%.8s] is already in pending status [%c] and the branch code [%.4s] and userId created was [%.10s]\n", getDateTime(), PID, swiftLogRec.transRefNo, swiftLogRec.issueDate, swiftLogRec.bmUpdateStatus, swiftLogRec.branchCode, swiftLogRec.userId);
			fflush(logFp);
			return SUCCESS;
		}
	}
	return FAILURE;
}

logSwiftCentrePendingList()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[SWIFT transfer Pending List]\n", receivedMsg.swiftCentrePendingList.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.swiftCentrePendingList.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.swiftCentrePendingList.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.swiftCentrePendingList.lastRecCount);
	fprintf(logFp, "Activity Flag   : %c\n", receivedMsg.swiftCentrePendingList.activityFlag);
	fflush(logFp);
}

logSwiftTransferApprovalDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Swift Transfer Approval]\n", receivedMsg.swiftTransferApproval.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.swiftTransferApproval.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.swiftTransferApproval.userId);
	fprintf(logFp, "Date & Time         : %.14s\n", receivedMsg.swiftTransferApproval.dateTime);
	fprintf(logFp, "Approve/Reject flag : %c\n", receivedMsg.swiftTransferApproval.appRejectFlag);
	fprintf(logFp, "Supervisor Id       : %.10s\n", receivedMsg.swiftTransferApproval.supervisorId);
	fprintf(logFp, "Supervisor Comments	: %.200s\n", receivedMsg.swiftTransferApproval.supervisorComments);
	fflush(logFp);
}

logSwiftCentreEnquiryDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service			: %.2s[Swift Transfer Enquiry Request]\n", receivedMsg.swiftTransferEnq.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.swiftTransferEnq.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.swiftTransferEnq.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.swiftTransferEnq.lastRecCount);
	fprintf(logFp, "Required Date 	: %.8s\n", receivedMsg.swiftTransferEnq.reqdDate);
	fprintf(logFp, "Reqd.Branch Code: %.4s\n", receivedMsg.swiftTransferEnq.reqdBranch);
	fprintf(logFp, "Request Type    : %c\n", receivedMsg.swiftTransferEnq.requestType);
	fflush(logFp);
}

getSwiftCentralizedBranch()
{
	int i;

	if ( extraDebug > 5 )
	{
		fprintf(logFp, "%s|%5d| Inside getSwiftCentralizedBranch()..\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(swiftCentralizedBranches, NULL, sizeof swiftCentralizedBranches);

	memset(&branchRec.liveChar, ' ', sizeof branchRec);
	strncpy(branchRec.recType, "BD", 2);
	isindexinfo(ctlFile, &ctlKey, 1);
	if(isstart(ctlFile, &ctlKey, 0, &branchRec.liveChar, ISGTEQ) < 0)
	{
		fprintf(logFp, "%s|%5d|[getSwiftCentralizedBranch] ISSTART/ISGTEQ error %d on STCTLTAB for BD\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	while ( isRead(ctlFile, &branchRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(branchRec.recType, "BD", 2 ) )
			break;

		if ( branchRec.swiftTransferCentralized != '1' )
			continue;

		sprintf(swiftCentralizedBranches, "%s~%.4s", swiftCentralizedBranches, branchRec.branchCode);
	}
	return 0;
}

openRidFile(int mode)
{
	char tmpStr[100];
	if ( ridFileOpen == YES )
		return SUCCESS;

	if ( (ridFile  = isopen(ridFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openRidFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, ridFilePath);
		sprintf(tmpStr,"Error  %d occured while opening rid0data.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(ridFile, &ridKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| rid0data file (%d) successfully opened...\n", getDateTime(), PID, ridFile);
		fflush(logFp);
	}

	ridFileOpen = YES;
	return SUCCESS;
}
