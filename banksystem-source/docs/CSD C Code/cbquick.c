/*
	Objective       :       Static data maintenance server 
				            (Modules related to Quick customer opening)

	Date            :       26/08/2003.

	Author          :       S. Rajesh.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
---------------------------------------------------------------------
1.1		Mohit		06-12-2006		Modified for quick Pension account opening.
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
#include "tpinint.h"
#include "stbmupdate.h"
#include "cbrouter.h"
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>

#define YES              1
#define NO               0

#define HIJRI			'0'
#define GREGORIAN		'1'

#define ARABIC			'0'
#define ENGLISH			'1'

#define INDIVIDUAL_SAUDI		'1'
#define INDIVIDUAL_OTHERS 		'2'
#define JURISTIC		 		'3'
#define EMBASSIES		 		'4'
#define DIPLOMATS		 		'5'
#define NON_RESIDENT_JURISTIC	'6'
#define QUICK_CUSTOMER			'7'
#define INTERNAL_CUSTOMER		'8'
#define PENSION_CUSTOMER		'9' 	/* Ver 1.1 */

#define SUP_ACCEPTED	'A'
#define SUP_FORWARD		'F'
#define SUP_REJECTED	'R'

#define SUPERVISOR_ACTION	'S'
#define TELLER_ACTION		'T'

#define IDEXPIRYACTION		0
#define CUSTUPDACTION		1

extern struct keydesc  userKey, custLogKey, jointLogKey, acctLogKey, ctlKey, custTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, cndKey, gldMemoKey, refreshKey, gldKey, tpinHistKey , idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey;
struct dictinfo fileInfo;
extern int   userFile, custLogFile,jointLogFile,acctLogFile, ctlFile, custTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, gldMemoFile, cndFile, refreshFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile; 
extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr, crdFile1, gldFile1;
extern int hsmKey1, hsmKey2, b24Key1, b24Key2;
extern char progName[30];
extern int PID;

extern  int page, line;
extern 	char pinOffset[4], trk1[80], trk2[40];

extern char bmAmtStr[50], dateTime[30], bankingDate[10];
extern char clientIpAddress[30];
char tCustNo[15];
extern char displayWarningMsgOnDuplicateId;

struct branchActivityOnCustomer		custLogRec, custLogRec1 ;
struct branchActivityOnJointAccounts jointLogRec;
struct branchActivityOnAccounts 	acctLogRec;
struct branchInfo					ctlRec;
struct systemConfig					systemConfigRec;
struct userProfile					userRec;
struct refreshInfo					refreshRec;
struct customerInfo					custTabRec;
struct jointAccountInfo				jointTabRec;
struct customerRangeInfo			custRangeRec;
struct crdUpdate					bmCustRec;
struct gldUpdate					bmAccRec;
struct crd0data 					crdRec;
struct gld0data						gldRec;
struct cnd0dataBR 					cndRec;
struct req0data 					reqRec;
struct gld0data05 					gldMemoRec;
struct abcList						abcRec;
struct cardInfo						cardTabRec, cardTabRec1;
struct branchActivityOnCard			cardLogRec;
struct hsmrequestmsg				hsmRequestMsg;
struct hsmreplymsg					hsmReplyMsg;
struct b24requestmsg				b24RequestMsg;
struct b24replymsg					b24ReplyMsg;
struct tpinHistory					tpinHistRec;
struct branchActivityOnId			idLogRec;
struct branchActivityOnAddress		addrLogRec;
struct calendarInfo					calendarRec;
struct idInfo						idTabRec;
struct addressInfo					addrTabRec;

extern FILE *logFp, *errLogFp, *expPrtFp;

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
extern int debug, extraDebug, loginAuthorised, userFileOpen, custLogFileOpen, custTabFileOpen,	jointLogFileOpen, acctLogFileOpen,staticFileOpen, ctlFileOpen, jointTabFileOpen,abcFileOpen, cardTabFileOpen, cardLogFileOpen, gldFileOpen, crdFileOpen, refreshFileOpen, idLogFileOpen, addrLogFileOpen, calendarFileOpen, idTabFileOpen, addrTabFileOpen, cRefLogFileOpen, cRefTabFileOpen;

updateIdLogForQuickCustomer()
{
	char tmpStr[100], tmpStr1[50];
	int idFoundFlag = NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateIdLogForQuickCustomer]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	idLogRec.liveChar = '@';
	strncpy(idLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
	strncpy(idLogRec.userId, receivedMsg.quickCustomer.userId,10);
	strncpy(idLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);
	strncpy(idLogRec.custNo, custLogRec.custNo,  7);
	idLogRec.newOrUpdate = receivedMsg.quickCustomer.newOrUpdate;
	idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
	strncpy(idLogRec.idRefNo, "0000", 4);

	idLogRec.idCategory = 'C'; /* Customer */

	if ( strncmp(receivedMsg.quickCustomer.idNo, "                                 ", 15) )
	{
		if ( receivedMsg.quickCustomer.creationOrUpdate == 'C' && 
			 receivedMsg.quickCustomer.newOrUpdate == 'U' )
		{
			retStatus = checkIdTabExistance(receivedMsg.quickCustomer.idType);
			if ( retStatus == SUCCESS )
				idLogRec.newOrUpdate = 'U';
			else
				idLogRec.newOrUpdate = 'N';
		}
		idFoundFlag = NO;

		idLogRec.idType = receivedMsg.quickCustomer.idType;
		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 29, &idLogRec.liveChar, ISGTEQ);

		while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(idLogRec.branchCode, receivedMsg.quickCustomer.branchCode, 4) ||
				 strncmp(idLogRec.userId, receivedMsg.quickCustomer.userId, 10) ||
				 strncmp(idLogRec.dateTime, receivedMsg.quickCustomer.dateTime, 14) ||
				 idLogRec.idType != receivedMsg.quickCustomer.idType )
				 break;

			if ( idLogRec.idCategory != 'C' )
				continue;

			idFoundFlag = YES;
			break;
		}

		if ( idFoundFlag == NO && receivedMsg.quickCustomer.newOrUpdate == 'U' )
			idLogRec.newOrUpdate = 'N';

		if ( idFoundFlag == NO )
		{
			memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

			idLogRec.liveChar = '@';
			strncpy(idLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
			strncpy(idLogRec.userId, receivedMsg.quickCustomer.userId,10);
			strncpy(idLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);
			strncpy(idLogRec.custNo, custLogRec.custNo,  7);
			idLogRec.newOrUpdate = receivedMsg.quickCustomer.newOrUpdate;
			idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
			strncpy(idLogRec.idRefNo, "0000", 4);

			idLogRec.idCategory = 'C'; /* Customer */
		}
		
		idLogRec.idType = receivedMsg.quickCustomer.idType;
		idLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		strncpy(idLogRec.idNo, receivedMsg.quickCustomer.idNo, 15);
		strncpy(idLogRec.idIssuedAt,receivedMsg.quickCustomer.idIssuedAt,20);
		idLogRec.idDateType = receivedMsg.quickCustomer.idDateType;
		if( receivedMsg.quickCustomer.idDateType == HIJRI ) 
		{	
			strncpy(idLogRec.idIssueDateH,receivedMsg.quickCustomer.idIssueDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idIssueDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idIssueDateG, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateH,receivedMsg.quickCustomer.idExpiryDateH,8);
			sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idExpiryDateH);
			if ( getGregDate(tmpStr) == FAILURE )
				hijriToGreg(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.gregDate, 8);

			strncpy(idLogRec.idExpiryDateG, tmpStr1, 8);
		}
		else /* GREGORIAN */
		{
			strncpy(idLogRec.idIssueDateG,receivedMsg.quickCustomer.idIssueDateG,8);
			sprintf(tmpStr,"%.8s",receivedMsg.quickCustomer.idIssueDateG);
			if ( getHijriDate(tmpStr) == FAILURE ) 
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idIssueDateH, tmpStr1, 8);
			strncpy(idLogRec.idExpiryDateG,receivedMsg.quickCustomer.idExpiryDateG,8);
			sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idExpiryDateG);
			if ( getHijriDate(tmpStr) == FAILURE )
				gregToHijri(tmpStr, tmpStr1);
			else
				strncpy(tmpStr1, calendarRec.hijriDate, 8);

			strncpy(idLogRec.idExpiryDateH, tmpStr1, 8);
		}
		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.quickCustomer.userId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( idFoundFlag  == NO )
		{
			if ( isWrite(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForQuickCustomer] ISWRITE error %d occured on stidlog for id [%c:%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while writing id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
		else
		{
			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[updateIdLogForQuickCustomer] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				return FAILURE;
			}
		}
	}

	return SUCCESS;
}

updateAddrLogForQuickCustomer()
{
	char tmpStr[100];
	char addressFoundFlag =NO, retStatus;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[updateAddrLogForQuickCustomer]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	addrLogRec.liveChar = '@';
	strncpy(addrLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
	strncpy(addrLogRec.userId, receivedMsg.quickCustomer.userId,10);
	strncpy(addrLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);
	strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
	addrLogRec.newOrUpdate = receivedMsg.quickCustomer.newOrUpdate;
	addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
	strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addressFoundFlag = NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, receivedMsg.quickCustomer.branchCode, 4) ||
			 strncmp(addrLogRec.userId, receivedMsg.quickCustomer.userId, 10) ||
			 strncmp(addrLogRec.dateTime, receivedMsg.quickCustomer.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressType, "00", 2) )
			continue;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) )
			continue;

		addressFoundFlag = YES;
		break;
	}
	if ( addressFoundFlag == NO && receivedMsg.quickCustomer.newOrUpdate == 'U' )
		addrLogRec.newOrUpdate = 'N';

	if ( addressFoundFlag == NO )
	{
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		addrLogRec.liveChar = '@';
		strncpy(addrLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
		strncpy(addrLogRec.userId, receivedMsg.quickCustomer.userId,10);
		strncpy(addrLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);
		strncpy(addrLogRec.custNo, custLogRec.custNo,  7);
		addrLogRec.bmUpdateStatus = '1'; /* Pending with supervisor */
		addrLogRec.newOrUpdate = receivedMsg.quickCustomer.newOrUpdate;
		strncpy(addrLogRec.addressNo, "0000", 4); /* for customer , always 0000 */
	}
	if ( receivedMsg.quickCustomer.creationOrUpdate == 'C' && 
		 receivedMsg.quickCustomer.newOrUpdate == 'U' )
	{
		retStatus = checkAddrTabExistance("00"); /* Check the existance of local address in staddrtab */
		if ( retStatus == SUCCESS )
			addrLogRec.newOrUpdate = 'U';
		else
			addrLogRec.newOrUpdate = 'N';
	}

	strncpy(addrLogRec.addressType, "00", 2); /* customer local/main address */

	addrLogRec.addrType = receivedMsg.quickCustomer.addressType;
	if ( receivedMsg.quickCustomer.addressType == '1' ) /* Saudi Postal address */
	{
		strncpy(addrLogRec.unitNo, receivedMsg.quickCustomer.poBox, 5);
		strncpy(addrLogRec.gprsNo, receivedMsg.quickCustomer.address1, 5);
		strncpy(addrLogRec.poBox, receivedMsg.quickCustomer.poBox, 5);
	}
	else /* PO BOX */
		strncpy(addrLogRec.poBox, receivedMsg.quickCustomer.poBox, 10);

	strncpy(addrLogRec.address1, receivedMsg.quickCustomer.address1, 30);
	strncpy(addrLogRec.address2, receivedMsg.quickCustomer.address2, 30);
	strncpy(addrLogRec.cityName, receivedMsg.quickCustomer.cityName, 20);
	strncpy(addrLogRec.zipCode, receivedMsg.quickCustomer.zipCode, 10);
	strncpy(addrLogRec.country, receivedMsg.quickCustomer.country, 3);

	strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
	strncpy(addrLogRec.lastUpdateUser, receivedMsg.quickCustomer.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( addressFoundFlag == YES )
	{
		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForQuickCustomer] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}
	else
	{
		if ( extraDebug > 4 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForQuickCustomer] Before writing to addrLogFile (%d) ..\n", getDateTime(), PID, addrLogFile);
			fflush(logFp);
		}
		if ( isWrite(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[updateAddrLogForQuickCustomer] ISWRITE error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);

			sprintf(tmpStr, "Error %d while writing address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			return FAILURE;
		}
	}

	return SUCCESS;
}

processQuickCustRequest() 
{
	char tmpStr[100], tmpStr1[100], tmpCustNo[20];
	char recdIdType, recdIdNo[20];
	int i, mode,pendingStatus;
	char *isLogPathName;
	int isappLogFp ;
	int zeroUpdateReqd = NO;
	int errorNo;
	long oldSigMask;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest]\n", getDateTime(), PID);
		fflush(logFp);
	}

	if ( receivedMsg.quickCustomer.dateTime[0] == NULL )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest] Date & Time [%.14s] is coming as NULL from the client; Please check & re-try your action \n", getDateTime(), PID, receivedMsg.quickCustomer.dateTime);
		fflush(logFp);
		sprintf(tmpStr, "Encountered problem in date&time;retry your action");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	/* If the Id Number, Customer short name & customer number are coming as blank, then 
	   something went wrong in the client side; so, to avoid opening customers with blank details, 
	   following validation is introduced to reject those requests 
	*/
	if ( strncmp(receivedMsg.quickCustomer.idNo, "                  ", 15) == 0 &&
		 strncmp(receivedMsg.quickCustomer.aShortName, "                                    ", 30) == 0 &&
		 strncmp(receivedMsg.quickCustomer.eShortName, "                                    ", 30) == 0 &&
		 strncmp(receivedMsg.quickCustomer.custNo, "            ", 7) == 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest]: Customer details are coming as BLANK; customer opening request rejected..\n", getDateTime(), PID);
		fflush(logFp);

		sprintf(tmpStr, "Blank information received;retry your action    ");                            
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( custLogFileOpen == YES )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
	}

	if ( idLogFileOpen == YES )
	{
		isclose(idLogFile);
		idLogFileOpen=NO;
	}

	if ( addrLogFileOpen == YES )
	{
		isclose(addrLogFile);
		addrLogFileOpen=NO;
	}

	if ( ctlFileOpen == YES )
	{
		isclose(ctlFile);
		ctlFileOpen=NO;
	}

	if ( cardTabFileOpen == YES )
	{
		isclose(cardTabFile);
		cardTabFileOpen=NO;
	}

	if ( cardLogFileOpen == YES )
	{
		isclose(cardLogFile); 
		cardLogFileOpen=NO;
	}

	if ( acctLogFileOpen == YES )
	{
		isclose(acctLogFile);
		acctLogFileOpen=NO;
	}

	readBankingDate();

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
		fprintf(logFp, "%s|%5d|[processQuickCustRequest] Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
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
		fprintf(logFp, "%s|%5d|[processQuickCustRequest]ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
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
		fprintf(logFp,"%s|%5d|[processQuickCustRequest]ISBEGIN error %d;  while customer creation \n", getDateTime(), PID, iserrno);
		fflush(logFp);
		sprintf(tmpStr, "ISBEGIN error %d while customer creation ", iserrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCustLogFile(ISMANULOCK + ISINOUT+ISTRANS)  < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCtlFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile);
		custLogFileOpen=ctlFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAcctLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCalendarFile(ISMANULOCK + ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openIdTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	/* temporary fix for Phase-II; valid until the client is changed */

	if ( strncmp(receivedMsg.quickCustomer.altBranchCode, "-Inv",4) ==  0 || receivedMsg.quickCustomer.altBranchCode[0] == NULL )
		strncpy(receivedMsg.quickCustomer.altBranchCode, "000000", 4);
	/* Phase-II fixes - ends here */


	memset(&custLogRec.liveChar,' ',sizeof custLogRec);

	if ( receivedMsg.quickCustomer.newOrUpdate == 'U' && 
		 receivedMsg.quickCustomer.creationOrUpdate == 'C' )
	{
		pendingStatus = checkPendingStatus(receivedMsg.quickCustomer.custNo);
		if( pendingStatus == SUCCESS )
		{
			isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
			custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			fprintf(logFp, "%s|%5d|[processQuickCustRequest] :Customer [%.7s] Record already in pending Status...%c; User Id [%.10s] , Branch Code [%.4s] \n", getDateTime(), PID, receivedMsg.quickCustomer.custNo, custLogRec.bmUpdateStatus, custLogRec.userId, custLogRec.branchCode);
			fflush(logFp);
			if ( custLogRec.bmUpdateStatus == '1' )
				sprintf(tmpStr, "Update is pending with supervisor of Br.[%.4s]", custLogRec.branchCode );
			else
				sprintf(tmpStr, "Update is pending with User[%.10s];Br.[%.4s]", custLogRec.userId, custLogRec.branchCode);

			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		zeroUpdateReqd = checkZeroUpdateReqd(receivedMsg.quickCustomer.custNo);

		if ( zeroUpdateReqd == YES )
		{
			memset(&custTabRec.liveChar, ' ', sizeof(custTabRec));
			strncpy(custTabRec.custNo, receivedMsg.quickCustomer.custNo, 7);
			isindexinfo(custTabFile, &custTabKey, 1);
			isstart(custTabFile, &custTabKey, 0, &custTabRec.liveChar, ISGTEQ);
			if ( isRead(custTabFile, &custTabRec.liveChar, ISEQUAL) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustRequest]: ISREAD/ISEQUAL error %d on stcusttab while reading for the customer [%.7s]  to write 0th update record in stcustlog ;IGNORED\n", getDateTime(), PID, iserrno,custTabRec.custNo);
				fflush(logFp);
			}
			else
			{
				memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

				custLogRec1.liveChar = '@';
				strncpy(custLogRec1.branchCode, receivedMsg.quickCustomer.homeBranch, 4);
				strncpy(custLogRec1.userId, "MIGRATION              ",20);
				getDateTime();
				sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
				strncpy(custLogRec1.dateTime, tmpStr, 14);
				custLogRec1.bmUpdateStatus = '9'; 
				strncpy(custLogRec1.custNo, custTabRec.custNo, 7);
				strncpy(custLogRec1.supervisorId, "MIGRATION              ", 20);
				strncpy(custLogRec1.custBranchCode, custTabRec.branchCode, 4);

				strncpy(custLogRec1.idNo,custTabRec.idNo,1024);
				custLogRec1.custType = custTabRec.custType;
				strncpy(custLogRec1.samaMainCategory, custTabRec.samaMainCategory, 4);
				strncpy(custLogRec1.lastUpdateUser,custTabRec.lastUpdateUser,34);
				if ( extraDebug > 4 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustRequest] Before writing to custLogFile (%d) for 0th Update..\n", getDateTime(), PID, custLogFile);
					fflush(logFp);
				}
				if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustRequest] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
					fflush(logFp);
					fprintf(errLogFp, "%s : processQuickCustRequest :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]\n", getDateTime(), iserrno,custLogRec1.branchCode);
					fflush(errLogFp);
				}
				else
				{
					if ( extraDebug )
						fprintf(logFp, "0th update record has been added successfully\n");
				}
			}
		}

		memset(&custLogRec.liveChar,' ',sizeof custLogRec);
		strncpy(custLogRec.branchCode,receivedMsg.quickCustomer.branchCode, 4);
		strncpy(custLogRec.userId, receivedMsg.quickCustomer.userId, 10);
		strncpy(custLogRec.dateTime,receivedMsg.quickCustomer.dateTime, 14);
		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile, &custLogKey, 0, &custLogRec.liveChar,ISGTEQ) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustRequest] :No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), PID, custLogRec.branchCode);
				fflush(logFp);
				fprintf(errLogFp, "%s :processCustRequest(): No Record found on stcustlog  for key [%.38s] ignored\n", getDateTime(), custLogRec.branchCode);
				fflush(errLogFp);
			}
			else
			{
				fprintf(logFp, "%s|%5d|[processQuickCustRequest] :CISAM Error %d occured on stcustlog for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode);
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR,tmpStr, tmpStr);
				isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
				custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if( receivedMsg.quickCustomer.creationOrUpdate == 'U' )
	{
		memset(&custLogRec.liveChar,' ',sizeof custLogRec);
		strncpy(custLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.quickCustomer.userId,10);
		strncpy(custLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);

		if ( readCustLogFile(ISEQUAL) < 0 )
		{
			isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
			custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
	     	sendResponse(responseMsg.customer.msgLen);
	     	return FAILURE;
		}

	}

	custLogRec.liveChar = '@';
	strncpy(custLogRec.branchCode,receivedMsg.quickCustomer.branchCode,4);
	strncpy(custLogRec.userId, receivedMsg.quickCustomer.userId,10);
	strncpy(custLogRec.dateTime,receivedMsg.quickCustomer.dateTime,14);
	custLogRec.newOrUpdate = receivedMsg.quickCustomer.newOrUpdate;
	custLogRec.bmUpdateStatus = receivedMsg.quickCustomer.bmUpdateStatus;
	if ( receivedMsg.quickCustomer.internalCustomer != '1' ) /* not creating internal customer; customer number will
																as part of the message for internal customers */
	{
		if ( receivedMsg.quickCustomer.newOrUpdate == 'N' && receivedMsg.quickCustomer.creationOrUpdate == 'C' )
		{
			memset(tmpCustNo, NULL, sizeof tmpCustNo);
			fprintf(logFp, "%s|%5d|[processQuickCustRequest] Getting next customer number \n", getDateTime(), PID);
			if ( getNextCustNoFromCtl(tmpCustNo) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
				custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			fprintf(logFp, "%s|%5d|[processQuickCustRequest] Obtained number=%.7s\n", getDateTime(), PID, tmpCustNo);
			strncpy(custLogRec.custNo, tmpCustNo, 7);
		}
		else
			strncpy(custLogRec.custNo, receivedMsg.quickCustomer.custNo,7);
		if ( receivedMsg.quickCustomer.creationOrUpdate ==  'C' )
		{
			if ( checkAList  || checkBList || checkCList )
			{
				recdIdType =  receivedMsg.quickCustomer.idType;
				sprintf(recdIdNo, "%.15s", receivedMsg.quickCustomer.idNo);

				if ( checkSarABCList(recdIdType, recdIdNo) == FAILURE )
				{
					isrollback();
					isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
					custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else
			{
				custLogRec.foundInAList = '0';
				custLogRec.foundInBList = '0';
				custLogRec.foundInCList = '0';
			}	

			/* Checking the ABC List is Over */

			/* Now, check for existance of the customer in stcusttab */
			recdIdType =  receivedMsg.quickCustomer.idType;
			sprintf(recdIdNo, "%.15s", receivedMsg.quickCustomer.idNo);

			if ( checkSarCustomerExistance(recdIdType, recdIdNo) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
				custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}
	else /* opening of internal customers */
	{
		strncpy(custLogRec.custNo, receivedMsg.quickCustomer.custNo,7);

		if ( receivedMsg.quickCustomer.newOrUpdate == 'N' )
		{
			if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
				custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}

			memset(&crdRec.liveChar, ' ', sizeof crdRec);
			strncpy(crdRec.accNo, (char *) actualToBmCust(custLogRec.custNo, tmpStr), 6);
			if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
			{
				if ( iserrno != 111 && iserrno != 110 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustRequest] ISREAD/ISEQUAL error %d while reading CRD0DATA for customer # %.7s[%.6s]\n", getDateTime(), PID, iserrno, custLogRec.custNo, crdRec.accNo);
					fflush(logFp);
					sprintf(tmpStr, "CISAM Error %d occured on crd0data", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
					custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else
			{
				sprintf(tmpStr, "Customer [%.7s] already exists in Bankmaster", custLogRec.custNo);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
				isrollback();
				isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
				custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			strncpy(custLogRec.custNo, receivedMsg.quickCustomer.custNo,7);

			if ( receivedMsg.individualOthers.screenSetNo == PENSION_CUSTOMER )	/* Pension Customer */ /*Complete if condition was added under Ver 1.1*/
			{
				/* For Pension customer , the customer number should be within the valid 
										 range mentioned in system configuration  */
				memset(&systemConfigRec.liveChar, ' ', sizeof systemConfigRec);
				strncpy(systemConfigRec.recType, "SC", 2);
				strncpy(systemConfigRec.systemCode, "SAR ", 4);

				isindexinfo(ctlFile, &ctlKey, 1);
				isstart(ctlFile, &ctlKey, 0, &systemConfigRec.liveChar, ISGTEQ);

				if ( isRead(ctlFile, &systemConfigRec.liveChar, ISEQUAL) <  0 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustRequest] ISREAD/ISEQUAL error %d while reading STCTLTAB for record Type [SC] & the system code as [SAR ] for Pension customer \n", getDateTime(), PID, iserrno);
					fflush(logFp);

					if ( iserrno == 111 || iserrno == 110 )
					{
						sprintf(tmpStr, "System configuration record not found.Please check");
						formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
					}
					else
					{
						sprintf(tmpStr, "System configuration record could not be read.");
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					}
					isrollback();
					isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
					custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}

				/* If the incoming customer number is not within the defined range of valid pension customer number, then throw an error to the client */
				if ( !( strncmp(custLogRec.custNo, systemConfigRec.startPensionCustNo, 7) >= 0 && 
					 strncmp(custLogRec.custNo, systemConfigRec.endPensionCustNo, 7) <= 0) )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustRequest] The incoming customer number [%.7s] is not within [%.7s] & [%.7s] (defined in stctltab); so, it is not valid pension customer number \n", getDateTime(), PID, custLogRec.custNo, systemConfigRec.startPensionCustNo, systemConfigRec.endPensionCustNo);
					fflush(logFp);

					sprintf(tmpStr, "Invalid customer number received..Please check");
					formatBranchResponse(INVALID_NUMBER, tmpStr, tmpStr);
					isrollback();
					isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
					custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
			}
			else	/*Internal customer*/
			{
				/* For internal customer , the customer number should be either < 2000 or 
										   it should be within the valid range mentioned in 
										   system configuration  */

				if ( strncmp(receivedMsg.quickCustomer.custNo, "0002000", 7) > 0 )
				{
					memset(&systemConfigRec.liveChar, ' ', sizeof systemConfigRec);
					strncpy(systemConfigRec.recType, "SC", 2);
					strncpy(systemConfigRec.systemCode, "SAR ", 4);

					isindexinfo(ctlFile, &ctlKey, 1);
					isstart(ctlFile, &ctlKey, 0, &systemConfigRec.liveChar, ISGTEQ);

					if ( isRead(ctlFile, &systemConfigRec.liveChar, ISEQUAL) <  0 )
					{
						fprintf(logFp, "%s|%5d|[processQuickCustRequest] ISREAD/ISEQUAL error %d while reading STCTLTAB for record Type [SC] & the system code as [SAR ] \n", getDateTime(), PID, iserrno);
						fflush(logFp);

						if ( iserrno == 111 || iserrno == 110 )
						{
							sprintf(tmpStr, "System configuration record not found.Please check");
							formatBranchResponse(NOT_FOUND, tmpStr, tmpStr);
						}
						else
						{
							sprintf(tmpStr, "System configuration record could not be read.");
							formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						}
						isrollback();
						isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
						custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);
						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}

					/* If the incoming customer number is not within the defined range of valid internal customer number,
					   then throw an error to the client */
					if ( !( strncmp(custLogRec.custNo, systemConfigRec.startGroupHeadCustNo, 7) > 0 && 
						 strncmp(custLogRec.custNo, systemConfigRec.endGroupHeadCustNo, 7) < 0) )
					{
						fprintf(logFp, "%s|%5d|[processQuickCustRequest] The incoming customer number [%.7s] is not within [%.7s] & [%.7s] (defined in stctltab); so, it is not valid group head customer number \n", getDateTime(), PID, custLogRec.custNo, systemConfigRec.startGroupHeadCustNo, systemConfigRec.endGroupHeadCustNo);
						fflush(logFp);

						sprintf(tmpStr, "Invalid customer number received..Please check");
						formatBranchResponse(INVALID_NUMBER, tmpStr, tmpStr);
						isrollback();
						isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
						custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);
						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
				}
			}
		}
	}

	strncpy(custLogRec.supervisorId,receivedMsg.quickCustomer.supervisorId,10);
	strncpy(custLogRec.custBranchCode,receivedMsg.quickCustomer.custBranchCode,4);
	strncpy(custLogRec.samaMainCategory, receivedMsg.quickCustomer.samaMainCategory, 2);
	strncpy(custLogRec.samaSubCategory, receivedMsg.quickCustomer.samaSubCategory, 2);

	strncpy(custLogRec.idNo,receivedMsg.quickCustomer.idNo,15);
	custLogRec.idType = receivedMsg.quickCustomer.idType;
	custLogRec.idDateType = receivedMsg.quickCustomer.idDateType;

	custLogRec.preferredLang = receivedMsg.quickCustomer.preferredLang;
	strncpy(custLogRec.nationality,receivedMsg.quickCustomer.nationality,3);

	strncpy(custLogRec.idIssuedAt,receivedMsg.quickCustomer.idIssuedAt,20);
	if( receivedMsg.quickCustomer.idDateType == HIJRI ) 
	{	
		strncpy(custLogRec.idIssueDateH,receivedMsg.quickCustomer.idIssueDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idIssueDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr,tmpStr1); 
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.idIssueDateG,tmpStr1,8);
		strncpy(custLogRec.idExpiryDateH,receivedMsg.quickCustomer.idExpiryDateH,8);
		sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idExpiryDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);

		strncpy(custLogRec.idExpiryDateG,tmpStr1,8);
	}
	else
	{
		strncpy(custLogRec.idIssueDateG,receivedMsg.quickCustomer.idIssueDateG,8);
		sprintf(tmpStr,"%.8s",receivedMsg.quickCustomer.idIssueDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.idIssueDateH, tmpStr1, 8);
		strncpy(custLogRec.idExpiryDateG,receivedMsg.quickCustomer.idExpiryDateG,8);
		sprintf(tmpStr, "%.8s", receivedMsg.quickCustomer.idExpiryDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr,tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.idExpiryDateH,tmpStr1,8);
	}
	strncpy(custLogRec.titleCode,receivedMsg.quickCustomer.titleCode,2);
	custLogRec.sexCode = receivedMsg.quickCustomer.sexCode;
	strncpy(custLogRec.businessType,receivedMsg.quickCustomer.businessType,3);
	custLogRec.dobDateType  = receivedMsg.quickCustomer.dobDateType;

	if ( receivedMsg.quickCustomer.dobDateType == HIJRI ) 
	{
		strncpy(custLogRec.dobDateH,receivedMsg.quickCustomer.dobDateH,8);
		sprintf(tmpStr,"%.8s", receivedMsg.quickCustomer.dobDateH);
		if ( getGregDate(tmpStr) == FAILURE )
			hijriToGreg(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.gregDate, 8);
		strncpy(custLogRec.dobDateG, tmpStr1, 8);
	}
	else
	{
		strncpy(custLogRec.dobDateG,receivedMsg.quickCustomer.dobDateG,8);
		sprintf(tmpStr,"%.8s", receivedMsg.quickCustomer.dobDateG);
		if ( getHijriDate(tmpStr) == FAILURE )
			gregToHijri(tmpStr, tmpStr1);
		else
			strncpy(tmpStr1, calendarRec.hijriDate, 8);
		strncpy(custLogRec.dobDateH, tmpStr1, 8);
	}

	strncpy(custLogRec.aFirstName,receivedMsg.quickCustomer.aFirstName,15);
	strncpy(custLogRec.a2ndName,receivedMsg.quickCustomer.a2ndName,15);
	strncpy(custLogRec.a3rdName,receivedMsg.quickCustomer.a3rdName,15);
	strncpy(custLogRec.aLastName,receivedMsg.quickCustomer.aLastName,15);
	strncpy(custLogRec.aShortName,receivedMsg.quickCustomer.aShortName,30);
	strncpy(custLogRec.eFirstName,receivedMsg.quickCustomer.eFirstName,15);
	strncpy(custLogRec.e2ndName,receivedMsg.quickCustomer.e2ndName,15);
	strncpy(custLogRec.e3rdName,receivedMsg.quickCustomer.e3rdName,15);
	strncpy(custLogRec.eLastName,receivedMsg.quickCustomer.eLastName,15);
	strncpy(custLogRec.eShortName,receivedMsg.quickCustomer.eShortName,30);

	custLogRec.addressType = receivedMsg.quickCustomer.addressType;
	if ( receivedMsg.quickCustomer.addressType == '1' ) /* Saudi POST */
	{
		strncpy(custLogRec.unitNo, receivedMsg.quickCustomer.poBox, 5); /* The first 5 digits of POBOX is unit No */
		strncpy(custLogRec.gprsNo, receivedMsg.quickCustomer.address1, 5); /* The first 4 digits of address1 is GPRS No */
		strncpy(custLogRec.poBox, receivedMsg.quickCustomer.poBox, 5); 

		/* For GPS address, the char '-' in the sixth character to be removed as per new Govt. Rule ; Jan 2009 */
		if ( receivedMsg.quickCustomer.address1[5] == '-' )
			receivedMsg.quickCustomer.address1[5] = ' ';
	}
	else
		strncpy(custLogRec.poBox,receivedMsg.quickCustomer.poBox, 10);

    strncpy(custLogRec.address1,receivedMsg.quickCustomer.address1,30);
	strncpy(custLogRec.address2,receivedMsg.quickCustomer.address2,30);
	strncpy(custLogRec.cityName,receivedMsg.quickCustomer.cityName,20);
	strncpy(custLogRec.zipCode,receivedMsg.quickCustomer.zipCode,10);
	strncpy(custLogRec.country,receivedMsg.quickCustomer.country,3);

	strncpy(custLogRec.supervisorComments, receivedMsg.quickCustomer.supervisorComments, 200);

	custLogRec.custType = '0'; /* customer type is moved as Consumer since the existing version should display correctly*/
	strncpy(custLogRec.altBranchCode, receivedMsg.quickCustomer.altBranchCode,4);

	custLogRec.overrideForCList = custLogRec.foundInCList;
	custLogRec.overrideForExistingCust = custLogRec.existingCustomer;
	
	if ( receivedMsg.quickCustomer.internalCustomer == '1' ) /* opening of internal customers */
	{
		if ( receivedMsg.individualOthers.screenSetNo == PENSION_CUSTOMER )	/*Ver 1.1*/
			custLogRec.createdFromQuickScreen = '3'; /* Pension customers created through quick pension screen */ /*Ver 1.1*/
		else	/*Ver 1.1*/
			custLogRec.createdFromQuickScreen = '2'; /* Internal customers created through quick screen */
	}
	else
	{
		custLogRec.createdFromQuickScreen = '1'; /* Normal customers created through quick screen */
	}

	if ( updateIdLogForQuickCustomer() == FAILURE ) /* Write/Update stidlog for Quick Customer */
	{
		isrollback();
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( updateAddrLogForQuickCustomer() == FAILURE ) /* Write/update staddrlog for Quick Customer */
	{
		isrollback();
		isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
		custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.quickCustomer.newOrUpdate == 'N' )
	{
		/* Defaulted the following 3 values to 0 to avoid quick customer getting updated by "bmstrecon" program */
		custLogRec.vipCode = '0';
		custLogRec.packageAcc = '0';
		custLogRec.residentStatus = '0';
	}

	custLogRec.cardType = receivedMsg.quickCustomer.cardType;
	custLogRec.electronIntlRequired = receivedMsg.quickCustomer.electronIntlRequired;
	strncpy(custLogRec.electronIntlName,receivedMsg.quickCustomer.electronIntlName, 26);

	/* Card Delivery is hard coded as POBOX/GPS and the statement address is copied to card delivery address */
	if ( custLogRec.addressType == '1' ) /* GPS address */
		custLogRec.deliveryToBranchOrPO = 'G' ; /* GPS */
	else
		custLogRec.deliveryToBranchOrPO = 'P' ; /* PO Box */
	strncpy(custLogRec.deliveryAddress1, receivedMsg.quickCustomer.address1, 30);
	if ( strncmp(custLogRec.businessType, "029", 3) == 0 || strncmp(custLogRec.businessType, "290", 3) == 0)
		sprintf(tmpStr, "( )(R)");
	else
		sprintf(tmpStr, "( )( )");

	sprintf(tmpStr, "%s( )BR.CODE:%.3s              ", tmpStr, &custLogRec.custBranchCode[1]);
	strncpy(custLogRec.deliveryAddress2, tmpStr, 30); 
	strncpy(custLogRec.deliveryPoBox, receivedMsg.quickCustomer.poBox, 10);
	strncpy(custLogRec.deliveryCity, receivedMsg.quickCustomer.cityName, 20);
	strncpy(custLogRec.deliveryZip, receivedMsg.quickCustomer.zipCode, 10);

	strncpy(custLogRec.lastUpdateUser, receivedMsg.quickCustomer.userId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if( receivedMsg.quickCustomer.creationOrUpdate == 'U' )
	{
		if ( isRewcurr(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustRequest] : ISREWCURR error %d on stcustlog  for the key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",custLogRec.branchCode);
				formatBranchResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcustlog" );
				formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
			custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}
	else
	{
		if ( isWrite(custLogFile, &custLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustRequest] : ISWRITE error %d on stcustlog while creating a new customer/update for key [%.38s]\n", getDateTime(), PID, iserrno, custLogRec.branchCode );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.38s]",custLogRec.branchCode);
				formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcustlog" );
				formatBranchResponse( RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
			custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}

	if ( receivedMsg.quickCustomer.newOrUpdate == 'N' )
	{
		/* Write to stacclog if any account requested */

		if ( strncmp(receivedMsg.quickCustomer.currentAccInfo,"              ",12) )
		{
			sprintf(tmpStr, "%.12s", receivedMsg.quickCustomer.currentAccInfo);
			if ( writeToAcctLog(tmpStr) == FAILURE )
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( receivedMsg.quickCustomer.cardType == ' ' ) /* If the request coming from old version */
		receivedMsg.quickCustomer.cardType = 'I';

	if ( receivedMsg.quickCustomer.newOrUpdate == 'N' && strncmp(custLogRec.custNo, "          ", 7) ) /* if it is New request and the 
																								request is not coming from 
																								static data client ver 2.3.2 
																								*/
	{
		if ( receivedMsg.quickCustomer.electronIntlRequired == '1' ) 
		{
			if ( formatAddCardRequest(receivedMsg.quickCustomer.cardType, 'N', 'P', custLogRec.electronIntlName, 8) == FAILURE ) 
			{
				isrollback();
				isclose(custLogFile); isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(acctLogFile);isclose(idLogFile);isclose(addrLogFile);
				custLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=acctLogFileOpen=idLogFileOpen=addrLogFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest] :ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custLogFile); isclose(ctlFile); isclose(idLogFile); isclose(addrLogFile); isclose(acctLogFile);isclose(cardLogFile);isclose(cardTabFile);
	custLogFileOpen=ctlFileOpen=idLogFileOpen=addrLogFileOpen=acctLogFileOpen=cardLogFileOpen=cardTabFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);
	unlink(isLogPathName);
	free(isLogPathName);

	strncpy(responseMsg.customer.custNo, custLogRec.custNo, 7);
	formatBranchResponse(DONE, "Successfully Added...", "Successfully Added...");
    sendResponse(responseMsg.customer.msgLen);
	return SUCCESS;
}

processQuickCustDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[prcessQuickCustDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);

	memset(responseMsg.quickCustPendingDetail.msgLen,' ',sizeof responseMsg.quickCustPendingDetail);
	responseMsg.quickCustPendingDetail.nullPad = '\0';

	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);
	strncpy(custTabRec.custNo, receivedMsg.pendingDetail.branchCode, 7);

	isindexinfo(custTabFile, &custTabKey, 1);

	if ( isstart(custTabFile,&custTabKey,0,&custTabRec.liveChar,ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustDetail] ISSTART/ISEQUAL error %d occured on stcusttab for the customer number [%.7s] \n", getDateTime(), PID, iserrno, custTabRec.custNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatBranchResponse(END_OF_FILE, "No more Records to fetch....", "No more Records to fetch....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	if ( readCustTabFile(ISEQUAL) < 0 )
	{
		sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	/* read crd0data for the said customer */
	memset(&crdRec.liveChar, ' ', sizeof crdRec);
	strncpy(crdRec.accNo, (char *)actualToBmCust(custTabRec.custNo, tmpStr), 6);
	if ( isRead(crdFile, &crdRec.liveChar, ISEQUAL) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustDetail] ISREAD/ISEQUAL error %d occured on crd0data for the customer number [%.7s] [%.6s]\n", getDateTime(), PID, iserrno, custTabRec.custNo, crdRec.accNo);
		fflush(logFp);
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		     formatBranchResponse(END_OF_FILE, "Not found in customer register....", "Not found in customer register....");
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on crd0data", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		}
     	sendResponse(responseMsg.pendingDetail.msgLen);
		return FAILURE;
	}

	/* The following if statement is  added after giving the source code to MISYS */
	if ( getRestrictedFlag(crdRec.branchCode) == FAILURE )/* MISYS */
	{
		sprintf(tmpStr, "Branch record is missing in ctlFile [%.4s]", ctlRec.branchCode);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}/* MISYS */

	if ( receivedMsg.pendingDetail.updateFlag == '1' )
	{
		if ( custTabRec.createdFromQuickScreen == '2' ) /* internal customer */
			moveTabRecToLog(INTERNAL_CUSTOMER);
		else if ( custTabRec.createdFromQuickScreen == '3' ) /* Pension customer */
			moveTabRecToLog(PENSION_CUSTOMER);
	}

	responseMsg.quickCustPendingDetail.restrictedBranchFlag = ctlRec.updateRestricted; 

	strncpy(responseMsg.quickCustPendingDetail.custNo,custTabRec.custNo,7);
	/* If the customer created through quick pension customer opening screen, and the customer 
	   visits a branch for updating the record, then move the home branch as customer branch code 
	*/
	if ( receivedMsg.pendingDetail.updateFlag == '1' && custTabRec.createdFromQuickScreen == '3' &&
		 strncmp(custTabRec.samaMainCategory, "0099", 4) == 0 ) /* Pension customer */
		strncpy(responseMsg.quickCustPendingDetail.custBranchCode, receivedMsg.pendingDetail.homeBranch,4);
	else
		strncpy(responseMsg.quickCustPendingDetail.custBranchCode, crdRec.branchCode,4);

	strncpy(responseMsg.quickCustPendingDetail.samaMainCategory, custTabRec.samaMainCategory,  2);
	strncpy(responseMsg.quickCustPendingDetail.samaSubCategory, custTabRec.samaSubCategory, 2);

	responseMsg.quickCustPendingDetail.idType = custTabRec.idType;
	strncpy(responseMsg.quickCustPendingDetail.idNo, custTabRec.idNo, 15);
	strncpy(responseMsg.quickCustPendingDetail.idIssuedAt, custTabRec.idIssuedAt, 20);
	responseMsg.quickCustPendingDetail.idDateType = custTabRec.idDateType;
	strncpy(responseMsg.quickCustPendingDetail.idIssueDateH, custTabRec.idIssueDateH, 8);
	strncpy(responseMsg.quickCustPendingDetail.idIssueDateG, custTabRec.idIssueDateG, 8);
	strncpy(responseMsg.quickCustPendingDetail.idExpiryDateH, custTabRec.idExpiryDateH, 8);
	strncpy(responseMsg.quickCustPendingDetail.idExpiryDateG, custTabRec.idExpiryDateG, 8);

	strncpy(responseMsg.quickCustPendingDetail.address1, custTabRec.address1, 30);
	strncpy(responseMsg.quickCustPendingDetail.address2, custTabRec.address2, 30);
	strncpy(responseMsg.quickCustPendingDetail.poBox, custTabRec.poBox, 10);
	strncpy(responseMsg.quickCustPendingDetail.cityName, custTabRec.cityName, 20);
	strncpy(responseMsg.quickCustPendingDetail.zipCode, custTabRec.zipCode, 10);
	strncpy(responseMsg.quickCustPendingDetail.country, custTabRec.country, 3);
	responseMsg.quickCustPendingDetail.addrType = custTabRec.addressType;
	if ( custTabRec.addressType == '1' ) /* Saudi Postal address */
		strncpy(responseMsg.quickCustPendingDetail.poBox, custTabRec.unitNo, 5);

	responseMsg.quickCustPendingDetail.dobDateType = custTabRec.dobDateType;
	strncpy(responseMsg.quickCustPendingDetail.dobDateH, custTabRec.dobDateH, 8);
	strncpy(responseMsg.quickCustPendingDetail.dobDateG, custTabRec.dobDateG, 8);

	/* form the key for reading the custLogFile for getting the Card Information */
	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	strncpy(custLogRec.branchCode, custTabRec.branchCode,4);
	strncpy(custLogRec.userId, custTabRec.createdUserId, 20);
	strncpy(custLogRec.dateTime, custTabRec.createdDateTime,14);

	isindexinfo(custLogFile, &custLogKey, 1);
	isstart(custLogFile, &custLogKey,0, &custLogRec.liveChar, ISGTEQ);

	if ( isRead(custLogFile, &custLogRec.liveChar, ISEQUAL) == 0 )
	{
		if ( extraDebug )
		{
			fprintf(logFp, "read customer info from custlog during enquiry success \n");
			fprintf(logFp, "Card Info  : [%.209s]\n", &custLogRec.electronCardRequired);
		}
		responseMsg.quickCustPendingDetail.cardType = custLogRec.cardType ;
		strncpy(&responseMsg.quickCustPendingDetail.electronIntlRequired, &custLogRec.electronIntlRequired, 27);
	}	
   
	/* form the key for reading the Acct File  */
	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	strncpy(acctLogRec.branchCode, custTabRec.branchCode,4);
	strncpy(acctLogRec.userId, custTabRec.createdUserId, 20);
	strncpy(acctLogRec.dateTime, custTabRec.createdDateTime,14);
	memset(acctLogRec.accNo, ' ',14);
	getAcctInfo(currentAccInfo,savingsAccInfo,otherAccInfo);

	strncpy(responseMsg.quickCustPendingDetail.currentAccInfo, currentAccInfo, 11);

	memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
	strncpy(idTabRec.custNo, custTabRec.custNo, 7);
	idTabRec.idCategory = 'C';

	isindexinfo(idTabFile, &idTabKey, 6);
	isstart(idTabFile, &idTabKey, 8, &idTabRec.liveChar, ISGTEQ);

	while ( isRead(idTabFile, &idTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idTabRec.custNo, custTabRec.custNo, 7) || idTabRec.idCategory != 'C' )
			 break;

		responseMsg.quickCustPendingDetail.idType = idTabRec.idType;
		strncpy(responseMsg.quickCustPendingDetail.idNo, idTabRec.idNo, 15);
		strncpy(responseMsg.quickCustPendingDetail.idIssuedAt, idTabRec.idIssuedAt, 20);
		responseMsg.quickCustPendingDetail.idDateType = idTabRec.idDateType;
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateH, idTabRec.idIssueDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateG, idTabRec.idIssueDateG, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateH, idTabRec.idExpiryDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateG, idTabRec.idExpiryDateG, 8);
	}
	/* fields taken from crd0data */
	responseMsg.quickCustPendingDetail.preferredLang = crdRec.language;
	strncpy(responseMsg.quickCustPendingDetail.nationality, crdRec.nationality, 3);	
	strncpy(responseMsg.quickCustPendingDetail.titleCode, crdRec.titleCode, 2);
	strncpy(responseMsg.quickCustPendingDetail.businessType, crdRec.businessType, 3);	
	strncpy(responseMsg.quickCustPendingDetail.custBranchCode, crdRec.branchCode, 4);

	strncpy(responseMsg.quickCustPendingDetail.altBranchCode, crdRec.alternativeBranchCode,4);

	responseMsg.quickCustPendingDetail.sexCode = custTabRec.sexCode;
	strncpy(responseMsg.quickCustPendingDetail.aFirstName, custTabRec.aFirstName, 180); /* from aFirstname to eShortName */

	memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);
	strncpy(addrTabRec.custNo, custTabRec.custNo, 7);

	isindexinfo(addrTabFile, &addrTabKey, 1);
	isstart(addrTabFile, &addrTabKey, 7, &addrTabRec.liveChar, ISGTEQ);

	while ( isRead(addrTabFile, &addrTabRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrTabRec.custNo, custTabRec.custNo, 7) )
			 break;

		if ( strncmp(addrTabRec.addressType, "00", 2) ) /* Only customer address*/
			continue;

		if ( strncmp(addrTabRec.addressNo, "0000", 4) )
			continue;

		strncpy(responseMsg.quickCustPendingDetail.address1, addrTabRec.address1, 30);
		strncpy(responseMsg.quickCustPendingDetail.address2, addrTabRec.address2, 30);
		strncpy(responseMsg.quickCustPendingDetail.poBox, addrTabRec.poBox, 10);
		strncpy(responseMsg.quickCustPendingDetail.cityName, addrTabRec.cityName, 20);
		strncpy(responseMsg.quickCustPendingDetail.zipCode, addrTabRec.zipCode, 10);
		strncpy(responseMsg.quickCustPendingDetail.country, addrTabRec.country, 3);
		responseMsg.quickCustPendingDetail.addrType = addrTabRec.addrType;
		if ( addrTabRec.addrType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.quickCustPendingDetail.poBox, addrTabRec.unitNo, 5);
	}
	if ( custTabRec.createdFromQuickScreen == '2' ) /* Internal customers created through quick screen */
		responseMsg.quickCustPendingDetail.internalCustomer = '1';
	else
		responseMsg.quickCustPendingDetail.internalCustomer = '0';

	responseMsg.quickCustPendingDetail.foundInTList = '0';
	responseMsg.quickCustPendingDetail.details[0].englishName[0] = NULL;

	getCustomerOpenUpdateInfo(&responseMsg.quickCustPendingDetail.openUpdateInfo);

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustRequest] After returning from getCustomerOpenUpdateInfo, info is [%.64s]\n", getDateTime(), PID, responseMsg.quickCustPendingDetail.openUpdateInfo.custOpenDate);
		fflush(logFp);
	}

    formatQuickCustomerDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.quickCustPendingDetail.msgLen);
	return SUCCESS;
}

processQuickCustPendingDetail()
{
	char tmpStr[200];
	char currentAccInfo[15],savingsAccInfo[15],otherAccInfo[15];
	int  len, i, addrLogRecFound=NO, idLogRecFound=NO;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustPendingDetail]\n", getDateTime(), PID);
		fflush(logFp);
	}

	memset(currentAccInfo,' ',sizeof currentAccInfo);
	memset(savingsAccInfo,' ',sizeof savingsAccInfo);
	memset(otherAccInfo, ' ',sizeof otherAccInfo);
	memset(responseMsg.quickCustPendingDetail.msgLen,' ',sizeof responseMsg.quickCustPendingDetail);

	/* Remove NULL char from the record */
	len = sizeof custLogRec;
	for (i = 0 ; i < len; i++)
		if ( custLogRec.branchCode[i] == NULL )
			custLogRec.branchCode[i] = ' ';
	
	strncpy(responseMsg.quickCustPendingDetail.custNo, custLogRec.custNo,7); 
	strncpy(responseMsg.quickCustPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);
	strncpy(responseMsg.quickCustPendingDetail.samaMainCategory, custLogRec.samaMainCategory,  2);
	strncpy(responseMsg.quickCustPendingDetail.samaSubCategory, custLogRec.samaSubCategory, 2);

	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);
	strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(idLogRec.userId, custLogRec.userId, 10);
	strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);
	idLogRec.idType = custLogRec.idType;
	strncpy(idLogRec.idNo, custLogRec.idNo, 15);
	idLogRec.idCategory = 'C';

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 0, &idLogRec.liveChar, ISGTEQ);

	idLogRecFound=YES;
	if ( isRead(idLogFile, &idLogRec.liveChar, ISEQUAL) <  0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustPendingDetail]: ISREAD/ISEQUAL error %d occured on stidlog for key [%.28s]; idType, id number, id Category [%c;%.15s;%c] IGNORED and taken from stcustlog\n", getDateTime(), PID, iserrno, idLogRec.branchCode, idLogRec.idType, idLogRec.idNo, idLogRec.idCategory);
		fflush(logFp);
		idLogRecFound = NO;
	}

	if ( idLogRecFound == YES )
	{
		responseMsg.quickCustPendingDetail.idType = idLogRec.idType;
		strncpy(responseMsg.quickCustPendingDetail.idNo, idLogRec.idNo, 15);
		strncpy(responseMsg.quickCustPendingDetail.idIssuedAt, idLogRec.idIssuedAt, 20);
		responseMsg.quickCustPendingDetail.idDateType = idLogRec.idDateType;
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateH, idLogRec.idIssueDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateG, idLogRec.idIssueDateG, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateH, idLogRec.idExpiryDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateG, idLogRec.idExpiryDateG, 8);
	}
	else
	{
		responseMsg.quickCustPendingDetail.idType = custLogRec.idType;
		strncpy(responseMsg.quickCustPendingDetail.idNo, custLogRec.idNo, 15);
		strncpy(responseMsg.quickCustPendingDetail.idIssuedAt, custLogRec.idIssuedAt, 20);
		responseMsg.quickCustPendingDetail.idDateType = custLogRec.idDateType;
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateH, custLogRec.idIssueDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idIssueDateG, custLogRec.idIssueDateG, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateH, custLogRec.idExpiryDateH, 8);
		strncpy(responseMsg.quickCustPendingDetail.idExpiryDateG, custLogRec.idExpiryDateG, 8);
	}

	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);
	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	addrLogRecFound=NO;
	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10 ) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )

			 break;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer address */
			continue;

		if ( strncmp(addrLogRec.addressType, "00", 2) == 0 ) /* customer main/local address */
		{
			addrLogRecFound = YES;
			strncpy(responseMsg.quickCustPendingDetail.address1, addrLogRec.address1, 30);
			strncpy(responseMsg.quickCustPendingDetail.address2, addrLogRec.address2, 30);
			strncpy(responseMsg.quickCustPendingDetail.poBox, addrLogRec.poBox, 10);
			strncpy(responseMsg.quickCustPendingDetail.cityName, addrLogRec.cityName, 20);
			strncpy(responseMsg.quickCustPendingDetail.zipCode, addrLogRec.zipCode, 10);
			strncpy(responseMsg.quickCustPendingDetail.country, addrLogRec.country, 3);
			responseMsg.quickCustPendingDetail.addrType = addrLogRec.addrType;
			if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
				strncpy(responseMsg.quickCustPendingDetail.poBox, addrLogRec.unitNo, 5);
		}
	}

	if ( addrLogRecFound == NO )
	{
		strncpy(responseMsg.quickCustPendingDetail.address1, custLogRec.address1, 30);
		strncpy(responseMsg.quickCustPendingDetail.address2, custLogRec.address2, 30);
		strncpy(responseMsg.quickCustPendingDetail.poBox, custLogRec.poBox, 10);
		strncpy(responseMsg.quickCustPendingDetail.cityName, custLogRec.cityName, 20);
		strncpy(responseMsg.quickCustPendingDetail.zipCode, custLogRec.zipCode, 10);
		strncpy(responseMsg.quickCustPendingDetail.country, custLogRec.country, 3);
		responseMsg.quickCustPendingDetail.addrType = custLogRec.addressType;
		if ( custLogRec.addressType == '1' ) /* Saudi Postal address */
			strncpy(responseMsg.quickCustPendingDetail.poBox, custLogRec.unitNo, 5);
	}

	responseMsg.quickCustPendingDetail.dobDateType = custLogRec.dobDateType;
	strncpy(responseMsg.quickCustPendingDetail.dobDateH, custLogRec.dobDateH, 8);
	strncpy(responseMsg.quickCustPendingDetail.dobDateG, custLogRec.dobDateG, 8);

	responseMsg.quickCustPendingDetail.preferredLang = custLogRec.preferredLang;
	strncpy(responseMsg.quickCustPendingDetail.nationality, custLogRec.nationality, 3);
	strncpy(responseMsg.quickCustPendingDetail.titleCode, custLogRec.titleCode, 2);
	responseMsg.quickCustPendingDetail.sexCode = custLogRec.sexCode;
	strncpy(responseMsg.quickCustPendingDetail.businessType, custLogRec.businessType, 3);
	strncpy(responseMsg.quickCustPendingDetail.aFirstName, custLogRec.aFirstName, 180); /* from aFirstname to eShortName */

	responseMsg.quickCustPendingDetail.cardType = custLogRec.cardType ;
	responseMsg.quickCustPendingDetail.electronIntlRequired = custLogRec.electronIntlRequired;
	strncpy(responseMsg.quickCustPendingDetail.electronIntlName, custLogRec.electronIntlName, 26);

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);
	/* form the key for reading the Acct File  */
	strncpy(acctLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(acctLogRec.userId, custLogRec.userId, 10);
	strncpy(acctLogRec.dateTime, custLogRec.dateTime, 14);
	getAcctInfo(currentAccInfo, savingsAccInfo, otherAccInfo);

	strncpy(responseMsg.quickCustPendingDetail.currentAccInfo, currentAccInfo, 11);

	responseMsg.quickCustPendingDetail.newOrUpdate = custLogRec.newOrUpdate;
	strncpy(responseMsg.quickCustPendingDetail.altBranchCode, custLogRec.altBranchCode, 4);

	strncpy(responseMsg.quickCustPendingDetail.supervisorComments, custLogRec.supervisorComments, 200);
	if ( custLogRec.createdFromQuickScreen == '2' ) /* Internal customers created through quick screen */
		responseMsg.quickCustPendingDetail.internalCustomer = '1';
	else
		responseMsg.quickCustPendingDetail.internalCustomer = '0';

	responseMsg.quickCustPendingDetail.foundInAList = '0';
	responseMsg.quickCustPendingDetail.foundInBList = '0';
	responseMsg.quickCustPendingDetail.foundInCList = '0';
	responseMsg.quickCustPendingDetail.existingCustomer = '0';
	if ( custLogRec.newOrUpdate == 'N' &&  custLogRec.createdFromQuickScreen != '2' ) /* ABC checking does not require for internal customer */
	{
		if ( getSarABCdetails() == FAILURE )
		{
			sendResponse(responseMsg.quickCustPendingDetail.msgLen);
			return FAILURE;
		}
		/* custBranchCode is copied again to response message to avoid NULL problem when SRCHENGINE tuxedo service is not running; we ignore the failure */
		strncpy(responseMsg.quickCustPendingDetail.custBranchCode, custLogRec.custBranchCode, 4);

		responseMsg.quickCustPendingDetail.foundInAList =  abcSrchCustDetails.foundInAList;
		responseMsg.quickCustPendingDetail.foundInBList =  abcSrchCustDetails.foundInBList;
		responseMsg.quickCustPendingDetail.foundInCList =  abcSrchCustDetails.foundInCList;
		strncpy(responseMsg.quickCustPendingDetail.reportedBank, abcSrchCustDetails.reportedBank, 4);
		strncpy(responseMsg.quickCustPendingDetail.nameInABCList,abcSrchCustDetails.nameInABCList, 30);

		responseMsg.quickCustPendingDetail.foundInTList = abcSrchCustDetails.foundInTList;

		strncpy(responseMsg.quickCustPendingDetail.noOfRecs, abcSrchCustDetails.noOfRecs, 2);
		strncpy(responseMsg.quickCustPendingDetail.details, abcSrchCustDetails.details, sizeof abcSrchCustDetails.details);
		sprintf(tmpStr, "%.2s", responseMsg.quickCustPendingDetail.noOfRecs);
		responseMsg.quickCustPendingDetail.details[atoi(tmpStr)].englishName[0] = NULL;

		if ( getSarCustDetails() == FAILURE )
		{
			sendResponse(responseMsg.quickCustPendingDetail.msgLen);
			return FAILURE;
		}
		responseMsg.quickCustPendingDetail.existingCustomer = abcSrchCustDetails.existingCustomer;
		if ( abcSrchCustDetails.existingCustomer == '1' )
		{
			if ( custLogRec.newOrUpdate == 'N' )  
			{
				if ( custLogRec.idType == 'I' || custLogRec.idType == 'Q' )
				{
					if ( displayWarningMsgOnDuplicateId == NO )
						responseMsg.quickCustPendingDetail.displayWarningMsgOnDuplicateId = '0'; /* Stop opening customer */
					else
						responseMsg.quickCustPendingDetail.displayWarningMsgOnDuplicateId = '1'; /* display warning message */
				}
			}
		}
		strncpy(responseMsg.quickCustPendingDetail.existCustNo, abcSrchCustDetails.existCustNo, 7);
		strncpy(responseMsg.quickCustPendingDetail.existCustName, abcSrchCustDetails.existCustName, 30);
	}

    formatIndividualOthersDetailResponse(DONE,"Successful", "Successful"); 
	sendResponse(responseMsg.quickCustPendingDetail.msgLen);
	return SUCCESS;
}

processQuickCustomerSuperDecision(reqAction)
char reqAction; /* A - Accept; F - Forward to Teller R - Reject */
{ 
	char tmpStr[200], tmpCurrentNo[10], tmpJointNo[5], tmpAddressNo[10], *isLogPathName;
	char ibanAccNo[30];
	char tNoOfJointCust[10], tmpCustNo[15], currentDate[15];
	int noOfJoint, isappLogFp, returnError, retErr;
	long currentNo, oldSigMask;
	char tmpPackageAcc;
	char tmpAuthLevel[100];
	char *tmpPtr;
	int i;

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] with reqAction=%c\n", getDateTime(), PID, reqAction);
		fflush(logFp);
	}

	readBankingDate();
	memset(tCustNo, ' ', sizeof tCustNo); 

	memset(responseMsg.superDecision.msgLen, ' ', sizeof responseMsg.superDecision);
	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);

	/* If ForwaredToTeller or Rejected the changes; just update the log file */

	if( reqAction != SUP_ACCEPTED ) 
	{
		if ( openCustLogFile(ISMANULOCK + ISINOUT)  < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openIdLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		if ( openAddrLogFile(ISMANULOCK + ISINOUT) < 0 )
		{
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/*Update stcustlog file to include supervisorId and his comments*/

		strncpy(custLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
		strncpy(custLogRec.userId, receivedMsg.supDecision.userId,10);
		strncpy(custLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

		isindexinfo(custLogFile, &custLogKey, 1);
		if ( isstart(custLogFile,&custLogKey,0,&custLogRec.liveChar,ISEQUAL) < 0 )
		{
			if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
				 formatSuperDecisionResponse(END_OF_FILE,"No customer Record(s) found for this key ....", "No customer Record(s) found for this key ....");
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcustlog file", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( readCustLogFile(ISEQUAL+ISLOCK) < 0 )
		{
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		/* The following 7 lines were added to prevent two supervisor approving the same pending record  */

		if ( custLogRec.bmUpdateStatus == '9' || custLogRec.bmUpdateStatus == '3' )  /* approved or rejected */
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]: This customer record has already been approved by %.20s [%c] and the customer number assigned is [%.7s] while rejection/forwarding\n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
			fflush(logFp);
			sprintf(tmpStr," This Record has already approved by %.20s", custLogRec.supervisorId);
			formatSuperDecisionResponse(INCORRECTMSG,tmpStr,tmpStr); 
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		if ( reqAction == SUP_FORWARD )
			custLogRec.bmUpdateStatus = '2';  /* 2 is for Pending with Teller */
		else
		{
			custLogRec.bmUpdateStatus = '3';  /* 3 is for Rejecting the entry */
			if ( custLogRec.newOrUpdate == 'N' && custLogRec.electronIntlRequired == '1' && strncmp(custLogRec.custNo, "          ", 7) )
			{
				if ( openCardLogFile(ISMANULOCK + ISINOUT)  < 0 )
				{
					fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision()]: ISOPEN error %d on stcardlog, IGNORED \n", getDateTime(), PID, iserrno);
					fflush(errLogFp);
				}

				if ( openCardTabFile(ISMANULOCK + ISINOUT) < 0 )
				{
					fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision()]: ISOPEN error %d on stcardtab, IGNORED \n", getDateTime(), PID, iserrno);
					fflush(errLogFp);
				}

				isindexinfo(cardTabFile, &cardTabKey, 1);
				memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);
				isstart(cardTabFile, &cardTabKey, 0, &cardTabRec.liveChar, ISGTEQ);

				memset(&cardLogRec.liveChar, ' ', sizeof cardLogRec);

				strncpy(cardLogRec.branchCode, custLogRec.branchCode,4);
				strncpy(cardLogRec.userId, custLogRec.userId, 10);
				strncpy(cardLogRec.dateTime, custLogRec.dateTime,14);
				isindexinfo(cardLogFile, &cardLogKey, 1);
				if ( isstart(cardLogFile,&cardLogKey,28,&cardLogRec.liveChar,ISGTEQ) < 0 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]: ISSTART error %d on stcardlog for the key [%.28s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode);
					fflush(logFp);
					if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
					{
						fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision()]: No Record found in stcardlog for the key [%.28s]\n", getDateTime(), PID, cardLogRec.branchCode);
					}
					else
					{
						fprintf(errLogFp, "%s|%5d|[processSuperDecision()]: CISAM error %d occured on stcardlog for the key [%.28s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode);
						fflush(errLogFp);
					}
				}

				while ( isRead(cardLogFile, &cardLogRec.liveChar, ISNEXT) == 0 )
				{
					if ( strncmp(cardLogRec.branchCode, custLogRec.branchCode, 4) ||
						 strncmp(cardLogRec.userId, custLogRec.userId, 10)  ||
						 strncmp(cardLogRec.dateTime, custLogRec.dateTime,14) )
						 break;

					memset(&cardTabRec.liveChar, ' ', sizeof cardTabRec);

					strncpy(cardTabRec.cardNo, cardLogRec.cardNo, 19);
					if ( readCardTabFile(ISEQUAL) < 0 )
					{
						fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision()]: ISREAD/ISEQUAL error %d on stcardtab for the card # [%.19s]\n", getDateTime(), PID, iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}

					if ( isDelcurr(cardTabFile, &cardTabRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision]: ISDELCURR error %d on stcardtab for the card # [%.19s]\n", getDateTime(), PID, iserrno, cardTabRec.cardNo);
						fflush(errLogFp);
					}

					if ( isDelcurr(cardLogFile, &cardLogRec.liveChar) < 0 )
					{
						fprintf(errLogFp, "%s|%5d|[processQuickCustomerSuperDecision]: ISDELCURR error %d on stcardlog for the key [%.28s] and the card # [%.19s]\n", getDateTime(), PID, iserrno, cardLogRec.branchCode, cardLogRec.cardNo);
						fflush(errLogFp);
					}
				}
			}
		}

		strncpy(custLogRec.supervisorId, receivedMsg.supDecision.supervisorId, 10);
		strncpy(custLogRec.supervisorComments, receivedMsg.supDecision.supervisorComments, 200);
		strncpy(custLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( updateCustLogFile() < 0)
		{
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}

		/* Read corresponding ID log record */
		memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

		strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
		strncpy(idLogRec.userId, custLogRec.userId, 10);
		strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);

		isindexinfo(idLogFile, &idLogKey, 1);
		isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

		while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
				 strncmp(idLogRec.userId, custLogRec.userId, 10) ||
				 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) )
				 break;

			idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus ; 

			strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		/* Read corresponding Address log record */
		memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

		strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
		strncpy(addrLogRec.userId, custLogRec.userId, 10);
		strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

		isindexinfo(addrLogFile, &addrLogKey, 1);
		isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

		while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
		{
			if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
				 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
				 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
				 break;

			addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

			strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
			strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
			getDateTime();
			sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
			strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

			if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
				fflush(logFp);

				sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}

		closeAllFiles();
		strcpy(tmpStr,"Successful");
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}

	/* HENCEFORTH ONLY IF SUPERVISOR APPROVES */

	/* Portion introduced for atomic update */
	
	if ( custTabFileOpen == YES )
	{
		isclose(custTabFile); 
		custTabFileOpen=NO;
	}
	if ( custLogFileOpen == YES )
	{
		isclose(custLogFile); 
		custLogFileOpen=NO;
	}
	if ( ctlFileOpen == YES )
	{
		isclose(ctlFile);
		ctlFileOpen=NO;
	}
	if ( idLogFileOpen == YES )
	{
		isclose(idLogFile);
		idLogFileOpen=NO;
	}
	if ( idTabFileOpen == YES )
	{
		isclose(idTabFile);
		idTabFileOpen=NO;
	}
	if ( cardTabFileOpen == YES )
	{
		isclose(cardTabFile);
		cardTabFileOpen=NO;
	}
	if ( cardLogFileOpen == YES )
	{
		isclose(cardLogFile);
		cardLogFileOpen=NO;
	}
	if ( acctLogFileOpen == YES )
	{
		isclose(acctLogFile); 
		acctLogFileOpen=NO;
	}
	if ( addrLogFileOpen == YES )
	{
		isclose(addrLogFile);
		addrLogFileOpen=NO;
	}
	if ( addrTabFileOpen == YES )
	{
		isclose(addrTabFile);
		addrTabFileOpen=NO;
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
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]Error %d while creating CISAM log file %s\n", getDateTime(), PID, errno,  isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while creating CISAM log file ", errno);
		formatSuperDecisionResponse( INTERNALERR, tmpStr, tmpStr );
		sigsetmask(oldSigMask);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	close(isappLogFp);
	if ( islogopen(isLogPathName) < 0 )
	{
		perror(isLogPathName);
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]ISLOGOPEN error %d on %s\n", getDateTime(), PID, iserrno, isLogPathName);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while opening CISAM log file ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( isbegin() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]ISBEGIN error %d;  while supervisor approval\n", getDateTime(), PID, iserrno);
		sprintf(tmpStr, "ISBEGIN error %d while supervisor approval", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	if ( openCustLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openAcctLogFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);
		custLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openCustTabFile(ISMANULOCK + ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile);
		custLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openCtlFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) /* for Reading CustomerNo Range info */
	{
		isclose(custLogFile);isclose(custTabFile);isclose(acctLogFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openIdLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(custTabFile);isclose(ctlFile);isclose(acctLogFile);
		custLogFileOpen=custTabFileOpen=ctlFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	if ( openIdTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(custTabFile);isclose(ctlFile);isclose(idLogFile);isclose(acctLogFile);
		custLogFileOpen=custTabFileOpen=ctlFileOpen=idLogFileOpen=acctLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardRequestFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(custLogFile);isclose(acctLogFile);isclose(custTabFile);isclose(ctlFile);isclose(idTabFile);isclose(idLogFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=idTabFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCardLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 ) 
	{
		isclose(custLogFile);isclose(acctLogFile);isclose(custTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(idTabFile);isclose(idLogFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=cardTabFileOpen=idTabFileOpen=idLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrLogFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile);isclose(custTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openAddrTabFile(ISMANULOCK+ISINOUT+ISTRANS) < 0 )
	{
		isclose(custLogFile);isclose(acctLogFile);isclose(custTabFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);
		custLogFileOpen=acctLogFileOpen=custTabFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openCrdFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}
	
	if ( openTpinHistoryFile(ISMANULOCK+ISINOUT) < 0 )
	{
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.customer.msgLen);
		return FAILURE;
	}

	if ( openUserFile(ISMANULOCK+ISINOUT) < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]: ISOPEN error %d on stuser file is ignored ...\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	}

	memset(responseMsg.superDecision.msgLen, ' ', sizeof responseMsg.superDecision);

	memset(&custLogRec.liveChar, ' ', sizeof custLogRec);
	memset(&custTabRec.liveChar, ' ', sizeof custTabRec);

    /*Now,Updating the stcustlog file to include supervisorId and his comments*/

	strncpy(custLogRec.branchCode, receivedMsg.supDecision.branchCode,4);
	strncpy(custLogRec.userId, receivedMsg.supDecision.userId,10);
	strncpy(custLogRec.dateTime, receivedMsg.supDecision.dateTime,14);

	if ( readCustLogFile(ISEQUAL+ISLOCK) < 0 )
	{
		isrollback();
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	/* The following 7 lines were added to prevent two supervisor approving the same pending record  */

	if ( custLogRec.bmUpdateStatus == '9' || custLogRec.bmUpdateStatus == '3' )
				/* approved or rejected */
	{
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]: This customer record has already been approved by [%.20s] [%c] and the customer number assigned is [%.7s] while approving \n", getDateTime(), PID, custLogRec.supervisorId,custLogRec.bmUpdateStatus, custLogRec.custNo);
		fflush(logFp);
		isrollback();
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sprintf(tmpStr," This Record has already approved by %.20s", custLogRec.supervisorId);
		formatSuperDecisionResponse(INCORRECTMSG,tmpStr,tmpStr); 
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		strncpy(custTabRec.custNo, custLogRec.custNo, 7);

		if ( readCustTabFile(ISEQUAL+ISLOCK) < 0 )
		{
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( custLogRec.preferredLang == ARABIC )
		{
			if (strncmp(custTabRec.aFirstName, custLogRec.aFirstName, 60) != 0 || strncmp(custTabRec.aShortName, custLogRec.aShortName, 30 ) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
			{

				custTabRec.nameChanged = '1';
				custLogRec.nameChanged = '1';
				custTabRec.incorrectName = '0';
			}
			else
			{
				custTabRec.nameChanged = '0';
				custLogRec.nameChanged = '0';
				custTabRec.incorrectName = ' ';
			}
		}
		else /* ENGLISH CUSTOMER */
		{
			if ( strncmp(custTabRec.eFirstName, custLogRec.eFirstName, 60) != 0 || strncmp(custTabRec.eShortName, custLogRec.eShortName, 30) != 0 || custTabRec.preferredLang != custLogRec.preferredLang )
			{
				custTabRec.nameChanged = '1';
				custLogRec.nameChanged = '1';
				custTabRec.incorrectName = '0';
			}
			else
			{
				custTabRec.nameChanged = '0';
				custLogRec.nameChanged = '0';
				custTabRec.incorrectName = ' ';
			}
		}
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custLogRec.custOpenDate, bankingDate, 8);
	}

	strncpy(custLogRec.lastUpdateBmDate, bankingDate, 8);

	custLogRec.bmUpdateStatus = '9';  /* 9 is for Completed  */

	strncpy(custLogRec.supervisorId, receivedMsg.supDecision.supervisorId,10);

	/*strncpy(custLogRec.supervisorComments, receivedMsg.supDecision.supervisorComments,200); will hold only the last comment; just for information*/

	strncpy(custLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custLogRec.lastUpdateDateTime, tmpStr, 14);

	if ( updateCustLogFile() < 0 )
	{
		isrollback();
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	isrelease(custLogFile); 
	if ( extraDebug )
	{
		fprintf(logFp, "updateCustLogFile() successful\n");
		fflush(logFp);
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( custTabRec.custUpdActionTaken == '1' ) /* YES */
		{
			sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
			if ( unfreezeAccounts(tmpCustNo, CUSTUPDACTION) == FAILURE )
			{
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
			isclose(gldFile);
			gldFileOpen=NO;
			custTabRec.custUpdActionTaken = '0'; /* NO */
			strncpy(custTabRec.custUpdActionDate, "            ",8);
			custTabRec.custUpdWarningLetterGenerated = '0'; /* NO */
		}
	}

	/* Read corresponding ID log record */
	memset(&idLogRec.liveChar, ' ', sizeof idLogRec);

	strncpy(idLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(idLogRec.userId, custLogRec.userId, 10);
	strncpy(idLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(idLogFile, &idLogKey, 1);
	isstart(idLogFile, &idLogKey, 28, &idLogRec.liveChar, ISGTEQ);

	while ( isRead(idLogFile, &idLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(idLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(idLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(idLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( idLogRec.idCategory != 'C' ) /* Only customer information */
			continue;

		/* Unfreeze Accounts if expiry date is updated */
		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			sprintf(tmpStr, "%.8s", idLogRec.idExpiryDateG);
			if ( validate(tmpStr) >= 0 )  /* only valid dates to be considered */
			{
				getDateTime();
				sprintf(currentDate, "%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
				if ( strncmp(tmpStr, currentDate, 8) > 0 )
				{
					sprintf(tmpCustNo, "%.7s", custLogRec.custNo);
					if ( unfreezeAccounts(tmpCustNo) == FAILURE )
					{
						isrollback();
						isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
						custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);
						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
					isclose(gldFile);
					gldFileOpen=NO;
					idLogRec.grace1ActionTaken = '0'; /* NO */
					strncpy(idLogRec.grace1ActionDate, "            ",8);
					idLogRec.grace2ActionTaken = '0'; /* NO */
					strncpy(idLogRec.grace2ActionDate, "            ",8);
				}
			}
		}

		idLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus ; 

		strncpy(idLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(idLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(idLogFile, &idLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on stidlog for id type [%c] & id No [%.16s] custNo=[%.7s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, idLogRec.idType, idLogRec.idNo, idLogRec.custNo, idLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating id info in stidlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		/* Now , write/update stidtab for the above */

		memset(&idTabRec.liveChar, ' ', sizeof idTabRec);

		idTabRec.liveChar = '@';
		strncpy(idTabRec.custNo, idLogRec.custNo, 7);
		idTabRec.idType = idLogRec.idType;
		idTabRec.idCategory = 'C'; /* Customer */

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			isindexinfo(idTabFile, &idTabKey, 2);

			isstart(idTabFile, &idTabKey, 0, &idTabRec.liveChar, ISGTEQ);

			/*if ( readIdTabFile(ISEQUAL) == FAILURE )*/
			if ( isRead(idTabFile, &idTabRec.liveChar, ISEQUAL) < 0  )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREAD/ISEQUAL error %d on stidtab for customer # [%.7s] , id type [%c], id category [%c] \n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idCategory);
				fflush(logFp);
				if ( iserrno != 111 )
				{
					isrollback();
					isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);

					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else /* Add the record into ID table - Arul added on 29 Nov 03*/
				{
					fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] readidTabFile() cameout with 111 on stidtab for customer number [%.7s] and id type, id No [%c, %.16s] and hence added from idlogRec\n", getDateTime(), PID, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
					fflush(logFp);
					memset(&idTabRec.liveChar, ' ', sizeof idTabRec);
					idTabRec.liveChar='@';
					strncpy(idTabRec.custNo, idLogRec.custNo, 7);
					idTabRec.idType = idLogRec.idType;
					strncpy(idTabRec.idNo, idLogRec.idNo, 15);
					idTabRec.idCategory = idLogRec.idCategory; /* Joint */
					strncpy(idTabRec.idIssuedAt, idLogRec.idIssuedAt, 20);
					idTabRec.idDateType = idLogRec.idDateType;
					strncpy(idTabRec.idIssueDateH, idLogRec.idIssueDateH, 8);
					strncpy(idTabRec.idIssueDateG, idLogRec.idIssueDateG, 8);
					strncpy(idTabRec.idExpiryDateH, idLogRec.idExpiryDateH, 8);
					strncpy(idTabRec.idExpiryDateG, idLogRec.idExpiryDateG, 8);
					strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
					idTabRec.newOrUpdate = 'N';
					strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
					strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
					strncpy(idTabRec.lastUpdateUser, idLogRec.lastUpdateUser, 10);
					strncpy(idTabRec.lastUpdateDateTime, idLogRec.lastUpdateDateTime, 14);
					if ( isWrcurr(idTabFile, &idTabRec.liveChar) < 0 )
					{
						fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISWRCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
						fflush(logFp);
						sprintf(tmpStr, "Error %d while writing customer Id in stidtab", iserrno);
						formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
						isrollback();
						isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
						custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
						sigsetmask(oldSigMask);
						unlink(isLogPathName);
						free(isLogPathName);
						sendResponse(responseMsg.customer.msgLen);
						return FAILURE;
					}
				}
			}
		}

		strncpy(idTabRec.idNo, idLogRec.idNo, 69); /* from id number to id expiry date */
		strncpy(idTabRec.idRefNo, idLogRec.idRefNo, 4);
		idTabRec.newOrUpdate = idLogRec.newOrUpdate;

		strncpy(idTabRec.lastUpdateBmDate, bankingDate, 8);
		/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
		if ( idLogRec.newOrUpdate == 'N' )
		{
			strncpy(idTabRec.createdUserId, idLogRec.userId, 10);
			strncpy(idTabRec.createdDateTime, idLogRec.dateTime, 14);
		}

		idTabRec.grace1ActionTaken = idLogRec.grace1ActionTaken ; 
		strncpy(idTabRec.grace1ActionDate, idLogRec.grace1ActionDate, 8);
		idTabRec.grace2ActionTaken = idLogRec.grace2ActionTaken ; 
		strncpy(idTabRec.grace2ActionDate, idLogRec.grace2ActionDate, 8);

		strncpy(idTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(idTabRec.lastUpdateDateTime, tmpStr, 14);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( idLogRec.newOrUpdate == 'U' )
		{
			if ( isRewcurr(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			if ( isWrite(idTabFile, &idTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISWRITE error %d on stidtab for customer number [%.7s] and id type, id No [%c, %.16s]\n", getDateTime(), PID, iserrno, idTabRec.custNo, idTabRec.idType, idTabRec.idNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while writing stidtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( deleteUnwantedIdTabRecord() == FAILURE )
		{
			sprintf(tmpStr, "Error %d while deleting id info in stidtab", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);

			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}
	}


	/* Read corresponding Address log record */
	memset(&addrLogRec.liveChar, ' ', sizeof addrLogRec);

	strncpy(addrLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(addrLogRec.userId, custLogRec.userId, 10);
	strncpy(addrLogRec.dateTime, custLogRec.dateTime, 14);

	isindexinfo(addrLogFile, &addrLogKey, 1);
	isstart(addrLogFile, &addrLogKey, 28, &addrLogRec.liveChar, ISGTEQ);

	while ( isRead(addrLogFile, &addrLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(addrLogRec.branchCode, custLogRec.branchCode, 4) ||
			 strncmp(addrLogRec.userId, custLogRec.userId, 10) ||
			 strncmp(addrLogRec.dateTime, custLogRec.dateTime, 14) )
			 break;

		if ( strncmp(addrLogRec.addressNo, "0000", 4) ) /* Customer Address No , For joint, it will start with 0001 */
			continue;

		addrLogRec.bmUpdateStatus = custLogRec.bmUpdateStatus;

		strncpy(addrLogRec.lastUpdateBmDate, bankingDate, 8);
		strncpy(addrLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrLogRec.lastUpdateDateTime, tmpStr, 14);

		if ( isRewcurr(addrLogFile, &addrLogRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on staddrlog for customer number [%.7s] & address type & address no [%.2s:%.4s] and the key is [%.28s]\n", getDateTime(), PID, iserrno, addrLogRec.custNo, addrLogRec.addressType, addrLogRec.addressNo, addrLogRec.branchCode);
			fflush(logFp);
			sprintf(tmpStr, "Error %d while updating address info in staddrlog", iserrno);
			formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.customer.msgLen);
			return FAILURE;
		}

		memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

		addrTabRec.liveChar = '@';
		strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
		strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
		strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( addrLogRec.newOrUpdate == 'U' )
		{
			if ( isRead(addrTabFile, &addrTabRec.liveChar, ISEQUAL) < 0 )
			{
				if ( iserrno != 111 )
				{
					fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					fflush(logFp);
					sprintf(tmpStr, "Error %d occured while reading staddrtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
					isrollback();
					isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
					custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
					sigsetmask(oldSigMask);
					unlink(isLogPathName);
					free(isLogPathName);
					sendResponse(responseMsg.customer.msgLen);
					return FAILURE;
				}
				else /* add a new record into address table - Arul added on 29 Nov 03 */
				{
					fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREAD/ISEQUAL error %d on staddrtab for customer # [%.7s] , address type [%.2s], address number [%.4s] and hence treted as New \n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
					memset(&addrTabRec.liveChar, ' ', sizeof addrTabRec);

					addrTabRec.liveChar = '@';
					strncpy(addrTabRec.custNo, addrLogRec.custNo, 7);
					strncpy(addrTabRec.addressType, addrLogRec.addressType, 2);
					strncpy(addrTabRec.addressNo, addrLogRec.addressNo, 4);
					addrLogRec.newOrUpdate = 'N';
				}
			}
		}

		strncpy(addrTabRec.address1, addrLogRec.address1, 207);
		addrTabRec.addrType = addrLogRec.addrType;
		if ( addrLogRec.addrType == '1' ) /* Saudi Postal address */
		{
			strncpy(addrTabRec.unitNo, addrLogRec.unitNo, 5);
			strncpy(addrTabRec.gprsNo, addrLogRec.gprsNo, 5);
			strncpy(addrTabRec.poBox, addrLogRec.poBox, 5);
		}

		strncpy(addrTabRec.lastUpdateBmDate, bankingDate, 8);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'N' )*/
		if ( addrLogRec.newOrUpdate == 'N' )
		{
			strncpy(addrTabRec.createdUserId, addrLogRec.userId, 10);
			strncpy(addrTabRec.createdDateTime, addrLogRec.dateTime, 14);
		}
		addrTabRec.newOrUpdate = addrLogRec.newOrUpdate;

		strncpy(addrTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(addrTabRec.lastUpdateDateTime, tmpStr, 14);

		/*if ( receivedMsg.supDecision.newOrUpdate == 'U' )*/
		if ( addrLogRec.newOrUpdate == 'U' )
		{
			if ( isRewcurr(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISREWCURR error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				sprintf(tmpStr, "Error %d while updating staddrtab; Contact Support", iserrno);
				formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
		else
		{
			if ( extraDebug > 4 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] Before writing to addrTabFile (%d) ..\n", getDateTime(), PID, addrTabFile);
				fflush(logFp);
			}
			if ( isWrite(addrTabFile, &addrTabRec.liveChar) < 0 )
			{
				fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] ISWRITE error %d on staddrtab for customer number [%.7s] and address type [%.2s], address No [%.4s]\n", getDateTime(), PID, iserrno, addrTabRec.custNo, addrTabRec.addressType, addrTabRec.addressNo);
				fflush(logFp);
				if  ( iserrno == 100 )
				{
					sprintf(tmpStr, "Duplicate record [%.7s] on staddrtab", addrTabRec.custNo);
					formatBranchResponse(DUPLICATE, tmpStr, tmpStr);
				}
				else if ( iserrno == 107 || iserrno == 113 )
				{
					sprintf(tmpStr, "Record/File locked on staddrtab"); 
					formatBranchResponse(RECORD_LOCKED, tmpStr, tmpStr);
				}
				else
				{
					sprintf(tmpStr, "CISAM Error %d occured on staddrtab", iserrno);
					formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
				}
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.customer.msgLen);
				return FAILURE;
			}
		}
	}/* while read(addrLogFile)  */

	/* insert one more record in stcustlog from stcusttab for keeping track 
	   of the updates (0th Update)
	 */

	if (strncmp(custTabRec.lastUpdateUser,"MIGRATION            ",15) == 0 &&
		receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		memset(&custLogRec1.liveChar, ' ', sizeof(custLogRec1));	

		strncpy(&custLogRec1.liveChar, &custLogRec.liveChar, sizeof custLogRec);
		strncpy(custLogRec1.userId, "MIGRATION              ",20);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(custLogRec1.dateTime, tmpStr, 14);
		custLogRec1.bmUpdateStatus = '9'; 

		strncpy(custLogRec1.idNo,custTabRec.idNo,1024);
		strncpy(custLogRec1.lastUpdateUser,custTabRec.lastUpdateUser,34);
		if ( isWrite(custLogFile, &custLogRec1.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] : ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), PID, iserrno,custLogRec1.branchCode);
			fflush(logFp);
			fprintf(errLogFp, "%s : processSuperDecision :ISWRITE error %d on stcustlog while creating a 0th update record for key [%.38s]; IGNORED\n", getDateTime(), iserrno,custLogRec1.branchCode);
			fflush(errLogFp);
		}
		else
		{
			if ( extraDebug )
				fprintf(logFp, "0th update record has been added successfully\n");
		}
	}

	/* add/update a record to custTab */

	custTabRec.liveChar = '@';

	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		strncpy(custTabRec.custNo,custLogRec.custNo,7);
		strncpy(custTabRec.custOpenDate, bankingDate, 8);
	}

	strncpy(custTabRec.lastUpdateBmDate, bankingDate, 8);

	strncpy(custTabRec.branchCode,custLogRec.custBranchCode,4); /* Earlier, this line was kept inside newOrUpdate = 'N' if group */  																/* MISYS */
	if ( receivedMsg.supDecision.newOrUpdate == 'N' )
	{
		/*strncpy(custTabRec.branchCode,custLogRec.custBranchCode,4); */
		strncpy(custTabRec.createdUserId, custLogRec.userId,20);
		strncpy(custTabRec.createdDateTime, custLogRec.dateTime,14);
	}

	if( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		strncpy(tNoOfJointCust, custTabRec.noOfJointCustomer, 2);
	}

	strncpy(custTabRec.idNo, custLogRec.idNo,1024); 

	if( receivedMsg.supDecision.newOrUpdate == 'U' )
		strncpy(custTabRec.noOfJointCustomer, tNoOfJointCust, 2);

	if ( strncmp(&custTabRec.mobileNo[2], "               ", 8) == 0 )
		strncpy(custTabRec.mobileNo, "                   ", 10 );
										
	custTabRec.custType = custLogRec.custType;  /* Customer type is moved since the existing should be able to enquire */
	strncpy(custTabRec.samaMainCategory, custLogRec.samaMainCategory, 2);
	strncpy(custTabRec.samaSubCategory, custLogRec.samaSubCategory, 2);

	strncpy(custTabRec.altBranchCode, custLogRec.altBranchCode,4);
	custTabRec.createdFromQuickScreen = custLogRec.createdFromQuickScreen;

	custTabRec.overrideForCList = custLogRec.overrideForCList;
	custTabRec.overrideForExistingCust = custLogRec.overrideForExistingCust;

	strncpy(custTabRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
	getDateTime();
	sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
	strncpy(custTabRec.lastUpdateDateTime, tmpStr, 14);

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( isRewcurr(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] : ISREWCURR error %d on stcusttab for the key [%.7s]\n", getDateTime(), PID, iserrno, custTabRec.custNo );
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.7s] on stcusttab",custTabRec.custNo);
				formatSuperDecisionResponse( DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcusttab" );
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{ 
				sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		isrelease(custTabFile); 
		if ( extraDebug )
		{
			fprintf(logFp, " update action : isrewcurr on stcusttab successful\n");
			fflush(logFp);
		}
	}
	else
	{
		if ( isWrite(custTabFile, &custTabRec.liveChar) < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] : ISWRITE error %d on stcusttab for key=%.7s\n", getDateTime(), PID, iserrno, custTabRec.custNo);
			fflush(logFp);
			if  ( iserrno == 100 || iserrno == 108 )
			{
				sprintf(tmpStr, "Duplicate record [%.7s] on stcusttab", custTabRec.custNo);
				formatSuperDecisionResponse(DUPLICATE, tmpStr, tmpStr);
			}
			else if ( iserrno == 107 || iserrno == 113 )
			{
				sprintf(tmpStr, "Record/File locked on stcusttab"); 
				formatSuperDecisionResponse(RECORD_LOCKED, tmpStr, tmpStr);
			}
			else
			{
				sprintf(tmpStr, "CISAM Error %d occured on stcusttab", iserrno);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			}
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "add action : iswrite on stcusttab successful\n");
			fflush(logFp);
		}
	}

	/* update BankMaster  */

	memset( bmCustRec.custNo, ' ', sizeof bmCustRec );

	strncpy(bmCustRec.custNo, custTabRec.custNo,7);

	bmCustRec.newOrUpdate =  receivedMsg.supDecision.newOrUpdate;
	strncpy(bmCustRec.branchCode, custLogRec.custBranchCode,4);
	bmCustRec.customerType = custLogRec.custType;
	bmCustRec.languageCode = custLogRec.preferredLang;
	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		bmCustRec.nameUpdateRequired = custTabRec.nameChanged;
		bmCustRec.addressUpdateRequired = custTabRec.addressChanged;
	}
	else
	{
		bmCustRec.nameUpdateRequired = '1';
		bmCustRec.addressUpdateRequired = '1';
	}

	if( custLogRec.preferredLang == ARABIC )
	{
		strncpy(bmCustRec.firstName, custLogRec.aFirstName, 15);
		strncpy(bmCustRec.secondName,custLogRec.a2ndName, 15);
		strncpy(bmCustRec.thirdName, custLogRec.a3rdName, 15);
		strncpy(bmCustRec.lastName, custLogRec.aLastName, 15);
		if ( strncmp(custLogRec.aShortName, "                               ", 30) )
			strncpy(bmCustRec.shortName, custLogRec.aShortName, 30);
		else
			strncpy(bmCustRec.shortName, custLogRec.eShortName, 30);
	}
	else
	{
		strncpy(bmCustRec.firstName, custLogRec.eFirstName, 15);
		strncpy(bmCustRec.secondName,custLogRec.e2ndName, 15);
		strncpy(bmCustRec.thirdName, custLogRec.e3rdName, 15);
		strncpy(bmCustRec.lastName, custLogRec.eLastName, 15);
		if ( strncmp(custLogRec.eShortName, "                               ", 30) )
			strncpy(bmCustRec.shortName, custLogRec.eShortName, 30);
		else
			strncpy(bmCustRec.shortName, custLogRec.aShortName, 30);
	}

	if ( custLogRec.dobDateType == HIJRI ) 
		strncpy( bmCustRec.dateOfBirth, custLogRec.dobDateH, 8 );
	else
		strncpy( bmCustRec.dateOfBirth, custLogRec.dobDateG, 8 );
	strncpy(bmCustRec.address1, custLogRec.address1, 30);
	strncpy(bmCustRec.address2, custLogRec.address2, 30);
	strncpy(bmCustRec.poBox, custLogRec.poBox, 10);
	strncpy(bmCustRec.cityName, custLogRec.cityName, 15);
	strncpy(bmCustRec.zipCode, custLogRec.zipCode, 8);
	strncpy(bmCustRec.nationalityCode, custLogRec.nationality,3);
	bmCustRec.sexCode = custLogRec.sexCode;
	bmCustRec.idType = custLogRec.idType;
	strncpy(bmCustRec.idNo, custLogRec.idNo,15);
	strncpy(bmCustRec.businessType, custLogRec.businessType, 3);
	strncpy(bmCustRec.titleCode, custLogRec.titleCode, 2 );
	strncpy(bmCustRec.altBranchCode, custLogRec.altBranchCode, 4);
	bmCustRec.addressType = custLogRec.addressType;
	strncpy(bmCustRec.primaryMemo, receivedMsg.supDecision.primaryAcc,5);
	strncpy(bmCustRec.gprsNo, custLogRec.gprsNo, 8);
	strncpy(bmCustRec.unitNo, custLogRec.unitNo, 5);
	strncpy(bmCustRec.saudiPostalZipCode, custLogRec.zipCode, 10); 
	bmCustRec.nullPad = '\0';

	if ( extraDebug )
	{
		fprintf(logFp, "About to update BM customer register\n");
		fflush(logFp);
	}
	if ( (returnError = updateCrd(bmCustRec)) != SUCCESS )
	{
		sprintf(tmpStr,"Error %d occured while updating CustInfo in BM", returnError);
		fprintf(logFp,"%s|%5d|[processQuickCustomerSuperDecision] : Error %d occured while updating CustInfo in BM for the key [%.7s]\n", getDateTime(), PID, returnError, bmCustRec.custNo);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		isrollback();
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		sigsetmask(oldSigMask);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return FAILURE;
	}
	if ( extraDebug )
	{
		fprintf(logFp, "BM customer register update successful\n");
		fflush(logFp);
	}

	/* Successfully wrote into bankmaster  */

	if ( receivedMsg.supDecision.newOrUpdate == 'U' )
	{
		if ( iscommit() < 0 )
		{
			fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision]ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
			fprintf(errLogFp, "%s : processSuperDecision : ISCOMMIT error %d ; ignored \n", getDateTime(), iserrno); 
			fflush(errLogFp);
		/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
			sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			unlink(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			sigsetmask(oldSigMask);
			return FAILURE;
		*/
		}
		isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
		custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
		islogclose();
		sigsetmask(oldSigMask);
		strcpy(tmpStr,"Successful");
		if ( extraDebug )
		{
			fprintf(logFp, "Supervisor update decision action successful\n");
			fflush(logFp);
		}
		formatSuperDecisionResponse(DONE, tmpStr, tmpStr);
		unlink(isLogPathName);
		free(isLogPathName);
		sendResponse(responseMsg.superDecision.msgLen);
		return SUCCESS;
	}

	/* update account details in acctLog */

	memset(&acctLogRec.liveChar, ' ', sizeof acctLogRec);

	strncpy(acctLogRec.branchCode, custLogRec.branchCode, 4);
	strncpy(acctLogRec.userId, custLogRec.userId, 20);
	strncpy(acctLogRec.dateTime, custLogRec.dateTime, 14);

	if ( extraDebug )
		fprintf(logFp, "account key  : %.38s\n", acctLogRec.branchCode);

	isindexinfo(acctLogFile, &acctLogKey,1);

	if ( isstart(acctLogFile, &acctLogKey, 0, &acctLogRec.liveChar,ISGTEQ) < 0 )
	{
		if ( iserrno == 110 || iserrno == 112 || iserrno == 111 )
		{
			fprintf(logFp,"%s|%5d|[processQuickCustomerSuperDecision] : No Account details found for the key %.38s ignored\n", getDateTime(), PID, acctLogRec.branchCode);
			fflush(logFp);
			fprintf(errLogFp,"%s : processSuperDecision() : No Account details found for the key %.38s ignored\n", getDateTime(), acctLogRec.branchCode);
			fflush(errLogFp);
		}
		else
		{
			sprintf(tmpStr, "CISAM Error %d occured on stacclog file", iserrno);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
	}

	memset(ibanAccNo, ' ', sizeof ibanAccNo);
	while ( isRead(acctLogFile, &acctLogRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(receivedMsg.supDecision.branchCode, acctLogRec.branchCode, 4) != 0 || strncmp(receivedMsg.supDecision.userId, acctLogRec.userId, 10) != 0 || strncmp(receivedMsg.supDecision.dateTime, acctLogRec.dateTime, 14) != 0)
			break;
	
		if ( acctLogRec.droppedAcc == '1' ) /* 1 for DroppedAcc */
			continue;

		sprintf(tmpStr,"%.5s%.7s%.2s",acctLogRec.accNo,custLogRec.custNo,"00");

		strncpy(acctLogRec.accNo,tmpStr,14);
		strncpy(acctLogRec.accOpenDate, bankingDate, 8);
		strncpy(acctLogRec.lastUpdateBmDate, bankingDate, 8);

		if ( extraDebug )
			fprintf(logFp, "account number is %.14s\n", acctLogRec.accNo);

		strncpy(acctLogRec.supervisorId,receivedMsg.supDecision.supervisorId,10);
		acctLogRec.bmUpdateStatus = '9'; /* Added during phase II */
		strncpy(acctLogRec.lastUpdateUser, receivedMsg.supDecision.supervisorId, 10);
		getDateTime();
		sprintf(tmpStr, "%04d%02d%02d%02d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday, systemDate->tm_hour, systemDate->tm_min,systemDate->tm_sec);
		strncpy(acctLogRec.lastUpdateDateTime, tmpStr, 14);
		
		if( updateAcctLogFile(SUPERVISOR_ACTION) < 0 ) 
		{
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| updateAcctLogFile() completed for %.14s\n", getDateTime(), PID, acctLogRec.accNo);
			fflush(logFp);
		}

		/* Now Update BankMaster Account Info  */

		memset(bmAccRec.accNo, ' ', sizeof bmAccRec);

		strncpy(bmAccRec.accNo, acctLogRec.accNo, 14);
		/*strncpy(bmAccRec.branchCode, acctLogRec.branchCode,4);*/
		strncpy(bmAccRec.branchCode, acctLogRec.custBranchCode,4);/* MISYS */
		strncpy(bmAccRec.accountStatus, acctLogRec.accStatus, 2);
		strncpy(bmAccRec.statementFrequency, acctLogRec.statementFreq, 2);
		bmAccRec.residentCode = custLogRec.residentStatus;
		bmAccRec.customerType = custLogRec.custType;
		bmAccRec.checkBookRequired = acctLogRec.checkBook;
		bmAccRec.newOrUpdate = 'N'; /*  newOrUpdate flag is hard coded as 'N' as there is no update option on account in phase-I*/
		strncpy(bmAccRec.userId, receivedMsg.supDecision.userId, 10);
		strncpy(bmAccRec.supervisorId, receivedMsg.supDecision.supervisorId, 10);
		strncpy(bmAccRec.altBranchCode, bmCustRec.altBranchCode, 4);
		strncpy(bmAccRec.requestBranchCode, acctLogRec.branchCode, 4); /* to update it for the cheque book request */
		bmAccRec.nullPad = '\0';

		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| About to update BM GL details\n", getDateTime(), PID);
			fflush(logFp);
		}
		if ( (returnError = updateGld(bmAccRec)) != SUCCESS )
		{
			sprintf(tmpStr,"Error %d occured while updating AcctInfo in BM", returnError);
			fprintf(logFp,"%s|%5d|[processQuickCustomerSuperDecision] :Error %d occured while updating AcctInfo in BM for the accNo [%.14s]\n", getDateTime(), PID, returnError, bmAccRec.accNo);
			isrollback();
			isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
			custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
			sigsetmask(oldSigMask);
			formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
			unlink(isLogPathName);
			free(isLogPathName);
			sendResponse(responseMsg.superDecision.msgLen);
			return FAILURE;
		}
		if ( strncmp(ibanAccNo, "                  ", 15) == 0 )
			sprintf(ibanAccNo, "%.24s", gldRec.iban);

		/* Sucessfully updated in BankMaster  */
		if ( extraDebug )
		{
			fprintf(logFp, "%s|%5d| BM GL update successful\n", getDateTime(), PID);
			fflush(logFp);
		}
	}  /* while read acct log file == success  */ 


	if ( extraDebug )
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] All update for Accounts completed; proceeding to Card Information update\n", getDateTime(), PID);

	if ( custLogRec.cardType == ' ' || custLogRec.cardType == NULL ) /* if the request coming from old CSD version (before 2.5.9)*/
		custLogRec.cardType = 'I'; 

	if ( strncmp(receivedMsg.supDecision.custNo, "         ", 7) )
	{
		if ( custLogRec.electronIntlRequired == '1' )
		{
			if ( updateCardRequest(custLogRec.cardType, 'N', 'P') == FAILURE )
			{
				sprintf(tmpStr,"Error occured while updating primary Intl cardInfo ");
				fprintf(logFp,"%s|%5d|[processQuickCustomerSuperDecision] : Error occured while updating primary intl cardinfo for the card # [%.19s]\n", getDateTime(), PID, cardTabRec.cardNo);
				isrollback();
				isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
				custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
				sigsetmask(oldSigMask);
				formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
				unlink(isLogPathName);
				free(isLogPathName);
				sendResponse(responseMsg.superDecision.msgLen);
				return FAILURE;
			}
		}
	}

	if ( iscommit() < 0 )
	{
		fprintf(logFp, "%s|%5d|[processQuickCustomerSuperDecision] :ISCOMMIT error %d; ignored\n", getDateTime(), PID, iserrno);
		fflush(logFp);
	/* when iscommit fails; isrollback does not work; but all the update have been taken place; so it is better to ignore it at this stage
		sprintf(tmpStr, "ISCOMMIT error %d occured ", iserrno);
		formatSuperDecisionResponse(INTERNALERR, tmpStr, tmpStr);
		sendResponse(responseMsg.superDecision.msgLen);
		sigsetmask(oldSigMask);
		return FAILURE;
	*/
	}
	isclose(custTabFile);isclose(custLogFile);isclose(acctLogFile);isclose(ctlFile);isclose(cardTabFile);isclose(cardLogFile);isclose(idLogFile);isclose(idTabFile);isclose(addrLogFile);isclose(addrTabFile);
	custLogFileOpen=custTabFileOpen=acctLogFileOpen=ctlFileOpen=cardTabFileOpen=cardLogFileOpen=idLogFileOpen=idTabFileOpen=addrLogFileOpen=addrTabFileOpen=NO;
	islogclose();
	sigsetmask(oldSigMask);
	if ( extraDebug )
	{
		fprintf(logFp, "Supervisor add decision successful\n");
		fflush(logFp);
	}
	closeAllFiles();
	strncpy(responseMsg.superDecision.ibanAccNo, ibanAccNo, 24);
	formatSuperDecisionResponse(DONE, "Successful", "Successful");
	unlink(isLogPathName);
	free(isLogPathName);
	sendResponse(responseMsg.superDecision.msgLen);
	return SUCCESS;
}

formatQuickCustomerDetailResponse(responseCode, aRemarks, eRemarks) 
char *responseCode, *aRemarks,*eRemarks;
{
	char tmpStr[120], tmpARemarks[55], tmpERemarks[55];

	if ( extraDebug )
	{
		fprintf(logFp, "%s|%5d|[formatQuickCustomerDetailResponse]\n", getDateTime(), PID);
		fflush(logFp);
	}
	sprintf(tmpARemarks, "%-50.50s", aRemarks);
	sprintf(tmpERemarks, "%-50.50s", eRemarks);
    
	strncpy(responseMsg.quickCustPendingDetail.status,responseCode,3);
	strncpy(responseMsg.quickCustPendingDetail.service,receivedMsg.pendingDetail.service,2);
	strncpy(responseMsg.quickCustPendingDetail.aRemarks,tmpARemarks,50);
	strncpy(responseMsg.quickCustPendingDetail.eRemarks,tmpARemarks,50);
    responseMsg.quickCustPendingDetail.nullPad = '\0';
	sprintf(tmpStr, "%06d", strlen(responseMsg.quickCustPendingDetail.msgLen));
	strncpy(responseMsg.quickCustPendingDetail.msgLen, tmpStr, 6);
	if ( responseCode == COMMSERR )
	{
	      iscleanup();
		  fclose(logFp);
	}
	return SUCCESS;
}

logQuickCustomerDetails()
{
	if ( debug == 0  )
		return SUCCESS;
	fprintf(logFp, "%s : INCOMMING MESSAGE from %s\n", getDateTime(), authorisedUser);
	fprintf(logFp, "===================================\n");
	if ( receivedMsg.quickCustomer.internalCustomer == '1' )
		fprintf(logFp, "Service 		: %.2s[Internal Customer Detail]\n", receivedMsg.quickCustomer.service);
	else
		fprintf(logFp, "Service 		: %.2s[Quick Customer Detail]\n", receivedMsg.quickCustomer.service);
	fprintf(logFp, "Branch Code		: %.4s\n", receivedMsg.quickCustomer.branchCode); 
	fprintf(logFp, "User Id			: %.10s\n", receivedMsg.quickCustomer.userId);
	fprintf(logFp, "Date & Time		: %.14s\n", receivedMsg.quickCustomer.dateTime);
	fprintf(logFp, "Creation Or Update Flag  : %c\n", receivedMsg.quickCustomer.creationOrUpdate);
	fprintf(logFp, "bm Update Status	: %c\n", receivedMsg.quickCustomer.bmUpdateStatus);
	fprintf(logFp, "New Or Update Flag	: %c\n", receivedMsg.quickCustomer.newOrUpdate);
	
	fprintf(logFp, "SAMA main category	: %.2s\n", receivedMsg.quickCustomer.samaMainCategory);
	fprintf(logFp, "SAMA sub category	: %.2s\n", receivedMsg.quickCustomer.samaSubCategory);

	fprintf(logFp, "Customer Number		: %.7s\n", receivedMsg.quickCustomer.custNo);
	fprintf(logFp, "Supervisor Id		: %.10s\n", receivedMsg.quickCustomer.supervisorId);
	fprintf(logFp, "Customer Branch Code : %.4s\n", receivedMsg.quickCustomer.custBranchCode);
	fprintf(logFp, "Alternative Branch Code : %.4s\n", receivedMsg.quickCustomer.altBranchCode);
	fprintf(logFp, "Internal Customer 	: %c\n", receivedMsg.quickCustomer.internalCustomer);
	fflush(logFp);
}
