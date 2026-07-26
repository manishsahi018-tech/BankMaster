/*
	Objective       :       Static data maintenance server 
				            (TUXEDO  Interface)

	Date            :       17/07/2000.

	Author          :       S. Rajesh.


	Modification History :
	---------------------
Ver.	Author		Date			Details of description
---------------------------------------------------------------------
*/
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <atmi.h>		/* TUXEDO  Header File */
#include <fml32.h>
#include "field.tbl.h"
#include "tpinint.h"

#define SUCCESS			0
#define	FAILURE			-1
#define	INTERNALERR		    "099"

#define YES              1
#define NO               0

extern  int page, line;

extern int debug, extraDebug, checkAList, checkBList, checkCList, ahaerr;

extern char bmAmtStr[50], dateTime[30], bankingDate[10];

extern FILE *logFp;

extern struct tm *systemDate;  /* structure declaration in time.h */
extern time_t systime;

extern int PID;

void _TMDLLENTRY displayMsg(char *buffer, long len, long flags)
{
	(void) fprintf(stdout, "Unsolicited Message = %s \n", buffer);
}

connectToTuxedo()
{
	char tmpStr[100];
	char *wsnAddr, *tuxDir, *shlibPath;
	TPINIT *tpinitbuf;
	int auth;

	if ( (wsnAddr  = getenv("WSNADDR") ) == NULL )
	{
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Environment variable WSNADDR is not set ... Please check \n", getDateTime(), PID);
		fflush(logFp);
		sprintf(tmpStr, "Environment variable WSNADDR is not set ... Report to HELP DESK\n");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( extraDebug > 8 )
	{
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Environment variable WSNADDR is set as [%s]\n", getDateTime(), PID, wsnAddr);
		fflush(logFp);
	}

	if ( (tuxDir  = getenv("TUXDIR") ) == NULL )
	{
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Environment variable TUXDIR is not set ... Please check \n", getDateTime(), PID);
		fflush(logFp);
		sprintf(tmpStr, "Environment variable TUXDIR is not set ... Report to HELP DESK\n");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( (shlibPath  = getenv("SHLIB_PATH") ) == NULL )
	{
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Environment variable SHLIB_PATH is not set ... Please check \n", getDateTime(), PID);
		fflush(logFp);
		sprintf(tmpStr, "Environment variable SHLIB_PATH is not set ... Report to HELP DESK\n");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

     tpinitbuf = (TPINIT *) tpalloc("TPINIT", NULL, TPINITNEED(16)) ;
	 if (tpinitbuf == (TPINIT *) NULL) 
	 {
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Failed during allocating space for TPINIT buffer, %s\n",getDateTime(), PID, tpstrerror(tperrno));
		fflush(logFp);
		sprintf(tmpStr, "Error %d occured while allocating tpinit buffer", tperrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	 }

	 memset(tpinitbuf->usrname, ' ', sizeof tpinitbuf);

	/*
	auth = tpchkauth(); 
	fprintf(logFp, "%s|%5d| [connectToTuxedo]  DEBUG : auth after tpchkauth() is %d \n", getDateTime(), PID, auth);
	fflush(logFp);
	switch (auth)
	*/
	switch (auth = tpchkauth()) 
	{
	    case TPNOAUTH :
		    /*(void)strcpy (tpinitbuf->usrname, progName) ;*/
		    /*(void)strcpy (tpinitbuf->passwd, "") ;*/
		    break ;

	    case TPSYSAUTH :
	    case TPAPPAUTH :
		    // request for the application password 

		    (void)strcpy (tpinitbuf->passwd, "tux123#") ;

		    if (auth == TPSYSAUTH)
				break;

		    (void)strcpy (tpinitbuf->usrname, "sttpin") ;
		    (void)strcpy (tpinitbuf->cltname, "W_StaticData") ;
		    (void)strcpy (tpinitbuf->grpname, "") ;

		    (void)strcpy ((char *) &tpinitbuf->data, "csd123#") ;

		    tpinitbuf->datalen = strlen ((char *) &tpinitbuf->data)+1L;
		    break ;
	}
	/*
	fprintf(logFp, "%s|%5d| [connectToTuxedo]  DEBUG : user name [%s]; user password [%s]; app password [%s] \n", getDateTime(), PID, tpinitbuf->usrname, &tpinitbuf->data, tpinitbuf->passwd);
	fflush(logFp);
	*/

	/* Join application */

	if ( tpinit(tpinitbuf) == -1) 
	{
		fprintf(logFp, "%s|%5d| [connectToTuxedo] Failed to join application, %s\n", getDateTime(), PID, tpstrerror(tperrno));
		fprintf(logFp, "%s|%5d|[connectToTuxedo] Tpinit failed;  Error [%d]; Please check whether Tuxedo server is started or not\n", getDateTime(), PID, tperrno);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while connecting to TUXEDO..Please check", tperrno);
		tpfree((TPINIT *)tpinitbuf);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	tpfree((TPINIT *)tpinitbuf);

	/*
	 //Attach to System/T as a Client Process 
	if ( tpinit((TPINIT *)NULL) == -1 ) 
	{
		fprintf(logFp, "%s|%5d| Tpinit failed;  Error [%d]; Please check whether Tuxedo server is started or not\n", getDateTime(), PID, tperrno);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while connecting to TUXEDO..Please check", tperrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}
	tpsetunsol(displayMsg);
	*/

	return SUCCESS;
}

int dealWithTuxedo(char *service, char *tuxInBuf, char *tuxOutBuf)
{
	FBFR32 *sendbuf, *rcvbuf;
	long sendlen, rcvlen;
	int ret;
	int i;
	char tmpStr[100];
	char logMessage[5000];
	struct requestMsgTpinStatus	logTpinReqMsg;
	struct responseMsgTpinStatus logTpinResponseMsg;

	if ( connectToTuxedo()  == FAILURE )
		return FAILURE;

	/* Allocate STRING buffers for the request and the reply */

	if((sendbuf = (FBFR32 *) tpalloc("FML32", NULL, 5000)) == NULL) 
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Error %d allocating memory space for send buffer\n", getDateTime(), PID, tperrno);
		fflush(logFp);
		tpterm();
		sprintf(tmpStr, "Error %d while allocating space for send buffers", tperrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if((rcvbuf = (FBFR32 *) tpalloc("FML32", NULL, 5000)) == NULL) 
	{
		fprintf(logFp,"%s|%5d|[dealWithTuxedo] Error %d allocating memory space for receive buffer\n", getDateTime(), PID, tperrno);
		fflush(logFp);
		tpterm();
		tpfree(sendbuf);
		tpfree(rcvbuf);
		tpterm();
		sprintf(tmpStr, "Error %d while allocating space for receive buffers", tperrno);
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( Fchg32(sendbuf, INBUF1, 0,tuxInBuf, (FLDLEN32)0 ) == -1 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Error while getting field from FML buffer; Error =%s\n", getDateTime(), PID,Fstrerror32(Ferror32));
		fflush(logFp);
		tpfree(sendbuf);
		tpfree(rcvbuf);
		tpterm();
		sprintf(tmpStr, "Error while getting field from FML buffer");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	strcpy(logMessage, tuxInBuf);
	if ( strcmp(service, "FTPINSERVICES") == 0 )
	{
		sprintf(logTpinReqMsg.msgLen, "%s", tuxInBuf);

		if ( extraDebug < 6 )
		{
			sprintf(tmpStr, "%-19.19s", maskCardNo(logTpinReqMsg.cardNo, tmpStr));
			strncpy(logTpinReqMsg.cardNo, tmpStr, 19);
		}

		sprintf(logMessage, "%s", logTpinReqMsg.msgLen);
	}

	if ( strlen(logMessage) < 1500 )
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%s] [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
	else if ( strlen(logMessage) < 3000 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[1500]);
	}
	else if ( strlen(logMessage) < 4500 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s \n", getDateTime(), PID, service, &logMessage[1500]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[3000]);
	}
	else 
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s \n", getDateTime(), PID, service, &logMessage[1500]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[3000]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Send to TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[4500]);
	}

	ret = tpcall(service, (char *)sendbuf, 0, (char **)&rcvbuf, &rcvlen, (long)0);

	if(ret == -1) 
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Error %d (%s) while sending the request to %s service \n", getDateTime(), PID, tperrno, tpstrerror(tperrno), service);
		fflush(logFp);
		sprintf(tmpStr, "Error %d while sending request to %s service", tperrno, service);
	    tpfree(sendbuf);
	    tpfree(rcvbuf);
		tpterm();
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	if ( Fget32(rcvbuf,OUTBUF1, 0,tuxOutBuf, (FLDLEN32)0 ) == -1 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Error while getting field from FML buffer; Error =%s\n", getDateTime(), PID,Fstrerror32(Ferror32));
		fflush(logFp);
		tpfree(sendbuf);
		tpfree(rcvbuf);
		tpterm();
		sprintf(tmpStr, "Error while getting field from FML buffer");
		formatBranchResponse(INTERNALERR, tmpStr, tmpStr);
		return FAILURE;
	}

	strcpy(logMessage, tuxOutBuf);
	if ( strcmp(service, "FTPINSERVICES") == 0 )
	{
		sprintf(logTpinResponseMsg.msgLen, "%s", tuxOutBuf);

		if ( extraDebug < 6 )
		{
			sprintf(tmpStr, "%-19.19s", maskCardNo(logTpinResponseMsg.cardNo, tmpStr));
			strncpy(logTpinResponseMsg.cardNo, tmpStr, 19);
		}

		sprintf(logMessage, "%s", logTpinResponseMsg.msgLen);
	}

	if ( strlen(logMessage) < 1500 )
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s] [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
	else if ( strlen(logMessage) < 3000 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[1500]);
	}
	else if ( strlen(logMessage) < 4500 )
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s \n", getDateTime(), PID, service, &logMessage[1500]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[3000]);
	}
	else 
	{
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s [%d]\n", getDateTime(), PID, service, logMessage, strlen(logMessage));
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s \n", getDateTime(), PID, service, &logMessage[1500]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s \n", getDateTime(), PID, service, &logMessage[3000]);
		fprintf(logFp, "%s|%5d|[dealWithTuxedo] Returned string from the TUXEDO service [%s] : [%.1500s] \n", getDateTime(), PID, service, &logMessage[4500]);
	}
	fflush(logFp);
	tpfree(sendbuf);
	tpfree(rcvbuf);
	tpterm();

	return SUCCESS;
}
