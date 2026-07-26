/*
	Objective	:	Server which routes the incomming messages to the 
					appropriate functions. (Static data Maintenance [modified for CBS])
				
	Author		:	S. Rajesh / A. Arul Selvam

	Date		:	08/11/2008.

	Modification History :
	======================
	Ver		Author		Date				Details of modification
	=== 	======		====				======================= 
	
	1.0     Rajesh     08/11/08 		Modified the static data server for the CMS interface for 
										CBS.

	1.1		Rajesh	   15/02/10			Modified to maske the card number for PCI compliance

	1.2		Rajesh	   02/03/10			In customer detail response message from finacle, if the short name is coming as 
										SPACES, then take first 30 character of long name and put it in short name position
										(Mail from 4th Mar 2010 from Arul)
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/uio.h>
#include <netinet/in.h>
#include <netdb.h>
#include <pwd.h>
#include <isam.h>
#include <signal.h>
#include <time.h>
#include <errno.h>
#include <sys/wait.h>
#include "cbrouter.h"
#include "cbserver.h"
#include "../cbslib/cblayout.h"

#define	YES			1
#define	NO			0
#define MAXHOSTNAME	32		/* maximum host name length */
#define MAXTRYONGET	10		/* recv will be tried for MAXTRYONGET times
							   before timesOut*/

/* Informaton for what */
char    whatmsg1[80] = "@(#)CMS server for CBS                          RAJ      Ver  1.2";
char    whatmsg2[80] = "@(#)Arab National Bank                                     Mar'10";

int alphaFlag = 1;
struct msgHead {
	char	msgLen[6];
	char	service[2];
	char	homeBranch[4];
} headerMsg;

struct msgSend {
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	nullPad;
} routerResponseMsg;

struct msgSendToNewSockFd
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	message[50];
	char	nullPad;
} newSockResponseMsg;

extern int  sys_nerr;
extern char *sys_errlist[];
FILE   		*serverLogFp, *ipAddressFp, *logFp, *errLogFp, *expPrtFp, *csdTransExpFp;

struct tm   *systemDate;  /* structure declaration in time.h */
time_t systime;
struct timeval first, second;
struct timezone tzp;

char servicePort[30], progName[30], localHost[MAXHOSTNAME+1], authorisedUser[25];
struct keydesc  custLogKey, jointLogKey, acctLogKey, ctlKey, sadadCtlKey, custTabKey, acctTabKey, jointTabKey, crdKey, abcKey, cardTabKey, cardLogKey, gldKey, o3dKey, acctBmKey, userKey, userLogKey, chqTabKey, reqKey, pensKey, pennotKey, sodKey, pydKey, sodLogKey, stopChqLogKey, gldMemoKey, cndKey, thdKey, thd1Key, refKey, brKey, brsKey, ridKey, secLogKey, chqDelKey, refreshKey, penInhKey, tpinHistKey, idLogKey, addrLogKey, calendarKey , idTabKey, addrTabKey, cRefLogKey, cRefTabKey, signLogKey, signTabKey, ownerLogKey, ownerTabKey, aadKey, bkdKey, arrBlkKey, arrBlkLogKey, dzdKey, accBlkKey, usrBrnKey, letterKey, retMailKey, pbCustKey, tdLogKey, ankKey, fndTabKey, heirLogKey, heirTabKey, swiftLogKey, sadadLogKey, samaAccKey, accOpenCardKey, cbCtlTabKey, cbFinCityKey, cardSeqKey, cbCustTabKey;
int  userFile, userLogFile, custLogFile, jointLogFile, acctLogFile, ctlFile, sadadCtlFile, custTabFile, acctTabFile, jointTabFile, crdFile, abcFile, cardTabFile, cardLogFile, gldFile, o3dFile, acctBmFile, chqTabFile, reqFile, pensFile, pennotFile, sodFile, pydFile, sodLogFile, stopChqLogFile, gldMemoFile, cndFile, thdFile, thd1File, brFile, refFile, brsFile, ridFile, secLogFile, chqDelFile, refreshFile, penInhFile, tpinHistFile, idLogFile, addrLogFile, calendarFile, idTabFile, addrTabFile, cRefLogFile, cRefTabFile , signLogFile, signTabFile, ownerLogFile, ownerTabFile, aadFile, bkdFile, arrBlkFile, arrBlkLogFile, dzdFile, accBlkFile, usrBrnFile, letterFile, retMailFile, pbCustFile, tdLogFile, ankFile, fndTabFile, heirLogFile, heirTabFile, swiftLogFile, sadadLogFile, samaAccFile, accOpenCardFile, cbCtlTabFile, cbFinCityFile, cardSeqFile, cbCustTabFile;
int timeOut, debug, extraDebug, checkAList, checkBList, checkCList, loginAuthorised = NO, userFileOpen=NO, userLogFileOpen=NO, maintenanceFileOpen = NO, staticFileOpen=NO, commonFileOpen=NO, errLogFileOpen=NO, expPrtFileOpen=NO, csdTransExpFileOpen=NO, custLogFileOpen=NO, custTabFileOpen = NO, jointLogFileOpen=NO,acctLogFileOpen=NO, ctlFileOpen=NO, sadadCtlFileOpen=NO, acctTabFileOpen=NO, jointTabFileOpen=NO, abcFileOpen=NO, cardLogFileOpen=NO,cardTabFileOpen=NO, o3dFileOpen=NO, acctBmFileOpen=NO, gldFileOpen=NO, chqTabFileOpen=NO, reqFileOpen=NO,crdFileOpen=NO, pensFileOpen=NO, pennotFileOpen=NO, sodFileOpen=NO, pydFileOpen=NO, sodLogFileOpen=NO, stopChqLogFileOpen=NO, thdFileOpen=NO, cndFileOpen=NO, brFileOpen=NO, refFileOpen=NO, brsFileOpen=NO, ridFileOpen=NO, secLogFileOpen=NO, chqDelFileOpen=NO, refreshFileOpen=NO, penInhFileOpen=NO, tpinHistFileOpen=NO, idLogFileOpen=NO, addrLogFileOpen=NO, calendarFileOpen=NO, idTabFileOpen=NO, addrTabFileOpen=NO, cRefLogFileOpen=NO, cRefTabFileOpen=NO, signLogFileOpen=NO, signTabFileOpen=NO, ownerLogFileOpen=NO, ownerTabFileOpen=NO, aadFileOpen=NO, bkdFileOpen=NO, arrBlkFileOpen=NO, arrBlkLogFileOpen=NO, dzdFileOpen=NO, accBlkFileOpen=NO, usrBrnFileOpen=NO, retMailFileOpen=NO, pbCustFileOpen=NO, tdLogFileOpen=NO, ankFileOpen=NO, fndTabFileOpen=NO, heirLogFileOpen=NO, heirTabFileOpen=NO, swiftLogFileOpen=NO, sadadLogFileOpen=NO, samaAccFileOpen=NO, accOpenCardFileOpen=NO, cbCtlTabFileOpen=NO, cbFinCityFileOpen=NO, cardSeqFileOpen=NO, cbCustTabFileOpen=NO;
char bmAmtStr[50], dateTime[30], bankingDate[10];
int PID;
int hsmKey1, hsmKey2, b24Key1, b24Key2;
int clientTimeOut = 1800, searchTimeOut = 30, idleTimeOut = 180, searchEngineCallReqd=NO ;
int concurrentProcessLimit=700;
int processCount=0;
int logFileOpened=NO;
int sadadTimeOut;
int serviceTimeout;
int serviceTimeoutFlag;
int transactionBegin=NO;
char clientIpAddress[30], searchEngineLevel=' ', sadadMaxBills[5], sadadAccessChannel[30] ;
char dormantAccPosting=' ';
int  autoLoginAllowedFlag=YES;
char dcOrMxFlag='M';
char tdNarr1Arb[30], tdNarr1Eng[30] ;
char emvValue1, emvValue2, emvValue3, emvValue4, emvValue5, emvValue6, emvValue7;
char postingUserId[10], postingTransType[5], pckBranchCode[10], tdPostingUserId[10];
char swiftContraAccNo[15];
char swiftCentralizedBranches[4000];
char ignoreMemoForBrnUpd[500];
int  expPrtLine=0, expPrtPage=1;
int  csdTransExpLine=0, csdTransExpPage=1;
char  *userFilePath, *userLogFilePath, *custLogFilePath, *jointLogFilePath, *acctLogFilePath, *ctlFilePath, *sadadCtlFilePath, *custTabFilePath, *jointTabFilePath, *crdFilePath, *abcFilePath, *cardTabFilePath, *cardLogFilePath, *gldFilePath, *o3dFilePath, *acctBmFilePath, *chqTabFilePath, *reqFilePath, *pensFilePath, *pennotFilePath, *sodFilePath, *pydFilePath, *sodLogFilePath, *stopChqLogFilePath, *gldMemoFilePath, *cndFilePath, *cedFilePath, *thdFilePath, *thd1FilePath, *brFilePath, *refFilePath, *brsFilePath, *ridFilePath, *secLogFilePath, *chqDelFilePath, *refreshFilePath, *penInhFilePath, *tpinHistFilePath, *idLogFilePath, *addrLogFilePath, *calendarFilePath, *idTabFilePath, *addrTabFilePath, *cRefLogFilePath, *cRefTabFilePath , *signLogFilePath, *signTabFilePath, *ownerLogFilePath, *ownerTabFilePath, *aadFilePath, *bkdFilePath, *arrBlkFilePath, *arrBlkLogFilePath, *dzdFilePath, *accBlkFilePath, *usrBrnFilePath, *retMailFilePath, *pbCustFilePath, *tdLogFilePath, *ankFilePath, *fndTabFilePath, *heirLogFilePath, *heirTabFilePath, *swiftLogFilePath, *sadadLogFilePath, *samaAccFilePath, *accOpenCardFilePath, *cbCtlTabFilePath, *cbFinCityFilePath, *cardSeqFilePath, *cbCustTabFilePath;

static int timeoutFlag;
struct  sockaddr_in sa, isa;	/* Internet socket address structure    */

int		seqNo = 0, socketNo = 0;
char		dateTime[30];
char 		*getDateTime(), *getpath();
void		errShutdown();
void		normalShutdown();
void 		reduceConnections();
void		logSignal();
void		closeConnection();
void		clearConnection();
void		toAlarm();
void		serviceAlarm();
void		windup();
int		OnlineFlag = YES;


getPathInfo()
{
	userFilePath = getpath("stuser", "static");
	if ( userFilePath == NULL )
	{
		printf("router | cannot get path name for the file stuser in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stuser in static directory \n", getDateTime());
		return FAILURE;
	}
	userLogFilePath = getpath("stuserlog", "static");
	if ( userLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stuserlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stuserlog in static directory \n", getDateTime());
		return FAILURE;
	}
	custLogFilePath = getpath("stcustlog", "static");
	if ( custLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcustlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcustlog in static directory \n", getDateTime());
		return FAILURE;
	}
	jointLogFilePath = getpath("stjointlog", "static");
	if ( jointLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stjointlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stjointlog in static directory \n", getDateTime());
		return FAILURE;
	}
	acctLogFilePath = getpath("stacclog", "static");
	if ( acctLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stacclog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stacclog in static directory \n", getDateTime());
		return FAILURE;
	}
	ctlFilePath = getpath("stctltab", "static");
	if ( ctlFilePath == NULL )
	{
		printf("router | cannot get path name for the file stctltab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stctltab in static directory \n", getDateTime());
		return FAILURE;
	}
	custTabFilePath = getpath("stcusttab", "static");
	if ( custTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcusttab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcusttab in static directory \n", getDateTime());
		return FAILURE;
	}
	jointTabFilePath = getpath("stjointtab", "static");
	if ( jointTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stjointtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stjointtab in static directory \n", getDateTime());
		return FAILURE;
	}
	crdFilePath = getpath("crd0data", "hiscus");
	if ( crdFilePath == NULL )
	{
		printf("router | cannot get path name for the file crd0data in hiscus directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file crd0data in hiscus directory \n", getDateTime());
		return FAILURE;
	}
	abcFilePath = getpath("stabclist", "static");
	if ( abcFilePath == NULL )
	{
		printf("router | cannot get path name for the file stabclist in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stabclist in static directory \n", getDateTime());
		return FAILURE;
	}
	cardTabFilePath = getpath("cbcardtab", "cbcards");
	if ( cardTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbcardtab in cbcards directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbcardtab in cbcards directory \n", getDateTime());
		return FAILURE;
	}
	cardLogFilePath = getpath("cbcardlog", "cbcards");
	if ( cardLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbcardlog in cbcards directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbcardlog in cbcards directory \n", getDateTime());
		return FAILURE;
	}
	gldFilePath = getpath("gld0data", "iam");
	if ( gldFilePath == NULL )
	{
		printf("router | cannot get path name for the file gld0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file gld0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	cndFilePath = getpath("cnd0data", "iam");
	if ( cndFilePath == NULL )
	{
		printf("router | cannot get path name for the file cnd0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cnd0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	cedFilePath = getpath("ced0data", "iam");
	if ( cedFilePath == NULL )
	{
		printf("router | cannot get path name for the file ced0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ced0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	o3dFilePath = getpath("o3d0data", "iam");
	if ( o3dFilePath == NULL )
	{
		printf("router | cannot get path name for the file o3d0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file o3d0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	acctBmFilePath = getpath("acctbm", "rel");
	if ( acctBmFilePath == NULL )
	{
		printf("router | cannot get path name for the file acctbm in rel directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file acctbm in rel directory \n", getDateTime());
		return FAILURE;
	}
	chqTabFilePath = getpath("stchqtab", "static");
	if ( chqTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stchqtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stchqtab in static directory \n", getDateTime());
		return FAILURE;
	}
	reqFilePath = getpath("req0data", "anbiam");
	if ( reqFilePath == NULL )
	{
		printf("router | cannot get path name for the file req0data in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file req0data in anbiam directory \n", getDateTime());
		return FAILURE;
	}
	pensFilePath = getpath("pens", "iam");
	if ( pensFilePath == NULL )
	{
		printf("router | cannot get path name for the file pens in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file pens in iam directory \n", getDateTime());
		return FAILURE;
	}
	pennotFilePath = getpath("pennot", "anbiam");
	if ( pennotFilePath == NULL )
	{
		printf("router | cannot get path name for the file pennot in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file pennot in anbiam directory \n", getDateTime());
		return FAILURE;
	}
	sodFilePath = getpath("sod0data", "iam");
	if ( sodFilePath == NULL )
	{
		printf("router | cannot get path name for the file sod0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file sod0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	pydFilePath = getpath("pyd0data", "iam");
	if ( pydFilePath == NULL )
	{
		printf("router | cannot get path name for the file pyd0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file pyd0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	sodLogFilePath = getpath("stsodlog", "static");
	if ( sodLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsodlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsodlog in static directory \n", getDateTime());
		return FAILURE;
	}
	stopChqLogFilePath = getpath("ststchqlog", "static");
	if ( stopChqLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file ststchqlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ststchqlog in static directory \n", getDateTime());
		return FAILURE;
	}
	thdFilePath = getpath("thd0data", "hiscus");
	if ( thdFilePath == NULL )
	{
		printf("router | cannot get path name for the file thd0data in hiscus directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file thd0data in hiscus directory \n", getDateTime());
		return FAILURE;
	}
	brFilePath = getpath("brcode", "iam");
	if ( brFilePath == NULL )
	{
		printf("router | cannot get path name for the file brcode in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file brcode in iam directory \n", getDateTime());
		return FAILURE;
	}
	refFilePath = getpath("ref0data", "anbiam");
	if ( refFilePath == NULL )
	{
		printf("router | cannot get path name for the file ref0data in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ref0data in anbiam directory \n", getDateTime());
		return FAILURE;
	}
	brsFilePath = getpath("brs0data", "anbiam");
	if ( brsFilePath == NULL )
	{
		printf("router | cannot get path name for the file brs0data in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file brs0data in anbiam directory \n", getDateTime());
		return FAILURE;
	}
	ridFilePath = getpath("rid0data", "iam");
	if ( ridFilePath == NULL )
	{
		printf("router | cannot get path name for the file rid0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file rid0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	secLogFilePath = getpath("stseclog", "static");
	if ( secLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stseclog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stseclog in static directory \n", getDateTime());
		return FAILURE;
	}
	chqDelFilePath = getpath("stchqdel", "static");
	if ( chqDelFilePath == NULL )
	{
		printf("router | cannot get path name for the file stchqdel in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stchqdel in static directory \n", getDateTime());
		return FAILURE;
	}
	refreshFilePath = getpath("streftab", "static");
	if ( refreshFilePath == NULL )
	{
		printf("router | cannot get path name for the file streftab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file streftab in static directory \n", getDateTime());
		return FAILURE;
	}
	penInhFilePath = getpath("peninh", "anbiam");
	if ( penInhFilePath == NULL )
	{
		printf("router | cannot get path name for the file peninh in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file peninh in anbiam directory \n", getDateTime());
		return FAILURE;
	}
	tpinHistFilePath = getpath("sttpinhist", "static");
	if ( tpinHistFilePath == NULL )
	{
		printf("router | cannot get path name for the file sttpinhist in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file sttpinhist in static directory \n", getDateTime());
		return FAILURE;
	}
	idLogFilePath = getpath("stidlog", "static");
	if ( idLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stidlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stidlog in static directory \n", getDateTime());
		return FAILURE;
	}
	addrLogFilePath = getpath("staddrlog", "static");
	if ( addrLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file staddrlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file staddrlog in static directory \n", getDateTime());
		return FAILURE;
	}
	calendarFilePath = getpath("stcaltab", "static");
	if ( calendarFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcaltab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcaltab in static directory \n", getDateTime());
		return FAILURE;
	}
	idTabFilePath = getpath("stidtab", "static");
	if ( idTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stidtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stidtab in static directory \n", getDateTime());
		return FAILURE;
	}
	addrTabFilePath = getpath("staddrtab", "static");
	if ( addrTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file staddrtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file staddrtab in static directory \n", getDateTime());
		return FAILURE;
	}
	cRefLogFilePath = getpath("stcreflog", "static");
	if ( cRefLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcreflog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcreflog in static directory \n", getDateTime());
		return FAILURE;
	}
	cRefTabFilePath = getpath("stcreftab", "static");
	if ( cRefTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcreftab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcreftab in static directory \n", getDateTime());
		return FAILURE;
	}
	signLogFilePath = getpath("stsignlog", "static");
	if ( signLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsignlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsignlog in static directory \n", getDateTime());
		return FAILURE;
	}
	signTabFilePath = getpath("stsigntab", "static");
	if ( signTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsigntab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsigntab in static directory \n", getDateTime());
		return FAILURE;
	}
	ownerLogFilePath = getpath("stownlog", "static");
	if ( ownerLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stownlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stownlog in static directory \n", getDateTime());
		return FAILURE;
	}
	ownerTabFilePath = getpath("stowntab", "static");
	if ( ownerTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stowntab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stowntab in static directory \n", getDateTime());
		return FAILURE;
	}
	aadFilePath = getpath("aad0data", "iam");
	if ( aadFilePath == NULL )
	{
		printf("router | cannot get path name for the file aad0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file aad0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	bkdFilePath = getpath("bkd0data", "iam");
	if ( bkdFilePath == NULL )
	{
		printf("router | cannot get path name for the file bkd0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file bkd0data in iam directory \n", getDateTime());
		return FAILURE;
	}
	arrBlkFilePath = getpath("ccarrblk", "anbiam");
	if ( arrBlkFilePath == NULL )
	{
		printf("router | cannot get path name for the file ccarrblk in anbiam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ccarrblk in anbiam directory \n", getDateTime());
		return FAILURE;
	}

	arrBlkLogFilePath = getpath("ccblklog", "static");
	if ( arrBlkLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file ccblklog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ccblklog in static directory \n", getDateTime());
		return FAILURE;
	}

	dzdFilePath = getpath("dzd0data", "iam");
	if ( dzdFilePath == NULL )
	{
		printf("router | cannot get path name for the file dzd0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file dzd0data in iam directory \n", getDateTime());
		return FAILURE;
	}

	sadadCtlFilePath = getpath("stsadctl", "static");
	if ( sadadCtlFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsadctl in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsadctl in static directory \n", getDateTime());
		return FAILURE;
	}

	accBlkFilePath = getpath("staccblk", "static");
	if ( accBlkFilePath == NULL )
	{
		printf("router | cannot get path name for the file staccblk in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file staccblk in static directory \n", getDateTime());
		return FAILURE;
	}

	usrBrnFilePath = getpath("stusrbrn", "static");
	if ( usrBrnFilePath == NULL )
	{
		printf("router | cannot get path name for the file stusrbrn in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stusrbrn in static directory \n", getDateTime());
		return FAILURE;
	}

	retMailFilePath = getpath("stretmail", "static");
	if ( retMailFilePath == NULL )
	{
		printf("router | cannot get path name for the file stretmail in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stretmail in static directory \n", getDateTime());
		return FAILURE;
	}

	pbCustFilePath = getpath("stcustpb", "static");
	if ( pbCustFilePath == NULL )
	{
		printf("router | cannot get path name for the file stcustpb in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stcustpb in static directory \n", getDateTime());
		return FAILURE;
	}

	tdLogFilePath = getpath("sttdlog", "static");
	if ( tdLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file sttdlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file sttdlog in static directory \n", getDateTime());
		return FAILURE;
	}

	ankFilePath = getpath("ank0data", "iam");
	if ( ankFilePath == NULL )
	{
		printf("router | cannot get path name for the file ank0data in iam directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file ank0data in iam directory \n", getDateTime());
		return FAILURE;
	}

	fndTabFilePath = getpath("stfundtab", "static");
	if ( fndTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stfundtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stfundtab in static directory \n", getDateTime());
		return FAILURE;
	}

	heirLogFilePath = getpath("stheirlog", "static");
	if ( heirLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stheirlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stheirlog in static directory \n", getDateTime());
		return FAILURE;
	}

	heirTabFilePath = getpath("stheirtab", "static");
	if ( heirTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file stheirtab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stheirtab in static directory \n", getDateTime());
		return FAILURE;
	}

	swiftLogFilePath = getpath("stswiftlog", "static");
	if ( swiftLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stswiftlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stswiftlog in static directory \n", getDateTime());
		return FAILURE;
	}

	sadadLogFilePath = getpath("stsadadlog", "static");
	if ( sadadLogFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsadadlog in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsadadlog in static directory \n", getDateTime());
		return FAILURE;
	}

	samaAccFilePath = getpath("stsamaacc", "static");
	if ( samaAccFilePath == NULL )
	{
		printf("router | cannot get path name for the file stsamaacc in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file stsamaacc in static directory \n", getDateTime());
		return FAILURE;
	}

	accOpenCardFilePath = getpath("staccopencard", "static");
	if ( accOpenCardFilePath == NULL )
	{
		printf("router | cannot get path name for the file staccopencard in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file staccopencard in static directory \n", getDateTime());
		return FAILURE;
	}

	cbCtlTabFilePath = getpath("cbctltab", "static");
	if ( cbCtlTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbctltab in static directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbctltab in static directory \n", getDateTime());
		return FAILURE;
	}

	cbFinCityFilePath = getpath("cbfincity", "cbcards");
	if ( cbFinCityFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbfincity in cbcards directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbfincity in cbcards directory \n", getDateTime());
		return FAILURE;
	}

	cardSeqFilePath = getpath("cbcardseq", "cbcards");
	if ( cardSeqFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbcardseq in cbcards directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbcardseq in cbcards directory \n", getDateTime());
		return FAILURE;
	}

	cbCustTabFilePath = getpath("cbcusttab", "cbcards");
	if ( cbCustTabFilePath == NULL )
	{
		printf("router | cannot get path name for the file cbcusttab in cbcards directory \n" );
		fprintf(serverLogFp, "%s : router | cannot get path name for the file cbcusttab in cbcards directory \n", getDateTime());
		return FAILURE;
	}

	return SUCCESS;
}

main( argc, argv)
int argc;
char *argv[];
{ 
	int 	response, pid;
	int     sockFd, newSockFd;			/* socket descriptors			*/
	int	sockOptVal=1;
	char	*ipAddress1;

	int 	  i, bindres;			/* general purpose integer		*/
	struct  hostent *hp;		/* result of host name lookup		*/
	struct  servent *sp;		/* result of service lookup		*/
	unsigned long inetHostAddress ;

	sprintf(progName, "%s", argv[0]);
	memset(swiftCentralizedBranches, ' ', sizeof swiftCentralizedBranches);
	memset(ignoreMemoForBrnUpd, ' ', sizeof ignoreMemoForBrnUpd);

	logFp = NULL;
	readParam();

	if ( getPathInfo() == FAILURE )
		exit(1);

	getIgnoreMemoForBrCodeUpd();

	readBankingDate();

 	/* Get our own host information */

	if ( localHost[0] == NULL )
		gethostname(localHost, MAXHOSTNAME);
	fprintf(serverLogFp, "%s| Local Host Name            : %s\n", getDateTime(), localHost);
	fflush(serverLogFp);
	if ((hp = gethostbyname(localHost)) == NULL) 
	{
		printf("router | %s| cannot get local host info?\n", localHost);
		fprintf(serverLogFp, "%s| %s | cannot get local host info\n", getDateTime(), localHost);
		exit(1);
	}

	if ( (sp = getservbyname(servicePort, "tcp")) == NULL )
	{
		printf("router | cannot get port # for server %s from services\n", servicePort);
		fprintf(serverLogFp, "%s| cannot get port # for server %s from services\n", getDateTime(), servicePort);
		exit(1);
	}

 	/* Put the socket number and our address info into the socket structure */

	sa.sin_family = AF_INET;
	sa.sin_port =  sp->s_port;
	memcpy(( char *) hp->h_addr, (char *)&sa.sin_addr, hp->h_length );

 	/* Allocate an open socket for incoming connections */

	if ((sockFd = socket(hp->h_addrtype, SOCK_STREAM, 0)) < 0) {
		printErrMsg("socket");
		exit(1);
	}

	sockOptVal=1;
	if ( setsockopt(sockFd, SOL_SOCKET, SO_REUSEADDR, (char *) &sockOptVal, sizeof(sockOptVal)) < 0 )
	{
		printf("router | Error while seting socket option(REUSEADDR): %s\n", sys_errlist[errno]);
		printErrMsg("setsockopt");
		close(sockFd);
		exit(1);
	}

	if ( setsockopt(sockFd, SOL_SOCKET, SO_KEEPALIVE, (char *) &sockOptVal, sizeof(sockOptVal)) < 0 )
	{
		printf("router | Error while seting socket option(KEEPALIVE): %s\n", sys_errlist[errno]);
		printErrMsg("setsockopt");
		close(sockFd);
		exit(1);
	}

	/* Bind the socket to the service port so we hear incoming connections */
	if ((bindres=bind(sockFd, &sa, sizeof sa)) < 0) {
		printf("router | Error while binding address : %s\n", sys_errlist[errno]);
		printErrMsg("bind");
		close(sockFd);
		exit(1);
	}

	/* Set maximum connections we will fall behind */

	listen(sockFd, SOMAXCONN);

	/* Go into an infinite loop waiting for new connections */
	/*signal(SIGUSR1	, SIG_IGN);Commented due to the problem while forking process*/
	/*signal(SIGUSR2	, SIG_IGN);Commented due to the problem while forking process*/

	signal(SIGRTMIN	, SIG_IGN);
	signal(SIGRTMAX, SIG_IGN);
	signal(SIGVTALRM, SIG_IGN);
	signal(SIGPROF	, SIG_IGN); /*_INCLUDE_XOPEN_SOURCE_EXTENDED */
	signal(SIGPOLL	, SIG_IGN); 
	signal(SIGCONT	, SIG_IGN); /* When SIGUSR1 is ignored, SIGCONT signal received */

	signal(SIGPIPE, closeConnection);
	signal(SIGQUIT, errShutdown);
	signal(SIGILL , errShutdown);
	signal(SIGTRAP, errShutdown);
	signal(SIGABRT, errShutdown);
	signal(SIGIOT , errShutdown);
	signal(SIGEMT , errShutdown);
	signal(SIGFPE , errShutdown);
	signal(SIGBUS , errShutdown);
	signal(SIGSEGV, errShutdown);
	signal(SIGSYS , errShutdown);
	signal(SIGINT , normalShutdown);
	signal(SIGTERM, normalShutdown);
	signal(SIGCHLD , reduceConnections);

	/* following signals were added to log received signals in version 8.2 */

	signal(SIGHUP	, logSignal);
	signal(SIGKILL	, logSignal);
	signal(SIGSTOP	, logSignal);
	signal(SIGTSTP	, logSignal);
	signal(SIGTTIN	, logSignal);
	signal(SIGTTOU	, logSignal);
	signal(SIGVTALRM	, logSignal);
	signal(SIGURG	, logSignal);
	signal(SIGXCPU 	, logSignal);
	signal(SIGXFSZ 	, logSignal);
	signal(SIGUSR1	, logSignal);
	signal(SIGUSR2	, logSignal);

	atexit(windup);
	while(1) 
	{
		i = sizeof isa;
		/* We hang in accept () while waiting */
		if ((newSockFd = accept(sockFd, &isa, &i)) < 0) 
		{  
			perror("accept");
			fprintf(serverLogFp, "Error %d[%s] while accepting new connections\n", errno, sys_errlist[errno]);
			fflush(serverLogFp);
			continue;
		}

		/* following lines added to restrict the number of child process V8.8*/
		if ( processCount >= concurrentProcessLimit )
		{
			fprintf(serverLogFp, "MAXIMUM NUMBER CHILD PROCESS [%d] REACHED; NO MORE CHILD PROCESS ALLOWED\n", concurrentProcessLimit);
			fflush(serverLogFp);
			/* FORM A MESSAGE AND SENT IT BACK TO CLIENT WITH newSockFd */
			formatParentSockResponse(MAX_PROCESS_REACHED, "Maximum number of process reached..Try after ");
			sendRespToNewSock(newSockResponseMsg.msgLen, newSockFd);
			sleep(5);
			close(newSockFd);
			continue;
		}
		/* V8.8 changes for restrict the child count ends */

		if ( (pid = fork()) < 0 )
		{
			perror("fork()");
			fprintf(serverLogFp, "Error while forking error=%d;%s\n", errno, sys_errlist[errno]);
			fflush(serverLogFp);
			/* FORM A MESSAGE AND SENT IT BACK TO CLIENT WITH newSockFd */
			close(newSockFd);
			continue;
		}
		else if ( pid == 0 )		/* child process */
		{
			close(sockFd);
			socketNo = newSockFd;
			signal(SIGPIPE, closeConnection); /* when the connection is closed from peer */
			printf("Spawn a new process and goes to handleMessage() for processing\n");
			handleMessage();
			exit(0);
		}
		else
		{
			close(newSockFd);		/* parrent process */
			processCount++;
			ipAddress1 = inet_ntoa(isa.sin_addr);
			fprintf(serverLogFp, "%s|%5d| Process ID %d has been spawned for request from IP %s resulting into number of child process %d with new port number as %d\n", getDateTime(), getpid(), pid, ipAddress1, processCount, isa.sin_port);
			fflush(serverLogFp);
			/*free(ipAddress1);*/
			/*free(ipAddr);*/
		}
	}
	exit(0);
}

/* receiveMessage is used to perform the main function of the server */ 

handleMessage()  /* client reinitialise the socket on error*/
{
	int retStatus, timeoutCount = 0, response = 0, msgLen = 0;
	char tmpStr[500], *responseBuf, *ipAddress;
	logFp = serverLogFp;
	PID = getpid();

	memset(clientIpAddress, ' ', sizeof clientIpAddress);
	ipAddress = (char *) inet_ntoa(isa.sin_addr);
	sprintf(tmpStr, "%-20.20s", ipAddress);
	sprintf(clientIpAddress, "%.20s", tmpStr);

	do
	{
		memset(headerMsg.msgLen, NULL, sizeof headerMsg);
		if ( retStatus = getMessage(headerMsg.msgLen, sizeof headerMsg) )  
		{
			formatRouterResponse(COMMSERR);
			sendResponse(routerResponseMsg.msgLen);
			break;
		}
		if ( commonFileOpen == NO )
		{
			openCommonLogFile();
			fprintf(logFp, "%s|%5d| Request[%.12s]; PID=%d\n", getDateTime(), PID, headerMsg.msgLen, PID);
			fflush(logFp);
		}

		if ( errLogFileOpen == NO )
		{
			openErrLogFile();
			fflush(errLogFp);
		}

		if ( expPrtFileOpen == NO )
		{
			openExpPrtFile();
			fflush(expPrtFp);
		}

		if ( csdTransExpFileOpen == NO )
		{
			openCsdTransExpFile();
			fflush(csdTransExpFp);
		}

		if ( strncmp(headerMsg.service, "97", 2) == 0 ) /* re-login request */
		{
			sprintf(tmpStr, "%.6s", headerMsg.msgLen);
			msgLen = atoi(tmpStr);
			if ( getMessage(tmpStr, msgLen - 12)  ) /* error while receiving */
				break;
			if ( openSecLogFile(ISINOUT+ISMANULOCK) == FAILURE ) 
			{
				fprintf(logFp, "%s: Open error %d for the file stseclog ... IGNORED....\n", getDateTime(), iserrno);
				fflush(logFp);
			}
			sprintf(authorisedUser, "%.10s", tmpStr);
			loginAuthorised = YES;
			continue;
		}
		if ( strncmp(headerMsg.service, "98", 2) == 0 ) /* keep conectn. alive*/
		{
			formatRouterResponse(DONE);
			sendResponse(routerResponseMsg.msgLen);
			continue;
		}

		if ( strncmp(headerMsg.service, "99", 2) == 0 ) /* Close connection */
		{
			formatRouterResponse(DONE);
			sendResponse(routerResponseMsg.msgLen);
			break;
		}

		if ( strncmp(headerMsg.service, "00", 2) >= 0 &&
			 strncmp(headerMsg.service, "10", 2) < 0 )/* Static server */
		{
            if ( debug ) fprintf(logFp, "%s|%5d| send to stLogin()\n", getDateTime(), PID );
			
			if ( stLogin(headerMsg.msgLen) == COMMSFAILURE )/* failure only when communication error */
				break;
		}
		else if (strncmp(headerMsg.service, "20", 2) < 0 )/* Static server */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stBranchInterface()\n", getDateTime(), PID );
			
			if ( stBranchInterface(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error*/ 
				break;
		}
		else if (strncmp(headerMsg.service, "50", 2) < 0 )/* Static server */
		{
			if ( debug ) fprintf(logFp, "%s|%5d|send to stBranchInterface2()\n", getDateTime(), PID );
			
			if ( stBranchInterface2(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error*/ 
				break;
		}
		else if (strncmp(headerMsg.service, "50", 2) == 0 )/* Static server */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stMaintenance()\n", getDateTime(), PID );
			if ( stMaintenance(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if (strncmp(headerMsg.service, "70", 2) < 0 )/* Static server */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stBranchInterface2()\n", getDateTime(), PID );
			
			if ( stBranchInterface2(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error*/ 
				break;
		}
		else if ( strncmp(headerMsg.service, "80", 2) < 0 )
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stSamaRegulation()\n", getDateTime(), PID);

			if ( stSamaRegulation(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "80", 2) == 0 ) /* Search Engine */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stSrchEngine()\n", getDateTime(), PID);

			if ( stSrchEngine(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "81", 2) == 0 ) /* SADAD Enquiry */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stSadadEnquiry()\n", getDateTime(), PID);

			if ( stSadadEnquiry(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "86", 2) < 0 ) /* SARIE/SWIFT transfer / Specific transaction type enquiry */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stTransferEnquiry()\n", getDateTime(), PID);

			if ( stTransferEnquiry(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "90", 2) < 0 ) /* Block amount breakup / manual blocking/ acct update history */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stBlocking()\n", getDateTime(), PID);

			if ( stBlocking(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "92", 2) < 0 )/* Security ; User Profile maintenance */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stSecurity()\n", getDateTime(), PID );
			if ( stSecurity(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "AA", 2) == 0 ) /* SADAD Control table maintenance */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stSadadEnquiry()\n", getDateTime(), PID);

			if ( stSadadEnquiry(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "AB", 2) >= 0 && strncmp(headerMsg.service, "AF",2) <= 0 )/* Return mail maintenance */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stReturnMail()\n", getDateTime(), PID);

			if ( stReturnMail(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "AG", 2) >= 0 && strncmp(headerMsg.service, "AK", 2) <= 0 ) /* Time Deposit opening  */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stTimeDepositOpening()\n", getDateTime(), PID);

			if ( stTimeDepositOpening(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "AL", 2) == 0 ) /* Online report for ATM card/ATM pin/Tpin activity from branches*/
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stOnlineReporting()\n", getDateTime(), PID);

			if ( stOnlineReporting(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error */
				break;
		}
		else if ( strncmp(headerMsg.service, "AZ", 2) >= 0 && strncmp(headerMsg.service, "BB", 2) <= 0 ) /* Account opening card print */
		{
			if ( debug ) fprintf(logFp, "%s|%5d| send to stBranchInterface2()\n", getDateTime(), PID );
			
			if ( stBranchInterface2(headerMsg.msgLen) == COMMSFAILURE ) /* failure only when communication error*/ 
				break;
		}
		else
		{
			fprintf(logFp, "%s|%5d|Invalid service code [%.2s] received..\n", getDateTime(), PID, headerMsg.service);
			fflush(logFp);
			formatRouterResponse(INCORRECTMSG);
			if ( sendResponse(routerResponseMsg.msgLen) < 0 )
				break;
			continue;
		}
	} while (1);
	fprintf(logFp, "%s|%5d| Exit the current session for Handling message\n", getDateTime(), PID);
	fflush(logFp);
	return 0;
}

/* getMessage is used to receives messages from the client */

getMessage( buffer, bufLen)
char *buffer;
int bufLen;
{
	int	 Status;	
	char tmpStr[50];
	char logRequestMsg[10000];
	int noOfRecs, i;

	union tmpRecvMsg	
	{
		struct reqMsgCustomer 			customer;
		struct reqMsgSearch 			search;
		struct reqMsgChangeAddress		changeAddress;
		struct reqMsgAccSearch			accSearch;
		struct reqMsgCardSearch			cardSearch;
		struct reqMsgCardPendingDetail 	cardPendingDetail;
		struct reqMsgCardInfo			cardInfo;
		struct reqMsgCardApproval		cardApproval;
		struct reqMsgForceCardGeneration forceCard;
		struct reqMsgCardActivate		cardActivate;
		struct reqMsgStatusUpdate		statusUpdate;
		struct reqMsgCardHistory    	cardHistory;
		struct reqMsgPrintCard			printCard;
		struct reqMsgCardRestrict		cardRestrict;
	} tmpRecdMsg;

	gettimeofday(&first, &tzp); /* to compute the elapsed microseconds */

	if ( (Status = my_read(buffer, bufLen)) <= 0) 
	{
		if (extraDebug) fprintf(logFp, "%s|%5d| getMessage(); read with error status = %d\n", getDateTime(), PID, Status);
		if ( Status == -2 )	/* Time out */
		{
			fprintf(logFp, "%s|%5d| Receive Time out\n", getDateTime(), PID);
			fflush(logFp);
			return -2;
		}
		else 	/* some other read error */
		{
			gettimeofday(&first, &tzp); /* to compute the elapsed microseconds ; to avoid showing false elapsed time */
			fprintf(logFp, "%s|%5d| Read Error %d\n", getDateTime(), PID, errno);
			fflush(logFp);
			return -1;
		}
	}

	gettimeofday(&first, &tzp); /* to compute the elapsed microseconds */

	sprintf(logRequestMsg, "%.*s", bufLen, buffer);

	/*if ( headerMsg.service[0] != NULL && extraDebug < 6 )*/
	if ( bufLen != 12  && extraDebug < 6 )
	{
		sprintf(tmpRecdMsg.customer.userId, "%.*s", bufLen, buffer);
		if ( strncmp(headerMsg.service, "59", 2) == 0 ) /* Card printing */
		{
			if ( strncmp(tmpRecdMsg.printCard.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.printCard.cardNo, tmpStr));
				strncpy(tmpRecdMsg.printCard.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "20", 2) == 0 ) /* Card request */
		{
			if ( strncmp(tmpRecdMsg.cardInfo.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardInfo.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardInfo.cardNo, tmpStr, 19);
			}

			if ( strncmp(tmpRecdMsg.cardInfo.oldCardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardInfo.oldCardNo, tmpStr));
				strncpy(tmpRecdMsg.cardInfo.oldCardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "25", 2) == 0 ) /* Card pending detail */
		{
			if ( strncmp(tmpRecdMsg.cardPendingDetail.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardPendingDetail.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardPendingDetail.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "36", 2) == 0 ) /* Card history */
		{
			if ( strncmp(tmpRecdMsg.cardHistory.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardHistory.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardHistory.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "32", 2) == 0 ) /* Card approval */
		{
			if ( strncmp(tmpRecdMsg.cardApproval.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardApproval.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardApproval.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "29", 2) == 0 ) /* Force card/pin request */
		{
			if ( strncmp(tmpRecdMsg.forceCard.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.forceCard.cardNo, tmpStr));
				strncpy(tmpRecdMsg.forceCard.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "27", 2) == 0 ) /* Status Update */
		{
			sprintf(tmpStr,"%.2s", tmpRecdMsg.statusUpdate.noOfRecs);
			noOfRecs = atoi(tmpStr);
			for(i=0; i < noOfRecs; i++)
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.statusUpdate.cardNo[i], tmpStr));
				strncpy(&tmpRecdMsg.statusUpdate.cardNo[i], tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "62", 2) == 0 ) /* card restrict/unrestrict */
		{
			if ( strncmp(tmpRecdMsg.cardRestrict.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardRestrict.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardRestrict.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "28", 2) == 0 ) /* Card deactivation */
		{
			if ( strncmp(tmpRecdMsg.cardActivate.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardActivate.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardActivate.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "49", 2) == 0 ) /* Change card delivery address */
		{
			if ( strncmp(tmpRecdMsg.changeAddress.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.changeAddress.cardNo, tmpStr));
				strncpy(tmpRecdMsg.changeAddress.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "21", 2) == 0 ) /* Account search request */
		{
			if ( strncmp(tmpRecdMsg.accSearch.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.accSearch.cardNo, tmpStr));
				strncpy(tmpRecdMsg.accSearch.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "24", 2) == 0 ) /* Card info search */
		{
			if ( strncmp(tmpRecdMsg.cardSearch.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.cardSearch.cardNo, tmpStr));
				strncpy(tmpRecdMsg.cardSearch.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "16", 2) == 0 ) /* Customer search */
		{
			if ( strncmp(tmpRecdMsg.search.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpRecdMsg.search.cardNo, tmpStr));
				strncpy(tmpRecdMsg.search.cardNo, tmpStr, 19);
			}
		}
		sprintf(logRequestMsg, "%.*s", bufLen, tmpRecdMsg.customer.userId);
	}

	if ( (strncmp(headerMsg.service, "13", 2) && strncmp(headerMsg.service, "50", 2))  || extraDebug ) /* not refresh request */
	{
		if ( bufLen < 1500 )
			fprintf(logFp, "%s|%5d| Request :[%.*s]\n", getDateTime(), PID, bufLen, logRequestMsg);
		else if ( bufLen < 3000 )
		{
			fprintf(logFp, "%s|%5d| Request :[%.1500s\n", getDateTime(), PID,  logRequestMsg);
			fprintf(logFp, "%s|%5d| Request :%.1500s]\n", getDateTime(), PID, &logRequestMsg[1500]);
		}
		else if ( bufLen < 4500 )
		{
			fprintf(logFp, "%s|%5d| Request :[%.1500s\n", getDateTime(), PID,  logRequestMsg);
			fprintf(logFp, "%s|%5d| Request :%.1500s\n", getDateTime(), PID, &logRequestMsg[1500]);
			fprintf(logFp, "%s|%5d| Request :%.1500s]\n", getDateTime(), PID, &logRequestMsg[3000]);
		}
		else
		{
			fprintf(logFp, "%s|%5d| Request :[%.1500s\n", getDateTime(), PID, logRequestMsg);
			fprintf(logFp, "%s|%5d| Request :%.1500s\n", getDateTime(), PID, &logRequestMsg[1500]);
			fprintf(logFp, "%s|%5d| Request :%.1500s\n", getDateTime(), PID, &logRequestMsg[3000]);
			fprintf(logFp, "%s|%5d| Request :%.1500s]\n", getDateTime(), PID, &logRequestMsg[4500]);
		}
	}
	fflush(logFp);
	return 0 ;
}

/* my_read is used to receive the messages from the client. 
   If anything wrong in transmission, or network connection 
   the server will time out.*/

my_read(buffer, length)
char *buffer;
int  length;
{ 
	int received, totReceived=0, recvTry=1, i=0;
	char tmpStr[4096];
	struct timeval timeout;
	fd_set fd_in;

	FD_ZERO(&fd_in);
	FD_SET(socketNo, &fd_in);

	timeoutFlag = errno = 0;
	do
	{
		alarm(0);
		timeout.tv_sec = clientTimeOut;
		timeout.tv_usec = 0;
		if ( (received = select(socketNo+1, &fd_in, (fd_set *)0, (fd_set *)0, &timeout)) <= 0 )
		{
			fprintf(logFp,"%s|%5d| Select Error %d; Connection lost with client; quiting the process\n", getDateTime(), PID, errno);
			fclose(logFp);
			closeExit(0);
		}
		signal(SIGALRM, toAlarm);
		alarm(timeOut);
		if ( (received = recv (socketNo, buffer, length, 0)) <= 0 )
			printErrMsg("read from socket");
		if ( (received == 0 && errno == 0) || received < 0 )
		{
			totReceived = -1;
			break; /* earlier this was sleep 2 - 19/08/2000*/
		}
		if ( timeoutFlag )
		{
			fprintf(logFp, "%s|%5d|TimedOut while receiving message from client for the first time\n", getDateTime(), PID);
			break;
		}
		totReceived = received;
		while ( totReceived < length)
		{
			fprintf(logFp, "%s|%5d| expected %d; received %d; receiving for the %d time\n", getDateTime(), PID, length, totReceived, ++recvTry);
			memset(tmpStr, NULL, sizeof tmpStr);
			if ( (received = recv (socketNo, tmpStr, length-totReceived, 0)) <= 0 )
				printErrMsg("read from socket");
			if ( (received == 0 && errno == 0) || received < 0 )
			{
				totReceived = -1;
				break; /* earlier this was sleep 2 - 19/08/2000*/
			}
			if ( timeoutFlag )
			{
				fprintf(logFp, "%s|%5d| TimedOut while receiving message from client for the %d time\n", getDateTime(), PID, recvTry);
				break;
			}
			fprintf(logFp, "%s|%5d|  Received for the %d time[%s]\n", getDateTime(), PID, recvTry, tmpStr);
			memcpy(&buffer[totReceived], tmpStr, received);
			totReceived += received;
			/*
			if ( totReceived < length )
			{
				fprintf(logFp, "%s|%5d| expected %d; received %d; receiving for the third time\n", getDateTime(), PID, length, totReceived);
				fflush(logFp);
				memset(tmpStr, NULL, sizeof tmpStr);
				if ( (received = recv (socketNo, tmpStr, length-totReceived, 0)) <= 0 )
					printErrMsg("read from socket");
				if ( (received == 0 && errno == 0) || received < 0 )
				{
					totReceived = -1;
					break; /* earlier this was sleep 2 - 19/08/2000
				}
				if ( timeoutFlag )
				{
					fprintf(logFp, "%s|%5d| TimedOut while receiving message from client for the third time\n", getDateTime(), PID);
					break;
				}
				fprintf(logFp, "%s|%5d| Received for the third time[%s]\n", getDateTime(),PID, tmpStr);
				memcpy(&buffer[totReceived], tmpStr, received);
				totReceived += received;
				if ( totReceived < length )
				{
					fprintf(logFp, "%s|%5d| WARNING: RECEIVE IS NOT COMPLETE EVEN AFTER 3 TRIES FROM PID=%d; REPORT TO COMMS\n", getDateTime(), PID, getpid());
					fflush(logFp);
					totReceived=-1;
					break;
				}
			}
			*/
		}

		for ( i=0; i < totReceived; i++ ) /* to remove null in incoming message */
			if ( buffer[i] == NULL )
				buffer[i] = ' ';

		if ( timeoutFlag )		/* when get timed out during sleep */
		{
			fprintf(logFp, "%s|%5d| TimedOut while receiving message from client\n", getDateTime(), PID);
			break;
		}
		alarm(0);
	} while ( received == 0 && errno == 0 );
	fflush(logFp);
	alarm(0);
	if ( timeoutFlag )
		return -2;
	if ( errno ) /* some read Error */
		return -1;
	return(totReceived);
}

/* SendMessage is used to send messages to the clients. if anything wrong
   in transmission, or network connection the server will time out.*/

sendResponse(buffer)
char *buffer;
{ 
	int retStatus;
	char elapsedTime[100];
	char logResponseMsg[10000];
	char tmpStr[50], tmpStr1[50];
	int  noOfRecs, i;

	union tmpResMsg 
	{
		struct resMsgCustomer    	customer;
		struct resMsgCardSearch		cardSearch;
		struct resMsgCardInfo		cardInfo;
		struct resMsgCardPendingList cardPendingList;
		struct resMsgCardPendingDetail cardPendingDetail;
		struct resMsgCardApproval	cardApproval;
		struct resMsgStatusList		statusList;
		struct resMsgCardHistory    cardHistory;
		struct resMsgCardUpdateHistory	cardUpdateHistory;
		struct resMsgCardActivityReport		cardActivityReport;
	} tmpResponseMsg;

	/* following 6 lines are required to compute the elapsed time the request is taken */
	gettimeofday(&second, &tzp);
	if ( first.tv_usec > second.tv_usec) 
	{
		second.tv_usec += 1000000;
		second.tv_sec--;
	}

	sprintf(logResponseMsg, "%s", buffer);

	if ( extraDebug < 6 )
	{
		sprintf(tmpResponseMsg.customer.msgLen, "%s", logResponseMsg);
		if ( strncmp(headerMsg.service, "23", 2) == 0 ) /* Card pending list */
		{
			sprintf(tmpStr,"%.2s", tmpResponseMsg.cardPendingList.noOfRecs);
			noOfRecs = atoi(tmpStr);
			for(i=0; i < noOfRecs; i++)
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardPendingList.details[i].cardNo, tmpStr));
				strncpy(tmpResponseMsg.cardPendingList.details[i].cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "20", 2) == 0 || strncmp(headerMsg.service, "29", 2) == 0 ) /* Card Request */
		{
			if ( strncmp(tmpResponseMsg.cardInfo.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardInfo.cardNo, tmpStr));
				strncpy(tmpResponseMsg.cardInfo.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "25", 2) == 0 ) /* Card pending detail */
		{
			if ( strncmp(tmpResponseMsg.cardPendingDetail.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardPendingDetail.cardNo, tmpStr));
				strncpy(tmpResponseMsg.cardPendingDetail.cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "36", 2) == 0 ) /* Card history */
		{
			if ( receivedMsg.cardHistory.msgType == '1' ) /* card update history */
			{
				if ( strncmp(tmpResponseMsg.cardUpdateHistory.cardNo, "                              ", 19) )
				{
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardUpdateHistory.cardNo, tmpStr));
					strncpy(tmpResponseMsg.cardUpdateHistory.cardNo, tmpStr, 19);
				}
			}
		}
		else if ( strncmp(headerMsg.service, "32", 2) == 0 ) /* Card approval */
		{
			if ( strncmp(tmpResponseMsg.cardApproval.cardNo, "                              ", 19) )
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardApproval.cardNo, tmpStr));
				strncpy(tmpResponseMsg.cardApproval.cardNo, tmpStr, 19);
			}

			if ( strncmp(tmpResponseMsg.cardApproval.cardNo, "455036", 6) == 0 )
			{
				if ( strncmp(tmpResponseMsg.cardApproval.trk1, "                                   ", 16) )
				{
					sprintf(tmpStr, "%.16s      ", tmpResponseMsg.cardApproval.trk1);
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpStr, tmpStr1));
					strncpy(tmpResponseMsg.cardApproval.trk1, tmpStr, 16);
				}

				if ( strncmp(tmpResponseMsg.cardApproval.trk2, "                                   ", 19) )
				{
					sprintf(tmpStr, "%.16s      ", tmpResponseMsg.cardApproval.trk2);
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpStr, tmpStr1));
					strncpy(tmpResponseMsg.cardApproval.trk2, tmpStr, 16);
				}
			}
			else
			{
				if ( strncmp(tmpResponseMsg.cardApproval.trk1, "                                   ", 19) )
				{
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardApproval.trk1, tmpStr));
					strncpy(tmpResponseMsg.cardApproval.trk1, tmpStr, 19);
				}

				if ( strncmp(tmpResponseMsg.cardApproval.trk2, "                                   ", 19) )
				{
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardApproval.trk2, tmpStr));
					strncpy(tmpResponseMsg.cardApproval.trk2, tmpStr, 19);
				}
			}
		}
		else if ( strncmp(headerMsg.service, "24", 2) == 0 ) /* Card info search */
		{
			sprintf(tmpStr,"%.2s", tmpResponseMsg.cardSearch.noOfRecs);
			noOfRecs = atoi(tmpStr);
			for(i=0; i < noOfRecs; i++)
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardSearch.details[i].cardNo, tmpStr));
				strncpy(tmpResponseMsg.cardSearch.details[i].cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "26", 2) == 0 ) /* Status list */
		{
			sprintf(tmpStr,"%.2s", tmpResponseMsg.statusList.noOfRecs);
			noOfRecs = atoi(tmpStr);
			for(i=0; i < noOfRecs; i++)
			{
				sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.statusList.details[i].cardNo, tmpStr));
				strncpy(tmpResponseMsg.statusList.details[i].cardNo, tmpStr, 19);
			}
		}
		else if ( strncmp(headerMsg.service, "AL", 2) == 0 ) /* Card/PIN daily activity report */
		{
			sprintf(tmpStr,"%.2s", tmpResponseMsg.cardActivityReport.noOfRecs);
			noOfRecs = atoi(tmpStr);
			for(i=0; i < noOfRecs; i++)
			{
				if ( tmpResponseMsg.cardActivityReport.reportType == 'P' )
				{
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardActivityReport.reportDetail.pinDetails[i].cardNo, tmpStr));
					strncpy(tmpResponseMsg.cardActivityReport.reportDetail.pinDetails[i].cardNo, tmpStr, 19);
				}
				else
				{
					sprintf(tmpStr, "%-19.19s", maskCardNo(tmpResponseMsg.cardActivityReport.reportDetail.cardDetails[i].cardNo, tmpStr));
					strncpy(tmpResponseMsg.cardActivityReport.reportDetail.cardDetails[i].cardNo, tmpStr, 19);
				}
			}
		}
		sprintf(logResponseMsg, "%s", tmpResponseMsg.customer.msgLen);
	}

	if ( (strncmp(headerMsg.service, "13", 2) && strncmp(headerMsg.service, "50", 2))  || extraDebug ) /* not maintenance/refresh request */
	{
		sprintf(elapsedTime, "Elapsed seconds=%d; Milliseconds=%d", second.tv_sec - first.tv_sec, (second.tv_usec - first.tv_usec)/1000);
		if ( strlen(logResponseMsg) < 1500 )
			fprintf(logFp, "%s|%5d|Response:[%.1500s]; %s\n", getDateTime(), PID, logResponseMsg, elapsedTime);
		else if ( strlen(logResponseMsg) < 3000 )
		{
			fprintf(logFp, "%s|%5d|Response:[%.1500s\n", getDateTime(), PID, logResponseMsg);
			fprintf(logFp, "%s|%5d|Response:%.1500s];%s\n", getDateTime(), PID, &logResponseMsg[1500], elapsedTime);
		}
		else if ( strlen(logResponseMsg) < 4500 )
		{
			fprintf(logFp, "%s|%5d|Response:[%.1500s\n", getDateTime(), PID, logResponseMsg);
			fprintf(logFp, "%s|%5d|Response:%.1500s\n", getDateTime(), PID, &logResponseMsg[1500]);
			fprintf(logFp, "%s|%5d|Response:%.1500s];%s\n", getDateTime(), PID, &logResponseMsg[3000], elapsedTime);
		}
		else
		{
			fprintf(logFp, "%s|%5d|Response:[%.1500s\n", getDateTime(), PID, logResponseMsg);
			fprintf(logFp, "%s|%5d|Response:%.1500s\n", getDateTime(), PID, &logResponseMsg[1500]);
			fprintf(logFp, "%s|%5d|Response:%.1500s\n", getDateTime(), PID, &logResponseMsg[3000]);
			fprintf(logFp, "%s|%5d|Response:%.1500s];%s\n", getDateTime(), PID, &logResponseMsg[4500], elapsedTime);
		}
	}
	fflush(logFp);
	timeoutFlag = errno = 0;
	signal(SIGALRM, toAlarm);
	alarm(timeOut);
	if ( (retStatus = write (socketNo, buffer, strlen(buffer)) ) < 0 )
		printErrMsg("write to socket");
	alarm(0);
	if ( errno || (retStatus != strlen(buffer)) )
	{
		fprintf(logFp, "%s|%5d| Problem during send reply; To be send %d; send %d\n", getDateTime(), PID, strlen(buffer), retStatus);
		return -1;
	}
	if ( timeoutFlag )
	{
		fprintf(logFp, "%s|%5d| TimedOut during sending response to client\n", getDateTime(), PID);
		formatRouterResponse(COMMSERR);
		return -1;
	}
	return retStatus;
}

sendRespToNewSock(char *buffer, int newSocketNo)
{
	int retStatus;
	errno=0;
	if ( (retStatus = write (newSocketNo, buffer, strlen(buffer)) ) < 0 )
		printErrMsg1("write to new socket");

	if ( errno || (retStatus != strlen(buffer)) )
	{
		fprintf(serverLogFp, "%s| Problem during send reply; To be send %d; send %d; errno [%d:%s]\n", getDateTime(), strlen(buffer), retStatus, errno, sys_errlist[errno]);
		fflush(serverLogFp);
		return -1;
	}
	
	return retStatus;
}

printErrMsg1(functionName)
char *functionName;
{
	if ( errno <= sys_nerr )
	{
		fprintf(serverLogFp, "%s| %s : Error %d:%s\n", getDateTime(), PID, functionName, errno, sys_errlist[errno]);
	}
	else
	{
		fprintf(serverLogFp, "%s|%s : Serious error, error number[%d] exceeds the system maximum\n", getDateTime(), PID, functionName, errno);
	}
}

printErrMsg(functionName)
char *functionName;
{
	if ( errno <= sys_nerr )
	{
		fprintf(logFp, "%s|%5d| %s : Error %d:%s\n", getDateTime(), PID, functionName, errno, sys_errlist[errno]);
		fprintf(serverLogFp, "%s|%5d| %s : Error %d:%s\n", getDateTime(), PID, functionName, errno, sys_errlist[errno]);
	}
	else
	{
		fprintf(logFp, "%s|%5d|%s : Serious error, error number[%d] exceeds the system maximum\n", getDateTime(), PID, functionName, errno);
		fprintf(serverLogFp, "%s|%5d|%s : Serious error, error number[%d] exceeds the system maximum\n", getDateTime(), PID, functionName, errno);
	}
}

void toAlarm()
{
	timeoutFlag = 1;
}

void serviceAlarm()
{
	serviceTimeoutFlag = 1;
	fprintf(logFp, "Inside serviceAlarm, timout flag [%d]\n", serviceTimeoutFlag);
	fflush(logFp);
}

readParam()
{
	FILE	*fptr;
	char	tmpStr[40], inBuf[80], option[40], value[40],  value1[40],
			*ptrInBuf, *pathName ;
	int 	firstPortion = 0, secondPortion = 0, portNo=0, i, j, k;

	sprintf(tmpStr, "%s.cfg", progName);
	if ( ( fptr = fopen ( tmpStr, "r" )) == NULL ) 
	{
		printf ( "router | Parameter File %s does not exist !!\n", tmpStr) ;
		perror ( tmpStr);
		printf ( "router | fatal error.. Job aborted !!\n");
		exit (1);
	}

	/* open the Log File */
	sprintf(tmpStr, "%sSrv.log", progName);

	pathName = getpath(tmpStr, "log");
	if ( ( serverLogFp = fopen(pathName,"a")) == NULL) 
	{
		perror (pathName);
		printf ( "router : Unable to open logfile(%s).. Job aborted !!\n", pathName);
		exit (1);
	}
	free(pathName);
	memset(servicePort, '\0', sizeof(servicePort));
	memset(localHost, '\0', sizeof(localHost));
	memset(sadadMaxBills, '\0',  sizeof sadadMaxBills);
	memset(sadadAccessChannel, '\0',  sizeof sadadAccessChannel);
	timeOut = extraDebug = debug = 0;
	checkAList = checkBList = checkCList = 1;
	memset(postingUserId, NULL, sizeof postingUserId);
	memset(postingTransType, NULL, sizeof postingTransType);
	memset(pckBranchCode, NULL, sizeof pckBranchCode);
	memset(tdPostingUserId, NULL, sizeof tdPostingUserId);
	memset(swiftContraAccNo, NULL, sizeof swiftContraAccNo);
	concurrentProcessLimit=700;
	sadadTimeOut=28;
	dormantAccPosting='0';
	dcOrMxFlag='D';
	serviceTimeout=60;
	autoLoginAllowedFlag=YES;

	/* parse for the options and values */

	while ( fgets ( inBuf, 80, fptr ) ) 
	{
		ptrInBuf = inBuf;
		firstPortion = 1;
		secondPortion = 1;
		memset(option, '\0', sizeof option);
		memset(value, '\0',  sizeof value);
		memset(value1, '\0',  sizeof value1);
		for(i=0,j=0,k=0; *ptrInBuf; ptrInBuf++ )
		{
			if ( *ptrInBuf == ' ' || *ptrInBuf == '\n' ) /* ignore space */
				continue;
			if ( *ptrInBuf == '=' )
			{
				firstPortion = 0;
				continue;
			}
			if ( *ptrInBuf == '@' )
			{
				secondPortion = 0;
				continue;
			}
			if ( firstPortion )
				option[i++] = *ptrInBuf;
			else if ( secondPortion )
				value[j++]  = *ptrInBuf;
			else
				value1[k++] = *ptrInBuf;
		}
		option[i] = value[j] = value1[k] = '\0';

		printf("router : option = %s; value=%s %s\n", option, value, value1);
		fprintf(serverLogFp, "option = %s; value=%s %s.\n", option, value, value1);

		if ( strncmp(option, "LOCALHOST", 8) == 0 ) 
			sprintf(localHost, "%.30s", value);
		else if ( strncmp(option, "SERVICEPORT", 10) == 0 ) 
			sprintf(servicePort, "%.20s", value);
		else if ( strncmp(option, "DEBUG", 5) == 0 )
			debug = value[0] - '0';
		else if ( strncmp(option, "EXTRADEBUG", 10) == 0 )
			extraDebug = value[0] - '0';
		else if ( strncmp(option, "TIMEOUT", 7) == 0 )
			timeOut = atoi(value);
		else if ( strncmp(option, "CHECKALIST", 10) == 0 )
			checkAList = atoi(value);
		else if ( strncmp(option, "CHECKBLIST", 10) == 0 )
			checkBList = atoi(value);
		else if ( strncmp(option, "CHECKCLIST", 10) == 0 )
			checkCList = atoi(value);
		else if ( strcmp(option, "CLIENTTIMEOUT") == 0 )
			clientTimeOut = atoi(value);
		else if ( strncmp(option, "HSMKEY1", 10) == 0 )
			hsmKey1 = atoi(value);
		else if ( strncmp(option, "HSMKEY2", 10) == 0 )
			hsmKey2 = atoi(value);
		else if ( strncmp(option, "B24KEY1", 10) == 0 )
			b24Key1 = atoi(value);
		else if ( strncmp(option, "B24KEY2", 10) == 0 )
			b24Key2 = atoi(value);
		else if ( strcmp(option, "SEARCHTIME") == 0 )
			searchTimeOut = atoi(value);
		else if ( strcmp(option, "IDLETIMEOUT") == 0 )
			idleTimeOut = atoi(value);
		else if ( strncmp(option, "SEARCHENGINELEVEL", 17) == 0 )
			searchEngineLevel = value[0];
		else if ( strncmp(option, "ENABLESEARCHENGINE", 18) == 0 )
			searchEngineCallReqd = value[0] - '0';
		else if ( strncmp(option, "SADADMAXBILLS", 13) == 0 )
			sprintf(sadadMaxBills, "%.3s", value);
		else if ( strncmp(option, "SADADACCESSCHANNEL", 18) == 0 )
			sprintf(sadadAccessChannel, "%s", value);
		else if ( strncmp(option, "POSTINGUSERID", 13) == 0 )
			sprintf(postingUserId, "%s", value);
		else if ( strncmp(option, "POSTINGTRANSTYPE", 16) == 0 )
			sprintf(postingTransType, "%s", value);
		else if ( strncmp(option, "PCKBRANCHCODE", 13) == 0 )
			sprintf(pckBranchCode, "%s", value);
		else if ( strncmp(option, "TDPOSTINGUSERID", 15) == 0 )
			sprintf(tdPostingUserId, "%s", value);
		else if ( strncmp(option, "SWIFTCONTRAACC", 14) == 0 )
			sprintf(swiftContraAccNo, "%s", value);
		else if ( strncmp(option, "PROCESSLIMIT", 12) == 0 )
			concurrentProcessLimit = atoi(value);
		else if ( strncmp(option, "SADADTIMEOUT", 12) == 0 )
			sadadTimeOut = atoi(value);
		else if ( strncmp(option, "DORMANTPOSTING", 14) == 0 )
			dormantAccPosting = value[0];
		else if ( strncmp(option, "SERVICETIMEOUT", 14) == 0 )
			serviceTimeout = atoi(value);
		else if ( strncmp(option, "DCMXFLAG", 8) == 0 )
			dcOrMxFlag = value[0];
		else if ( strncmp(option, "AUTOLOGINALLOWED", 16) == 0 )
			autoLoginAllowedFlag = value[0] - '0';
		else
			printf("router : Unreganised option %s with value %s ingored\n", option, value);
	}
	fclose(fptr);
	if ( servicePort[0] == '\0' )
	{
		printf("router : SERVICEPORT is not defined; please define in %s.cfg and rerun\n", progName);
		fprintf(serverLogFp, "router : SERVICEPORT is not defined; please define in %s.cfg and rerun\n", progName);
		exit(1);
	}

	if ( timeOut == 0 )
	{
		printf("router : TIMEOUT is not defined; please define in %s.cfg and rerun\n", progName);
		fprintf(serverLogFp, "TIMEOUT is not defined; please define in %s.cfg and rerun\n", progName);
		exit(1);
	}

	if ( sadadMaxBills[0] == NULL )
	{
		printf("router : SADADMAXBILLS is not defined; defaulted to 050\n", progName);
		fprintf(serverLogFp, "SADADMAXBILLS is not defined; defaulted to 050 \n", progName);
		sprintf(sadadMaxBills, "050");
	}

	if ( sadadAccessChannel[0] == NULL )
	{
		printf("router : SADADACCESSCHANNEL is not defined; defaulted to PORTAL\n", progName);
		fprintf(serverLogFp, "SADADACCESSCHANNEL is not defined; defaulted to PORTAL \n", progName);
		sprintf(sadadAccessChannel, "PORTAL");
	}

	if ( postingUserId[0] == NULL )
	{
		printf("router : POSTINGUSERID is not defined; defaulted to 889\n", progName);
		fprintf(serverLogFp, "POSTINGUSERID is not defined; defaulted to 889 \n", progName);
		sprintf(postingUserId, "889");
	}
	sprintf(postingUserId, "%-4.4s", postingUserId);

	if ( postingTransType[0] == NULL )
	{
		printf("router : POSTINGTRANSTYPE is not defined; defaulted to 36\n", progName);
		fprintf(serverLogFp, "POSTINGTRANSTYPE is not defined; defaulted to 36 \n", progName);
		sprintf(postingTransType, "36");
	}

	if ( pckBranchCode[0] == NULL )
	{
		printf("router : PCKBRANCHCODE is not defined; defaulted to 0499\n", progName);
		fprintf(serverLogFp, "PCKBRANCHCODE is not defined; defaulted to 0499 \n", progName);
		sprintf(pckBranchCode, "0499");
	}

	if ( tdPostingUserId[0] == NULL )
	{
		printf("router : TDPOSTINGUSERID is not defined; defaulted to 889\n", progName);
		fprintf(serverLogFp, "TDPOSTINGUSERID is not defined; defaulted to 889 \n", progName);
		sprintf(tdPostingUserId, "889");
	}
	sprintf(tdPostingUserId, "%-4.4s", tdPostingUserId);

	if ( swiftContraAccNo[0] == NULL )
	{
		printf("router : SWIFTCONTRAACC is not defined; defaulted to 33500049955\n", progName);
		fprintf(serverLogFp, "SWIFTCONTRAACC is not defined; defaulted to 33500049955 \n", progName);
		sprintf(swiftContraAccNo, "33500049955");
	}

	fprintf(serverLogFp,  "SERVER time start          : %s.\n",getDateTime());
	fprintf (serverLogFp, "ReceiveTimeOut             :  %-4d Seconds.\n"   , timeOut);
	fprintf (serverLogFp, "ClientTimeOut              :  %-4d Seconds.\n"   , clientTimeOut);
	fprintf (serverLogFp, "Client  Idle TimeOut       :  %-4d Seconds.\n"   , idleTimeOut);
	fprintf (serverLogFp, "Search Time out            :  %-4d Seconds.\n"   , searchTimeOut);
	fprintf (serverLogFp, "SADAD Time out             :  %-4d Seconds.\n"   , sadadTimeOut);
	fprintf (serverLogFp, "SERVICE Time out           :  %-4d Seconds.\n"   , serviceTimeout);
	fprintf (serverLogFp, "Concurrent process limit   :  %-5d Processes.\n"   , concurrentProcessLimit);
	if ( debug == 0 )
		fprintf (serverLogFp, "Debug option               :  RE-SET.\n");
	else
		fprintf (serverLogFp, "Debug option               :  SET.\n");
	fprintf(serverLogFp,"==========================================================\n\n");
	fflush(serverLogFp);

	emvValue1=emvValue2=emvValue3=emvValue4=emvValue5=emvValue6=emvValue7 = ' ';;

	pathName=getpath("emv.cfg", "cbcards");
	if ( ( fptr = fopen ( pathName, "r" )) == NULL ) 
	{
		fprintf (serverLogFp, "%s: router | EMV configuration File %s does not exist ignored and taken the default value  as space !!\n", getDateTime(), pathName) ;
		free(pathName);
		return 0;
	}
	free(pathName);

	while ( fgets ( inBuf, 80, fptr ) ) 
	{
		ptrInBuf = inBuf;
		firstPortion = 1;
		secondPortion = 1;
		memset(option, '\0', sizeof option);
		memset(value, '\0',  sizeof value);
		memset(value1, '\0',  sizeof value1);
		for(i=0,j=0,k=0; *ptrInBuf; ptrInBuf++ )
		{
			if ( *ptrInBuf == ' ' || *ptrInBuf == '\n' ) /* ignore space */
				continue;
			if ( *ptrInBuf == '=' )
			{
				firstPortion = 0;
				continue;
			}
			if ( *ptrInBuf == '@' )
			{
				secondPortion = 0;
				continue;
			}
			if ( firstPortion )
				option[i++] = *ptrInBuf;
			else if ( secondPortion )
				value[j++]  = *ptrInBuf;
			else
				value1[k++] = *ptrInBuf;
		}
		option[i] = value[j] = value1[k] = '\0';

		if ( debug == YES )
			fprintf(serverLogFp, "option = %s; value=%s %s.\n", option, value, value1);

		if ( strncmp(option, "CONFIG1", 7) == 0 )
			emvValue1 = value[0];
		else if ( strncmp(option, "CONFIG2", 7) == 0 )
			emvValue2 = value[0];
		else if ( strncmp(option, "CONFIG3", 7) == 0 )
			emvValue3 = value[0];
		else if ( strncmp(option, "CONFIG4", 7) == 0 )
			emvValue4 = value[0];
		else if ( strncmp(option, "CONFIG5", 7) == 0 )
			emvValue5 = value[0];
		else if ( strncmp(option, "CONFIG6", 7) == 0 )
			emvValue6 = value[0];
		else if ( strncmp(option, "CONFIG7", 7) == 0 )
			emvValue7 = value[0];
	}

	return 0;
}

void  logSignal(int i)
{
	fprintf(serverLogFp, "%s|%5d|logSignal : Signal <%d> received; ignored... \n\n\n", getDateTime(), PID, i);
	/*fprintf(logFp, "%s|%5d|logSignal : Signal <%d> received; ignored... \n\n\n", getDateTime(), PID, i);
	fflush(logFp); */
	fflush(serverLogFp);
	signal(i, logSignal);
}

void windup()
{
	iscleanup();
	fclose(logFp);
}

void  reduceConnections() /* function called by parrent process while receivin SIGCLD */
{
	int stat_loc;
	pid_t childPid;
	fprintf(serverLogFp, "%s|%5d|reduceConnections(): Received SIGCLD signal\n", getDateTime(), getpid());

	if (  (childPid = waitpid( (pid_t) -1, &stat_loc, WNOHANG) ) )
	{
		if ( processCount > 0 )
			processCount--;
		fprintf(serverLogFp, "%s|%5d|reduceConnections(): Received SIGCLD signal from PID [%d] with status [%d]; so reducing the process count. Number of current child process=%d\n", getDateTime(), getpid(), childPid, WIFEXITED(stat_loc), processCount);
		fflush(serverLogFp);
	}
	signal(SIGCHLD, reduceConnections);
}

void  normalShutdown()
{
	fprintf(serverLogFp, ">>>>>> %s|%5d|normalShutdown():  Static Server Terminted by user <<<<<\n", getDateTime(), getpid());
	fclose(serverLogFp);
	close(socketNo);
	exit(0);
}

void  closeConnection() /* called when SIGPIPE received by child process */
{
	fprintf(serverLogFp, ">>>>>> %s|%5d|closeConnection():  Connection lost from peer(SIGPIPE); So closing down static server instance of branch=%.4s <<<<<\n", getDateTime(), getpid(), headerMsg.homeBranch);
	fclose(serverLogFp);
	if ( commonFileOpen == YES )
	{
		fprintf(logFp, ">>>>>> %s|%5d|closeConnection():  Connection lost from peer(SIGPIPE); So closing down static server instance of branch=%.4s <<<<<\n", getDateTime(), getpid(), headerMsg.homeBranch);
		fclose(logFp);
	}
	shutdown(socketNo, 2);
	close(socketNo);
	iscleanup();
	exit(0);
}


void errShutdown( i )
int i;
{
	fprintf(serverLogFp, ">>>>>> %s|%5d|errShutdown(): Signal <%d> received; Process Terminated due to Software errors... : branchCode=%.4s\n\n\n", getDateTime(), getpid(), i, headerMsg.homeBranch);
	fclose(serverLogFp);
	if ( commonFileOpen == YES )
	{
		fprintf(logFp, ">>>>>> %s|%5d|errShutdown(): Signal <%d> received; Process Terminated due to Software errors... : branchCode=%.4s\n\n\n", getDateTime(), getpid(), i, headerMsg.homeBranch);
		fclose(logFp);
	}
	formatRouterResponse(INTERNALERR);
	sendResponse(routerResponseMsg.msgLen);
	close(socketNo);
	iscleanup();
	exit(1);
}

formatRouterResponse(responseCode)
char *responseCode;
{
	char tmpStr[20];
	memset(routerResponseMsg.msgLen, ' ', sizeof(routerResponseMsg.msgLen));
	routerResponseMsg.nullPad = '\0';
	sprintf(tmpStr, "%06d", sizeof routerResponseMsg - 1);
	strncpy(routerResponseMsg.msgLen, tmpStr, 6);
	strncpy(routerResponseMsg.status, responseCode, 3);
	strncpy(routerResponseMsg.service, headerMsg.service, 2);
}

formatParentSockResponse(responseCode, message)
char *responseCode, *message;
{
	char tmpStr[70];
	memset(newSockResponseMsg.msgLen, ' ', sizeof(newSockResponseMsg.msgLen));
	newSockResponseMsg.nullPad = '\0';
	sprintf(tmpStr, "%06d", sizeof newSockResponseMsg - 1);
	strncpy(newSockResponseMsg.msgLen, tmpStr, 6);
	strncpy(newSockResponseMsg.status, responseCode, 3);
	strncpy(newSockResponseMsg.service, "  ", 2);
	sprintf(tmpStr, "%-55.50s", message);
	strncpy(newSockResponseMsg.message, tmpStr, 50);
}

openCommonLogFile()
{
	char *pathName, tmpStr[100];

	if ( commonFileOpen == YES )
		return SUCCESS;

	sprintf(tmpStr, "%s%.4s.log", progName, headerMsg.homeBranch);
	pathName = getpath(tmpStr, "log");
	if ( (logFp = fopen( pathName, "a+")) == NULL )
	{
		perror(pathName);
		printf("Error %d while opening the log file %s.\n", errno, pathName);
		formatRouterResponse(INTERNALERR);
		sendResponse(routerResponseMsg.msgLen);
		free(pathName);
		return FAILURE;
	}
	free(pathName);

	commonFileOpen = YES;
	return SUCCESS;
}

openErrLogFile()
{
	char *pathName, tmpStr[100];

	if ( errLogFileOpen == YES )
		return SUCCESS;

	pathName = getpath("sterror.log", "log");
	if ( (errLogFp = fopen( pathName, "a+")) == NULL )
	{
		perror(pathName);
		printf("Error %d while opening the global error log file %s.\n", errno, pathName);
		formatRouterResponse(INTERNALERR);
		sendResponse(routerResponseMsg.msgLen);
		free(pathName);
		return FAILURE;
	}
	free(pathName);

	errLogFileOpen = YES;
	return SUCCESS;
}

openExpPrtFile()
{
	char *pathName, tmpStr[100];

	if ( expPrtFileOpen == YES )
		return SUCCESS;

	getDateTime();
	sprintf(tmpStr, "stsarserv.exp.%04d%02d%02d", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	pathName = getpath(tmpStr, "spool");
	if ( (expPrtFp = fopen( pathName, "a+")) == NULL )
	{
		perror(pathName);
		printf("Error %d while opening the global error report file %s.\n", errno, pathName);
		formatRouterResponse(INTERNALERR);
		sendResponse(routerResponseMsg.msgLen);
		free(pathName);
		return FAILURE;
	}
	free(pathName);
	/*headerPrintException();*/

	expPrtFileOpen = YES;
	return SUCCESS;
}

openCsdTransExpFile()
{
	char *pathName, tmpStr[100];

	if ( csdTransExpFileOpen == YES )
		return SUCCESS;

	getDateTime();
	sprintf(tmpStr, "csdtransexp.%04d%02d%02d.prt", systemDate->tm_year+1900, systemDate->tm_mon+1, systemDate->tm_mday);
	pathName = getpath(tmpStr, "spool");
	if ( (csdTransExpFp = fopen( pathName, "a+")) == NULL )
	{
		perror(pathName);
		printf("Error %d while opening the global error report file %s.\n", errno, pathName);
		formatRouterResponse(INTERNALERR);
		sendResponse(routerResponseMsg.msgLen);
		free(pathName);
		return FAILURE;
	}
	free(pathName);
	/*headerPrintException();*/

	csdTransExpFileOpen = YES;
	return SUCCESS;
}

headerPrintException()
{
    fprintf(expPrtFp,  "Arab National Bank      (STSARSERV)             ");
	fprintf(expPrtFp,  "     Static Data Exception Report      ");
	getDateTime();
	fprintf(expPrtFp,  "                   Date    : %02d/%02d/%04d\n", systemDate->tm_mday, systemDate->tm_mon +1, systemDate->tm_year+1900);
	fprintf(expPrtFp,  "                                                                            ");
	fprintf(expPrtFp,  "                              Time    : %02d:%02d:%02d\n", systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
	fprintf(expPrtFp,  "                                  ");
	fprintf(expPrtFp,  "                                                                        Page #  :%3d\n", expPrtPage++);
	fprintf(expPrtFp,  "------------------------------------------------------------------");
	fprintf(expPrtFp,  "------------------------------------------------------------------\n");
	fprintf(expPrtFp,  "Date & Time            Branch     PID       Function Name                Exception Remarks\n");
	fprintf(expPrtFp,  "------------------------------------------------------------------");
	fprintf(expPrtFp,  "------------------------------------------------------------------\n");
	fflush(expPrtFp);
	expPrtLine = 6;
	return 0;
}

writeToExceptionReport(char *branchCode, char *functionName, char *remarks)
{
	char tmpStr[50];

	sprintf(tmpStr,  "%02d/%02d/%04d|%02d:%02d:%02d", systemDate->tm_mday, systemDate->tm_mon +1, systemDate->tm_year+1900,systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
	fprintf(expPrtFp,  "%.20s    %.4s     %5d   %.30s   %s \n", tmpStr, branchCode, PID, functionName, remarks);
	fflush(expPrtFp);
	expPrtLine++;
	if ( expPrtLine > 55 )
	{
		fprintf(expPrtFp,  "------------------------------------------------------------------");
		fprintf(expPrtFp,  "------------------------------------------------------------------\n\f\n");
		headerPrintException();
	}

	return 0;
}

writeToCsdTransExpFile(char *branchCode, char *functionName, char *accNo, char *contraAccNo, double amount, char *remarks)
{
	char tmpStr[50];

	sprintf(tmpStr,  "%02d/%02d/%04d|%02d:%02d:%02d", systemDate->tm_mday, systemDate->tm_mon +1, systemDate->tm_year+1900,systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
	fprintf(csdTransExpFp,  "%.20s %.4s  %5d %.30s  %.14s  %.14s  %.0f  %s \n", tmpStr, branchCode, PID, functionName, accNo, contraAccNo, amount, remarks);
	fflush(csdTransExpFp);
	csdTransExpLine++;
	if ( csdTransExpLine > 55 )
	{
		fprintf(csdTransExpFp,  "------------------------------------------------------------------");
		fprintf(csdTransExpFp,  "------------------------------------------------------------------\n\f\n");
		headerPrintCsdException();
	}
	return 0;
}

headerPrintCsdException()
{
    fprintf(csdTransExpFp,  "Arab National Bank      (CSDTRANEXP)            ");
	fprintf(csdTransExpFp,  "     CSD-Transaction Exception Report  ");
	getDateTime();
	fprintf(csdTransExpFp,  "                   Date    : %02d/%02d/%04d\n", systemDate->tm_mday, systemDate->tm_mon +1, systemDate->tm_year+1900);
	fprintf(csdTransExpFp,  "                                                                            ");
	fprintf(csdTransExpFp,  "                              Time    : %02d:%02d:%02d\n", systemDate->tm_hour, systemDate->tm_min, systemDate->tm_sec);
	fprintf(csdTransExpFp,  "                                  ");
	fprintf(csdTransExpFp,  "                                                                        Page #  :%3d\n", csdTransExpPage++);
	fprintf(csdTransExpFp,  "------------------------------------------------------------------");
	fprintf(csdTransExpFp,  "------------------------------------------------------------------\n");
	fprintf(csdTransExpFp,  "Date & Time  Branch  PID   Function Name      Main A/c#        Contra A/c#       Amount         Remarks\n");
	fprintf(csdTransExpFp,  "------------------------------------------------------------------");
	fprintf(csdTransExpFp,  "------------------------------------------------------------------\n");
	fflush(csdTransExpFp);
	csdTransExpLine = 6;
	return 0;

}

closeAllFiles()
{
	fprintf(logFp, "%s|%5d|[closeAllFiles] : Closing All the files using iscleanup...\n", getDateTime(), PID);
	fflush(logFp);
	iscleanup();
	fprintf(logFp, "%s|%5d|[closeAllFiles] : All the files closed using iscleanup...\n", getDateTime(), PID);
	fflush(logFp);
	userFileOpen=userLogFileOpen=maintenanceFileOpen=staticFileOpen=custLogFileOpen=custTabFileOpen=jointLogFileOpen=acctLogFileOpen=ctlFileOpen=acctTabFileOpen=jointTabFileOpen=abcFileOpen=cardLogFileOpen=cardTabFileOpen=o3dFileOpen=acctBmFileOpen=gldFileOpen=chqTabFileOpen=reqFileOpen=crdFileOpen=pensFileOpen=pennotFileOpen=sodFileOpen=pydFileOpen=sodLogFileOpen=stopChqLogFileOpen=thdFileOpen=cndFileOpen=brFileOpen=refFileOpen=brsFileOpen=ridFileOpen=secLogFileOpen=chqDelFileOpen=refreshFileOpen=penInhFileOpen=tpinHistFileOpen=idLogFileOpen=addrLogFileOpen=calendarFileOpen=idTabFileOpen=addrTabFileOpen=cRefLogFileOpen=cRefTabFileOpen=signLogFileOpen=signTabFileOpen=ownerLogFileOpen=ownerTabFileOpen=aadFileOpen=bkdFileOpen=arrBlkFileOpen=arrBlkLogFileOpen=dzdFileOpen=sadadCtlFileOpen=accBlkFileOpen=usrBrnFileOpen=retMailFileOpen=pbCustFileOpen=tdLogFileOpen=ankFileOpen=fndTabFileOpen=heirLogFileOpen=heirTabFileOpen=swiftLogFileOpen=sadadLogFileOpen=samaAccFileOpen=accOpenCardFileOpen=cbCtlTabFileOpen=cardSeqFileOpen=cbCustTabFileOpen=NO;
	userFile=userLogFile=custLogFile=custTabFile=jointLogFile=acctLogFile=ctlFile=acctTabFile=jointTabFile=abcFile=cardLogFile=cardTabFile=o3dFile=acctBmFile=gldFile=chqTabFile=reqFile=crdFile=pensFile=pennotFile=sodFile=pydFile=sodLogFile=stopChqLogFile=thdFile=cndFile=brFile=refFile=brsFile=ridFile=secLogFile=chqDelFile=refreshFile=penInhFile=tpinHistFile=idLogFile=addrLogFile=calendarFile=idTabFile=addrTabFile=cRefLogFile=cRefTabFile=signLogFile=signTabFile=ownerLogFile=ownerTabFile=aadFile= bkdFile=arrBlkFile=arrBlkLogFile=dzdFile=sadadCtlFile=accBlkFile=usrBrnFile=retMailFile=pbCustFile=tdLogFile=ankFile=fndTabFile=heirLogFile=heirTabFile=swiftLogFile=sadadLogFile=samaAccFile=accOpenCardFile=cbCtlTabFile=cardSeqFile=cbCustTabFile=-1;
	return 0;
}

getIgnoreMemoForBrCodeUpd()
{
	struct bmLedgers csdMemoRec;

	if ( (ctlFile  = isopen(ctlFilePath, ISMANULOCK+ISINOUT )) < 0)
	{
		fprintf(serverLogFp, "%s|%5d|[getIgnoreMemoForBrCodeUpd] ISOPEN error %d for %s File IGNORED\n", getDateTime(), PID, iserrno, ctlFilePath);
		return FAILURE;
	}
	isindexinfo(ctlFile, &ctlKey, 1);

	memset(ignoreMemoForBrnUpd, NULL, sizeof ignoreMemoForBrnUpd);

	memset(&csdMemoRec.liveChar, ' ', sizeof csdMemoRec);
	strncpy(csdMemoRec.recType, "MM", 2);
	isindexinfo(ctlFile, &ctlKey, 1);
	if(isstart(ctlFile, &ctlKey, 0, &csdMemoRec.liveChar, ISGTEQ) < 0)
	{
		fprintf(serverLogFp, "%s|[getIgnoreMemoForBrCodeUpd] ISSTART/ISGTEQ error %d on STCTLTAB for MM\n", getDateTime(), iserrno);
		fflush(serverLogFp);
	}

	while ( isRead(ctlFile, &csdMemoRec.liveChar, ISNEXT) == 0 )
	{
		if ( strncmp(csdMemoRec.recType, "MM", 2 ) )
			break;

		if ( csdMemoRec.ignoreMemoForBrUpd != '1' )
			continue;

		sprintf(ignoreMemoForBrnUpd, "%s~%.3s", ignoreMemoForBrnUpd, csdMemoRec.ledgerCode);
	}
	fprintf(serverLogFp, "%s: Ignore Memo for BrnCode Update   :  [%s] \n", getDateTime(), ignoreMemoForBrnUpd);
	fflush(serverLogFp);
	isclose(ctlFile);
	return 0;
}
