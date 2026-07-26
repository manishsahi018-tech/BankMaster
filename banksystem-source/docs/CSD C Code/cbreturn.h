
struct reqMsgLetterDetail
{
	char	msgLen[4];
	char	tuxConnectionNo;	
	char	branchName[10];		/* Left justified; filled with spaces
								   Eg.
								   CSD		- Static Data 
								*/
	char	source[2];			/* Module abbreviation ; eg., CS - Static Data */
	char 	service[2];			/* 00 - Get Letter Details */
	char	responseStatus[2];	/* will be spaces in request message */
	char	letterRefNo[16];		
	char	filler[50];			/* for future use */
	char	nullPad;
};

struct resMsgLetterDetail
{
	char	msgLen[5];
	char	branchName[10];		/* Copied from Request message */
	char	source[2];			/* Copied from Request message */
	char 	service[2];			/* 00 - Get Letter Details */
	char	responseStatus[2];	/* 00 - Success
								   03 - Incorrect Message
								   18 - No such record exists
								   99 - Internal Error
								*/
	char	letterRefNo[16];		
	char	branchCode[4];
	char	custNo[7];
	char	productId[20];
	char	addressType;		/* 0-PO Box Type address; 1-GPS type address */
	char	address1[30];
	char	poBoxOrUnit[10];
	char	cityName[20];
	char	zipCode[10];
	char	sourceApplicationName[20];	
	char	errorDescription[50];
	char 	filler[50];
};
