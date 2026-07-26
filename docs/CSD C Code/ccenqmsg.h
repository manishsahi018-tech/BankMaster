
struct requestMsgCcEnq
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 02 for Credit card info request by Credit card Number */
	char creditCardNo[16];	
	char responseStatus[2];	/* It will be blank during request message */
	char nullPad;
}reqMsgCcEnq;

struct responseMsgCcEnq
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 02 for Credit card info request by Credit card Number */
	char creditCardNo[16];	
	char responseStatus[2];	/* 00 - success
							   02 - Invalid Card in FDR
							   03 - Incorrect message
							   04 - MQ error 
							   05 - FDR error
							   99 - Internal error 
							*/
	char firstName[26];
	char secondName[26];
	char address1[26];
	char address2[26];
	char cityName[18];
	char zipCode[10];
	char homeTelNo[11];
	char offTelNo[11];
	char cardExpiryDate[4];	/* MMYY */
	char externalStatus;
	char internalStatus;
	char creditLimit[8];		/*Left padded with "0" & prefixed with sign */
	char availableCredit[8];	/*Left padded with "0" & prefixed with sign */
	char currentBal[11];		/*Left padded with "0" & prefixed with sign */
	char checkingAccNo[17];
	char idNo[12];
	char firstIssueDate[4];		/* MMYY */
	char nextPaymentDueDate[8];	/* YYYYMMDD */
	char paymentDueDate[8]; 	/* YYYYMMDD */
	char lastPaymentAmt[8];		/*Left padded with "0" & prefixed with sign */	
	char lastPaymentDate[8];	/* YYYYMMDD */
	char lastStatementDate[8];	/* YYYYMMDD */
	char lastBal[11];			/*Left padded with "0" & prefixed with sign */
	char embossedName[26];	
	char authFlag;
	char delinAmount[8];		/*Left padded with "0" & prefixed with sign */  
	char activationFlag;
	char accOpenDate[8];
	char minimumPaymentDue[8];	/*Left padded with "0" & prefixed with sign */  
	char nullPad;
}resMsgCcEnq;
