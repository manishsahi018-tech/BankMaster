/*
	Objective       :       Static data management server 
				            (included for SADAD Enquiry )

	Date            :       29/05/2004.

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
#include "sadadint.h"
#include "bmint.h"

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, sadadCtlKey, sadadCtlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, ctlKey, sadadLogKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, sadadCtlFile, sadadCtlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, ctlFile, sadadLogFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *sadadCtlFilePath, *sadadCtlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *ctlFilePath, *sadadLogFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30], sadadMaxBills[5], sadadAccessChannel[30];

extern FILE *logFp, *errLogFp, *csdTransExpFp;

struct sadadCtlInfo		sadadCtlRec;
struct sadadConfigInfo	sadadConfigRec;
struct billerIdInfo		billerIdRec;
struct ctlInfo			ctlRec;
struct stsadadlog		sadadLogRec;
struct crd0data			crdRec;


struct postTransactionRequest   	postTransReqMsg;		
struct postTransactionResponse  	postTransResponseMsg;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;

char            *getpath();
char            *getDateTime();
double          bmAmtToDbl();
char            *dblToBmAmt();
char            *bmCustToAcutal();
char            *doubleToPack();
double          packToDouble();
char 			*fullTrim();
void 			sadadAlarm();

extern int errno;
extern int optopt;
extern int sadadTimeOut;
extern char dormantAccPosting;
int sadadTimeoutFlag=0;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, sadadCtlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, ctlFileOpen, sadadLogFileOpen;

int stSadadEnquiry(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stSadadEnquiry]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "81", 2) == 0 ) /*  Utility Bill Enquiry */
	{
		logSadadSearchDetails();

		if ( processSadadSearch() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "95", 2) == 0 ) /*  SADAD customer profile maintenance */
	{
		logSadadProfileDetails();

		if ( processSadadProfile() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AA", 2) == 0 ) /*  SADAD control table maintenance */
	{
		logSadadMaintenanceDetails();

		if ( openSadadCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.sadadMaintenance.msgLen);
			return FAILURE;
		}

		if ( processSadadMaintenance(receivedMsg.sadadMaintenance.action) == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AT", 2) == 0 ) /*  SADAD payment */
	{
		logSadadPaymentDetails();

		if ( openCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSadadPayment() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AU", 2) == 0 ) /*  get SADAD reversal message */
	{
		logSadadReversalDetails();

		if ( openCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( getSadadReversalMsg() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AV", 2) == 0 ) /*  Send payment advice message to SADAD */
	{
		logPymtAdviceDetails();

		if ( openCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSadadAdvice() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AW", 2) == 0 ) /*  Register SADAD reversal message for supervisor approval */
	{
		logSadadReversalDetails();

		if ( openCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSadadCtlFile(ISMANULOCK+ISINOUT)  < 0 )
		{
			 sprintf(tmpStr, "%.50s", responseMsg.sadadMaintenance.remarks);
			 formatBranchResponse(responseMsg.sadadMaintenance.status, tmpStr, tmpStr);
			 sendResponse(responseMsg.customer.msgLen);
		     return FAILURE;
		}

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSadadReversal() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AX", 2) == 0 ) /*  read the pending SADAD reversal request from Teller */
	{
		logSadadPendingReversalDetails();

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readSadadReversalPendingList() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AY", 2) == 0 ) /*  Sadad Transaction enquiry */
	{
		logSadadTransEnqDetails();

		if ( openCtlFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSadadLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSadadTransEnq() == FAILURE )
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

processSadadSearch()
{
	char tmpStr[100], tmpStr1[25];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSadadSearch]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}
	memset(responseMsg.sadadEnq.msgLen, ' ', sizeof responseMsg.sadadEnq);

	if ( receivedMsg.sadadEnq.langInd != 'N' && receivedMsg.sadadEnq.langInd != 'B' ) /* If the request coming from OLD version(before 2.5.9) of CSD */
	{
		memset(sadadRequestMsg.billEnq.msgLen, ' ', sizeof sadadRequestMsg.billEnq);

		strncpy(sadadRequestMsg.billEnq.msgLen, "00000000", 8);
		strncpy(sadadRequestMsg.billEnq.msgType, "0001", 4);
		sadadRequestMsg.billEnq.langInd = receivedMsg.sadadEnq.langInd;
		strncpy(sadadRequestMsg.billEnq.accessChannel, "01      ", 4);
		sprintf(tmpStr1, "%.15s", receivedMsg.sadadEnq.idNo);
		sprintf(tmpStr, "%-20.20s", tmpStr1);
		strncpy(sadadRequestMsg.billEnq.customerId, tmpStr, 20);
		if ( receivedMsg.sadadEnq.idType == 'Q' )
			sprintf(tmpStr, "%-15.15s", "IQA");
		else if ( receivedMsg.sadadEnq.idType == 'I' )
			sprintf(tmpStr, "%-15.15s", "NAT");
		else if ( receivedMsg.sadadEnq.idType == 'C' )
			sprintf(tmpStr, "%-15.15s", "BIS");
		else 
			sprintf(tmpStr, "%-15.15s", "Undefined");

		strncpy(sadadRequestMsg.billEnq.customerType, tmpStr, 15);
		/*
		strncpy(sadadRequestMsg.billEnq.proxyCustId, receivedMsg.sadadEnq.userId, 10);
		strncpy(sadadRequestMsg.billEnq.proxyCustType, "BED", 3); /* BED - Bank Employee *
		*/
		strncpy(sadadRequestMsg.billEnq.subscriptionNo, receivedMsg.sadadEnq.subscriptionNo, 19);
		strncpy(sadadRequestMsg.billEnq.companyId, receivedMsg.sadadEnq.companyId, 4);
		sadadRequestMsg.billEnq.msgTerm = 'Z';
		sadadRequestMsg.billEnq.nullPad = '\0';
		sprintf(tmpStr, "%08d", strlen(sadadRequestMsg.billEnq.msgLen));
		strncpy(sadadRequestMsg.billEnq.msgLen, tmpStr, 8);

		if ( dealWithTuxedo("UTBLENQ", sadadRequestMsg.billEnq.msgLen, sadadResponseMsg.billEnq.msgLen) == FAILURE )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, sadadResponseMsg.billEnq.msgLen);
		fflush(logFp);

		strncpy(responseMsg.sadadEnq.subscriptionNo, sadadResponseMsg.billEnq.subscriptionNo, 453); 
		formatSadadEnqResponse(DONE, "Sucessful....", "Successful....");
		sendResponse(responseMsg.sadadEnq.msgLen);
	}
	else if ( receivedMsg.sadadEnq.langInd == 'N' ) /* enquiry request is coming from new version of CSD */
	{
		memset(sadadRequestMsg.newBillEnq.msgLen, ' ', sizeof sadadRequestMsg.newBillEnq);
		sadadRequestMsg.newBillEnq.nullPad = '\0';
		strncpy(sadadRequestMsg.newBillEnq.msgLen, "00000", 5);
		strncpy(sadadRequestMsg.newBillEnq.msgType, "0001", 4); /* Enquiry- Request */
		strncpy(sadadRequestMsg.newBillEnq.langInd, receivedMsg.sadadEnq.newLangInd, 5);
		/*strncpy(sadadRequestMsg.newBillEnq.accessChannel, "BTELLER    ", 8);*/
		/*strncpy(sadadRequestMsg.newBillEnq.accessChannel, "PORTAL     ", 8);*/
		sprintf(tmpStr, "%-8.8s", sadadAccessChannel); /* sadadAccessChannel is taken from stsarserv.cfg */
		strncpy(sadadRequestMsg.newBillEnq.accessChannel, tmpStr, 8);
		sprintf(tmpStr1, "%-15.15s", receivedMsg.sadadEnq.idNo);
		sprintf(tmpStr, "%-32.32s", tmpStr1);
		strncpy(sadadRequestMsg.newBillEnq.customerId, tmpStr, 32);
		if ( receivedMsg.sadadEnq.idType == 'Q' )
			strncpy(sadadRequestMsg.newBillEnq.customerType, "IQA", 3);
		else if ( receivedMsg.sadadEnq.idType == 'I' )
			strncpy(sadadRequestMsg.newBillEnq.customerType, "NAT", 3);
		else if ( receivedMsg.sadadEnq.idType == 'C' )
			strncpy(sadadRequestMsg.newBillEnq.customerType, "BIS", 3);
		else 
			strncpy(sadadRequestMsg.newBillEnq.customerType, "OTH", 3); /* Others */
		/*
		strncpy(sadadRequestMsg.newBillEnq.proxyCustId, receivedMsg.sadadEnq.userId, 10);
		strncpy(sadadRequestMsg.newBillEnq.proxyCustType, "BED", 3); /* BED - Bank Employee *
		*/
		strncpy(sadadRequestMsg.newBillEnq.billNo, receivedMsg.sadadEnq.billNo, 19);
		strncpy(sadadRequestMsg.newBillEnq.subscriptionNo, receivedMsg.sadadEnq.subscriptionNo, 19);
		strncpy(sadadRequestMsg.newBillEnq.companyId, receivedMsg.sadadEnq.companyId, 3);
		if ( strncmp(receivedMsg.sadadEnq.startDate, "              ", 8) )
		{
			sprintf(tmpStr, "%.4s-%.2s-%.2sT00:00:00       ", receivedMsg.sadadEnq.startDate, &receivedMsg.sadadEnq.startDate[4], &receivedMsg.sadadEnq.startDate[6]);
			strncpy(sadadRequestMsg.newBillEnq.startDate, tmpStr, 19);
		}
		if ( strncmp(receivedMsg.sadadEnq.endDate, "          ", 8) )
		{
			sprintf(tmpStr, "%.4s-%.2s-%.2sT00:00:00       ", receivedMsg.sadadEnq.endDate, &receivedMsg.sadadEnq.endDate[4], &receivedMsg.sadadEnq.endDate[6]);
			strncpy(sadadRequestMsg.newBillEnq.endDate, tmpStr, 19);
		}
		if ( receivedMsg.sadadEnq.inclPayments == '1' ) 
			strncpy(sadadRequestMsg.newBillEnq.inclPayments, "true ", 5);
		else
			strncpy(sadadRequestMsg.newBillEnq.inclPayments, "false", 5);

		if ( receivedMsg.sadadEnq.inclPaidBills == '1' ) 
			strncpy(sadadRequestMsg.newBillEnq.inclPaidBills, "true ", 5);
		else
			strncpy(sadadRequestMsg.newBillEnq.inclPaidBills, "false", 5);

		if ( strncmp(sadadMaxBills, "100", 3) > 0 ) /* sadadMaxBills taken from stsarserv.cfg file; if it is more than 100, then 
												  set it as 100 */
			strncpy(sadadRequestMsg.newBillEnq.maxBills, "100", 3);
		else
			strncpy(sadadRequestMsg.newBillEnq.maxBills, sadadMaxBills, 3);

		sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.newBillEnq.msgLen));
		strncpy(sadadRequestMsg.newBillEnq.msgLen, tmpStr, 5);

		if ( dealWithTuxedo("SADBILLENQ", sadadRequestMsg.newBillEnq.msgLen, sadadResponseMsg.newBillEnq.msgLen) == FAILURE )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, sadadResponseMsg.newBillEnq.msgLen);
		fflush(logFp);

		/*strcpy(responseMsg.sadadEnq1.langInd, sadadResponseMsg.newBillEnq.langInd); */
		strncpy(responseMsg.sadadEnq1.langInd, sadadResponseMsg.newBillEnq.langInd, strlen(sadadResponseMsg.newBillEnq.langInd)); 
		sprintf(tmpStr, "%.3s", responseMsg.sadadEnq1.recCount);
		responseMsg.sadadEnq1.details[atoi(tmpStr)].billStatusCode[0] = NULL;
		formatSadadEnq1Response(DONE, "Sucessful....", "Successful....");
		sendResponse(responseMsg.sadadEnq1.msgLen);
	}
	else /* enquiry request from Teller facilites */
	{
		memset(sadadRequestMsg.newBillEnq.msgLen, ' ', sizeof sadadRequestMsg.newBillEnq);
		sadadRequestMsg.newBillEnq.nullPad = '\0';
		strncpy(sadadRequestMsg.newBillEnq.msgLen, "00000", 5);
		strncpy(sadadRequestMsg.newBillEnq.msgType, "0001", 4); /* Enquiry- Request */
		strncpy(sadadRequestMsg.newBillEnq.langInd, receivedMsg.sadadEnq.newLangInd, 5);
		strncpy(sadadRequestMsg.newBillEnq.accessChannel, "BTELLER    ", 8);
		strncpy(sadadRequestMsg.newBillEnq.proxyCustId, receivedMsg.sadadEnq.userId, 10);
		strncpy(sadadRequestMsg.newBillEnq.proxyCustType, "BTL", 3); /* BTL - Bank Teller */

		strncpy(sadadRequestMsg.newBillEnq.billNo, receivedMsg.sadadEnq.billNo, 19);
		strncpy(sadadRequestMsg.newBillEnq.subscriptionNo, receivedMsg.sadadEnq.subscriptionNo, 19);
		strncpy(sadadRequestMsg.newBillEnq.companyId, receivedMsg.sadadEnq.companyId, 3);
		strncpy(sadadRequestMsg.newBillEnq.maxBills, "002", 3);

		sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.newBillEnq.msgLen));
		strncpy(sadadRequestMsg.newBillEnq.msgLen, tmpStr, 5);

		if ( dealWithTuxedo("SADBILLENQ", sadadRequestMsg.newBillEnq.msgLen, sadadResponseMsg.newBillEnq.msgLen) == FAILURE )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, sadadResponseMsg.newBillEnq.msgLen);
		fflush(logFp);

		/*strcpy(responseMsg.sadadEnq1.langInd, sadadResponseMsg.newBillEnq.langInd); */
		strncpy(responseMsg.sadadEnq1.langInd, sadadResponseMsg.newBillEnq.langInd, strlen(sadadResponseMsg.newBillEnq.langInd)); 
		sprintf(tmpStr, "%.3s", responseMsg.sadadEnq1.recCount);
		responseMsg.sadadEnq1.details[atoi(tmpStr)].billStatusCode[0] = NULL;
		if ( strncmp(responseMsg.sadadEnq1.statusCode, "TOSADD", 6) == 0 )
		{
			sprintf(tmpStr, "Timeout Response from SADAD.. Pls check");
			formatSadadEnq1Response(SADAD_TIMEOUT, tmpStr, tmpStr);
		}
		else
			formatSadadEnq1Response(DONE, "Sucessful....", "Successful....");
		sendResponse(responseMsg.sadadEnq1.msgLen);
	}
	return SUCCESS;
}

formatReversalPostingMsg(char *accNo, double transAmt) 
{
	int hashTotal=0;
	char tmpStr[100];
	char tmpStr1[10];

	/* Preparing request message layout to call POSTTRANS for fund transfer */
	memset(postTransReqMsg.msgLen, ' ', sizeof (struct postTransactionRequest) );
	strncpy(postTransReqMsg.branchName,"StaticData      ",10);
	strncpy(postTransReqMsg.source,"CS", 2);
	strncpy(postTransReqMsg.service,"54", 2);
	strncpy(postTransReqMsg.userId, sadadLogRec.tellerId, 3); 
	sprintf(tmpStr,"%.14s000", sadadLogRec.transDateTime); /* Milliseconds is hardcoded as 000 &*/
	strncpy(postTransReqMsg.transDate,tmpStr,17);

	strncpy(postTransReqMsg.bmRefNo, sadadLogRec.transRefNo, 10); 
	strncpy(postTransReqMsg.eNarrative1, billerIdRec.englishNarrative1, 25);
	strncpy(postTransReqMsg.aNarrative1, billerIdRec.arabicNarrative1, 25);

	strncpy(postTransReqMsg.eNarrative2, sadadLogRec.subscriptionNo, 19); 
	strncpy(postTransReqMsg.aNarrative2, sadadLogRec.subscriptionNo, 19); 

	sprintf(tmpStr, "%.4s - %.6s                 ", receivedMsg.sadadPayment.homeBranch, &postTransReqMsg.transDate[8]);
	strncpy(postTransReqMsg.eNarrative3, tmpStr, 25); 
	strncpy(postTransReqMsg.aNarrative3, tmpStr, 25); 

	postTransReqMsg.transCategory = '2';	/* Reversal */
	strncpy(postTransReqMsg.requestBranchCode, receivedMsg.sadadPayment.homeBranch, 4); /* To write it in corresponing br.TG file*/
	postTransReqMsg.txnSource = 'S';
	strncpy(postTransReqMsg.valueDate, sadadLogRec.valueDate, 8);
	strncpy(postTransReqMsg.noOfTransHere,"02",2);

	/* Main Account Transaction */
	strncpy(postTransReqMsg.transInfo[0].accNo, accNo, 14);
	memset(tmpStr,'\0', sizeof tmpStr);
	sprintf(tmpStr,"-%014.0f", transAmt );
	strncpy(postTransReqMsg.transInfo[0].transAmt,tmpStr, 15);
	strncpy(postTransReqMsg.transInfo[0].transType, billerIdRec.transType, 2); 

	/* Contra Account Transaction */
	sprintf(tmpStr, "%.9s%.3s%.2s", billerIdRec.contraAccNo, &receivedMsg.sadadPayment.homeBranch[1], &billerIdRec.contraAccNo[12]);
	strncpy(postTransReqMsg.transInfo[1].accNo, tmpStr, 14);
	memset(tmpStr,'\0', sizeof tmpStr);
	sprintf(tmpStr,"+%014.0f", transAmt );
	strncpy(postTransReqMsg.transInfo[1].transAmt,tmpStr, 15);
	strncpy(postTransReqMsg.transInfo[1].transType, billerIdRec.transType, 2); 

	postTransReqMsg.transInfo[2].accNo[4] = NULL; /* left 4 spaces for hash total */

	sprintf(tmpStr,"%04d",strlen(postTransReqMsg.msgLen));
	strncpy(postTransReqMsg.msgLen, tmpStr,4);

	hashTotal = 0;
	hashTotal = calculateHashTotal(postTransReqMsg.msgLen);

	sprintf(tmpStr, "%04d", hashTotal);
	strncpy(&postTransReqMsg.msgLen[strlen(postTransReqMsg.msgLen)-4], tmpStr, 4);

	return 0;
}

reverseBillPayment() 
{
	char tmpStr[100], tmpStr1[25];
	char statusCode[10];
	char errorDesc[100];
	char responseMsgFromSadad[1000];
	double billAmt=0.0;
	int  hashTotal=0;

	readBankingDate();
	sprintf(tmpStr, "%.19s", receivedMsg.sadadPayment.billAmt); 
	billAmt=atof(tmpStr);

	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);
	isindexinfo(sadadLogFile, &sadadLogKey, 4);
	strncpy(sadadLogRec.transRefNo, receivedMsg.sadadPayment.transRefNo, 10);
	strncpy(sadadLogRec.valueDate, bankingDate, 8);
	isstart(sadadLogFile, &sadadLogKey, 0, &sadadLogRec.liveChar, ISGTEQ);

	if ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISEQUAL+ISLOCK) < 0 )
	{
		fprintf(logFp, "%s|%5d|[reverseBillPayment] ISREAD/ISEQUAL error %d occured on stsadadlog while reading trans. reference no. [%.10s] & value date [%.8s] ...\n", getDateTime(), PID, iserrno, receivedMsg.sadadPayment.transRefNo, bankingDate);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid reference number for reversal...pls. check");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured in stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}


	if ( receivedMsg.sadadPayment.reversalFlag == 'T' )
	{
		memset(sadadRequestMsg.billPayment.msgLen, ' ', sizeof sadadRequestMsg.billPayment);
		sadadRequestMsg.billPayment.nullPad = '\0';
		strncpy(sadadRequestMsg.billPayment.msgLen, "00000", 5);
		strncpy(sadadRequestMsg.billPayment.msgType, "0003", 4); /* Validation - Request */
		strncpy(sadadRequestMsg.billPayment.langInd, receivedMsg.sadadPayment.langInd, 5);
		strncpy(sadadRequestMsg.billPayment.proxyCustId, receivedMsg.sadadPayment.userId, 10);
		strncpy(sadadRequestMsg.billPayment.proxyCustType, "BTL", 3); /* BTL - Bank Teller */

		strncpy(sadadRequestMsg.billPayment.recordCount, "001", 3);
		strncpy(sadadRequestMsg.billPayment.transRefNo, sadadLogRec.transRefNo, 10);
		strncpy(sadadRequestMsg.billPayment.billAmtPaid, sadadLogRec.billAmt, 19); 
		formatSadadDateTime(sadadLogRec.transDateTime, tmpStr);
		strncpy(sadadRequestMsg.billPayment.transDate, tmpStr, 19);
		sprintf(tmpStr1, "%.8s%.6s", sadadLogRec.valueDate, &sadadLogRec.transDateTime[8]);
		formatSadadDateTime(tmpStr1, tmpStr);
		strncpy(sadadRequestMsg.billPayment.valueDate, tmpStr, 19);
		if ( sadadLogRec.subsOrBillNo == 'B' )
			strncpy(sadadRequestMsg.billPayment.billNo, sadadLogRec.subscriptionNo, 19);
		else
			strncpy(sadadRequestMsg.billPayment.subscriptionNo, sadadLogRec.subscriptionNo, 19);
		strncpy(sadadRequestMsg.billPayment.companyId, sadadLogRec.companyId, 3);

		strncpy(sadadRequestMsg.billPayment.branchCode, receivedMsg.sadadPayment.homeBranch, 4);
		strncpy(sadadRequestMsg.billPayment.accessChannel, "BTELLER    ", 8);
		if ( sadadLogRec.cashOrAcc == 'C' )
			strncpy(sadadRequestMsg.billPayment.paymentMethod, "CASH  ", 6);
		else
			strncpy(sadadRequestMsg.billPayment.paymentMethod, "ACTDEB", 6);
			
		strncpy(sadadRequestMsg.billPayment.paymentType, sadadLogRec.paymentType, 4);
		strncpy(sadadRequestMsg.billPayment.serviceType, sadadLogRec.serviceType, 4);
		strncpy(sadadRequestMsg.billPayment.drAccNo, sadadLogRec.drAccNo, 14);
		sadadRequestMsg.billPayment.reversalFlag = 'T';

		sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.billPayment.msgLen));
		strncpy(sadadRequestMsg.billPayment.msgLen, tmpStr, 5);

		sadadTimeoutFlag=0;
		signal(SIGALRM, sadadAlarm);
		alarm(sadadTimeOut);

		if ( dealWithTuxedo("SADBILLVAL", sadadRequestMsg.billPayment.msgLen, sadadResponseMsg.billPayment.msgLen) == FAILURE )
		{
			if ( sadadTimeoutFlag )
			{
				fprintf(logFp, "%s|%5d| reverseBillPayment() : Timout happened while reversing from SADAD for accNo=%.14s; refNo=%.10s. BillerId [%.3s]; Subscription No. [%.19s] ; SADAD reversal rejected\n", getDateTime(), PID, receivedMsg.sadadPayment.drAccNo, receivedMsg.sadadPayment.transRefNo, sadadRequestMsg.billPayment.companyId, sadadRequestMsg.billPayment.subscriptionNo);
				fflush(logFp);
				sadadTimeoutFlag = 0;
				alarm(0);
				sprintf(tmpStr, "Timeout during reversing to SADAD         ");
				formatBranchResponse(SADAD_TIMEOUT, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			alarm(0);
			isrelease(sadadLogFile);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		alarm(0);
		strncpy(responseMsg.sadadPayment.msgStatusCode, sadadResponseMsg.billPayment.msgStatusCode, 6);
		strncpy(responseMsg.sadadPayment.paymentStatusCode, sadadResponseMsg.billPayment.paymentStatusCode, 6);

		sprintf(statusCode, "%.6s", sadadResponseMsg.billPayment.msgStatusCode);
		fullTrim(statusCode);
		/*if ( strncmp(sadadReponseMsg.billPayment.msgStatusCode, "0", 1)  )*/
		if ( strcmp(statusCode, "0")  && strcmp(statusCode, "0040") )
		{
			fprintf(logFp, "%s|%5d| [reverseBillPayment] Error (message status code) [%.6s] received from SADAD...\n", getDateTime(), PID, sadadResponseMsg.billPayment.msgStatusCode);
			fflush(logFp);
			isrelease(sadadLogFile);

			sprintf(tmpStr, "Error %.6s received from SADAD.. Pls check", sadadResponseMsg.billPayment.msgStatusCode);
			if ( strcmp(statusCode, "TOSADD") == 0 )
			{
				sprintf(tmpStr, "Timeout Response from SADAD.. Pls check");
				formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
			}
			else if ( strcmp(statusCode, "000062") == 0 )
			{
				sprintf(tmpStr, "Timeout Response from Tuxedo.. Pls check");
				if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
				{
				}
				formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
			}
			else
				formatSadadPaymentResponse(SADAD_ERROR, tmpStr, tmpStr);
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}

		sprintf(statusCode, "%.6s", sadadResponseMsg.billPayment.paymentStatusCode);
		fullTrim(statusCode);
		/*if ( strncmp(sadadReponseMsg.billPayment.paymentStatusCode, "0", 1)  )*/
		/*if ( tmpStr[0] != '0' && tmpStr[1] == NULL )*/
		if ( strcmp(statusCode, "0")  && strcmp(statusCode, "0040") )
		{
			fprintf(logFp, "%s|%5d| [reverseBillPayment] Error (payment status code) [%.6s] received from SADAD...\n", getDateTime(), PID, sadadResponseMsg.billPayment.paymentStatusCode);
			fflush(logFp);
			isrelease(sadadLogFile);

			sprintf(tmpStr, "Error %.6s received from SADAD.. Pls check", sadadResponseMsg.billPayment.paymentStatusCode);
			if ( strcmp(statusCode, "TOSADD") == 0 )
			{
				sprintf(tmpStr, "Timeout Response from SADAD.. Pls check");
				formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
			}
			else if ( strcmp(statusCode, "000062") == 0 )
			{
				sprintf(tmpStr, "Timeout Response from Tuxedo.. Pls check");
				if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
				{
				}
				formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
			}
			else
				formatSadadPaymentResponse(SADAD_ERROR, tmpStr, tmpStr);
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}

		sadadLogRec.postingStatus = 'R'; /* R - Reversed */
	}
	else
	{
		sprintf(tmpStr,"%.14s000", sadadLogRec.transDateTime); /* Milliseconds is hardcoded as 000 &*/
		strncpy(postTransReqMsg.transDate,tmpStr,17);
		strncpy(postTransReqMsg.valueDate, sadadLogRec.valueDate, 8);
		if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
		{
		}
		sadadLogRec.postingStatus = 'T' ; /* T - Terminated */
	}
	sadadLogRec.reversalStatus = '9'; /* reversal successfully completed */

	strncpy(responseMsg.sadadPayment.contraAccNo, sadadLogRec.contraAccNo, 14);
	strncpy(responseMsg.sadadPayment.transRefNo, sadadLogRec.transRefNo, 10);
	/*
	strncpy(responseMsg.sadadPayment.aNarrative1, postTransReqMsg.aNarrative1, 25);
	strncpy(responseMsg.sadadPayment.eNarrative1, postTransReqMsg.eNarrative1, 25);
	*/

	/* Form the reversal message to Bankmaster */

	formatReversalPostingMsg(receivedMsg.sadadPayment.drAccNo, billAmt); 

	fprintf(logFp, "%s|%5d|[reverseSadadPayment] Send to TUXEDO [%s] \n", getDateTime(), PID, postTransReqMsg.msgLen);
	fflush(logFp);

	if ( dealWithTuxedo("POSTTRANS", postTransReqMsg.msgLen, postTransResponseMsg.msgLen) == FAILURE )
	{
		isrelease(sadadLogFile);
		sprintf(tmpStr, "Bankmaster reversal failed.. Please check..");
		formatSadadPaymentResponse(POSTING_FAILED, tmpStr, tmpStr);
		sendResponse(responseMsg.sadadPayment.msgLen);
		return FAILURE;
	}

	if ( strncmp(postTransResponseMsg.responseStatus, "00",2) && 
		strncmp(postTransResponseMsg.responseStatus, "01",2)  )
	{
		fprintf(logFp, "%s|%5d|[reverseSadadPayment] Error [%.2s:%.4s:%.14s:%.30s] received from  online gateway during reversal; Please check \n", getDateTime(), PID, postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode, postTransResponseMsg.errorAccount, postTransResponseMsg.errorDescription);
		fflush(logFp);

		isrelease(sadadLogFile);
		if ( getErrorDescription(postTransResponseMsg.responseStatus, errorDesc) == 1 )
			sprintf(errorDesc, "Error %.2s:%.4s received from Bankmaster while reversal ; Pls. check", postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode);
		formatSadadPaymentResponse(POSTING_FAILED, errorDesc, errorDesc);
		sendResponse(responseMsg.sadadPayment.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.sadadPayment.transRefNo, receivedMsg.sadadPayment.transRefNo, 10);
	strncpy(responseMsg.sadadPayment.aNarrative1, postTransReqMsg.aNarrative1, 25);
	strncpy(responseMsg.sadadPayment.eNarrative1, postTransReqMsg.eNarrative1, 25);
	strncpy(responseMsg.sadadPayment.narrative3, postTransReqMsg.eNarrative3, 25);
	strncpy(responseMsg.sadadPayment.transDate, postTransReqMsg.transDate, 8);
	strncpy(responseMsg.sadadPayment.valueDate, postTransReqMsg.valueDate, 8);


	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); 
	strncpy(sadadLogRec.reversalTime, &tmpStr[8], 6);
	strncpy(sadadLogRec.lastUpdateDateTime, tmpStr, 14);
	strncpy(sadadLogRec.lastUpdateUser, receivedMsg.sadadPayment.userId, 10);

	if ( isRewcurr(sadadLogFile, &sadadLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[reverseSadadPayment] : ISREWCURR error %d on stsadadlog while updating the record for key [%.28s] while reversing the bill payment\n", getDateTime(), PID, iserrno, sadadLogRec.branchCode);
		fflush(logFp);
		/* CHECK - what should we do to successful reversal */
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record on stsadadlog");
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stsadadlog" );
			formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(sadadLogFile);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	isrelease(sadadLogFile);

	formatSadadPaymentResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.sadadPayment.msgLen);
	return SUCCESS;
}

processSadadPayment()
{
	char tmpStr[100], tmpStr1[25];
	char statusCode[20];
	char errorDesc[100];
	char responseMsgFromSadad[1000];
	double billAmt=0.0;
	int  hashTotal=0;

	char *isLogPathName;
	int  isappLogFp ;
	long oldSigMask;
	char *tmpPtr;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}
	readBankingDate();
	memset(responseMsg.sadadPayment.msgLen, ' ', sizeof responseMsg.sadadPayment);

	sprintf(tmpStr, "%.19s", receivedMsg.sadadPayment.billAmt); 
	billAmt=atof(tmpStr);

	memset(&billerIdRec.liveChar, ' ', sizeof billerIdRec);
	strncpy(billerIdRec.recType, "BI", 2);
	strncpy(billerIdRec.billerId, receivedMsg.sadadPayment.companyId, 4);

	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &billerIdRec.liveChar, ISGTEQ);

	if ( isRead(ctlFile, &billerIdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment] ISREAD/ISEQUAL error %d occured while reading biller id [%.4s] information from control file ( stctltab) ...\n", getDateTime(), PID, iserrno, receivedMsg.sadadPayment.companyId);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Biller ID %.4s does not exist in control file ", receivedMsg.sadadPayment.companyId);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured in stctltab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, actualToBmCust(&receivedMsg.sadadPayment.drAccNo[5], tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment] ISREAD/ISEQUAL error %d occured on crd0data for the customer number [%.7s:%.6s] \n", getDateTime(), PID, iserrno, &receivedMsg.sadadPayment.drAccNo[5], crdRec.accNo);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr,"Customer %.7s not found in Bankmaster", &receivedMsg.sadadPayment.drAccNo[5]);
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
	strncpy(responseMsg.sadadPayment.custName, crdRec.shortName, 30);
	strncpy(responseMsg.sadadPayment.customerBranch, crdRec.branchCode, 4);

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	/*sprintf(tmpStr, "00%.4s", receivedMsg.sadadPayment.homeBranch, 4);*/
	sprintf(tmpStr, "00%.4s", receivedMsg.sadadPayment.homeBranch);
	strncpy(crdRec.accNo, tmpStr, 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment] ISREAD/ISEQUAL error %d occured on crd0data for the branch code [00%.4s] \n", getDateTime(), PID, iserrno, receivedMsg.sadadPayment.homeBranch);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr,"Branch code %.4s not found in Bankmaster", receivedMsg.sadadPayment.homeBranch);
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
	strncpy(responseMsg.sadadPayment.contraCustName, crdRec.shortName, 30);

	if ( receivedMsg.sadadPayment.reversalFlag == 'T' || receivedMsg.sadadPayment.reversalFlag == 'A' )
	{
		if ( reverseBillPayment() == FAILURE )
			return FAILURE;

		return SUCCESS;
	}
	formatTxnPostingMsg(receivedMsg.sadadPayment.drAccNo, billAmt); 

	fprintf(logFp, "%s|%5d|[processSadadPayment] Send to TUXEDO [%s] \n", getDateTime(), PID, postTransReqMsg.msgLen);
	fflush(logFp);

	sadadTimeoutFlag=0;
	signal(SIGALRM, sadadAlarm);
	alarm(sadadTimeOut);

	if ( dealWithTuxedo("POSTTRANS", postTransReqMsg.msgLen, postTransResponseMsg.msgLen) == FAILURE )
	{
		if ( sadadTimeoutFlag )
		{
			fprintf(logFp, "%s|%5d| processSadadPayment() : Timout happened while posting to Bankmaster for accNo=%.14s; refNo=%.10s. SADAD payment rejected\n", getDateTime(), PID, receivedMsg.sadadPayment.drAccNo, receivedMsg.sadadPayment.transRefNo);
			fflush(logFp);
			sadadTimeoutFlag = 0;
			alarm(0);
			if ( reverseBMTransaction() == FAILURE )
			{
				sendResponse(responseMsg.sadadPayment.msgLen);
				return FAILURE;
			}
			sprintf(tmpStr, "Timeout during posting to Bankmaster         ");
			formatBranchResponse(SADAD_TIMEOUT, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		sprintf(tmpStr, "Bankmaster posting failed.. Please check..");
		alarm(0);
		formatBranchResponse(POSTING_FAILED, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}


	if ( strncmp(postTransResponseMsg.responseStatus, "00",2) && 
		strncmp(postTransResponseMsg.responseStatus, "01",2)  )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment] Error [%.2s:%.4s:%.14s:%.30s] received from  online gateway ; Please check \n", getDateTime(), PID, postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode, postTransResponseMsg.errorAccount, postTransResponseMsg.errorDescription);
		fflush(logFp);
		alarm(0);

		if ( getErrorDescription(postTransResponseMsg.responseStatus, errorDesc) == 1 )
			sprintf(errorDesc, "Error %.2s:%.4s received from Bankmaster; Pls. check", postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode);

		formatSadadPaymentResponse(POSTING_FAILED, errorDesc, errorDesc);
		sendResponse(responseMsg.accApproval.msgLen);
		return FAILURE;
	}

	memset(sadadRequestMsg.billPayment.msgLen, ' ', sizeof sadadRequestMsg.billPayment);
	sadadRequestMsg.billPayment.nullPad = '\0';
	strncpy(sadadRequestMsg.billPayment.msgLen, "00000", 5);
	strncpy(sadadRequestMsg.billPayment.msgType, "0003", 4); /* Validation - Request */
	strncpy(sadadRequestMsg.billPayment.langInd, receivedMsg.sadadPayment.langInd, 5);
	strncpy(sadadRequestMsg.billPayment.proxyCustId, receivedMsg.sadadPayment.userId, 10);
	strncpy(sadadRequestMsg.billPayment.proxyCustType, "BTL", 3); /* BTL - Bank Teller */

	strncpy(sadadRequestMsg.billPayment.recordCount, "001", 3);
	strncpy(sadadRequestMsg.billPayment.transRefNo, receivedMsg.sadadPayment.transRefNo, 10);
	strncpy(sadadRequestMsg.billPayment.billAmtPaid, receivedMsg.sadadPayment.billAmt, 19); 
	formatSadadDateTime(postTransReqMsg.transDate, tmpStr);
	strncpy(sadadRequestMsg.billPayment.transDate, tmpStr, 19);
	sprintf(tmpStr1, "%.8s%.6s", postTransReqMsg.valueDate, &postTransReqMsg.transDate[8]);
	formatSadadDateTime(tmpStr1, tmpStr);
	strncpy(sadadRequestMsg.billPayment.valueDate, tmpStr, 19);
	strncpy(sadadRequestMsg.billPayment.billNo, receivedMsg.sadadPayment.billNo, 19);
	strncpy(sadadRequestMsg.billPayment.subscriptionNo, receivedMsg.sadadPayment.subscriptionNo, 19);
	strncpy(sadadRequestMsg.billPayment.companyId, receivedMsg.sadadPayment.companyId, 3);

	strncpy(sadadRequestMsg.billPayment.branchCode, receivedMsg.sadadPayment.homeBranch, 4);
	strncpy(sadadRequestMsg.billPayment.accessChannel, "BTELLER    ", 8);
	if ( receivedMsg.sadadPayment.cashOrAcc == 'C' )
		strncpy(sadadRequestMsg.billPayment.paymentMethod, "CASH  ", 6);
	else
		strncpy(sadadRequestMsg.billPayment.paymentMethod, "ACTDEB", 6);
		
	strncpy(sadadRequestMsg.billPayment.paymentType, receivedMsg.sadadPayment.paymentType, 4);
	strncpy(sadadRequestMsg.billPayment.serviceType, billerIdRec.serviceType, 4);
	strncpy(sadadRequestMsg.billPayment.drAccNo, receivedMsg.sadadPayment.drAccNo, 14);
	sadadRequestMsg.billPayment.reversalFlag = 'F';

	sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.billPayment.msgLen));
	strncpy(sadadRequestMsg.billPayment.msgLen, tmpStr, 5);

	if ( dealWithTuxedo("SADBILLVAL", sadadRequestMsg.billPayment.msgLen, sadadResponseMsg.billPayment.msgLen) == FAILURE )
	{
		if ( sadadTimeoutFlag )
		{
			fprintf(logFp, "%s|%5d| processSadadPayment() : Timout happened while posting to SADAD Bill Validation for accNo=%.14s; refNo=%.10s. BillerId [%.3s]; Subscription No. [%.19s] ; Reversing BM transaction; SADAD payment rejected\n", getDateTime(), PID, receivedMsg.sadadPayment.drAccNo, receivedMsg.sadadPayment.transRefNo, sadadRequestMsg.billPayment.companyId, sadadRequestMsg.billPayment.subscriptionNo);
			fflush(logFp);
			sadadTimeoutFlag = 0;
			alarm(0);
			sprintf(tmpStr, "Timeout during posting to SADAD         ");
			formatBranchResponse(SADAD_TIMEOUT, tmpStr, tmpStr);
			strcpy(responseMsgFromSadad, responseMsg.customer.msgLen);

			if ( reverseBMTransaction() == FAILURE )
			{
				sendResponse(responseMsg.sadadPayment.msgLen);
				return FAILURE;
			}
			if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
			{
			}
			sendResponse(responseMsgFromSadad);
			return FAILURE;
		}
		strcpy(responseMsgFromSadad, responseMsg.customer.msgLen);

		if ( reverseBMTransaction() == FAILURE )
		{
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}
		alarm(0);

		sendResponse(responseMsgFromSadad);
		return FAILURE;
	}

	alarm(0);

	sprintf(tmpStr, "%.9s%.3s%.2s", billerIdRec.contraAccNo, &receivedMsg.sadadPayment.homeBranch[1], &billerIdRec.contraAccNo[12]);
	strncpy(responseMsg.sadadPayment.contraAccNo, tmpStr, 14);
	strncpy(responseMsg.sadadPayment.transRefNo, receivedMsg.sadadPayment.transRefNo, 10);
	strncpy(responseMsg.sadadPayment.aNarrative1, postTransReqMsg.aNarrative1, 25);
	strncpy(responseMsg.sadadPayment.eNarrative1, postTransReqMsg.eNarrative1, 25);
	strncpy(responseMsg.sadadPayment.narrative3, postTransReqMsg.eNarrative3, 25);
	strncpy(responseMsg.sadadPayment.transDate, postTransReqMsg.transDate, 8);
	strncpy(responseMsg.sadadPayment.valueDate, postTransReqMsg.valueDate, 8);
	strncpy(responseMsg.sadadPayment.msgStatusCode, sadadResponseMsg.billPayment.msgStatusCode, 6);
	strncpy(responseMsg.sadadPayment.paymentStatusCode, sadadResponseMsg.billPayment.paymentStatusCode, 6);

	sprintf(statusCode, "%.6s", sadadResponseMsg.billPayment.msgStatusCode);
	fullTrim(statusCode);
	/*if ( strncmp(sadadReponseMsg.billPayment.msgStatusCode, "0", 1)  )*/
	if ( strcmp(statusCode, "0")  && strcmp(statusCode, "0040") )
	{
		fprintf(logFp, "%s|%5d| [processSadadPayment] Error (message status code) [%.6s] received from SADAD...Reversing BM transaction ..\n", getDateTime(), PID, sadadResponseMsg.billPayment.msgStatusCode);
		fflush(logFp);
		if ( reverseBMTransaction() == FAILURE )
		{
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}

		sprintf(tmpStr, "Error %.6s received from SADAD.. Pls check", sadadResponseMsg.billPayment.msgStatusCode);
		if ( strcmp(statusCode, "TOSADD") == 0 )
		{
			sprintf(tmpStr, "Timeout Response from SADAD.. Pls check");
			if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
			{
			}
			formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
		}
		else if ( strcmp(statusCode, "000062") == 0 )
		{
			sprintf(tmpStr, "Timeout Response from Tuxedo.. Pls check");
			if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
			{
			}
			formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
		}
		else
			formatSadadPaymentResponse(SADAD_ERROR, tmpStr, tmpStr);
		sendResponse(responseMsg.sadadPayment.msgLen);
		return FAILURE;
	}

	sprintf(statusCode, "%.6s", sadadResponseMsg.billPayment.paymentStatusCode);
	fullTrim(statusCode);
	/*if ( strncmp(sadadReponseMsg.billPayment.paymentStatusCode, "0", 1)  )*/
	/*if ( tmpStr[0] != '0' && tmpStr[1] == NULL )*/
	if ( strcmp(statusCode, "0")  && strcmp(statusCode, "0040") )
	{
		fprintf(logFp, "%s|%5d| [processSadadPayment] Error (payment status code) [%.6s] received from SADAD...Reversing BM transaction ..\n", getDateTime(), PID, sadadResponseMsg.billPayment.paymentStatusCode);
		fflush(logFp);
		if ( reverseBMTransaction() == FAILURE )
		{
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}

		sprintf(tmpStr, "Error %.6s received from SADAD.. Pls check", sadadResponseMsg.billPayment.paymentStatusCode);
		if ( strcmp(statusCode, "TOSADD") == 0 )
		{
			sprintf(tmpStr, "Timeout Response from SADAD.. Pls check");
			if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
			{
			}
			formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
		}
		else if ( strcmp(statusCode, "000062") == 0 )
		{
			sprintf(tmpStr, "Timeout Response from Tuxedo.. Pls check");
			if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
			{
			}
			formatSadadPaymentResponse(INTERNALERR, tmpStr, tmpStr);
		}
		else
			formatSadadPaymentResponse(SADAD_ERROR, tmpStr, tmpStr);

		sendResponse(responseMsg.sadadPayment.msgLen);
		return FAILURE;
	}


	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);
	sadadLogRec.liveChar = '@';
	strncpy(sadadLogRec.branchCode, receivedMsg.sadadPayment.homeBranch, 4);
	strncpy(sadadLogRec.userId, receivedMsg.sadadPayment.userId, 10);
	getDateTime();
	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); 
	strncpy(sadadLogRec.dateTime, tmpStr, 14);
	sadadLogRec.postingStatus = 'N'; /* N - Normal posted */
	strncpy(sadadLogRec.companyId, receivedMsg.sadadPayment.companyId, 4);
	if ( strncmp(receivedMsg.sadadPayment.subscriptionNo, "                      ", 19) )
	{
		strncpy(sadadLogRec.subscriptionNo, receivedMsg.sadadPayment.subscriptionNo, 19);
		sadadLogRec.subsOrBillNo = 'S'; /* S-Subs.No; B-Bill Number */
	}
	else
	{
		strncpy(sadadLogRec.subscriptionNo, receivedMsg.sadadPayment.billNo, 19);
		sadadLogRec.subsOrBillNo = 'B'; /* S-Subs.No; B-Bill Number */
	}
	strncpy(sadadLogRec.billAmt, receivedMsg.sadadPayment.billAmt, 19);
	strncpy(sadadLogRec.paymentType, receivedMsg.sadadPayment.paymentType, 4);
	strncpy(sadadLogRec.drAccNo, receivedMsg.sadadPayment.drAccNo, 14);
	strncpy(sadadLogRec.contraAccNo, responseMsg.sadadPayment.contraAccNo, 14);
	strncpy(sadadLogRec.transRefNo, responseMsg.sadadPayment.transRefNo, 10);
	strncpy(sadadLogRec.transType, postTransReqMsg.transInfo[0].transType, 2);
	strncpy(sadadLogRec.valueDate, postTransReqMsg.valueDate, 8);
	strncpy(sadadLogRec.transDateTime, postTransReqMsg.transDate, 14);
	strncpy(sadadLogRec.tellerId, receivedMsg.sadadPayment.tellerId, 3);
	strncpy(sadadLogRec.serviceType, billerIdRec.serviceType, 4);
	sadadLogRec.cashOrAcc = receivedMsg.sadadPayment.cashOrAcc;
	sadadLogRec.preOrPostpaid = receivedMsg.sadadPayment.preOrPostpaid;
	strncpy(sadadLogRec.langInd, receivedMsg.sadadPayment.langInd, 5);
	strncpy(sadadLogRec.bankTransId, sadadResponseMsg.billPayment.bankTransId,32);
	strncpy(sadadLogRec.sadadTransId, sadadResponseMsg.billPayment.sadadTransId, 32);

	strncpy(sadadLogRec.lastUpdateUser, receivedMsg.sadadPayment.userId, 10);
	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); 
	strncpy(sadadLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( isWrite(sadadLogFile, &sadadLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadPayment] : ISWRITE error %d on stsadadlog while creating a new record for key [%.28s]\n", getDateTime(), PID, iserrno, sadadLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record on stsadadlog");
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stsadadlog" );
			formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		strcpy(responseMsgFromSadad, responseMsg.customer.msgLen);
		if ( sendPaymentAdvice("PmtNotTransf          ") == FAILURE )
		{
		}
		if ( reverseBMTransaction() == FAILURE )
		{
			sendResponse(responseMsg.sadadPayment.msgLen);
			return FAILURE;
		}
		sendResponse(responseMsgFromSadad);
		return FAILURE;
	}

	/*
	if ( sendPaymentAdvice("PmtTransf          ") == FAILURE )
	{
	}
	*/

	formatSadadPaymentResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.sadadPayment.msgLen);
	return SUCCESS;
}

formatSadadDateTime(char *dateTime, char *sadadDateTime)
{
	memset(sadadDateTime, NULL, sizeof sadadDateTime);
	sprintf(sadadDateTime, "%.4s-%.2s-%.2sT%.2s:%.2s:%.2s", dateTime, &dateTime[4], &dateTime[6], &dateTime[8], &dateTime[10], &dateTime[12]);
	return 0;
}

getErrorDescription(char *errorCode, char *errorDesc)
{
	if ( strncmp(errorCode, "02", 2) == 0 )
		sprintf(errorDesc, "Duplicate Transmission sent to Bankmaster");
	else if ( strncmp(errorCode, "03", 2) == 0 )
		sprintf(errorDesc, "Incorrect Message sent to Bankmaster");
	else if ( strncmp(errorCode, "04", 2) == 0 )
		sprintf(errorDesc, "TPG not available ");
	else if ( strncmp(errorCode, "05", 2) == 0 )
		sprintf(errorDesc, "Main account number does not exist in Bankmaster");
	else if ( strncmp(errorCode, "06", 2) == 0 )
		sprintf(errorDesc, "Contra a/c does not exist in Bankmaster");
	else if ( strncmp(errorCode, "07", 2) == 0 )
		sprintf(errorDesc, "Any one a/c is Dormant ; Posting not allowed ");
	else if ( strncmp(errorCode, "08", 2) == 0 )
		sprintf(errorDesc, "Any one a/c is restricted ; posting not allowed");
	else if ( strncmp(errorCode, "09", 2) == 0 )
		/*sprintf(errorDesc, "Insufficient fund while posting to bankmaster;Pls check");*/
		sprintf(errorDesc, "Account limit exceeded while posting to BM");
	else if ( strncmp(errorCode, "11", 2) == 0 )
		sprintf(errorDesc, "TPG Error:");
	else if ( strncmp(errorCode, "12", 2) == 0 )
		sprintf(errorDesc, "Communication error while posting to bankmaster");
	else if ( strncmp(errorCode, "13", 2) == 0 )
		sprintf(errorDesc, "Timeout while posting to bankmaster ");
	else if ( strncmp(errorCode, "15", 2) == 0 )
		sprintf(errorDesc, "Any one a/c is closed in BM; posting not allowed");
	else if ( strncmp(errorCode, "17", 2) == 0 )
		sprintf(errorDesc, "Transaction posting not allowed at this time");
	else if ( strncmp(errorCode, "25", 2) == 0 )
		sprintf(errorDesc, "Invalid Trans Date ; please check");
	else if ( strncmp(errorCode, "26", 2) == 0 )
		sprintf(errorDesc, "Invalid Trans Amount; please check");
	else if ( strncmp(errorCode, "31", 2) == 0 )
		sprintf(errorDesc, "Wrong Reference number sent to BM; pls.check");
	else if ( strncmp(errorCode, "33", 2) == 0 )
		sprintf(errorDesc, "Customer limit exceeded while posting to BM");
	else if ( strncmp(errorCode, "44", 2) == 0 )
		sprintf(errorDesc, "Account limit exceeded while posting to BM");
	else if ( strncmp(errorCode, "80", 2) == 0 )
		sprintf(errorDesc, "TuxErr: Online GW host not available");
	else if ( strncmp(errorCode, "81", 2) == 0 )
		sprintf(errorDesc, "TuxErr: Invalid service code ");
	else if ( strncmp(errorCode, "98", 2) == 0 )
		sprintf(errorDesc, "Not authorized for this service in BM;please check");
	else if ( strncmp(errorCode, "99", 2) == 0 )
		sprintf(errorDesc, "Internal Error while posting to BM;Report to support");
	else
	{
		sprintf(errorDesc, "Error %.2s received from BM", errorCode);
		return 1;
	}

	return 0;
}

void sadadAlarm()
{
	sadadTimeoutFlag = 1;
}	

processSadadAdvice() 
{
	char tmpStr[100], tmpStr1[50];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSadadAdvice]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}

	readBankingDate();
	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);
	isindexinfo(sadadLogFile, &sadadLogKey, 4);
	strncpy(sadadLogRec.transRefNo, receivedMsg.sadadAdvice.transRefNo, 10);
	strncpy(sadadLogRec.valueDate, bankingDate, 8);
	isstart(sadadLogFile, &sadadLogKey, 0, &sadadLogRec.liveChar, ISGTEQ);

	if ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadAdvice] ISREAD/ISEQUAL error %d occured on stsadadlog while reading trans. reference no. [%.10s] & value date [%.8s] ...\n", getDateTime(), PID, iserrno, receivedMsg.sadadAdvice.transRefNo, bankingDate);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid reference number ...pls. check");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured in stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* Form payment advise message to SADAD */
	memset(sadadRequestMsg.billAdvice.msgLen, ' ', sizeof sadadRequestMsg.billAdvice);
	sadadRequestMsg.billAdvice.nullPad = '\0';
	strncpy(sadadRequestMsg.billAdvice.msgLen, "00000", 5);
	strncpy(sadadRequestMsg.billAdvice.msgType, "0005", 4); /* Advise- Request */
	strncpy(sadadRequestMsg.billAdvice.langInd, sadadLogRec.langInd, 5);
	strncpy(sadadRequestMsg.billAdvice.proxyCustId, sadadLogRec.userId, 10);
	strncpy(sadadRequestMsg.billAdvice.proxyCustType, "BTL", 3); /* BTL - Bank Teller */

	strncpy(sadadRequestMsg.billAdvice.recordCount, "001", 3);
	strncpy(sadadRequestMsg.billAdvice.paymentStatusCode, receivedMsg.sadadAdvice.paymentRef, 12);

	strncpy(sadadRequestMsg.billAdvice.transRefNo, receivedMsg.sadadAdvice.transRefNo, 10);
	strncpy(sadadRequestMsg.billAdvice.bankTransId, sadadLogRec.bankTransId, 32);
	strncpy(sadadRequestMsg.billAdvice.sadadTransId, sadadLogRec.sadadTransId, 32);

	strncpy(sadadRequestMsg.billAdvice.transAmt, sadadLogRec.billAmt, 19);
	formatSadadDateTime(sadadLogRec.transDateTime, tmpStr);
	strncpy(sadadRequestMsg.billAdvice.transDate, tmpStr, 19);
	sprintf(tmpStr1, "%.8s%.6s", sadadLogRec.valueDate, &sadadLogRec.transDateTime[8]);
	formatSadadDateTime(tmpStr1, tmpStr);
	strncpy(sadadRequestMsg.billAdvice.processDate, tmpStr, 19);
	if ( sadadLogRec.subsOrBillNo == 'S' ) 
		strncpy(sadadRequestMsg.billAdvice.subscriptionNo, sadadLogRec.subscriptionNo, 19);
	else
		strncpy(sadadRequestMsg.billAdvice.billNo, sadadLogRec.subscriptionNo, 19);

	strncpy(sadadRequestMsg.billAdvice.companyId, sadadLogRec.companyId, 3);

	sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.billAdvice.msgLen));
	strncpy(sadadRequestMsg.billAdvice.msgLen, tmpStr, 5);

	if ( dealWithTuxedo("SADBILLPAY", sadadRequestMsg.billAdvice.msgLen, sadadResponseMsg.billAdvice.msgLen) == FAILURE )
	{
	}

	formatBranchResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

sendPaymentAdvice(char *pmtRef)
{
	char tmpStr[100], tmpStr1[50];

	/* Form payment advise message to SADAD */
	memset(sadadRequestMsg.billAdvice.msgLen, ' ', sizeof sadadRequestMsg.billAdvice);
	sadadRequestMsg.billAdvice.nullPad = '\0';
	strncpy(sadadRequestMsg.billAdvice.msgLen, "00000", 5);
	strncpy(sadadRequestMsg.billAdvice.msgType, "0005", 4); /* Advise- Request */
	strncpy(sadadRequestMsg.billAdvice.langInd, receivedMsg.sadadPayment.langInd, 5);
	strncpy(sadadRequestMsg.billAdvice.proxyCustId, receivedMsg.sadadPayment.userId, 10);
	strncpy(sadadRequestMsg.billAdvice.proxyCustType, "BTL", 3); /* BTL - Bank Teller */

	strncpy(sadadRequestMsg.billAdvice.recordCount, "001", 3);
	strncpy(sadadRequestMsg.billAdvice.paymentStatusCode, pmtRef, 12);

	strncpy(sadadRequestMsg.billAdvice.transRefNo, receivedMsg.sadadPayment.transRefNo, 10);
	if ( strncmp(pmtRef, "PmtNotTransf", 12) )
	{
		strncpy(sadadRequestMsg.billAdvice.bankTransId, sadadResponseMsg.billPayment.bankTransId, 32);
		strncpy(sadadRequestMsg.billAdvice.sadadTransId, sadadResponseMsg.billPayment.sadadTransId, 32);
	}
	strncpy(sadadRequestMsg.billAdvice.transAmt, receivedMsg.sadadPayment.billAmt, 19);
	formatSadadDateTime(postTransReqMsg.transDate, tmpStr);
	strncpy(sadadRequestMsg.billAdvice.transDate, tmpStr, 19);
	sprintf(tmpStr1, "%.8s%.6s", postTransReqMsg.valueDate, &postTransReqMsg.transDate[8]);
	formatSadadDateTime(tmpStr1, tmpStr);
	strncpy(sadadRequestMsg.billAdvice.processDate, tmpStr, 19);
	strncpy(sadadRequestMsg.billAdvice.billNo, receivedMsg.sadadPayment.billNo, 19);
	strncpy(sadadRequestMsg.billAdvice.subscriptionNo, receivedMsg.sadadPayment.subscriptionNo, 19);
	strncpy(sadadRequestMsg.billAdvice.companyId, receivedMsg.sadadPayment.companyId, 3);

	sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.billAdvice.msgLen));
	strncpy(sadadRequestMsg.billAdvice.msgLen, tmpStr, 5);
	fprintf(logFp, "%s|%5d| [sendPaymentAdvice] ) Sending payment ADVICE to SADAD with paymentReference [%s] ..\n", getDateTime(), PID, pmtRef);
	fflush(logFp);

	if ( dealWithTuxedo("SADBILLPAY", sadadRequestMsg.billAdvice.msgLen, sadadResponseMsg.billAdvice.msgLen) == FAILURE )
		return FAILURE;

	return SUCCESS;
}

formatTxnPostingMsg(char *accNo, double transAmt) 
{
	int hashTotal=0;
	char tmpStr[100];
	/* Preparing request message layout to call POSTTRANS for fund transfer */
	memset(postTransReqMsg.msgLen, ' ', sizeof (struct postTransactionRequest) );
	strncpy(postTransReqMsg.branchName,"StaticData      ",10);
	strncpy(postTransReqMsg.source,"CS", 2);
	strncpy(postTransReqMsg.service,"54", 2);
	strncpy(postTransReqMsg.userId, receivedMsg.sadadPayment.tellerId, 3); 
	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d000", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); /* Milliseconds is hardcoded as 000 &*/
	strncpy(postTransReqMsg.transDate,tmpStr,17);


	strncpy(postTransReqMsg.bmRefNo, receivedMsg.sadadPayment.transRefNo, 10); 
	strncpy(postTransReqMsg.eNarrative1, billerIdRec.englishNarrative1, 25);
	strncpy(postTransReqMsg.aNarrative1, billerIdRec.arabicNarrative1, 25);

	strncpy(postTransReqMsg.eNarrative2, receivedMsg.sadadPayment.subscriptionNo, 19); 
	strncpy(postTransReqMsg.aNarrative2, receivedMsg.sadadPayment.subscriptionNo, 19); 

	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d000", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); /* Milliseconds is hardcoded as 000 &*/
	sprintf(tmpStr, "%.4s - %.6s                 ", receivedMsg.sadadPayment.homeBranch, &postTransReqMsg.transDate[8]);
	strncpy(postTransReqMsg.eNarrative3, tmpStr, 25); 
	strncpy(postTransReqMsg.aNarrative3, tmpStr, 25); 
	postTransReqMsg.dormantAccPosting = dormantAccPosting; /* dormantAccPosting is taken from stsarserv.cfg */

	postTransReqMsg.transCategory = '0';	/* Normal POST */
	strncpy(postTransReqMsg.requestBranchCode, receivedMsg.sadadPayment.homeBranch, 4); /* To write it in corresponing br.TG file*/
	postTransReqMsg.txnSource = 'S';
	strncpy(postTransReqMsg.valueDate, bankingDate, 8);
	strncpy(postTransReqMsg.noOfTransHere,"02",2);

	/* Main Account Transaction */
	strncpy(postTransReqMsg.transInfo[0].accNo, accNo, 14);
	memset(tmpStr,'\0', sizeof tmpStr);
	sprintf(tmpStr,"-%014.0f", transAmt );
	strncpy(postTransReqMsg.transInfo[0].transAmt,tmpStr, 15);
	strncpy(postTransReqMsg.transInfo[0].transType, billerIdRec.transType, 2); 

	/* Contra Account Transaction */
	sprintf(tmpStr, "%.9s%.3s%.2s", billerIdRec.contraAccNo, &receivedMsg.sadadPayment.homeBranch[1], &billerIdRec.contraAccNo[12]);
	strncpy(postTransReqMsg.transInfo[1].accNo, tmpStr, 14);
	memset(tmpStr,'\0', sizeof tmpStr);
	sprintf(tmpStr,"+%014.0f", transAmt );
	strncpy(postTransReqMsg.transInfo[1].transAmt,tmpStr, 15);
	strncpy(postTransReqMsg.transInfo[1].transType, billerIdRec.transType, 2); 

	postTransReqMsg.transInfo[2].accNo[4] = NULL; /* left 4 spaces for hash total */

	sprintf(tmpStr,"%04d",strlen(postTransReqMsg.msgLen));
	strncpy(postTransReqMsg.msgLen, tmpStr,4);

	hashTotal = 0;
	hashTotal = calculateHashTotal(postTransReqMsg.msgLen);

	sprintf(tmpStr, "%04d", hashTotal);
	strncpy(&postTransReqMsg.msgLen[strlen(postTransReqMsg.msgLen)-4], tmpStr, 4);

	return 0;
}

reverseBMTransaction()
{
	char tmpStr[100];
	int  hashTotal=0;
	double billAmt=0.0;

	postTransReqMsg.transCategory = '2' ; /* Send a reversal message to BM */
	hashTotal = 0;
	hashTotal = calculateHashTotal(postTransReqMsg.msgLen);

	sprintf(tmpStr, "%04d", hashTotal);
	strncpy(&postTransReqMsg.msgLen[strlen(postTransReqMsg.msgLen)-4], tmpStr, 4);

	fprintf(logFp, "%s|%5d|[reverseBMTransaction] Send to TUXEDO [%s] \n", getDateTime(), PID, postTransReqMsg.msgLen);
	fflush(logFp);
	if ( dealWithTuxedo("POSTTRANS", postTransReqMsg.msgLen, postTransResponseMsg.msgLen) == FAILURE )
	{
		sprintf(tmpStr, "%.19s", receivedMsg.sadadPayment.billAmt); 
		billAmt=atof(tmpStr);
		sprintf(tmpStr, "Reversal failed from TUXEDO..");
		writeToCsdTransExpFile(receivedMsg.sadadPayment.homeBranch, "reverseBMTransaction", postTransReqMsg.transInfo[0].accNo, postTransReqMsg.transInfo[1].accNo, billAmt,  tmpStr);
		sprintf(tmpStr, "Reversal failed..REPORT to SUPPORT ...");
		formatSadadPaymentResponse(REVERSAL_FAILED, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( strncmp(postTransResponseMsg.responseStatus, "00",2) && 
		strncmp(postTransResponseMsg.responseStatus, "01",2)  )
	{
		fprintf(logFp, "%s|%5d|[reverseBMTransaction] Error [%.2s:%.4s:%.14s:%.30s] received from  online gateway while reversing the transaction; Please check \n", getDateTime(), PID, postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode, postTransResponseMsg.errorAccount, postTransResponseMsg.errorDescription);
		fflush(logFp);

		sprintf(tmpStr, "Error %.2s:%.4s while reversal ; REPORT to SUPPORT", postTransResponseMsg.responseStatus, postTransResponseMsg.detailResponseCode);
		sprintf(tmpStr, "%.19s", receivedMsg.sadadPayment.billAmt); 
		billAmt=atof(tmpStr);
		sprintf(tmpStr, "Reversal failed from TUXEDO..");
		writeToCsdTransExpFile(receivedMsg.sadadPayment.homeBranch, "reverseBMTransaction", postTransReqMsg.transInfo[0].accNo, postTransReqMsg.transInfo[1].accNo, billAmt,  tmpStr);
		formatSadadPaymentResponse(REVERSAL_FAILED, tmpStr, tmpStr);
		return FAILURE;
	}

	return SUCCESS;
}

getSadadReversalMsg()
{
	char tmpStr[100], tmpStr1[25];
	int  hashTotal=0;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[getSadadReversalMsg]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}

	readBankingDate();
	memset(responseMsg.sadadReversal.msgLen, ' ', sizeof responseMsg.sadadReversal);

	if ( strncmp(receivedMsg.sadadReversal.bankingDate, bankingDate, 8) )
	{
		fprintf(logFp, "%s|%5d|[getSadadReversalMsg] Current banking date[%.8s] does not match with the incoming banking date [%.8s] ; Reversal not possible...\n", getDateTime(), PID, bankingDate, receivedMsg.sadadReversal.bankingDate);
		fflush(logFp);

		sprintf(tmpStr, "Reversal possible only for the current date...pls check..");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);
	isindexinfo(sadadLogFile, &sadadLogKey, 4);
	strncpy(sadadLogRec.transRefNo, receivedMsg.sadadReversal.transRefNo, 10);
	strncpy(sadadLogRec.valueDate, receivedMsg.sadadReversal.bankingDate, 8);
	isstart(sadadLogFile, &sadadLogKey, 0, &sadadLogRec.liveChar, ISGTEQ);

	if ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getSadadReversalMsg] ISREAD/ISEQUAL error %d occured on stsadadlog while reading trans. reference no. [%.10s] & value date [%.8s] ...\n", getDateTime(), PID, iserrno, receivedMsg.sadadReversal.transRefNo, receivedMsg.sadadReversal.bankingDate);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid reference number for reversal...pls. check");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured in stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( sadadLogRec.postingStatus == 'R' )
	{
		sprintf(tmpStr, "This bill is already reversed.can't reverse again....");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(receivedMsg.sadadReversal.homeBranch, sadadLogRec.branchCode, 4) )
	{
		fprintf(logFp, "%s|%5d|[getSadadReversalMsg] Original transaction branch code [%.4s] does not match with the incoming branch code [%.4s] ; Reversal not possible...\n", getDateTime(), PID, sadadLogRec.branchCode, receivedMsg.sadadReversal.homeBranch);
		fflush(logFp);

		sprintf(tmpStr, "Reversal possible only for the same branch ...pls check..");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, actualToBmCust(&sadadLogRec.drAccNo[5], tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getSadadReversalMsg] ISREAD/ISEQUAL error %d occured on crd0data for the customer number [%.7s:%.6s] \n", getDateTime(), PID, iserrno, &sadadLogRec.drAccNo[5], crdRec.accNo);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr,"Customer %.7s not found in Bankmaster", &sadadLogRec.drAccNo[5]);
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
	strncpy(responseMsg.sadadReversal.custName, crdRec.shortName, 30);

	strncpy(responseMsg.sadadReversal.userId, sadadLogRec.userId, 10);
	strncpy(responseMsg.sadadReversal.tellerId, sadadLogRec.tellerId, 3);
	strncpy(responseMsg.sadadReversal.companyId, sadadLogRec.companyId, 4);
	if ( sadadLogRec.subsOrBillNo == 'S' )
		strncpy(responseMsg.sadadReversal.subscriptionNo, sadadLogRec.subscriptionNo, 19);
	else
		strncpy(responseMsg.sadadReversal.billNo, sadadLogRec.subscriptionNo, 19);

	strncpy(responseMsg.sadadReversal.langInd, sadadLogRec.langInd, 5);
	strncpy(responseMsg.sadadReversal.paymentType, sadadLogRec.paymentType, 4);
	strncpy(responseMsg.sadadReversal.drAccNo, sadadLogRec.drAccNo, 14);
	strncpy(responseMsg.sadadReversal.billAmt, sadadLogRec.billAmt, 19);
	strncpy(responseMsg.sadadReversal.transRefNo, sadadLogRec.transRefNo, 10);
	responseMsg.sadadReversal.cashOrAcc = sadadLogRec.cashOrAcc; /* A-A/c ; C-Cash */
	responseMsg.sadadReversal.preOrPostpaid = sadadLogRec.preOrPostpaid; /* 0-Post; 1-Pre */

	formatSadadReversalResponse(DONE, "Successful....", "Sucessful...");
	sendResponse(responseMsg.sadadReversal.msgLen);
	return SUCCESS;
}

processSadadTransEnq()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i;
	char tmpStr[100];
	char tAccNo[20], tCustNo[15];
	double transAmt;
	int  noOfIterations=0;
	int completionFlag=YES;
	int  keyUsed = 8;

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processSadadTransEnq]  Entered......\n", getDateTime(), PID);

	memset(responseMsg.sadadTransEnq.msgLen, ' ', sizeof responseMsg.sadadTransEnq);
	responseMsg.sadadTransEnq.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.sadadTransEnq.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);

	if ( strncmp(receivedMsg.sadadTransEnq.companyId, "     ", 4)  )
	{
		keyUsed=8;
		strncpy(sadadLogRec.companyId, receivedMsg.sadadTransEnq.companyId, 4);
		strncpy(sadadLogRec.transDateTime, receivedMsg.sadadTransEnq.transDate, 8);
		strncpy(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3);
	}
	else if ( strncmp(receivedMsg.sadadTransEnq.transDate, "          ", 8) )
	{
		keyUsed=9;
		strncpy(sadadLogRec.transDateTime, receivedMsg.sadadTransEnq.transDate, 8);
		strncpy(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3);
	}
	else if ( strncmp(receivedMsg.sadadTransEnq.enqTellerId, "     ", 3) )
	{
		keyUsed=10;
		strncpy(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3);
	}
	
	isindexinfo(sadadLogFile, &sadadLogKey, keyUsed);
	isstart(sadadLogFile, &sadadLogKey, 0, &sadadLogRec.liveChar, ISGTEQ);

	completionFlag=YES;
	while ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISNEXT) == 0 )
	{
		noOfIterations++;
		if ( noOfIterations > 1000 )
		{
			sleep(1); /* to avoid the server to be on top */
			noOfIterations=0;
		}

		if ( keyUsed == 8 )
		{
			if ( strncmp(sadadLogRec.companyId, receivedMsg.sadadTransEnq.companyId, 4) )
				break;

			if ( strncmp(receivedMsg.sadadTransEnq.transDate, "             ", 8) )
			{
				if ( strncmp(sadadLogRec.transDateTime, receivedMsg.sadadTransEnq.transDate, 8) )
					continue;
			}

			if ( strncmp(receivedMsg.sadadTransEnq.enqTellerId, "     ", 3) )
			{
				if ( strncmp(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3) )
					continue;
			}

			if ( strncmp(receivedMsg.sadadTransEnq.subscriptionNo, "                    ", 19) )
			{
				if ( strncmp(sadadLogRec.subscriptionNo, receivedMsg.sadadTransEnq.subscriptionNo, 19) )
					continue;
			}
		}
		else if ( keyUsed == 9 )
		{
			if ( strncmp(sadadLogRec.transDateTime, receivedMsg.sadadTransEnq.transDate, 8) )
				break;;

			if ( strncmp(receivedMsg.sadadTransEnq.enqTellerId, "     ", 3) )
			{
				if ( strncmp(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3) )
					continue;
			}
		}
		else
		{
			if ( strncmp(sadadLogRec.tellerId, receivedMsg.sadadTransEnq.enqTellerId, 3) )
				break;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( recsInThisMsg < 20 )
		{
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].transDate, sadadLogRec.transDateTime, 8);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].branchCode, sadadLogRec.branchCode, 4);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].tellerId,  sadadLogRec.tellerId, 3);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].companyId,  sadadLogRec.companyId, 4);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].subsNo,  sadadLogRec.subscriptionNo, 19);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].debitAccNo, sadadLogRec.drAccNo, 14);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].billAmt, sadadLogRec.billAmt, 19);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].transRefNo, sadadLogRec.transRefNo, 10);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].valueDate, sadadLogRec.valueDate, 8);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].transType, sadadLogRec.transType, 2);
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].paymentType, sadadLogRec.paymentType, 4);
			responseMsg.sadadTransEnq.details[recsInThisMsg].preOrPostpaid = sadadLogRec.preOrPostpaid;
			responseMsg.sadadTransEnq.details[recsInThisMsg].postingStatus = sadadLogRec.postingStatus;
			responseMsg.sadadTransEnq.details[recsInThisMsg].cashOrAcc = sadadLogRec.cashOrAcc;
			strncpy(responseMsg.sadadTransEnq.details[recsInThisMsg].supervisorId, sadadLogRec.supervisorId, 10);
			recsInThisMsg++;
		}
		else
			completionFlag = NO;
	}
	sprintf(tmpStr, "%05d", recCount);
	strncpy(responseMsg.sadadTransEnq.totalTrans, tmpStr, 5);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.sadadTransEnq.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.sadadTransEnq.noOfRecs, tmpStr, 2);
	if ( completionFlag == YES )
		responseMsg.sadadTransEnq.completionFlag = '1';
	else
		responseMsg.sadadTransEnq.completionFlag = '0';

	strncpy(responseMsg.sadadTransEnq.companyId, receivedMsg.sadadTransEnq.companyId, 4);
	strncpy(responseMsg.sadadTransEnq.transDate, receivedMsg.sadadTransEnq.transDate, 8);
	strncpy(responseMsg.sadadTransEnq.enqTellerId, receivedMsg.sadadTransEnq.enqTellerId, 3);
	strncpy(responseMsg.sadadTransEnq.subscriptionNo, receivedMsg.sadadTransEnq.subscriptionNo, 19);
	responseMsg.sadadTransEnq.details[recsInThisMsg+1].transDate[0] = '\0';

	formatSadadTransEnqResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.sadadTransEnq.msgLen);
	return SUCCESS;
}

processSadadReversal() 
{
	char tmpStr[100], tmpStr1[25];
	int  hashTotal=0;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSadadReversal]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}

	readBankingDate();
	memset(responseMsg.sadadReversal.msgLen, ' ', sizeof responseMsg.sadadReversal);

	if ( strncmp(receivedMsg.sadadReversal.bankingDate, bankingDate, 8) )
	{
		fprintf(logFp, "%s|%5d|[processSadadReversal] Current banking date[%.8s] does not match with the incoming banking date [%.8s] ; Reversal not possible...\n", getDateTime(), PID, bankingDate, receivedMsg.sadadReversal.bankingDate);
		fflush(logFp);

		sprintf(tmpStr, "Reversal possible only for the current date...pls check..");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);
	isindexinfo(sadadLogFile, &sadadLogKey, 4);
	strncpy(sadadLogRec.transRefNo, receivedMsg.sadadReversal.transRefNo, 10);
	strncpy(sadadLogRec.valueDate, receivedMsg.sadadReversal.bankingDate, 8);
	isstart(sadadLogFile, &sadadLogKey, 0, &sadadLogRec.liveChar, ISGTEQ);

	if ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadReversal] ISREAD/ISEQUAL error %d occured on stsadadlog while reading trans. reference no. [%.10s] & value date [%.8s] ...\n", getDateTime(), PID, iserrno, receivedMsg.sadadReversal.transRefNo, receivedMsg.sadadReversal.bankingDate);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Invalid reference number for reversal...pls. check");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured in stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( sadadLogRec.postingStatus == 'R' )
	{
		sprintf(tmpStr, "This bill is already reversed.can't reverse again....");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( sadadLogRec.postingStatus == 'T' )
	{
		sprintf(tmpStr, "This bill is already terminated.can't reverse ....");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(receivedMsg.sadadReversal.homeBranch, sadadLogRec.branchCode, 4) )
	{
		fprintf(logFp, "%s|%5d|[processSadadReversal] Original transaction branch code [%.4s] does not match with the incoming branch code [%.4s] ; Reversal not possible...\n", getDateTime(), PID, sadadLogRec.branchCode, receivedMsg.sadadReversal.homeBranch);
		fflush(logFp);

		sprintf(tmpStr, "Reversal possible only for the same branch ...pls check..");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.sadadReversal.activityFlag == 'S' )
	{
		if ( sadadLogRec.reversalStatus == '1' || sadadLogRec.reversalStatus == '2' )
		{
			fprintf(logFp, "%s|%d|[processSadadReversal] :Transaction reference #[%.10s] already in pending Status.[%c].UserId [%.10s] ; Branch Code [%.4s]\n", getDateTime(), PID, sadadLogRec.transRefNo, sadadLogRec.reversalStatus, sadadLogRec.userId, sadadLogRec.branchCode);
			fflush(logFp);
			if ( sadadLogRec.reversalStatus == '1' )
				sprintf(tmpStr, "Transaction pending with supervisor of Br[%.4s]", sadadLogRec.branchCode);
			else
				sprintf(tmpStr, "Transaction pending with User [%.10s];Br.[%.4s]", sadadLogRec.userId, sadadLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		memset(&sadadConfigRec.liveChar, ' ', sizeof sadadConfigRec);
		strncpy(sadadConfigRec.recType, "SC", 2);
		strncpy(sadadConfigRec.billerId, sadadLogRec.companyId, 3);
		strncpy(sadadConfigRec.paymentType, sadadLogRec.paymentType, 4);
		isindexinfo(sadadCtlFile, &sadadCtlKey, 1);
		isstart(sadadCtlFile, &sadadCtlKey, 0, &sadadConfigRec.liveChar, ISGTEQ);

		if ( isRead(sadadCtlFile, &sadadConfigRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSadadReversal]: ISREAD/EQUAL error %d on stsadctl for key=%.12s\n", getDateTime(), PID, iserrno, sadadConfigRec.recType);
			fflush(logFp);
			if  ( iserrno == 111 || iserrno == 112 || iserrno == 110 )
			{
				sprintf(tmpStr, "Biller Id [%.3s] not configured for reversal..Pls check..", sadadLogRec.companyId);
				formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stsadctl");
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stsadctl", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( sadadConfigRec.reversalAllowed != '1' )
		{
			fprintf(logFp, "%s|%5d|[processSadadReversal]: Biller Id [%.3s] & the payment type [%.4s] is not allowed to reverse in SADAD..the flag set was [%c]\n", getDateTime(), PID, sadadLogRec.companyId, sadadLogRec.paymentType, sadadConfigRec.reversalAllowed);
			fflush(logFp);

			sprintf(tmpStr, "Reversal not AllowedFor Biller[%.3s];PayType[%.4s] in SADAD", sadadLogRec.companyId, sadadLogRec.paymentType);
			formatBranchResponse(REVERSAL_DENIED, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( receivedMsg.sadadReversal.activityFlag == 'S' )
		sadadLogRec.reversalStatus = '1' ; /* Pending with Chief Teller */
	else if ( receivedMsg.sadadReversal.activityFlag == 'A' )
	{
		sadadLogRec.reversalStatus = '2' ; /* Pending with Teller */
		strncpy(sadadLogRec.supervisorId, receivedMsg.sadadReversal.userId, 10);
	}
	else
	{
		sadadLogRec.reversalStatus = '3' ; /* Request is rejected */
		strncpy(sadadLogRec.supervisorId, receivedMsg.sadadReversal.userId, 10);
	}
		
	sprintf(tmpStr,"%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec); 
	strncpy(sadadLogRec.lastUpdateDateTime, tmpStr, 14);
	strncpy(sadadLogRec.lastUpdateUser, receivedMsg.sadadReversal.userId, 10);

	if ( isRewcurr(sadadLogFile, &sadadLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSadadReversal] : ISREWCURR error %d on stsadadlog while updating the record for key [%.28s] while reversing the bill payment\n", getDateTime(), PID, iserrno, sadadLogRec.branchCode);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record on stsadadlog");
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stsadadlog" );
			formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadadlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	formatBranchResponse(DONE, "Successful....", "Sucessful...");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

readSadadReversalPendingList()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i ;
	char tmpStr[100]; 
	char tAccNo[20],tCustNo[15];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[readSadadReversalPendingList]\n", getDateTime(), PID);

	memset(responseMsg.sadadReversalPendingList.msgLen, ' ', sizeof responseMsg.sadadReversalPendingList);
	responseMsg.sadadReversalPendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.sadadReversalPendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&sadadLogRec.liveChar, ' ', sizeof sadadLogRec);

	isindexinfo(sadadLogFile, &sadadLogKey, 7);
	strncpy(sadadLogRec.branchCode, receivedMsg.sadadReversalPendingList.homeBranch,4);

	if( receivedMsg.sadadReversalPendingList.activityFlag == 'S' ) 
	{		
		sadadLogRec.reversalStatus  = '1'; /* Pending with chief teller */
		memset(sadadLogRec.userId, ' ' ,10 );
	}
	else /* TELLER_ACTION */
	{
		sadadLogRec.reversalStatus  = '2'; /* Pending with teller */
		strncpy( sadadLogRec.userId, receivedMsg.sadadReversalPendingList.userId ,10 ); 
	}

	if ( isstart(sadadLogFile,&sadadLogKey, 0, &sadadLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatSadadPendingListResponse(END_OF_FILE, "No more Records to fetch....", "No more Records to fetch....");
		else
		{
			fprintf(logFp,"%s|%5d|[readSadadReversalPendingList] C-ISAM Error %d occured during ISSTART on stsadadlog, key [%.4s %c]\n", getDateTime(), PID, iserrno, sadadLogRec.branchCode, sadadLogRec.reversalStatus);
			sprintf(tmpStr, "CISAM Error %d occured on stsadadlog file", iserrno);
			formatSadadPendingListResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.sadadReversalPendingList.msgLen);
		return FAILURE;
	}

	while ( isRead(sadadLogFile, &sadadLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( receivedMsg.sadadReversalPendingList.activityFlag == 'S' )
		{
		 	if ( strncmp(receivedMsg.sadadReversalPendingList.homeBranch, sadadLogRec.branchCode, 4)  || sadadLogRec.reversalStatus !=  '1' ) 
				break;
		}
		else /* TELLER_ACTION */
		{
		 	if ( strncmp(receivedMsg.sadadReversalPendingList.homeBranch, sadadLogRec.branchCode, 4) || strncmp(receivedMsg.sadadReversalPendingList.userId, sadadLogRec.userId, 10) || sadadLogRec.reversalStatus !=  '2' ) 
				break;
		}

	/*
		if ( strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, "                ", 4) && receivedMsg.swiftCentrePendingList.reqdBranch[0] != NULL && strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, "0000000000000", 4) )
		{
			if ( strncmp(receivedMsg.swiftCentrePendingList.reqdBranch, swiftLogRec.issueBranchCode, 4) )
				continue;
		}
	*/

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */
		
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].userId, sadadLogRec.userId, 10);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].dateTime, sadadLogRec.dateTime, 14);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].transRefNo, sadadLogRec.transRefNo, 10);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].tellerId, sadadLogRec.tellerId, 3);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].billerId, sadadLogRec.companyId, 4);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].subsNo, sadadLogRec.subscriptionNo, 19);
		strncpy(responseMsg.sadadReversalPendingList.details[recsInThisMsg].billAmt, sadadLogRec.billAmt, 19);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.sadadReversalPendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.sadadReversalPendingList.noOfRecs, tmpStr, 2);
	responseMsg.sadadReversalPendingList.details[recsInThisMsg+1].userId[0] = '\0';
	formatSadadPendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.sadadReversalPendingList.msgLen);
	return SUCCESS;
}

processSadadProfile() 
{
	char tmpStr[100], tmpStr1[50];
	char tuxServiceName[50];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSadadProfile]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}
	memset(responseMsg.sadadProfileUpd.msgLen, ' ', sizeof responseMsg.sadadProfileUpd);

	memset(sadadRequestMsg.custProfile.msgLen, ' ', sizeof sadadRequestMsg.custProfile);
	sadadRequestMsg.custProfile.nullPad = '\0';
	strncpy(sadadRequestMsg.custProfile.msgLen, "00000", 5);
	if ( receivedMsg.sadadProfile.action == 'E' ) /* Customer profile enquiry */
	{
		strncpy(sadadRequestMsg.custProfile.msgType, "0019", 4); /* Profile Enquiry- Request */
		sprintf(tuxServiceName, "SADCUSTENQ");
	}
	else if ( receivedMsg.sadadProfile.action == 'A' ) /* Customer profile ADD request */
	{
		strncpy(sadadRequestMsg.custProfile.msgType, "0013", 4); /* Customer Profile Add- Request */
		sprintf(tuxServiceName, "SADCUSTADD");
	}
	else if ( receivedMsg.sadadProfile.action == 'D' ) /* Customer profile DEL request */
	{
		strncpy(sadadRequestMsg.custProfile.msgType, "0021", 4); /* Customer Profile DEL- Request */
		sprintf(tuxServiceName, "SADCUSTDEL");
	}
	else
		sprintf(tuxServiceName, "UNDEFINED");
		

	strncpy(sadadRequestMsg.custProfile.langInd, receivedMsg.sadadProfile.langInd, 5);
	sprintf(tmpStr1, "%-15.15s", receivedMsg.sadadProfile.idNo);
	sprintf(tmpStr, "%-32.32s", tmpStr1);
	strncpy(sadadRequestMsg.custProfile.customerId, tmpStr, 32);
	if ( receivedMsg.sadadProfile.idType == 'Q' )
		strncpy(sadadRequestMsg.custProfile.customerType, "IQA", 3);
	else if ( receivedMsg.sadadProfile.idType == 'I' )
		strncpy(sadadRequestMsg.custProfile.customerType, "NAT", 3);
	else if ( receivedMsg.sadadProfile.idType == 'C' )
		strncpy(sadadRequestMsg.custProfile.customerType, "BIS", 3);
	else 
		strncpy(sadadRequestMsg.custProfile.customerType, "OTH", 3); /* Others */

	strcpy(sadadRequestMsg.custProfile.recordCount, receivedMsg.sadadProfile.recCount);

	sprintf(tmpStr, "%05d", strlen(sadadRequestMsg.custProfile.msgLen));
	strncpy(sadadRequestMsg.custProfile.msgLen, tmpStr, 5);

	if ( dealWithTuxedo(tuxServiceName, sadadRequestMsg.custProfile.msgLen, (receivedMsg.sadadProfile.action=='E'?sadadResponseMsg.custProfileEnq.msgLen:sadadResponseMsg.custProfileUpd.msgLen)) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	fprintf(logFp, "%s|%5d|: Received from TUXEDO [%s] \n", getDateTime(), PID, (receivedMsg.sadadProfile.action=='E'?sadadResponseMsg.custProfileEnq.msgLen:sadadResponseMsg.custProfileUpd.msgLen) );
	fflush(logFp);

	if ( receivedMsg.sadadProfile.action == 'E' )
	{
		strcpy(responseMsg.sadadProfileEnq.langInd, sadadResponseMsg.custProfileEnq.langInd); 
		sprintf(tmpStr, "%.3s", responseMsg.sadadProfileEnq.recCount);
		responseMsg.sadadProfileEnq.details[atoi(tmpStr)].isInProfile[0] = NULL;
		formatSadadProfileEnqResponse(DONE, "Sucessful....", "Successful....");
		sendResponse(responseMsg.sadadProfileEnq.msgLen);
	}
	else
	{
		strcpy(responseMsg.sadadProfileUpd.langInd, sadadResponseMsg.custProfileUpd.langInd); 
		sprintf(tmpStr, "%.3s", responseMsg.sadadProfileUpd.recCount);
		responseMsg.sadadProfileUpd.details[atoi(tmpStr)].updStatusCode[0] = NULL;
		formatSadadProfileUpdResponse(DONE, "Sucessful....", "Successful....");
		sendResponse(responseMsg.sadadProfileUpd.msgLen);
	}
	return SUCCESS;
}

processSadadMaintenance( requiredAction )
char requiredAction;
{
	char tmpStr[100], keyValue[20];
	int i, mode, msgLength=0;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| Inside processSadadMaintenance with required action as [%c]\n", getDateTime(), PID, requiredAction);
		fflush(logFp);
	}

	sprintf(tmpStr, "%.6s", receivedMsg.sadadMaintenance.msgLen);
	msgLength=atoi(tmpStr);

	for ( i=0; i < msgLength; i++)
	{
		if ( receivedMsg.sadadMaintenance.msgLen[i] == NULL )
		{
			fprintf(logFp, "%s|%5d|Found a NULL in the incoming message which is replace by spaces... rec type [%.2s] \n", getDateTime(), PID, receivedMsg.sadadMaintenance.keyValue);
			fflush(logFp);
			receivedMsg.sadadMaintenance.msgLen[i] = ' ';
		}
	}

	switch ( requiredAction )
	{
		case 'E':
			if ( readSadadCtlFile(ISEQUAL, receivedMsg.sadadMaintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			break;

		case 'N' :
			if ( readSadadCtlFile(ISEQUAL, receivedMsg.sadadMaintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			if ( readSadadCtlFile(ISNEXT, receivedMsg.sadadMaintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(sadadCtlRec.recType, receivedMsg.sadadMaintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			else /* next record type received */
			{
				sprintf(tmpStr, "End of file reached                                       ");
				formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, END_OF_FILE, tmpStr);
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'P' :
			if ( readSadadCtlFile(ISEQUAL, receivedMsg.sadadMaintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			if ( readSadadCtlFile(ISPREV, receivedMsg.sadadMaintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(sadadCtlRec.recType, receivedMsg.sadadMaintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			else
			{
				sprintf(tmpStr, "Begining of file reached    ");
				formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, END_OF_FILE, tmpStr);
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'F' :
			sprintf(keyValue, "%.2s          ",receivedMsg.sadadMaintenance.keyValue);
			if ( readSadadCtlFile(ISGTEQ, keyValue) < 0 )
			{
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(sadadCtlRec.recType, receivedMsg.sadadMaintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			else
			{
				sprintf(tmpStr, "No such record type [%.2s] found ", keyValue);
				formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, END_OF_FILE, tmpStr);
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'L' :
			sprintf(keyValue, "%.2s__________",receivedMsg.sadadMaintenance.keyValue);
			if ( readSadadCtlFile(ISGTEQ, keyValue) < 0 )
			{
				if ( iserrno == 111 || iserrno == 112 )
				{
					if ( readSadadCtlFile(ISLAST, keyValue) < 0 )
					{
						sendResponse(responseMsg.sadadMaintenance.msgLen);
						return FAILURE;
					}
				}
			}
			else
			{
				if ( readSadadCtlFile(ISPREV, keyValue) < 0 )
				{
					sendResponse(responseMsg.sadadMaintenance.msgLen);
					return FAILURE;
				}
			}
			if ( strncmp(sadadCtlRec.recType, receivedMsg.sadadMaintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			else
			{
				sprintf(tmpStr, "End of file reached    ");
				formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, END_OF_FILE, tmpStr);
				sendResponse(responseMsg.sadadMaintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'A' :
			if ( addSadadCtlFile(receivedMsg.sadadMaintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			break;
		
		case 'D' :
			if ( deleteSadadCtlFile(receivedMsg.sadadMaintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200); 
			break;

		case 'U' :
			if ( updateSadadCtlFile(receivedMsg.sadadMaintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.sadadMaintenance.arabicName, sadadCtlRec.arabicName, 200);
			break;

		default :
			fprintf(logFp, "Invalid action code[%c] encounterd; Expecting E,N,P,F,L,A,U\n", requiredAction);
			fflush(logFp);
			sprintf(tmpStr, "Invalid action [%c] encounted", requiredAction);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, INCORRECTMSG, tmpStr);
			sendResponse(responseMsg.sadadMaintenance.msgLen);
			return FAILURE;
	}
	formatSadadMaintenanceResponse(sadadCtlRec.recType, DONE, "Successful");
	sendResponse(responseMsg.sadadMaintenance.msgLen);
	return SUCCESS;
}

addSadadCtlFile(keyValue)
char *keyValue;
{
	char tmpStr[300];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| Inside addSadadCtlFile with key value as [%.12s]\n", getDateTime(), PID, keyValue);
		fflush(logFp);
	}
	memset(&sadadCtlRec.liveChar, ' ', sizeof sadadCtlRec);
	sadadCtlRec.liveChar = '@';
	strncpy(sadadCtlRec.recType, keyValue, 12);
	strncpy(sadadCtlRec.arabicName, receivedMsg.sadadMaintenance.arabicName, 50);
	strncpy(sadadCtlRec.englishName, receivedMsg.sadadMaintenance.englishName, 50);
	sprintf(tmpStr, "%-100.100s", receivedMsg.sadadMaintenance.otherDetails);
	strncpy(sadadCtlRec.otherDetails, tmpStr, 100);

	sprintf(tmpStr, "%-20.20s", authorisedUser);
	strncpy(sadadCtlRec.lastUpdateUser, tmpStr, 20);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(sadadCtlRec.lastUpdateDateTime, tmpStr, 14);
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to SADAD control file (stsadctl [%d])...\n", getDateTime(), PID, sadadCtlFile);
		fflush(logFp);
	}
	if ( isWrite(sadadCtlFile, &sadadCtlRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d| ISWRITE error %d on stsadctl for key=%.12s\n", getDateTime(), PID, iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.8s]", keyValue);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, DUPLICATE, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked" );
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, RECORD_LOCKED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadctl", iserrno);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, INTERNALERR, tmpStr);
		}
		sendResponse(responseMsg.sadadMaintenance.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

deleteSadadCtlFile(keyValue)
char *keyValue;
{
	char tmpStr[100];
	if ( readSadadCtlFile(ISEQUAL, keyValue) < 0 )
	{
		sendResponse(responseMsg.sadadMaintenance.msgLen);
		return FAILURE;
	}
	if ( isDelcurr(sadadCtlFile, &sadadCtlRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISDELCURR error %d on stsadctl for key=%.12s\n", getDateTime(), iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 )
		{
			sprintf(tmpStr, "Record not found for [%.8s]", keyValue);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, NOT_FOUND, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, RECORD_LOCKED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadctl", iserrno);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, INTERNALERR, tmpStr);
		}
		sendResponse(responseMsg.sadadMaintenance.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

updateSadadCtlFile(keyValue)
char *keyValue;
{
	char tmpStr[100];
	char tmpLastRefreshDateTime[20];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| Inside updateSadadCtlFile with key value as [%.12s]\n", getDateTime(), PID, keyValue);
		fflush(logFp);
	}
	if ( readSadadCtlFile(ISEQUAL+ISLOCK, keyValue) < 0 )
	{
		sendResponse(responseMsg.sadadMaintenance.msgLen);
		return FAILURE;
	}

	strncpy(sadadCtlRec.arabicName, receivedMsg.sadadMaintenance.arabicName, 50);
	strncpy(sadadCtlRec.englishName, receivedMsg.sadadMaintenance.englishName, 50);
	strncpy(sadadCtlRec.otherDetails, receivedMsg.sadadMaintenance.otherDetails, 100);

	sprintf(tmpStr, "%-20.20s", authorisedUser);
	strncpy(sadadCtlRec.lastUpdateUser, tmpStr, 20);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(sadadCtlRec.lastUpdateDateTime, tmpStr, 14);
	if ( isRewcurr(sadadCtlFile, &sadadCtlRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|: ISREWCURR error %d on stsadctl for key=%.12s\n", getDateTime(), PID, iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.8s]", keyValue);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, DUPLICATE, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, RECORD_LOCKED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadctl", iserrno);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, INTERNALERR, tmpStr);
		}
		sendResponse(responseMsg.sadadMaintenance.msgLen);
		isrelease(sadadCtlFile);
		return FAILURE;
	}
	isrelease(sadadCtlFile);
	return SUCCESS;
}

readSadadCtlFile(mode, keyValue)
int mode;
char *keyValue;
{
	char tmpStr[50];
	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| Inside readSadadCtlFile with key value as [%.12s]\n", getDateTime(), PID, keyValue);
		fflush(logFp);
	}
	memset(&sadadCtlRec.liveChar, ' ', sizeof sadadCtlRec);
	strncpy(sadadCtlRec.recType, keyValue, 12);
	if ( isRead(sadadCtlFile, &sadadCtlRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s : ISREAD/%s error %d on stsadctl for key=%.12s\n", getDateTime(), mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Key value [%.8s] not exists.", keyValue);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, NOT_FOUND, tmpStr);
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, END_OF_FILE, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, RECORD_LOCKED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsadctl", iserrno);
			formatSadadMaintenanceResponse(receivedMsg.sadadMaintenance.keyValue, INTERNALERR, tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}
	fflush(logFp);
	return SUCCESS;
}

openSadadLogFile(int mode)
{
	char tmpStr[100];

	if ( sadadLogFileOpen == YES )
		return SUCCESS;

	if ( (sadadLogFile  = isopen(sadadLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openSadadLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, sadadLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stsadadlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(sadadLogFile, &sadadLogKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stsadadlog file (%d) successfully opened...\n", getDateTime(), PID, sadadLogFile);
		fflush(logFp);
	}

	sadadLogFileOpen = YES;
	return SUCCESS;
}

formatSadadTransEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadTransEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadTransEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadTransEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadTransEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadTransEnq.service, receivedMsg.sadadTransEnq.service, 2);
	responseMsg.sadadTransEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadTransEnq.msgLen));
	strncpy(responseMsg.sadadTransEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadPendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadPendingListResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadReversalPendingList.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadReversalPendingList.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadReversalPendingList.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadReversalPendingList.service, receivedMsg.sadadReversalPendingList.service, 2);
	responseMsg.sadadReversalPendingList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadReversalPendingList.msgLen));
	strncpy(responseMsg.sadadReversalPendingList.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadProfileEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadProfileEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadProfileEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadProfileEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadProfileEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadProfileEnq.service, receivedMsg.sadadProfile.service, 2);
	responseMsg.sadadProfileEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadProfileEnq.msgLen));
	strncpy(responseMsg.sadadProfileEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadProfileUpdResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadProfileUpdResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadProfileUpd.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadProfileUpd.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadProfileUpd.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadProfileUpd.service, receivedMsg.sadadProfile.service, 2);
	responseMsg.sadadProfileUpd.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadProfileUpd.msgLen));
	strncpy(responseMsg.sadadProfileUpd.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadEnq1Response(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadEnq1Response] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadEnq1.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadEnq1.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadEnq1.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadEnq1.service, receivedMsg.sadadEnq.service, 2);
	responseMsg.sadadEnq1.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadEnq1.msgLen));
	strncpy(responseMsg.sadadEnq1.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadPaymentResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadPaymentResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadPayment.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadPayment.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadPayment.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadPayment.service, receivedMsg.sadadPayment.service, 2);
	responseMsg.sadadPayment.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadPayment.msgLen));
	strncpy(responseMsg.sadadPayment.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadReversalResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadReversalResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadReversal.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadReversal.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadReversal.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadReversal.service, receivedMsg.sadadReversal.service, 2);
	responseMsg.sadadReversal.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadReversal.msgLen));
	strncpy(responseMsg.sadadReversal.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSadadEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.sadadEnq.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.sadadEnq.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.sadadEnq.eRemarks,tmpStr,50);
	strncpy(responseMsg.sadadEnq.service, receivedMsg.sadadEnq.service, 2);
	responseMsg.sadadEnq.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.sadadEnq.msgLen));
	strncpy(responseMsg.sadadEnq.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSadadMaintenanceResponse(recType, responseCode, remarks)
char *recType, *responseCode, *remarks;
{
	char tmpStr[120];
	if ( extraDebug )
		fprintf(logFp, "%s|%5d| Formating the response\n", getDateTime(), PID);
	strncpy(responseMsg.sadadMaintenance.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", remarks);
	strncpy(responseMsg.sadadMaintenance.remarks, tmpStr, 50);
	strncpy(responseMsg.sadadMaintenance.service, receivedMsg.sadadMaintenance.service, 2);
	responseMsg.sadadMaintenance.action = receivedMsg.sadadMaintenance.action;
	strncpy(responseMsg.sadadMaintenance.keyValue, recType, 12);
	responseMsg.sadadMaintenance.nullPad = '\0';
	sprintf(tmpStr, "%06d",  strlen(responseMsg.sadadMaintenance.msgLen));
	strncpy(responseMsg.sadadMaintenance.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}



logSadadSearchDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[SADAD bill enquiry ]\n", receivedMsg.sadadEnq.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.sadadEnq.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.sadadEnq.userId);
	fprintf(logFp, "Language Indicator  : %c\n", receivedMsg.sadadEnq.langInd);
	fprintf(logFp, "Customer Number     : %.7s\n", receivedMsg.sadadEnq.custNo);
	fprintf(logFp, "Id Type & Id No     : %c-%.15s\n", receivedMsg.sadadEnq.idType, receivedMsg.sadadEnq.idNo);
	fprintf(logFp, "Subscription Number	: %.19s\n", receivedMsg.sadadEnq.subscriptionNo);
	fprintf(logFp, "Company Id          : %.4s\n", receivedMsg.sadadEnq.companyId);
	fprintf(logFp, "Language Indicator  : %.5s\n", receivedMsg.sadadEnq.newLangInd);
	fprintf(logFp, "Bill Number         : %.19s\n", receivedMsg.sadadEnq.billNo);
	fprintf(logFp, "Start Date          : %.8s\n", receivedMsg.sadadEnq.startDate);
	fprintf(logFp, "End Date            : %.8s\n", receivedMsg.sadadEnq.endDate);
	fprintf(logFp, "Include Payments    : %c\n", receivedMsg.sadadEnq.inclPayments);
	fprintf(logFp, "Include Paid bills  : %c\n", receivedMsg.sadadEnq.inclPaidBills);
	fflush(logFp);
}

logSadadProfileDetails()
{
	int i=0, noOfRecs=0;
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[SADAD customer profile maintenance]\n", receivedMsg.sadadProfile.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.sadadProfile.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.sadadProfile.userId);
	fprintf(logFp, "Language Indicator  : %.5s\n", receivedMsg.sadadProfile.langInd);
	fprintf(logFp, "Id Type & Id No     : %c-%.15s\n", receivedMsg.sadadProfile.idType, receivedMsg.sadadProfile.idNo);
	fprintf(logFp, "Action              : %c\n", receivedMsg.sadadProfile.action);
	fprintf(logFp, "Record Count        : %.3s\n", receivedMsg.sadadProfile.recCount);
	sprintf(tmpStr, "%.3s", receivedMsg.sadadProfile.recCount);
	noOfRecs=atoi(tmpStr);
	for (i=0; i<noOfRecs; i++)
	{
		fprintf(logFp, "Biller Id           : %.3s\n", receivedMsg.sadadProfile.details[i].billerId);
		fprintf(logFp, "Billing Account     : %.19s\n", receivedMsg.sadadProfile.details[i].billingAcct);
	}
	fflush(logFp);
}

logSadadMaintenanceDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[SADAD control table Maintenance]\n", receivedMsg.sadadMaintenance.service);
	fprintf(logFp, "Record Type     : %.12s\n", receivedMsg.sadadMaintenance.keyValue);
	fprintf(logFp, "Action          : %c\n", receivedMsg.sadadMaintenance.action);
	fprintf(logFp, "Arabic Name     : %.50s\n", receivedMsg.sadadMaintenance.arabicName);
	fprintf(logFp, "English Name    : %.50s\n", receivedMsg.sadadMaintenance.englishName);
	fprintf(logFp, "Other details  	: %.100s\n", receivedMsg.sadadMaintenance.otherDetails);
	fflush(logFp);
}

logSadadPaymentDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[SADAD bill payment ]\n", receivedMsg.sadadPayment.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.sadadPayment.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.sadadPayment.userId);
	fprintf(logFp, "Customer Number     : %.7s\n", receivedMsg.sadadPayment.custNo);
	fprintf(logFp, "Id Type & Id No     : %c-%.15s\n", receivedMsg.sadadPayment.idType, receivedMsg.sadadPayment.idNo);
	fprintf(logFp, "Subscription Number	: %.19s\n", receivedMsg.sadadPayment.subscriptionNo);
	fprintf(logFp, "Company Id          : %.4s\n", receivedMsg.sadadPayment.companyId);
	fprintf(logFp, "Language Indicator  : %.5s\n", receivedMsg.sadadPayment.langInd);
	fprintf(logFp, "Bill Number         : %.19s\n", receivedMsg.sadadPayment.billNo);
	fflush(logFp);
}

logSadadReversalDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[GET SADAD bill reversal message ]\n", receivedMsg.sadadReversal.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.sadadReversal.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.sadadReversal.userId);
	fprintf(logFp, "Teller Id           : %.3s\n", receivedMsg.sadadReversal.tellerId);
	fprintf(logFp, "Transaction ref No.	: %.10s\n", receivedMsg.sadadReversal.transRefNo);
	fprintf(logFp, "Banking Date        : %.8s\n", receivedMsg.sadadReversal.bankingDate);
	fprintf(logFp, "Activity Flag       : %c\n", receivedMsg.sadadReversal.activityFlag);
	fflush(logFp);
}

logPymtAdviceDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Send Payment advice message to SADAD ]\n", receivedMsg.sadadAdvice.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.sadadAdvice.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.sadadAdvice.userId);
	fprintf(logFp, "Teller Id           : %.3s\n", receivedMsg.sadadAdvice.tellerId);
	fprintf(logFp, "Transaction ref No.	: %.10s\n", receivedMsg.sadadAdvice.transRefNo);
	fprintf(logFp, "Payment Reference   : %.12s\n", receivedMsg.sadadAdvice.paymentRef);
	fflush(logFp);
}

logSadadPendingReversalDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[SADAD Reversal Pending List]\n", receivedMsg.sadadReversalPendingList.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.sadadReversalPendingList.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.sadadReversalPendingList.userId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.sadadReversalPendingList.lastRecCount);
	/*fprintf(logFp, "Reqd.Trans.RefNo: %.10s\n", receivedMsg.sadadReversalPendingList.transRefNo);*/
	fflush(logFp);
}

logSadadTransEnqDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[SADAD Transaction enquiry]\n", receivedMsg.sadadTransEnq.service);
	fprintf(logFp, "Branch Code     : %.4s\n", receivedMsg.sadadTransEnq.homeBranch);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.sadadTransEnq.userId);
	fprintf(logFp, "Teller Id       : %.3s\n", receivedMsg.sadadTransEnq.tellerId);
	fprintf(logFp, "Company Id      : %.4s\n", receivedMsg.sadadTransEnq.companyId);
	fprintf(logFp, "Trans. Date     : %.8s\n", receivedMsg.sadadTransEnq.transDate);
	fprintf(logFp, "Enq. Teller id  : %.3s\n", receivedMsg.sadadTransEnq.enqTellerId);
	fprintf(logFp, "Last Record     : %.5s\n", receivedMsg.sadadTransEnq.lastRecCount);
	fflush(logFp);

}

char *fullTrim(str)
char *str;
{
	int i,j=0;
	for(i=strlen(str)-1; i>=0 && str[i] == ' '; str[i--] = '\0');
	for(i=0; str[i] == ' ';i++);
	for(;str[i] != '\0';str[j++]=str[i++]);
	str[j]='\0';
	return str;
}
