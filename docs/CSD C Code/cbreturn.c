/*
	Objective       :       Static data management server 
				            (included for return mail maintenance )

	Date            :       14/03/2006.

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
#include "cbreturn.h"

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

#define MANDATE_ACTION			'M'
#define MANDATE_ACTION_CUST		'A' // Added by Rajesh on 06th May 2007 to get the pending list by specific customer 
#define CALL_CENTRE_ACTION		'C'
#define CALL_CENTRE_ACTION_CUST	'D' // Added by Rajesh on 06th May 2007 to get the pending list by specific customer 
#define BRANCH_ACTION     		'B'
#define BRANCH_ACTION_CUST 		'P'
#define SPECIFIC_CUST_ENQ		'S'

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, sadadCtlKey, sadadCtlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, letterKey, retMailKey, ctlKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, sadadCtlFile, sadadCtlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, letterFile, retMailFile,ctlFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *sadadCtlFilePath, *sadadCtlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *retMailFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30], sadadMaxBills[5], sadadAccessChannel[30];

extern FILE *logFp, *errLogFp;

struct letter		letterRec;
struct stretmail	retMailRec, retMailRec1;
struct crd0data		crdRec;
struct gld0data		gldRec;
struct addressInfo	addrTabRec;
struct mailTypeInfo	mailTypeRec;
struct branchActivityOnCustomer		custLogRec;
struct branchActivityOnAccounts		acctLogRec;


/* Tuxedo request & response messages */

struct reqMsgLetterDetail	 letterDetailRequestMsg;
struct resMsgLetterDetail	 letterDetailResponseMsg;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, sadadCtlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, retMailFileOpen;

int stReturnMail(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stReturnMail]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "AB", 2) == 0 ) /* Return mail Enquiry / register return mail */
	{
		logReturnMailSearchDetails();

		if ( openRetMailFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

		if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
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

		if ( processReturnMailSearch() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AC", 2) == 0 ) /*  Returned mail pending List for different branch */
	{
		logReturnMailPendingListDetails();

		if ( openRetMailFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( readReturnMailPendingList() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AD", 2) == 0 ) /*  Returned mail action update */
	{
		logReturnMailActionUpdateDetails();

		if ( openRetMailFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

		if ( processReturnMailActionUpdate() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AE", 2) == 0 ) /*  Returned mail report for the mail centre */
	{
		logReturnedMailReportDetails();

		if ( openRetMailFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCtlFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processReturnedMailReport() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AF", 2) == 0 ) /*  New customers report */
	{
		logNewCustomerReportDetails();

		if ( openCustLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processNewCustomerReport() == FAILURE )
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

formatRefNoKey(char *incomingRefNo, char *keyRefNo, char *letterFileToOpen, char *letterType)
{
	char recdRefNo[25], tmpMailType[10], tmpMailType1[10];
	int  i=0;
	char tmpStr[50];

	memset(tmpMailType1, NULL, sizeof tmpMailType1);

	sprintf(recdRefNo, "%.16s", incomingRefNo);
	sprintf(keyRefNo, "%.4s%.2s%.2s", &recdRefNo[4], &recdRefNo[2], recdRefNo); /* Convert the date from DDMMYYYY to 
																				   YYYYMMDD */
	sprintf(tmpMailType, "%.4s", letterType);
	for (i=0; i < 4; i++)
		tmpMailType1[i] = tolower(tmpMailType[i]);

	sprintf(letterFileToOpen, "let%.4s%.4s", keyRefNo, tmpMailType1);

	/*
	if ( recdRefNo[8] == 'W' ) /* Welcome letter *
	{
		sprintf(tmpMailType, "WELC");
		sprintf(letterFileToOpen, "let%.4swelc", keyRefNo);
	}
	else if ( recdRefNo[8] == 'C' ) /* ATM Card *
	{
		sprintf(tmpMailType, "CARD");
		sprintf(letterFileToOpen, "let%.4scard", keyRefNo);
	}
	else if ( recdRefNo[8] == 'P' ) /* Pensioners' advise letter *
	{
		sprintf(tmpMailType, "PENS");
		sprintf(letterFileToOpen, "let%.4spens", keyRefNo);
	}
	else if ( recdRefNo[8] == 'S' ) /* Statement *
	{
		sprintf(tmpMailType, "STMT");
		sprintf(letterFileToOpen, "let%.4sstmt", keyRefNo);
	}
	else if ( recdRefNo[8] == 'M' ) /* SAMA letter *
	{
		sprintf(tmpMailType, "SAMA");
		sprintf(letterFileToOpen, "let%.4ssama", keyRefNo);
	}
	else if ( recdRefNo[8] == 'T' ) /* Time Deposit Advise letter *
	{
		sprintf(tmpMailType, "TDAV");
		sprintf(letterFileToOpen, "let%.4stdav", keyRefNo);
	}
	*/

	strncpy(&keyRefNo[8], tmpMailType, 4);

	strncpy(&keyRefNo[12], &recdRefNo[9], 7); /*  Copy the sequence number */

	return 0;
}

processReturnMailSearch()
{
	char tmpStr[100], contactNo[50], tmpStr1[25], keyRefNo[25], letterFileToOpen[30];
	char recdRefNo[20], currentDate[20];
	char officeTelNo[50], homeTelNo[50], mobileNo[30], faxNo[50], emailAddr[50];
	int  retMailRecordFound=NO;
	int  noOfOccurence = 0;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailSearch]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}
	getDateTime();
	sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	memset(responseMsg.returnedMail.msgLen, ' ', sizeof responseMsg.returnedMail);
	sprintf(recdRefNo, "%.16s", receivedMsg.returnedMail.refNo);
	memset(&retMailRec.liveChar, ' ', sizeof retMailRec);
	strncpy(retMailRec.refNo, receivedMsg.returnedMail.refNo, 16);

	isindexinfo(retMailFile, &retMailKey, 1);
	isstart(retMailFile, &retMailKey, 0, &retMailRec.liveChar, ISGTEQ);

	retMailRecordFound=NO;
	if ( isRead(retMailFile, &retMailRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailSearch]  ISREAD/ISEQUAL error %d occured on stretmail for the reference number [%.16s] IGNORED and looking to get it from the source......\n", getDateTime(), PID, iserrno, retMailRec.refNo);
		fflush(logFp);
	}
	else
		retMailRecordFound=YES;


	sprintf(recdRefNo, "%.16s", receivedMsg.returnedMail.refNo);
	if ( getMailTypeInfo(recdRefNo[8]) == FAILURE ) /* 9th character in the reference number is the letter type */
	{
		sendResponse(responseMsg.returnedMail.msgLen);
		return FAILURE;
	}

	if ( retMailRecordFound == NO )
	{
		if ( mailTypeRec.whereToLookForDetails == 'O' )		/* Outside */
		{
			memset(letterDetailRequestMsg.msgLen, ' ', sizeof letterDetailRequestMsg);
			strncpy(letterDetailRequestMsg.branchName, "CSD         ", 10); /* STATIC DATA */
			strncpy(letterDetailRequestMsg.source, "CS", 2); /* STATIC DATA */
			strncpy(letterDetailRequestMsg.service, "00", 2);
			strncpy(letterDetailRequestMsg.letterRefNo, receivedMsg.returnedMail.refNo, 16);
			letterDetailRequestMsg.nullPad = '\0';
			sprintf(tmpStr, "%04d", strlen(letterDetailRequestMsg.msgLen));
			strncpy(letterDetailRequestMsg.msgLen, tmpStr, 4);

			if ( dealWithTuxedo("LETTERDTLS", letterDetailRequestMsg.msgLen, letterDetailResponseMsg.msgLen) == FAILURE )
			{
				sendResponse(responseMsg.returnedMail.msgLen);
				return FAILURE;
			}

			if ( strncmp(letterDetailResponseMsg.responseStatus, "00", 2) )
			{
				fprintf(logFp, "%s|%5d|[processReturnMailSearch]: Error [%.2s;%.50s] received from TUXEDO; Please check with Support..\n", getDateTime(), PID, letterDetailResponseMsg.responseStatus, letterDetailResponseMsg.errorDescription);
				fflush(logFp);
				if ( strncmp(letterDetailResponseMsg.responseStatus, "18", 2) ==0 )
				{
					sprintf(tmpStr,"Reference number does not exist ... Please check ...");
					formatReturnMailEnqResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else if ( strncmp(letterDetailResponseMsg.responseStatus, "03", 2) == 0  )
				{
					sprintf(tmpStr,"Incorrect message sent to TUXEDO ... Please check ...");
					formatReturnMailEnqResponse(INCORRECTMSG, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr,"Error %.2s received from TUXEDO. Please check with SUPPORT",letterDetailResponseMsg.responseStatus);
					formatReturnMailEnqResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.returnedMail.msgLen);
				return FAILURE;
			}

			strncpy(retMailRec.branchCode, letterDetailResponseMsg.branchCode, 4);
			strncpy(retMailRec.address1, letterDetailResponseMsg.address1, 30);
			strncpy(retMailRec.poBox, letterDetailResponseMsg.poBoxOrUnit, 10);
			strncpy(retMailRec.cityName, letterDetailResponseMsg.cityName, 20);
			strncpy(retMailRec.zipCode, letterDetailResponseMsg.zipCode, 10);
			strncpy(retMailRec.custNo, letterDetailResponseMsg.custNo, 7);
			strncpy(retMailRec.productId, letterDetailResponseMsg.productId, 20);

			/* Tuxedo service to be called here once the table and service are ready
			sprintf(tmpStr, "Letter lookup is defined as OUTSIDE; Please call SUPPORT ");
			formatReturnMailEnqResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.returnedMail.msgLen);
			return FAILURE;
			*/
		}
		else
		{
			formatRefNoKey(receivedMsg.returnedMail.refNo, keyRefNo, letterFileToOpen, mailTypeRec.letterType);
			memset(&letterRec.liveChar, ' ', sizeof letterRec);
			if ( openLetterFile(letterFileToOpen, ISMANULOCK + ISINOUT)  < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			strncpy(letterRec.dateGenerated, keyRefNo, 19);

			fprintf(logFp, "%s|%5d|[processReturnMailSearch]  Reading the letter reference number [%.16s] [%.19s] from the file [%s] ...\n", getDateTime(), PID, receivedMsg.returnedMail.refNo, keyRefNo, letterFileToOpen);
			fflush(logFp);

			if ( isRead(letterFile, &letterRec.liveChar, ISEQUAL) < 0 ) 
			{
				fprintf(logFp, "%s|%5d| ISREAD/ISEQUAL error %d occured on letter file [%s] for the reference number [%.16s] \n", getDateTime(), PID, iserrno, letterFileToOpen, keyRefNo);
				fflush(logFp);

				if ( iserrno == 111 || iserrno == 110 )
				{
					sprintf(tmpStr, "Invalid reference number ..Please check..");
					formatReturnMailEnqResponse(NOT_FOUND, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "Error %d occured while reading letter file..", iserrno);
					formatReturnMailEnqResponse(INTERNALERR, tmpStr, tmpStr);
				}

				sendResponse(responseMsg.returnedMail.msgLen);
				return FAILURE;
			}
			strncpy(retMailRec.branchCode, letterRec.branchCode, 4);
			strncpy(retMailRec.address1, letterRec.address1, 30);
			strncpy(retMailRec.poBox, letterRec.poBox, 10);
			strncpy(retMailRec.cityName, letterRec.cityName, 20);
			strncpy(retMailRec.zipCode, letterRec.zipCode, 10);
			strncpy(retMailRec.custNo, letterRec.custNo, 7);
			strncpy(retMailRec.productId, letterRec.productId, 20);
			isclose(letterFile); /* Close the letter file since filename may be different every time */
		}
	}
	else /* Mail information found in returned mail file (stretmail) */
	{
		isindexinfo(retMailFile, &retMailKey, 4);
		memset(&retMailRec1.liveChar, ' ', sizeof retMailRec1);
		strncpy(retMailRec1.custNo, retMailRec.custNo, 7);
		isstart(retMailFile, &retMailKey, 7, &retMailRec.liveChar, ISGTEQ);

		noOfOccurence = 0;
		while ( isRead(retMailFile, &retMailRec1.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(retMailRec1.custNo, retMailRec.custNo, 7) )
				break;

			if ( strncmp(retMailRec1.refNo, retMailRec.refNo, 16) == 0 ) /* Ignore the reference number in this search */
				continue;

			noOfOccurence++;
		}
		sprintf(tmpStr, "%03d", noOfOccurence);
		strncpy(responseMsg.returnedMail.noOfPrevOccur, tmpStr, 3);
	}

	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(retMailRec.custNo, tmpStr), 6);

	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailSearch] ISREAD/ISEQUAL error %d occured while reading crd0data for customer # [%.7s] [%.6s] IGNORED \n", getDateTime(), PID, iserrno, retMailRec.custNo, crdRec.accNo);
		fflush(logFp);

		sprintf(tmpStr, "Customer [%.7s] not found in BM ", retMailRec.custNo);
		strncpy(crdRec.shortName, tmpStr, 30);
	}

	strncpy(responseMsg.returnedMail.refNo, receivedMsg.returnedMail.refNo, 16);
	strncpy(responseMsg.returnedMail.custNo, retMailRec.custNo, 7); 
	strncpy(responseMsg.returnedMail.productId, retMailRec.productId, 20);
	strncpy(responseMsg.returnedMail.custName, crdRec.shortName, 30);  
	responseMsg.returnedMail.custSegmentFlag = crdRec.packageAcc;
	strncpy(responseMsg.returnedMail.address1, retMailRec.address1, 30);
	strncpy(responseMsg.returnedMail.poBox, retMailRec.poBox, 10);
	strncpy(responseMsg.returnedMail.cityName, retMailRec.cityName, 20);
	strncpy(responseMsg.returnedMail.zipCode, retMailRec.zipCode, 10);
	memset(officeTelNo, ' ', sizeof officeTelNo);
	memset(homeTelNo, ' ', sizeof homeTelNo);
	memset(mobileNo, ' ', sizeof mobileNo);
	memset(faxNo, ' ', sizeof faxNo);
	memset(emailAddr, ' ', sizeof emailAddr);
	getContactNo(retMailRec.custNo, officeTelNo, homeTelNo, mobileNo, faxNo, emailAddr);

	/*responseMsg.returnedMail.addressType = addrTabRec.addrType; /* to display whether address is PO.BOX/GPS address */

	strncpy(responseMsg.returnedMail.offTelNo, officeTelNo, 20);
	strncpy(responseMsg.returnedMail.homeTelNo, homeTelNo, 20);
	strncpy(responseMsg.returnedMail.faxNo, faxNo, 20);
	strncpy(responseMsg.returnedMail.mobileNo, mobileNo, 10);
	strncpy(responseMsg.returnedMail.eMail, emailAddr, 30);
	sprintf(tmpStr, "%.4s%.2s%.2s", &retMailRec.refNo[4], &retMailRec.refNo[2], retMailRec.refNo);
	strncpy(responseMsg.returnedMail.dateGenerated, tmpStr, 8);
	strncpy(responseMsg.returnedMail.branchCode, retMailRec.branchCode, 4);
	strncpy(responseMsg.returnedMail.returnedDate, retMailRec.returnedDate, 8);
	strncpy(responseMsg.returnedMail.registeredUser, retMailRec.registeredUser, 10);
	strncpy(responseMsg.returnedMail.registeredBranch, retMailRec.registeredBranch, 4);
	responseMsg.returnedMail.returnedReason =  retMailRec.returnedReason;
	strncpy(responseMsg.returnedMail.verficationActionDate,retMailRec.verficationActionDate, 8);		
	strncpy(responseMsg.returnedMail.verficationActionUser,retMailRec.verficationActionUser, 10);		
	strncpy(responseMsg.returnedMail.verficationActionBranch,retMailRec.verficationActionBranch, 4);		
	responseMsg.returnedMail.verificationActionTaken = retMailRec.verificationActionTaken;
	strncpy(responseMsg.returnedMail.verificationUserRemarks, retMailRec.verificationUserRemarks, 75);
	strncpy(responseMsg.returnedMail.callCenterActionDate,retMailRec.callCenterActionDate, 8);		
	strncpy(responseMsg.returnedMail.callCenterActionUser,retMailRec.callCenterActionUser, 10);		
	strncpy(responseMsg.returnedMail.callCenterActionBranch,retMailRec.callCenterActionBranch, 4);		
	strncpy(responseMsg.returnedMail.callCenterUserRemarks, retMailRec.callCenterUserRemarks, 75);
	responseMsg.returnedMail.callCenterActionTaken = retMailRec.callCenterActionTaken;
	strncpy(responseMsg.returnedMail.deliveryDate,retMailRec.deliveryDate, 8);		
	strncpy(responseMsg.returnedMail.deliveryUser,retMailRec.deliveryUser, 10);		
	strncpy(responseMsg.returnedMail.deliveryBranch,retMailRec.deliveryBranch, 4);		
	responseMsg.returnedMail.deliveryActionTaken = retMailRec.deliveryActionTaken;
	responseMsg.returnedMail.deliveredToCustomer = retMailRec.deliveredToCustomer;
	strncpy(responseMsg.returnedMail.deliveryUserRemarks,retMailRec.deliveryUserRemarks, 75);		

	if ( receivedMsg.returnedMail.msgType == '1' ) /* Register return mail */
	{
		if ( retMailRecordFound == YES )
		{
			fprintf(logFp, "%s|%5d|[processReturnMailSearch] Already the reference number [%.16s] is registerd as RETURNED mail in stretmail on [%.8s] by the user [%.10s] ; so, cannot register as RETURNED again \n", getDateTime(), PID, retMailRec.refNo, retMailRec.returnedDate, retMailRec.registeredUser);
			fflush(logFp);
			sprintf(tmpStr, "Letter already registerd as RETURNED                  ");
			formatReturnMailEnqResponse(DUPLICATE, tmpStr, tmpStr);
			sendResponse(responseMsg.returnedMail.msgLen);
			return FAILURE;
		}
		retMailRec.liveChar = '@';
		strncpy(retMailRec.returnedDate,  currentDate, 8);
		strncpy(retMailRec.registeredUser, receivedMsg.returnedMail.userId, 10);
		strncpy(retMailRec.registeredBranch, receivedMsg.returnedMail.homeBranch, 4);
		retMailRec.returnedReason = receivedMsg.returnedMail.returnedReason;
		retMailRec.verificationActionTaken = '0'; /* Pending for mandate branch*/
		retMailRec.callCenterActionTaken   = '0'; /* Pending for call centre   */
		retMailRec.deliveryActionTaken     = '0'; /* Pending for branch action */
		strncpy(retMailRec.lastUpdateUser, receivedMsg.returnedMail.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(retMailRec.lastUpdateDateTime, tmpStr, 14);

		if ( isWrite(retMailFile, &retMailRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReturnMailSearch] ISWRITE error %d occured on stretmail for key [%.16s]; customer number [%.7s] \n", getDateTime(), PID, iserrno, retMailRec.refNo, retMailRec.custNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while registering returned mail;Pls.check     ", iserrno);
			formatReturnMailEnqResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.returnedMail.msgLen);
			return FAILURE;
		}
		updateStmtFreq();
	}

	formatReturnMailEnqResponse(DONE, "Successful.....", "Successfull.....");
	sendResponse(responseMsg.returnedMail.msgLen);
	return SUCCESS;
}

updateStmtFreq()
{
	char bmCustNo[10], oldPasswd;
	char tmpStr[50];

	memset(&gldRec.liveChar, ' ', sizeof gldRec);
	strncpy(&gldRec.accNo[5], actualToBmCust(retMailRec.custNo, bmCustNo), 6);
	isindexinfo(gldFile, &gldKey, 3);
	isstart(gldFile, &gldKey, 0, &gldRec.liveChar, ISGTEQ);

	while ( isRead(gldFile, &gldRec.liveChar, ISNEXT) ==  0 )
	{
		if ( strncmp(&gldRec.accNo[5], bmCustNo, 6) )
			break;

		if ( strncmp(&gldRec.accNo[2], "008", 3) && strncmp(&gldRec.accNo[2], "009", 3) ) /* If it is not current & saving a/c,skip */
			continue;

		if ( gldRec.passwd == '2' || gldRec.passwd == '3' ) /* Account is closed */
			continue;

		if ( gldRec.statementFrequency[0] == 'N' ) /* If the account is already set as Non-auto, skip */
			continue;

		if ( crdRec.swiftMemberFlag == '1' ) /* Ignore Swift Member flagging as N; mail from Arul on 26/05/2007 */
			continue;

		strncpy(gldRec.statementFrequency, "N00", 3);

		if ( isRewcurr(gldFile, &gldRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| [updateStmtFreq] ISREWCURR error %d on gld0data for the account number [%.13s] \n", getDateTime(), PID, iserrno, gldRec.accNo);
			fflush(logFp);
			sprintf(tmpStr, "Error %d occured while updating gld0data for the account [%.13s]", iserrno, gldRec.accNo);
			writeToExceptionReport(receivedMsg.returnedMail.homeBranch, "updateStmtFreq", tmpStr);
			continue; 
		}

		/* Now , write a record in stacclog for history purpose */

		memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);

		acctLogRec.liveChar = '@';
		strncpy(acctLogRec.branchCode, receivedMsg.returnedMail.homeBranch, 4);
		strncpy(acctLogRec.userId, receivedMsg.returnedMail.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.dateTime, tmpStr, 14);
		strncpy(acctLogRec.accNo, bmAccToActual(gldRec.accNo, tmpStr), 14);
		acctLogRec.newOrUpdate = 'U';
		strncpy(acctLogRec.supervisorId, "1_RET_MAIL     ", 10);
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
		strncpy(acctLogRec.acctDesc, gldRec.accDesc, 30);
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
			fprintf(logFp, "%s|%5d|[updateStmtFreq] Before writing to acctLogFile (%d) ..\n", getDateTime(), PID, acctLogFile);
			fflush(logFp);
		}
		if ( isWrite(acctLogFile, &acctLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateStmtFreq] ISWRITE error %d occured on stacclog for the acc # [%.14s] [%.13s] \n", getDateTime(), PID, iserrno, acctLogRec.accNo, gldRec.accNo);
			fflush(logFp);
		}
	}

	return SUCCESS;
}

getContactNo(char *tmpCustNo, char *officeTelNo, char *homeTelNo, char *mobileNo, char *faxNo, char *emailAddr)
{
    char tmpStr[100], tmpStr1[50];
    char area[10];
    char tel[20];
    char ext[10];

	memset(&addrTabRec.liveChar,' ', sizeof addrTabRec);
	strncpy(addrTabRec.custNo, tmpCustNo, 7);
	strncpy(addrTabRec.addressType, "00", 2);
	strncpy(addrTabRec.addressNo, "0000", 4);
	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

	if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp,"%s|%5d| [getContactNo] ISREAD/ISEQUAL error %d on staddrtab for customer [%.7s] ; address Type [00] & address Number [0000]..\n", getDateTime(), PID, iserrno, tmpCustNo);
		fflush(logFp);
	    return -1;
	}

	memset(tmpStr, '\0', sizeof tmpStr);
	if ( strncmp(addrTabRec.telOffNo, "           ", 10) )
	{
		sprintf(area, "%.4s", addrTabRec.telOffAreaCode);
		trim(area);
		sprintf(tel, "%.10s", addrTabRec.telOffNo);
		trim(tel);
		sprintf(ext, "%.4s", addrTabRec.telOffExt);
		trim(ext);

		if(strncmp(addrTabRec.telOffAreaCode, "     ", 4))
			sprintf(tmpStr, "%s-%s",area, tel);
		else
			sprintf(tmpStr, "%s", tel);

		if(strncmp(addrTabRec.telOffExt, "     ", 4))
		      sprintf(tmpStr1, "%s Ext.:%s", tmpStr, ext);
	    else
		      strcpy(tmpStr1, tmpStr);

		sprintf(officeTelNo, "%-20.20s", tmpStr1);
	}

	if ( strncmp(addrTabRec.telHomeNo, "           ", 10) )
	{
		sprintf(area, "%.4s", addrTabRec.telHomeAreaCode);
		trim(area);
		sprintf(tel, "%.10s", addrTabRec.telHomeNo);
		trim(tel);
		sprintf(ext, "%.4s", addrTabRec.telHomeExt);
		trim(ext);

		if ( strncmp(addrTabRec.telHomeAreaCode, "     ", 4) )
			sprintf(tmpStr, "%s-%s", area, tel);
		else
			sprintf(tmpStr, "%s", tel);

		if ( strncmp(addrTabRec.telHomeExt, "     ", 4) )
		      sprintf(tmpStr1, "%s Ext.:%s", tmpStr,ext);
	    else
		      strcpy(tmpStr1, tmpStr);

		sprintf(homeTelNo, "%-20.20s", tmpStr1);
	}

	if ( strncmp(addrTabRec.faxNo, "             ", 10) )
	{
		sprintf(area, "%.4s", addrTabRec.faxAreaCode);
		trim(area);
		sprintf(tel, "%.10s", addrTabRec.faxNo);
		trim(tel);
		sprintf(ext, "%.4s", addrTabRec.faxExt);
		trim(ext);

		if ( strncmp(addrTabRec.faxAreaCode, "     ", 4) )
			sprintf(tmpStr, "%s-%s", area, tel);
		else
			sprintf(tmpStr, "%s", tel);

		if ( strncmp(addrTabRec.faxExt, "     ", 4) )
		      sprintf(tmpStr1, "%s Ext.:%s", tmpStr,ext);
	    else
		      strcpy(tmpStr1, tmpStr);

		sprintf(faxNo, "%-20.20s", tmpStr1);
	}

	memset(tmpStr1, ' ', sizeof tmpStr1);
	if(strncmp(addrTabRec.mobileNo, "           ", 10))
		sprintf(tmpStr1, "%.10s", addrTabRec.mobileNo);

	sprintf(mobileNo, "%-10.10s", tmpStr1);

	memset(tmpStr1, ' ', sizeof tmpStr1);
	if ( strncmp(addrTabRec.eMail, "                         ", 20) )
		sprintf(tmpStr1, "%.30s", addrTabRec.eMail);

	sprintf(emailAddr, "%-30.30s", tmpStr1);

	return 0;
}

readReturnMailPendingList() 
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0 ;
	char tmpStr[100], letterType; 
	char tAccNo[20],tCustNo[15];
	char  pendingType;
	int i=0, len;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readReturnMailPendingList]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.returnedMailPendingList.msgLen, ' ', sizeof responseMsg.returnedMailPendingList);
	responseMsg.returnedMailPendingList.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.returnedMailPendingList.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&retMailRec.liveChar, ' ', sizeof retMailRec);

	if ( receivedMsg.returnedMailPendingList.msgType == 'M')  /* Mandate Pending List */
	{		
		isindexinfo(retMailFile,&retMailKey, 5);
		retMailRec.verificationActionTaken = '0'; /* Pending */
		pendingType = MANDATE_ACTION;
		if ( strncmp(receivedMsg.returnedMailPendingList.custNo, "            ", 7) )
		{
			strncpy(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7);
			pendingType = MANDATE_ACTION_CUST;
		}
	}
	else if ( receivedMsg.returnedMailPendingList.msgType == 'C' )  /* Call centre Pending List */
	{
		isindexinfo(retMailFile,&retMailKey, 6);
		retMailRec.callCenterActionTaken  = '0';
		pendingType = CALL_CENTRE_ACTION;
		if ( strncmp(receivedMsg.returnedMailPendingList.custNo, "            ", 7) )
		{
			strncpy(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7);
			pendingType = CALL_CENTRE_ACTION_CUST;
		}
	}
	else if ( receivedMsg.returnedMailPendingList.msgType == 'B' )  /* Branch Pending List */
	{
		if ( strncmp(receivedMsg.returnedMailPendingList.custNo, "            ", 7) )
		{
			isindexinfo(retMailFile,&retMailKey, 4);
			strncpy(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7);
			strncpy(retMailRec.branchCode, receivedMsg.returnedMailPendingList.homeBranch, 4);
			pendingType = BRANCH_ACTION_CUST;
		}
		else
		{
			isindexinfo(retMailFile,&retMailKey, 7);
			retMailRec.deliveryActionTaken  = '0';
			strncpy(retMailRec.branchCode, receivedMsg.returnedMailPendingList.homeBranch, 4);
			pendingType = BRANCH_ACTION;
		}
	}
	else if ( receivedMsg.returnedMailPendingList.msgType == 'S' )  /* Specific customer enquiry */
	{
		isindexinfo(retMailFile,&retMailKey, 4);
		strncpy(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7);
		pendingType = SPECIFIC_CUST_ENQ;
	}

	isstart(retMailFile, &retMailKey, 0, &retMailRec.liveChar, ISGTEQ);

	while ( isRead(retMailFile, &retMailRec.liveChar, ISNEXT) == 0 )
	{
		len = sizeof(retMailRec);
		for ( i=0; i < len; i++)
		{
			if ( retMailRec.refNo[i] == NULL )
				retMailRec.refNo[i] = ' ';
		}
		if ( pendingType == MANDATE_ACTION ) /* Mandate Pending */
		{	
			if ( retMailRec.verificationActionTaken !=  '0')  /* If not PENDING */
				break;
		}
		else if ( pendingType == MANDATE_ACTION_CUST ) /* Mandate Pending with specific customer */
		{	
			if ( retMailRec.verificationActionTaken !=  '0' || strncmp(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo,7) )  /* If not PENDING */
				break;
		}
		else if ( pendingType == CALL_CENTRE_ACTION ) /* Call centre pending */
		{
			if ( retMailRec.callCenterActionTaken !=  '0')  /* If not PENDING */
				break;

			if ( retMailRec.verificationActionTaken ==  '0' ) /* Ignore all the returned mails pending for Mandate actions */
				continue;
		}
		else if ( pendingType == CALL_CENTRE_ACTION_CUST ) /* Call centre Pending with specific customer */
		{	
			if ( retMailRec.callCenterActionTaken !=  '0' || strncmp(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo,7) )  /* If not PENDING */
				break;

			if ( retMailRec.verificationActionTaken ==  '0' ) /* Ignore all the returned mails pending for Mandate actions */
				continue;
		}
		else if ( pendingType == BRANCH_ACTION_CUST || pendingType == BRANCH_ACTION ) /* Branch Pending */
		{
			if ( getMailTypeInfo(retMailRec.refNo[8]) == FAILURE )/* 9th character in the reference number is the letter type */
			{
				sendResponse(responseMsg.returnedMail.msgLen);
				return FAILURE;
			}

			if ( mailTypeRec.despatchedToBranches != '1' ) /* IGNORE if the mail is not despatched to branches */
				continue;

			if ( pendingType == BRANCH_ACTION_CUST )
			{
				if ( strncmp(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7) ||
					 strncmp(retMailRec.branchCode, receivedMsg.returnedMailPendingList.homeBranch, 4) )
					break;

				if ( retMailRec.deliveryActionTaken !=  '0')  /* If not PENDING */
					continue;
			}
			else
			{
				if ( retMailRec.deliveryActionTaken !=  '0' ||   
					 strncmp(retMailRec.branchCode, receivedMsg.returnedMailPendingList.homeBranch, 4) ) 
					 break;
			}
		}
		else /* specific customer enquiry */
		{
			if ( strncmp(retMailRec.custNo, receivedMsg.returnedMailPendingList.custNo, 7) )
				break;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].letterRefNo, retMailRec.refNo, 16);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].custNo, retMailRec.custNo, 7);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].productId, retMailRec.productId, 20);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].address1, retMailRec.address1, 30);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].poBox, retMailRec.poBox, 10);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].cityName, retMailRec.cityName, 20);
		strncpy(responseMsg.returnedMailPendingList.details[recsInThisMsg].zipCode, retMailRec.zipCode, 10);

		if ( ++recsInThisMsg >=  20 )
			break;
	}	
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.returnedMailPendingList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.returnedMailPendingList.noOfRecs, tmpStr, 2);
	responseMsg.returnedMailPendingList.details[recsInThisMsg+1].letterRefNo[0] = '\0';
	formatReturnMailPendingListResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.returnedMailPendingList.msgLen);
	return SUCCESS;
}

processReturnMailActionUpdate() 
{
	char tmpStr[100], tmpStr1[25];
	char recdRefNo[20], currentDate[20];
	int  retMailRecordFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailActionUpdate]  Entered......\n", getDateTime(), PID);
		fflush(logFp);
	}
	getDateTime();
	sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	sprintf(recdRefNo, "%.16s", receivedMsg.returnedMail.refNo);
	memset(&retMailRec.liveChar, ' ', sizeof retMailRec);
	strncpy(retMailRec.refNo, receivedMsg.returnedMailStatusUpdate.refNo, 16);

	isindexinfo(retMailFile, &retMailKey, 1);
	isstart(retMailFile, &retMailKey, 0, &retMailRec.liveChar, ISGTEQ);

	if ( isRead(retMailFile, &retMailRec.liveChar, ISEQUAL+ISLOCK) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailActionUpdate]  ISREAD/ISEQUAL error %d occured on stretmail for the reference number [%.16s] ......\n", getDateTime(), PID, iserrno, retMailRec.refNo);
		fflush(logFp);
		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Reference number does not exist..Please check..");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr); 
		}
		else
		{
			sprintf(tmpStr, "C-ISAM error %d occured on stretmail..Please check..", iserrno);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr); 
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.returnedMailStatusUpdate.msgType == 'M' )  /* Mandate Action */
	{
		strncpy(retMailRec.verficationActionDate, currentDate, 8);
		strncpy(retMailRec.verficationActionUser, receivedMsg.returnedMailStatusUpdate.userId, 10);
		strncpy(retMailRec.verficationActionBranch, receivedMsg.returnedMailStatusUpdate.homeBranch, 4);

		if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '1' ) /* Address fixed */
			retMailRec.verificationActionTaken = '1';
		else if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '2' ) /* Address not fixed */
			retMailRec.verificationActionTaken = '2';

		strncpy(retMailRec.verificationUserRemarks, receivedMsg.returnedMailStatusUpdate.remarks, 75);
	}
	else if ( receivedMsg.returnedMailStatusUpdate.msgType == 'C' )  /* Call centre Action */
	{
		strncpy(retMailRec.callCenterActionDate, currentDate, 8);
		strncpy(retMailRec.callCenterActionUser, receivedMsg.returnedMailStatusUpdate.userId, 10);
		strncpy(retMailRec.callCenterActionBranch, receivedMsg.returnedMailStatusUpdate.homeBranch, 4);
		if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '1' ) /* Address fixed */
			retMailRec.callCenterActionTaken = '1';
		else if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '2' ) /* Address not fixed */
			retMailRec.callCenterActionTaken = '9';
		else if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '3' ) /* Customer not reachable */
			retMailRec.callCenterActionTaken = '3';

		strncpy(retMailRec.callCenterUserRemarks, receivedMsg.returnedMailStatusUpdate.remarks, 75);
	}
	else if ( receivedMsg.returnedMailStatusUpdate.msgType == 'B' )  /* Branch Action */
	{
		strncpy(retMailRec.deliveryDate, currentDate, 8);
		strncpy(retMailRec.deliveryUser, receivedMsg.returnedMailStatusUpdate.userId, 10);
		strncpy(retMailRec.deliveryBranch, receivedMsg.returnedMailStatusUpdate.homeBranch, 4);
		if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '1' ) /* Address fixed */
			retMailRec.deliveryActionTaken = '1';
		else if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '2' ) /* Address not fixed */
			retMailRec.deliveryActionTaken = '9';
		else if ( receivedMsg.returnedMailStatusUpdate.addressFixed == '3' ) /* Statement disabled */
			retMailRec.deliveryActionTaken = '3';

		retMailRec.deliveredToCustomer = receivedMsg.returnedMailStatusUpdate.deliveredToCustomer;
		strncpy(retMailRec.deliveryUserRemarks, receivedMsg.returnedMailStatusUpdate.remarks, 75);
	}

	strncpy(retMailRec.lastUpdateUser, receivedMsg.returnedMailStatusUpdate.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(retMailRec.lastUpdateDateTime, tmpStr, 14);

	/* Update the returned mail file with the corresponding action */

	if ( isRewcurr(retMailFile, &retMailRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReturnMailActionUpdate]  ISREWCURR error %d occured on stretmail for the reference number [%.16s] ......\n", getDateTime(), PID, iserrno, retMailRec.refNo);
		fflush(logFp);

		sprintf(tmpStr, "Error %d occured while updating retMail actions ..", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr); 
		isrelease(retMailFile);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	isrelease(retMailFile);

	formatBranchResponse(DONE, "Successful.....", "Successful...."); 
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processReturnedMailReport()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0; 
	char tmpStr[100], requiredDate[10], letterTypeDesc[50];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processReturnedMailReport]\n", getDateTime(), PID);

	memset(responseMsg.returnedMailReport.msgLen, ' ', sizeof responseMsg.returnedMailReport);
	responseMsg.returnedMailReport.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.returnedMailReport.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(responseMsg.returnedMailReport.msgLen, ' ', sizeof responseMsg.returnedMailReport);

	memset(&retMailRec.liveChar, ' ', sizeof retMailRec);

	isindexinfo(retMailFile, &retMailKey, 3);
	readBankingDate();

	strncpy(retMailRec.returnedDate, receivedMsg.returnedMailReport.reportDate, 8);
	if ( strncmp(receivedMsg.returnedMailReport.branchCode, "ALL", 3) )
		strncpy(retMailRec.branchCode, receivedMsg.returnedMailReport.branchCode, 4);

	isstart(retMailFile, &retMailKey, 0, &retMailRec.liveChar, ISGTEQ);
	while ( isRead(retMailFile, &retMailRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(retMailRec.returnedDate, receivedMsg.returnedMailReport.reportDate, 8) )
			break;

		if ( strncmp(receivedMsg.returnedMailReport.branchCode, "ALL", 3) )
		{
			if ( strncmp(retMailRec.branchCode, receivedMsg.returnedMailReport.branchCode, 4) )
				break;
		}

		if ( getMailTypeInfo(retMailRec.refNo[8]) == FAILURE )/* 9th character in the reference number is the letter type */
			sprintf(letterTypeDesc, "%c-Not found in stctltab         ", retMailRec.refNo[8]);
		else
			sprintf(letterTypeDesc, "%.30s", mailTypeRec.arabicName);

		if ( mailTypeRec.despatchedToBranches != '1' ) /* IGNORE if the mail is not despatched to branches */
			continue;

		if ( retMailRec.deliveryActionTaken != '0' )
			continue;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].refNo, retMailRec.refNo, 16);
		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].branchCode, retMailRec.branchCode, 4);

		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].letterTypeDesc, letterTypeDesc, 30);
		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].custNo, retMailRec.custNo, 7);
		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].productId, retMailRec.productId, 20);

		memset(&crdRec.liveChar, ' ', sizeof crdRec);
		strncpy(crdRec.accNo, (char *)actualToBmCust(retMailRec.custNo, tmpStr), 6);

		if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReturnMailReport] ISREAD/ISEQUAL error %d occured while reading crd0data for customer # [%.7s] [%.6s] IGNORED \n", getDateTime(), PID, iserrno, retMailRec.custNo, crdRec.accNo);
			fflush(logFp);

			sprintf(tmpStr, "Customer [%.7s] not found in BM ", retMailRec.custNo);

			strncpy(crdRec.shortName, tmpStr, 30);
		}
		strncpy(responseMsg.returnedMailReport.details[recsInThisMsg].custName, crdRec.shortName, 30);

		if ( ++recsInThisMsg >=  50 )
			break;
	}
	strncpy(responseMsg.returnedMailReport.reportDate, receivedMsg.returnedMailReport.reportDate, 8);
	strncpy(responseMsg.returnedMailReport.branchCode, receivedMsg.returnedMailReport.branchCode, 4);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.returnedMailReport.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.returnedMailReport.noOfRecs, tmpStr, 2);
	responseMsg.returnedMailReport.details[recsInThisMsg+1].refNo[0] = '\0';
	formatReturnMailReportResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.returnedMailReport.msgLen);
	return SUCCESS;
}

processNewCustomerReport()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0; 
	char tmpStr[100], requiredDate[10], letterTypeDesc[50];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processNewCustomerReport]\n", getDateTime(), PID);

	memset(responseMsg.newCustomerReport.msgLen, ' ', sizeof responseMsg.newCustomerReport);
	responseMsg.newCustomerReport.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.newCustomerReport.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(responseMsg.newCustomerReport.msgLen, ' ', sizeof responseMsg.newCustomerReport);

	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);

	isindexinfo(custLogFile, &custLogKey, 4); /* on lastUpdateBmDate */
	readBankingDate();

	strncpy(custLogRec.lastUpdateBmDate, receivedMsg.newCustomerReport.reportDate, 8);

	isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar, ISGTEQ);
	while ( isRead(custLogFile, &custLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(custLogRec.lastUpdateBmDate, receivedMsg.newCustomerReport.reportDate, 8) )
			break;

		if ( custLogRec.bmUpdateStatus != '9' ||
			 !strncmp(custLogRec.userId,"MIGRATION            ",20) ||
			 custLogRec.newOrUpdate == 'U')
			continue;

		if ( strncmp(custLogRec.branchCode, receivedMsg.newCustomerReport.homeBranch, 4) )
			continue;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custNo, custLogRec.custNo, 7);
		responseMsg.newCustomerReport.details[recsInThisMsg].createdThruQuickScreen = custLogRec.createdFromQuickScreen;

		if ( custLogRec.custType == '0' )
		{
			if ( custLogRec.preferredLang == '0' ) /* ARABIC */
				strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custName, custLogRec.aShortName, 30);
			else
				strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custName, custLogRec.eShortName, 30);
		}
		else /* Corporate & commercial */
		{
			if ( custLogRec.preferredLang == '0' ) /* ARABIC */
				strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custName, custLogRec.aOrgShortName, 30);
			else
				strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custName, custLogRec.eOrgShortName, 30);
		}

		strncpy(responseMsg.newCustomerReport.details[recsInThisMsg].custBranchCode, custLogRec.custBranchCode, 4);

		if ( ++recsInThisMsg >=  50 )
			break;
	}
	strncpy(responseMsg.newCustomerReport.reportDate, receivedMsg.newCustomerReport.reportDate, 8);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.newCustomerReport.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.newCustomerReport.noOfRecs, tmpStr, 2);
	responseMsg.newCustomerReport.details[recsInThisMsg+1].custNo[0] = '\0';
	formatNewCustomerReportResponse(DONE, "Successful", "Successful");
	fflush(logFp);
	sendResponse(responseMsg.newCustomerReport.msgLen);
	return SUCCESS;
}

openLetterFile(char *letterFileName, int mode)
{
	char tmpStr[100], *pathName;

	/* Open the corresponding letter file */
	pathName = getpath(letterFileName, "anbiam");
	if ( (letterFile  = isopen(pathName, mode)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openLetterFile] ISOPEN error %d for %s File \n",getDateTime(), PID, iserrno, pathName);
		sprintf(tmpStr, "Error  %d occured while opening %s", iserrno, letterFileName);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	free(pathName);
	isindexinfo(letterFile, &letterKey, 1);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Letter file (%s) (%d) successfully opened...\n", getDateTime(), PID, letterFileName, letterFile);
		fflush(logFp);
	}
	return SUCCESS;
}

openRetMailFile(int mode)
{
	char tmpStr[100];
	if ( retMailFileOpen == YES ) 
		return SUCCESS;

	/* Open the corresponding letter file */
	if ( (retMailFile  = isopen(retMailFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openRetMailFile] ISOPEN error %d for %s File \n",getDateTime(), PID, iserrno, retMailFilePath);
		sprintf(tmpStr, "Error  %d occured while opening stretmail", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(retMailFile, &retMailKey, 1);

	retMailFileOpen = YES;
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Returned mail file (stretmail) (%d) successfully opened...\n", getDateTime(), PID, retMailFile);
		fflush(logFp);
	}
	return SUCCESS;
}

getMailTypeInfo(char mailType)
{
	char tmpStr[100];

	memset(&mailTypeRec.liveChar, ' ', sizeof mailTypeRec);
	strncpy(mailTypeRec.recType, "LT", 2);
	/*mailTypeRec.mailType = recdRefNo[8]; /* 9th character in the reference number is the letter type **/
	mailTypeRec.mailType = mailType; 
	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &mailTypeRec.liveChar, ISGTEQ);
	 
	if ( isRead(ctlFile, &mailTypeRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d| [getMailTypeInfo] ISREAD/ISEQUAL error %d occured on stctltab for the key [%.6s] \n", getDateTime(), PID, iserrno, mailTypeRec.recType);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Mail Type [%c] does not exist in CTL_TAB;Pls;Check   ", mailType);
			formatReturnMailEnqResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "C-ISAM error %d occured on stctltab;Pls;Check        ", iserrno);
			formatReturnMailEnqResponse(INTERNALERR, tmpStr, tmpStr);
		}

		return FAILURE;
	}

	return SUCCESS;
}

formatNewCustomerReportResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatNewCustomerReportResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.newCustomerReport.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.newCustomerReport.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.newCustomerReport.eRemarks,tmpStr,50);
	strncpy(responseMsg.newCustomerReport.service, receivedMsg.newCustomerReport.service, 2);
	responseMsg.newCustomerReport.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.newCustomerReport.msgLen));
	strncpy(responseMsg.newCustomerReport.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatReturnMailReportResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatReturnMailReportResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.returnedMailReport.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.returnedMailReport.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.returnedMailReport.eRemarks,tmpStr,50);
	strncpy(responseMsg.returnedMailReport.service, receivedMsg.returnedMailReport.service, 2);
	responseMsg.returnedMailReport.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.returnedMailReport.msgLen));
	strncpy(responseMsg.returnedMailReport.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatReturnMailEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatReturnMailEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.returnedMail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.returnedMail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.returnedMail.eRemarks,tmpStr,50);
	strncpy(responseMsg.returnedMail.service, receivedMsg.returnedMail.service, 2);
	responseMsg.returnedMail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.returnedMail.msgLen));
	strncpy(responseMsg.returnedMail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatReturnMailPendingListResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatReturnMailPendingListResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.returnedMailPendingList.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.returnedMailPendingList.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.returnedMailPendingList.eRemarks,tmpStr,50);
	strncpy(responseMsg.returnedMailPendingList.service, receivedMsg.returnedMailPendingList.service, 2);
	responseMsg.returnedMailPendingList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.returnedMailPendingList.msgLen));
	strncpy(responseMsg.returnedMailPendingList.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logReturnMailSearchDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	if ( receivedMsg.returnedMail.msgType == '0' )
		fprintf(logFp, "Service             : %.2s[Return Mail enquiry ]\n", receivedMsg.returnedMail.service);
	else if ( receivedMsg.returnedMail.msgType == '1' )
		fprintf(logFp, "Service             : %.2s[Register mail as returned Mail]\n", receivedMsg.returnedMail.service);
	else
		fprintf(logFp, "Service             : %.2s[Unknown]      \n", receivedMsg.returnedMail.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.returnedMail.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.returnedMail.userId);
	fprintf(logFp, "Reference Number    : %.16s\n", receivedMsg.returnedMail.refNo);
	fprintf(logFp, "Message Type        : %c\n", receivedMsg.returnedMail.msgType);
	fprintf(logFp, "Customer  Number    : %.7s\n", receivedMsg.returnedMail.custNo);
	fflush(logFp);
}

logReturnMailPendingListDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Returned mail Pending List]\n", receivedMsg.returnedMailPendingList.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.returnedMailPendingList.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.returnedMailPendingList.userId);
	fprintf(logFp, "Last record count   : %.5s\n", receivedMsg.returnedMailPendingList.lastRecCount);
	fprintf(logFp, "Message Type        : %c\n", receivedMsg.returnedMailPendingList.msgType);
	fprintf(logFp, "Customer Number     : %.7s\n", receivedMsg.returnedMailPendingList.custNo);
	fflush(logFp);
}

logReturnMailActionUpdateDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Returned mail action update]\n", receivedMsg.returnedMailStatusUpdate.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.returnedMailStatusUpdate.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.returnedMailStatusUpdate.userId);
	fprintf(logFp, "Message Type        : %c\n", receivedMsg.returnedMailStatusUpdate.msgType);
	fprintf(logFp, "Reference number    : %.16s\n", receivedMsg.returnedMailStatusUpdate.refNo);
	fprintf(logFp, "Address fixed flag  : %c\n", receivedMsg.returnedMailStatusUpdate.addressFixed);
	fprintf(logFp, "Delivered to customer: %c\n", receivedMsg.returnedMailStatusUpdate.deliveredToCustomer);
	fprintf(logFp, "Remarks             : %.75s\n", receivedMsg.returnedMailStatusUpdate.remarks);
	fflush(logFp);
}

logReturnedMailReportDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Returned mail report]\n", receivedMsg.returnedMailReport.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.returnedMailReport.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.returnedMailReport.userId);
	fprintf(logFp, "Last record count   : %.5s\n", receivedMsg.returnedMailReport.lastRecCount);
	fprintf(logFp, "Report Date         : %.8s\n", receivedMsg.returnedMailReport.reportDate);
	fprintf(logFp, "Branch code         : %.4s\n", receivedMsg.returnedMailReport.branchCode);
	fflush(logFp);
}

logNewCustomerReportDetails()
{
	char tmpStr[20];
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[New customers report]\n", receivedMsg.newCustomerReport.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.newCustomerReport.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.newCustomerReport.userId);
	fprintf(logFp, "Last record count   : %.5s\n", receivedMsg.newCustomerReport.lastRecCount);
	fprintf(logFp, "Report Date         : %.8s\n", receivedMsg.newCustomerReport.reportDate);
	fflush(logFp);
}
