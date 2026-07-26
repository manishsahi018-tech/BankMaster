/*
	Objective       :       Static data maintenance server (St Login Interface)

	Date            :       08/07/2000.

	Author          :       S. Rajesh.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
--------------------------------------------------------------------------
1.1		Mohit		28/11/2006		Changes done under Pension account opening through 
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
#include <crypt.h>
#include "../cbslib/cblayout.h"
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

extern struct keydesc  userKey, secLogKey, ctlKey, calendarKey;
struct dictinfo fileInfo;
extern int   userFile, secLogFile, ctlFile, calendarFile;
extern int debug, extraDebug, ahaerr;
extern char progName[30];
extern char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath;

extern  int page, line;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];

struct userProfile 		userRec;
struct securityLog 		secLogRec;
struct branchInfo  		branchRec;
struct serverConfig		serverConfigRec;
struct calendarInfo		calendarRec;

extern FILE *logFp, *errLogFp;

extern struct tm   *systemDate;  /* structure declaration in time.h */
extern time_t systime;
extern int PID;
extern int idleTimeOut;

char            *getpath();
char            *getDateTime();
double          bmAmtToDbl();
char            *dblToBmAmt();
char            *bmCustToAcutal();
char            *doubleToPack();
double          packToDouble(); 

unsigned char *Encrypt();
unsigned char *Decrypt();
char *trim();

char lOldPassword[50], lNewPassword[50];

extern int errno;
extern int optopt;
extern char *optarg, authorisedUser[25], clientIpAddress[30];
extern int debug, extraDebug, loginAuthorised, userFileOpen, secLogFileOpen , staticFileOpen, commonFileOpen, ctlFileOpen, calendarFileOpen;

int stLogin(headerBuf)
char *headerBuf;
{ 
	int c, msgLen;
	char tmpStr[60];

	systime = time(NULL);                  /* get the system time */
	systemDate = localtime( &systime );

	sprintf(tmpStr, "%.6s", headerBuf);
	msgLen = atoi(tmpStr);

	/* receive the main details */

	memset(receivedMsg.login.msgLen, NULL, sizeof receivedMsg.login);
	memset(responseMsg.login.msgLen,  ' ', sizeof responseMsg.login);
	strncpy(receivedMsg.login.msgLen, headerBuf, 12);
	if ( getMessage(receivedMsg.login.userId, msgLen - 12) < 0 )
	{
		formatLoginResponse(receivedMsg.login.userId, COMMSERR, '0', "00000000","0000","Comms.Error: Check your connection or call Support ","Comms Error: Check your connection or call Support ");
		sendResponse(responseMsg.login.msgLen);
		return COMMSFAILURE;
	}
	sprintf(authorisedUser, "%.10s",receivedMsg.login.userId);

	if ( openUserFile(ISINOUT+ISMANULOCK)  < 0 )
	{
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}

	if ( openSecLogFile(ISINOUT+ISMANULOCK) == FAILURE ) 
	{
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}

	if ( openCtlFile(ISMANULOCK+ISINOUT) == FAILURE )
	{
		sprintf(tmpStr, "Error %d while opening stctltab", iserrno);
		formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0', "00000000","0000",tmpStr, tmpStr);
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}

	if ( openCalendarFile(ISMANULOCK + ISINOUT) == FAILURE )
	{
		sprintf(tmpStr, "Error %d while opening stcaltab", iserrno);
		formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0', "00000000","0000",tmpStr, tmpStr);
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}

	if ( strncmp(&headerBuf[6], "00", 2) == 0 ) /*Logon  Request*/
	{
		logLoginDetails();
		loginAuthorised = NO;
		if ( processLoginRequest()  == FAILURE )
		     return FAILURE;
	}
	else if ( strncmp(&headerBuf[6], "01", 2) == 0 ) /*Change Password  Request*/
	{
        logChangePasswordDetails();
		if ( processChangePasswordRequest()  == FAILURE )
		     return FAILURE;
	}
	return SUCCESS;
}

formatLoginResponse(recType, responseCode, langCd,lastPasswordChangeDate, branchCode,aRemarks,eRemarks)
char *recType, *responseCode, langCd, *lastPasswordChangeDate, *branchCode, *aRemarks, *eRemarks;
{
	char tmpStr[120];
	if ( extraDebug )
	     fprintf(logFp, "Formating the response\n");
	strncpy(responseMsg.login.status, responseCode, 3);
	sprintf(tmpStr, "%-50.50s", aRemarks);
	strncpy(responseMsg.login.aRemarks,tmpStr,50);
	sprintf(tmpStr, "%-50.50s", eRemarks);
	strncpy(responseMsg.login.eRemarks,tmpStr,50);
	strncpy(responseMsg.login.service, receivedMsg.login.service, 2);
	responseMsg.login.langPref = langCd;
	strncpy(responseMsg.login.lastPasswordChangeDate,lastPasswordChangeDate,8);
	strncpy(responseMsg.login.branchCode,branchCode,4);
	strncpy(responseMsg.login.authorityLevel, recType, 20);
	strncpy(responseMsg.login.tellerId, userRec.bpUserId, 3);
	if (strncmp(responseCode, "000",3) == 0)
	   responseMsg.login.globalUpdatePriv = userRec.globalUpdatePriv;
	else
	  responseMsg.login.globalUpdatePriv = '0';
	responseMsg.login.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.login.msgLen));
	strncpy(responseMsg.login.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
		iscleanup();
		fclose(logFp);
	}
	return SUCCESS;
}

processLoginRequest() 
{ 
	char tmpStr[100], tmpStr1[100], lUserid[20],lPassword[20]; 
	char tmpDate[15];
	char *tmpPtr;
	int i, mode, dateErr, daysBetween; 
	char tmpAuthLevel[150];

	init_date();

	memset(responseMsg.login.msgLen, ' ', sizeof responseMsg.login);

	if ( strncmp(receivedMsg.login.homeBranch, "SECU",4) && strncmp(receivedMsg.login.homeBranch, "MANT",4) )
	{
		if ( strncmp(receivedMsg.login.version, "VER3", 4) )
		{
			formatLoginResponse(receivedMsg.login.userId,INTERNALERR,'0',"00000000","0000","Invalid Port No. Log it to Help Desk","Invalid Port No. Log it to Help Desk");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
		}

		if ( strncmp(receivedMsg.login.clientVer, "2.4", 3) == 0 )
		{
			formatLoginResponse(receivedMsg.login.userId,INTERNALERR,'0',"00000000","0000","Version not supported..Log it to  Help Desk","Version not supported..Log it to Help Desk");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
		}

		if ( strncmp(receivedMsg.login.clientVer, "4.0", 3)  )
		{
			formatLoginResponse(receivedMsg.login.userId,INTERNALERR,'0',"00000000","0000","Old version not supported..Log it to  Help Desk","Old version not supported..Log it to Help Desk");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
		}
	}

	if ( readuserFile(ISEQUAL, receivedMsg.login.userId) < 0 ) 
	{ 
		 sendResponse(responseMsg.login.msgLen);
	     return FAILURE;
	}
	readBankingDate();
	if ( readBranchFile("BD", receivedMsg.login.homeBranch) == FAILURE )
	{
		responseMsg.login.cardPrdnAtBranch        = '0';
		responseMsg.login.pinSelectAtBranch       = '0';
		responseMsg.login.mainBrEditAllowed       = '0';
		responseMsg.login.tpinSelectAtBranch      = '0';
		responseMsg.login.dormantActivationFlag   = '0';
		responseMsg.login.tpinMandatoryFlag       = '0';
		responseMsg.login.nameSearchAllowed       = '0';
		responseMsg.login.stdOrdReqAllowed        = '0';
		responseMsg.login.custNameUpdAllowed      = '0';
		responseMsg.login.enableChipCard          = '0';
		responseMsg.login.mailCentreBranch        = '0';
		responseMsg.login.mandateBranch           = '0';
		responseMsg.login.callCentreBranch        = '0';
		responseMsg.login.internalCustOpenAllowed = '0';
		responseMsg.login.enableLocalChipCard     = '0';
		responseMsg.login.generalCustOpenAllowed  = '0';
		responseMsg.login.pensionCustOpenAllowed  = '0'; /* Ver 1.1 */
		responseMsg.login.feeExclusionUpdAllowed  = '0';
		responseMsg.login.generalSamaUpdAllowed  = '0';
		responseMsg.login.swiftCentreBranchFlag  = '0';
		responseMsg.login.payrollBranch  		 = '0';
		responseMsg.login.accOpenCardPrintAllowed = '0';
	}
	else
	{
		responseMsg.login.cardPrdnAtBranch        = branchRec.cardPrdnAtBranch;
		responseMsg.login.pinSelectAtBranch       = branchRec.pinSelectAtBranch;
		responseMsg.login.mainBrEditAllowed       = branchRec.mainBrEditAllowed;
		responseMsg.login.tpinSelectAtBranch      = branchRec.tpinSelectAtBranch;
		responseMsg.login.dormantActivationFlag   = branchRec.dormantActivationFlag;
		responseMsg.login.tpinMandatoryFlag       = branchRec.tpinMandatoryAtBranch;
		responseMsg.login.nameSearchAllowed       = branchRec.nameSearchAllowed;
		responseMsg.login.stdOrdReqAllowed        = branchRec.stdOrdReqAllowed;
		responseMsg.login.custNameUpdAllowed      = branchRec.custNameUpdAllowed;
		responseMsg.login.enableChipCard          = branchRec.enableChipCard;
		responseMsg.login.mailCentreBranch        = branchRec.mailCentreBranch;
		responseMsg.login.mandateBranch           = branchRec.mandateBranch;
		responseMsg.login.callCentreBranch        = branchRec.callCentreBranch;
		responseMsg.login.internalCustOpenAllowed = branchRec.internalCustOpenAllowed;
		responseMsg.login.enableLocalChipCard     = branchRec.enableLocalChipCard;
		responseMsg.login.generalCustOpenAllowed  = branchRec.generalCustOpenAllowed;
		responseMsg.login.pensionCustOpenAllowed  = branchRec.pensionCustOpenAllowed;/* Ver 1.1 */
		responseMsg.login.feeExclusionUpdAllowed  = branchRec.feeExclusionUpdAllowed;
		responseMsg.login.generalSamaUpdAllowed   = branchRec.generalSamaUpdAllowed;
		responseMsg.login.swiftCentreBranchFlag   = branchRec.swiftCentreBranchFlag;
		responseMsg.login.payrollBranch  		  = branchRec.payrollBranch;
		responseMsg.login.accOpenCardPrintAllowed = branchRec.accOpenCardPrintAllowed;
	}

	if ( readBranchFile("SC", "SERV") == FAILURE )
	{
		responseMsg.login.enableSadadProfile = '0';
		strncpy(responseMsg.login.maxAgeLimit, "140", 3); /* defaulted to 140 years */
		memset(responseMsg.login.filler, '0', sizeof responseMsg.login.filler);

	}
	else
	{
		memcpy(&serverConfigRec.liveChar, &branchRec.liveChar, sizeof serverConfigRec);
		responseMsg.login.enableSadadProfile = serverConfigRec.enableSadadProfile;
		if ( strncmp(serverConfigRec.maxAgeLimit, "     ", 3) == 0 || strncmp(serverConfigRec.maxAgeLimit, "000", 3) == 0 ||
			 serverConfigRec.maxAgeLimit[0] == NULL )
			strncpy(responseMsg.login.maxAgeLimit, "140", 3); /* defaulted to 140 years */
		else
			strncpy(responseMsg.login.maxAgeLimit, serverConfigRec.maxAgeLimit, 3);
		strncpy(responseMsg.login.filler, serverConfigRec.filler, sizeof responseMsg.login.filler);
	}

	getDateTime();
	sprintf(tmpDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday );
	strncpy(responseMsg.login.bankingDate, tmpDate, 8);
	if ( getHijriDate(tmpDate) == FAILURE )
	 	 gregToHijri(tmpDate, tmpStr1);
	else
		strncpy(tmpStr1, calendarRec.hijriDate, 8);

	strncpy(responseMsg.login.currentDateH, tmpStr1, 8);
	strncpy(responseMsg.login.currentDateG, tmpDate, 8);
	sprintf(tmpStr, "%04d", idleTimeOut);
	strncpy(responseMsg.login.idleTimeOutPeriod, tmpStr, 4);
	strncpy(responseMsg.login.authorityLevel2, userRec.authorityLevel2, 60); /* added to support new alpha segment flags */

	sprintf(lUserid,"%.10s", receivedMsg.login.userId);
	sprintf(lPassword,"%.20s", receivedMsg.login.password);

	getCryptPassword(lPassword);
	if ( extraDebug )
	{
		fprintf(logFp, "After Reading User file  \n");
		fprintf(logFp, "userid     : %.20s\n",  userRec.userId);
		fprintf(logFp, "authority level  : %.20s\n",userRec.authorityLevel);
		fprintf(logFp, "live Status : %c\n", userRec.liveStatus);
	}

	if ( strncmp(receivedMsg.login.userId, userRec.userId, 10) )
	{
	    formatLoginResponse(receivedMsg.login.userId,INVALID_USER,'0',"00000000","0000","Invalid User. Check your spelling","Invalid User. Check your spelling");
	    sendResponse(responseMsg.login.msgLen);
	    return FAILURE;
	}    

	if ( userRec.liveStatus == '2' )
	{
		formatLoginResponse(userRec.authorityLevel,USER_LOCKED,'0',userRec.lastChangeDate,userRec.branchCode,"User Account is locked. Call HO to activate","User Account is locked. Call HO to activate");
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}
	else if ( userRec.liveStatus == '3' )
	{
		formatLoginResponse(userRec.authorityLevel, ACCOUNT_CLOSED,userRec.langPreferred,userRec.lastChangeDate,userRec.branchCode,"Your Account has been closed..Contact Security Officer","Your Account has been closed..Contact Security Officer");
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}

	if ( strncmp(lPassword, userRec.password, 20) == 0 )
	{
		/* Commented as it is handled in the client
		if ( strncmp(userRec.branchCode, receivedMsg.login.branchCode, 4) && strncmp(receivedMsg.login.branchCode, "MANT", 4) && 
																			 strncmp(receivedMsg.login.branchCode, "SECU", 4) )
		{
			formatLoginResponse(userRec.authorityLevel,INTERNALERR,userRec.langPreferred,userRec.lastChangeDate,userRec.branchCode,"You are not authorised to login in this branch","You are not authorised to login in this branch");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
        }
		*/
		if ( userRec.loginStatus == '1' && receivedMsg.login.idleTimeLogin != '1' )
		{
			if ( strncmp(userRec.loginIpAddress, clientIpAddress, 15) )
			{
				fprintf(logFp, "%s|%5d|[processLoginRequest] User [%.10s] has already logged in  at IP [%.15s] ...Please logout and then try to login\n", getDateTime(), PID, userRec.userId, userRec.loginIpAddress);
				fflush(logFp);
				sprintf(tmpStr, "[%.10s] already logged in.Cannot login again", userRec.userId);
				formatLoginResponse(userRec.authorityLevel,ALREADY_LOGGED_IN,userRec.langPreferred,userRec.lastChangeDate,userRec.branchCode,tmpStr,tmpStr);
				sendResponse(responseMsg.login.msgLen);
				return FAILURE;
			}
		}
		writeSecurityLog('0', receivedMsg.login.userId, "             ", userRec.branchCode); /* 0 is for Logon action */
		if (userRec.liveStatus == '0')
	    {
			formatLoginResponse(userRec.authorityLevel,NEWUSER_OR_PASSWORDRESET,userRec.langPreferred,userRec.lastChangeDate,userRec.branchCode,"Please change your password","Please change your password");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
        }
		sprintf(tmpStr, "%.20s", userRec.authorityLevel);
		sprintf(tmpAuthLevel, "~%.2s", tmpStr);
		for (i=2; i < strlen(tmpStr); i += 2 )
			sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

		sprintf(tmpStr, "%.60s", userRec.authorityLevel2);
		for (i=0; i < strlen(tmpStr); i += 2 )
			sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

		if ( (tmpPtr = strstr(tmpAuthLevel, "~99")) == NULL )  /* 99 is for system people to check the installation; password for 
																							that userid  will not expiry*/
		{
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday );
			sprintf(tmpDate, "%.8s", userRec.lastChangeDate);
			fprintf(logFp, "%s|%5d|[processLoginRequest] Current Date : %.8s  ;  Last password change date : %.8s \n", getDateTime(),PID, tmpStr, tmpDate);
			fflush(logFp);
			if ( (dateErr = days_between_2dates(tmpStr, tmpDate,  &daysBetween)) < 0 )
			{
				fprintf(logFp, "%s : Error %d returned by days_between_2dates for user=%.10s; lastChangeDate=%.8s; tCurrentDate=%.8s\n", getDateTime(), dateErr, userRec.userId, tmpDate, tmpStr);
				fflush(logFp);
				daysBetween=0;
			}
			fprintf(logFp,"%s|%5d|[processLoginRequest]: Daysbetween return from date library : %d ; error flag : %d\n", getDateTime(), PID, daysBetween, dateErr);
			fflush(logFp);

			if ( daysBetween > 30 )
			{
				end_date();
				writeSecurityLog('9', userRec.userId, "            ", userRec.branchCode); /* 9 is for password expiration */
				formatLoginResponse(userRec.authorityLevel,PASSWORD_EXPIRED,userRec.langPreferred,userRec.lastChangeDate,userRec.branchCode,"Your password has been expired..Please change it ","Your password has been expired..Please change it ");
				sendResponse(responseMsg.login.msgLen);
				return FAILURE;
			}

			if ( daysBetween > 24 )
			{
				responseMsg.login.passwordChngAlertFlag = '1';
			}
			else
			{
				responseMsg.login.passwordChngAlertFlag = '0';
			}
		}

		if ( strncmp(userRec.branchCode, receivedMsg.login.branchCode, 4) == 0 ) /* update loginStatus to '1' only when the user is 
																					login from the same branch; */
		{
			if ( receivedMsg.login.idleTimeLogin != '1' )
			{
				userRec.loginStatus = '1';
				strncpy(userRec.loginIpAddress, clientIpAddress, 15);
				/*
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(userRec.lastLoginDateTime, tmpStr, 14);
				if ( isRewcurr(userFile, &userRec.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processLoginRequest] Error %d occured while updating LOGON status on stuser for the user [%.10s] IGNORED\n", getDateTime(), PID, iserrno , userRec.userId);
					fflush(logFp);
				}
				*/
			}
		}
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(userRec.lastLoginDateTime, tmpStr, 14);
		if ( isRewcurr(userFile, &userRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processLoginRequest] Error %d occured while updating LOGON status & last login dateTime on stuser for the user [%.10s] IGNORED\n", getDateTime(), PID, iserrno , userRec.userId);
			fflush(logFp);
		}
	    formatLoginResponse(userRec.authorityLevel, DONE, userRec.langPreferred, userRec.lastChangeDate,userRec.branchCode,"Successful", "Successful");
    }
	else
	{
	    if ( receivedMsg.login.noOfTries > '3' )
	    {
			sprintf(tmpStr, "%.20s", userRec.authorityLevel);
			sprintf(tmpAuthLevel, "~%.2s", tmpStr);
			for (i=2; i < strlen(tmpStr); i += 2 )
				sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

			sprintf(tmpStr, "%.60s", userRec.authorityLevel2);
			for (i=0; i < strlen(tmpStr); i += 2 )
				sprintf(tmpAuthLevel, "%s~%.2s", tmpAuthLevel, &tmpStr[i]);

			if ( (tmpPtr = strstr(tmpAuthLevel, "~99")) == NULL )  /* 99 is for system people to check the installation; so 
																								no lock */
			{
				sprintf(lUserid, "%.10s", receivedMsg.login.userId);
				lockUser(lUserid);
				formatLoginResponse(receivedMsg.login.userId,WRONG_PASSWORD,'0',"00000000","0000", "Invalid password. User locked. Call HO to activate", "Invalid password. User locked. Call HO to activate");
				writeSecurityLog('4', receivedMsg.login.userId, "            ", userRec.branchCode); /* 4 is for user Locked */
			}
			else
			{
				formatLoginResponse(receivedMsg.login.userId,WRONG_PASSWORD,'0',"00000000","0000", "Invalid Password. Password is case sensitive","Invalid Password. Password is case senstive");
				writeSecurityLog('2', receivedMsg.login.userId, "            ", userRec.branchCode);/* 2 is for Invalid Passoword */
			}
        }
	    else
		{
	        formatLoginResponse(receivedMsg.login.userId,WRONG_PASSWORD,'0',"00000000","0000", "Invalid Password. Password is case sensitive","Invalid Password. Password is case senstive");
			writeSecurityLog('2', receivedMsg.login.userId, "            ", userRec.branchCode); /* 2 is for Invalid Passoword */
		}
	    sendResponse(responseMsg.login.msgLen);
	    return FAILURE;
	}
	end_date();

	sendResponse(responseMsg.login.msgLen);
	loginAuthorised = YES;
	return SUCCESS;
}

processChangePasswordRequest()
{
	char tmpStr[100], tmpStr1[100], lastPasswords[200],lUserid[30]; 
	char tmpDate[15];
	int i, mode,RetStatus;

	sprintf(lUserid,"%.10s", receivedMsg.passwordChange.userId);
	sprintf(lOldPassword,"%.20s", receivedMsg.passwordChange.orgPassword);
	sprintf(lNewPassword,"%.20s", receivedMsg.passwordChange.newPassword);

	getCryptPassword(lOldPassword);
	getCryptPassword(lNewPassword);

	if ( readuserFile(ISEQUAL, lUserid) < 0 )
	{
	     sendResponse(responseMsg.login.msgLen);
	     return FAILURE;
	}

	if (strncmp(lOldPassword, userRec.password,20) == 0)
	{
		sprintf(lastPasswords,"%.200s",userRec.last10Password);
		RetStatus = checkPassword(lastPasswords);
		if( RetStatus == 1)
		{
			formatLoginResponse(userRec.authorityLevel,PASSWORD_USED,userRec.langPreferred, userRec.lastChangeDate,userRec.branchCode,"Password already used. Use Different password..","Password already used. Use Different password.");
			sendResponse(responseMsg.login.msgLen);
			return FAILURE;
		}
		sprintf(lUserid,"%.10s", receivedMsg.passwordChange.userId);
		if ( updatePassword(lUserid) == FAILURE )
			return FAILURE;
		writeSecurityLog('3', receivedMsg.login.userId, "             ", userRec.branchCode); /* 3 is for password change */
		loginAuthorised = YES;
	}
	else
	{
		formatLoginResponse(userRec.authorityLevel, WRONG_PASSWORD,userRec.langPreferred , userRec.lastChangeDate,userRec.branchCode,"Old Password does not match","Old Password does not match"); 
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
    }
	readBankingDate();
	if ( readBranchFile("BD", receivedMsg.login.homeBranch) == FAILURE )
	{
		responseMsg.login.cardPrdnAtBranch        = '0';
		responseMsg.login.pinSelectAtBranch       = '0';
		responseMsg.login.mainBrEditAllowed       = '0';
		responseMsg.login.tpinSelectAtBranch      = '0';
		responseMsg.login.dormantActivationFlag   = '0';
		responseMsg.login.tpinMandatoryFlag       = '0';
		responseMsg.login.nameSearchAllowed       = '0';
		responseMsg.login.stdOrdReqAllowed        = '0';
		responseMsg.login.custNameUpdAllowed      = '0';
		responseMsg.login.enableChipCard          = '0';
		responseMsg.login.mailCentreBranch        = '0';
		responseMsg.login.mandateBranch           = '0';
		responseMsg.login.callCentreBranch        = '0';
		responseMsg.login.internalCustOpenAllowed = '0';
		responseMsg.login.enableLocalChipCard     = '0';
		responseMsg.login.generalCustOpenAllowed  = '0';
		responseMsg.login.feeExclusionUpdAllowed  = '0';
		responseMsg.login.generalSamaUpdAllowed   = '0';
		responseMsg.login.swiftCentreBranchFlag   = '0';
		responseMsg.login.payrollBranch  		  = '0';
		responseMsg.login.accOpenCardPrintAllowed = '0';
	}
	else
	{
		responseMsg.login.cardPrdnAtBranch = branchRec.cardPrdnAtBranch;
		responseMsg.login.pinSelectAtBranch = branchRec.pinSelectAtBranch;
		responseMsg.login.mainBrEditAllowed = branchRec.mainBrEditAllowed;
		responseMsg.login.tpinSelectAtBranch = branchRec.tpinSelectAtBranch;
		responseMsg.login.dormantActivationFlag = branchRec.dormantActivationFlag;
		responseMsg.login.tpinMandatoryFlag = branchRec.tpinMandatoryAtBranch;
		responseMsg.login.nameSearchAllowed = branchRec.nameSearchAllowed;
		responseMsg.login.stdOrdReqAllowed = branchRec.stdOrdReqAllowed;
		responseMsg.login.custNameUpdAllowed = branchRec.custNameUpdAllowed;
		responseMsg.login.enableChipCard     = branchRec.enableChipCard;
		responseMsg.login.mailCentreBranch      = branchRec.mailCentreBranch;
		responseMsg.login.mandateBranch         = branchRec.mandateBranch;
		responseMsg.login.callCentreBranch      = branchRec.callCentreBranch;
		responseMsg.login.internalCustOpenAllowed = branchRec.internalCustOpenAllowed;
		responseMsg.login.enableLocalChipCard     = branchRec.enableLocalChipCard;
		responseMsg.login.generalCustOpenAllowed  = branchRec.generalCustOpenAllowed;
		responseMsg.login.feeExclusionUpdAllowed  = branchRec.feeExclusionUpdAllowed;
		responseMsg.login.generalSamaUpdAllowed   = branchRec.generalSamaUpdAllowed;
		responseMsg.login.swiftCentreBranchFlag   = branchRec.swiftCentreBranchFlag;
		responseMsg.login.payrollBranch  		  = branchRec.payrollBranch;
		responseMsg.login.accOpenCardPrintAllowed = branchRec.accOpenCardPrintAllowed;
	}

	if ( readBranchFile("SC", "SERV") == FAILURE )
	{
		responseMsg.login.enableSadadProfile = '0';
		strncpy(responseMsg.login.maxAgeLimit, "140", 3); /* defaulted to 140 years */
		memset(responseMsg.login.filler, '0', sizeof responseMsg.login.filler);

	}
	else
	{
		memcpy(&serverConfigRec.liveChar, &branchRec.liveChar, sizeof branchRec);
		responseMsg.login.enableSadadProfile = serverConfigRec.enableSadadProfile;
		if ( strncmp(serverConfigRec.maxAgeLimit, "     ", 3) == 0 || strncmp(serverConfigRec.maxAgeLimit, "000", 3) == 0 ||
			 serverConfigRec.maxAgeLimit[0] == NULL )
			strncpy(responseMsg.login.maxAgeLimit, "140", 3); /* defaulted to 140 years */
		else
			strncpy(responseMsg.login.maxAgeLimit, serverConfigRec.maxAgeLimit, 3);
		strncpy(responseMsg.login.filler, serverConfigRec.filler, sizeof responseMsg.login.filler);
	}

	getDateTime();
	sprintf(tmpDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday );
	strncpy(responseMsg.login.bankingDate, tmpDate, 8);
	if ( getHijriDate(tmpDate) == FAILURE )
	 	 gregToHijri(tmpDate, tmpStr1);
	else
		strncpy(tmpStr1, calendarRec.hijriDate, 8);

	strncpy(responseMsg.login.currentDateH, tmpStr1, 8);
	strncpy(responseMsg.login.currentDateG, tmpDate, 8);
	sprintf(tmpStr, "%04d", idleTimeOut);
	strncpy(responseMsg.login.idleTimeOutPeriod, tmpStr, 4);
	strncpy(responseMsg.login.authorityLevel2, userRec.authorityLevel2, 60); /* added to support new alpha segment flags */

	formatLoginResponse(userRec.authorityLevel, DONE, userRec.langPreferred, userRec.lastChangeDate,userRec.branchCode, "Password Successfully Changed...", "Password Successfully Changed...");
	sendResponse(responseMsg.login.msgLen);
    return SUCCESS;
}

readuserFile(mode, keyValue)
int mode;
char *keyValue;
{
	char tmpStr[50] ;
	fprintf(logFp, "%s|%5d| readuserFile() for key value %.10s\n", getDateTime(), PID, keyValue);
	memset(&userRec.liveChar, ' ', sizeof userRec);
	strncpy(userRec.userId, keyValue, 10);

	if ( isRead(userFile, &userRec.liveChar, mode) < 0 )
	{
		fprintf(logFp, "%s : ISREAD/%s error %d on stuser for key=%.20s\n", getDateTime(), mode==ISEQUAL ? "ISEQUAL" : mode==ISNEXT ? "ISNEXT" : mode==ISPREV ? "ISPREV" : mode == ISFIRST ? "ISFIRST" : mode == ISLAST ? "ISLAST" : mode == ISGTEQ ? "ISGTEQ" : "UNKNOWN", iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 111 || iserrno == 112 )
		{
			formatLoginResponse(receivedMsg.login.userId,INVALID_USER,'0',"00000000", "0000", "UserId does not exist...Please Contact Support","UserId does not exist...Please Contact Support");
		}
		else if ( iserrno = 110 )
		{
			sprintf(tmpStr, "Begining/End of file reached");
			formatLoginResponse(receivedMsg.login.userId, END_OF_FILE, '0',"00000000","0000", tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatLoginResponse(receivedMsg.login.userId, RECORD_LOCKED, '0',"00000000", "0000",tmpStr,tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stuser", iserrno);
			formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0',"00000000", "0000",tmpStr,tmpStr);
		}
		/* send resonse will be taken care of calling function */
		return FAILURE;
	}
	fflush(logFp);
	return SUCCESS;
}

lockUser(keyValue)
char *keyValue;
{
	char tmpStr[100];
	sprintf(tmpStr, "%-20.20s", keyValue);
	if ( readUserFile(ISEQUAL+ISLOCK, tmpStr) < 0 )
	{
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}
	userRec.liveStatus =  '2'; /* 2 is for locking the User */
	strncpy(userRec.lastUpdateUser, receivedMsg.login.userId, 10);
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
			formatLoginResponse(receivedMsg.login.userId, DUPLICATE, '0',"00000000", "0000",tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatLoginResponse(receivedMsg.login.userId, RECORD_LOCKED, '0',"00000000", "0000",tmpStr,tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0',"00000000","0000", tmpStr,tmpStr);
		}
		sendResponse(responseMsg.login.msgLen);
		isrelease(userFile);
		return FAILURE;
	}
	isrelease(userFile);
	return SUCCESS;
}

updatePassword(keyValue)
char *keyValue;
{
	char tmpStr[100],lastPasswords[200];

	sprintf(tmpStr, "%-20.20s", keyValue);
	if ( readUserFile(ISEQUAL+ISLOCK, tmpStr) < 0 )
	{
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}
	getDateTime();
	sprintf(tmpStr,"%04d%02d%02d",systemDate->tm_year+1900,systemDate->tm_mon+1, systemDate->tm_mday);
	strncpy(userRec.lastChangeDate, tmpStr, 8);
	strncpy(userRec.lastUpdateUser, receivedMsg.passwordChange.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(userRec.lastUpdateDateTime, tmpStr, 14);
	strncpy(userRec.password, lNewPassword, 20);
	sprintf(lastPasswords,"%.200s",userRec.last10Password);
	storeLast10Password(lastPasswords, lOldPassword);
	strncpy(userRec.last10Password,lastPasswords,200);
	userRec.liveStatus = '1';
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(userRec.lastLoginDateTime, tmpStr, 14);

	if ( strncmp(userRec.branchCode, receivedMsg.passwordChange.homeBranch, 4) == 0 ) /* update loginStatus to '1' only when the 
																						 user is login from the same branch; */
	{
		userRec.loginStatus = '1';
		strncpy(userRec.loginIpAddress, clientIpAddress, 15);
	}

	if ( isRewcurr(userFile, &userRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISREWCURR error %d on stuser for key=%.20s\n", getDateTime(), iserrno, keyValue);
		fflush(logFp);
		if  ( iserrno == 100 )
		{
			sprintf(tmpStr, "Duplicate record [%.20s]", keyValue);
			formatLoginResponse(receivedMsg.login.userId, DUPLICATE, '0',"00000000", "0000",tmpStr,tmpStr);
		}
		else if ( iserrno == 107 || iserrno == 113 )
		{
			sprintf(tmpStr, "Record/File locked", keyValue);
			formatLoginResponse(receivedMsg.login.userId, RECORD_LOCKED, '0',"00000000","0000", tmpStr,tmpStr);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured", iserrno);
			formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0',"00000000","0000", tmpStr,tmpStr);
		}
		isrelease(userFile);
		sendResponse(responseMsg.login.msgLen);
		return FAILURE;
	}
	isrelease(userFile);
	return SUCCESS;
}

int checkPassword(lastPassword)
char *lastPassword;
{
	int i,j; 
	char tmpPasswd[20],tmpStr[20];

	sprintf(tmpStr,"%.20s", receivedMsg.passwordChange.newPassword);
	
	getCryptPassword(tmpStr);
	 
	j=0;
    while ( j < strlen(lastPassword) )
    {
		for (i=0; i<20; i++,j++) 
      	    tmpPasswd[i] = lastPassword[j];
		tmpPasswd[i]='\0';
		if(strncmp(tmpPasswd, tmpStr,20) == 0)
	    	 return 1;

		memset(tmpPasswd,' ',sizeof(tmpPasswd));
    }
    return 0;
}

storeLast10Password(lastPassword, lOldPassword)
char *lastPassword, *lOldPassword;
{
     int i,j,ctr;
     char tmpPasswd[20];
     memset(tmpPasswd,' ',sizeof(tmpPasswd));
     ctr = 0;
     j=0;
     while ( j < strlen(lastPassword) )
     {
        for (i=0; i<20; i++,j++)
      	    tmpPasswd[i] = lastPassword[j];
		ctr++;
		tmpPasswd[i]='\0';
		if(strncmp(tmpPasswd,"",20) == 32)
		{
	   		strncpy(&lastPassword[j-20],lOldPassword,20);
	   		return;
		}
     }
     if(ctr == 10)
     {
		/* strncpy(lastPassword,&lastPassword[20],180);
	 		strncpy(&lastPassword[180],receivedMsg.lOldPassword,20);
	 	*/
	 	sprintf(lastPassword,"%.180s%.20s",&lastPassword[20],lOldPassword);
     }
}

writeSecurityLog(char action, char *userId, char *supervisorId, char *branchCode)
{
	char tmpStr[100];

	memset(&secLogRec.liveChar, ' ', sizeof secLogRec);
	secLogRec.liveChar = '@';
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(secLogRec.dateTime, tmpStr, 14);
	strncpy(secLogRec.userId, userId, 10);
	secLogRec.actionType = action;
	strncpy(secLogRec.supervisorId, supervisorId, 10);
	strncpy(secLogRec.branchCode, branchCode, 4);

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Before writing to Security Log File-stseclog (%d) \n", getDateTime(), PID, secLogFile);
		fflush(logFp);
	}
	if ( isWrite(secLogFile, &secLogRec.liveChar) < 0 )
	{
		fprintf(logFp, "%s : ISWRITE error %d on stseclog for key=%.25s; IGNORED \n", getDateTime(), iserrno, secLogRec.dateTime);
		fflush(logFp);
		fprintf(errLogFp, "%s : writeSecurityLog(): ISWRITE error %d on stseclog for key=%.25s; IGNORED \n", getDateTime(), iserrno, secLogRec.dateTime);
		fflush(errLogFp);
		return FAILURE;
	}

	return SUCCESS;
}

openUserFile(int mode)
{
	char tmpStr[200];

	if ( userFileOpen == YES )
		return SUCCESS;

	if ( (userFile  = isopen(userFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s : ISOPEN error %d for %s File\n", getDateTime(), iserrno, userFilePath);
		sprintf(tmpStr, "Error %d occured while opening stuser.dat File", iserrno );
		formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0', "00000000","0000",tmpStr ,tmpStr);
		return FAILURE;
	}
	isindexinfo(userFile, &userKey, 1);
	userFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| User File-stuser  (%d) successfully opened...\n", getDateTime(), PID, userFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

openSecLogFile(int mode)
{
	char tmpStr[200];

	if ( secLogFileOpen == YES )
		return SUCCESS;

	if ( (secLogFile  = isopen(secLogFilePath, mode)) < 0)
	{
		fprintf(logFp, "%s : ISOPEN error %d for %s File\n", getDateTime(), iserrno, secLogFilePath);
		sprintf(tmpStr, "Error %d occured while opening stseclog.dat File", iserrno );
		formatLoginResponse(receivedMsg.login.userId, INTERNALERR, '0', "00000000","0000",tmpStr ,tmpStr);
		return FAILURE;
	}
	isindexinfo(secLogFile, &secLogKey, 1);
	secLogFileOpen = YES;

	if ( extraDebug > 4 )
	{
		fprintf(logFp, "%s|%5d| Security Log File-stseclog (%d) successfully opened...\n", getDateTime(), PID, secLogFile);
		fflush(logFp);
	}
	
	return SUCCESS;
}

logLoginDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service            : %.2s[Logon]\n", receivedMsg.login.service);
	fprintf(logFp, "User Id            : %.10s\n", receivedMsg.login.userId);
	fprintf(logFp, "Branch  Code       : %.4s\n", receivedMsg.login.branchCode);
	fprintf(logFp, "No Of Tries        : %c\n", receivedMsg.login.noOfTries);
	fprintf(logFp, "Release Ver        : %.4s\n", receivedMsg.login.version);
	fprintf(logFp, "Client  Version    : %.5s\n", receivedMsg.login.clientVer);
	fprintf(logFp, "Client  IP ADDRESS : %.30s\n", clientIpAddress);
	fflush(logFp);
}

logChangePasswordDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	fprintf(logFp, "Service         : %.2s[Change Password]\n", receivedMsg.passwordChange.service);
	fprintf(logFp, "User Id         : %.10s\n", receivedMsg.passwordChange.userId);
	fprintf(logFp, "Branch  Code    : %.4s\n", receivedMsg.passwordChange.homeBranch);
	fflush(logFp);
}

unsigned char *Encrypt(pass)
char *pass;
{ 
    int   i, len, mode;
    unsigned char  *key;

    len = strlen(pass);                
    key = (unsigned char *) malloc ( (size_t) len + 2);  
    mode = ((len % 4) + 1) * 15;      
    for (i=0; i < len; i++) 
		key[i] = pass[i] + mode;
    key[len] = '\0';
    reverse(key);
    return key;
}

unsigned char *Decrypt(pass)
char *pass;
{ 
    int   i, len, mode; 
	unsigned char  *key;

    len = strlen(pass);                
    key = (unsigned char *) malloc ( (size_t) len + 2);  
    mode = ((len % 4) + 1) * 15;      
    for (i=0; i < len; i++) 
		key[i] = pass[i] - mode;
    key[len] = '\0';
    reverse(key);
    return key;
}

reverse(str)
char *str;
{ 
    int   i, len;
    char  *tmp;

    len = strlen(str);
    tmp = (char *) malloc ( (size_t) len+ 2);
    strcpy(tmp, str);
    for(i=0; i < len; i++)
       str[i] = tmp[len-(i+1)];
    free(tmp);
}

char *trim(str)
char *str;
{
	int i;
	for(i=strlen(str)-1; i>=0 && str[i] == ' '; str[i--] = '\0');
	return str;
}

getCryptPassword(password)
char *password;
{
	char tmpStr[50], tmpStr1[30], pass1[20], pass2[20];;

	sprintf(tmpStr1, "%.20s", password);
	trim(tmpStr1);
	sprintf(tmpStr, "%-20.20s", (char *) Decrypt(tmpStr1));
	sprintf(pass1, "%.8s", tmpStr);
	sprintf(pass2, "%.8s", &tmpStr[8]);
	trim(pass1);
	trim(pass2);
	sprintf(tmpStr, "%-10.10s", crypt(pass1,"AR")+2);
	sprintf(password, "%s%-10.10s", tmpStr, crypt(pass2, "AR")+2);
}

readBranchFile(char *recType, char *code)
{
	memset(&branchRec.liveChar, ' ', sizeof branchRec);

	strncpy(branchRec.recType, recType, 2);
	strncpy(branchRec.branchCode, code, 4);

	isindexinfo(ctlFile, &ctlKey, 1);
	isstart(ctlFile, &ctlKey, 0, &branchRec.liveChar, ISGTEQ);

	if ( isRead(ctlFile, &branchRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[readBranchFile]: ISREAD/ISEQUAL error %d occured while reading Control File for Code No [%.6s]\n", getDateTime(), PID, iserrno, branchRec.recType);
		fflush(logFp);
		return  FAILURE;
	}

	return SUCCESS;
}
