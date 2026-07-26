/*
	Objective       :       Static data management server 
				            (included for SAMA account regulation)

	Date            :       13/07/2003.

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
#include "stbmupdate.h"
#include "cbrouter.h"

#define YES              1
#define NO               0

#define HIJRI			'0'
#define GREGORIAN		'1'

#define ARABIC			'0'
#define ENGLISH			'1'

#define NOT_STARTED 	0 
#define STARTED 		1
#define COMPLETED 		2

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define BM_REJECTED     '2'
#define ST_REJECTED     '1'
#define ACCEPTED        '0'

extern struct keydesc  userKey, userLogKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerTabKey, ownerLogKey, heirLogKey, heirTabKey;
struct dictinfo fileInfo;
extern int   userFile, userLogFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile, signLogFile, signTabFile, ownerTabFile, ownerLogFile, heirLogFile, heirTabFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;

extern char progName[30];
extern int PID;
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *heirLogFilePath, *heirTabFilePath;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];

struct branchActivityOnCustomer		 custLogRec, custLogRec1;
struct branchActivityOnJointAccounts jointLogRec;
struct branchActivityOnAccounts 	 acctLogRec;
struct branchInfo					 ctlRec;
struct categoryConfig				 categoryConfigRec;
struct userProfile					 userRec;
struct userProfileLog				userLogRec;
struct refreshInfo					 refreshRec;
struct customerInfo					 custTabRec;
struct jointAccountInfo				 jointTabRec;
struct customerRangeInfo			 custRangeRec;
struct crdUpdate					 bmCustRec;
struct gldUpdate					 bmAccRec;
struct crd0data 					 crdRec;
struct gld0data						 gldRec;
struct cnd0dataBR 					 cndRec;
struct req0data 					 reqRec;
struct gld0data05 					 gldMemoRec;
struct abcList						 abcRec;
struct cardInfo						 cardTabRec, cardTabRec1;
struct branchActivityOnCard			 cardLogRec;
struct hsmrequestmsg				 hsmRequestMsg;
struct hsmreplymsg					 hsmReplyMsg;
struct b24requestmsg				 b24RequestMsg;
struct b24replymsg					 b24ReplyMsg;
struct tpinHistory					 tpinHistRec;
struct branchActivityOnCustRef		 cRefLogRec, cRefLogRec1;
struct customerReferenceInfo		 cRefTabRec;
struct calendarInfo					 calendarRec;
struct branchActivityOnId			 idLogRec;
struct branchActivityOnAddress		 addrLogRec;
struct addressInfo					 addrTabRec;
struct idInfo						 idTabRec;
struct branchActivityOnSignatory	 signLogRec;
struct signatoryInfo				 signTabRec;
struct branchActivityOnOwner		 ownerLogRec;
struct ownerInfo					 ownerTabRec;
struct heirInfo					 	 heirTabRec;
struct branchActivityOnHeir			 heirLogRec, heirLogRec1;

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

extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25];
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, userFileOpen, cRefLogFileOpen, cRefTabFileOpen, signLogFileOpen, signTabFileOpen , ownerTabFileOpen , ownerLogFileOpen, userLogFileOpen, heirLogFileOpen, heirTabFileOpen;

int stSamaRegulation(char *headerBuf)
{
	int c, msgLen;
	char tmpStr[60];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stSamaRegulation]\n", getDateTime(), PID);
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

	if ( strncmp(&headerBuf[6], "70", 2) == 0 ) /* Check the category combination valid or not */
	{
		logCheckCategoryDetails();

		if ( openCtlFile(ISINOUT+ISMANULOCK) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processCheckCategory() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "71", 2) == 0 ) /* Reference creation/Update */
	{
		logReferenceDetails();

		if ( openCrefLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCalendarFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processReferenceRequest() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "72", 2) == 0 ) /* Joint info search */
	{
		logJointInfoSearchDetails();

		if ( strncmp(receivedMsg.jointInfoSearch.requestType, "01", 2) == 0 )
		{
			if ( openJointLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processJointLogSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.jointInfoSearch.requestType, "02", 2) == 0 )
		{
			if ( openJointTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processJointTabSearch() == FAILURE )
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6], "73", 2) == 0 ) /* Reference info search */
	{
		logReferenceInfoSearchDetails();

		if ( strncmp(receivedMsg.referenceSearch.requestType, "01", 2) == 0 )
		{
			if ( openCrefLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processReferenceLogSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.referenceSearch.requestType, "02", 2) == 0 )
		{
			if ( openCrefTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processReferenceTabSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.referenceSearch.requestType, "03", 2) == 0 )
		{
			if ( openHeirLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processHeirLogSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.referenceSearch.requestType, "04", 2) == 0 )
		{
			if ( openHeirTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processHeirTabSearch() == FAILURE )
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6], "74", 2) == 0 ) /* Id Number existance check */
	{
		logIdCheckDetails();

		if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processCheckIdInfo() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "75", 2) == 0 ) /* Signatory add request */
	{
		logSignatoryDetails();

		if ( openSignLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openSignTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCalendarFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processSignatoryRequest() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "76", 2) == 0 ) /* Signatory /owner/ reference search */
	{
		if ( strncmp(receivedMsg.signatorySearch.requestType, "01", 2) == 0 )
		{
			logSignatorySearchDetails("Signatory Search from log file");
			if ( openSignLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processSignatoryLogSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatorySearch.requestType, "02", 2) == 0 || 
				  strncmp(receivedMsg.signatorySearch.requestType, "00", 2) == 0 )
		{
			logSignatorySearchDetails("Signatory Search from tab file");
			if ( openSignTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processSignatoryTabSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatorySearch.requestType, "03", 2) == 0 )
		{
			logSignatorySearchDetails("Owner Search from log file");
			if ( openOwnerLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processOwnerLogSearch() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatorySearch.requestType, "04", 2) == 0 )
		{
			logSignatorySearchDetails("Owner Search from tab file");
			if ( openOwnerTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( processOwnerTabSearch() == FAILURE )
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6],"77",2) == 0 ) /* Signatory/owner/reference detail info request */
	{
		if ( strncmp(receivedMsg.signatoryDetail.requestType, "02",2) == 0 )
		{
			logSignatoryInfoReqDetails("Signatory detail from tab file ");
			if ( openSignTabFile(ISMANULOCK + ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			if ( readSignTabInfo() == FAILURE )
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "01", 2) == 0 )
		{
			logSignatoryInfoReqDetails("Signatory detail from log file ");
			if( openSignLogFile(ISMANULOCK + ISINOUT) < 0)
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readSignLogInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "03", 2) == 0 ) /* Owner log detail request */
		{
			logSignatoryInfoReqDetails("Owner detail from log file ");
			if( openOwnerLogFile(ISMANULOCK + ISINOUT) < 0)
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readOwnerLogInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "04", 2) == 0 ) /* Owner tab detail request */
		{
			logSignatoryInfoReqDetails("Owner detail from tab file ");
			if( openOwnerTabFile(ISMANULOCK + ISINOUT) < 0)
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readOwnerTabInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "05", 2) == 0 ) /* Reference log detail request */
		{
			logSignatoryInfoReqDetails("Reference details from log file ");

			if ( openCrefLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readReferenceLogInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "06", 2) == 0 ) /* Reference tab detail request */
		{
			logSignatoryInfoReqDetails("Reference details from tab file ");

			if ( openCrefTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readReferenceTabInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "07", 2) == 0 ) /* Heir log detail request */
		{
			logSignatoryInfoReqDetails("Heir details from log file ");

			if ( openHeirLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readHeirLogInfo() == FAILURE)
				return FAILURE;
		}
		else if ( strncmp(receivedMsg.signatoryDetail.requestType, "08", 2) == 0 ) /* Heir tab detail request */
		{
			logSignatoryInfoReqDetails("Heir details from tab file ");

			if ( openHeirTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
			{
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			if ( readHeirTabInfo() == FAILURE)
				return FAILURE;
		}
	}
	else if ( strncmp(&headerBuf[6], "78", 2) == 0 ) /* Owner add request */
	{
		logOwnerDetails();

		if ( openOwnerLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCalendarFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processOwnerRequest() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6],"79",2) == 0 ) /* Change Screen Language */
	{
		logChangeScreenLangDetails();

		if ( openUserFiles(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processChangeScreenLang() == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "AM", 2) == 0 ) /* Heir creation/Update */
	{
		logHeirDetails();

		if ( openHeirLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrLogFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openCalendarFile(ISMANULOCK+ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( processHeirRequest() == FAILURE )
			return FAILURE;
	}
	return SUCCESS;
}

processCheckCategory()
{
	char tmpStr[100];
	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processCheckCategory]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.checkCategory.msgLen, ' ', sizeof responseMsg.checkCategory);

	isindexinfo(ctlFile, &ctlKey, 1);
	memset(&categoryConfigRec.liveChar, ' ', sizeof categoryConfigRec);
	strncpy(categoryConfigRec.recType, "CC", 2);
	strncpy(categoryConfigRec.samaMainCategory, receivedMsg.checkCategory.samaMainCategory, 2);
	strncpy(categoryConfigRec.samaSubCategory, receivedMsg.checkCategory.samaSubCategory, 2);

	if ( isstart(ctlFile, &ctlKey, 0, &categoryConfigRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processCheckCategory] ISSTART/ISGTEQ error %d occured on stctltab for the key [%.6s]\n", getDateTime(), PID, iserrno, categoryConfigRec.recType);
		fflush(logFp);
	}

	if ( isRead(ctlFile, &categoryConfigRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processCheckCategory] ISREAD/ISEQUAL error %d occured on stctltab for the  key [%.6s] ; \n", getDateTime(), PID, iserrno, categoryConfigRec.recType);
		fflush(logFp);
		responseMsg.checkCategory.categoryStatus = '0'; /* Invalid category */
		responseMsg.checkCategory.generalCustOpenAllowed = '0';  /* general customer opening not allowed */
	}
	else
	{
		responseMsg.checkCategory.categoryStatus  = '1'; /* Valid Category */
		responseMsg.checkCategory.generalCustOpenAllowed = categoryConfigRec.generalCustOpenAllowed;
	}

	strncpy(responseMsg.checkCategory.samaMainCategory, receivedMsg.checkCategory.samaMainCategory, 2);
	strncpy(responseMsg.checkCategory.samaSubCategory, receivedMsg.checkCategory.samaSubCategory, 2);

	formatCheckCategoryResponse(DONE, "Successful...", "Successful..."); 
	sendResponse(responseMsg.checkCategory.msgLen);
	return SUCCESS;
}

processJointTabSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJointTabSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.jointInfoSearch.msgLen, ' ', sizeof responseMsg.jointInfoSearch);
	responseMsg.jointInfoSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.jointInfoSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&jointTabRec.liveChar, ' ', sizeof jointTabRec);
	strncpy(jointTabRec.custNo, receivedMsg.jointInfoSearch.custNo, 7);
	isindexinfo(jointTabFile, &jointTabKey, 1);
	if ( isstart(jointTabFile, &jointTabKey, 7, &jointTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJointTabSearch] ISSTART/ISGTEQ error %d occured on stjointtab for customer # [%.7s]\n", getDateTime(), PID, iserrno, jointTabRec.custNo);
		fflush(logFp);
	}

	while ( isRead(jointTabFile, &jointTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( strncmp(jointTabRec.custNo, receivedMsg.jointInfoSearch.custNo, 7) )
			break;

		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custNo, jointTabRec.custNo, 7);
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].jointCustNo, jointTabRec.jointCustNo, 2);
		responseMsg.jointInfoSearch.details[recsInThisMsg].idType =  jointTabRec.idType;
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].idNo, jointTabRec.idNo, 15);
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custBranchCode, jointTabRec.branchCode, 4);
		if ( jointTabRec.preferredLang == ARABIC )
		{
			if (strncmp(jointTabRec.aShortName,"                                 ",30))
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointTabRec.aShortName, 30);
			else 
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointTabRec.eShortName, 30);
		}
		else
		{
			if (strncmp(jointTabRec.eShortName,"                                  ",30))
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointTabRec.eShortName, 30);
			else
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointTabRec.aShortName, 30);
		}
		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.jointInfoSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.jointInfoSearch.noOfRecs, tmpStr, 2);
	responseMsg.jointInfoSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.jointInfoSearch.msgLen);
	return SUCCESS;
}

processJointLogSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processJointLogSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.jointInfoSearch.msgLen, ' ', sizeof responseMsg.jointInfoSearch);
	responseMsg.jointInfoSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.jointInfoSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&jointLogRec.liveChar, ' ', sizeof jointLogRec);
	strncpy(jointLogRec.branchCode, receivedMsg.jointInfoSearch.branchCode, 4); 
	strncpy(jointLogRec.userId, receivedMsg.jointInfoSearch.userId, 10);
	strncpy(jointLogRec.dateTime, receivedMsg.jointInfoSearch.dateTime, 14);
	isindexinfo(jointLogFile, &jointLogKey, 1);
	if ( isstart(jointLogFile, &jointLogKey, 0, &jointLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processJointLogSearch] ISSTART/ISGTEQ error %d occured on stjointlog for customer # [%.7s] and the key is [%.38s]\n", getDateTime(), PID, iserrno, jointLogRec.custNo, jointLogRec.branchCode);
		fflush(logFp);
	}

	while ( isRead(jointLogFile, &jointLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( strncmp(jointLogRec.branchCode, receivedMsg.jointInfoSearch.branchCode, 4) ||
			 strncmp(jointLogRec.userId, receivedMsg.jointInfoSearch.userId, 10) || 
			 strncmp(jointLogRec.dateTime, receivedMsg.jointInfoSearch.dateTime,14)	)
			break;

		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custNo, jointLogRec.custNo, 7);
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].jointCustNo, jointLogRec.jointCustNo, 2);
		responseMsg.jointInfoSearch.details[recsInThisMsg].idType =  jointLogRec.idType;
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].idNo, jointLogRec.idNo, 15);
		strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custBranchCode, jointLogRec.branchCode, 4);
		if ( jointLogRec.preferredLang == ARABIC )
		{
			if (strncmp(jointLogRec.aShortName,"                                 ",30))
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointLogRec.aShortName, 30);
			else 
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointLogRec.eShortName, 30);
		}
		else
		{
			if (strncmp(jointLogRec.eShortName,"                                  ",30))
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointLogRec.eShortName, 30);
			else
				strncpy(responseMsg.jointInfoSearch.details[recsInThisMsg].custShortName, jointLogRec.aShortName, 30);
		}
		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.jointInfoSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.jointInfoSearch.noOfRecs, tmpStr, 2);
	responseMsg.jointInfoSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.jointInfoSearch.msgLen);
	return SUCCESS;
}

processReferenceRequest()
{
	char tmpStr[100], tmpStr1[100];
	int referenceLogFound=NO, idFoundFlag=NO, addressFoundFlag=NO;
	char keyBranchCode[8], keyUserId[15], keyDateTime[20];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processReferenceRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

    memset(&cRefLogRec.liveChar,' ',sizeof cRefLogRec);
	cRefLogRec.liveChar = '@';

	/* If the customer opened through phone; then the customer entry should be made as pending with the customer branch */
	if ( receivedMsg.reference.custOpenSource == 'P' ) 
	{
		strncpy(cRefLogRec.branchCode,receivedMsg.reference.custBranchCode,4);
		cRefLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */
	}
	else
		strncpy(cRefLogRec.branchCode,receivedMsg.reference.homeBranch,4);
		/* custLogRec.custOpenSource  should not be set to B as it will overwrite the source flag to "B" for the customers
		   opened through phone */

	strncpy(cRefLogRec.userId, receivedMsg.reference.userId,10);
	strncpy(cRefLogRec.dateTime, receivedMsg.reference.dateTime,14);
	strncpy(cRefLogRec.custNo, receivedMsg.reference.custNo, 7);
	strncpy(cRefLogRec.referenceNo, receivedMsg.reference.refNo, 4);

	strncpy(keyBranchCode, cRefLogRec.branchCode, 4);
	strncpy(keyUserId, cRefLogRec.userId, 10);
	strncpy(keyDateTime, cRefLogRec.dateTime, 14);

	isindexinfo(cRefLogFile, &cRefLogKey, 1);

	isstart(cRefLogFile,&cRefLogKey, 28, &cRefLogRec.liveChar, ISGTEQ );
	while ( isRead(cRefLogFile, &cRefLogRec.liveChar, ISNEXT) == 0 )
	{
		if (strncmp(keyBranchCode,cRefLogRec.branchCode,4) != 0 || strncmp(keyUserId,cRefLogRec.userId,10) != 0 || strncmp(keyDateTime, cRefLogRec.dateTime,14) != 0)
			 break;

		if ( strncmp(cRefLogRec.referenceNo, receivedMsg.reference.refNo, 4) )
			continue;

		referenceLogFound = YES;
		break;
	}

	if ( referenceLogFound  == NO )
	{
		memset(&cRefLogRec.liveChar,' ',sizeof cRefLogRec);
		cRefLogRec.liveChar = '@';

		strncpy(cRefLogRec.branchCode, keyBranchCode, 4);
		strncpy(cRefLogRec.userId, receivedMsg.reference.userId,10);
		strncpy(cRefLogRec.dateTime, keyDateTime, 14);
		strncpy(cRefLogRec.custNo, receivedMsg.reference.custNo, 7);
		strncpy(cRefLogRec.referenceNo, receivedMsg.reference.refNo, 4);
	}

	/* For the customer record opened through phone, customer branch CSO ID should be replaced in UserId for further use (i.e.,after the customer visits the branch) */
	if ( strncmp(receivedMsg.reference.branchCsoId, "                ", 10) && receivedMsg.reference.branchCsoId[0] != NULL )
	{
		strncpy(cRefLogRec.userId, receivedMsg.reference.branchCsoId, 10); /* Key change */
		strncpy(cRefLogRec.dateTime, receivedMsg.reference.branchActionDateTime, 14); /* Key change */
	}

	strncpy(cRefLogRec.referenceReqdFor, receivedMsg.reference.referenceReqdFor, 10);
	cRefLogRec.referenceType = receivedMsg.reference.referenceType;
	strncpy(cRefLogRec.supervisorId, receivedMsg.reference.supervisorId, 10);
	cRefLogRec.newOrUpdate = receivedMsg.reference.newOrUpdate;
	cRefLogRec.bmUpdateStatus = receivedMsg.reference.bmUpdateStatus;
	if ( receivedMsg.reference.custOpenSource == 'P' ) 
		cRefLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */

	strncpy(cRefLogRec.custBranchCode, receivedMsg.reference.custBranchCode, 4);
	cRefLogRec.idType = receivedMsg.reference.idType;
	strncpy(cRefLogRec.idNo, receivedMsg.reference.idNo, 15);
	strncpy(cRefLogRec.aFirstName, receivedMsg.reference.aFirstName, 15);
	strncpy(cRefLogRec.a2ndName, receivedMsg.reference.a2ndName, 15);
	strncpy(cRefLogRec.a3rdName, receivedMsg.reference.a3rdName, 15);
	strncpy(cRefLogRec.aLastName, receivedMsg.reference.aLastName,15);
	strncpy(cRefLogRec.aShortName, receivedMsg.reference.aShortName,30);
	strncpy(cRefLogRec.eFirstName,receivedMsg.reference.eFirstName,15);
	strncpy(cRefLogRec.e2ndName, receivedMsg.reference.e2ndName,15);
	strncpy(cRefLogRec.e3rdName, receivedMsg.reference.e3rdName,15);
	strncpy(cRefLogRec.eLastName, receivedMsg.reference.eLastName,15);
	strncpy(cRefLogRec.eShortName, receivedMsg.reference.eShortName,30);

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
	idLogRec.liveChar = '@';

	strncpy(idLogRec.branchCode,cRefLogRec.branchCode, 4);
	strncpy(idLogRec.userId, receivedMsg.reference.userId, 10);
	strncpy(idLogRec.dateTime,receivedMsg.reference.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idFoundFlag = NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, cRefLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.reference.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.reference.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'R' ) /* Reference */
			continue;

		if ( strncmp(idLogRec.idRefNo, receivedMsg.reference.refNo, 4) )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode, cRefLogRec.branchCode,4);
		strncpy(idLogRec.userId, cRefLogRec.userId,10);
		strncpy(idLogRec.dateTime, cRefLogRec.dateTime,14);

		idLogRec.newOrUpdate = receivedMsg.reference.newOrUpdate;
		strncpy(idLogRec.idRefNo, receivedMsg.reference.refNo, 4);
		idLogRec.idCategory = 'R'; /* Reference */
	}

	if ( idFoundFlag == NO && receivedMsg.reference.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	idLogRec.bmUpdateStatus = cRefLogRec.bmUpdateStatus;

	if ( receivedMsg.reference.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, cRefLogRec.userId, 10);
		strncpy(idLogRec.dateTime, cRefLogRec.dateTime, 14);
	}

	if ( receivedMsg.reference.creationOrUpdate == 'C'  &&
		 receivedMsg.reference.newOrUpdate == 'U' )
	{
		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
		isindexinfo(idTabFile, &idTabKey, 2);
		strncpy(idTabRec.custNo, cRefLogRec.custNo, 7);
		idTabRec.idType = receivedMsg.reference.idType;
		idTabRec.idCategory = 'R';

		isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

		/*if ( readIdTabFile(ISEQUAL) < 0 )*/
		if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) < 0 )
			idLogRec.newOrUpdate = 'N';
		else
			idLogRec.newOrUpdate = 'U';
	}

	idLogRec.idType  = receivedMsg.reference.idType;
	strncpy(idLogRec.idNo, receivedMsg.reference.idNo, 15);
	strncpy(idLogRec.idIssuedAt,receivedMsg.reference.idIssuedAt,20);
	idLogRec.idDateType = receivedMsg.reference.idDateType;
	if( receivedMsg.reference.idDateType == HIJRI ) 
	{	
		strncpy(idLogRec.idIssueDateH,receivedMsg.reference.idIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.reference.idIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )/* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr,tmpStr1); 
		else
		   strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateH,receivedMsg.reference.idExpiryDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.reference.idExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE ) /* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
	}
	else /* GREGORIAN */
	{
		strncpy(idLogRec.idIssueDateG,receivedMsg.reference.idIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.reference.idIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);

		strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateG,receivedMsg.reference.idExpiryDateG,8);
		sprintf(tmpStr, "%.8s", receivedMsg.reference.idExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
	}
	strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
	idLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(idLogRec.lastUpdateUser, cRefLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( idFoundFlag == YES )
	{
		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReferenceRequest] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s] while updating reference information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating reference id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else /* If recd creationOrUpdate == 'C' */
	{
		if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 ) /*Arul added on 02 Dec as it occured several 100 and the record exists already ??? */
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing reference information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing reference id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing reference information; IGNORED\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
	if ( receivedMsg.reference.newOrUpdate == 'N' &&  receivedMsg.reference.custOpenSource == 'P' ) 
		writeIdLogForPhoneHistory(receivedMsg.reference.homeBranch); /* return status is ignored here ; CHECK */

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode, cRefLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, receivedMsg.reference.userId, 10);
	strncpy(addrLogRec.dateTime, receivedMsg.reference.dateTime, 14);

	strncpy(addrLogRec.custNo,receivedMsg.reference.custNo,7);
	strncpy(addrLogRec.addressType, "02", 2);  /* Reference address */
	strncpy(addrLogRec.addressNo, receivedMsg.reference.refNo, 4);
	/* Read corresponding Address log record */

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, cRefLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.reference.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.reference.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "02", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, receivedMsg.reference.refNo, 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}

	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,cRefLogRec.branchCode,4);
		strncpy(addrLogRec.userId, cRefLogRec.userId,10);
		strncpy(addrLogRec.dateTime,cRefLogRec.dateTime,14);
		strncpy(addrLogRec.custNo,receivedMsg.reference.custNo,7);
		strncpy(addrLogRec.addressType, "02", 2);  /* Reference address */
		strncpy(addrLogRec.addressNo, receivedMsg.reference.refNo, 4);
	}
	addrLogRec.bmUpdateStatus = cRefLogRec.bmUpdateStatus;
	addrLogRec.newOrUpdate = receivedMsg.reference.newOrUpdate;

	if ( receivedMsg.reference.creationOrUpdate == 'U' )
	{
		strncpy(addrLogRec.userId, cRefLogRec.userId,10);
		strncpy(addrLogRec.dateTime, cRefLogRec.dateTime, 14);
	}

	if ( addressFoundFlag == NO && receivedMsg.reference.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( receivedMsg.reference.creationOrUpdate == 'C'  &&
		 receivedMsg.reference.newOrUpdate == 'U' )
	{
		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
		isindexinfo(addrTabFile, &addrTabKey, 1);
		strncpy(addrTabRec.custNo, cRefLogRec.custNo, 7);
		strncpy(addrTabRec.addressType, "02", 2);
		strncpy(addrTabRec.addressNo, receivedMsg.reference.refNo, 4);

		isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

		if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
			addrLogRec.newOrUpdate == 'N';
		else
			addrLogRec.newOrUpdate == 'U';
	}

	strncpy(addrLogRec.custNo, cRefLogRec.custNo, 7);

	addrLogRec.addrType = receivedMsg.reference.addressType;
	if ( receivedMsg.reference.addressType == '1' ) /* Saudi post address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.reference.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.reference.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.reference.poBox, 5);

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.reference.address1[5] == '-' )
			receivedMsg.reference.address1[5] = ' ';
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.reference.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.reference.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.reference.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.reference.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.reference.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.reference.country, 3);
	if ( strncmp(receivedMsg.reference.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode,receivedMsg.reference.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.reference.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.reference.telOffExt, 4);
	if ( strncmp(receivedMsg.reference.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode,receivedMsg.reference.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.reference.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.reference.telHomeExt, 4);
	if ( strncmp(receivedMsg.reference.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode,receivedMsg.reference.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.reference.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.reference.faxExt, 4);
	if ( strncmp(receivedMsg.reference.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo,receivedMsg.reference.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.reference.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.reference.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	addrLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(addrLogRec.lastUpdateUser, cRefLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( extraDebug > 6 )
	{
		fprintf(logFp, "%s|%5d|[processReferenceRequest] Before writing to staddrlog [%d] for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]; mobile Number [%.10s]; incoming Mobile No [%.10s]; addrFoundFlag=[%d]; creationOrUpdate[%c]\n", getDateTime(), PID, addrLogFile, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode, addrLogRec.mobileNo, receivedMsg.reference.mobileNo, addressFoundFlag, receivedMsg.reference.creationOrUpdate);
		fflush(logFp);
	}

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReferenceRequest] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else 
	{
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			if ( extraDebug > 6 )
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);
			}
			if ( iserrno != 100 && iserrno != 108 ) /* Added by Arul on 06 Dec; Need investigation */
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in staddrlog for history purposes */
	if ( receivedMsg.reference.newOrUpdate == 'N' &&  receivedMsg.reference.custOpenSource == 'P' ) 
		writeAddrLogForPhoneHistory(receivedMsg.reference.homeBranch); /* return status is IGNORED here ; CHECK */

	cRefLogRec.referenceStatus = '1'; /* Active */
	strncpy(cRefLogRec.lastUpdateBmDate, bankingDate, 8);
	cRefLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(cRefLogRec.lastUpdateUser, cRefLogRec.userId, 10);

	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(cRefLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( referenceLogFound == YES )
	{
		if ( isRewcurr(cRefLogFile, &cRefLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReferenceRequest] ISREWCURR error %d on stcreflog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, cRefLogRec.branchCode, cRefLogRec.custNo, cRefLogRec.referenceNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",cRefLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcreflog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(cRefLogFile, &cRefLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 )/* Arul added on 06 Dec; needs investigation */
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d on stcreflog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, cRefLogRec.branchCode, cRefLogRec.custNo, cRefLogRec.referenceNo );
				fflush(logFp);
				if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stcreflog" );
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in stcreflog for history purposes */
	if ( receivedMsg.reference.newOrUpdate == 'N' &&  receivedMsg.reference.custOpenSource == 'P' ) 
	{
		memset(&cRefLogRec1.liveChar, ' ', sizeof cRefLogRec1);
		memcpy(&cRefLogRec1.liveChar, &cRefLogRec.liveChar, sizeof cRefLogRec);
		strncpy(cRefLogRec1.branchCode, receivedMsg.reference.homeBranch, 4);
		cRefLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processReferenceRequest] Before writing to cRefLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, cRefLogFile);
			fflush(logFp);
		}
		if ( isWrite(cRefLogFile, &cRefLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processReferenceRequest] : ISWRITE error %d on stcreflog while creating a history record for new customer created through phone ; the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, cRefLogRec1.branchCode ); /* RAJESH ; CHECK */
			fflush(logFp);
			/*
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",cRefLogRec1.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcreflog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
			*/
		}
	}
	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processHeirRequest()
{
	char tmpStr[100], tmpStr1[100];
	int heirLogFound=NO, idFoundFlag=NO, addressFoundFlag=NO;
	char keyBranchCode[8], keyUserId[15], keyDateTime[20];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processHeirRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

    memset(&heirLogRec.liveChar,' ',sizeof heirLogRec);
	heirLogRec.liveChar = '@';

	/* If the customer opened through phone; then the customer entry should be made as pending with the customer branch */
	if ( receivedMsg.reference.custOpenSource == 'P' ) 
	{
		strncpy(heirLogRec.branchCode, receivedMsg.heir.custBranchCode,4);
		heirLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */
	}
	else
		strncpy(heirLogRec.branchCode, receivedMsg.heir.homeBranch,4);
		/* custLogRec.custOpenSource  should not be set to B as it will overwrite the source flag to "B" for the customers
		   opened through phone */

	strncpy(heirLogRec.userId, receivedMsg.heir.userId,10);
	strncpy(heirLogRec.dateTime, receivedMsg.heir.dateTime,14);
	strncpy(heirLogRec.custNo, receivedMsg.heir.custNo, 7);
	strncpy(heirLogRec.heirNo, receivedMsg.heir.heirNo, 4);

	strncpy(keyBranchCode, heirLogRec.branchCode, 4);
	strncpy(keyUserId, heirLogRec.userId, 10);
	strncpy(keyDateTime, heirLogRec.dateTime, 14);

	isindexinfo(heirLogFile, &heirLogKey, 1);

	isstart(heirLogFile, &heirLogKey, 28, &heirLogRec.liveChar, ISGTEQ );
	while ( isRead(heirLogFile, &heirLogRec.liveChar, ISNEXT) == 0 )
	{
		if (strncmp(keyBranchCode, heirLogRec.branchCode,4) != 0 || strncmp(keyUserId, heirLogRec.userId,10) != 0 || strncmp(keyDateTime, heirLogRec.dateTime,14) != 0)
			 break;

		if ( strncmp(heirLogRec.heirNo, receivedMsg.heir.heirNo, 4) )
			continue;

		heirLogFound = YES;
		break;
	}

	if ( heirLogFound  == NO )
	{
		memset(&heirLogRec.liveChar,' ',sizeof heirLogRec);
		heirLogRec.liveChar = '@';

		strncpy(heirLogRec.branchCode, keyBranchCode, 4);
		strncpy(heirLogRec.userId, receivedMsg.heir.userId,10);
		strncpy(heirLogRec.dateTime, keyDateTime, 14);
		strncpy(heirLogRec.custNo, receivedMsg.heir.custNo, 7);
		strncpy(heirLogRec.heirNo, receivedMsg.heir.heirNo, 4);
	}

	/* For the customer record opened through phone, customer branch CSO ID should be replaced in UserId for further use (i.e.,after the customer visits the branch) */
	if ( strncmp(receivedMsg.heir.branchCsoId, "                ", 10) && receivedMsg.heir.branchCsoId[0] != NULL )
	{
		strncpy(heirLogRec.userId, receivedMsg.heir.branchCsoId, 10); /* Key change */
		strncpy(heirLogRec.dateTime, receivedMsg.heir.branchActionDateTime, 14); /* Key change */
	}

	heirLogRec.heirType = receivedMsg.heir.heirType;
	strncpy(heirLogRec.supervisorId, receivedMsg.heir.supervisorId, 10);
	heirLogRec.newOrUpdate = receivedMsg.heir.newOrUpdate;
	heirLogRec.bmUpdateStatus = receivedMsg.heir.bmUpdateStatus;
	if ( receivedMsg.heir.custOpenSource == 'P' ) 
		heirLogRec.custOpenSource = 'P'; /* Customer opened thrugh phone */

	strncpy(heirLogRec.custBranchCode, receivedMsg.heir.custBranchCode, 4);
	heirLogRec.idType = receivedMsg.heir.idType;
	strncpy(heirLogRec.idNo, receivedMsg.heir.idNo, 15);
	strncpy(heirLogRec.aFirstName, receivedMsg.heir.aFirstName, 15);
	strncpy(heirLogRec.a2ndName, receivedMsg.heir.a2ndName, 15);
	strncpy(heirLogRec.a3rdName, receivedMsg.heir.a3rdName, 15);
	strncpy(heirLogRec.aLastName, receivedMsg.heir.aLastName,15);
	strncpy(heirLogRec.aShortName, receivedMsg.heir.aShortName,30);
	strncpy(heirLogRec.eFirstName,receivedMsg.heir.eFirstName,15);
	strncpy(heirLogRec.e2ndName, receivedMsg.heir.e2ndName,15);
	strncpy(heirLogRec.e3rdName, receivedMsg.heir.e3rdName,15);
	strncpy(heirLogRec.eLastName, receivedMsg.heir.eLastName,15);
	strncpy(heirLogRec.eShortName, receivedMsg.heir.eShortName,30);

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
	idLogRec.liveChar = '@';

	strncpy(idLogRec.branchCode, heirLogRec.branchCode, 4);
	strncpy(idLogRec.userId, receivedMsg.heir.userId, 10);
	strncpy(idLogRec.dateTime,receivedMsg.heir.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idFoundFlag = NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, heirLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.heir.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.heir.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'H' ) /* Heir */
			continue;

		if ( strncmp(idLogRec.idRefNo, receivedMsg.heir.heirNo, 4) )
			continue;

		idFoundFlag = YES;
		break;
	}

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode, heirLogRec.branchCode,4);
		strncpy(idLogRec.userId, heirLogRec.userId,10);
		strncpy(idLogRec.dateTime, heirLogRec.dateTime,14);

		idLogRec.newOrUpdate = receivedMsg.heir.newOrUpdate;
		strncpy(idLogRec.idRefNo, receivedMsg.heir.heirNo, 4);
		idLogRec.idCategory = 'H'; /* Heir */
	}

	if ( idFoundFlag == NO && receivedMsg.heir.newOrUpdate == 'U' )
		idLogRec.newOrUpdate = 'N';

	idLogRec.bmUpdateStatus = heirLogRec.bmUpdateStatus;

	if ( receivedMsg.heir.creationOrUpdate == 'U' )
	{
		strncpy(idLogRec.userId, heirLogRec.userId, 10);
		strncpy(idLogRec.dateTime, heirLogRec.dateTime, 14);
	}

	if ( receivedMsg.heir.creationOrUpdate == 'C'  &&
		 receivedMsg.heir.newOrUpdate == 'U' )
	{
		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
		isindexinfo(idTabFile, &idTabKey, 2);
		strncpy(idTabRec.custNo, heirLogRec.custNo, 7);
		idTabRec.idType = receivedMsg.heir.idType;
		idTabRec.idCategory = 'H';

		isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

		/*if ( readIdTabFile(ISEQUAL) < 0 )*/
		if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) < 0 )
			idLogRec.newOrUpdate = 'N';
		else
			idLogRec.newOrUpdate = 'U';
	}

	idLogRec.idType  = receivedMsg.heir.idType;
	strncpy(idLogRec.idNo, receivedMsg.heir.idNo, 15);
	strncpy(idLogRec.idIssuedAt,receivedMsg.heir.idIssuedAt,20);
	idLogRec.idDateType = receivedMsg.heir.idDateType;
	if( receivedMsg.heir.idDateType == HIJRI ) 
	{	
		strncpy(idLogRec.idIssueDateH,receivedMsg.heir.idIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.heir.idIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )/* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr,tmpStr1); 
		else
		   strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateH, receivedMsg.heir.idExpiryDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.heir.idExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE ) /* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
	}
	else /* GREGORIAN */
	{
		strncpy(idLogRec.idIssueDateG,receivedMsg.heir.idIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.heir.idIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);

		strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateG,receivedMsg.heir.idExpiryDateG,8);
		sprintf(tmpStr, "%.8s", receivedMsg.heir.idExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
	}
	strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
	idLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(idLogRec.lastUpdateUser, heirLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( idFoundFlag == YES )
	{
		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processHeirRequest] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s] while updating heir information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating heir id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else /* If recd creationOrUpdate == 'C' */
	{
		if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 ) /*Arul added on 02 Dec as it occured several 100 and the record exists already ??? */
			{
				fprintf(logFp, "%s|%5d|[processHeirRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing heir information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing heir id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processHeirRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing heir information; IGNORED\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in stidlog for history purposes */
	if ( receivedMsg.heir.newOrUpdate == 'N' &&  receivedMsg.heir.custOpenSource == 'P' ) 
		writeIdLogForPhoneHistory(receivedMsg.heir.homeBranch); /* return status is ignored here ; CHECK */

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode, heirLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, receivedMsg.heir.userId, 10);
	strncpy(addrLogRec.dateTime, receivedMsg.heir.dateTime, 14);

	strncpy(addrLogRec.custNo,receivedMsg.heir.custNo,7);
	strncpy(addrLogRec.addressType, "05", 2);  /* Heir address */
	strncpy(addrLogRec.addressNo, receivedMsg.heir.heirNo, 4);
	/* Read corresponding Address log record */

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, heirLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.heir.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.heir.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "05", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, receivedMsg.heir.heirNo, 4) ) 
			continue;

		addressFoundFlag = YES;
		break;
	}

	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode, heirLogRec.branchCode,4);
		strncpy(addrLogRec.userId, heirLogRec.userId,10);
		strncpy(addrLogRec.dateTime, heirLogRec.dateTime,14);
		strncpy(addrLogRec.custNo, receivedMsg.heir.custNo,7);
		strncpy(addrLogRec.addressType, "05", 2);  /* Heir address */
		strncpy(addrLogRec.addressNo, receivedMsg.heir.heirNo, 4);
	}
	addrLogRec.bmUpdateStatus = heirLogRec.bmUpdateStatus;
	addrLogRec.newOrUpdate = receivedMsg.heir.newOrUpdate;

	if ( receivedMsg.heir.creationOrUpdate == 'U' )
	{
		strncpy(addrLogRec.userId, heirLogRec.userId,10);
		strncpy(addrLogRec.dateTime, heirLogRec.dateTime, 14);
	}

	if ( addressFoundFlag == NO && receivedMsg.heir.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( receivedMsg.heir.creationOrUpdate == 'C'  &&
		 receivedMsg.heir.newOrUpdate == 'U' )
	{
		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
		isindexinfo(addrTabFile, &addrTabKey, 1);
		strncpy(addrTabRec.custNo, heirLogRec.custNo, 7);
		strncpy(addrTabRec.addressType, "05", 2); /* Heir Address */
		strncpy(addrTabRec.addressNo, receivedMsg.heir.heirNo, 4);

		isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ);

		if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
			addrLogRec.newOrUpdate == 'N';
		else
			addrLogRec.newOrUpdate == 'U';
	}

	strncpy(addrLogRec.custNo, heirLogRec.custNo, 7);
	strncpy(addrLogRec.address1, receivedMsg.heir.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.heir.address2, 30);

	addrLogRec.addrType = receivedMsg.heir.addressType;
	if ( receivedMsg.heir.addressType == '1' ) /* Saudi post address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.heir.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.heir.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.heir.poBox, 5);
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.heir.poBox, 10);

	strncpy(addrLogRec.cityName, receivedMsg.heir.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.heir.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.heir.country, 3);
	if ( strncmp(receivedMsg.heir.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode, receivedMsg.heir.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.heir.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.heir.telOffExt, 4);
	if ( strncmp(receivedMsg.heir.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode, receivedMsg.heir.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.heir.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.heir.telHomeExt, 4);
	if ( strncmp(receivedMsg.heir.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode, receivedMsg.heir.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.heir.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.heir.faxExt, 4);
	if ( strncmp(receivedMsg.heir.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo, receivedMsg.heir.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.heir.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.heir.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	addrLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(addrLogRec.lastUpdateUser, heirLogRec.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( extraDebug > 6 )
	{
		fprintf(logFp, "%s|%5d|[processHeirRequest] Before writing to staddrlog [%d] for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]; mobile Number [%.10s]; incoming Mobile No [%.10s]; addrFoundFlag=[%d]; creationOrUpdate[%c]\n", getDateTime(), PID, addrLogFile, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode, addrLogRec.mobileNo, receivedMsg.reference.mobileNo, addressFoundFlag, receivedMsg.reference.creationOrUpdate);
		fflush(logFp);
	}

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processHeirRequest] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else 
	{
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			if ( extraDebug > 6 )
			{
				fprintf(logFp, "%s|%5d|[processHeirRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);
			}
			if ( iserrno != 100 && iserrno != 108 ) /* Added by Arul on 06 Dec; Need investigation */
			{
				fprintf(logFp, "%s|%5d|[processHeirRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in staddrlog for history purposes */
	if ( receivedMsg.heir.newOrUpdate == 'N' &&  receivedMsg.heir.custOpenSource == 'P' ) 
		writeAddrLogForPhoneHistory(receivedMsg.heir.homeBranch); /* return status is IGNORED here ; CHECK */

	heirLogRec.heirStatus = '1'; /* Active */
	strncpy(heirLogRec.lastUpdateBmDate, bankingDate, 8);
	heirLogRec.recordChanged = 'Y'; /* Yes */

	strncpy(heirLogRec.proxyNo, receivedMsg.heir.proxyNo, 15);
	heirLogRec.proxyDateType = receivedMsg.heir.proxyDateType;
	if( receivedMsg.heir.idDateType == HIJRI ) 
	{	
		strncpy(heirLogRec.proxyIssueDateH,receivedMsg.heir.proxyIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.heir.proxyIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )/* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr,tmpStr1); 
		else
		   strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(heirLogRec.proxyIssueDateG, tmpStr1, 8);
	}
	else /* GREGORIAN */
	{
		strncpy(heirLogRec.proxyIssueDateG,receivedMsg.heir.proxyIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.heir.proxyIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);

		strncpy(heirLogRec.proxyIssueDateH, tmpStr1, 8);
	}

	strncpy(heirLogRec.lastUpdateUser, heirLogRec.userId, 10);

	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(heirLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( heirLogFound == YES )
	{
		if ( isRewcurr(heirLogFile, &heirLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processHeirRequest] ISREWCURR error %d on stheirlog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, heirLogRec.branchCode, heirLogRec.custNo, heirLogRec.heirNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]", heirLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stheirlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stheirlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(heirLogFile, &heirLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 )/* Arul added on 06 Dec; needs investigation */
			{
				fprintf(logFp, "%s|%5d|[processReferenceRequest] ISWRITE error %d on stheirlog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, heirLogRec.branchCode, heirLogRec.custNo, heirLogRec.heirNo );
				fflush(logFp);
				if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stheirlog" );
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stheirlog", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	/* If the customer opening is done through phone , write one more record in stcreflog for history purposes */
	if ( receivedMsg.heir.newOrUpdate == 'N' &&  receivedMsg.heir.custOpenSource == 'P' ) 
	{
		memset(&heirLogRec1.liveChar, ' ', sizeof heirLogRec1);
		memcpy(&heirLogRec1.liveChar, &heirLogRec.liveChar, sizeof heirLogRec);
		strncpy(heirLogRec1.branchCode, receivedMsg.heir.homeBranch, 4);
		heirLogRec1.bmUpdateStatus = 'P'; /* Entered by Phone banking officer */

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[processHeirRequest] Before writing to heirLogFile (%d) for phone banking history purpose..\n", getDateTime(), PID, heirLogFile);
			fflush(logFp);
		}
		if ( isWrite(heirLogFile, &heirLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processHeirRequest] : ISWRITE error %d on stheirlog while creating a history record for new customer created through phone ; the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, heirLogRec1.branchCode ); /* RAJESH ; CHECK */
			fflush(logFp);
			/*
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",heirLogRec1.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stheirlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stheirlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
			*/
		}
	}
	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processOwnerLogSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processOwnerLogSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	/* Same signatorySearch structure is used for owner search also */
	memset(responseMsg.signatorySearch.msgLen, ' ', sizeof responseMsg.signatorySearch);
	responseMsg.signatorySearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.signatorySearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);
	strncpy(ownerLogRec.branchCode, receivedMsg.signatorySearch.branchCode, 4); 
	strncpy(ownerLogRec.userId, receivedMsg.signatorySearch.userId, 10);
	strncpy(ownerLogRec.dateTime, receivedMsg.signatorySearch.dateTime, 14);
	isindexinfo(ownerLogFile, &ownerLogKey, 1);
	if ( isstart(ownerLogFile, &ownerLogKey, 28, &ownerLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processOwnerLogSearch] ISSTART/ISGTEQ error %d occured on stownerlog for customer # [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, ownerLogRec.custNo, ownerLogRec.branchCode);
		fflush(logFp);
	}

	while ( isRead(ownerLogFile, &ownerLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerLogRec.branchCode, receivedMsg.signatorySearch.branchCode, 4) ||
			 strncmp(ownerLogRec.userId, receivedMsg.signatorySearch.userId, 10) || 
			 strncmp(ownerLogRec.dateTime, receivedMsg.signatorySearch.dateTime,14)	)
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].accNo, ownerLogRec.custNo, 7);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryNo, ownerLogRec.ownerNo, 4);
		responseMsg.signatorySearch.details[recsInThisMsg].idType =  ownerLogRec.idType;
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].idNo, ownerLogRec.idNo, 15);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].custBranchCode, ownerLogRec.custBranchCode, 4);
		if (strncmp(ownerLogRec.aShortName,"                                 ",30))
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, ownerLogRec.aShortName, 30);
		else 
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, ownerLogRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.signatorySearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.signatorySearch.noOfRecs, tmpStr, 2);
	responseMsg.signatorySearch.details[recsInThisMsg+1].accNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.signatorySearch.msgLen);
	return SUCCESS;
}

processOwnerTabSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processOwnerTabSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	/* Same signatorySearch structure is used for owner search also */
	memset(responseMsg.signatorySearch.msgLen, ' ', sizeof responseMsg.signatorySearch);
	responseMsg.signatorySearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.signatorySearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);
	strncpy(ownerTabRec.custNo, receivedMsg.signatorySearch.custNo, 7); 
	isindexinfo(ownerTabFile, &ownerTabKey, 1);
	if ( isstart(ownerTabFile, &ownerTabKey, 28, &ownerTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processOwnerTabSearch] ISSTART/ISGTEQ error %d occured on stownertab for customer # [%.7s] \n", getDateTime(), PID, iserrno, ownerTabRec.custNo);
		fflush(logFp);
	}

	while ( isread(ownerTabFile, &ownerTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerTabRec.custNo, receivedMsg.signatorySearch.custNo, 7) )
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].accNo, ownerTabRec.custNo, 7);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryNo, ownerTabRec.ownerNo, 4);
		responseMsg.signatorySearch.details[recsInThisMsg].idType =  ownerTabRec.idType;
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].idNo, ownerTabRec.idNo, 15);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].custBranchCode, ownerTabRec.branchCode, 4);
		if (strncmp(ownerTabRec.aShortName,"                                 ",30))
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, ownerTabRec.aShortName, 30);
		else 
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, ownerTabRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.signatorySearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.signatorySearch.noOfRecs, tmpStr, 2);
	responseMsg.signatorySearch.details[recsInThisMsg+1].accNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.signatorySearch.msgLen);
	return SUCCESS;
}

readOwnerLogInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readOwnerLogInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.ownerDetail.msgLen,' ',sizeof responseMsg.ownerDetail);

	memset(&ownerLogRec.liveChar, ' ', sizeof ownerLogRec);
	strncpy(ownerLogRec.branchCode, receivedMsg.signatoryDetail.branchCode,4);
	strncpy(ownerLogRec.userId, receivedMsg.signatoryDetail.userId,10);
	strncpy(ownerLogRec.dateTime, receivedMsg.signatoryDetail.dateTime,14);
	isindexinfo(ownerLogFile,&ownerLogKey,1);
	if ( isstart(ownerLogFile, &ownerLogKey, 28, &ownerLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatOwnerDetailResponse(END_OF_FILE,"No owner Records exists..", "No owner Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stownlog", iserrno);
			formatOwnerDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.ownerDetail.msgLen);
		return FAILURE;
	}

	while( isread(ownerLogFile, &ownerLogRec.liveChar, ISNEXT) == 0)
	{
		if (strncmp(receivedMsg.signatoryDetail.branchCode, ownerLogRec.branchCode, 4) != 0 || strncmp(receivedMsg.signatoryDetail.userId, ownerLogRec.userId,10) != 0 || strncmp(receivedMsg.signatoryDetail.dateTime,ownerLogRec.dateTime,14) != 0)
			break;

		if ( strncmp(ownerLogRec.ownerNo, receivedMsg.signatoryDetail.signatoryNo, 4)  )
			continue;

		strncpy(responseMsg.ownerDetail.custNo, ownerLogRec.custNo, 14);
		strncpy(responseMsg.ownerDetail.ownerNo, ownerLogRec.ownerNo, 4);
		responseMsg.ownerDetail.newOrUpdate = ownerLogRec.newOrUpdate;
		strncpy(responseMsg.ownerDetail.supervisorId, ownerLogRec.supervisorId, 10);
		strncpy(responseMsg.ownerDetail.custBranchCode, ownerLogRec.custBranchCode, 4);
		responseMsg.ownerDetail.ownerType = ownerLogRec.ownerType;
		responseMsg.ownerDetail.ownerActiveStatus = ownerLogRec.ownerEnabled;
		responseMsg.ownerDetail.idType = ownerLogRec.idType;
		strncpy(responseMsg.ownerDetail.idNo, ownerLogRec.idNo, 15);

		/* Read corresponding Id Log */
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, ownerLogRec.branchCode, 4);
		strncpy(idLogRec.userId, ownerLogRec.userId, 10);
		strncpy(idLogRec.dateTime, ownerLogRec.dateTime, 14);
		idLogRec.idType = ownerLogRec.idType;
		strncpy(idLogRec.idNo, ownerLogRec.idNo, 15);
		idLogRec.idCategory = 'W'; /* owners */

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

		if ( readIdLogFile(ISEQUAL) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		strncpy(responseMsg.ownerDetail.idNo, idLogRec.idNo, 15);
		responseMsg.ownerDetail.idType = idLogRec.idType;
		responseMsg.ownerDetail.idDateType = idLogRec.idDateType;
		strncpy(responseMsg.ownerDetail.idIssuedAt, idLogRec.idIssuedAt, 20); 
		strncpy(responseMsg.ownerDetail.idIssueDateH, idLogRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

		strncpy(responseMsg.ownerDetail.parentCompanyName, ownerLogRec.parentCompanyName, 213); /* From parentCompanyName to eShortName */

		/* Read corresponding address log */

		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, ownerLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, ownerLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, ownerLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		if ( isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[readOwnerLogInfo] ISSTART error %d on staddrlog for key [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.branchCode);
			fflush(logFp);
		}

		while ( isread(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if (strncmp(addrLogRec.branchCode, ownerLogRec.branchCode, 4) != 0 || strncmp(addrLogRec.userId, ownerLogRec.userId,10) != 0 || strncmp(addrLogRec.dateTime,ownerLogRec.dateTime,14) != 0)
				break;

			if ( strncmp(addrLogRec.addressNo, ownerLogRec.ownerNo, 4)  )
				continue;

			if ( extraDebug )
			{
				fprintf(logFp, "Address type [%.2s] ; [%.200s] \n", addrLogRec.addressType, addrLogRec.address1);
				fflush(logFp);
			}
			if ( strncmp(addrLogRec.addressType, "03", 2) == 0 ) /* Owner Local address */
			{
				strncpy(responseMsg.ownerDetail.address1, addrLogRec.address1, 30);
				strncpy(responseMsg.ownerDetail.address2, addrLogRec.address2, 30);
				strncpy(responseMsg.ownerDetail.poBox, addrLogRec.poBox, 10);
				strncpy(responseMsg.ownerDetail.cityName, addrLogRec.cityName, 20);
				strncpy(responseMsg.ownerDetail.zipCode, addrLogRec.zipCode, 10);
				strncpy(responseMsg.ownerDetail.country, addrLogRec.country, 3);
				responseMsg.ownerDetail.addrType = addrLogRec.addrType;
				if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
					strncpy(responseMsg.ownerDetail.poBox, addrLogRec.unitNo, 5);
				strncpy(responseMsg.ownerDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
				strncpy(responseMsg.ownerDetail.telOffNo, addrLogRec.telOffNo, 10);
				strncpy(responseMsg.ownerDetail.telOffExt, addrLogRec.telOffExt, 4);
				strncpy(responseMsg.ownerDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
				strncpy(responseMsg.ownerDetail.telHomeNo, addrLogRec.telHomeNo, 10);
				strncpy(responseMsg.ownerDetail.telHomeExt, addrLogRec.telHomeExt, 4);
				strncpy(responseMsg.ownerDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
				strncpy(responseMsg.ownerDetail.faxNo, addrLogRec.faxNo, 10);
				strncpy(responseMsg.ownerDetail.faxExt, addrLogRec.faxExt, 4);
				strncpy(responseMsg.ownerDetail.mobileNo, addrLogRec.mobileNo, 10);
				strncpy(responseMsg.ownerDetail.pagerNo, addrLogRec.pagerNo, 10);
				strncpy(responseMsg.ownerDetail.eMail, addrLogRec.eMail, 30);
			}
			else if ( strncmp(addrLogRec.addressType, "04", 2) == 0 ) /* Owner Home address */
			{
				strncpy(responseMsg.ownerDetail.homeAddress1, addrLogRec.address1, 30);
				strncpy(responseMsg.ownerDetail.homeAddress2, addrLogRec.address2, 30);
				strncpy(responseMsg.ownerDetail.homePoBox, addrLogRec.poBox, 10);
				strncpy(responseMsg.ownerDetail.homeCityName, addrLogRec.cityName, 20);
				strncpy(responseMsg.ownerDetail.homeZipCode, addrLogRec.zipCode, 10);
				strncpy(responseMsg.ownerDetail.homeCountry, addrLogRec.country, 3);
				strncpy(responseMsg.ownerDetail.homeTelOffAreaCode, addrLogRec.telOffAreaCode, 4);
				strncpy(responseMsg.ownerDetail.homeTelOffNo, addrLogRec.telOffNo, 10);
				strncpy(responseMsg.ownerDetail.homeTelOffExt, addrLogRec.telOffExt, 4);
				strncpy(responseMsg.ownerDetail.homeTelHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
				strncpy(responseMsg.ownerDetail.homeTelHomeNo, addrLogRec.telHomeNo, 10);
				strncpy(responseMsg.ownerDetail.homeTelHomeExt, addrLogRec.telHomeExt, 4);
				strncpy(responseMsg.ownerDetail.homeFaxAreaCode, addrLogRec.faxAreaCode, 4);
				strncpy(responseMsg.ownerDetail.homeFaxNo, addrLogRec.faxNo, 10);
				strncpy(responseMsg.ownerDetail.homeFaxExt, addrLogRec.faxExt, 4);
				strncpy(responseMsg.ownerDetail.homeMobileNo, addrLogRec.mobileNo, 10);
				strncpy(responseMsg.ownerDetail.homePagerNo, addrLogRec.pagerNo, 10);
				strncpy(responseMsg.ownerDetail.homeEmail, addrLogRec.eMail, 30);
			}
		}
    	formatOwnerDetailResponse(DONE,"Successful..","Successful..");
		sendResponse(responseMsg.ownerDetail.msgLen);
		return SUCCESS;
	}
	formatOwnerDetailResponse(END_OF_FILE,"End of File encountered..","End of File encountered..");
	sendResponse(responseMsg.ownerDetail.msgLen);
	return FAILURE;
}

readOwnerTabInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readOwnerTabInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.ownerDetail.msgLen,' ',sizeof responseMsg.ownerDetail);
	responseMsg.ownerDetail.nullPad = '\0';

	memset(&ownerTabRec.liveChar, ' ', sizeof ownerTabRec);
	strncpy(ownerTabRec.custNo, receivedMsg.signatoryDetail.accNo, 7);
	strncpy(ownerTabRec.ownerNo, receivedMsg.signatoryDetail.signatoryNo, 4);
	isindexinfo(ownerTabFile,&ownerTabKey,1);
	if ( isstart(ownerTabFile, &ownerTabKey, 0, &ownerTabRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatOwnerDetailResponse(END_OF_FILE,"No owner Records exists..", "No owner Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stowntab", iserrno);
			formatOwnerDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.ownerDetail.msgLen);
		return FAILURE;
	}

	if ( isRead(ownerTabFile, &ownerTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readOwnerTabInfo] ISREAD/ISEQUAL error %d occured on stowntab for the customer number [%.7s] and the owner number [%.4s]\n", getDateTime(), PID, iserrno, ownerTabRec.custNo, ownerTabRec.ownerNo);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured on stowntab", iserrno);
		formatOwnerDetailResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.ownerDetail.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.ownerDetail.custNo, ownerTabRec.custNo, 14);
	strncpy(responseMsg.ownerDetail.ownerNo, ownerTabRec.ownerNo, 4);
	strncpy(responseMsg.ownerDetail.custBranchCode, ownerTabRec.branchCode, 4);
	responseMsg.ownerDetail.idType = ownerTabRec.idType;
	strncpy(responseMsg.ownerDetail.idNo, ownerTabRec.idNo, 15);
	responseMsg.ownerDetail.ownerActiveStatus = ownerTabRec.ownerEnabled;
	responseMsg.ownerDetail.ownerType = ownerTabRec.ownerType;

	/* Read corresponding Id Tab */
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	strncpy(idTabRec.custNo, ownerTabRec.custNo, 7);
	idTabRec.idType = ownerTabRec.idType;
	strncpy(idTabRec.idNo, ownerTabRec.idNo, 15);
	idTabRec.idCategory = 'W'; /* owners */

	isindexinfo(idTabFile, &idTabKey, 1); /* Arul changed from 5 to 1 */
	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	if ( readIdTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.ownerDetail.idNo, idTabRec.idNo, 15);
	responseMsg.ownerDetail.idType = idTabRec.idType;
	responseMsg.ownerDetail.idDateType = idTabRec.idDateType;
	strncpy(responseMsg.ownerDetail.idIssuedAt, idTabRec.idIssuedAt, 20); 
	strncpy(responseMsg.ownerDetail.idIssueDateH, idTabRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

	strncpy(responseMsg.ownerDetail.parentCompanyName, ownerTabRec.parentCompanyName, 213); // From parentCompanyName to eShortName 

	/* Read corresponding address tab */

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

	strncpy(addrTabRec.custNo, ownerTabRec.custNo, 7);
	strncpy(addrTabRec.addressType, "03", 2); /* owner local address */

	isindexinfo(addrTabFile, &addrTabKey, 1);
	if ( isstart(addrTabFile, &addrTabKey, 9, &addrTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readOwnerTabInfo] ISSTART error %d on staddrtab for key [%.9s]\n", getDateTime(), PID, iserrno , addrTabRec.custNo);
		fflush(logFp);
	}

	while ( isread(addrTabFile, &addrTabRec.liveChar, ISNEXT) == 0 )
	{
		if (strncmp(addrTabRec.custNo, ownerTabRec.custNo, 7) ) 
			break;

		if ( strncmp(addrTabRec.addressNo, ownerTabRec.ownerNo, 4)  )
			continue;

		if ( strncmp(addrTabRec.addressType, "03", 2) == 0 ) /* Owner Local address */
		{
			strncpy(responseMsg.ownerDetail.address1, addrTabRec.address1, 30);
			strncpy(responseMsg.ownerDetail.address2, addrTabRec.address2, 30);
			strncpy(responseMsg.ownerDetail.poBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.ownerDetail.cityName, addrTabRec.cityName, 20);
			strncpy(responseMsg.ownerDetail.zipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.ownerDetail.country, addrTabRec.country, 3);
			responseMsg.ownerDetail.addrType = addrTabRec.addrType;
			if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.ownerDetail.poBox, addrTabRec.unitNo, 5);
			strncpy(responseMsg.ownerDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.ownerDetail.telOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.ownerDetail.telOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.ownerDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.ownerDetail.telHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.ownerDetail.telHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.ownerDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.ownerDetail.faxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.ownerDetail.faxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.ownerDetail.mobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.ownerDetail.pagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.ownerDetail.eMail, addrTabRec.eMail, 30);
		}
		else if ( strncmp(addrTabRec.addressType, "04", 2) == 0 ) /* Owner Home address */
		{
			strncpy(responseMsg.ownerDetail.homeAddress1, addrTabRec.address1, 30);
			strncpy(responseMsg.ownerDetail.homeAddress2, addrTabRec.address2, 30);
			strncpy(responseMsg.ownerDetail.homePoBox, addrTabRec.poBox, 10);
			strncpy(responseMsg.ownerDetail.homeCityName, addrTabRec.cityName, 20);
			strncpy(responseMsg.ownerDetail.homeZipCode, addrTabRec.zipCode, 10);
			strncpy(responseMsg.ownerDetail.homeCountry, addrTabRec.country, 3);
			strncpy(responseMsg.ownerDetail.homeTelOffAreaCode, addrTabRec.telOffAreaCode, 4);
			strncpy(responseMsg.ownerDetail.homeTelOffNo, addrTabRec.telOffNo, 10);
			strncpy(responseMsg.ownerDetail.homeTelOffExt, addrTabRec.telOffExt, 4);
			strncpy(responseMsg.ownerDetail.homeTelHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
			strncpy(responseMsg.ownerDetail.homeTelHomeNo, addrTabRec.telHomeNo, 10);
			strncpy(responseMsg.ownerDetail.homeTelHomeExt, addrTabRec.telHomeExt, 4);
			strncpy(responseMsg.ownerDetail.homeFaxAreaCode, addrTabRec.faxAreaCode, 4);
			strncpy(responseMsg.ownerDetail.homeFaxNo, addrTabRec.faxNo, 10);
			strncpy(responseMsg.ownerDetail.homeFaxExt, addrTabRec.faxExt, 4);
			strncpy(responseMsg.ownerDetail.homeMobileNo, addrTabRec.mobileNo, 10);
			strncpy(responseMsg.ownerDetail.homePagerNo, addrTabRec.pagerNo, 10);
			strncpy(responseMsg.ownerDetail.homeEmail, addrTabRec.eMail, 30);
		}
	}
	formatOwnerDetailResponse(DONE,"Successful..","Successful..");
	sendResponse(responseMsg.ownerDetail.msgLen);
	return SUCCESS;
}

processOwnerRequest()
{
	char tmpStr[100], tmpStr1[100];
	int  idFoundFlag = NO, addressFoundFlag=NO, ownerLogFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processOwnerRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);

    memset(&ownerLogRec.liveChar,' ',sizeof ownerLogRec);
	ownerLogRec.liveChar = '@';
	strncpy(ownerLogRec.branchCode, receivedMsg.owner.homeBranch,4);
	strncpy(ownerLogRec.userId, receivedMsg.owner.userId,10);
	strncpy(ownerLogRec.dateTime, receivedMsg.owner.dateTime,14);

	strncpy(ownerLogRec.custNo,  receivedMsg.owner.custNo, 7);
	strncpy(ownerLogRec.ownerNo, receivedMsg.owner.ownerNo, 4);

	isindexinfo(ownerLogFile, &ownerLogKey, 1);

	isstart(ownerLogFile,&ownerLogKey, 28, &ownerLogRec.liveChar, ISGTEQ );

	while ( isRead(ownerLogFile, &ownerLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(ownerLogRec.branchCode, receivedMsg.owner.homeBranch, 4) ||
			 strncmp(ownerLogRec.userId, receivedMsg.owner.userId, 10) ||
			 strncmp(ownerLogRec.dateTime, receivedMsg.owner.dateTime, 14) )
			 break;

		if ( strncmp(ownerLogRec.ownerNo, receivedMsg.owner.ownerNo, 4) )
			continue;

		ownerLogFound = YES;
		break;
	}

	if ( ownerLogFound  == NO )
	{
		memset(&ownerLogRec.liveChar,' ',sizeof ownerLogRec);
		ownerLogRec.liveChar = '@';
		strncpy(ownerLogRec.branchCode, receivedMsg.owner.homeBranch,4);
		strncpy(ownerLogRec.userId, receivedMsg.owner.userId,10);
		strncpy(ownerLogRec.dateTime, receivedMsg.owner.dateTime,14);

		strncpy(ownerLogRec.custNo,  receivedMsg.owner.custNo, 7);
		strncpy(ownerLogRec.ownerNo, receivedMsg.owner.ownerNo, 4);
	}
		
	strncpy(ownerLogRec.parentCompanyName, receivedMsg.owner.parentCompanyName, 30);
	strncpy(ownerLogRec.shareHoldingPerc, receivedMsg.owner.sharHoldingPerc, 3);
	ownerLogRec.ownerType = receivedMsg.owner.ownerType;
	strncpy(ownerLogRec.supervisorId, receivedMsg.owner.supervisorId, 10);
	ownerLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
	ownerLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */

	strncpy(ownerLogRec.custBranchCode, receivedMsg.owner.custBranchCode, 4);
	ownerLogRec.idType = receivedMsg.owner.idType;
	strncpy(ownerLogRec.idNo, receivedMsg.owner.idNo, 15);
	strncpy(ownerLogRec.aFirstName, receivedMsg.owner.aFirstName, 15);
	strncpy(ownerLogRec.a2ndName, receivedMsg.owner.a2ndName, 15);
	strncpy(ownerLogRec.a3rdName, receivedMsg.owner.a3rdName, 15);
	strncpy(ownerLogRec.aLastName, receivedMsg.owner.aLastName,15);
	strncpy(ownerLogRec.aShortName, receivedMsg.owner.aShortName,30);
	strncpy(ownerLogRec.eFirstName,receivedMsg.owner.eFirstName,15);
	strncpy(ownerLogRec.e2ndName, receivedMsg.owner.e2ndName,15);
	strncpy(ownerLogRec.e3rdName, receivedMsg.owner.e3rdName,15);
	strncpy(ownerLogRec.eLastName, receivedMsg.owner.eLastName,15);
	strncpy(ownerLogRec.eShortName, receivedMsg.owner.eShortName,30);

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	strncpy(idLogRec.branchCode,receivedMsg.owner.homeBranch,4);
	strncpy(idLogRec.userId, receivedMsg.owner.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.owner.dateTime,14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idFoundFlag = NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.owner.homeBranch, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.owner.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.owner.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'W' ) /* Owner */
			continue;

		if ( strncmp(idLogRec.idRefNo, receivedMsg.owner.ownerNo, 4) )
			continue;

		idFoundFlag = YES;
		break;

	}

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.owner.homeBranch,4);
		strncpy(idLogRec.userId, receivedMsg.owner.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.owner.dateTime,14);
		strncpy(idLogRec.custNo, ownerLogRec.custNo,  7);
		idLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
		strncpy(idLogRec.idRefNo, receivedMsg.owner.ownerNo, 4);
		idLogRec.idCategory = 'W'; /* Owner */
	}
	idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */

	strncpy(idLogRec.custNo, receivedMsg.owner.custNo, 7);
	idLogRec.idType = receivedMsg.owner.idType;
	strncpy(idLogRec.idNo, receivedMsg.owner.idNo, 15);
	strncpy(idLogRec.idIssuedAt,receivedMsg.owner.idIssuedAt,20);
	idLogRec.idDateType = receivedMsg.owner.idDateType;
	if( receivedMsg.owner.idDateType == HIJRI ) 
	{	
		strncpy(idLogRec.idIssueDateH,receivedMsg.owner.idIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.owner.idIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )/* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr,tmpStr1); 
		else
		   strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateH,receivedMsg.owner.idExpiryDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.owner.idExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE ) /* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
	}
	else /* GREGORIAN */
	{
		strncpy(idLogRec.idIssueDateG,receivedMsg.owner.idIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.owner.idIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);

		strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateG,receivedMsg.owner.idExpiryDateG,8);
		sprintf(tmpStr, "%.8s", receivedMsg.owner.idExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
	}
	strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
	idLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(idLogRec.lastUpdateUser, receivedMsg.owner.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( idFoundFlag == YES )
	{
		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOwnerRequest] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s] while updating owner information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating owner id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 ) /* Arul added on 02 Dec as the record is already there and trying to add */
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing owner information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing owner id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s]  and the key is [%.28s] while writing owner information; IGNORED\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);
			}
		}
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode,receivedMsg.owner.homeBranch,4);
	strncpy(addrLogRec.userId, receivedMsg.owner.userId,10);
	strncpy(addrLogRec.dateTime,receivedMsg.owner.dateTime,14);
	strncpy(addrLogRec.addressType, "03", 2);  /* Owner Local address */
	strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
	addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
	addrLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
	strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
	strncpy(addrLogRec.custNo, ownerLogRec.custNo, 7);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, receivedMsg.owner.homeBranch, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.owner.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.owner.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "03", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}

	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,receivedMsg.owner.homeBranch,4);
		strncpy(addrLogRec.userId, receivedMsg.owner.userId,10);
		strncpy(addrLogRec.dateTime,receivedMsg.owner.dateTime,14);
		strncpy(addrLogRec.addressType, "03", 2);  /* Owner Local address */
		strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
		addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		addrLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
		strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
		strncpy(addrLogRec.custNo, ownerLogRec.custNo, 7);
	}

	addrLogRec.addrType = receivedMsg.owner.addressType;
	if ( receivedMsg.owner.addressType == '1' ) /* Saudi Postal address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.owner.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.owner.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.owner.poBox, 5);

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.owner.address1[5] == '-' )
			receivedMsg.owner.address1[5] = ' ';
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.owner.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.owner.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.owner.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.owner.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.owner.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.owner.country, 3);
	if ( strncmp(receivedMsg.owner.telOffNo, "           ", 10) )
		strncpy(addrLogRec.telOffAreaCode,receivedMsg.owner.telOffAreaCode,4);
	strncpy(addrLogRec.telOffNo, receivedMsg.owner.telOffNo, 10);
	strncpy(addrLogRec.telOffExt, receivedMsg.owner.telOffExt, 4);
	if ( strncmp(receivedMsg.owner.telHomeNo, "           ", 10) )
		strncpy(addrLogRec.telHomeAreaCode,receivedMsg.owner.telHomeAreaCode,4);
	strncpy(addrLogRec.telHomeNo, receivedMsg.owner.telHomeNo, 10);
	strncpy(addrLogRec.telHomeExt, receivedMsg.owner.telHomeExt, 4);
	if ( strncmp(receivedMsg.owner.faxNo, "           ", 10) )
		strncpy(addrLogRec.faxAreaCode,receivedMsg.owner.faxAreaCode,4);
	strncpy(addrLogRec.faxNo, receivedMsg.owner.faxNo, 10); 
	strncpy(addrLogRec.faxExt, receivedMsg.owner.faxExt, 4);
	if ( strncmp(receivedMsg.owner.mobileNo, "05         ", 10) )
		strncpy(addrLogRec.mobileNo,receivedMsg.owner.mobileNo,10);
	strncpy(addrLogRec.pagerNo, receivedMsg.owner.pagerNo, 10);
	strncpy(addrLogRec.eMail, receivedMsg.owner.eMail, 30);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	addrLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(addrLogRec.lastUpdateUser, receivedMsg.owner.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOwnerRequest] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			if ( iserrno != 100 && iserrno != 108 )
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s] IGNORED \n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);
			}
		}
	}

	/* Write owner's home country address if available */
	if ( strncmp(receivedMsg.owner.homeAddress1,"                            ", 30) && 
		 strncmp(receivedMsg.owner.homePoBox, "                 ", 10) )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,receivedMsg.owner.homeBranch,4);
		strncpy(addrLogRec.userId, receivedMsg.owner.userId,10);
		strncpy(addrLogRec.dateTime,receivedMsg.owner.dateTime,14);
		strncpy(addrLogRec.addressType, "04", 2);  /* Owner Home country address */
		strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
		addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		addrLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
		strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
		strncpy(addrLogRec.custNo, ownerLogRec.custNo, 7);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		addressFoundFlag = NO;
		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(addrLogRec.branchCode, receivedMsg.owner.homeBranch, 4) ||
				 strncmp(addrLogRec.userId, receivedMsg.owner.userId, 10) ||
				 strncmp(addrLogRec.dateTime, receivedMsg.owner.dateTime, 14) )
				 break;

			if ( strncmp(addrLogRec.addressType, "04", 2) )
				continue;

			if ( strncmp(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4) )
				continue;

			addressFoundFlag = YES;
			break;
		}
		if ( addressFoundFlag == NO )
		{
			memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

			addrLogRec.liveChar = '@';
			strncpy(addrLogRec.branchCode,receivedMsg.owner.homeBranch,4);
			strncpy(addrLogRec.userId, receivedMsg.owner.userId,10);
			strncpy(addrLogRec.dateTime,receivedMsg.owner.dateTime,14);
			strncpy(addrLogRec.addressType, "04", 2);  /* Owner Local address */
			strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
			addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
			addrLogRec.newOrUpdate = receivedMsg.owner.newOrUpdate;
			strncpy(addrLogRec.addressNo, receivedMsg.owner.ownerNo, 4);
			strncpy(addrLogRec.custNo, ownerLogRec.custNo, 7);
		}
		strncpy(addrLogRec.address1, receivedMsg.owner.homeAddress1, 30);
		strncpy(addrLogRec.address2, receivedMsg.owner.homeAddress2, 30);
		strncpy(addrLogRec.poBox, receivedMsg.owner.homePoBox, 10);
		strncpy(addrLogRec.cityName, receivedMsg.owner.homeCityName, 20);
		strncpy(addrLogRec.zipCode, receivedMsg.owner.homeZipCode, 10);
		strncpy(addrLogRec.country, receivedMsg.owner.homeCountry, 3);
		if ( strncmp(receivedMsg.owner.homeTelOffNo, "           ", 10) )
			strncpy(addrLogRec.telOffAreaCode,receivedMsg.owner.homeTelOffAreaCode,4);
		strncpy(addrLogRec.telOffNo, receivedMsg.owner.homeTelOffNo, 10);
		strncpy(addrLogRec.telOffExt, receivedMsg.owner.homeTelOffExt, 4);
		if ( strncmp(receivedMsg.owner.homeTelHomeNo, "           ", 10) )
			strncpy(addrLogRec.telHomeAreaCode,receivedMsg.owner.homeTelHomeAreaCode,4);
		strncpy(addrLogRec.telHomeNo, receivedMsg.owner.homeTelHomeNo, 10);
		strncpy(addrLogRec.telHomeExt, receivedMsg.owner.homeTelHomeExt, 4);
		if ( strncmp(receivedMsg.owner.homeFaxNo, "           ", 10) )
			strncpy(addrLogRec.faxAreaCode,receivedMsg.owner.homeFaxAreaCode,4);
		strncpy(addrLogRec.faxNo, receivedMsg.owner.homeFaxNo, 10); 
		strncpy(addrLogRec.faxExt, receivedMsg.owner.homeFaxExt, 4);
		if ( strncmp(receivedMsg.owner.homeMobileNo, "05         ", 10) )
			strncpy(addrLogRec.mobileNo,receivedMsg.owner.homeMobileNo,10);
		strncpy(addrLogRec.pagerNo, receivedMsg.owner.homePagerNo, 10);
		strncpy(addrLogRec.eMail, receivedMsg.owner.homeEMail, 30);

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		addrLogRec.recordChanged = 'Y'; /* Yes */
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.owner.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( addressFoundFlag == YES )
		{
			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	ownerLogRec.ownerEnabled = receivedMsg.owner.ownerActiveStatus;
	strncpy(ownerLogRec.lastUpdateBmDate, bankingDate, 8);
	ownerLogRec.recordChanged = 'Y'; /* Yes */
	strncpy(ownerLogRec.lastUpdateUser, receivedMsg.owner.userId, 10);

	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(ownerLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( ownerLogFound == YES )
	{
		if ( isRewcurr(ownerLogFile, &ownerLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOwnerRequest] ISREWCURR error %d on stownlog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, ownerLogRec.branchCode, ownerLogRec.custNo, ownerLogRec.ownerNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",ownerLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stownlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stownlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(ownerLogFile, &ownerLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processOwnerRequest] ISWRITE error %d on stownlog for key [%.28s%.7s%.4s]\n", getDateTime(), PID, iserrno, ownerLogRec.branchCode, ownerLogRec.custNo, ownerLogRec.ownerNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",ownerLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stownlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stownlog", iserrno);
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

processHeirLogSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processHeirLogSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.referenceSearch.msgLen, ' ', sizeof responseMsg.referenceSearch);
	responseMsg.referenceSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.referenceSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&heirLogRec.liveChar, ' ', sizeof heirLogRec);
	strncpy(heirLogRec.branchCode, receivedMsg.referenceSearch.branchCode, 4); 
	strncpy(heirLogRec.userId, receivedMsg.referenceSearch.userId, 10);
	strncpy(heirLogRec.dateTime, receivedMsg.referenceSearch.dateTime, 14);
	strncpy(heirLogRec.custNo, receivedMsg.referenceSearch.custNo, 7);
	isindexinfo(heirLogFile, &heirLogKey, 1);
	if ( isstart(heirLogFile, &heirLogKey, 28, &heirLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processHeirLogSearch] ISSTART/ISGTEQ error %d occured on stheirlog for customer # [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, heirLogRec.custNo, heirLogRec.branchCode);
		fflush(logFp);
	}

	while ( isRead(heirLogFile, &heirLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(heirLogRec.branchCode, receivedMsg.referenceSearch.branchCode, 4) ||
			 strncmp(heirLogRec.userId, receivedMsg.referenceSearch.userId, 10) || 
			 strncmp(heirLogRec.dateTime, receivedMsg.referenceSearch.dateTime,14)	)
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custNo, heirLogRec.custNo, 7);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].referenceNo, heirLogRec.heirNo, 4);
		responseMsg.referenceSearch.details[recsInThisMsg].idType =  heirLogRec.idType;
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].idNo, heirLogRec.idNo, 15);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custBranchCode, heirLogRec.custBranchCode, 4);
		if (strncmp(heirLogRec.aShortName,"                                 ",30))
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, heirLogRec.aShortName, 30);
		else 
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, heirLogRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.referenceSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.referenceSearch.noOfRecs, tmpStr, 2);
	responseMsg.referenceSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.referenceSearch.msgLen);
	return SUCCESS;
}

processHeirTabSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processHeirTabSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.referenceSearch.msgLen, ' ', sizeof responseMsg.referenceSearch);
	responseMsg.referenceSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.referenceSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);
	strncpy(heirTabRec.custNo, receivedMsg.referenceSearch.custNo, 7);
	isindexinfo(heirTabFile, &heirTabKey, 1);
	if ( isstart(heirTabFile, &heirTabKey, 7, &heirTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReferenceTabSearch] ISSTART/ISGTEQ error %d occured on stheirtab for customer # [%.7s] \n", getDateTime(), PID, iserrno, cRefTabRec.custNo);
		fflush(logFp);
	}

	while ( isRead(heirTabFile, &heirTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(heirTabRec.custNo, receivedMsg.referenceSearch.custNo, 7) )
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custNo, heirTabRec.custNo, 7);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].referenceNo, heirTabRec.heirNo, 4);
		responseMsg.referenceSearch.details[recsInThisMsg].idType =  heirTabRec.idType;
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].idNo, heirTabRec.idNo, 15);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custBranchCode, heirTabRec.branchCode, 4);
		if (strncmp(heirTabRec.aShortName,"                                 ",30))
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, heirTabRec.aShortName, 30);
		else 
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, heirTabRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.referenceSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.referenceSearch.noOfRecs, tmpStr, 2);
	responseMsg.referenceSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.referenceSearch.msgLen);
	return SUCCESS;
}

processReferenceLogSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processReferenceLogSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.referenceSearch.msgLen, ' ', sizeof responseMsg.referenceSearch);
	responseMsg.referenceSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.referenceSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);
	strncpy(cRefLogRec.branchCode, receivedMsg.referenceSearch.branchCode, 4); 
	strncpy(cRefLogRec.userId, receivedMsg.referenceSearch.userId, 10);
	strncpy(cRefLogRec.dateTime, receivedMsg.referenceSearch.dateTime, 14);
	strncpy(cRefLogRec.custNo, receivedMsg.referenceSearch.custNo, 7);
	isindexinfo(cRefLogFile, &cRefLogKey, 1);
	if ( isstart(cRefLogFile, &cRefLogKey, 28, &cRefLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReferenceLogSearch] ISSTART/ISGTEQ error %d occured on stcreflog for customer # [%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, cRefLogRec.custNo, cRefLogRec.branchCode);
		fflush(logFp);
	}

	while ( isRead(cRefLogFile, &cRefLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cRefLogRec.branchCode, receivedMsg.referenceSearch.branchCode, 4) ||
			 strncmp(cRefLogRec.userId, receivedMsg.referenceSearch.userId, 10) || 
			 strncmp(cRefLogRec.dateTime, receivedMsg.referenceSearch.dateTime,14)	)
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custNo, cRefLogRec.custNo, 7);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].referenceNo, cRefLogRec.referenceNo, 4);
		responseMsg.referenceSearch.details[recsInThisMsg].idType =  cRefLogRec.idType;
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].idNo, cRefLogRec.idNo, 15);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custBranchCode, cRefLogRec.custBranchCode, 4);
		if (strncmp(cRefLogRec.aShortName,"                                 ",30))
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, cRefLogRec.aShortName, 30);
		else 
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, cRefLogRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.referenceSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.referenceSearch.noOfRecs, tmpStr, 2);
	responseMsg.referenceSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.referenceSearch.msgLen);
	return SUCCESS;
}

processReferenceTabSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processReferenceTabSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.referenceSearch.msgLen, ' ', sizeof responseMsg.referenceSearch);
	responseMsg.referenceSearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.referenceSearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);
	strncpy(cRefTabRec.custNo, receivedMsg.referenceSearch.custNo, 7);
	isindexinfo(cRefTabFile, &cRefTabKey, 1);
	if ( isstart(cRefTabFile, &cRefTabKey, 7, &cRefTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processReferenceTabSearch] ISSTART/ISGTEQ error %d occured on stcreftab for customer # [%.7s] \n", getDateTime(), PID, iserrno, cRefTabRec.custNo);
		fflush(logFp);
	}

	while ( isRead(cRefTabFile, &cRefTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(cRefTabRec.custNo, receivedMsg.referenceSearch.custNo, 7) )
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custNo, cRefTabRec.custNo, 7);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].referenceNo, cRefTabRec.referenceNo, 4);
		responseMsg.referenceSearch.details[recsInThisMsg].idType =  cRefTabRec.idType;
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].idNo, cRefTabRec.idNo, 15);
		strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custBranchCode, cRefTabRec.branchCode, 4);
		if (strncmp(cRefTabRec.aShortName,"                                 ",30))
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, cRefTabRec.aShortName, 30);
		else 
			strncpy(responseMsg.referenceSearch.details[recsInThisMsg].custShortName, cRefTabRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.referenceSearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.referenceSearch.noOfRecs, tmpStr, 2);
	responseMsg.referenceSearch.details[recsInThisMsg+1].custNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.referenceSearch.msgLen);
	return SUCCESS;
}

readReferenceLogInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readReferenceLogInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.referenceDetail.msgLen,' ',sizeof responseMsg.referenceDetail);

	memset(&cRefLogRec.liveChar, ' ', sizeof cRefLogRec);
	strncpy(cRefLogRec.branchCode, receivedMsg.signatoryDetail.branchCode,4);
	strncpy(cRefLogRec.userId, receivedMsg.signatoryDetail.userId,10);
	strncpy(cRefLogRec.dateTime, receivedMsg.signatoryDetail.dateTime,14);
	isindexinfo(cRefLogFile,&cRefLogKey,1);

	if ( isstart(cRefLogFile, &cRefLogKey, 28, &cRefLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatReferenceDetailResponse(END_OF_FILE,"No reference Records exists..", "No reference Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
			formatReferenceDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	while( isRead(cRefLogFile, &cRefLogRec.liveChar, ISNEXT) == 0)
	{
		if (strncmp(receivedMsg.signatoryDetail.branchCode, cRefLogRec.branchCode, 4) != 0 || strncmp(receivedMsg.signatoryDetail.userId, cRefLogRec.userId,10) != 0 || strncmp(receivedMsg.signatoryDetail.dateTime, cRefLogRec.dateTime,14) != 0)
			break;

		if ( strncmp(cRefLogRec.referenceNo, receivedMsg.signatoryDetail.signatoryNo, 4)  )
			continue;

		strncpy(responseMsg.referenceDetail.custNo, cRefLogRec.custNo, 14);
		strncpy(responseMsg.referenceDetail.referenceNo, cRefLogRec.referenceNo, 4);
		responseMsg.referenceDetail.newOrUpdate = cRefLogRec.newOrUpdate;
		strncpy(responseMsg.referenceDetail.supervisorId, cRefLogRec.supervisorId, 10);
		strncpy(responseMsg.referenceDetail.custBranchCode, cRefLogRec.custBranchCode, 4);
		responseMsg.referenceDetail.idType = cRefLogRec.idType;
		strncpy(responseMsg.referenceDetail.idNo, cRefLogRec.idNo, 15);
		strncpy(responseMsg.referenceDetail.referenceReqdFor, cRefLogRec.referenceReqdFor, 10);
		responseMsg.referenceDetail.referenceType = cRefLogRec.referenceType;
		strncpy(responseMsg.referenceDetail.aFirstName, cRefLogRec.aFirstName, 180); /* From aFirstName to eShortName */
		responseMsg.referenceDetail.custOpenSource = cRefLogRec.custOpenSource;

		/* Read corresponding Id Log */
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
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		strncpy(responseMsg.referenceDetail.idNo, idLogRec.idNo, 15);
		responseMsg.referenceDetail.idType = idLogRec.idType;
		responseMsg.referenceDetail.idDateType = idLogRec.idDateType;
		strncpy(responseMsg.referenceDetail.idIssuedAt, idLogRec.idIssuedAt, 20); 
		strncpy(responseMsg.referenceDetail.idIssueDateH, idLogRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */


		/* Read corresponding address log */

		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, cRefLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, cRefLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, cRefLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		if ( isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processRefereceLogInfo] ISSTART error %d on staddrlog for key [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.branchCode);
			fflush(logFp);
		}

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if (strncmp(addrLogRec.branchCode, cRefLogRec.branchCode, 4) != 0 || strncmp(addrLogRec.userId, cRefLogRec.userId,10) != 0 || strncmp(addrLogRec.dateTime,cRefLogRec.dateTime,14) != 0)
				break;

			if ( strncmp(addrLogRec.addressType, "02", 2)  )
				continue;

			if ( strncmp(addrLogRec.addressNo, cRefLogRec.referenceNo, 4)  )
				continue;

			if ( extraDebug )
			{
				fprintf(logFp, "Address type [%.2s] [%c] ; [%.200s] \n", addrLogRec.addressType, addrLogRec.addrType, addrLogRec.address1);
				fflush(logFp);
			}
			strncpy(responseMsg.referenceDetail.address1, addrLogRec.address1, 30);
			strncpy(responseMsg.referenceDetail.address2, addrLogRec.address2, 30);
			strncpy(responseMsg.referenceDetail.poBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.referenceDetail.cityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.referenceDetail.zipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.referenceDetail.country, addrLogRec.country, 3);
			responseMsg.referenceDetail.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.referenceDetail.poBox, addrLogRec.unitNo, 5);
			strncpy(responseMsg.referenceDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.referenceDetail.telOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.referenceDetail.telOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.referenceDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.referenceDetail.telHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.referenceDetail.telHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.referenceDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.referenceDetail.faxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.referenceDetail.faxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.referenceDetail.mobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.referenceDetail.pagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.referenceDetail.eMail, addrLogRec.eMail, 30);
		}

    	formatReferenceDetailResponse(DONE,"Successful..","Successful..");
		sendResponse(responseMsg.referenceDetail.msgLen);
		return SUCCESS;
	}
	formatReferenceDetailResponse(END_OF_FILE,"End of File encountered..","End of File encountered..");
	sendResponse(responseMsg.referenceDetail.msgLen);
	return FAILURE;
}

readReferenceTabInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readReferenceTabInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.referenceDetail.msgLen,' ',sizeof responseMsg.referenceDetail);

	memset(&cRefTabRec.liveChar, ' ', sizeof cRefTabRec);
	strncpy(cRefTabRec.custNo, receivedMsg.signatoryDetail.accNo, 7);
	strncpy(cRefTabRec.referenceNo, receivedMsg.signatoryDetail.signatoryNo, 4);
	isindexinfo(cRefTabFile,&cRefTabKey,1);
	if ( isstart(cRefTabFile, &cRefTabKey, 0, &cRefTabRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatReferenceDetailResponse(END_OF_FILE,"No reference Records exists..", "No reference Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcreftab", iserrno);
			formatReferenceDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	if ( isRead(cRefTabFile, &cRefTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readReferenceTabInfo] ISREAD/ISEQUAL error %d occured on stcreftab for the customer no [%.7s] and reference number [%.4s]\n", getDateTime(), PID, iserrno, cRefTabRec.custNo, cRefTabRec.referenceNo);
		fflush(logFp);

		sprintf(tmpStr, "Error %d occured on stcreftab", iserrno);
		formatReferenceDetailResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.referenceDetail.custNo, cRefTabRec.custNo, 7);
	strncpy(responseMsg.referenceDetail.referenceNo, cRefTabRec.referenceNo, 4);
	responseMsg.referenceDetail.idType = cRefTabRec.idType;
	strncpy(responseMsg.referenceDetail.idNo, cRefTabRec.idNo, 15);
	strncpy(responseMsg.referenceDetail.referenceReqdFor, cRefTabRec.referenceReqdFor, 10);
	responseMsg.referenceDetail.referenceType = cRefTabRec.referenceType;
	strncpy(responseMsg.referenceDetail.aFirstName, cRefTabRec.aFirstName, 180); /* From aFirstName to eShortName */
	responseMsg.referenceDetail.custOpenSource = cRefTabRec.custOpenSource;

	/* Read corresponding Id Tab */
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	strncpy(idTabRec.custNo, cRefTabRec.custNo, 7);
	idTabRec.idType = cRefTabRec.idType;
	strncpy(idTabRec.idNo, cRefTabRec.idNo, 15);
	idTabRec.idCategory = 'R'; /* Reference */

	isindexinfo(idTabFile, &idTabKey, 1); /*Arul changed from 5 to 1*/
	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	if ( readIdTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.referenceDetail.idNo, idTabRec.idNo, 15);
	responseMsg.referenceDetail.idType = idTabRec.idType;
	responseMsg.referenceDetail.idDateType = idTabRec.idDateType;
	strncpy(responseMsg.referenceDetail.idIssuedAt, idTabRec.idIssuedAt, 20); 
	strncpy(responseMsg.referenceDetail.idIssueDateH, idTabRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

	/* Read corresponding address Tab */

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

	strncpy(addrTabRec.custNo, cRefTabRec.custNo, 7);
	strncpy(addrTabRec.addressType, "02", 2);
	strncpy(addrTabRec.addressNo, cRefTabRec.referenceNo, 4);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	if ( isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[[readReferenceTabInfo]] ISSTART error %d on staddrTab for key [%.28s]\n", getDateTime(), PID, iserrno ,addrLogRec.branchCode);
		fflush(logFp);
	}

	if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readReferenceTabInfo] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);

		sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	strncpy(responseMsg.referenceDetail.address1, addrTabRec.address1, 30);
	strncpy(responseMsg.referenceDetail.address2, addrTabRec.address2, 30);
	strncpy(responseMsg.referenceDetail.poBox, addrTabRec.poBox, 10);
	strncpy(responseMsg.referenceDetail.cityName, addrTabRec.cityName, 20);
	strncpy(responseMsg.referenceDetail.zipCode, addrTabRec.zipCode, 10);
	strncpy(responseMsg.referenceDetail.country, addrTabRec.country, 3);
	responseMsg.referenceDetail.addrType = addrTabRec.addrType;
	if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
		strncpy(responseMsg.referenceDetail.poBox, addrTabRec.unitNo, 5);
	strncpy(responseMsg.referenceDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
	strncpy(responseMsg.referenceDetail.telOffNo, addrTabRec.telOffNo, 10);
	strncpy(responseMsg.referenceDetail.telOffExt, addrTabRec.telOffExt, 4);
	strncpy(responseMsg.referenceDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
	strncpy(responseMsg.referenceDetail.telHomeNo, addrTabRec.telHomeNo, 10);
	strncpy(responseMsg.referenceDetail.telHomeExt, addrTabRec.telHomeExt, 4);
	strncpy(responseMsg.referenceDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
	strncpy(responseMsg.referenceDetail.faxNo, addrTabRec.faxNo, 10);
	strncpy(responseMsg.referenceDetail.faxExt, addrTabRec.faxExt, 4);
	strncpy(responseMsg.referenceDetail.mobileNo, addrTabRec.mobileNo, 10);
	strncpy(responseMsg.referenceDetail.pagerNo, addrTabRec.pagerNo, 10);
	strncpy(responseMsg.referenceDetail.eMail, addrTabRec.eMail, 30);

	formatReferenceDetailResponse(DONE,"Successful..","Successful..");
	sendResponse(responseMsg.ownerDetail.msgLen);
	return SUCCESS;
}

readHeirLogInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readHeirLogInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.referenceDetail.msgLen,' ',sizeof responseMsg.referenceDetail);

	memset(&heirLogRec.liveChar, ' ', sizeof heirLogRec);
	strncpy(heirLogRec.branchCode, receivedMsg.signatoryDetail.branchCode,4);
	strncpy(heirLogRec.userId, receivedMsg.signatoryDetail.userId, 10);
	strncpy(heirLogRec.dateTime, receivedMsg.signatoryDetail.dateTime, 14);
	isindexinfo(heirLogFile, &heirLogKey, 1);

	if ( isstart(heirLogFile, &heirLogKey, 28, &heirLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatReferenceDetailResponse(END_OF_FILE,"No reference Records exists..", "No reference Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcreflog", iserrno);
			formatReferenceDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	while( isRead(heirLogFile, &heirLogRec.liveChar, ISNEXT) == 0)
	{
		if (strncmp(receivedMsg.signatoryDetail.branchCode, heirLogRec.branchCode, 4) != 0 || strncmp(receivedMsg.signatoryDetail.userId, heirLogRec.userId,10) != 0 || strncmp(receivedMsg.signatoryDetail.dateTime, heirLogRec.dateTime,14) != 0)
			break;

		if ( strncmp(heirLogRec.heirNo, receivedMsg.signatoryDetail.signatoryNo, 4)  )
			continue;

		strncpy(responseMsg.referenceDetail.custNo, heirLogRec.custNo, 14);
		strncpy(responseMsg.referenceDetail.referenceNo, heirLogRec.heirNo, 4);
		responseMsg.referenceDetail.newOrUpdate = heirLogRec.newOrUpdate;
		strncpy(responseMsg.referenceDetail.supervisorId, heirLogRec.supervisorId, 10);
		strncpy(responseMsg.referenceDetail.custBranchCode, heirLogRec.custBranchCode, 4);
		responseMsg.referenceDetail.idType = heirLogRec.idType;
		strncpy(responseMsg.referenceDetail.idNo, heirLogRec.idNo, 15);
		/*strncpy(responseMsg.referenceDetail.referenceReqdFor, heirLogRec.referenceReqdFor, 10);*/
		responseMsg.referenceDetail.referenceType = heirLogRec.heirType;
		strncpy(responseMsg.referenceDetail.aFirstName, heirLogRec.aFirstName, 180); /* From aFirstName to eShortName */
		strncpy(responseMsg.referenceDetail.proxyNo, heirLogRec.proxyNo, 32); /* From proxyNo to proxyIssueDateG */
		responseMsg.referenceDetail.custOpenSource = heirLogRec.custOpenSource;

		/* Read corresponding Id Log */
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, heirLogRec.branchCode, 4);
		strncpy(idLogRec.userId, heirLogRec.userId, 10);
		strncpy(idLogRec.dateTime, heirLogRec.dateTime, 14);
		idLogRec.idType = heirLogRec.idType;
		strncpy(idLogRec.idNo, heirLogRec.idNo, 15);
		idLogRec.idCategory = 'H'; /* Heir */

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

		if ( readIdLogFile(ISEQUAL) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		strncpy(responseMsg.referenceDetail.idNo, idLogRec.idNo, 15);
		responseMsg.referenceDetail.idType = idLogRec.idType;
		responseMsg.referenceDetail.idDateType = idLogRec.idDateType;
		strncpy(responseMsg.referenceDetail.idIssuedAt, idLogRec.idIssuedAt, 20); 
		strncpy(responseMsg.referenceDetail.idIssueDateH, idLogRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */


		/* Read corresponding address log */

		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, heirLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, heirLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, heirLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		if ( isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[readHeirLogInfo] ISSTART error %d on staddrlog for key [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.branchCode);
			fflush(logFp);
		}

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(addrLogRec.branchCode, heirLogRec.branchCode, 4) || strncmp(addrLogRec.userId, heirLogRec.userId,10) || strncmp(addrLogRec.dateTime, heirLogRec.dateTime,14) )
				break;

			if ( strncmp(addrLogRec.addressType, "05", 2)  )
				continue;

			if ( strncmp(addrLogRec.addressNo, heirLogRec.heirNo, 4)  )
				continue;

			if ( extraDebug )
			{
				fprintf(logFp, "Address type [%.2s] [%c] ; [%.200s] \n", addrLogRec.addressType, addrLogRec.addrType, addrLogRec.address1);
				fflush(logFp);
			}
			strncpy(responseMsg.referenceDetail.address1, addrLogRec.address1, 30);
			strncpy(responseMsg.referenceDetail.address2, addrLogRec.address2, 30);
			strncpy(responseMsg.referenceDetail.poBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.referenceDetail.cityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.referenceDetail.zipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.referenceDetail.country, addrLogRec.country, 3);
			responseMsg.referenceDetail.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.referenceDetail.poBox, addrLogRec.unitNo, 5);
			strncpy(responseMsg.referenceDetail.telOffAreaCode, addrLogRec.telOffAreaCode, 4);
			strncpy(responseMsg.referenceDetail.telOffNo, addrLogRec.telOffNo, 10);
			strncpy(responseMsg.referenceDetail.telOffExt, addrLogRec.telOffExt, 4);
			strncpy(responseMsg.referenceDetail.telHomeAreaCode, addrLogRec.telHomeAreaCode, 4);
			strncpy(responseMsg.referenceDetail.telHomeNo, addrLogRec.telHomeNo, 10);
			strncpy(responseMsg.referenceDetail.telHomeExt, addrLogRec.telHomeExt, 4);
			strncpy(responseMsg.referenceDetail.faxAreaCode, addrLogRec.faxAreaCode, 4);
			strncpy(responseMsg.referenceDetail.faxNo, addrLogRec.faxNo, 10);
			strncpy(responseMsg.referenceDetail.faxExt, addrLogRec.faxExt, 4);
			strncpy(responseMsg.referenceDetail.mobileNo, addrLogRec.mobileNo, 10);
			strncpy(responseMsg.referenceDetail.pagerNo, addrLogRec.pagerNo, 10);
			strncpy(responseMsg.referenceDetail.eMail, addrLogRec.eMail, 30);
		}

    	formatReferenceDetailResponse(DONE,"Successful..","Successful..");
		sendResponse(responseMsg.referenceDetail.msgLen);
		return SUCCESS;
	}
	formatReferenceDetailResponse(END_OF_FILE,"End of File encountered..","End of File encountered..");
	sendResponse(responseMsg.referenceDetail.msgLen);
	return FAILURE;
}

readHeirTabInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readHeirTabInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.referenceDetail.msgLen,' ',sizeof responseMsg.referenceDetail);

	memset(&heirTabRec.liveChar, ' ', sizeof heirTabRec);
	strncpy(heirTabRec.custNo, receivedMsg.signatoryDetail.accNo, 7);
	strncpy(heirTabRec.heirNo, receivedMsg.signatoryDetail.signatoryNo, 4);
	isindexinfo(heirTabFile,&heirTabKey,1);
	if ( isstart(heirTabFile, &heirTabKey, 0, &heirTabRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatReferenceDetailResponse(END_OF_FILE,"No heir Records exists..", "No heir Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stheirtab", iserrno);
			formatReferenceDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	if ( isRead(heirTabFile, &heirTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readHeirTabInfo] ISREAD/ISEQUAL error %d occured on stheirtab for the customer no [%.7s] and heir number [%.4s]\n", getDateTime(), PID, iserrno, heirTabRec.custNo, heirTabRec.heirNo);
		fflush(logFp);

		sprintf(tmpStr, "Error %d occured on stheirtab", iserrno);
		formatReferenceDetailResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.referenceDetail.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.referenceDetail.custNo, heirTabRec.custNo, 7);
	strncpy(responseMsg.referenceDetail.referenceNo, heirTabRec.heirNo, 4);
	responseMsg.referenceDetail.idType = heirTabRec.idType;
	strncpy(responseMsg.referenceDetail.idNo, heirTabRec.idNo, 15);
	/*strncpy(responseMsg.referenceDetail.referenceReqdFor, heirTabRec.referenceReqdFor, 10);*/
	responseMsg.referenceDetail.referenceType = heirTabRec.heirType;
	strncpy(responseMsg.referenceDetail.aFirstName, heirTabRec.aFirstName, 180); /* From aFirstName to eShortName */
	strncpy(responseMsg.referenceDetail.proxyNo, heirTabRec.proxyNo, 32); /* From proxyNo to proxyIssueDateG */
	responseMsg.referenceDetail.custOpenSource = heirTabRec.custOpenSource;

	/* Read corresponding Id Tab */
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	strncpy(idTabRec.custNo, heirTabRec.custNo, 7);
	idTabRec.idType = heirTabRec.idType;
	strncpy(idTabRec.idNo, heirTabRec.idNo, 15);
	idTabRec.idCategory = 'H'; /* Reference */

	isindexinfo(idTabFile, &idTabKey, 1); /*Arul changed from 5 to 1*/
	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	if ( readIdTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.referenceDetail.idNo, idTabRec.idNo, 15);
	responseMsg.referenceDetail.idType = idTabRec.idType;
	responseMsg.referenceDetail.idDateType = idTabRec.idDateType;
	strncpy(responseMsg.referenceDetail.idIssuedAt, idTabRec.idIssuedAt, 20); 
	strncpy(responseMsg.referenceDetail.idIssueDateH, idTabRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

	/* Read corresponding address Tab */

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

	strncpy(addrTabRec.custNo, heirTabRec.custNo, 7);
	strncpy(addrTabRec.addressType, "05", 2); /* Address of heirs */
	strncpy(addrTabRec.addressNo, heirTabRec.heirNo, 4);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	if ( isstart(addrTabFile, &addrTabKey, 0, &addrTabRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[[readHeirTabInfo]] ISSTART error %d on staddrTab for key [%.28s]\n", getDateTime(), PID, iserrno ,addrLogRec.branchCode);
		fflush(logFp);
	}

	if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readHeirTabInfo] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);

		sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	strncpy(responseMsg.referenceDetail.address1, addrTabRec.address1, 30);
	strncpy(responseMsg.referenceDetail.address2, addrTabRec.address2, 30);
	strncpy(responseMsg.referenceDetail.poBox, addrTabRec.poBox, 10);
	strncpy(responseMsg.referenceDetail.cityName, addrTabRec.cityName, 20);
	strncpy(responseMsg.referenceDetail.zipCode, addrTabRec.zipCode, 10);
	strncpy(responseMsg.referenceDetail.country, addrTabRec.country, 3);
	responseMsg.referenceDetail.addrType = addrTabRec.addrType;
	if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
		strncpy(responseMsg.referenceDetail.poBox, addrTabRec.unitNo, 5);
	strncpy(responseMsg.referenceDetail.telOffAreaCode, addrTabRec.telOffAreaCode, 4);
	strncpy(responseMsg.referenceDetail.telOffNo, addrTabRec.telOffNo, 10);
	strncpy(responseMsg.referenceDetail.telOffExt, addrTabRec.telOffExt, 4);
	strncpy(responseMsg.referenceDetail.telHomeAreaCode, addrTabRec.telHomeAreaCode, 4);
	strncpy(responseMsg.referenceDetail.telHomeNo, addrTabRec.telHomeNo, 10);
	strncpy(responseMsg.referenceDetail.telHomeExt, addrTabRec.telHomeExt, 4);
	strncpy(responseMsg.referenceDetail.faxAreaCode, addrTabRec.faxAreaCode, 4);
	strncpy(responseMsg.referenceDetail.faxNo, addrTabRec.faxNo, 10);
	strncpy(responseMsg.referenceDetail.faxExt, addrTabRec.faxExt, 4);
	strncpy(responseMsg.referenceDetail.mobileNo, addrTabRec.mobileNo, 10);
	strncpy(responseMsg.referenceDetail.pagerNo, addrTabRec.pagerNo, 10);
	strncpy(responseMsg.referenceDetail.eMail, addrTabRec.eMail, 30);

	formatReferenceDetailResponse(DONE,"Successful..","Successful..");
	sendResponse(responseMsg.ownerDetail.msgLen);
	return SUCCESS;
}

processSignatoryLogSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSignatoryLogSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.signatorySearch.msgLen, ' ', sizeof responseMsg.signatorySearch);
	responseMsg.signatorySearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.signatorySearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&signLogRec.liveChar, ' ', sizeof signLogRec);
	strncpy(signLogRec.branchCode, receivedMsg.signatorySearch.branchCode, 4); 
	strncpy(signLogRec.userId, receivedMsg.signatorySearch.userId, 10);
	strncpy(signLogRec.dateTime, receivedMsg.signatorySearch.dateTime, 14);
	isindexinfo(signLogFile, &signLogKey, 1);
	if ( isstart(signLogFile, &signLogKey, 28, &signLogRec.liveChar, ISGTEQ) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processSignatoryLogSearch] ISSTART/ISGTEQ error %d occured on stsignlog for customer # [%.14s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, signLogRec.accNo, signLogRec.branchCode);
		fflush(logFp);
	}

	while ( isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(signLogRec.branchCode, receivedMsg.signatorySearch.branchCode, 4) ||
			 strncmp(signLogRec.userId, receivedMsg.signatorySearch.userId, 10) || 
			 strncmp(signLogRec.dateTime, receivedMsg.signatorySearch.dateTime,14)	)
			break;

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].accNo, signLogRec.accNo, 14);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryNo, signLogRec.signatoryNo, 4);
		responseMsg.signatorySearch.details[recsInThisMsg].idType =  signLogRec.idType;
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].idNo, signLogRec.idNo, 15);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].custBranchCode, signLogRec.custBranchCode, 4);
		if (strncmp(signLogRec.aShortName,"                                 ",30))
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, signLogRec.aShortName, 30);
		else 
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, signLogRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.signatorySearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.signatorySearch.noOfRecs, tmpStr, 2);
	responseMsg.signatorySearch.details[recsInThisMsg+1].accNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.signatorySearch.msgLen);
	return SUCCESS;
}

processSignatoryTabSearch()
{
	int lastRecRcvd, recCount=0, recsInThisMsg = 0, searchType = 0, i, nameLen;
	char tmpStr[100]; 
	unsigned char tmpChar;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSignatoryTabSearch]\n", getDateTime(), PID);
		fflush(logFp);
	}

	/* format the response message */

	memset(responseMsg.signatorySearch.msgLen, ' ', sizeof responseMsg.signatorySearch);
	responseMsg.signatorySearch.nullPad = '\0';

	sprintf(tmpStr, "%.5s", receivedMsg.signatorySearch.lastRecCount);
	lastRecRcvd = atoi(tmpStr);

	memset(&signTabRec.liveChar, ' ', sizeof signTabRec);

	if ( strncmp(receivedMsg.signatorySearch.requestType, "02", 2) == 0 )
	{
		strncpy(&signTabRec.accNo[5], receivedMsg.signatorySearch.custNo, 7); 
		isindexinfo(signTabFile, &signTabKey, 2);
		if ( isstart(signTabFile, &signTabKey, 7, &signTabRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSignatoryTabSearch] ISSTART/ISGTEQ error %d occured on stsigntab for customer # [%.7s] \n", getDateTime(), PID, iserrno, &signTabRec.accNo[5] );
			fflush(logFp);
		}
	}
	else if ( strncmp(receivedMsg.signatorySearch.requestType, "00", 2) == 0 ) /* if the signatory search request is coming from 
																				  account portion */
	{
		strncpy(signTabRec.accNo, receivedMsg.signatorySearch.dateTime, 14); 
		isindexinfo(signTabFile, &signTabKey, 1);
		if ( isstart(signTabFile, &signTabKey, 14, &signTabRec.liveChar, ISGTEQ) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSignatoryTabSearch] ISSTART/ISGTEQ error %d occured on stsigntab for account # [%.14s] \n", getDateTime(), PID, iserrno, signTabRec.accNo );
			fflush(logFp);
		}
		
	}

	while ( isRead(signTabFile, &signTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(receivedMsg.signatorySearch.requestType, "02", 2) == 0 )
		{
			if ( strncmp(&signTabRec.accNo[5], receivedMsg.signatorySearch.custNo, 7) )
				break;
		}
		else //  request is coming from account portion; datetime will have account number in this case 
		{
			if ( strncmp(signTabRec.accNo, receivedMsg.signatorySearch.dateTime, 14) )
				break;
		}

		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].accNo, signTabRec.accNo, 14);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryNo, signTabRec.signatoryNo, 4);
		responseMsg.signatorySearch.details[recsInThisMsg].idType =  signTabRec.idType;
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].idNo, signTabRec.idNo, 15);
		strncpy(responseMsg.signatorySearch.details[recsInThisMsg].custBranchCode, signTabRec.branchCode, 4);
		if (strncmp(signTabRec.aShortName,"                                 ",30))
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, signTabRec.aShortName, 30);
		else 
			strncpy(responseMsg.signatorySearch.details[recsInThisMsg].signatoryShortName, signTabRec.eShortName, 30);

		if ( ++recsInThisMsg >=  20 )
			break;
	}
	fflush(logFp);
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.signatorySearch.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.signatorySearch.noOfRecs, tmpStr, 2);
	responseMsg.signatorySearch.details[recsInThisMsg+1].accNo[0] = '\0';
	formatSearchResponse(DONE, "Successful", "Successful");
	sendResponse(responseMsg.signatorySearch.msgLen);
	return SUCCESS;
}

readSignLogInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readSignLogInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.signatoryDetail.msgLen,' ',sizeof responseMsg.signatoryDetail);

	memset(&signLogRec.liveChar, ' ', sizeof signLogRec);
	strncpy(signLogRec.branchCode, receivedMsg.signatoryDetail.branchCode,4);
	strncpy(signLogRec.userId, receivedMsg.signatoryDetail.userId,10);
	strncpy(signLogRec.dateTime, receivedMsg.signatoryDetail.dateTime,14);
	isindexinfo(signLogFile,&signLogKey,1);
	if ( isstart(signLogFile, &signLogKey, 28, &signLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatSignatoryDetailResponse(END_OF_FILE,"No signatory Records exists..", "No signatory Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsignlog", iserrno);
			formatSignatoryDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.signatoryDetail.msgLen);
		return FAILURE;
	}

	while( isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0)
	{
		if (strncmp(receivedMsg.signatoryDetail.branchCode, signLogRec.branchCode, 4) != 0 || strncmp(receivedMsg.signatoryDetail.userId, signLogRec.userId,10) != 0 || strncmp(receivedMsg.signatoryDetail.dateTime,signLogRec.dateTime,14) != 0)
			break;

		if ( strncmp(signLogRec.signatoryNo, receivedMsg.signatoryDetail.signatoryNo, 4)  )
			continue;

		strncpy(responseMsg.signatoryDetail.accNo, signLogRec.accNo, 14);
		strncpy(responseMsg.signatoryDetail.signatoryNo, signLogRec.signatoryNo, 4);
		responseMsg.signatoryDetail.newOrUpdate = signLogRec.newOrUpdate;
		strncpy(responseMsg.signatoryDetail.supervisorId, signLogRec.supervisorId, 10);
		strncpy(responseMsg.signatoryDetail.custBranchCode, signLogRec.custBranchCode, 4);
		responseMsg.signatoryDetail.idType = signLogRec.idType;
		strncpy(responseMsg.signatoryDetail.idNo, signLogRec.idNo, 15);

		/* Read corresponding Id Log */
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
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
		strncpy(responseMsg.signatoryDetail.idNo, idLogRec.idNo, 15);
		responseMsg.signatoryDetail.idType = idLogRec.idType;
		responseMsg.signatoryDetail.idDateType = idLogRec.idDateType;
		strncpy(responseMsg.signatoryDetail.idIssuedAt, idLogRec.idIssuedAt, 20); 
		strncpy(responseMsg.signatoryDetail.idIssueDateH, idLogRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

		strncpy(responseMsg.signatoryDetail.aFirstName, signLogRec.aFirstName, 221); /* From aFirstName to disableReason */
		responseMsg.signatoryDetail.signatoryForOthers = signLogRec.signatoryForOthers;

    	formatSignatoryDetailResponse(DONE,"Successful..","Successful..");
		sendResponse(responseMsg.signatoryDetail.msgLen);
		return SUCCESS;
	}
	formatSignatoryDetailResponse(END_OF_FILE,"End of File encountered..","End of File encountered..");
	sendResponse(responseMsg.signatoryDetail.msgLen);
	return FAILURE;
}

readSignTabInfo()
{
	char tmpStr[100], tmpAddressNo[10];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[readSignTabInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}
			
	memset(responseMsg.signatoryDetail.msgLen,' ',sizeof responseMsg.signatoryDetail);

	memset(&signTabRec.liveChar, ' ', sizeof signTabRec);
	strncpy(signTabRec.accNo, receivedMsg.signatoryDetail.accNo,14);
	strncpy(signTabRec.signatoryNo, receivedMsg.signatoryDetail.signatoryNo,4);
	isindexinfo(signTabFile,&signTabKey,1);
	if ( isstart(signTabFile, &signTabKey, 0, &signTabRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatSignatoryDetailResponse(END_OF_FILE,"No signatory Records exists..", "No signatory Records exist..");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stsigntab", iserrno);
			formatSignatoryDetailResponse(INTERNALERR,tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.signatoryDetail.msgLen);
		return FAILURE;
	}

	if( isRead(signTabFile, &signTabRec.liveChar, ISEQUAL) < 0)
	{
		fprintf(logFp, "%s|%5d|[readSignTabInfo] ISREAD/ISEQUAL error %d occured on stsigntab for the account number [%.14s] and the signatory number [%.4s]\n", getDateTime(), PID, iserrno, signTabRec.accNo, signTabRec.signatoryNo);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured on stsigntab", iserrno);
		formatSignatoryDetailResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.signatoryDetail.msgLen);
		return FAILURE;
	}

	strncpy(responseMsg.signatoryDetail.accNo, signTabRec.accNo, 14);
	strncpy(responseMsg.signatoryDetail.signatoryNo, signTabRec.signatoryNo, 4);
	strncpy(responseMsg.signatoryDetail.custBranchCode, signTabRec.branchCode, 4);
	responseMsg.signatoryDetail.idType = signTabRec.idType;
	strncpy(responseMsg.signatoryDetail.idNo, signTabRec.idNo, 15);

	/* Read corresponding Id Tab */
	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	strncpy(idTabRec.custNo, &signTabRec.accNo[5], 7);
	idTabRec.idType = signTabRec.idType;
	strncpy(idTabRec.idNo, signTabRec.idNo, 15);
	idTabRec.idCategory = 'S'; /* Signatory */

	isindexinfo(idTabFile, &idTabKey, 1); /* Arul changed from 5 to 1*/
	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	if ( readIdTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	strncpy(responseMsg.signatoryDetail.idNo, idTabRec.idNo, 15);
	responseMsg.signatoryDetail.idType = idTabRec.idType;
	responseMsg.signatoryDetail.idDateType = idTabRec.idDateType;
	strncpy(responseMsg.signatoryDetail.idIssuedAt, idTabRec.idIssuedAt, 20); 
	strncpy(responseMsg.signatoryDetail.idIssueDateH, idTabRec.idIssueDateH, 32); /* From idIssueDateH to idExpiryDateG */

	strncpy(responseMsg.signatoryDetail.aFirstName, signTabRec.aFirstName, 221); /* From aFirstName to disableReason */

	formatSignatoryDetailResponse(DONE,"Successful..","Successful..");
	sendResponse(responseMsg.signatoryDetail.msgLen);
	return SUCCESS;
}

processChangeScreenLang()
{
	char tmpStr[100], tmpStr1[50], pass1[10], pass2[10];
	char lastPasswords[200];
	char tmpUserId[30];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processChangeScreenLang]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.customer.msgLen, ' ', sizeof responseMsg.customer);
	memset(&userRec.liveChar, ' ', sizeof userRec);
	sprintf(tmpStr, "%.10s", receivedMsg.changeScreenLang.userId);
	sprintf(tmpUserId, "%-20.20s", tmpStr);

	strncpy(userRec.userId, tmpUserId, 20);

	if ( isRead(userFile, &userRec.liveChar, ISEQUAL+ISLOCK) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processChangeScreenLang] ISREAD/ISEQUAL error %d on stuser for key=%.20s\n", getDateTime(), PID, iserrno, userRec.userId);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "UserId [%.20s] does not exist.", userRec.userId);
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatBranchResponse(END_OF_FILE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked");
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		isrelease(userFile);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	userRec.langPreferred = receivedMsg.changeScreenLang.requiredLang;

	sprintf(tmpStr, "%-10.10s", receivedMsg.changeScreenLang.userId);
	strncpy(userRec.lastUpdateUser, tmpStr, 10);
	strncpy(&userRec.lastUpdateUser[10],"                 ", 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(userRec.lastUpdateDateTime, tmpStr, 14);
	if ( isRewcurr(userFile, &userRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processChangeScreenLang] : ISREWCURR error %d on stuser for key=%.20s\n", getDateTime(), PID, iserrno, userRec.userId);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.20s] on stuser", userRec.userId);
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuser", userRec.userId);
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		isrelease(userFile);
		return FAILURE;
	}
	isrelease(userFile);

	memcpy(&userLogRec.liveChar, &userRec.liveChar, sizeof userLogRec);
	userLogRec.newOrUpdate = 'U';

	if ( isWrite(userLogFile, &userLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processChangeScreenLang] ISWRITE error %d on stuserlog for the user %.20s\n", getDateTime(), PID, iserrno, userLogRec.userId);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record while on stuserlog");
			formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuserlog" );
			formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuserlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	formatBranchResponse(DONE, "Successful...", "Successful..");
	sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

formatOwnerDetailResponse( responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatOwnerDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.ownerDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.ownerDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.ownerDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.ownerDetail.service, receivedMsg.signatoryDetail.service, 2);
	responseMsg.ownerDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.ownerDetail.msgLen));
	strncpy(responseMsg.ownerDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatReferenceDetailResponse( responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[stReferenceDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.referenceDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.referenceDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.referenceDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.referenceDetail.service, receivedMsg.signatoryDetail.service, 2);
	responseMsg.referenceDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.referenceDetail.msgLen));
	strncpy(responseMsg.referenceDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatSignatoryDetailResponse( responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatSignatoryDetailResponse] formating the response\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.signatoryDetail.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.signatoryDetail.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.signatoryDetail.eRemarks,tmpStr,50);
	strncpy(responseMsg.signatoryDetail.service, receivedMsg.signatoryDetail.service, 2);
	responseMsg.signatoryDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.signatoryDetail.msgLen));
	strncpy(responseMsg.signatoryDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

processCheckIdInfo()
{
	char tmpStr[100];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processCheckIdInfo]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.idCheck.msgLen, ' ', sizeof responseMsg.idCheck);
	responseMsg.idCheck.nullPad = '\0';

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

	isindexinfo(idTabFile, &idTabKey, 5); /* Arul change from 1 to 5 */

	idTabRec.idType = receivedMsg.idCheck.idType;
	strncpy(idTabRec.idNo, receivedMsg.idCheck.idNo, 15);
	responseMsg.idCheck.idExistFlag = '0';
	responseMsg.idCheck.idType = idTabRec.idType;
	strncpy(responseMsg.idCheck.idNo, idTabRec.idNo, 15);

	isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( idTabRec.idType != receivedMsg.idCheck.idType ||
			 strncmp(idTabRec.idNo, receivedMsg.idCheck.idNo, 15) )
			 break;

		responseMsg.idCheck.idExistFlag = '1';
		responseMsg.idCheck.idDateType = idTabRec.idDateType;
		strncpy(responseMsg.idCheck.idIssuedAt, idTabRec.idIssuedAt, 20);
		strncpy(responseMsg.idCheck.idIssueDateH, idTabRec.idIssueDateH, 8);
		strncpy(responseMsg.idCheck.idIssueDateG, idTabRec.idIssueDateG, 8);
		strncpy(responseMsg.idCheck.idExpiryDateH, idTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.idCheck.idExpiryDateG, idTabRec.idExpiryDateG, 8);
		break;
	}

	formatSearchResponse(DONE, "Successful..", "Successful...");
	sendResponse(responseMsg.idCheck.msgLen);
	return SUCCESS;
}

checkIdExistanceForOtherJuristic(char idType, char *idNo, char *custNo)
{
	char tmpStr[100];

	if ( openCustTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.custNo, custNo, 7);
	isindexinfo(custTabFile, &custTabKey, 1);
	isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);

	if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[checkIdExistanceForOtherJuristic]| ISREAD/ISEQUAL error %d on stcusttab for the customer [%.7s] \n", getDateTime(), PID, iserrno, custNo);
		fflush(logFp);

		if ( iserrno == 111 || iserrno == 110 )
		{
			sprintf(tmpStr, "Customer not found in stcusttab; please check..");
			formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM error %d occured on stcustab; please check..");
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( strncmp(custTabRec.samaMainCategory, "01", 2) == 0 )
		return NO;

	memset(&signTabRec.liveChar, ' ', sizeof signTabRec);
	isindexinfo(signTabFile, &signTabKey, 3);
	signTabRec.idType = idType;
	strncpy(signTabRec.idNo, idNo, 15);

	isstart(signTabFile, &signTabKey, 0, &signTabRec.liveChar, ISGTEQ);

	while ( isRead(signTabFile, &signTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( signTabRec.idType != idType || strncmp(signTabRec.idNo, idNo, 15) )
			break;

		if ( signTabRec.activeStatus != '1' ) /* Consider only active signatory */
			continue;

		if ( strncmp(&signTabRec.accNo[5], custNo, 7) == 0 )  /* If same customer number is scanned */
			continue;

		return YES;
	}

	return NO;
}

processSignatoryRequest()
{
	char tmpStr[100], tmpStr1[100];
	int signatoryLogFound=NO, idFoundFlag=NO, expatSignatoryForOther=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processSignatoryRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(responseMsg.signatory.msgLen, ' ', sizeof responseMsg.signatory);

	memset(&signLogRec.liveChar, ' ', sizeof signLogRec);

	signLogRec.liveChar = '@';
	strncpy(signLogRec.branchCode, receivedMsg.signatory.homeBranch,4);
	strncpy(signLogRec.userId, receivedMsg.signatory.userId,10);
	strncpy(signLogRec.dateTime, receivedMsg.signatory.dateTime,14);
	strncpy(signLogRec.accNo, receivedMsg.signatory.accNo, 14);
	strncpy(signLogRec.signatoryNo, receivedMsg.signatory.signatoryNo, 4);
	isindexinfo(signLogFile, &signLogKey, 1);

	isstart(signLogFile,&signLogKey, 28, &signLogRec.liveChar, ISGTEQ );

	signatoryLogFound=NO;
	while ( isRead(signLogFile, &signLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(signLogRec.branchCode, receivedMsg.signatory.homeBranch, 4) ||
			 strncmp(signLogRec.userId, receivedMsg.signatory.userId, 10) ||
			 strncmp(signLogRec.dateTime, receivedMsg.signatory.dateTime, 14) )
			 break;

		if ( strncmp(signLogRec.signatoryNo, receivedMsg.signatory.signatoryNo, 4) )
			continue;

		signatoryLogFound = YES;
		break;
	}

	if ( signatoryLogFound == NO )
	{
		memset(&signLogRec.liveChar, ' ', sizeof signLogRec);

		signLogRec.liveChar = '@';
		strncpy(signLogRec.branchCode, receivedMsg.signatory.homeBranch,4);
		strncpy(signLogRec.userId, receivedMsg.signatory.userId,10);
		strncpy(signLogRec.dateTime, receivedMsg.signatory.dateTime,14);
		strncpy(signLogRec.accNo, receivedMsg.signatory.accNo, 14);
		strncpy(signLogRec.signatoryNo, receivedMsg.signatory.signatoryNo, 4);
	}

	signLogRec.signatoryForOthers = '0' ;
	signLogRec.overrideOtherExpatSign = '0';
	if ( receivedMsg.signatory.idType  == 'Q' )
	{
		expatSignatoryForOther = checkIdExistanceForOtherJuristic(receivedMsg.signatory.idType, receivedMsg.signatory.idNo, &receivedMsg.signatory.accNo[5]);
		if ( expatSignatoryForOther == YES )
		{
			strncpy(responseMsg.signatory.duplicateAccNo, signTabRec.accNo, 14);
			signLogRec.signatoryForOthers = '1' ;
			signLogRec.overrideOtherExpatSign = '1';
		}
	}
		
	signLogRec.bmUpdateStatus = '1';
	strncpy(signLogRec.supervisorId, receivedMsg.signatory.supervisorId, 10);
	signLogRec.newOrUpdate = receivedMsg.signatory.newOrUpdate;

	strncpy(signLogRec.custBranchCode, receivedMsg.signatory.custBranchCode, 4);
	signLogRec.idType = receivedMsg.signatory.idType;
	strncpy(signLogRec.idNo, receivedMsg.signatory.idNo, 15);
	strncpy(signLogRec.aFirstName, receivedMsg.signatory.aFirstName, 15);
	strncpy(signLogRec.a2ndName, receivedMsg.signatory.a2ndName, 15);
	strncpy(signLogRec.a3rdName, receivedMsg.signatory.a3rdName, 15);
	strncpy(signLogRec.aLastName, receivedMsg.signatory.aLastName,15);
	strncpy(signLogRec.aShortName, receivedMsg.signatory.aShortName,30);
	strncpy(signLogRec.eFirstName,receivedMsg.signatory.eFirstName,15);
	strncpy(signLogRec.e2ndName, receivedMsg.signatory.e2ndName,15);
	strncpy(signLogRec.e3rdName, receivedMsg.signatory.e3rdName,15);
	strncpy(signLogRec.eLastName, receivedMsg.signatory.eLastName,15);
	strncpy(signLogRec.eShortName, receivedMsg.signatory.eShortName,30);
	strncpy(signLogRec.diplomaticPpNo, receivedMsg.signatory.diplomaticPpNo, 15);
	strncpy(signLogRec.reason, receivedMsg.signatory.disableReason, 25);
	signLogRec.activeStatus = receivedMsg.signatory.activeStatus;
	signLogRec.recordChanged = 'Y'; /* Yes */

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	strncpy(idLogRec.branchCode,receivedMsg.signatory.homeBranch,4);
	strncpy(idLogRec.userId, receivedMsg.signatory.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.signatory.dateTime,14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	idFoundFlag = NO;
	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, receivedMsg.signatory.homeBranch, 4) ||
			 strncmp(idLogRec.userId, receivedMsg.signatory.userId, 10) ||
			 strncmp(idLogRec.dateTime, receivedMsg.signatory.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'S' ) /* Signatory */
			continue;

		if ( idLogRec.idType != receivedMsg.signatory.idType || strncmp(idLogRec.idNo, receivedMsg.signatory.idNo, 15) )
			continue;

		/* 
		if ( strncmp(idLogRec.idRefNo, receivedMsg.signatory.signatoryNo, 4) )
			continue;
		*/

		idFoundFlag = YES;
		break;
	}

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d| Id Found flag %d for id type, id no.[%c;%.15s]\n", getDateTime(), PID, idFoundFlag, receivedMsg.signatory.idType, receivedMsg.signatory.idNo);
		fflush(logFp);
	}

	if ( idFoundFlag == NO )
	{
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		idLogRec.liveChar = '@';
		strncpy(idLogRec.branchCode,receivedMsg.signatory.homeBranch,4);
		strncpy(idLogRec.userId, receivedMsg.signatory.userId,10);
		strncpy(idLogRec.dateTime,receivedMsg.signatory.dateTime,14);
		idLogRec.idCategory = 'S';
		strncpy(idLogRec.custNo, &signLogRec.accNo[5],  7);
		idLogRec.newOrUpdate = receivedMsg.signatory.newOrUpdate;
		strncpy(idLogRec.idRefNo, receivedMsg.signatory.signatoryNo, 4);
	}

	idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */

	idLogRec.idType = receivedMsg.signatory.idType;
	strncpy(idLogRec.idNo, receivedMsg.signatory.idNo, 15);
	strncpy(idLogRec.idIssuedAt,receivedMsg.signatory.idIssuedAt,20);
	idLogRec.idDateType = receivedMsg.signatory.idDateType;
	if( receivedMsg.signatory.idDateType == HIJRI ) 
	{	
		strncpy(idLogRec.idIssueDateH,receivedMsg.signatory.idIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.signatory.idIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )/* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr,tmpStr1); 
		else
		   strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateH,receivedMsg.signatory.idExpiryDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.signatory.idExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE ) /* If Failure from reading calendar file, 
													then, convert date using library*/
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
	}
	else /* GREGORIAN */
	{
		strncpy(idLogRec.idIssueDateG,receivedMsg.signatory.idIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.signatory.idIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);

		strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(idLogRec.idExpiryDateG,receivedMsg.signatory.idExpiryDateG,8);
		sprintf(tmpStr, "%.8s", receivedMsg.signatory.idExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
	}
	strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(idLogRec.lastUpdateUser, receivedMsg.signatory.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( idFoundFlag == YES )
	{
		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSignatoryRequest] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s] while updating reference information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating signatory id in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else 
	{
		if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
		{
			 /*Arul added on 02 Dec 03 the condition 100 as it throws 100 from static data - need investigation*/
			if ( iserrno != 100 )
			{
				fprintf(logFp, "%s|%5d|[processSignatoryRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s]  and the key is [%.28s] while writing signatory information\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing signatory id in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processSignatoryRequest] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s] while writing signatory information; IGNORED\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			}
		}
	}

	strncpy(signLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(signLogRec.lastUpdateUser, receivedMsg.signatory.userId, 10);

	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(signLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( signatoryLogFound == YES )
	{
		if ( isRewcurr(signLogFile, &signLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSignatoryRequest] ISREWCURR error %d on stsignlog for key [%.28s%.14s%.4s]\n", getDateTime(), PID, iserrno, signLogRec.branchCode, signLogRec.accNo, signLogRec.signatoryNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",signLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stsignlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stsignlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(signLogFile, &signLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processSignatoryRequest] ISWRITE error %d on stsignlog for key [%.28s%.14s%.4s]\n", getDateTime(), PID, iserrno, signLogRec.branchCode, signLogRec.accNo, signLogRec.signatoryNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.28s]",signLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stsignlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stsignlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	if ( expatSignatoryForOther == YES )
		formatSignatoryResponse(OTHER_EXPAT_SIGN, "Signatory is also a signatory for other companies  ", "Signatory is also a signatory for other companies");
	else
		formatSignatoryResponse(DONE, "Successfully Added...", "Successfully Added...");
	sendResponse(responseMsg.signatory.msgLen);
	return SUCCESS;
}

openHeirLogFile(int mode)
{
	char tmpStr[80];

	if ( heirLogFileOpen == YES )
		return SUCCESS;

	/* Open customer reference log table */
	if ( (heirLogFile  = isopen(heirLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openHeirLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, heirLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stheirlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(heirLogFile, &heirLogKey, 1);
	heirLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stheirlog file (%d) successfully opened...\n", getDateTime(), PID, heirLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openHeirTabFile(int mode)
{
	char tmpStr[80];

	if ( heirTabFileOpen == YES )
		return SUCCESS;

	/* Open customer reference log table */
	if ( (heirTabFile  = isopen(heirTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openHeirTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, heirTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stheirtab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(heirTabFile, &heirTabKey, 1);
	heirTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stheirtab file (%d) successfully opened...\n", getDateTime(), PID, heirTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}


openCrefLogFile(int mode)
{
	char tmpStr[80];

	if ( cRefLogFileOpen == YES )
		return SUCCESS;

	/* Open customer reference log table */
	if ( (cRefLogFile  = isopen(cRefLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openCrefLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, cRefLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stcreflog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(cRefLogFile, &cRefLogKey, 1);
	cRefLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stcreflog file (%d) successfully opened...\n", getDateTime(), PID, cRefLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openSignLogFile(int mode)
{
	char tmpStr[80];

	if ( signLogFileOpen == YES )
		return SUCCESS;

	/* Open Signatory log info table */
	if ( (signLogFile  = isopen(signLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openSignLogFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, signLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stsignlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(signLogFile, &signLogKey, 1);
	signLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stsignlog file (%d) successfully opened...\n", getDateTime(), PID, signLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openSignTabFile(int mode)
{
	char tmpStr[80];

	if ( signTabFileOpen == YES )
		return SUCCESS;

	/* Open Signatory tab info table */
	if ( (signTabFile  = isopen(signTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openSignTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, signTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stsigntab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(signTabFile, &signTabKey, 1);
	signTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stsigntab file (%d) successfully opened...\n", getDateTime(), PID, signTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openOwnerLogFile(int mode)
{
	char tmpStr[80];

	if ( ownerLogFileOpen == YES )
		return SUCCESS;

	/* Open Owner log info table */
	if ( (ownerLogFile  = isopen(ownerLogFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d| ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, ownerLogFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stownlog.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(ownerLogFile, &ownerLogKey, 1);
	ownerLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stownlog file (%d) successfully opened...\n", getDateTime(), PID, ownerLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openOwnerTabFile(int mode)
{
	char tmpStr[80];

	if ( ownerTabFileOpen == YES )
		return SUCCESS;

	/* Open Owner tab info table */
	if ( (ownerTabFile = isopen(ownerTabFilePath, mode )) < 0)
	{
		fprintf(logFp, "%s|%5d|[openOwnerTabFile] ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, ownerTabFilePath);
		sprintf(tmpStr,"Error  %d occured while opening stowntab.dat", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(ownerTabFile, &ownerTabKey, 1);
	ownerTabFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stowntab file (%d) successfully opened...\n", getDateTime(), PID, ownerTabFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

formatSignatoryResponse(responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatSignatoryResponse]\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.signatory.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.signatory.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.signatory.eRemarks,tmpStr,50);
	strncpy(responseMsg.signatory.service, receivedMsg.signatory.service, 2);
	responseMsg.signatory.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.signatory.msgLen));
	strncpy(responseMsg.signatory.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

formatCheckCategoryResponse( responseCode, aRemarks, eRemarks)
char  *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatCheckCategoryResponse]\n", getDateTime(), PID);
		fflush(logFp);
	}
	strncpy(responseMsg.checkCategory.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.checkCategory.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.checkCategory.eRemarks,tmpStr,50);
	strncpy(responseMsg.checkCategory.service, receivedMsg.checkCategory.service, 2);
	responseMsg.checkCategory.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.checkCategory.msgLen));
	strncpy(responseMsg.checkCategory.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

logCheckCategoryDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Check category combination]\n", receivedMsg.checkCategory.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.checkCategory.homeBranch);
	fprintf(logFp, "SAMA main category	: %.2s\n", receivedMsg.checkCategory.samaMainCategory);
	fprintf(logFp, "SAMA sub category	: %.2s\n", receivedMsg.checkCategory.samaSubCategory);
	fflush(logFp);
}

logReferenceDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Reference details add/update request]\n", receivedMsg.reference.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.reference.homeBranch);
	fprintf(logFp, "User Id 			: %.10s\n", receivedMsg.reference.userId);
	fprintf(logFp, "Date & Time			: %.14s\n", receivedMsg.reference.dateTime);
	fprintf(logFp, "Customer number 	: %.7s\n", receivedMsg.reference.custNo);
	fprintf(logFp, "Reference Number 	: %.4s\n", receivedMsg.reference.refNo);
	fprintf(logFp, "Supervisor Id 		: %.10s\n", receivedMsg.reference.supervisorId);
	fprintf(logFp, "Customer Branch Code: %.4s\n", receivedMsg.reference.custBranchCode);
	fprintf(logFp, "New Or Update 		: %c\n", receivedMsg.reference.newOrUpdate);
	fflush(logFp);
}

logHeirDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Heir details add/update request]\n", receivedMsg.heir.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.heir.homeBranch);
	fprintf(logFp, "User Id 			: %.10s\n", receivedMsg.heir.userId);
	fprintf(logFp, "Date & Time			: %.14s\n", receivedMsg.heir.dateTime);
	fprintf(logFp, "Customer number 	: %.7s\n", receivedMsg.heir.custNo);
	fprintf(logFp, "Reference Number 	: %.4s\n", receivedMsg.heir.heirNo);
	fprintf(logFp, "Supervisor Id 		: %.10s\n", receivedMsg.heir.supervisorId);
	fprintf(logFp, "Customer Branch Code: %.4s\n", receivedMsg.heir.custBranchCode);
	fprintf(logFp, "New Or Update 		: %c\n", receivedMsg.heir.newOrUpdate);
	fflush(logFp);
}

logJointInfoSearchDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Joint Info Search request]\n", receivedMsg.jointInfoSearch.service );
	fprintf(logFp, "Request Type	: %.2s\n", receivedMsg.jointInfoSearch.requestType);

	fprintf(logFp, "Branch Code 	: %.4s\n", receivedMsg.jointInfoSearch.branchCode);
	fprintf(logFp, "userId			: %.10s\n", receivedMsg.jointInfoSearch.userId);
	fprintf(logFp, "dateTime		: %.14s\n", receivedMsg.jointInfoSearch.dateTime);
	fprintf(logFp, "Customer No		: %.7s\n", receivedMsg.jointInfoSearch.custNo);
	fprintf(logFp, "Joint cust No 	: %.2s\n", receivedMsg.jointInfoSearch.jointCustNo);
	fprintf(logFp, "Last Record Read: %.5s\n", receivedMsg.jointInfoSearch.lastRecCount);

	fflush(logFp);

}

logReferenceInfoSearchDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Reference Info Search request]\n", receivedMsg.referenceSearch.service );
	fprintf(logFp, "Request Type	: %.2s\n", receivedMsg.referenceSearch.requestType);

	fprintf(logFp, "Branch Code 	: %.4s\n", receivedMsg.referenceSearch.branchCode);
	fprintf(logFp, "userId			: %.10s\n", receivedMsg.referenceSearch.userId);
	fprintf(logFp, "dateTime		: %.14s\n", receivedMsg.referenceSearch.dateTime);
	fprintf(logFp, "Customer No		: %.7s\n", receivedMsg.referenceSearch.custNo);
	fprintf(logFp, "Reference No 	: %.4s\n", receivedMsg.referenceSearch.referenceNo);
	fprintf(logFp, "Last Record Read: %.5s\n", receivedMsg.referenceSearch.lastRecCount);

	fflush(logFp);
}

logSignatorySearchDetails(char *searchType)
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[%s]\n", receivedMsg.signatorySearch.service, searchType);
	fprintf(logFp, "Request Type	: %.2s\n", receivedMsg.signatorySearch.requestType);

	fprintf(logFp, "Branch Code 	: %.4s\n", receivedMsg.signatorySearch.branchCode);
	fprintf(logFp, "userId			: %.10s\n", receivedMsg.signatorySearch.userId);
	fprintf(logFp, "dateTime		: %.14s\n", receivedMsg.signatorySearch.dateTime);
	fprintf(logFp, "Customer No		: %.7s\n", receivedMsg.signatorySearch.custNo);
	fprintf(logFp, "Signatory/Owner/Reference No : %.4s\n", receivedMsg.signatorySearch.signatoryNo);
	fprintf(logFp, "Last Record Read: %.5s\n", receivedMsg.signatorySearch.lastRecCount);

	fflush(logFp);
}

logIdCheckDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Id existance check request]\n", receivedMsg.idCheck.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.idCheck.homeBranch);
	fprintf(logFp, "Id Type 			: %c\n", receivedMsg.idCheck.idType);
	fprintf(logFp, "Id Number 			: %.15s\n", receivedMsg.idCheck.idNo);
	fflush(logFp);
}

logSignatoryDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Signatory details add/update request]\n", receivedMsg.signatory.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.signatory.homeBranch);
	fprintf(logFp, "User Id 			: %.10s\n", receivedMsg.signatory.userId);
	fprintf(logFp, "Date & Time			: %.14s\n", receivedMsg.signatory.dateTime);
	fprintf(logFp, "Account number 		: %.14s\n", receivedMsg.signatory.accNo);
	fprintf(logFp, "Signatory Number 	: %.4s\n", receivedMsg.signatory.signatoryNo);
	fprintf(logFp, "Supervisor Id 		: %.10s\n", receivedMsg.signatory.supervisorId);
	fprintf(logFp, "Customer Branch Code: %.4s\n", receivedMsg.signatory.custBranchCode);
	fprintf(logFp, "New Or Update 		: %c\n", receivedMsg.signatory.newOrUpdate);
	fflush(logFp);
}

logSignatoryInfoReqDetails(char *details)
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[%s]\n", receivedMsg.signatoryDetail.service, details);
	fprintf(logFp, "Request Type	: %.2s\n", receivedMsg.signatoryDetail.requestType);

	fprintf(logFp, "Branch Code 	: %.4s\n", receivedMsg.signatoryDetail.branchCode);
	fprintf(logFp, "userId			: %.10s\n", receivedMsg.signatoryDetail.userId);
	fprintf(logFp, "dateTime		: %.14s\n", receivedMsg.signatoryDetail.dateTime);
	fprintf(logFp, "Account/Customer No		: %.14s\n", receivedMsg.signatoryDetail.accNo);
	fprintf(logFp, "Signatory/Owner/Reference No : %.4s\n", receivedMsg.signatoryDetail.signatoryNo);

	fflush(logFp);
}

logOwnerDetails()
{
	if ( debug == 0  )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service				: %.2s[Owner details add/update request]\n", receivedMsg.reference.service);
	fprintf(logFp, "Branch Code     	: %.4s\n", receivedMsg.owner.homeBranch);
	fprintf(logFp, "User Id 			: %.10s\n", receivedMsg.owner.userId);
	fprintf(logFp, "Date & Time			: %.14s\n", receivedMsg.owner.dateTime);
	fprintf(logFp, "Customer number 	: %.7s\n", receivedMsg.owner.custNo);
	fprintf(logFp, "Owner Number 		: %.4s\n", receivedMsg.owner.ownerNo);
	fprintf(logFp, "Supervisor Id 		: %.10s\n", receivedMsg.owner.supervisorId);
	fprintf(logFp, "Customer Branch Code: %.4s\n", receivedMsg.owner.custBranchCode);
	fprintf(logFp, "New Or Update 		: %c\n", receivedMsg.owner.newOrUpdate);
	fflush(logFp);
}

logChangeScreenLangDetails()
{
	if ( debug == 0 )
		return SUCCESS;

	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service 		: %.2s[Change Screen Language Request]\n", receivedMsg.changeScreenLang.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.changeScreenLang.homeBranch);
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.changeScreenLang.userId);
	fprintf(logFp, "Language to be changed 	: %c\n", receivedMsg.changeScreenLang.requiredLang);
	fflush(logFp);
}
