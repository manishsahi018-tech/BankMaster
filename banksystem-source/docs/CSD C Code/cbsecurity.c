/*
	Objective       :       Static data maintenance server

	Date            :       12/06/00.

	Author          :       A. Arul Selvam.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
--------------------------------------------------------------------------
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

extern struct keydesc  userKey,userLogKey, secLogKey, usrBrnKey, brKey;
struct dictinfo fileInfo;
extern int   userFile,userLogFile, secLogFile, usrBrnFile, brFile;
extern int debug, extraDebug, ahaerr;
extern char progName[30];
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *usrBrnFilePath;

extern  int page, line;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];

struct userProfile		userRec;
struct userProfileLog	userLogRec;
struct securityLog		secLogRec; 
struct stusrbrn			usrBrnRec;
struct brcode			brRec;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, userLogFileOpen, staticFileOpen, commonFileOpen, secLogFileOpen, usrBrnFileOpen, brFileOpen;

int stSecurity(headerBuf)
char *headerBuf;
{ 
	int c, msgLen;
	char tmpStr[60];

	systime = time(NULL);                  /* get the system time */
	systemDate = localtime( &systime );

	sprintf(tmpStr, "%.6s", headerBuf);
	msgLen = atoi(tmpStr);

	/* receive the main details */

	memset(receivedMsg.security.msgLen, NULL, sizeof receivedMsg.security);
	memset(responseMsg.security.msgLen,  ' ', sizeof responseMsg.security);
	strncpy(receivedMsg.security.msgLen, headerBuf, 12);
	if ( getMessage(receivedMsg.security.keyValue, msgLen - 12) < 0 )
	{
		formatSecurityResponse(&receivedMsg.security.keyValue[2], COMMSERR, '0', "Communication Error");
		sendResponse(responseMsg.security.msgLen);
		return COMMSFAILURE;
	}
	/* security functions */
	if ( loginAuthorised == NO )
	{
		formatSecurityResponse(&receivedMsg.security.keyValue[2], NOT_LOGIN, ST_REJECTED, "Not yet logged in");
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}

	if ( openSecurityFile(ISINOUT+ISMANULOCK)  < 0 )
	{
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}

	if ( openSecLogFile(ISINOUT+ISMANULOCK) < 0 )
	{
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}

	if ( strncmp(&headerBuf[6], "90", 2) == 0 ) 
	{
		if ( openUserLogFile() < 0 )
			return FAILURE;

		if ( openUsrBrnFile() < 0 )
		{
			sendResponse(responseMsg.security.msgLen);
			return FAILURE;
		}
		logSecurityDetails();
		if ( processSecurityRequest(toupper(receivedMsg.security.action) )  == FAILURE )
			return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "91", 2) == 0 ) 
	{
		logUserListDetails();
		if ( processUserList() == FAILURE )
			return FAILURE;
	}

	return SUCCESS;
}

formatSecurityResponse(recType, responseCode, bmStatus, remarks)
char *recType, *responseCode, bmStatus, *remarks;
{
	char tmpStr[120], userid[22]; 
	strcpy(userid,"UR");
	if ( extraDebug )
	     fprintf(logFp, "Formating the response\n");
	strncpy(responseMsg.security.status, responseCode, 3);
	responseMsg.security.bmStatus = bmStatus;
	sprintf(tmpStr, "%-50.50s", remarks);
	strncpy(responseMsg.security.remarks, tmpStr, 50);
	strncpy(responseMsg.security.service, receivedMsg.security.service, 2);
	responseMsg.security.action = receivedMsg.security.action;
	strncat(userid, recType,20);
	strncpy(recType,userid,22);
	strncpy(responseMsg.security.keyValue, recType, 22);
	responseMsg.security.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.security.msgLen));
	strncpy(responseMsg.security.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
} 

formatUserListResponse(responseCode,remarks)
char *responseCode, *remarks;
{
	char tmpStr[100];

	if ( extraDebug )
	     fprintf(logFp, "Formating the response\n");

	strncpy(responseMsg.userList.status, responseCode,3);
	strncpy(responseMsg.userList.service, receivedMsg.userList.service,2);
	sprintf(tmpStr, "%-55.55s", remarks);
	strncpy(responseMsg.userList.remarks, tmpStr, 50);
	responseMsg.userList.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.userList.msgLen));
	strncpy(responseMsg.userList.msgLen, tmpStr, 6);

	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

processUserList()
{
	char tmpStr[100];
	int lastRecRcvd, recCount=0, recsInThisMsg = 0,  i ;


	if ( extraDebug )
	{
		fprintf(logFp,"processUserList() entered...\n");
		fprintf(logFp,"branch Code in received Msg : %.4s\n",receivedMsg.userList.branchCode);
		fflush(logFp);
	}
	memset(responseMsg.userList.msgLen, ' ', sizeof responseMsg.userList);

	sprintf(tmpStr, "%.5s", receivedMsg.userList.lastRecRead);
	lastRecRcvd = atoi(tmpStr);
	
	strncpy( userRec.branchCode, receivedMsg.userList.branchCode,4 );

	isindexinfo(userFile,&userKey,2);

	if ( isstart(userFile,&userKey, 0, &userRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatUserListResponse(END_OF_FILE,"No User Record(s) exists....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser.dat", iserrno);
			formatUserListResponse(INTERNALERR, tmpStr);
		}
		sendResponse(responseMsg.userList.msgLen);
		return FAILURE;
	 }

	if ( extraDebug )
	{
		fprintf(logFp, "isstart action on stuser SUCCESS..\n");
		fflush(logFp);
	}
	while ( isRead(userFile, &userRec.liveChar, ISNEXT) == 0 )
	{
		if ( recCount++ < lastRecRcvd )
			continue; /* read all records already sent */

		if ( strncmp(receivedMsg.userList.branchCode, "        ",4) )
		{
			fprintf(logFp, "Break condition entered..\n");
			if ( strncmp(receivedMsg.userList.branchCode, userRec.branchCode,4) )
				break;
		}

		strncpy(responseMsg.userList.details[recsInThisMsg].userId, userRec.userId, 10);
		sprintf(tmpStr,"%.15s%.15s",userRec.firstName, userRec.lastName);
		strncpy(responseMsg.userList.details[recsInThisMsg].userName, tmpStr, 30);
		responseMsg.userList.details[recsInThisMsg].liveStatus =  userRec.liveStatus;
		strncpy(responseMsg.userList.details[recsInThisMsg].branchCode, userRec.branchCode, 4);
		responseMsg.userList.details[recsInThisMsg].langPref =  userRec.langPreferred;
		responseMsg.userList.details[recsInThisMsg].globalUpdatePriv =  userRec.globalUpdatePriv;
		strncpy(responseMsg.userList.details[recsInThisMsg].authorityLevel, userRec.authorityLevel, 20);
		if ( ++recsInThisMsg >=  20 )
			break;
	}
	sprintf(tmpStr, "%05d", lastRecRcvd+recsInThisMsg);
	strncpy(responseMsg.userList.lastRecCount, tmpStr, 5);
	sprintf(tmpStr, "%02d", recsInThisMsg);
	strncpy(responseMsg.userList.noOfRecs, tmpStr, 2);
	formatUserListResponse(DONE, "Successful" );
	fflush(logFp);
	sendResponse(responseMsg.userList.msgLen);
	return SUCCESS;
}

processSecurityRequest( requiredAction )
char requiredAction;
{
	char tmpStr[100], keyValue[20], recdUserId[25];
	int i, mode,err;

	isindexinfo(userFile, &userKey, 1);
	memset(userRec.userId, ' ', 20);

	if ( isstart(userFile,&userKey, 0, &userRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			formatSecurityResponse(&receivedMsg.security.keyValue[2], END_OF_FILE, ST_REJECTED, tmpStr);
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser.dat", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	 }

	if ( extraDebug )
	{
		fprintf(logFp, "action  : %c\n", requiredAction);
		fprintf(logFp, "KeyValue : %.20s\n", &receivedMsg.security.keyValue[2]);
	}

	switch ( requiredAction )
	{
		case 'E':
			if ( readUserFile(ISEQUAL, &receivedMsg.security.keyValue[2]) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'N' :
			if ( readUserFile(ISEQUAL, &receivedMsg.security.keyValue[2]) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			if ( readUserFile(ISNEXT, &receivedMsg.security.keyValue[2]) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'P' :
			if ( readUserFile(ISEQUAL, &receivedMsg.security.keyValue[2]) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			if ( readUserFile(ISPREV, &receivedMsg.security.keyValue[2]) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'F' :
			sprintf(keyValue, "%.20s     ", &receivedMsg.security.keyValue[2]);
			if ( readUserFile(ISGTEQ, keyValue) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'L' :
			sprintf(keyValue, "%.20s", &receivedMsg.security.keyValue[2]);
			if ( readUserFile(ISLAST, keyValue) < 0 )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'A' :
			if ( addUserFile(&receivedMsg.security.keyValue[2] ) < 0 )
				return FAILURE;
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;
		
		case 'D' :
			if ( deleteUserFile(&receivedMsg.security.keyValue[2]) < 0 )
				return FAILURE;
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		case 'U' :
			if ( updateUserFile(&receivedMsg.security.keyValue[2]) < 0 )
				return FAILURE;
			strncpy(responseMsg.security.lastPasswdChangeDate, userRec.lastChangeDate, 133); 
			strncpy(responseMsg.security.lastUpdateUser, userRec.lastUpdateUser, 10);
			strncpy(responseMsg.security.lastUpdateDate, userRec.lastUpdateDateTime, 8);
			strncpy(responseMsg.security.authorityLevel2, userRec.authorityLevel2, 60);
			strncpy(responseMsg.security.bpUserId, userRec.bpUserId, 3);
			break;

		default :
			fprintf(logFp, "%s|%5d| Invalid action code[%c] encounterd; Expecting E,N,P,F,L,A,U\n", getDateTime(), PID, requiredAction);
			fflush(logFp);
			sprintf(tmpStr, "Invalid action [%c] encounted", requiredAction);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INCORRECTMSG, ST_REJECTED, tmpStr);
			sendResponse(responseMsg.security.msgLen);
			return FAILURE;
	}
	getEnqAllowedBranches(userRec.userId);

	formatSecurityResponse(userRec.userId, DONE, ACCEPTED, "Successful");
	sendResponse(responseMsg.security.msgLen);
	return SUCCESS;
}

getEnqAllowedBranches(char *userId)
{
	int noOfBrn=0;
	char tmpStr[100];

	if ( extraDebug > 2 )
	{
		fprintf(logFp, "%s|%5d| Inside getEnqAllowedBranches() for the user [%.10s] \n", getDateTime(), PID, userId);
		fflush(logFp);
	}

	memset(&usrBrnRec.liveChar, ' ', sizeof usrBrnRec);
	strncpy(usrBrnRec.userId, userId, 10);

	if ( isRead(usrBrnFile, &usrBrnRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[getEnqAllowedBranches] ISREAD/ISEQUAL error %d on stusrbrn for the user [%.10s] IGNORED \n", getDateTime(), PID, iserrno, userId);
		fflush(logFp);
		responseMsg.security.enqAllowedBrn[0][0] = '\0';
		return FAILURE;
	}

	strncpy(responseMsg.security.enqAllowedBrn, usrBrnRec.allowedBranch, 2000);
	sprintf(tmpStr, "%.3s", usrBrnRec.noOfBranchesDefined);
	responseMsg.security.enqAllowedBrn[atoi(tmpStr)][0] = '\0';
	return SUCCESS;
}

addUserFile(keyValue)
char *keyValue;
{
	char tmpStr[300], tmpStr1[50],pass1[20],pass2[20];
	int err;

	memset(&userRec.liveChar, ' ', sizeof userRec);
	userRec.liveChar = '@';
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	strncpy(userRec.userId, keyValue, 10);
	sprintf(tmpStr,"%-20.20s", userRec.userId);

	sprintf(pass1, "%.8s", tmpStr);
	sprintf(pass2, "%.8s", &tmpStr[8]);
	trim(pass1);
	trim(pass2);
	sprintf(tmpStr, "%-10.10s", crypt(pass1,"AR")+2);
	sprintf(tmpStr1, "%s%-10.10s", tmpStr, crypt(pass2, "AR")+2);
	strncpy(userRec.password,tmpStr1,20);
	sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	strncpy(userRec.lastChangeDate,tmpStr,8);

	userRec.liveStatus = receivedMsg.security.liveStatus;
	strncpy(userRec.branchCode,receivedMsg.security.branchCode,4);
	strncpy(userRec.firstName, receivedMsg.security.name, 60);
	strncpy(userRec.authorityLevel,receivedMsg.security.authorityLevel,20);
	userRec.loginStatus = receivedMsg.security.loginStatus;
	userRec.langPreferred = receivedMsg.security.langPref;
	userRec.globalUpdatePriv = receivedMsg.security.updatePriv;
	if ( receivedMsg.security.authorityLevel2[0] != NULL )
		strncpy(userRec.authorityLevel2, receivedMsg.security.authorityLevel2, 60);
	if ( receivedMsg.security.bpUserId[0] != NULL )
	{
		strncpy(userRec.bpUserId, receivedMsg.security.bpUserId, 3);
		if ( strncmp(receivedMsg.security.bpUserId, "       ", 3) )
		{
			/*
			if ( validateBpUserId(receivedMsg.security.bpUserId) == FAILURE )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			*/
		}
	}
	strncpy(userRec.lastUpdateUser, authorisedUser, 10);
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(userRec.lastUpdateDateTime, tmpStr, 14);
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to stuser file (%d)... \n", getDateTime(), PID, userFile);
		fflush(logFp);
	}
	if ( isWrite(userFile, &userRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISWRITE error %d on stuser for key=%.20s\n", getDateTime(), iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record [%.20s]", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuser");
			formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}

	if ( strncmp(receivedMsg.security.noOfBrn, "      ", 3) && strncmp(receivedMsg.security.noOfBrn, "000", 3) )
	{
		/* Now, Add a record into stusrbrn for enquiry allowed branch */

		memset(&usrBrnRec.liveChar, ' ', sizeof usrBrnRec);
		usrBrnRec.liveChar = '@';
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
		strncpy(usrBrnRec.userId, userRec.userId, 10);
		sprintf(tmpStr, "%.3s", receivedMsg.security.noOfBrn);
		strncpy(usrBrnRec.allowedBranch, receivedMsg.security.enqAllowedBrn, atoi(tmpStr)*4); /* noOfBranches * 4 */
		strncpy(usrBrnRec.noOfBranchesDefined, receivedMsg.security.noOfBrn, 3);

		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d| Before writing to stusrbrn file (%d)... \n", getDateTime(), PID, usrBrnFile);
			fflush(logFp);
		}
		if ( isWrite(usrBrnFile, &usrBrnRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d| ISWRITE error %d on stusrbrn for the user [%.10s] \n", getDateTime(), PID, iserrno, usrBrnRec.userId );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record on stusrbrn", keyValue);
				formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stusrbrn", keyValue);
				formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stusrbrn", iserrno);
				formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
			}
			sendResponse(responseMsg.security.msgLen);
			return FAILURE;
		}
	}

	writeSecurityLog('7', userRec.userId, authorisedUser, userRec.branchCode); /* 7 is for "user added" */

	memcpy(&userLogRec.liveChar, &userRec.liveChar, sizeof userLogRec);
	userLogRec.newOrUpdate = 'N';
	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to stuserlog file (%d)... \n", getDateTime(), PID, userLogFile);
		fflush(logFp);
	}
	if ( isWrite(userLogFile, &userLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISWRITE error %d on stuserlog \n", getDateTime(), iserrno );
		fflush(logFp);
		if  ( iserrno == 100 || iserrno == 108 )
		{
			sprintf(tmpStr, "Duplicate record on stuserlog", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuserlog", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuserlog", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}

	return SUCCESS;
}

deleteUserFile(keyValue)
char *keyValue;
{
	char tmpStr[100];
	if ( readUserFile(ISEQUAL, keyValue) < 0 )
	{
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}
	if ( isDelcurr(userFile, &userRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISDELCURR error %d on stuser for key=%.20s\n", getDateTime(), iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 )
		{
			sprintf(tmpStr, "Record not found for [%.20s]", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], NOT_FOUND, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser.dat", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}
	return SUCCESS;
}

updateUserFile(keyValue)
char *keyValue;
{
	char tmpStr[100], tmpStr1[50], pass1[20], pass2[20];
	if ( readUserFile(ISEQUAL+ISLOCK, keyValue) < 0 )
	{
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}
	strncpy(userRec.userId, keyValue, 20);
	if ( receivedMsg.security.liveStatus == '0' )
	{
		sprintf(tmpStr,"%-20.20s", userRec.userId);
		sprintf(pass1, "%.8s", tmpStr);
		sprintf(pass2, "%.8s", &tmpStr[8]);
		trim(pass1);
		trim(pass2);
		sprintf(tmpStr, "%-10.10s", crypt(pass1,"AR")+2);
		sprintf(tmpStr1, "%s%-10.10s", tmpStr, crypt(pass2, "AR")+2);
		strncpy(userRec.password,tmpStr1,20);
	}
    userRec.liveStatus = receivedMsg.security.liveStatus;
	strncpy(userRec.branchCode,receivedMsg.security.branchCode,4);
	strncpy(userRec.firstName, receivedMsg.security.name, 60);
	strncpy(userRec.authorityLevel,receivedMsg.security.authorityLevel,20);
	userRec.loginStatus = receivedMsg.security.loginStatus;
	userRec.langPreferred = receivedMsg.security.langPref;
	userRec.globalUpdatePriv = receivedMsg.security.updatePriv;
	if ( receivedMsg.security.authorityLevel2[0] != NULL  )
		strncpy(userRec.authorityLevel2, receivedMsg.security.authorityLevel2, 60);
	if ( receivedMsg.security.bpUserId[0] != NULL )
	{
		strncpy(userRec.bpUserId, receivedMsg.security.bpUserId, 3);
		if ( strncmp(receivedMsg.security.bpUserId, "       ", 3) )
		{
			/*
			if ( validateBpUserId(receivedMsg.security.bpUserId) == FAILURE )
			{
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			*/
		}
	}
	strncpy(userRec.lastUpdateUser, authorisedUser, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(userRec.lastUpdateDateTime, tmpStr, 14);
	if ( isRewcurr(userFile, &userRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISREWCURR error %d on stuser for key=%.20s\n", getDateTime(), iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.20s]", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		isrelease(userFile);
		return FAILURE;
	}
	isrelease(userFile);
	/* write a record in security log file */
	if ( receivedMsg.security.liveStatus == '0' ) /* password reset */
		writeSecurityLog('5', userRec.userId, authorisedUser, userRec.branchCode);
	else if ( receivedMsg.security.liveStatus == '2' ) /* User deactivation */
		writeSecurityLog('8', userRec.userId, authorisedUser, userRec.branchCode);
	else if ( receivedMsg.security.liveStatus == '3' ) /* User Closed  */
		writeSecurityLog('6', userRec.userId, authorisedUser, userRec.branchCode);

	memcpy(&userLogRec.liveChar, &userRec.liveChar, sizeof userLogRec);
	userLogRec.newOrUpdate = 'U';

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to stuserlog file (%d)... \n", getDateTime(), PID, userLogFile);
		fflush(logFp);
	}
	if ( isWrite(userLogFile, &userLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s|%5d|[updateUserFile] ISWRITE error %d on stuserlog for the user [%.20s]\n", getDateTime(), PID, iserrno, userLogRec.userId);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record while updating stuserlog", keyValue);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuserlog" );
			formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuserlog", iserrno);
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		}
		sendResponse(responseMsg.security.msgLen);
		isrelease(userLogFile);
		return FAILURE;
	}

	if ( strncmp(receivedMsg.security.enqAllowedBrn, "                  ", 10) )
	{
		/* Read stusrbrn file for the enquiry allowed branch */
		if ( readUserBrnFile(ISEQUAL+ISLOCK, keyValue) < 0 )
		{
			/* Error while reading stusrbrn; Add a record into stusrbrn file */	

			memset(&usrBrnRec.liveChar, ' ', sizeof usrBrnRec);
			strncpy(usrBrnRec.userId, keyValue, 10);
			usrBrnRec.liveChar = '@';
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
			strncpy(usrBrnRec.userId, userRec.userId, 10);
			sprintf(tmpStr, "%.3s", receivedMsg.security.noOfBrn);
			strncpy(usrBrnRec.allowedBranch, receivedMsg.security.enqAllowedBrn, atoi(tmpStr)*4); /* noOfBranches * 4 */
			strncpy(usrBrnRec.noOfBranchesDefined, receivedMsg.security.noOfBrn, 3);

			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d| Before writing to stusrbrn file (%d)... \n", getDateTime(), PID, usrBrnFile);
				fflush(logFp);
			}
			if ( isWrite(usrBrnFile, &usrBrnRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateUserFile] ISWRITE error %d on stusrbrn for the user [%.10s] \n", getDateTime(), PID, iserrno, usrBrnRec.userId );
				fflush(logFp);
				if  ( iserrno == 100 || iserrno == 108 )
				{
					sprintf(tmpStr, "Duplicate record on stusrbrn", keyValue);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stusrbrn", keyValue);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stusrbrn", iserrno);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
				}
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
		}
		else
		{
			sprintf(tmpStr, "%.3s", receivedMsg.security.noOfBrn);
			memset(usrBrnRec.allowedBranch, ' ', sizeof usrBrnRec.allowedBranch);
			strncpy(usrBrnRec.allowedBranch, receivedMsg.security.enqAllowedBrn, atoi(tmpStr)*4); /* noOfBranches * 4 */
			strncpy(usrBrnRec.noOfBranchesDefined, receivedMsg.security.noOfBrn, 3);

			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d| Before updating to stusrbrn file (%d)... \n", getDateTime(), PID, usrBrnFile);
				fflush(logFp);
			}
			if ( isRewcurr(usrBrnFile, &usrBrnRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateUserFile] ISREWCURR error %d on stusrbrn for the user [%.10s] \n", getDateTime(), PID, iserrno, usrBrnRec.userId );
				fflush(logFp);
				if  ( iserrno == 100 || iserrno == 108 )
				{
					sprintf(tmpStr, "Duplicate record on stusrbrn", keyValue);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], DUPLICATE, ST_REJECTED, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on stusrbrn", keyValue);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], RECORD_LOCKED, ST_REJECTED, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on stusrbrn", iserrno);
					formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
				}
				isrelease(usrBrnFile);
				sendResponse(responseMsg.security.msgLen);
				return FAILURE;
			}
			isrelease(usrBrnFile);
		}
	}
	return SUCCESS;
}

readUserFile(mode, keyValue)
int mode;
char *keyValue;
{
	char tmpStr[100];
	fprintf(logFp, "%s|%5d| readUserFile() for key value %.20s\n", getDateTime(), PID, keyValue);
	memset(&userRec.liveChar, ' ', sizeof userRec);
	strncpy(userRec.userId, keyValue, 20);
	if ( isRead(userFile, &userRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readUserFile]: ISREAD/%s error %d on stuser for key=%.20s\n", getDateTime(), PID, mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Key value [%.20s] not exists in stuser", keyValue);
			formatSecurityResponse(keyValue, NOT_FOUND, ST_REJECTED, tmpStr);
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached on stuser");
			formatSecurityResponse(keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked on stuser", keyValue);
			formatSecurityResponse(keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser", iserrno);
			formatSecurityResponse(keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}
	fflush(logFp);
	return SUCCESS;
}

readUserBrnFile(mode, keyValue)
int mode;
char *keyValue;
{
	char tmpStr[50];
	fprintf(logFp, "%s|%5d| readUserBrnFile() for key value %.10s\n", getDateTime(), PID, keyValue);

	memset(&usrBrnRec.liveChar, ' ', sizeof usrBrnRec);
	strncpy(usrBrnRec.userId, keyValue, 10);
	if ( isRead(usrBrnFile, &usrBrnRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s : ISREAD/%s error %d on stusrbrn for key=%.10s\n", getDateTime(), mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			sprintf(tmpStr, "Key value [%.10s] not exists.in stusrbrn", keyValue);
			formatSecurityResponse(keyValue, NOT_FOUND, ST_REJECTED, tmpStr);
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached in stusrbrn");
			formatSecurityResponse(keyValue, END_OF_FILE, ST_REJECTED, tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked in stusrbrn", keyValue);
			formatSecurityResponse(keyValue, RECORD_LOCKED, ST_REJECTED, tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stusrbrn", iserrno);
			formatSecurityResponse(keyValue, INTERNALERR, ST_REJECTED, tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}
	fflush(logFp);
	return SUCCESS;
}


openSecurityFile()
{
	char tmpStr[200];

	if ( userFileOpen == YES )
		return SUCCESS;

	/* Open user profile table */
	if ( (userFile  = isopen(userFilePath, ISMANULOCK + ISINOUT)) < 0)
	{
		printf("ISOPEN error %d for %s file\n", iserrno, userFilePath);
		fprintf(logFp, "ISOPEN error %d for %s File\n", iserrno, userFilePath);
		sprintf(tmpStr, "Error %d occured while opening stuser.dat File", iserrno );
		if ( strncmp(receivedMsg.security.service, "90", 2) == 0 ) 
		{
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
			sendResponse(responseMsg.security.msgLen);
		}
		else
		{
			formatUserListResponse(INTERNALERR,  tmpStr);
			sendResponse(responseMsg.userList.msgLen);
		}
		return FAILURE;
	}
	isindexinfo(userFile, &userKey, 1);
	userFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stuser file (%d) successfully opened...\n", getDateTime(), PID, userFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openUsrBrnFile()
{
	char tmpStr[200];

	if ( usrBrnFileOpen == YES )
		return SUCCESS;

	/* Open user profile table */
	if ( (usrBrnFile  = isopen(usrBrnFilePath, ISMANULOCK + ISINOUT)) < 0)
	{
		printf("ISOPEN error %d for %s file\n", iserrno, usrBrnFilePath);
		fprintf(logFp, "ISOPEN error %d for %s File\n", iserrno, usrBrnFilePath);
		sprintf(tmpStr, "Error %d occured while opening stusrbrn.dat File", iserrno );
		if ( strncmp(receivedMsg.security.service, "90", 2) == 0 ) 
		{
			formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
			sendResponse(responseMsg.security.msgLen);
		}
		else
		{
			formatUserListResponse(INTERNALERR,  tmpStr);
			sendResponse(responseMsg.userList.msgLen);
		}
		return FAILURE;
	}
	isindexinfo(usrBrnFile, &usrBrnKey, 1);
	usrBrnFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stusrbrn file (%d) successfully opened...\n", getDateTime(), PID, usrBrnFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openUserLogFile()
{
	char tmpStr[200];

	if ( userLogFileOpen == YES )
		return SUCCESS;

	if ( (userLogFile  = isopen(userLogFilePath, ISMANULOCK + ISINOUT)) < 0)
	{
		fprintf(logFp, "ISOPEN error %d for %s File\n", iserrno, userLogFilePath);
		sprintf(tmpStr, "Error %d occured while opening stuserlog.dat File", iserrno);
		formatSecurityResponse(&receivedMsg.security.keyValue[2], INTERNALERR, ST_REJECTED, tmpStr);
		sendResponse(responseMsg.security.msgLen);
		return FAILURE;
	}
	isindexinfo(userLogFile, &userLogKey, 1);
	userLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| stuserlog file (%d) successfully opened...\n", getDateTime(), PID, userLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

logSecurityDetails()
{
	char tmpStr[10];
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Security]\n", &receivedMsg.security.service);
	fprintf(logFp, "User Id	        : %.20s\n", &receivedMsg.security.keyValue[2]);
	fprintf(logFp, "Action          : %c\n", receivedMsg.security.action);
	fprintf(logFp, "User Name       : %.60s\n", receivedMsg.security.name);
	fprintf(logFp, "Other details  	: %.100s\n", receivedMsg.security.otherDetails);
	fprintf(logFp, "BP User ID     	: %.3s\n", receivedMsg.security.bpUserId);
	fprintf(logFp, "No.of.enq.branch: %.3s\n", receivedMsg.security.noOfBrn);

	sprintf(tmpStr, "%.3s", receivedMsg.security.noOfBrn);
	fprintf(logFp, "Enq.Allowed branch : [%.*s]\n", atoi(tmpStr)*4,  receivedMsg.security.enqAllowedBrn); /* noOfBranches * 4 */
	fflush(logFp);
}

logUserListDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[UserList]\n", receivedMsg.userList.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.userList.branchCode);
	fprintf(logFp, "Last Rec Read	: %.5s\n", receivedMsg.userList.lastRecRead);
	fflush(logFp);
}

