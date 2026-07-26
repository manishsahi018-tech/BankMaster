
struct reqMsgBillEnq
{
	char	msgLen[8];
	char	msgType[4];			/* 0001 - Enquiry */
	char 	langInd;			/* A-Arabic ; E-English */
	char	accessChannel[4];	/* 01-Branch; 02-ATM; 03-Phone; 04-Internet */
	char	customerId[20];		/* Eg. Saudi ID Number */
	char	customerType[15];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number */
	char	proxyCustId[20];	/* Eg. Teller ID or Bank Employee Number  */
	char	proxyCustType[15];	/* BED-Bank Employee; BTL-Bank Teller */
	char	subscriptionNo[19];	
	char	companyId[4];		/* Biller Identification code 
								   02 - Water 
								   03 - STC
								   04 - SCECO East
								   05 - SCECO Central
								   06 - SCECO West
								   07 - SCECO South */
	char	msgTerm;			/* Z */
	char	nullPad;
};

struct reqMsgNewBillEnq
{
	char	msgLen[5];
	char	msgType[4];			/* 0001 - Enquiry */
	char 	langInd[5];			/* ar-sa->Arabic ; en-gb->English */
	char	accessChannel[8];	
	char	customerId[32];		/* Eg. Saudi ID Number */
	char	customerType[3];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number , etc..*/
	char	proxyCustId[32];	/* Eg. Teller ID or Bank Employee Number  */
	char	proxyCustType[3];	/* BED-Bank Employee; BTL-Bank Teller */
	char	billNo[19];			/* Bill Number */
	char	subscriptionNo[19];	/* Bill Subscription number */
	char	companyId[3];		/* Biller Identification code 
								   001 - STC
								   002 - SCECO 
								   003 - NCCI
								   004 - Marafiq
								   005 - Mobily  */
	char	startDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	endDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	inclPayments[5];	/* True or False */
	char	inclPaidBills[5];	/* True or False */
	char	maxBills[3];		/* to be taken from stsarserv.cfg */
	char	nullPad;
};

struct reqMsgCustProfile
{
	char	msgLen[5];
	char	msgType[4];			/* 0019 - Customer Profile Enquiry ;
								   0013 - Customer Profile Add 
								   0021 - Customer Profile Del
								*/
	char 	langInd[5];			/* ar-sa->Arabic ; en-gb->English */
	char	customerId[32];		/* Eg. Saudi ID Number */
	char	customerType[3];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number , etc..*/
	char	recordCount[3];		
	struct 
	{
		char	billingAcct[19];	/* Bill Subscription number */
		char	companyId[3];		/* Biller Identification code 
									   001 - STC
									   002 - SCECO 
									   003 - NCCI
									   004 - Marafiq
									   005 - Mobily  */
	}details[100];
	char	nullPad;
};

struct reqMsgBillPayment
{
	char	msgLen[5];
	char	msgType[4];			/* 0003 - Validation Request */
	char 	langInd[5];			/* ar-sa  -> Arabic ; en-gb  --> English */
	char	customerId[32];		/* Eg. Saudi ID Number */
	char	customerType[3];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number , etc..*/
	char	proxyCustId[32];	/* Eg. Teller ID or Bank Employee Number  */
	char	proxyCustType[3];	/* BED-Bank Employee; BTL-Bank Teller */
	char	recordCount[3];		/* No. of bills to be validated */ 
								/* It is assumed as 1 hence the following fields are not made as repetitive */
	char	transRefNo[10];		/* Bankmaster transaction reference number */
	char	billAmtPaid[19];
	char	transDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	valueDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	billCycleNumber[16];
	char	billNo[19];
	char	subscriptionNo[19];	/* Bill Subscription number */
	char	companyId[3];		/* Biller Identification code 
								   001 - STC
								   002 - SCECO 
								   003 - NCCI
								   004 - Marafiq
								   005 - Mobily  */
	char	billerDistCode[10];
	char	branchCode[10];
	char	accessChannel[8];	
	char	paymentMethod[6];	/* CASH, CCARD-Creit card; EFT-Funds Transfer */
	char	paymentType[4];		/* POST, RCHG, RNEW, RDEP, RADV */
	char	checkDigit[2];		/* for future use */
	char	serviceType[4];		/* ELEC-Electricity;PHON-Telephone;INSR=Insurance;BKSV-Bank Service;GOVT-Government;
								   MED-Medical;CCAR-Credit card */
	char	drAccNo[20];
	char	reversalFlag;		/* T-True ; F-False */
	char	nullPad;
};

struct reqMsgBillAdvice
{
	char	msgLen[5];
	char	msgType[4];			/* 0005 - Advice Request */
	char 	langInd[5];			/* ar-sa  -> Arabic ; en-gb  --> English */
	char	proxyCustId[32];	/* Eg. Teller ID or Bank Employee Number  */
	char	proxyCustType[3];	/* BED-Bank Employee; BTL-Bank Teller */
	char	groupPaymentId[36];
	char	recordCount[3];		/* No. of bills to be validated */ 
								/* It is assumed as 1 hence the following fields are not made as repetitive */
	char	transRefNo[10];		/* Bankmaster transaction reference number */
	char	bankTransId[32];
	char	sadadTransId[32];
	char	customerId[20];
	char	customerType[3];
	char	paymentStatusCode[12];
	char	transDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	transAmt[19];
	char	processDate[19];		/* in the format YYYY-MM-DDTHH:MM:SS */
	char	billNo[19];
	char	subscriptionNo[19];	/* Bill Subscription number */
	char	companyId[3];		/* Biller Identification code 
								   001 - STC
								   002 - SCECO 
								   003 - NCCI
								   004 - Marafiq
								   005 - Mobily  */
	char	nullPad;
};

union 
{
	struct reqMsgBillEnq		billEnq;
	struct reqMsgNewBillEnq		newBillEnq;
	struct reqMsgCustProfile	custProfile;
	struct reqMsgBillPayment	billPayment;
	struct reqMsgBillAdvice		billAdvice;
}sadadRequestMsg;

struct billStatusInfo
{
	char	billReferenceNo[19];	/* Eg. Meter number */
	char	billStatusCode[10];		/* Paid, PartialPd, OvrPd, Unpaid */
	char	billAmountDue[19];
	char 	billExpireDate[19];		/* YYYY-MM-DD */
	char 	paymentDueDate[19];		/* YYYY-MM-DD */
	char	exactPaymentOnly;		/* T-True ; F-False */
	char 	billAmountPaid[19];		/* If paid */
	char	billPaymentStatus[12];	/* If Paid */
	char	paymentDate[19];		/* YYYY-MM-DD */
	char	bankTransactionId[36];	/* ANB Transaction Reference number (if paid)*/
	char	sadadTransactionId[36];	/* SADAD Transaction Reference number (if paid)*/
	char	errorCode[4];			/* 0 - Success 
									   1 - Not Applicable
									   2 - Biller Does not exist 
									   3 - Missing Biller Id
									   4 - Missing Account Id
									   5 - Missing Bill Number
									   6 - Missing Customer Id 
									   7 - Customer Not found 
									   8 - Undefined Access Channel
									   9 - Missing Access Channel
									   10- Bank branch code missing 
									   11- Not Applicable */
};


struct resMsgBillEnq
{
	char	msgLen[8];
	char	msgType[4];				/* 0002 - Enquiry Response */
	char 	langInd;				/* A-Arabic ; E-English */
	char	accessChannel[4];		/* 01-Branch; 02-ATM; 03-Phone; 04-Internet */
	char	customerId[20];			/* Eg. Saudi ID Number */
	char	customerType[15];	
	char	proxyCustId[20];		/* Eg. Teller ID or Bank Employee Number  */
	char	proxyCustType[15];		/* BED-Bank Employee; BTL-Bank Teller */
	char	subscriptionNo[19];	
	char	companyId[4];			/* Biller Identification code 	
									   02 - Water 
									   03 - STC
									   04 - SCECO East
									   05 - SCECO Central
									   06 - SCECO West
									   07 - SCECO South 
									   */
	char	billQueryStatusCode[4];	/* 0-Success ; 1-Success with errors 
									   11-Failure */
	struct	billStatusInfo	normalBill;
	struct	billStatusInfo	highTollBill;
	char	msgTerm;				/* Z */
};

struct billStatusInfo1
{
	char	billStatusCode[15];		/* BillPaid, BillPartialPd, BillOvrPd, BillUnpaid */
	char	bankTransactionId[36];	/* ANB Transaction Reference number (if paid)*/
	char	sadadTransactionId[36];	/* SADAD Transaction Reference number (if paid)*/
	char	paymentStatusCode[15];	/* PmtNotCompleted, PmtCompleted */
	char 	billAmountPaid[19];		/* If paid */
	char	effectiveDate[19];
	char	exactPaymentReq[5] ;		/* "True" or "False" */
	char	customerId[32];
	char	customerType[3];
	char	messageText[20];		/* Informational text sent by SADAD */
	char	billCategory[4];		/* CIP-Customer Initiated payments; HTOL-High Toll Bills */
	char	serviceType[4];
	char	billCycle[16];
	char	billNumber[19];
	char	subscriptionNo[19];
	char	companyId[3];
	char	billAmountDue[19];
	char 	billDueDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char 	billOpenDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billCloseDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billExpiryDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billCheckDigit;			/* For future use */
	char	billReferenceInfo[20];	/* Eg. bill additional information */
};

struct resMsgNewBillEnq
{
	char	msgLen[5];
	char	msgType[4];				/* 0002 - Enquiry Response */
	char 	langInd[5];				/* Copy from request */
	char	statusCode[6];			/* Ref. error codes document */
	char	errorCode[6];			/* Ref. error codes document */
	char	text[100];				/* Informational message sent by SADAD */
	char	recCount[3];			/* Maximum, it can be 100 */
	struct	billStatusInfo1	details[100];
};

struct resMsgCustProfileEnq
{
	char	msgLen[5];
	char	msgType[4];			/* 0020 - Customer Profile Enquiry ; */
	char 	langInd[5];			/* ar-sa->Arabic ; en-gb->English */
	char	queryStatusCode[6];
	char	customerId[32];		/* Eg. Saudi ID Number */
	char	customerType[3];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number , etc..*/
	char	recordCount[3];		
	struct 
	{
		char	isInProfile[5];		/* True, False */
		char	billingAcct[19];	/* Bill Subscription number */
		char	companyId[3];		/* Biller Identification code 
									   001 - STC
									   002 - SCECO 
									   003 - NCCI
									   004 - Marafiq
									   005 - Mobily  */
	}details[100];
	char	nullPad;
};

struct resMsgCustProfileUpd
{
	char	msgLen[5];
	char	msgType[4];			/* 0013 - Customer Profile Add 
								   0021 - Customer Profile Del
								*/
	char 	langInd[5];			/* ar-sa->Arabic ; en-gb->English */
	char	msgStatusCode[6];
	char	customerId[32];		/* Eg. Saudi ID Number */
	char	customerType[3];	/* NAT-Saudi Id ; IQA-Iqama ; BIS-Business Id;SID-SADAD Id;BTL-Bank Teller;
								   BED-Bank Employee Number , etc..*/
	char	recordCount[3];		
	struct 
	{
		char	updateStatusCode[6];
		char	isInProfile[5];		/* True, False */
		char	billingAcct[19];	/* Bill Subscription number */
		char	companyId[3];		/* Biller Identification code 
									   001 - STC
									   002 - SCECO 
									   003 - NCCI
									   004 - Marafiq
									   005 - Mobily  */
	}details[100];
	char	nullPad;
};

struct resMsgBillPayment
{
	char	msgLen[5];
	char	msgType[4];			/* 0004 - Validation Response */
	char 	langInd[5];			/* ar-sr ->Arabic ; en-gs ->English */
	char	msgStatusCode[6];
	char	groupPaymentId[36];
	char	recordCount[3]; /* Record count is assumed as "1" hence the following fields are not made as repetitive */
	char	transRefNo[10];
	char	isInProfile[5];		/* 'True', 'False' */
	char	paymentStatusCode[6];
	char	bankTransId[32];
	char	sadadTransId[32];
	char	billAmtPaid[19];	/* copied from request */
	char	processDate[19];	/* Transaction date */
	char	billerNo[19];		/* copied from request */ 
	char	subscriptionNo[19];	/* copied from request */
	char	companyId[3];		/* copied from request */
	char	serviceType[3];		/* copied from request */
	char	paymentRefInfo[36];	
	char	reversalFlag;		/* T-True ; F-False */
	char	nullPad;
};

struct resMsgBillAdvice
{
	char	msgLen[5];
	char	msgType[4];			/* 0006 - Payment confirmation advice Response */
	char	msgStatusCode[6];
	char	groupPaymentId[36];
	char	recordCount[3]; /* Record count is assumed as "1" hence the following fields are not made as repetitive */
	char	transRefNo[10];
	char	bankTransId[32];
	char	sadadTransId[32];
	char	paymentStatusCode[6];
	char	nullPad;
};

union 
{
	struct resMsgBillEnq		billEnq;
	struct resMsgNewBillEnq		newBillEnq;
	struct resMsgCustProfileEnq	custProfileEnq;
	struct resMsgCustProfileUpd	custProfileUpd;
	struct resMsgBillPayment	billPayment;
	struct resMsgBillAdvice		billAdvice;
}sadadResponseMsg;
