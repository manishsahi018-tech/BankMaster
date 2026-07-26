struct requestMsgTpinStatus
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 01 for Tpin status enquiry */
	char responseStatus[2];	/* It will be blank during request message */
	char cardNo[20];			
	char filler[19];		/* For future use */
	char nullPad;
};

struct requestMsgTpinCheck
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 03 for Tpin Check request */
	char responseStatus[2];	/* It will be blank during request message */
	char custNo[7];			
	char cardNo[19];
	char tpinNo[4];
	char filler[19];		/* For future use */
	char nullPad;
};

struct requestMsgTpinUpdate
{
	char msgLen[5];
	char reqSource[10];	/* CSD if requested from static data */
	char service[2];	/* 02 is for TPIN update */
	char responseStatus[2];	/* BLANK during request message */
	char custNo[7];
	char tpinNo[4];			/* Encrypted */
	char customerBranchCode[4];	
	char requestBranchCode[4];
	char custName[30];
	char address1[30];
	char address2[30];
	char poBox[10];
	char cityName[20];
	char zipCode[10];
	char filler[15];		/* For future use */
	char nullPad;
};

union tpinMsgReceived
{
	struct requestMsgTpinStatus	tpinStatus;
	struct requestMsgTpinUpdate tpinUpdate;
	struct requestMsgTpinCheck	tpinCheck;
}tpinRequestMsg;

struct responseMsgTpinStatus
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 01 for Tpin status enquiry */
	char responseStatus[2];	/* 00 - Success 
							   02 - Invalid Customer
							   06 - Database error
							   99 - Internal error 
							*/
	char cardNo[20];
	char tpinStatus;		/* 0 - Inactive ; 1 - Active */
	char tpinNo[4];			/* Encrypted TPIN Available only when the responseStatus is 00 */
	char filler[19];		/* For future use */
	char nullPad;
};		

struct responseMsgTpinCheck
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 03 for Tpin Check service */
	char responseStatus[2];	/* 00 - Success 
							   01 - Invalid Card
							   03 - Incorrect message
							   04 - Weak Tpin
							   05 - ATM PIN same as TPIN
							   06 - Database error
							   99 - Internal error 
							*/
	char custNo[7];			
	char cardNo[19];
	char tpinNo[4];
	char filler[10];
	char nullPad;
};

struct responseMsgTpinUpdate
{
	char msgLen[5];
	char reqSource[10];		/* CSD if requested from Static data */
	char service[2];		/* 01 for Tpin status enquiry */
	char responseStatus[2];	/* 00 - Success 
							   02 - Invalid Customer
							   06 - Database error
							   99 - Internal error 
							*/
	char custNo[7];
	char filler[19];		/* For future use */
	char nullPad;
};

union tpinMsgResponse
{
	struct responseMsgTpinStatus tpinStatus;
	struct responseMsgTpinUpdate tpinUpdate;
	struct responseMsgTpinCheck	 tpinCheck;
}tpinResponseMsg;

