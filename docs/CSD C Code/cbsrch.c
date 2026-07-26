/*
	Objective       :       Static data management server 
				            (included for Search Engine Enquiry) 

	Date            :       13/03/2005.

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
#include "srchint.h"

#define YES              1
#define NO               0

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];
extern  int searchEngineCallReqd;
extern  char searchEngineLevel;

extern FILE *logFp, *errLogFp;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;

char            *getpath();
char            *getDateTime();
double          bmAmtToDbl();
char            *dblToBmAmt();
char            *bmCustToAcutal();
char            *doubleToPack();
double          packToDouble();

struct	customerInfo	custTabRec;

extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen;

int stSrchEngine(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stSrchEngine]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "80", 2) == 0 ) /*  Search Engine Enquiry */
	{
		logSearchEngineEnqDetails();

		if ( openCustTabFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.cardSearch.msgLen);
			return FAILURE;
		}

		if ( processSrchEngineEnq() == FAILURE )
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

processSrchEngineEnq()
{
	char tmpStr[100], errorDesc[30], retStatus[10], tmpCustName[70];
	char name1[35], name2[35], name3[20], name4[20];
	struct resMsgSrchEngineEnq	srchEngineResponse;

	memset(responseMsg.searchEngine.msgLen, ' ', sizeof responseMsg.searchEngine);
	responseMsg.searchEngine.foundInTList = '0';
	responseMsg.searchEngine.details[0].englishName[0] = NULL;

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	if ( strncmp(receivedMsg.searchEngine.custNo, "               ", 7) )
	{
		if ( searchEngineCallReqd == YES )
		{
			strncpy(custTabRec.custNo, receivedMsg.searchEngine.custNo, 7);

			isindexinfo(custTabFile, &custTabKey, 1);
			isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);

			if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
			{
				fprintf(logFp, "%s|%5d|[proccessSrchEngine] : ISREAD/ISEQUAL error %d occured on stcusttab for the customer [%.7s] IGNORED; \n", getDateTime(), PID, iserrno, custTabRec.custNo);
				fflush(logFp);
			}
			else
			{
				if ( custTabRec.custType > '0' )
				{
					if ( custTabRec.preferredLang == '0' ) /* ARABIC */
					{
						sprintf(name1, "%.30s", custTabRec.aOrgName1);
						trim(name1);
						sprintf(name2, "%.30s", custTabRec.aOrgName2);
						trim(name2);
						sprintf(tmpCustName, "%s %s", name1, name2);
						/*sprintf(tmpStr, "%.30s%.30s", custTabRec.aOrgName1, custTabRec.aOrgName2);*/
					}
					else
					{
						sprintf(name1, "%.30s", custTabRec.eOrgName1);
						trim(name1);
						sprintf(name2, "%.30s", custTabRec.eOrgName2);
						trim(name2);
						sprintf(tmpCustName, "%s %s", name1, name2);
						/*sprintf(tmpStr, "%.30s%.30s", custTabRec.eOrgName1, custTabRec.eOrgName2);*/
					}
				}
				else
				{
					if ( custTabRec.preferredLang == '0' ) /* ARABIC */
					{
						sprintf(name1, "%.15s", custTabRec.aFirstName);
						trim(name1);
						sprintf(name2, "%.15s", custTabRec.a2ndName);
						trim(name2);
						sprintf(name3, "%.15s", custTabRec.a3rdName);
						trim(name3);
						sprintf(name4, "%.15s", custTabRec.aLastName);
						trim(name4);
						sprintf(tmpCustName, "%s %s %s %s", name1, name2, name3, name4);

						/*sprintf(tmpStr, "%.15s%.15s%.15s%.15s", custTabRec.aFirstName, custTabRec.a2ndName, custTabRec.a3rdName, custTabRec.aLastName);*/
					}
					else
					{
						sprintf(name1, "%.15s", custTabRec.eFirstName);
						trim(name1);
						sprintf(name2, "%.15s", custTabRec.e2ndName);
						trim(name2);
						sprintf(name3, "%.15s", custTabRec.e3rdName);
						trim(name3);
						sprintf(name4, "%.15s", custTabRec.eLastName);
						trim(name4);
						sprintf(tmpCustName, "%s %s %s %s", name1, name2, name3, name4);
						/*sprintf(tmpStr, "%.15s%.15s%.15s%.15s", custTabRec.eFirstName, custTabRec.e2ndName, custTabRec.e3rdName, custTabRec.eLastName);*/
					}
				}
				sprintf(tmpCustName, "%-60.60s", tmpCustName);
				strncpy(receivedMsg.searchEngine.searchName, tmpCustName, 60);
			}
			receivedMsg.searchEngine.searchLevel = searchEngineLevel;
		}
		else
		{
			fprintf(logFp, "%s|%5d| Search Engine call is disabled while opening/updating accounts; so, sending the response as NOT_FOUND to the client..\n", getDateTime(), PID);
			fflush(logFp);
			sprintf(tmpStr, "SEARCH ENGINE CALL IS DISABLED..So, sent NOT_FOUND..");
			formatSrchEngineEnqResponse(NOT_FOUND, tmpStr, tmpStr);
			sendResponse(responseMsg.searchEngine.msgLen);
			return SUCCESS;
		}
	}

	if (callSrchEngine(receivedMsg.searchEngine.searchName, custTabRec.idNo, receivedMsg.searchEngine.searchLevel,  srchEngineResponse.msgLen) == FAILURE )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(srchEngineResponse.responseStatus, "00", 2) )
	{
		if ( strncmp(srchEngineResponse.responseStatus, "03", 2) == 0  )
		{
			sprintf(errorDesc, "Incorrect Message");
			strcpy(retStatus, INCORRECTMSG);
		}
		else if ( strncmp(srchEngineResponse.responseStatus, "18", 2) == 0  )
		{
			sprintf(errorDesc, "No Such record exists");
			strcpy(retStatus, NOT_FOUND);
		}
		else if ( strncmp(srchEngineResponse.responseStatus, "99", 2) == 0 )
		{
			sprintf(errorDesc, "Internal Errors");
			strcpy(retStatus, INTERNALERR);
		}
		else
		{
			sprintf(errorDesc, "Unknown error");
			strcpy(retStatus, INTERNALERR);
		}
		fprintf(logFp, "%s|%5d| [processSrchEngineEnq] Error [%.2s:%s] received from SRCHENGINE service; Please investigate \n", getDateTime(), PID, srchEngineResponse.responseStatus, errorDesc);
		fflush(logFp);
		sprintf(tmpStr, "%s returned from SRCHENGINE service ; Please check", errorDesc);
		formatSrchEngineEnqResponse(retStatus, tmpStr, tmpStr);
		sendResponse(responseMsg.searchEngine.msgLen);
		return FAILURE;
	}
	if ( strncmp(srchEngineResponse.recsRetrieved, "00", 2) > 0 )
		responseMsg.searchEngine.foundInTList = '1';
	else
		responseMsg.searchEngine.foundInTList = '0';

	strncpy(responseMsg.searchEngine.noOfRecs, srchEngineResponse.recsRetrieved, 2);
	strncpy(responseMsg.searchEngine.details, srchEngineResponse.details, sizeof srchEngineResponse.details);
	sprintf(tmpStr, "%.2s", srchEngineResponse.recsRetrieved);
	responseMsg.searchEngine.details[atoi(tmpStr)].englishName[0] = NULL;

	formatSrchEngineEnqResponse(DONE, "Sucessful....", "Successful....");
	sendResponse(responseMsg.searchEngine.msgLen);
	return SUCCESS;
}

callSrchEngine(char *searchName, char *idNo, char srchEngineLevel, char *responseMsg)
{
	char tmpStr[20];
	struct reqMsgSrchEngineEnq	srchEngineRequest;

	if ( extraDebug )
	{
		fprintf(logFp,"%s|%5d| callSrchEngine() entered with Name [%.60s] ; id No [%.15s]\n", getDateTime(), PID, searchName, idNo);
		fflush(logFp);
	}

	memset(srchEngineRequest.msgLen, ' ', sizeof srchEngineRequest);
	strncpy(srchEngineRequest.branchName, "STD         ", 10); /* STATIC DATA */
	strncpy(srchEngineRequest.source, "ST", 2); /* STATIC DATA */
	strncpy(srchEngineRequest.service, "00", 2);
	srchEngineRequest.retrieveFlag = '1'; /* to ge more than one record */
	strncpy(srchEngineRequest.name, searchName, 60);
	strncpy(srchEngineRequest.idNo, idNo, 15);
	srchEngineRequest.searchLevel = srchEngineLevel;
	srchEngineRequest.nullPad = '\0';
	sprintf(tmpStr, "%05d", strlen(srchEngineRequest.msgLen));
	strncpy(srchEngineRequest.msgLen, tmpStr, 5);

	if ( dealWithTuxedo("SRCHENGINE", srchEngineRequest.msgLen, responseMsg) == FAILURE )
		return FAILURE;

	return SUCCESS;
}

formatSrchEngineEnqResponse(responseCode, aRemarks, eRemarks)
char *responseCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[formatSrchEngineEnqResponse] formating the response\n", getDateTime(), PID);

	strncpy(responseMsg.searchEngine.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.searchEngine.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.searchEngine.eRemarks,tmpStr,50);
	strncpy(responseMsg.searchEngine.service, receivedMsg.searchEngine.service, 2);
	responseMsg.searchEngine.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.searchEngine.msgLen));
	strncpy(responseMsg.searchEngine.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logSearchEngineEnqDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service             : %.2s[Search Engine Enquiry ]\n", receivedMsg.searchEngine.service);
	fprintf(logFp, "Branch Code         : %.4s\n", receivedMsg.searchEngine.homeBranch);
	fprintf(logFp, "User Id             : %.10s\n", receivedMsg.searchEngine.userId);
	fprintf(logFp, "Search Name         : %.60s\n", receivedMsg.searchEngine.searchName);
	fprintf(logFp, "Customer Number     : %.7s\n", receivedMsg.searchEngine.custNo);
	fprintf(logFp, "Search   Level      : [%c]\n", receivedMsg.searchEngine.searchLevel);
	fflush(logFp);
}
