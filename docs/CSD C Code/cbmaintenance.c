/*
	Objective       :       Static data maintenance server (Control file maintenance)

	Date            :       12/06/00.

	Author          :       A. Arul Selvam.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
--------------------------------------------------------------------------
1.1     Mohit       28/11/2006      Changes done under Pension account opening through
									Static Data screen and flag setting at branch level
									to allow the brancheess to do so.
																	
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

#define YES               1
#define NO                0

#define LOGIN         	"00"
#define PASSWD_CHANGE 	"01"
#define MAINTENANCE  	"50"

#define BM_REJECTED     '2'
#define ST_REJECTED     '1'
#define ACCEPTED        '0'

extern struct keydesc  ctlKey, ankKey;
struct dictinfo fileInfo;
extern int   ctlFile, ankFile;
extern int debug, extraDebug, ahaerr;
extern char progName[30];
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *ankFilePath;

extern  int page, line;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];

struct branchInfo	ctlRec;
struct ank0data		ankRec;

extern FILE *logFp;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;
extern int PID;

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
extern int debug, extraDebug, loginAuthorised, maintenanceFileOpen, userFileOpen, staticFileOpen, commonFileOpen, ankFileOpen;

int stMaintenance(headerBuf)
char *headerBuf;
{ 
	int c, msgLen;
	char tmpStr[60];

	systime = time(NULL);                  /* get the system time */
	systemDate = localtime( &systime );

	sprintf(tmpStr, "%.6s", headerBuf);
	msgLen = atoi(tmpStr);

	if ( extraDebug )
		fprintf(logFp, "Authorised user in maintenance : %s\n", authorisedUser);

	/* receive the main details */

	memset(receivedMsg.maintenance.msgLen, NULL, sizeof receivedMsg.maintenance);
	memset(responseMsg.maintenance.msgLen,  ' ', sizeof responseMsg.maintenance);
	strncpy(receivedMsg.maintenance.msgLen, headerBuf, 12);
	if ( getMessage(receivedMsg.maintenance.keyValue, msgLen - 12) < 0 )
	{
		formatResponse(receivedMsg.maintenance.keyValue, COMMSERR, '0', "Communication Error");
		sendResponse(responseMsg.maintenance.msgLen);
		return COMMSFAILURE;
	}
	if ( loginAuthorised == NO )
	{
		formatResponse(receivedMsg.maintenance.keyValue, NOT_LOGIN, ST_REJECTED, "Not yet logged in");
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	if ( openMaintenanceFiles()  < 0 )
		return FAILURE;
	if ( extraDebug )
		logMaintenanceDetails();
	if ( processMaintenanceRequest(toupper(receivedMsg.maintenance.action))  == FAILURE )
		return FAILURE;

	formatResponse(ctlRec.recType, DONE, ACCEPTED, "Successful");
	sendResponse(responseMsg.maintenance.msgLen);
	return SUCCESS;
}

formatResponse(recType, responseCode, bmStatus, remarks)
char *recType, *responseCode, bmStatus, *remarks;
{
	char tmpStr[120];
	if ( extraDebug )
		fprintf(logFp, "Formating the response\n");
	strncpy(responseMsg.maintenance.status, responseCode, 3);
	responseMsg.maintenance.bmStatus = bmStatus;
	sprintf(tmpStr, "%-50.50s", remarks);
	strncpy(responseMsg.maintenance.remarks, tmpStr, 50);
	strncpy(responseMsg.maintenance.service, receivedMsg.maintenance.service, 2);
	responseMsg.maintenance.action = receivedMsg.maintenance.action;
	strncpy(responseMsg.maintenance.keyValue, recType, 6);
	responseMsg.maintenance.nullPad = '\0';
	sprintf(tmpStr, "%06d",  strlen(responseMsg.maintenance.msgLen));
	strncpy(responseMsg.maintenance.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

processMaintenanceRequest( requiredAction )
char requiredAction;
{
	char tmpStr[100], keyValue[20];
	int i, mode, msgLength=0;

	sprintf(tmpStr, "%.6s", receivedMsg.maintenance.msgLen);
	msgLength=atoi(tmpStr);

	for ( i=0; i < msgLength; i++)
	{
		if ( receivedMsg.maintenance.msgLen[i] == NULL )
		{
			fprintf(logFp, "%s|%5d|Found a NULL in the incoming message which is replace by spaces... rec type [%.2s] \n", getDateTime(), PID, receivedMsg.maintenance.keyValue);
			fflush(logFp);
			receivedMsg.maintenance.msgLen[i] = ' ';
		}
	}

	switch ( requiredAction )
	{
		case 'E':
			if ( readCtlFile(ISEQUAL, receivedMsg.maintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastUserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			break;

		case 'N' :
			if ( readCtlFile(ISEQUAL, receivedMsg.maintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			if ( readCtlFile(ISNEXT, receivedMsg.maintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(ctlRec.recType, receivedMsg.maintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			else /* next record type received */
			{
				sprintf(tmpStr, "End of file reached         ");
				formatResponse(receivedMsg.maintenance.keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'P' :
			if ( readCtlFile(ISEQUAL, receivedMsg.maintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			if ( readCtlFile(ISPREV, receivedMsg.maintenance.keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(ctlRec.recType, receivedMsg.maintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			else
			{
				sprintf(tmpStr, "Begining of file reached    ");
				formatResponse(receivedMsg.maintenance.keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'F' :
			sprintf(keyValue, "%.2s     ",receivedMsg.maintenance.keyValue);
			if ( readCtlFile(ISGTEQ, keyValue) < 0 )
			{
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			if ( strncmp(ctlRec.recType, receivedMsg.maintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			else
			{
				sprintf(tmpStr, "No such record type [%.2s] found ", keyValue);
				formatResponse(receivedMsg.maintenance.keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'L' :
			sprintf(keyValue, "%.2s____",receivedMsg.maintenance.keyValue);
			if ( readCtlFile(ISGTEQ, keyValue) < 0 )
			{
				if ( iserrno == 111 || iserrno == 112 )
				{
					if ( readCtlFile(ISLAST, keyValue) < 0 )
					{
						sendResponse(responseMsg.maintenance.msgLen);
						return FAILURE;
					}
				}
			}
			else
			{
				if ( readCtlFile(ISPREV, keyValue) < 0 )
				{
					sendResponse(responseMsg.maintenance.msgLen);
					return FAILURE;
				}
			}
			if ( strncmp(ctlRec.recType, receivedMsg.maintenance.keyValue, 2) == 0 )
				strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			else
			{
				sprintf(tmpStr, "End of file reached    ");
				formatResponse(receivedMsg.maintenance.keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
				sendResponse(responseMsg.maintenance.msgLen);
				return FAILURE;
			}
			break;

		case 'A' :
			if ( addCtlFile(receivedMsg.maintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			break;
		
		case 'D' :
			if ( deleteCtlFile(receivedMsg.maintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			break;

		case 'U' :
			if ( updateCtlFile(receivedMsg.maintenance.keyValue) < 0 )
				return FAILURE;
			strncpy(responseMsg.maintenance.arabicName, ctlRec.arabicName, 215); /* 255-20(lastuserUpdate)-14(lastUpdateDateTime)-6(keyvalue) */
			break;

		default :
			fprintf(logFp, "Invalid action code[%c] encounterd; Expecting E,N,P,F,L,A,U\n", requiredAction);
			fflush(logFp);
			sprintf(tmpStr, "Invalid action [%c] encounted", requiredAction);
			formatResponse(receivedMsg.maintenance.keyValue, INCORRECTMSG, ST_REJECTED, tmpStr);
			sendResponse(responseMsg.maintenance.msgLen);
			return FAILURE;
	}
	return SUCCESS;
}

addCtlFile(keyValue)
char keyValue[10];
{
	char tmpStr[300];
	memset(&ctlRec.liveChar, ' ', sizeof ctlRec);
	ctlRec.liveChar = '@';
	strncpy(ctlRec.recType, keyValue, 6);
	strncpy(ctlRec.arabicName, receivedMsg.maintenance.arabicName, 30);
	strncpy(ctlRec.englishName, receivedMsg.maintenance.englishName, 30);
	sprintf(tmpStr, "%-180.180s", receivedMsg.maintenance.otherDetails);
	strncpy(ctlRec.arabicAddress, tmpStr, 180);
	if ( strncmp(ctlRec.recType, "BD",2) == 0 )
	{
		ctlRec.realOrPseudoBranch = receivedMsg.maintenance.realOrPseudoBranch;
		strncpy(ctlRec.mainBranchCode, receivedMsg.maintenance.mainBranchCode, 4);
		ctlRec.cardPrdnAtBranch = receivedMsg.maintenance.cardPrdnAtBranch;
		ctlRec.pinSelectAtBranch = receivedMsg.maintenance.pinSelectAtBranch;
		ctlRec.cardRequestFromBranch = receivedMsg.maintenance.cardRequestFromBranch;
		ctlRec.pinPrintFromBranch = receivedMsg.maintenance.pinPrintFromBranch;
		ctlRec.updateRestricted = receivedMsg.maintenance.updateRestricted;
		ctlRec.mainBrEditAllowed = receivedMsg.maintenance.mainBrEditAllowed;
		ctlRec.tpinSelectAtBranch = receivedMsg.maintenance.tpinSelectAtBranch;
		ctlRec.tpinMandatoryAtBranch = receivedMsg.maintenance.tpinMandatoryFlag;
		ctlRec.dormantActivationFlag = receivedMsg.maintenance.dormantActivationFlag;
		ctlRec.nameSearchAllowed = receivedMsg.maintenance.nameSearchAllowed;
		ctlRec.stdOrdReqAllowed = receivedMsg.maintenance.stdOrdReqAllowed;
		ctlRec.custNameUpdAllowed = receivedMsg.maintenance.custNameUpdAllowed;
		ctlRec.addrUnificationFlag = receivedMsg.maintenance.addrUnificationFlag;
		ctlRec.balEnqRestrictedFlag = receivedMsg.maintenance.balEnqRestrictedFlag;
		ctlRec.displayWarningFlag = receivedMsg.maintenance.displayWarningFlag;
		ctlRec.enableChipCard = receivedMsg.maintenance.enableChipCard;
		ctlRec.newPensCardFlag = receivedMsg.maintenance.newPensCardFlag;
		ctlRec.mailCentreBranch = receivedMsg.maintenance.mailCentreBranch;
		ctlRec.mandateBranch = receivedMsg.maintenance.mandateBranch;
		ctlRec.callCentreBranch = receivedMsg.maintenance.callCentreBranch;
		ctlRec.internalCustOpenAllowed = receivedMsg.maintenance.internalCustOpenAllowed;
		ctlRec.regionCode = receivedMsg.maintenance.regionCode;
		ctlRec.branchCategory = receivedMsg.maintenance.branchCategory;
		ctlRec.islamiBranch = receivedMsg.maintenance.islamiBranch;
		ctlRec.enableLocalChipCard = receivedMsg.maintenance.enableLocalChipCardFlag;
		ctlRec.generalCustOpenAllowed = receivedMsg.maintenance.generalCustOpenAllowed;
		ctlRec.pensionCustOpenAllowed = receivedMsg.maintenance.pensionCustOpenAllowed; /* Ver 1.1 */
		ctlRec.feeExclusionUpdAllowed = receivedMsg.maintenance.feeExclusionUpdAllowed;
		ctlRec.generalSamaUpdAllowed = receivedMsg.maintenance.generalSamaUpdAllowed;
		ctlRec.swiftCentreBranchFlag = receivedMsg.maintenance.swiftCentreBranchFlag;
		ctlRec.swiftTransferCentralized = receivedMsg.maintenance.swiftTransferCentralized;
		ctlRec.payrollBranch = (receivedMsg.maintenance.payrollBranch==NULL?' ':receivedMsg.maintenance.payrollBranch);

		if ( strncmp(receivedMsg.maintenance.accFreezingPeriod, "    ", 3) &&
			 receivedMsg.maintenance.accFreezingPeriod[0] != NULL )
			 strncpy(ctlRec.accFreezingPeriod, receivedMsg.maintenance.accFreezingPeriod, 3);

		ctlRec.accOpenCardPrintAllowed = (receivedMsg.maintenance.accOpenCardPrintAllowed==NULL?' ':receivedMsg.maintenance.accOpenCardPrintAllowed);

		if ( openAnkFile(ISINOUT+ISMANULOCK) == FAILURE )
		{
			sprintf(tmpStr, "Error %d occured while opening ank0data in ISINOUT/ISMANULOCK mode", iserrno);
			writeToExceptionReport(receivedMsg.maintenance.homeBranch, "AddCtlFile", tmpStr);
		}
		else
		{
			/* Read the branch in ank0data and Update the region code & other information */
			updateAnkFile(ctlRec.branchCode); 
			isclose(ankFile);
			ankFileOpen=NO;
		}
	}
	sprintf(tmpStr, "%-20.20s", authorisedUser);
	strncpy(ctlRec.lastUpdateUser, tmpStr, 20);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(ctlRec.lastUpdateDateTime, tmpStr, 14);
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to maintenance file (stctltab [%d])...\n", getDateTime(), PID, ctlFile);
		fflush(logFp);
	}
	if ( isWrite(ctlFile, &ctlRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[addCtlFile]: ISWRITE error %d on stctltab for key=%.6s\n", getDateTime(), PID, iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.6s]", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatResponse(receivedMsg.maintenance.keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

deleteCtlFile(keyValue)
char keyValue[10];
{
	char tmpStr[100];
	if ( readCtlFile(ISEQUAL, keyValue) < 0 )
	{
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	if ( isDelcurr(ctlFile, &ctlRec.liveChar) < 0 )
	{
		fprintf(logFp,"%s|%5d|[deleteCtlFile]: ISDELCURR error %d on stctltab for key=%.6s\n",getDateTime(), PID, iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 )
		{
			sprintf(tmpStr, "Record not found for [%.6s]", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, NOT_FOUND, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatResponse(receivedMsg.maintenance.keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

updateCtlFile(keyValue)
char keyValue[10];
{
	char tmpStr[100];
	char tmpLastRefreshDateTime[20];
	if ( readCtlFile(ISEQUAL+ISLOCK, keyValue) < 0 )
	{
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	if ( strncmp(ctlRec.recType, "BD",2) == 0)
		strncpy(tmpLastRefreshDateTime, ctlRec.lastRefreshDateTime, 14);
	strncpy(ctlRec.arabicName, receivedMsg.maintenance.arabicName, 30);
	strncpy(ctlRec.englishName, receivedMsg.maintenance.englishName, 30);
	strncpy(ctlRec.arabicAddress, receivedMsg.maintenance.otherDetails, 180);
	if ( strncmp(ctlRec.recType, "BD",2) == 0 )
	{
		ctlRec.realOrPseudoBranch = receivedMsg.maintenance.realOrPseudoBranch;
		strncpy(ctlRec.mainBranchCode, receivedMsg.maintenance.mainBranchCode, 4);
		ctlRec.cardPrdnAtBranch = receivedMsg.maintenance.cardPrdnAtBranch;
		ctlRec.pinSelectAtBranch = receivedMsg.maintenance.pinSelectAtBranch;
		ctlRec.cardRequestFromBranch = receivedMsg.maintenance.cardRequestFromBranch;
		ctlRec.pinPrintFromBranch = receivedMsg.maintenance.pinPrintFromBranch;
		ctlRec.updateRestricted = receivedMsg.maintenance.updateRestricted;
		ctlRec.mainBrEditAllowed = receivedMsg.maintenance.mainBrEditAllowed;
		ctlRec.tpinSelectAtBranch = receivedMsg.maintenance.tpinSelectAtBranch;
		ctlRec.tpinMandatoryAtBranch = receivedMsg.maintenance.tpinMandatoryFlag;
		ctlRec.dormantActivationFlag = receivedMsg.maintenance.dormantActivationFlag;
		ctlRec.nameSearchAllowed = receivedMsg.maintenance.nameSearchAllowed;
		ctlRec.stdOrdReqAllowed = receivedMsg.maintenance.stdOrdReqAllowed;
		ctlRec.custNameUpdAllowed = receivedMsg.maintenance.custNameUpdAllowed;
		ctlRec.addrUnificationFlag = receivedMsg.maintenance.addrUnificationFlag;
		ctlRec.balEnqRestrictedFlag = receivedMsg.maintenance.balEnqRestrictedFlag;
		ctlRec.displayWarningFlag = receivedMsg.maintenance.displayWarningFlag;
		ctlRec.enableChipCard = receivedMsg.maintenance.enableChipCard;
		ctlRec.newPensCardFlag = receivedMsg.maintenance.newPensCardFlag;
		ctlRec.mailCentreBranch = receivedMsg.maintenance.mailCentreBranch;
		ctlRec.mandateBranch = receivedMsg.maintenance.mandateBranch;
		ctlRec.callCentreBranch = receivedMsg.maintenance.callCentreBranch;
		ctlRec.internalCustOpenAllowed = receivedMsg.maintenance.internalCustOpenAllowed;
		ctlRec.regionCode = receivedMsg.maintenance.regionCode;
		ctlRec.branchCategory = receivedMsg.maintenance.branchCategory;
		ctlRec.islamiBranch = receivedMsg.maintenance.islamiBranch;
		ctlRec.enableLocalChipCard = receivedMsg.maintenance.enableLocalChipCardFlag;
		ctlRec.generalCustOpenAllowed = receivedMsg.maintenance.generalCustOpenAllowed;
		ctlRec.pensionCustOpenAllowed = receivedMsg.maintenance.pensionCustOpenAllowed; /* Ver 1.1 */
		ctlRec.feeExclusionUpdAllowed = receivedMsg.maintenance.feeExclusionUpdAllowed;
		ctlRec.generalSamaUpdAllowed = receivedMsg.maintenance.generalSamaUpdAllowed;
		ctlRec.swiftCentreBranchFlag = receivedMsg.maintenance.swiftCentreBranchFlag;
		ctlRec.swiftTransferCentralized = receivedMsg.maintenance.swiftTransferCentralized;
		ctlRec.payrollBranch = (receivedMsg.maintenance.payrollBranch==NULL?' ':receivedMsg.maintenance.payrollBranch);
		if ( strncmp(receivedMsg.maintenance.accFreezingPeriod, "    ", 3) &&
			 receivedMsg.maintenance.accFreezingPeriod[0] != NULL )
			 strncpy(ctlRec.accFreezingPeriod, receivedMsg.maintenance.accFreezingPeriod, 3);
		ctlRec.accOpenCardPrintAllowed = (receivedMsg.maintenance.accOpenCardPrintAllowed==NULL?' ':receivedMsg.maintenance.accOpenCardPrintAllowed);
		strncpy(ctlRec.lastRefreshDateTime, tmpLastRefreshDateTime, 14);

		if ( openAnkFile(ISINOUT+ISMANULOCK) == FAILURE )
		{
			sprintf(tmpStr, "Error %d occured while opening ank0data in ISINOUT/ISMANULOCK mode", iserrno);
			writeToExceptionReport(receivedMsg.maintenance.homeBranch, "updateCtlFile", tmpStr);
		}
		else
		{
			/* Read the branch in ank0data and Update the region code & other information */
			updateAnkFile(ctlRec.branchCode); 
			isclose(ankFile);
			ankFileOpen=NO;
		}
	}
	sprintf(tmpStr, "%-20.20s", authorisedUser);
	strncpy(ctlRec.lastUpdateUser, tmpStr, 20);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(ctlRec.lastUpdateDateTime, tmpStr, 14);
	if ( isRewcurr(ctlFile, &ctlRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[updateCtlFile]: ISREWCURR error %d on stctltab for key=%.6s\n",getDateTime(), PID,iserrno,keyValue);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.6s]", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stctltab", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stctltab", iserrno);
			formatResponse(receivedMsg.maintenance.keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.maintenance.msgLen);
		isrelease(ctlFile);
		return FAILURE;
	}
	isrelease(ctlFile);
	return SUCCESS;
}

updateAnkFile(char *branchCode) 
{
	char tmpStr[100];

	memset(&ankRec.liveChar, ' ', sizeof ankRec);
	strncpy(ankRec.recType, "BR", 2);
	strncpy(ankRec.branchCode, branchCode, 4);
	if ( isRead(ankFile, &ankRec.liveChar, ISEQUAL+ISLOCK) != 0 )
	{
		fprintf(logFp, "%s|%5d| [updateAnkFile] :ISREAD/ISEQUAL error %d on ankFile for %.6s\n", getDateTime(), PID, iserrno, ankRec.recType);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured while reading ank0data for the key [BR%.4s]", iserrno, branchCode);
		writeToExceptionReport(receivedMsg.maintenance.homeBranch, "UpdateAnkFile", tmpStr);
		return FAILURE;
	}

	ankRec.regionCode = receivedMsg.maintenance.regionCode;
	ankRec.branchCategory = receivedMsg.maintenance.branchCategory;
	ankRec.islamiBranch = receivedMsg.maintenance.islamiBranch;

	if ( isRewcurr(ankFile, &ankRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d| [updateAnkFile] :ISREWCURR error %d on ankFile for %.6s\n", getDateTime(), PID, iserrno, ankRec.recType);
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured while updating ank0data for the key [BR%.4s]", iserrno, branchCode);
		writeToExceptionReport(receivedMsg.maintenance.homeBranch, "UpdateAnkFile", tmpStr);
		isrelease(ankFile);
		return FAILURE;
	}
	isrelease(ankFile);

	return SUCCESS;
}

readCtlFile(mode, keyValue)
int mode;
char keyValue[10];
{
	char tmpStr[50];
	memset(&ctlRec.liveChar, ' ', sizeof ctlRec);
	strncpy(ctlRec.recType, keyValue, 6);
	if ( isRead(ctlFile, &ctlRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readCtlFile]: ISREAD/%s error %d on stctltab for key=%.6s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Key value [%.6s] not exists.", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, NOT_FOUND, ST_REJECTED, tmpStr);
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatResponse(receivedMsg.maintenance.keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stctltab", keyValue);
			formatResponse(receivedMsg.maintenance.keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stctltab", iserrno);
			formatResponse(receivedMsg.maintenance.keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}
	fflush(logFp);
	return SUCCESS;
}

openAnkFile(int mode)
{
	char tmpStr[100], *pathName;

	if ( ankFileOpen == YES )
		return SUCCESS;

	/* Open ANK0DATA table */
	if ( (ankFile  = isopen(ankFilePath, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openAnkFile]: ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, ankFilePath);
		fflush(logFp);
		sprintf(tmpStr, "Error  %d occured while opening ank0data", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	isindexinfo(ankFile, &ankKey, 1);
	ankFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| ank0data file (ank0data) file (%d) successfully opened...\n", getDateTime(), PID, ankFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openMaintenanceFiles()
{
	char tmpStr[100];

	if ( maintenanceFileOpen == YES )
		return SUCCESS;

	/* Open static control table */
	if ( (ctlFile  = isopen(ctlFilePath, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "%s|%5d|[openMaintenanceFiles]: ISOPEN error %d for %s File\n", getDateTime(), PID, iserrno, ctlFilePath);
		sprintf(tmpStr, "Error %d occured while opening stctltab.dat File", iserrno );
		formatResponse(receivedMsg.maintenance.keyValue, INTERNALERR, ST_REJECTED, tmpStr );
		sendResponse(responseMsg.maintenance.msgLen);
		return FAILURE;
	}
	isindexinfo(ctlFile, &ctlKey, 1);
	maintenanceFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| maintenance file (stctltab) file (%d) successfully opened...\n", getDateTime(), PID, ctlFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

logMaintenanceDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s|%5d| : INCOMMING MESSAGE from %s\n", getDateTime(), PID, authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Maintenance]\n", receivedMsg.maintenance.service);
	fprintf(logFp, "Record Type     : %.6s\n", receivedMsg.maintenance.keyValue);
	fprintf(logFp, "Action          : %c\n", receivedMsg.maintenance.action);
	fprintf(logFp, "Arabic Name     : %.30s\n", receivedMsg.maintenance.arabicName);
	fprintf(logFp, "English Name    : %.30s\n", receivedMsg.maintenance.englishName);
	fprintf(logFp, "Other details  	: %.100s\n", receivedMsg.maintenance.otherDetails);
	fflush(logFp);
}
