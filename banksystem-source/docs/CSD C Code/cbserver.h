
/*	cbserver.h   Header file for Static data maintenance - for CBS-CMS interim solution*/

struct reqMsgLogin	
{
	char	msgLen[6];
	char	service[2]; 					/* 00 for logon */
	char	homeBranch[4];
	char	userId[10];
	char	password[20];
	char	branchCode[4];
	char	noOfTries;	/* more than 3 times; lock the user */
	char	version[4];	/* It should be "VER3" */
	char	clientVer[5];
	char	idleTimeLogin;	/* 0-NO(Normal Login);1-YES (Idle Time Login) */
};

struct reqMsgPassword	
{
	char	msgLen[6];
	char	service[2]; 					/* 01 for password change */
	char	homeBranch[4];
	char	userId[10];
	char	orgPassword[20];
	char	newPassword[20];
	char	noOfTries;						/* more than 3 deactivate */
};

struct reqMsgMaintenance 
{
	char	msgLen[6];
	char	service[2]; 					/* 50 for Maintenance     */
	char	homeBranch[4];
	char	keyValue[6];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
										A-add;U-update,D-delete*/
	char	arabicName[30];
	char	englishName[30];
	char	otherDetails[180];
	char	realOrPseudoBranch;
	char	mainBranchCode[4];
	char	cardPrdnAtBranch;
	char	pinSelectAtBranch;
	char	cardRequestFromBranch;
	char	pinPrintFromBranch;
	char	updateRestricted;
	char	mainBrEditAllowed;
	char	tpinSelectAtBranch;
	char	dormantActivationFlag;
	char	tpinMandatoryFlag;   		/* 1 - YES ;0-NO */
	char	nameSearchAllowed;   		/* 1 - YES ;0-NO */
	char	stdOrdReqAllowed;    		/* 1 - YES ;0-NO */
	char	custNameUpdAllowed;  		/* 1 - YES ;0-NO */
	char	addrUnificationFlag; 		/* 1 - YES ;0-NO */
	char	balEnqRestrictedFlag;		/* 1 - YES ;0-NO */
	char	displayWarningFlag;  		/* 1 - YES ;0-NO */
	char	enableChipCard;      		/* 1 - YES ;0-NO */
	char	newPensCardFlag;     		/* 1 - YES ;0-NO */
	char	mailCentreBranch;    		/* 1 - YES ;0-NO */
	char	mandateBranch;    	 		/* 1 - YES ;0-NO */
	char	callCentreBranch;    		/* 1 - YES ;0-NO */
	char	internalCustOpenAllowed;	/* 1 - YES ;0-NO */
	char	regionCode;			 		/* 1-Central; 2-Western; 3-Eastern */
	char	branchCategory;		 		/* 0-Retail; 1-Commercial; 2-Corporate */
	char	islamiBranch;		 		/* 0-No; 1-Yes */
	char	enableLocalChipCardFlag;	/* 1-YES ;0-NO */
	char	generalCustOpenAllowed;		/* 1-YES ;0-NO */
	char	pensionCustOpenAllowed;		/* 1-YES ;0-NO */ /* Added by Mohit on 28-Nov-2006 */
	char	feeExclusionUpdAllowed;		/* 1-YES ;0-NO */
	char	generalSamaUpdAllowed;		/* 1-YES ;0-NO */
	char	swiftCentreBranchFlag;		/* 1-YES ;0-NO */
	char	swiftTransferCentralized;	/* 1-YES ;0-NO */
	char	payrollBranch;				/* 1-YES ;0-NO */
	char	accFreezingPeriod[3];		/* Added by Rajesh on 09 Mar 08 */
	char	accOpenCardPrintAllowed;	/* 1-YES ;0-NO */ 
	char	filler[50];
};

struct reqMsgSecurity 
{
	char	msgLen[6];
	char	service[2]; 			/* 90 is for Security 	*/
	char	homeBranch[4];
	char	keyValue[22];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
										A-add;U-update,D-delete*/
	char	name[60];
	char    branchCode[4];
	char    langPref;
	char    liveStatus;
	char    updatePriv;
	char    authorityLevel[20];
	char	loginStatus;
	char	authorityLevel2[60];
	char	bpUserId[3];
	char	otherDetails[89];
	char	noOfBrn[3];
	char	enqAllowedBrn[500][4];
};

struct reqMsgUserList
{
	char	msgLen[6];
	char	service[2]; 	/* 91 is for UserList 	*/
	char	homeBranch[4];
	char	branchCode[4];
	char	userId[10];
	char	lastRecRead[5];
};

struct reqMsgAtRefresh
{
	char	msgLen[6];
	char	service[2];		/* 96 is for Any Time Refresh */
	char	homeBranch[4];
	char	branchCode[4];
	char	extractDate[8];
};

struct reqMsgCheckCust
{
	char	msgLen[6];
	char	service[2];/*48 is for Checking for existing customer & ABC list */ 
	char	homeBranch[4];
	char	idType;
	char	idNo[15];
	char	newOrUpdate;
	char	custNo[7];
	char	custName[60];
	char	filler[10];
};

struct reqMsgSaudiIndividual
{
    char msgLen[6];
	char service[2];   /* 10 for New Customer Creation - Individual (Saudi) */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char screenSetNo;
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char passportNo[15];
	char ppIssuedAt[20];
	char ppDateType;
	char ppIssueDateH[8];
	char ppIssueDateG[8];
	char ppExpiryDateH[8];
	char ppExpiryDateG[8];
	char hafizaNo[15];
	char hafIssuedAt[20];
	char hafDateType;
	char hafIssueDateH[8];
	char hafIssueDateG[8];
	char hafExpiryDateH[8];
	char hafExpiryDateG[8];
	char familyRegnNo[15];
	char frIssuedAt[20];
	char frDateType;
	char frIssueDateH[8];
	char frIssueDateG[8];
	char frExpiryDateH[8];
	char frExpiryDateG[8];
	char certBirthNo[15];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];		
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char sexCode;			
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[3];/* changed from 4 to 3 */
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char educationCode[2];
	char professionCode[2];	
	char positionCode[2];
	char monthlyIncome[2];	
	char segmentation;
	char ownerShip[10];	

	char employerName[30];	
	char department[20];
	char employerPoBox[10];	
	char employerCity[20];
	char employerZipCode[10];
	char documents[60];
	char documentOther[50];	

	char singleJointAcc;	/*0-single;1-joint;2-Undefined*/
	char packageAcc;
	char noOfJointCustomer[2];
	char jointAccNameOnCheck[60]; 
	char jointAccNameOnReports[30];
	char signatureNature;		/*0-single;1-joint*/
	char electronIntlRequired;	
	char electronIntlName[26];	
	char electronIntlSuppRequired;	
	char electronIntlSuppName[26];
	char deliveryToBranchOrPO;	
	char deliveryAddress1[30];
	char deliveryAddress2[30];
	char deliveryPoBox[10];	
	char deliveryCity[20];
	char deliveryZip[10];
	char supervisorComments[200];	
	char updateCardAddressReqd; 
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char currentAccInfo[12];
	char savingAccInfo[12];
	char otherAccInfo[12];
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char referenceReqdFor[10];
	char cardType;	/* I - Electron International ; S-Smart Card */
	char marketingMemo[25];
	char addressType; /* 0-PO box ; 1-Saudi post */
	char custOpenSource; 	/* P-Phone ; */
	char branchCsoId[10];	/* This field will be filled only for the customers opened through phone; */
	char branchActionDateTime[14];/* This field will be filled only for the customers opened through phone; */
	char activityFlag;		/* P-Branch has taken the customer record entered through phone banking ; otherwise space */
	char excludeFromAtmFees;/* 0-NO ; 1-YES */
	char excludeFromMinBalFees;/* 0-NO ; 1-YES */
	char accFreezingGracePeriod[3];
	char samaAuthNo[15];
	char samaAuthIssuedAt[20];
	char samaAuthDateType;
	char samaAuthIssueDateH[8];
	char samaAuthIssueDateG[8];
	char samaAuthExpiryDateH[8];
	char samaAuthExpiryDateG[8];
	char pkgStmtFreqOverride; /* 0-NO ; 1 - YES */
	char filler2[50]; /* For Future Enhancement */
};

struct reqMsgReference
{
    char msgLen[6];
	char service[2];   /* 71 for New Reference(for saudi) Creation */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor 
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char refNo[4];
	char referenceReqdFor[10];		
	char referenceType;
	char supervisorId[10];
	char custBranchCode[4];
	char idType;
	char idNo[15];
	char idIssuedAt[20];
	char idDateType;		/* 0-Hijri ; 1-Gregorian */
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];

	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	
	char addressType; /* 0-PO box ; 1-Saudi post */
	char custOpenSource; 	/* P-Phone ; */
	char branchCsoId[10];	/* This field will be filled only for the customers opened through phone; */
	char branchActionDateTime[14];/* This field will be filled only for the customers opened through phone; */
	char activityFlag;		/* P-Branch has taken the customer record entered through phone banking ; otherwise space */
	char filler[50];	/* Future enhancement */
};

struct reqMsgIndividualOthers
{
    char msgLen[6];
	char service[2];   /* 10 for New Customer Creation - Individual (NonSaudi) */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char screenSetNo;
	char iqamaNo[15];		
	char iqamaIssuedAt[20];	
	char iqamaDateType;	
	char iqamaIssueDateH[8];	
	char iqamaIssueDateG[8];
	char iqamaExpiryDateH[8];	
	char iqamaExpiryDateG[8];
	char passportNo[15];
	char ppIssuedAt[20];
	char ppDateType;
	char ppIssueDateH[8];
	char ppIssueDateG[8];
	char ppExpiryDateH[8];
	char ppExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];		
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char sexCode;			
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[3];/* changed from 4 to 3 */
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeCountryId[15];
	char homeCountryIdDateType;
	char homeCountryIdIssueDateH[8];
	char homeCountryIdIssueDateG[8];
	char homeCountryIdExpiryDateH[8];
	char homeCountryIdExpiryDateG[8];
	char homeAddress1[30];
	char homeAddress2[30];		
	char homePoBox[10];		
	char homeCityName[20];
	char homeZipCode[10];
	char homeCountry[3];
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];	
	char homeTelHomeNo[10];		
	char homeTelHomeExt[4];	
	char homeFaxAreaCode[4];		
	char homeFaxNo[10];			
	char homeFaxExt[4];		
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEmail[30];	

	char educationCode[2];
	char professionCode[2];	
	char positionCode[2];
	char monthlyIncome[2];	
	char segmentation;
	char ownerShip[10];	
	char employerName[30];	
	char department[20];
	char employerPoBox[10];	
	char employerCity[20];
	char employerZipCode[10];
	char documents[60];
	char documentOther[50];	
	char singleJointAcc;	/*0-single;1-joint;2-Undefined*/
	char packageAcc;
	char noOfJointCustomer[2];
	char jointAccNameOnCheck[60]; 
	char jointAccNameOnReports[30];
	char signatureNature;		/*0-single;1-joint*/
	char electronIntlRequired;	
	char electronIntlName[26];	
	char electronIntlSuppRequired;	
	char electronIntlSuppName[26];
	char deliveryToBranchOrPO;	
	char deliveryAddress1[30];
	char deliveryAddress2[30];
	char deliveryPoBox[10];	
	char deliveryCity[20];
	char deliveryZip[10];
	char supervisorComments[200];	
	char updateCardAddressReqd; 
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char currentAccInfo[12];
	char savingAccInfo[12];
	char otherAccInfo[12];
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char interGroupAccNo[14];
	char specialRefNo[15];
	char samaAuthNo[15];
	char samaAuthDateType;
	char samaAuthDateH[8];
	char samaAuthDateG[8];
	char cardType;	/* I - Electron International ; S-Smart Card */
	char marketingMemo[25];
	char addressType;	/* 0-PO box ; 1-Saudi Post */
	char custOpenSource; 	/* P-Phone ; B-Branch */
	char branchCsoId[10];	/* This field will be filled only for the customers opened through phone; */
	char branchActionDateTime[14];/* This field will be filled only for the customers opened through phone; */
	char activityFlag;		/* P-Branch has taken the customer record entered through phone banking ; otherwise space */
	char excludeFromAtmFees;/* 0-NO ; 1-YES */
	char excludeFromMinBalFees;/* 0-NO ; 1-YES */
	char accFreezingGracePeriod[3];
	char visaNo[15];
	char visaIssuedAt[20];
	char visaDateType;
	char visaIssueDateH[8];
	char visaIssueDateG[8];
	char visaExpiryDateH[8];
	char visaExpiryDateG[8];
	char approvalRefNo[15];
	char appDateType;
	char appIssueDateH[8];
	char appIssueDateG[8];
	char appExpiryDateH[8];
	char appExpiryDateG[8];
	char appRefName[30]; 
	char pkgStmtFreqOverride; /* 0-NO ; 1 - YES */
	char iqamaType; /* 0-Book ; 1-Plastic */
	char filler2[50]; /* For Future Enhancement */
};

struct reqMsgJuristic
{
    char msgLen[6];
	char service[2];   /* 10 for New Customer Creation - Juristic customer */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char screenSetNo;
	char crNo[15];		
	char crIssuedAt[20];	
	char crDateType;	
	char crIssueDateH[8];	
	char crIssueDateG[8];
	char crExpiryDateH[8];	
	char crExpiryDateG[8];
	char licNo[15];
	char licDateType;
	char licIssueDateH[8];
	char licIssueDateG[8];
	char licExpiryDateH[8];
	char licExpiryDateG[8];
	char samaAuthNo[15];
	char samaAuthDateType;
	char samaAuthIssueDateH[8];
	char samaAuthIssueDateG[8];
	char samaAuthExpiryDateH[8];
	char samaAuthExpiryDateG[8];
	char ppNo[15];		
	char ppDateType;	
	char ppIssueDateH[8];	
	char ppIssueDateG[8];
	char ppExpiryDateH[8];	
	char ppExpiryDateG[8];
	char dcNo[15];
	char dcDateType;
	char dcIssueDateH[8];
	char dcIssueDateG[8];
	char dcExpiryDateH[8];
	char dcExpiryDateG[8];
	char visaNo[15];
	char visaDateType;
	char visaIssueDateH[8];
	char visaIssueDateG[8];
	char visaExpiryDateH[8];
	char visaExpiryDateG[8];
	char contractNo[15];
	char contractDateType;
	char contractIssueDateH[8];
	char contractIssueDateG[8];
	char contractExpiryDateH[8];
	char contractExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char purposeOfAccount[50];
	char govtShareHoldingPerc[3];
	char saudiShareHoldingPerc[3];
	char foreignShareHoldingPerc[3];
	char doeDateType;		
	char doeDateH[8];		
	char doeDateG[8];		
	char residentStatus;
	char businessType[3];/* changed from 4 to 3 */
	char aOrgName1[30];	
	char aOrgName2[30];
	char aOrgShortName[30];
	char eOrgName1[30];	
	char eOrgName2[30];
	char eOrgShortName[30];	
	char alphaSearchCode[6];

	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeAddress1[30];
	char homeAddress2[30];		
	char homePoBox[10];		
	char homeCityName[20];
	char homeZipCode[10];
	char homeCountry[3];
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];	
	char homeTelHomeNo[10];		
	char homeTelHomeExt[4];	
	char homeFaxAreaCode[4];		
	char homeFaxNo[10];			
	char homeFaxExt[4];		
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEmail[30];	

	char documents[60];
	char documentOther[50];	
	char signatureNature;		/*0-single;1-joint*/
	char supervisorComments[200];	
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char currentAccInfo[12];
	char savingAccInfo[12];
	char otherAccInfo[12];
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char marketingMemo[25];
	char addressType; /* 0-PO Box ; 1-Saudi post */
	char accFreezingGracePeriod[3];
	char approvalRefNo[15];
	char appDateType;
	char appIssueDateH[8];
	char appIssueDateG[8];
	char appExpiryDateH[8];
	char appExpiryDateG[8];
	char appRefName[30]; 
	char filler2[50]; /* For Future Enhancement */
};

struct reqMsgCustomer 
{
    char msgLen[6];
	char service[2];   /* 10 for New Customer Creation */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char supervisorId[10];	
	char custBranchCode[4];
	char idNo[15];		
	char idType;	
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char filler1[17];		
	char titleCode[2];		
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char sexCode;			
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[4];
	char crNo[15];		
	char crIssuedAt[20];
	char crIssueDateType;
	char crIssueDateH[8];
	char crIssueDateG[8];
	char aOrgName1[30];	
	char aOrgName2[30];
	char aOrgShortName[30];
	char eOrgName1[30];	
	char eOrgName2[30];
	char eOrgShortName[30];	
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		/*498- 30*/
	char eFirstName[15];		/*528- 15*/
	char e2ndName[15];		/*543- 15*/
	char e3rdName[15];		/*558- 15*/
	char eLastName[15];		/*573- 15*/
	char eShortName[30];		/*588- 30*/
	char address1[30];		/*618- 30*/
	char address2[30];		/*648- 30*/
	char poBox[10];			/*678- 10*/
	char cityName[20];		/*688- 20*/
	char zipCode[10];		/*708- 10*/
	char country[3];		/*718- 3*/
	char filler[17];		/*721-17*/
	char telOffAreaCode[4];	/*738- 4 */
	char telOffNo[10];		/*742- 10*/
	char telOffExt[4];		/*752- 4 */
	char telHomeAreaCode[4];	/*756- 4 */
	char telHomeNo[10];		/*760- 10*/
	char telHomeExt[4];		/*770- 4 */
	char faxAreaCode[4];		/*774- 4 */
	char faxNo[10];			/*778- 10*/
	char faxExt[4];			/*788- 4 */
	char mobileNo[10];		/*792- 10*/
	char pagerNo[10];		/*802- 10*/
	char eMail[30];			/*812- 30*/
	char educationCode[2];	/*842- 2 */
	char professionCode[2];	/*844- 2 */
	char positionCode[2];	/*846- 2 */
	char monthlyIncome[2];	/*848- 2 */
	char segmentation;
	char ownerShip[10];		/*850- 10*/
	char employerName[30];	/*860- 30*/
	char department[20];		/*890- 20*/
	char employerPoBox[10];	/*910- 10*/
	char employerCity[20];	/*920- 20*/
	char employerZipCode[10];/*940- 10*/
	char documents[15];		/*950- 15*/
	char documentOther[50];	/*965- 50*/
	char singleJointAcc;	    /*1015-1 */	/*0-single;2-joint*/
	char packageAcc;
	char noOfJointCustomer[2];/*1016-2*/
	char jointAccNameOnCheck[60]; /*1018-60*/
	char jointAccNameOnReports[30];/*1078-30 */
	char signatureNature;		/*1108-1 */	/*0-single;1-joint*/
	char electronCardRequired;	/*1109-1 */
	char electronCardName[26];	/*1110-26*/
	char electronSuppRequired;	/*1136-1 */
	char electronSuppName[26];	/*1137-26*/
	char electronIntlRequired;	/*1163-1 */
	char electronIntlName[26];	/*1164-26*/
	char electronIntlSuppRequired;	/*1190-1 */
	char electronIntlSuppName[26];	/*1191-26*/
	char deliveryToBranchOrPO;	/*1217-1 */
	char deliveryAddress1[30];	/*1218-30*/
	char deliveryAddress2[30];	/*1248-30*/
	char deliveryPoBox[10];		/*1278-10*/
	char deliveryCity[20];		/*1288-20*/
	char deliveryZip[10];		/*1308-10*/
	char supervisorComments[200];	/*1318-200*/
	char custType;				/*1518-1*/
	char updateCardAddressReqd; /*1519-1*/
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char phaseFlag;   /* 2 - phase II */
	char orgAlphaSearchCode[6];
	char currentAccInfo[12];
	char savingAccInfo[12];
	char otherAccInfo[12];
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char filler2[50]; /* For Future Enhancement */
};

struct reqMsgQuickCustomer 
{
    char msgLen[6];
	char service[2];   /* 10 for New Customer Creation (Quick customer) */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	/*40 - 1 */  /*1-pending with supervisor
				               			   2-pending with CSO
										   3-Rejected completely
					       				   9-completed */
	char custNo[7];
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char screenSetNo;
	char idNo[15];		
	char idType;	
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];		
	char sexCode;			
	char businessType[3];
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];		
	char e3rdName[15];		
	char eLastName[15];		
	char eShortName[30];
	char altBranchCode[4];
	char address1[30];		
	char address2[30];	
	char poBox[10];	
	char cityName[20];		
	char zipCode[10];	
	char country[3];
	char currentAccInfo[12];
	char cardType;
	char electronIntlRequired;	
	char electronIntlName[26];	
	char supervisorComments[200];
	char dobDateType;
	char dobDateH[8];
	char dobDateG[8];
	char addressType; /* 0-PO box ; 1-Saudi post */
	char internalCustomer; /* 0-No (Normal quick customer); 1-Yes (Internal cusotmer) */
	char filler[50];
};

struct reqMsgAccount
{
	char msgLen[6];
	char service[2];	/* 14 is for creation/Update Account Info */
	char homeBranch[4];
	char branchCode[4];	
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char accNo[14];	
	char newOrUpdate;
	char supervisorId[10];
	char accStatus[2];	
	char statementFreq[2];
	char checkBook;	
	char droppedAcc; 	/* 0 - No  1 - Yes  */
	char statementDay;  /* 0 - 0131 ; 1 - 3112 */
	char intApplication;
	char crIntRate[9];
	char drIntRate[9];
	char payAccNo[14];
	char uniqueNo[5];
	char uniqueSub[2];
	char phaseFlag; 	/* 2 - Phase-II; This field is added for the 
									compatibility with existing phase-I client, 
									can be removed if any modification on 
									phase-I client 
						*/
	char statusChanged ; 	/* 0 - Not Changed ; 1 - Changed */
	char fromStatus[2];
	char toStatus[2];
	char supervisorComments[200];
	char acctDesc[30];
	char initialStatus[2];
	char samaStatus[2];
	char samaStatusChanged;
	char fromSamaStatus[2];
	char toSamaStatus[2];
	char initialSamaStatus[2];
	char accStatusChangeReason[30];
	char creditLimit[12];
	char intLastRun[14];
	char intFreqCode[3];
	char intApplDay[2];
	char inactiveAccFlag;
	char filler2[50]; /* For Future enhancement */
};

       
struct reqMsgJoint
{
	char msgLen[6];
	char service[2];	/* 15 is for New/Update joint account info */
	char homeBranch[4];
	char branchCode[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char custNo[7];
	char jointCustNo[2]; 
	char newOrUpdate;	
	char supervisorId[10];
	char idNo[15];	
	char idType;
	char idIssuedAt[20];
	char idDateType;
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char filler1[17];
	char titleCode[2];	
	char dobDateType;
	char dobDateH[8];
	char dobDateG[8];
	char sexCode;
	char vipCode;
	char marritalStatus;	
	char noOfDependents[2];
	char residentStatus;	
	char businessType[4];
	char aFirstName[15];	
	char a2ndName[15];	
	char a3rdName[15];
	char aLastName[15];
	char aShortName[30];	
	char eFirstName[15];	
	char e2ndName[15];
	char e3rdName[15];
	char eLastName[15];	
	char eShortName[30];	
	char address1[30];	
	char address2[30];	
	char poBox[10];	
	char cityName[20];
	char zipCode[10];	
	char country[3];	
	char filler[17];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];	
	char telHomeAreaCode[4];
	char telHomeNo[10];	
	char telHomeExt[4];
	char faxAreaCode[4];	
	char faxNo[10];
	char faxExt[4];
	char mobileNo[10];	
	char pagerNo[10];
	char eMail[30];
	char educationCode[2];
	char professionCode[2];
	char positionCode[2];
	char monthlyIncome[2];
	char ownerShip[10];	
	char segmentation;
	char employerName[30];
	char department[20];	
	char employerPoBox[10];
	char employerCity[20];
	char employerZipCode[10];
	char activeStatus;
	char addressType; /* 0-PO Box ; 1-Saudi Post */
	char custOpenSource; 	/* P-Phone ; */
	char branchCsoId[10];	/* This field will be filled only for the customers opened through phone; */
	char branchActionDateTime[14];/* This field will be filled only for the customers opened through phone; */
	char activityFlag;		/* P-Branch has taken the customer record entered through phone banking ; otherwise space */
	char filler2[10];
};

struct reqMsgPendingList
{
    char	msgLen[6];
	char	service[2];	/* 17 is for PendingList Request */
	char 	homeBranch[4];
	char	branchCode[4];
	char	userId[10];
	char	lastRecRead[3];
	char	activityFlag;	
	char	filler[10];
};

struct reqMsgPendingList1
{
    char	msgLen[6];
	char	service[2];	/* 12 is for PendingList Request for Phase-II*/
	char 	homeBranch[4];
	char	userId[10];
	char	lastRecCount[5];
	char	activityFlag;	
	char	custNo[7];
	char	filler[10];
};

struct reqMsgAccPendingList
{
	char msgLen[6];
	char service[2]; /* 22 is for Account Pending List Request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag;
	char custNo[7];
	char filler[10];
};

struct reqMsgAccPendingDetail
{
	char msgLen[6];
	char service[2]; /* 33 is for Acc Pending Detail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from stacclog	*/
					 	 /* 02  -  to read from gld0data	*/
						 /* 03  -  Dormant Account activation request */
	char userId[10]; 
	char dateTime[14];/* dateTime will become the key if request type is 02 & 03*/
	char updateFlag; /* 0-NO (enquiry mode) ; 1-YES (update mode) */
	char filler[10];
};

struct reqMsgAcctStatusHistory
{
	char msgLen[6];
	char service[2]; /* 57 is for Acct status history Request */
	char homeBranch[4];
	char accNo[14];
	char requestType;	/* 0-GL Account status ; 1-SAMA account status ; 2-Account update history */
	char lastRecCount[5];   /* Valid only for requestType = 2 (Account update history) */
	char filler[10];
};

struct reqMsgChequeBook
{
	char msgLen[6];
	char service[2]; /* 37 is for Cheque Book Request */
	char homeBranch[4];
	char userId[10];
	char newOrUpdate; /* N - New	; U - Update */ 
	char custBranchCode[4];
	char accNo[14];
	char chqBookType; /* 1 - Personal  ;  2 - Corporate */
	char noOfChqBook[2];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char deliveryBranchCode[4];
	char filler[10];
};

struct reqMsgChequeBookHistory
{
	char msgLen[6];
	char service[2]; /* 56 is for cheque book history details request */
	char homeBranch[4];
	char accNo[14];
	char reqDate[8];
	char historyOrDetail;  /* H-History request; D-Cheque book detail request */
	char filler[10];
};

struct reqMsgChequeBookReport
{
	char msgLen[6];
	char service[2]; /* 58 is for cheque book request report */
	char homeBranch[4];
	char lastRecCount[5];
	char reportDate[8];
	char filler[10];
};

struct reqMsgPrintCard
{
	char msgLen[6];
	char service[2];	/* 59 is for printing the card */
	char homeBranch[4];
	char userId[10];
	char cardNo[19];
	char requestType;  /* 0 - Print Card & Pin ; 2 - Print Card ; 3 - Change Pin */
	char filler[10];
};

struct reqMsgProcessPin
{
	char msgLen[6];
	char service[2];	/* 60 is for pin process */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char primaryOrSupplementary;	/* P - Primary ; S - Supplementary */ 
	char atmPin[4];
	char filler[10];
};

struct reqMsgCardPendingList
{
	char msgLen[6];
	char service[2]; /* 23 is for Card PendingList Request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag;		/* T-Pending with CSO ; S-Pending with supervisor ; F-Pending request from Finacle */
	char custNo[8];
	char filler[10];
};

struct reqMsgCardPendingDetail
{
	char msgLen[6];
	char service[2]; /* 25 is for Card Pending Detail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from stcardlog	*/
					 	 /* 02  -  to read from stcardtab	*/
	char userId[10];
	char dateTime[14];
	char cardNo[19];
	char filler[10];
};

struct reqMsgCardHistory
{
	char msgLen[6];
	char service[2]; /* 36 is for card history details request */
	char homeBranch[4];
	char cardNo[19];
	char msgType;			/* 0 - Card History ; 1 - Card Update History */
	char lastRecCount[5];   /* Valid only for msgType = 1 (Card update history) */
	char filler[10];
};

struct reqMsgChqBkStatusList
{
	char msgLen[6];
	char service[2];  /* 38 is for Cheque book Status List */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char requestStatus;
	char filler[10];
};

struct chequeBookKey 
{
	char accNo[14];
	char reqDate[8];
};

struct reqMsgChqBkStatusUpdate
{
	char msgLen[6];
	char service[2];  /* 39 is for cheque book status update request */
	char homeBranch[4];
	char userId[10];
	char noOfRecs[2];
	char requestStatus;
	char filler[10];
	struct chequeBookKey key[20];
};

struct reqMsgPendingDetail
{
	char msgLen[6];
	char service[2];	 /* 11 is for PendingDetail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from stcustlog	*/
						 /* 02  -  to read from stcusttab   */
	char branchCode[4];  /* If requestType is "02", then branchCode +
						    3 characters from userId field will become a
						    key for reading( i.e., customerNo)
						 */
	char userId[10];
	char dateTime[14];
	char screenSetNo;
	char updateFlag; /* 0-NO (enquiry mode) ; 1-YES (update mode) */
	char filler[10];
};

struct reqMsgJointDetail
{
	char msgLen[6];
	char service[2];	/* 18 is for jointInfo Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from stjointlog	*/
						 /* 02  -  to read from stjointtab  */
						 /* 03  -  Request from SAR Joint form to read from stjointlog */
						 /* 04  -  Request from SAR Joint form to read from stjointtab */
	char branchCode[4];
	char userId[10];
	char dateTime[14];
	char custNo[7];
	char jointCustNo[2];
	char filler[10];
};

struct reqMsgSupervisorDecision
{
	char msgLen[6];
	char service[2]; 	/* 19 is for Supervisor Decision		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char branchCode[4];
	char userId[10];
	char dateTime[14];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char primaryAcc[5];
	char custNo[7];
	char screenSetNo;
	char activityFlag;
	char branchCsoId[10];
	char branchActionDateTime[14];
	char filler[50];
};

struct reqMsgAccApproval
{
	char msgLen[6];
	char service[2]; 	/* 34 is for account approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char filler[10];
};

struct reqMsgResetPassword
{
	char msgLen[6];
	char service[2]; /* 35 is for reset password for the current branch users */
	char homeBranch[4];
	char userId[10];
	char resetUserId[10];
	char filler[10];
};

struct reqMsgLogoutUser
{
	char msgLen[6];
	char service[2]; /* 63 is for user logout */
	char homeBranch[4];
	char userId[10];
	char filler[10];
};

struct reqMsgCardApproval
{
	char msgLen[6];
	char service[2]; 	/* 32 is for card approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char cardNo[19];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char filler[10];
};

struct reqMsgForceCardGeneration
{
	char msgLen[6];
	char service[2];  /* 29 is for Force Card/Pin Generation */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char cardNo[19];
	char cardOrPin; /* C - Card  ; P - Pin  */
	char atmPin[4];
	char cardType; /* I-Electron International ; S-Smart Card */
	char filler[10];
};

struct reqMsgStatusList
{
	char msgLen[6];
	char service[2];  /* 26 is for Card/Pin-mailer Status List Request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char requestStatus;
	char cardOrPin;
	char filler[10];
};

struct reqMsgStatusUpdate
{
	char msgLen[6];
	char service[2];  /* 27 is for card/pin-mailer status update request */
	char homeBranch[4];
	char userId[10];
	char noOfRecs[2];
	char cardOrPin;
	char requestStatus;
	char filler[10];
	char cardNo[20][19];
};

struct reqMsgDC9000Status
{
	char msgLen[6];
	char service[2]; /* 31 is for updating DC9000 status */
	char homeBranch[4];
	char userId[10];
	char filler[10];
};

struct reqMsgCardRestrict
{
	char msgLen[6];
	char service[2];  /* 62 for Restrict/Unrestrict */
	char homeBranch[4];
	char userId[10];
	char cardNo[19];
	char restrictOrUnrestrict; /* R - Restrict ; U - Unrestrict */
	char filler[10];
};

struct reqMsgCardActivate
{
	char msgLen[6];
	char service[2];  /* 28 for Activate/Deactivate */
	char homeBranch[4];
	char userId[10];
	char cardNo[19];
	char activateOrDeactivate; /* A - Activate ; D - Deactivate */
	char deactivationType; /* D-Damaged ; S-Stolen ; L-Lost */
						  /*It will be blank when activation */
	char filler[10];
};

struct reqMsgChangeAddress
{
	char msgLen[6];
	char service[2];	/* 49 is for change delivery address */
	char homeBranch[4];
	char userId[10];
	char cardNo[19];
	char deliveryToBranchOrPO;
	char address1[30];
	char address2[30];
	char poBox[10];
	char cityName[20];
	char zipCode[10];
	char filler[50];
};

struct reqMsgCardInfo 
{
    char msgLen[6];
	char service[2];   /* 20 for New Card Creation */
	char homeBranch[4];
	char userId[10];
	char branchCode[4];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char supervisorId[10];
	char custNo[8];
	char cardNo[19];	
	char cardType;	/*R-Regular;I-International;V-VIP;A-Administrative;
					  S-Smart Card(Chip), C-CPS*/
	char newOrReplacement;		 /* N-New; R-Replacement*/
	char primaryOrSupplementary; /* P-Primary;R-Replacement*/
	char cardStatus;			 /* 0-Requested;1-Open;2-Lost
								    3-Stolen;4-Restricted;9-Closed*/
	char regionCode;			 /* 1-Central;2-West;3-East*/
	char languageCode;			 /* ATM screen language
								    1-Arabic
								    2-English
								    3-Arabic/English
							     */
	char customerBranch[4];		
	char nameOnTheCard[26];	
	char subAcc[4]; /* Running serial number + check digit */
	char deliveryToBranchOrPO; 	 /*B-Branch; P-PO Box*/
	char address1[30];			
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char firstIssueDate[8];
	char expiryDate[8];
	char supervisorComments[200];
	char deactivationType;   /* will be used while requesting replacement card */
	char idNo[10];
	char coreAccNo[16];
	char oldCardNo[19];
	char oldExpiryDate[4];
	char filler[50];
};

struct reqMsgAccSearch
{
	char msgLen[6];
	char service[2]; /* 21 is for Account Info Search  */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char custNo[7];
	char accNo[14];
	char cardNo[19];
	char filler[10];
};

struct reqMsgCardSearch
{
	char msgLen[6];
	char service[2]; /* 24 is for Card Info Search  */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char custNo[8];
	char accNo[16];
	char cardNo[19];
	char idNo[15];
	char filler[10];
};

struct reqMsgPensionSearch
{
	char msgLen[6];
	char service[2];  /*  40  is for Pension Info Search */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char penCardNo[9];
	char penAccNo[14];
	char hafNo[13];
	char penIdNo[15];
	char filler[10];
};

struct reqMsgPensionDetail
{
	char msgLen[6];
	char service[2]; /* 41 is for Pension Detail Request */
	char homeBranch[4];
	char userId[10];
	char penCardNo[9];
	char filler[10];
};

struct reqMsgStopChqDetail
{
	char msgLen[6];
	char service[2]; /* 46 is for Standing Order Detail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  - read from ststchqlog
							02  - read from pyd0data
							03  - Cancel Stop Cheque 
						 */
	char userId[10];
	char accNo[14];
	char chequeNo[10];
	char filler[10];
};

struct reqMsgStopChqApproval
{
	char msgLen[6];
	char service[2]; 	/* 54 is for Stop Cheque approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char accNo[14];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char filler[10];
};

struct reqMsgStopChqInfo
{
	char 	msgLen[6];
	char 	service[2];	/* 47 is for Stop Cheque Creation */
	char 	homeBranch[4];
	char 	userId[10];
	char	dateTime[14];
	char	creationOrUpdate;
	char	newOrUpdate;
	char	accNo[14];		
	char	chequeNo[10];
	char	amount[14];
	char	dateStop[8];
	char	payeeName[25];
	char	chequeFrom[8];
	char	destroyFlag;
	char 	filler[10];
};

struct reqMsgStopChqPendingList
{
	char msgLen[6];
	char service[2];	/* 53 is for stop cheque pending list */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; /* S - Supervisor ; T - Teller */
	char custNo[7];
	char filler[10];
};

struct reqMsgStdOrdSearch    /* Same Structure is used for stopChqSearchMsg, 
								reqMsgStopChqSearch ( service 45 ) & 
								chequeBookSearchMsg, reqMsgChequeBookSearch
						     */
{
	char msgLen[6];
	char service[2];  /*  42  is for Standing Order Info Search */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char accNo[14];
	char destroyChequeFlag;  /* This flag will be filled only during stop cheque search only (service 45) */
	char filler[10];
};

struct reqMsgStdOrdPendingList
{
	char msgLen[6];
	char service[2]; /* 51 is for Account Pending List Request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; /* S - Supervisor ; T - Teller */
	char custNo[7];
	char filler[10];
};

struct reqMsgStdOrdDetail
{
	char msgLen[6];
	char service[2]; /* 43 is for Standing Order Detail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from stsodlog	
					 	 	02  -  to read from sod0data
							03  -  Stop Standing Order
						 */
	char userId[10];
	char accNo[14];
	char sodNo[6];
	char filler[10];
};

struct reqMsgStdOrdApproval
{
	char msgLen[6];
	char service[2]; 	/* 52 is for Standing Order approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char accNo[14];
	char sodNo[6];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char filler[10];
};

struct reqMsgStdOrdInfo
{
	char 	msgLen[6];
	char 	service[2]; /* 44 is for New/Update Standing Order */
	char 	homeBranch[4];
	char 	userId[10];
	char	dateTime[14];
	char	creationOrUpdate;
	char	newOrUpdate;
	char 	accNo[14];
	char 	sodNo[6];
	char	orderType;
	char	paymentType;
	char	paymentMode;
	char	paymentFrequency;
	char	firstPaymentDate[8];
	char	nextPaymentDate[8];
	char	finalPaymentDate[8];
	char	lastProcessedDate[8];
	char	paymentsToBeMade[3];
	char	paymentsMade[3];
	char	limitInExcessFlag;
	char	commissionFlag;
	char	processNextDayFlag;
	char	thresholdAmt[10];
	char	paymentAmt[14];
	char	totalPaidToDate[14];
	char	totalToPay[14];
	char	payAccNo[14];
	char	drNarrative1[20];
	char	drNarrative2[20];
	char	crNarrative1[20];
	char	crNarrative2[20];
	char	transactionDateFlag;
	char	branchCode[4];
	char	remarks[25];
	char 	filler[10];
};

struct reqMsgRefresh 
{
	char	msgLen[6];
	char	service[2]; 		/* 13 for Refresh      */
	char 	homeBranch[4];
	char	branchCode[4];
	char	userId[10];
	char	refreshType;		/* 0 - NORMAL; 1- FULL */
	char	lastRecCount[5];
	char	reqType;			/* 0 - Refresh from stctltab ( General Static data control file )
								   1 - Refresh from stsadctl ( SADAD control file )
								*/
	char 	filler[10];
};

struct reqMsgSearch 
{
	char	msgLen[6];
	char	service[2]; 		/* 16 for Customer search  */
	char 	homeBranch[4];
	char	userId[10];
	char	lastRecCount[5];
	char	custNo[7];
	char	idType;
	char	idNo[15];
	char	telNo[10];
	char	telExt[4];
	char	firstName[15];
	char	secondName[15];
	char 	lastName[15];
	char	crNo[15];
	char	mainCategoryCode[2];
	char	subCategoryCode[2];
	char	branchCode[4];
	char	cardNo[19];
	char	mobileNo[10];
	char 	filler[10];
};

struct reqMsgTpinRequest
{
	char	msgLen[6];
	char	service[2]; 		/* 68 for TPIN Request */
	char 	homeBranch[4];
	char	msgType;			/* 0-Tpin Status ; 1-Tpin Update to log file; 2-Tpin Approval; 3-Tpin Check */
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	tpinNo[4];			/* ENCRYPTED */
	char	newOrUpdate;
	char	appRejectFlag;		/* A-Approve ; R-Reject */
	char	supervisorId[10];
	char	supervisorComments[200];
	char	filler[10];
};

struct reqMsgTpinPendingList
{
	char	msgLen[6];
	char	service[2];			/* 69 for TPIN pending list request for supervisor */
	char	homeBranch[4];
	char 	userId[10];
	char 	lastRecCount[5];
	char	custNo[7];
	char 	filler[10];
};

struct reqMsgCustHistory 
{
	char	msgLen[6];
	char	service[2]; 		/* 67 for Customer history  */
	char 	homeBranch[4];
	char	userId[10];
	char	lastRecCount[5];
	char	custNo[7];
	char	msgType;			/* 0 - Customer Update History ; 1 - Telephone pin select */
	char 	filler[10];
};

struct reqMsgCheckCategory
{
	char	msgLen[6];
	char	service[2];			/* 70 for checking category combinations valid or not */
	char	homeBranch[4];
	char	samaMainCategory[2];
	char	samaSubCategory[2];
	char	filler[100];
};

struct reqMsgJointInfoSearch 
{
	char	msgLen[6];
	char	service[2]; 		/* 72 for joint info search  */
	char 	homeBranch[4];
	char	requestType[2]; 	/* 01 - Read from stjointlog */
								/* 02 - Read from stjointtab */
	char	branchCode[4];
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	jointCustNo[2];
	char	lastRecCount[5];
	char 	filler[10];
};

struct reqMsgReferenceSearch
{
	char	msgLen[6];
	char	service[2]; 		/* 73 for reference info search  */
	char 	homeBranch[4];
	char	requestType[2]; 	/* 01 - Read from stcreflog */
								/* 02 - Read from stcreftab */
								/* 03 - Read from stheirlog */
								/* 04 - Read from stheirtab */
	char	branchCode[4];
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	referenceNo[4];
	char	lastRecCount[5];
	char 	filler[10];
};

struct reqMsgIdCheck
{
	char	msgLen[6];
	char	service[2];			/* 74 for Id Number existance */
	char	homeBranch[4];
	char	idType;
	char	idNo[15];
	char	filler[50];
};

struct reqMsgSignatory 
{
    char msgLen[6];
	char service[2];   /* 75 for New Signatory Creation */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	/*1-pending with supervisor
				              2-pending with CSO
							  3-Rejected completely
					       	  9-completed */
	char accNo[14];
	char signatoryNo[4];
	char supervisorId[10];	
	char custBranchCode[4];
	char idType;	
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];

	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char diplomaticPpNo[15];
	char activeStatus;
	char disableReason[25];
	char filler[50];
};

struct reqMsgSignatorySearch
{
	char	msgLen[6];
	char	service[2]; 		/* 76 for signatory/owner/reference info search  */
	char 	homeBranch[4];
	char	requestType[2]; 	/* 00 - Read stsigntab from account update ; in this case, datetime will be used as key */
								/* 01 - Read from stsignlog */
								/* 02 - Read from stsigntab */
								/* 03 - Read from stownerlog */
								/* 04 - Read from stownertab */
	char	branchCode[4];
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	signatoryNo[4];
	char	lastRecCount[5];
	char 	filler[10];
};

struct reqMsgSignatoryDetail
{
	char	msgLen[6];
	char	service[2]; 		/* 77 for signatory info Detail  */
	char 	homeBranch[4];
	char	requestType[2]; 	/* 01 - Read from stsignlog */
								/* 02 - Read from stsigntab */
								/* 03 - Read from stownlog  */
								/* 04 - Read from stowntab  */
								/* 05 - Read from stcreflog */
								/* 06 - Read from stcreftab */
								/* 07 - Read from stheirlog */
								/* 08 - Read from stheirtab */

	char	branchCode[4];
	char	userId[10];
	char	dateTime[14];
	char	accNo[14];
	char	signatoryNo[4];
	char 	filler[50];
};

struct reqMsgOwner 
{
    char msgLen[6];
	char service[2];   /* 78 for New Owner Creation */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	/*1-pending with supervisor
				              2-pending with CSO
							  3-Rejected completely
					       	  9-completed */
	char custNo[14];
	char ownerNo[4];
	char ownerType;
	char supervisorId[10];	
	char custBranchCode[4];
	char idType;	
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char parentCompanyName[30];
	char sharHoldingPerc[3];

	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];

	char address1[30];
	char address2[30];
	char poBox[10];	
	char cityName[20];
	char zipCode[10];	
	char country[3];	
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];
	char telHomeNo[10];	
	char telHomeExt[4];
	char faxAreaCode[4];
	char faxNo[10];		
	char faxExt[4];	
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeAddress1[30];
	char homeAddress2[30];
	char homePoBox[10];	
	char homeCityName[20];
	char homeZipCode[10];	
	char homeCountry[3];	
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];
	char homeTelHomeNo[10];	
	char homeTelHomeExt[4];
	char homeFaxAreaCode[4];
	char homeFaxNo[10];		
	char homeFaxExt[4];	
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEMail[30];	
	char ownerActiveStatus;
	char addressType; /* 0- PO BOX; 1-Saudi Post */
};

struct reqMsgDiplomats
{
	char	msgLen[6];
	char	service[2];			/* 10 for Resident Juristic Diplomats */
	char	homeBranch[4];
	char	userId[10];
	char	dateTime[14];
	char	creationOrUpdate;
	char 	newOrUpdate;
	char 	bmUpdateStatus;				  /*1-pending with supervisor
				               			    2-pending with CSO
										    3-Rejected completely
					       				    9-completed */
	char	custNo[7];
	char	supervisorId[10];	
	char	custBranchCode[4];
	char	ppNo[15];		
	char 	ppIssuedAt[20];	
	char 	ppDateType;	
	char 	ppIssueDateH[8];	
	char 	ppIssueDateG[8];
	char 	ppExpiryDateH[8];	
	char 	ppExpiryDateG[8];
	char	dcNo[15];
	char 	dcIssuedAt[20];	
	char 	dcDateType;	
	char 	dcIssueDateH[8];	
	char 	dcIssueDateG[8];
	char 	dcExpiryDateH[8];	
	char 	dcExpiryDateG[8];
	char	visaNo[15];
	char 	visaIssuedAt[20];	
	char 	visaDateType;	
	char 	visaIssueDateH[8];	
	char 	visaIssueDateG[8];
	char 	visaExpiryDateH[8];	
	char 	visaExpiryDateG[8];
	char 	preferredLang;	
	char	nationality[3];
	char 	businessType[3];
	char	aFirstName[30];
	char	aLastName[30];	
	char	aShortName[30];	
	char	eFirstName[30];
	char	eLastName[30];	
	char	eShortName[30];
	char	address1[30];
	char	address2[30];
	char	poBox[10];	
	char	cityName[20];
	char	zipCode[10];	
	char	country[3];	
	char	telOffAreaCode[4];
	char	telOffNo[10];	
	char	telOffExt[4];
	char	telHomeAreaCode[4];
	char	telHomeNo[10];	
	char	telHomeExt[4];
	char	faxAreaCode[4];
	char	faxNo[10];		
	char	faxExt[4];	
	char	mobileNo[10];
	char	pagerNo[10];
	char	eMail[30];	
};

struct reqMsgChangeScreenLang
{
	char msgLen[6];
	char service[2]; /* 79 is for change screen language for the users */
	char homeBranch[4];
	char userId[10];
	char requiredLang;
	char filler[10];
};

struct reqMsgCardActivityReport
{
	char msgLen[6];				/* 0 - 6 */
	char service[2]; 			/* 6 - 2 */ /* AL is for online report on ATM card activity for the current banking Date */
	char homeBranch[4];			/* 8 - 4 */
	char userId[10];			/* 12 - 10 */
	char lastRecCount[5];		/* 22 - 5 */
	char reportDate[8];			/* 27 - 8 */
	char reportType;			/* 35 - 1 */ /* C - ATM card activity report 
												P - ATM pin select report
												T - Telephone pin select report 
											 */
	char filler[50];			/* 36 - 50 */ /* For future use */
};

struct reqMsgHeir
{
    char msgLen[6];
	char service[2];   /* AM for New Heir(for saudi) Creation */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char bmUpdateStatus;	     /*1-pending with supervisor 
				               	   2-pending with CSO
								   3-Rejected completely
					       		   9-completed */
	char custNo[7];
	char heirNo[4];
	char heirType;
	char supervisorId[10];
	char custBranchCode[4];
	char idType;
	char idNo[15];
	char idIssuedAt[20];
	char idDateType;		/* 0-Hijri ; 1-Gregorian */
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];

	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	
	char addressType; /* 0-PO box ; 1-Saudi post */
	char custOpenSource; 	/* P-Phone ; */
	char branchCsoId[10];	/* This field will be filled only for the customers opened through phone; */
	char branchActionDateTime[14];/* This field will be filled only for the customers opened through phone; */
	char activityFlag;		/* P-Branch has taken the customer record entered through phone banking ; otherwise space */
	char proxyNo[15];
	char proxyDateType;
	char proxyIssueDateH[8];
	char proxyIssueDateG[8];
	char filler[50];	/* Future enhancement */
};

struct reqMsgSadadEnq
{
	char msgLen[6];
	char service[2]; /* 81 is for Sadad Bill Enquiry */
	char homeBranch[4];
	char userId[10];
	char langInd;     /* A-Arabic ; E - English ; N-Use the new bill enquiry layout */
	char custNo[7];		
	char idType;
	char idNo[15];
	char subscriptionNo[19]; 
	char companyId[4];
	char newLangInd[5];
	char billNo[19];
	char startDate[8]; /* YYYYMMDD */
	char endDate[8];   /* YYYYMMDD */
	char inclPayments; /* 0-False ; 1-True */
	char inclPaidBills; /* 0-False ; 1-True */
	char filler[50];
};

struct reqMsgTransferEnq
{
	char msgLen[6];
	char service[2]; /* 82 is for SARIE/SWIFT transfer enquiry */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char fromDate[8];
	char toDate[8];
	char bpRefNo[10];
	char recordStatus;
	char lastRecCount[5];
	char filler[10];
};

struct reqMsgTransferDetail
{
	char msgLen[6];
	char service[2]; /* 83 is for SARIE/SWIFT transfer details */
	char homeBranch[4];
	char userId[10];
	char bpRefNo[10]; /* will be spaces for request type 02 */
	char transDate[8];  /* will be spaces for request type 02 */ /* Added for Swift centralization project */
	char requestType[2]; /* 01-Read from rid0data  ; for update 
							02-read from stswiftlog ;  Added for Swift centralization project 
							03-read from rid0data ; but, enquiry mode  */
	char branchCode[4];						
	char dateTime[14];
	char filler[50];
};

struct reqMsgBmTransDetail
{
	char msgLen[6];
	char service[2]; /* 84 is for Bankmaster transaction details */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char bpRefNo[10];
	char valueDate[8];
	char filler[10];
};

struct reqMsgBmTransEnq
{
	char msgLen[6];
	char service[2]; /* 85 is for BM Transaction enquiry for a specific transaction type */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char fromDate[8];
	char toDate[8];
	char transType[2];
	char lastRecCount[5];
	char filler[10];
};

struct reqMsgBlockBreakup
{
	char msgLen[6]; 
	char service[2]; /* 86 is for breakup for GL Blocking amount */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char filler[10];
};

struct reqMsgAcctHistory
{
	char msgLen[6]; 
	char service[2]; /* 87 is for Account update history */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char accNo[14];
	char filler[10];
};

struct reqMsgManualBlocking
{
	char msgLen[6]; 
	char service[2]; /* 88 is for Manual Blocking maintenance */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char action;	/* N-New blocking; A-Amend existing blocking; D-Delete the manual blocking */
	char creationOrUpdate;	/* C-Creation ; U-Update */
	char cardNo[16];
	char accNo[14];
	char oldAmt[14];  		/* will be blank action = 'N' or 'D' */
	char blockAmt[14]; 
	char cardOrAcct;		/* C- Credit card blocking ; A-A/c manual blocking */
	char filler[10];
};

struct reqMsgBlockPendingList
{
	char msgLen[6];
	char service[2]; /* 89 is for Block PendingList Request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; 		/* S - Supervisor ; T - Teller */
	char cardOrAcct;		/* C - Credit card blocking ; A-A/c manual blocking */
	char custNo[7];
	char filler[10];
};

struct reqMsgBlockApproval
{
	char msgLen[6];
	char service[2]; 	/* 92 is for Block approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char cardNo[16];
	char supervisorId[10];
	char supervisorComments[200];
	char cardOrAcct;		/* C- Credit card blocking ; A-A/c manual blocking */
	char filler[10];
};

struct reqMsgSearchEngine
{
	char msgLen[6];
	char service[2]; /* 80 is for Search Engine */
	char homeBranch[4];
	char userId[10];
	char searchName[60];
	char custNo[7];
	char searchLevel;
	char filler[10];
};

struct billerInfo
{
	char billingAcct[19]; /* subscriber number */
	char billerId[3];	  /* Biller identification code */
};

struct reqMsgSadadProfile
{
	char msgLen[6]; 
	char service[2]; /* 95 is for SADAD cusotmer profile maintenance */
	char homeBranch[4];
	char userId[10]; 
	char langInd[5]; 	/* ar-sa - ARABIC ; en-gb - ENGLISH */
	char idNo[15];
	char idType;  
	char action;	/* E-Enquiry; A-Add bills to profile ; D-Delete bills from profile */
	char recCount[3];
	struct billerInfo details[100]; /* maximum 100 to be confirmed with Altaf */
};

struct reqMsgSadadMaintenance 
{
	char	msgLen[6];
	char	service[2]; 					/* AA for Sadad Codes Maintenance     */
	char	homeBranch[4];
	char	keyValue[12];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
										A-add;U-update,D-delete*/
	char	arabicName[50];
	char	englishName[50];
	char	otherDetails[100]; /* for future use */
};

struct reqMsgReturnedMail 
{
	char	msgLen[6];			/* 0 - 6 */
	char	service[2]; 		/* 6 - 2 */ /* AB for register returned mail & to get details about the reference number */
	char	homeBranch[4];		/* 8 - 4 */
	char	userId[10];			/* 12- 10*/
	char	refNo[16];			/* 22- 16*/
	char	msgType;			/* 38- 1 */ /* 0-Get the details about the reference number
								              1-Register the reference number as "Returned" */
	char	custNo[7];			/* 39- 7 */
	char	returnedReason;		/* 46- 1 */
	char	filler[50];			/* 47- 50*/ /* for future use */
};

struct reqMsgReturnedMailPendingList 
{
	char	msgLen[6];			/* 0  - 6 */
	char	service[2]; 		/* 6  - 2 */ /* AC for getting pending list of returned mail */
	char	homeBranch[4];		/* 8  - 4 */
	char	userId[10];			/* 12 - 10 */
	char	lastRecCount[5];	/* 22 - 5 */
	char	msgType;			/* 27 - 1 */ /* M - Mandate pending 
												C - Call centre pending
												B - Branch pending
												S - Enquiry on specific customer
											  */
	char	custNo[7];			/* 28 - 7 */ /* if it is provided, then all returned mail
												for this customer will be fetched */
	char	filler[50];			/* 35 - 50 */ /* for future use */
};

struct reqMsgReturnedMailStatusUpdate 
{
	char	msgLen[6];			/* 0  - 6 */
	char	service[2]; 		/* 6  - 2 */ /* AD for updaing returned mail status update/action update */
	char	homeBranch[4];		/* 8  - 4 */
	char	userId[10];			/* 12 - 10 */
	char	msgType;			/* 22 - 1 */ /* M - Mandate action 
												C - Call centre action
												B - Branch action
											  */
	char	refNo[16];			/* 23 - 16 */											
	char	addressFixed;		/* 39 - 1 */ /* 1-Address fixed ; 2-Address not fixed ; 3-Customer not reachable/StmtDisabled*/
	char	deliveredToCustomer;/* 40 - 1 */ /* 0-No;1-YES */
	char	remarks[75];		/* 41 - 75 */
	char	filler[50];			/* 116 - 50 */ /* for future use */
};

struct reqMsgReturnedMailReport
{
	char msgLen[6];				/* 0 - 6 */
	char service[2]; 			/* 6 - 2 */ /* AE is for Returned mail report */
	char homeBranch[4];			/* 8 - 4 */
	char userId[10];			/* 12 - 10 */
	char lastRecCount[5];		/* 22 - 5 */
	char reportDate[8];			/* 27 - 8 */
	char branchCode[4];			/* 35 - 4 */
	char filler[50];			/* 39 - 50 */ /* For future use */
};

struct reqMsgNewCustomerReport
{
	char msgLen[6];				/* 0 - 6 */
	char service[2]; 			/* 6 - 2 */ /* AF is for online report on new customer opened on current date */
	char homeBranch[4];			/* 8 - 4 */
	char userId[10];			/* 12 - 10 */
	char lastRecCount[5];		/* 22 - 5 */
	char reportDate[8];			/* 27 - 8 */
	char filler[50];			/* 35 - 50 */ /* For future use */
};

struct reqMsgGeneralCustStatusEnq
{
	char msgLen[6];
	char service[2]; /* 30 is for General Customer Status enquiry */
	char homeBranch[4];
	char userId[10];
	char fromDate[8];
	char toDate[8];
	char recordStatus;
	char lastRecCount[5];
	char filler[50];
};

struct reqMsgTimeDepositIntRateEnq
{
	char msgLen[6];
	char service[2]; /* AG is for Fetching Time Deposit Interest Rates */
	char homeBranch[4];
	char userId[10];
	char tdLedger[3];
	char tdCurrency[2];
	char depositAmt[15]; 
	char tenorType; /* D-Days; W-Weeks ; M-Months; Y-Years*/
	char tenor[3];
	char debitAccNo[14];
	char intAppln;
	char payAccNo[14];
	char valueDate[8]; /* Added to support back-value dated TD */
	char filler[50];
};

struct reqMsgTimeDeposit
{
	char msgLen[6];
	char service[2]; /* AH is for Time Deposit Request */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char newOrUpdate;
	char accNo[14];
	char supervisorId[10];
	char custNo[7];	
	char tdLedger[3];			
	char tdCurrency[2];			
	char debitAccNo[14];
	char depositAmt[14];
	char tenorType;	
	char tenorPeriod[3];
	char fundIntRate[9];
	char exRate[14];
	char bmFundIntRate[9];
	char bmExRate[14];
	char maturityAmt[14];
	char maturityDate[8];
	char valueDate[8]; /* to support back value dated TD */
	char overrideValueDate; /* to support back value dated TD */
	char overrideIntRate;
	char overrideExRate;
	char autoRenewFlag;	
	char diffDays[3];
	char intAppln;
	char payAccNo[14];
	char debitAmt[14];  /* added with back-value dated TD */
	char supervisorComments[200];
	char filler[50];
};

struct reqMsgTimeDepositPendingList
{
	char msgLen[6];
	char service[2]; /* AI is for Time Deposit Pending List request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; /* S - Supervisor ; T - Teller (CSO) */
	char custNo[7];
	char filler[50];
};

struct reqMsgTimeDepositDetail
{
	char msgLen[6];
	char service[2]; /* AJ is for Time Deposit Detail Request */
	char homeBranch[4];
	char requestType[2]; /* 01  -  to read from sttdlog	
					 	 	02  -  Get the time deposit detail from TUXEDO 
						 */
	char userId[10];
	char dateTime[14];
	char custNo[7];
	char filler[10];
};

struct reqMsgTimeDepositApproval
{
	char msgLen[6];
	char service[2]; 	/* AK is for Time Deposit approval Request		  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to Teller*/
	char userId[10];
	char dateTime[14];
	char accNo[14];
	char custNo[7];
	char supervisorId[10];
	char supervisorComments[200];
	char newOrUpdate;
	char filler[10];
};

struct reqMsgBranchSwiftTransfers
{
	char msgLen[6];
	char service[2]; /* AN is for branch SWIFT transfer enquiry */
	char homeBranch[4];
	char userId[10];
	char reqdDate[8];
	char branchCode[4];
	char lastRecCount[5];
	char filler[50]; 
};

struct reqMsgSwiftTransfer 
{
    char msgLen[6];
	char service[2];   /* AO for Swift transfer record modification by the central branch */
	char homeBranch[4];
	char userId[10];
	char dateTime[14];
	char creationOrUpdate;
	char bmUpdateStatus;				 /*1-pending with supervisor
				               			   2-pending with CSO
										   3-Rejected completely
					       				   9-completed */
	char transRefNo[10];
	char issueDate[8];
	char supervisorId[10];	
	char transferPurpose[2];
	char applicantName[35];
	char applicantAddress1[35];
	char applicantAddress2[35];
	char applicantIdNo[15];
	char applicantAddress3[35];
	char applicantNationality[3];
	char issueBranchCode[4];
	char benefName[30];
	char ibanOrAccNo;
	char benefAccNo[35];
	char benefBankName[35];
	char benefAddress1[35];
	char benefAddress2[35];
	char benefAddress3[35];
	char benefCountryCode[2];
	char benefBankAddress1[35];
	char benefBankAddress2[35];
	char bankSortCode[35];
	char benefBankBIC[11];
	char message1[35];
	char message2[35];
	char message3[35];
	char message4[35];
	char filler[50];
};

struct reqMsgSwiftCentrePendingList
{
	char msgLen[6];
	char service[2]; /* AP is for Swift centre Pending List request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; /* S - Supervisor ; T - Teller (CSO) */
	char reqdBranch[4];
	char filler[50];
};

struct reqMsgSwiftTransferApproval
{
	char msgLen[6];
	char service[2]; 	/* AQ is for Swift transfer approval Request  */
	char homeBranch[4];
	char appRejectFlag; /* A - for Approved		*/
						/* R - for Rejected		*/
						/* F - for Forward to CSO*/
	char userId[10];
	char dateTime[14];
	char transRefNo[10];
	char supervisorId[10];
	char supervisorComments[200];
	char filler[10];
};

struct reqMsgSwiftTransferEnq
{
	char msgLen[6];
	char service[2]; /* AS is for SWIFT transfer Enquiry */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char reqdDate[8];
	char reqdBranch[4];
	char requestType;/* 0 - Transfers initiated from branches; 
						1 - Transfers approved by transfer centre 
						2 - Transfers rejected by transfer centre 
						3 - Transfers pending in transfer centre 
					 */
	char filler[50];
};

struct reqMsgSadadPayment
{
	char msgLen[6];
	char service[2]; /* AT is for Sadad Bill payment */
	char homeBranch[4];
	char userId[10];
	char tellerId[3];
	char custNo[7];		
	char idType;
	char idNo[15];
	char companyId[4];
	char subscriptionNo[19]; 
	char billNo[19];
	char langInd[5];
	char paymentType[4];
	char drAccNo[14];
	char billAmt[19];
	char transRefNo[10];
	char cashOrAcc; /* A-A/c ; C-Cash */
	char preOrPostpaid; /* 0-Post paid ; 1-Pre paid */
	char reversalFlag;  /* T-True ; F-False */
	char filler[50];
};

struct reqMsgSadadRevesal
{
	char msgLen[6];
	char service[2]; /* AU is for Sadad Bill reversal / AW - Register reversal request */
	char homeBranch[4];
	char userId[10];
	char tellerId[3];
	char transRefNo[10];
	char bankingDate[8];
	char activityFlag; /* This field is applicable only for the service AW
						  S-Send the approval request to supervisor; 
						  A-Send the approval message to Teller; 
						  R-Reject the request from teller*/
	char filler[50];
};

struct reqMsgSadadAdvice
{
	char msgLen[6];
	char service[2]; /* AV is for Sadad Bill payment advice */
	char homeBranch[4];
	char userId[10];
	char tellerId[3];
	char transRefNo[10];
	char paymentRef[12];
	char filler[50];
};

struct reqMsgSadadReversalPendingList
{
	char msgLen[6];
	char service[2]; /* AX is for CSD Trans reversal Pending List request */
	char homeBranch[4];
	char userId[10];
	char lastRecCount[5];
	char activityFlag; /* S-Supervisor;T-Teller*/
	char reqdTransRefNo[10];
	char filler[50];
};

struct reqMsgSadadTransEnq
{
	char msgLen[6];
	char service[2]; /* AY is for Sadad Transaction enquiry */
	char homeBranch[4];
	char userId[10];
	char tellerId[3];
	char companyId[4];
	char transDate[8];
	char enqTellerId[3];
	char subscriptionNo[19];
	char lastRecCount[5];
	char filler[50];
};

struct reqMsgAccOpeningCard
{
	char msgLen[6];
	char service[2]; /* AZ is for Fetching info for printing the account opening card */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char filler[50];
};

struct reqMsgPrintAccOpeningCard
{
	char msgLen[6];
	char service[2]; /* BA is for confirming Printing of account opening card */
	char homeBranch[4];
	char userId[10];
	char custNo[7];
	char requestType; 	/* 1-Successfully printed ; 9-Failed to print */
	char accNo[14];
	char iban[24];
	char customerLang;
	char shortName[30];
	char custOpenDate[8];
	char custBranchCode[4];
	char filler[50];
};

struct reqMsgFetchAccDetails
{
	char msgLen[6];
	char service[2]; /* BB is for getting IBAN for the given account number */
	char homeBranch[4];
	char userId[10];
	char accNo[14];
	char filler[50];
};

union msgReceived	
{
	struct reqMsgLogin 		    	login;
	struct reqMsgPassword 			passwordChange;
	struct reqMsgMaintenance		maintenance;
	struct reqMsgSecurity   		security;
	struct reqMsgUserList			userList;
	struct reqMsgIndividualOthers	individualOthers;
	struct reqMsgSaudiIndividual	saudiIndividual;
	struct reqMsgJuristic			juristic;
	struct reqMsgCustomer       	customer;
	struct reqMsgJoint          	joint;
	struct reqMsgAccount        	account;
	struct reqMsgPendingList    	pendingList;
	struct reqMsgPendingList1   	pendingList1;
	struct reqMsgPendingDetail  	pendingDetail;
	struct reqMsgJointDetail    	jointDetail;
	struct reqMsgSupervisorDecision supDecision;
	struct reqMsgRefresh			refresh;
	struct reqMsgSearch 			search;
	struct reqMsgCardInfo			cardInfo;
	struct reqMsgAccSearch			accSearch;
	struct reqMsgCardSearch			cardSearch;
	struct reqMsgAccPendingList		accPendingList;
	struct reqMsgAccPendingDetail 	accPendingDetail;
	struct reqMsgAccApproval		accApproval;
	struct reqMsgCardPendingList 	cardPendingList;
	struct reqMsgCardPendingDetail 	cardPendingDetail;
	struct reqMsgCardApproval		cardApproval;
	struct reqMsgForceCardGeneration forceCard;
	struct reqMsgCardActivate		cardActivate;
	struct reqMsgDC9000Status		dc9000Status;
	struct reqMsgStatusList			statusList;
	struct reqMsgStatusUpdate		statusUpdate;
	struct reqMsgResetPassword  	resetPassword;
	struct reqMsgCardHistory    	cardHistory;
	struct reqMsgChequeBook			chequeBook;
	struct reqMsgChqBkStatusList 	chqBkStatusList;
	struct reqMsgChqBkStatusUpdate 	chqBkStatusUpdate;
	struct reqMsgPensionSearch		pensionSearch;
	struct reqMsgPensionDetail		pensionDetail;
	struct reqMsgStdOrdSearch		stdOrdSearch;
	struct reqMsgStdOrdDetail		stdOrdDetail;
	struct reqMsgStdOrdInfo			stdOrdInfo;
	struct reqMsgStopChqDetail		stopChqDetail;
	struct reqMsgStopChqInfo		stopChqInfo;
	struct reqMsgCheckCust			checkCust;
	struct reqMsgChangeAddress		changeAddress;
	struct reqMsgStdOrdPendingList 	stdOrdPendingList;
	struct reqMsgStdOrdApproval		stdOrdApproval;
	struct reqMsgStopChqPendingList	stopChqPendingList;
	struct reqMsgStopChqApproval	stopChqApproval;
	struct reqMsgChequeBookHistory	chequeBookHistory;
	struct reqMsgAcctStatusHistory	acctStatusHistory;
	struct reqMsgChequeBookReport	chequeBookReport;
	struct reqMsgAtRefresh			atRefresh;
	struct reqMsgPrintCard			printCard;
	struct reqMsgProcessPin			processPin;
	struct reqMsgCardRestrict		cardRestrict;
	struct reqMsgLogoutUser			logoutUser;
	struct reqMsgCustHistory		custHistory;
	struct reqMsgTpinRequest		tpinRequest;
	struct reqMsgTpinPendingList	tpinPendingList;
	struct reqMsgCheckCategory		checkCategory;
	struct reqMsgReference			reference;
	struct reqMsgJointInfoSearch	jointInfoSearch;
	struct reqMsgReferenceSearch 	referenceSearch;
	struct reqMsgIdCheck			idCheck;
	struct reqMsgSignatory			signatory;
	struct reqMsgSignatorySearch	signatorySearch;
	struct reqMsgSignatoryDetail	signatoryDetail;
	struct reqMsgOwner				owner;
	struct reqMsgChangeScreenLang	changeScreenLang;
	struct reqMsgQuickCustomer		quickCustomer;
	struct reqMsgSadadEnq			sadadEnq;
	struct reqMsgTransferEnq		transferEnq;
	struct reqMsgTransferDetail		transferDetail;
	struct reqMsgBmTransDetail		bmTransDetail;
	struct reqMsgBmTransEnq			bmTransEnq;
	struct reqMsgBlockBreakup		blockBreakup;
	struct reqMsgAcctHistory		acctHistory;
	struct reqMsgManualBlocking		manualBlocking;
	struct reqMsgBlockPendingList	blockPendingList;
	struct reqMsgBlockApproval		blockApproval;
	struct reqMsgSearchEngine		searchEngine;
	struct reqMsgSadadProfile		sadadProfile;
	struct reqMsgSadadMaintenance 	sadadMaintenance;
	struct reqMsgReturnedMail 		returnedMail;
	struct reqMsgReturnedMailPendingList 	returnedMailPendingList;
	struct reqMsgReturnedMailStatusUpdate 	returnedMailStatusUpdate;
	struct reqMsgReturnedMailReport	returnedMailReport;
	struct reqMsgNewCustomerReport	newCustomerReport;
	struct reqMsgGeneralCustStatusEnq generalCustStatusEnq;
	struct reqMsgTimeDepositIntRateEnq	timeDepositIntRateEnq;
	struct reqMsgTimeDeposit			timeDeposit;
	struct reqMsgTimeDepositPendingList	timeDepositPendingList;
	struct reqMsgTimeDepositDetail		timeDepositDetail;
	struct reqMsgTimeDepositApproval	timeDepositApproval;
	struct reqMsgCardActivityReport		cardActivityReport;	
	struct reqMsgHeir					heir;
	struct reqMsgBranchSwiftTransfers	branchSwiftTransfers;
	struct reqMsgSwiftTransfer			swiftTransfer;
	struct reqMsgSwiftCentrePendingList	swiftCentrePendingList;
	struct reqMsgSwiftTransferApproval	swiftTransferApproval;
	struct reqMsgSwiftTransferEnq		swiftTransferEnq;
	struct reqMsgSadadPayment			sadadPayment;
	struct reqMsgSadadRevesal			sadadReversal;
	struct reqMsgSadadAdvice			sadadAdvice;
	struct reqMsgSadadReversalPendingList	sadadReversalPendingList;
	struct reqMsgSadadTransEnq			sadadTransEnq;
	struct reqMsgAccOpeningCard			accOpeningCard;
	struct reqMsgPrintAccOpeningCard	printAccOpeningCard;
	struct reqMsgFetchAccDetails		fetchAccDetails;
} receivedMsg;

struct resMsgLogin 
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char    langPref;
	char    lastPasswordChangeDate[8];
	char    branchCode[4];
	char	authorityLevel[20];
	char	globalUpdatePriv;
	char	aRemarks[50];
	char	eRemarks[50];
	char	bankingDate[8];
	char	cardPrdnAtBranch;
	char	pinSelectAtBranch;
	char	passwordChngAlertFlag;
	char	mainBrEditAllowed;
	char	currentDateH[8];
	char	currentDateG[8];
	char	tpinSelectAtBranch;
	char	dormantActivationFlag;
	char	tpinMandatoryFlag;
	char	idleTimeOutPeriod[4];
	char	nameSearchAllowed;
	char	stdOrdReqAllowed;
	char	custNameUpdAllowed;
	char	enableChipCard;
	char	mailCentreBranch;
	char	mandateBranch;
	char	callCentreBranch;
	char	internalCustOpenAllowed;
	char	enableLocalChipCard;
	char	generalCustOpenAllowed;
	char	pensionCustOpenAllowed;	/* by Mohit on 28-Nov-2006 */
	char	feeExclusionUpdAllowed;
	char	enableSadadProfile;
	char	maxAgeLimit[3];
	char	filler[124]; 
	char	authorityLevel2[60];
	char	generalSamaUpdAllowed;
	char	swiftCentreBranchFlag;		
	char	tellerId[3];
	char	payrollBranch;		
	char	accOpenCardPrintAllowed;
	char	filler1[50];
	char	nullPad;
};

struct resMsgPassword 
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	authorityLevel[20];
	char	aRemarks[50];
	char	eRemarks[50];
	char	filler[10];
	char	nullPad;
};

struct resMsgCustomer
{
	char    msgLen[6];
    char    status[3];
    char    service[2];
	char	aRemarks[50];
	char	eRemarks[50];
	char	custNo[7];
	char	filler[10];
	char	nullPad;
};

struct resMsgSignatory 
{
	char    msgLen[6];
    char    status[3];
    char    service[2];
	char	aRemarks[50];
	char	eRemarks[50];
	char	duplicateAccNo[14];
	char	filler[50];
	char	nullPad;
};

struct resMsgMaintenance 
{
	char	msgLen[6];
	char	status[3];
	char	remarks[50];
	char	bmStatus;				/*0-Success;1-Failure*/
	char	service[2]; 			/* 50 for control file maintenance */
	char	keyValue[6];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
										A-add;U-update,D-delete*/
	char	arabicName[30];
	char	englishName[30];
	char	otherDetails[180]; 
	char	filler[10]; 
	char	nullPad;
};

struct resMsgSecurity 
{
	char	msgLen[6];
	char	status[3];
	char	remarks[50];
	char	bmStatus;				/*0-Success;1-Failure*/
	char	service[2]; 			/* 90 for security */
	char	keyValue[22];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
									  A-add;U-update,D-delete*/
	char	lastPasswdChangeDate[8];
	char	liveStatus;
	char	employeeNo[8];
	char	branchCode[4];
	char	name[60];
	char	authorityLevel[20];
	char	loginStatus;
	char	lastLoginDateTime[14];
	char	langPreferred;
	char	globalUpdatePriv;
	char	loginIpAddress[15];

	char	lastUpdateUser[10];
	char	lastUpdateDate[8];
	char	authorityLevel2[60];
	char	bpUserId[3];
	char	otherDetails[5];
	char	filler[10];
	char	enqAllowedBrn[500][4];
	char	nullPad;
};

struct userDetails
{
	char	userId[10];
	char	userName[30];
	char	liveStatus;
	char	branchCode[4];
	char	langPref;
	char	globalUpdatePriv;
	char	authorityLevel[20];
};

struct resMsgUserList
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	remarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct  userDetails details[20]; 
	char	nullPad;
};

struct searchEngineDetails
{
	char	englishName[35];
	char	arabicName[35];
	char	idNo[15];
	char	dobDetails[20];
	char	placeOfBirth[20];
	char	position[20];
	char	miscInfo[50];
	char	extractFlag;
	char	sourceName[4];
};

struct resMsgCheckCust
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /*48 is for Checking for existing customer & ABC list */
	char	aRemarks[50];
	char	eRemarks[50];
	char 	foundInAList;
	char 	foundInBList;
	char 	foundInCList;
	char 	reportedBank[4];
	char 	nameInABCList[30];
	char 	existingCustomer;
	char 	existCustNo[7];
	char 	existCustName[30];
	char	foundInTList;
	char	noOfRecs[2];
	char	displayWarningMsg;  /* 1-YES ; 0-No */
	char	filler[49];
	struct  searchEngineDetails details[50]; 
	char	filler1[10];
	char	nullPad;
};

struct resMsgPendingList
{
      char msgLen[6];
	  char status[3];
	  char service[2]; /* 17 is for Pending List Request */
	  char aRemarks[50];
	  char eRemarks[50];
	  char userId[20];
	  char dateTime[14];
	  char custNo[7];
	  char shortName[30];
	  char idType;
	  char idNumber[15];
	  char lastRecRead[3];
	  char supervisorComments[200];
	  char filler[10];
	  char nullPad;
};

struct custPendingDetails
{
	  char userId[20];
	  char dateTime[14];
	  char custNo[7];
	  char shortName[30];
	  char idType;
	  char idNo[15];
	  char mainCategoryCode[2];
	  char subCategoryCode[2];
};

struct resMsgPendingList1
{
      char msgLen[6];
	  char status[3];
	  char service[2]; /* 12 is for pending List for phaseII*/
	  char aRemarks[50];
	  char eRemarks[50];
	  char lastRecCount[5];
	  char noOfRecs[2];
	  char filler[10];
	  struct custPendingDetails details[20];
	  char nullPad;
};

struct accDetails
{
	char	userId[10];
	char	dormantActivationUpd;
	char	filler[9];
	char	dateTime[14];
	char	accNo[14];
	char	accStatus[2];
	char	branchCode[4];
};

struct resMsgAccPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  accDetails details[20]; 
	char	nullPad;
};

struct resMsgAccPendingDetail
{
	char	msgLen[6];
	char	status[3];
	char	service[2];
	char	aRemarks[50];
	char	eRemarks[50];
	char	supervisorId[10];
	char	newOrUpdate;
	char	accNo[14];
	char	accStatus[2];
	char	stmtFreq[2];
	char	branchCode[4];
	char	custName[30];
	char	intApplication;
	char	crIntRate[9];
	char	drIntRate[9];
	char	payAccNo[14];
	char	uniqueNo[5];
	char	uniqueSub[2];
	char	statementDay;
	char	accOpenDate[8];
	char	lastAmendDate[8];
	char	supervisorComments[200];
	char	intApplicationDay[2];
	char	intApplicationFreq[3];
	char	collateral[15];
	char	memoNote1[20];
	char	memoNote2[20];
	char	lastUpdateUserId[10];
	char	acctDesc[30];
	char	initialStatus[2];
	char	accLimit[12];
	char	dormantAcc;
	char	intLastRun[14];
	char	restrictedFlag;
	char	samaAccStatus[2];
	char	accStatusChangeReason[30];
	char	initialSamaStatus[2];
	char	samaStatusChanged;
	char 	keyDateTime[14];
	char	dormantActivationUpd;
	char	lastTransDate[8];
	char	lastUpdateStDate[8];
	char	lastUpdateAppDate[8]; /* Last Approved Date */	
	char 	foundInTList;
	char 	noOfRecs[2];
	char	signatoryForOthers;			
	char	ibanAccNo[24];
	/*char 	filler[9];*/
	char 	filler[50];
	struct 	searchEngineDetails details[50]; 
	char	filler2[50];		/* For Future Enhancement */
	char	nullPad;
};

struct cardDetails
{
	char	userId[10];
	char	dateTime[14];
	char	cardNo[19];
	char	nameOnTheCard[26];
	char	cardStatus;
	char	natureOfCard;
	char	pendingType[10];
};

struct resMsgCardPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 23 is for Card PendingList Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct  cardDetails details[20]; 
	char	nullPad;
};

struct resMsgCardInfo
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 20 is for New card request / update card */
	char	aRemarks[50];
	char	eRemarks[50];
	char	cardNo[19];
	char	dateTime[14];
	char	filler[10];
	char	nullPad;
};

struct resMsgCardPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 25 is for Card Pending Detail Request */
	char aRemarks[50];
	char eRemarks[50];
	char supervisorId[10];			 /*41 - 20*/
	char cardNo[19];				 /*61 - 19*/
	char requestStatus;				 /*80 - 1*//*0-Requested;1-Approved
									   		     2-Processed;
												 3-GeneratedAtDc9000
												 4-ReceivedByBranch
												 5-ReceivedByCustomer
												 8-Canceled by Branch
												 9-Rejected
													*/
	char cardType;					 /*81 - 1*//*R-Regular;I-International
												 V-VIP;A-Administrative;
												 D-Deposit only, C-CPS*/
	char newOrReplacement;			 /*82 - 1*//*N-New; R-Replacement*/
	char primaryOrSupplementary;	 /*83 - 1*//* P-Primary;R-Replacement*/
	char cardStatus;				 /*84 - 1*//* 0-Requested;1-Open;2-Lost
										        3-Stolen;4-Restricted;9-Closed*/
	char regionCode;				 /*85 - 1*//*1-Central;2-West;3-East*/
	char bmAccNo[14];				 /*86 - 14*/
	char languageCode;				 /*100 - 1*//*ATM screen language
													1-Arabic
													2-English
													3-Arabic/English
													*/
	char customerBranch[4];			 /*101 - 4*/
	char nameOnTheCard[26];			 /*105 - 26*/
	char address1[30];				 /*131 - 30*/
	char address2[30];				 /*161 - 30*/
	char poBox[10];					 /*191 - 10*/
	char cityName[20];				 /*201 - 20*/
	char zipCode[10];				 /*221 - 10*/
	char firstIssueDate[8];			 /*231 - 8*/
	char renewalDate[8];			 /*239 - 8*/ /* will be issue date for new cards */
	char expireDate[8];				 /*247 - 8*/
	char rejectedDate[8];			 /*255 - 8*/
	char rejectedUserId[10];		 /*263 - 20*/
	char rejectedReason[20];		 /*283 - 20*/
	char deactivationDate[8];		 /*322 - 8*/
	char deactivationUserId[10];	 /*330 - 20*/
	char titleCode[2];				 /*358 - 2*/
	char idNo[15];					 /*360 - 15*/
	char deliveryToBranchOrPO;		 /*375 - 1*//*B-Branch; P-PO Box*/
	char pinOffset[4];				 /*376 - 4*/
	char encryptedPin[5];			 /*380 - 5*/
	char cvv[3];					 /*385 - 3*/
	char pvv[4];					 /*388 - 4*/
	char requestType;				 /*392 - 1*/ 
	char pinRequestStatus;			 /*394 - 1*/
	char cardGeneratedDate[8];       /*329 - 8*/
	char cardGeneratedUserId[10];    /*337 - 10*/
	char cBranchReceiptDate[8];      /*347 - 8*/
	char cBranchReceiptUserId[10];   /*355 - 10*/
	char cCustIssueDate[8];          /*365 - 8*/
	char cCustIssueUserId[10];       /*373 - 10*/
	char pinGeneratedDate[8];        /*383 - 8*/
	char pinGeneratedUserId[10];     /*391 - 10*/
	char pBranchReceiptDate[8];      /*401 - 8*/
	char pBranchReceiptUserId[10];   /*409 - 10*/
	char pCustIssueDate[8];          /*419 - 8*/
	char pCustIssueUserId[10];       /*427 - 10*/
	char custNo[8];
	char newOrUpdate;
	char supervisorComments[200];
	char custName[30];
	char custCategory;  /* P - Pension  ; K - Package */
	char deliveryBranchCode[4];
	char coreAccNo[16];				 
	char sequenceNo[10];
	char filler[50]; /* For future enhancement */
	char nullPad;
};

struct cardHistoryDetails
{
	char requestType;
	char requestUserId[10];
	char requestDateTime[14];
	char cardGeneratedDate[8];
	char cardGeneratedTime[6];
	char cardGeneratedUserId[10];
	char cBranchReceiptDate[8];
	char cBranchReceiptTime[6];
	char cBranchReceiptUserId[10];
	char cCustIssueDate[8];
	char cCustIssueTime[6];
	char cCustIssueUserId[10];
	char pinGeneratedDate[8];
	char pinGeneratedTime[6];
	char pinGeneratedUserId[10];
	char pBranchReceiptDate[8];
	char pBranchReceiptTime[6];
	char pBranchReceiptUserId[10];
	char pCustIssueDate[8];
	char pCustIssueTime[6];
	char pCustIssueUserId[10];
	char supervisorId[10];
	char lastUpdateDateTime[14];
	char processDateTime[14];
	char rejectedUserId[10];
	char rejectedDate[8];
	char rejectedTime[6];
	char rejectedReason[20];
};

struct resMsgCardHistory
{
	char msgLen[6];
	char status[3];
	char service[2];		/* 36 is for Card History  */
	char aRemarks[50];
	char eRemarks[50];
	char noOfRecs[2];
	char filler[10];
	struct cardHistoryDetails details[50];
	char nullPad;
};

struct cardUpdateHistoryDetails
{
	  char branchCode[4];
	  char userId[10];
	  char dateTime[14];
	  char pendingStatus;
	  char supervisorId[10];
	  char lastUpdateDateTime[14];
	  char requestType;       
	  char filler[10];
};

struct resMsgCardUpdateHistory
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 36 is for Card Update History  */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	cardNo[19];
	char	filler[10];
	struct  cardUpdateHistoryDetails details[20]; 
	char	nullPad;
};

struct customerOpenUpdateInfo
{
	char custOpenDate[8];
	char branchOpened[4];
	char openMakerId[10];
	char openSupervisorId[10];
	char lastUpdateDate[8];
	char lastUpdateBranch[4];
	char lastUpdateMakerId[10];
	char lastUpdateSupervisorId[10];
};

struct tmpABCSrchCustDetails    /* this structure is used for keeping the ABC information, SrchEngine, Customer existence details
								   which will be then used to copy these information in appropriate response */
{
	char foundInAList;
	char foundInBList;
	char foundInCList;
	char reportedBank[4];
	char nameInABCList[30];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char foundInTList;
	char noOfRecs[2];
	struct searchEngineDetails details[50]; 
}abcSrchCustDetails;

struct resMsgJuristicPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 11 is for Pending Detail Request for juristic */
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];	
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char crNo[15];		
	char crIssuedAt[20];	
	char crDateType;	
	char crIssueDateH[8];	
	char crIssueDateG[8];
	char crExpiryDateH[8];	
	char crExpiryDateG[8];
	char licNo[15];
	char licDateType;
	char licIssueDateH[8];
	char licIssueDateG[8];
	char licExpiryDateH[8];
	char licExpiryDateG[8];
	char samaAuthNo[15];
	char samaAuthDateType;
	char samaAuthIssueDateH[8];
	char samaAuthIssueDateG[8];
	char samaAuthExpiryDateH[8];
	char samaAuthExpiryDateG[8];
	char ppNo[15];		
	char ppDateType;	
	char ppIssueDateH[8];	
	char ppIssueDateG[8];
	char ppExpiryDateH[8];	
	char ppExpiryDateG[8];
	char dcNo[15];		
	char dcDateType;	
	char dcIssueDateH[8];	
	char dcIssueDateG[8];
	char dcExpiryDateH[8];	
	char dcExpiryDateG[8];
	char visaNo[15];		
	char visaDateType;	
	char visaIssueDateH[8];	
	char visaIssueDateG[8];
	char visaExpiryDateH[8];	
	char visaExpiryDateG[8];
	char contractNo[15];		
	char contractDateType;	
	char contractIssueDateH[8];	
	char contractIssueDateG[8];
	char contractExpiryDateH[8];	
	char contractExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char purposeOfAccount[50];
	char govtShareHoldingPerc[3];
	char saudiShareHoldingPerc[3];
	char foreignShareHoldingPerc[3];
	char doeDateType;		
	char doeDateH[8];		
	char doeDateG[8];		
	char businessType[3]; /* changed from 4 to 3 */
	char aOrgFirstName[30];
	char aOrg2ndName[30];
	char aOrgShortName[30];		
	char eOrgFirstName[30];	
	char eOrg2ndName[30];	
	char eOrgShortName[30];
	char alphaSearchCode[6];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeAddress1[30];
	char homeAddress2[30];		
	char homePoBox[10];		
	char homeCityName[20];
	char homeZipCode[10];
	char homeCountry[3];
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];	
	char homeTelHomeNo[10];		
	char homeTelHomeExt[4];	
	char homeFaxAreaCode[4];		
	char homeFaxNo[10];			
	char homeFaxExt[4];		
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEmail[30];	

	char documents[60];
	char documentOther[50];	
	char signatureNature;		/*0-single;1-joint*/
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char restrictedBranchFlag;
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char supervisorComments[200];	

	char currentAccInfo[11];	/*Ledger(3)+currency(2)+accstatus(2)+stmt.freq(2															)+chequeBook(1) +droppedAcc(1) */
	char savingsAccInfo[11];
	char otherAccInfo[11];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char newOrUpdate;
	char overrideForNoSamaAuth;
	char overrideForNonSaudi;
	struct customerOpenUpdateInfo openUpdateInfo;
	char keyDateTime[14];
	char foundInTList;
	char noOfRecs[2];
	char marketingMemo[25];
	char addrType; /* 0-PO Box ; 1-Saudi Post */
	char accFreezingGracePeriod[3]; /* Added for SAR-2 */
	char approvalRefNo[15]; /* Added for SAR-2*/
	char appDateType; /* Added for SAR-2*/
	char appIssueDateH[8]; /* Added for SAR-2*/
	char appIssueDateG[8]; /* Added for SAR-2*/
	char appExpiryDateH[8]; /* Added for SAR-2*/
	char appExpiryDateG[8]; /* Added for SAR-2*/
	char appRefName[30]; /* Added for SAR-2*/
	char signatoryForOthers;
	char displayWarningMsgOnDuplicateId;  /* 1-YES ; 0-No */
	char mainBrCodeUpdAllowed;
	char filler[98]; /* Added for SAR-2*/
	/*char filler[24];*/
	struct searchEngineDetails details[50]; 
	char filler2[50];	/* For Future Enhancement */
	char nullPad;
};

struct resMsgSaudiIndividualPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 11 is for Pending Detail Request for saudi individuals */
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];	
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char passportNo[15];
	char ppIssuedAt[20];
	char ppDateType;
	char ppIssueDateH[8];
	char ppIssueDateG[8];
	char ppExpiryDateH[8];
	char ppExpiryDateG[8];
	char hafizaNo[15];
	char hafIssuedAt[20];
	char hafDateType;
	char hafIssueDateH[8];
	char hafIssueDateG[8];
	char hafExpiryDateH[8];
	char hafExpiryDateG[8];
	char familyRegnNo[15];
	char frIssuedAt[20];
	char frDateType;
	char frIssueDateH[8];
	char frIssueDateG[8];
	char frExpiryDateH[8];
	char frExpiryDateG[8];
	char certBirthNo[15];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];		
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char sexCode;			
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[3]; /* changed from 4 to 3 */
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char educationCode[2];
	char professionCode[2];	
	char positionCode[2];
	char monthlyIncome[2];	
	char ownerShip[10];	
	char segmentation;
	char employerName[30];	
	char department[20];
	char employerPoBox[10];	
	char employerCity[20];
	char employerZipCode[10];
	char documents[60];
	char documentOther[50];	
	char singleJointAcc;	/*0-single;1-joint;2-Undefined*/
	char packageAcc;
	char noOfJointCustomer[2];
	char jointAccNameOnCheck[60]; 
	char jointAccNameOnReports[30];
	char signatureNature;		/*0-single;1-joint*/
	char electronIntlRequired;	
	char electronIntlName[26];	
	char electronIntlSuppRequired;	
	char electronIntlSuppName[26];
	char deliveryToBranchOrPO;	
	char deliveryAddress1[30];
	char deliveryAddress2[30];
	char deliveryPoBox[10];	
	char deliveryCity[20];
	char deliveryZip[10];
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char restrictedBranchFlag;
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char referenceReqdFor[10];
	char supervisorComments[200];	

	char currentAccInfo[11];	/*Ledger(3)+currency(2)+accstatus(2)+stmt.freq(2															)+chequeBook(1) +droppedAcc(1) */
	char savingsAccInfo[11];
	char otherAccInfo[11];
	char foundInAList;
	char foundInBList;
	char foundInCList;
	char reportedBank[4];
	char nameInABCList[30];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char newOrUpdate;
	struct customerOpenUpdateInfo openUpdateInfo;
	char keyDateTime[14];
	char foundInTList;
	char noOfRecs[2];
	char cardType;  /* I-Electron International ; S-Smart Card */
	char marketingMemo[25];
	char addrType; /* 0-PO Box ; 1-Saudi Post */
	char custOpenSource; /* P-Phone;Othervalue-Branch */
	char bmUpdateStatus;
	char excludeFromAtmFees;
	char excludeFromMinBalFees;
	char accFreezingGracePeriod[3];
	char samaAuthNo[15];
	char samaAuthIssuedAt[20];
	char samaAuthDateType;
	char samaAuthIssueDateH[8];
	char samaAuthIssueDateG[8];
	char samaAuthExpiryDateH[8];
	char samaAuthExpiryDateG[8];
	char pkgStmtFreqOverride;
	char displayWarningMsgOnDuplicateId;  /* 1-YES ; 0-No */
	char mainBrCodeUpdAllowed;
	char filler[97];
	struct searchEngineDetails details[50]; 
	char filler2[50];	/* For Future Enhancement */
	char nullPad;
};

struct resMsgIndividualOthersPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 11 is for Pending Detail Request for individuals Others*/
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];	
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char iqamaNo[15];		
	char iqamaIssuedAt[20];	
	char iqamaDateType;	
	char iqamaIssueDateH[8];	
	char iqamaIssueDateG[8];
	char iqamaExpiryDateH[8];	
	char iqamaExpiryDateG[8];
	char passportNo[15];
	char ppIssuedAt[20];
	char ppDateType;
	char ppIssueDateH[8];
	char ppIssueDateG[8];
	char ppExpiryDateH[8];
	char ppExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];		
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char sexCode;			
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[3];/* changed from 4 to 3 */
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeCountryId[15];
	char homeCountryIdDateType;
	char homeCountryIdIssueDateH[8];
	char homeCountryIdIssueDateG[8];
	char homeCountryIdExpiryDateH[8];
	char homeCountryIdExpiryDateG[8];
	char homeAddress1[30];
	char homeAddress2[30];		
	char homePoBox[10];		
	char homeCityName[20];
	char homeZipCode[10];
	char homeCountry[3];
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];	
	char homeTelHomeNo[10];		
	char homeTelHomeExt[4];	
	char homeFaxAreaCode[4];		
	char homeFaxNo[10];			
	char homeFaxExt[4];		
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEmail[30];	

	char educationCode[2];
	char professionCode[2];	
	char positionCode[2];
	char monthlyIncome[2];	
	char ownerShip[10];	
	char segmentation;
	char employerName[30];	
	char department[20];
	char employerPoBox[10];	
	char employerCity[20];
	char employerZipCode[10];
	char documents[60];
	char documentOther[50];	
	char singleJointAcc;	/*0-single;1-joint;2-Undefined*/
	char packageAcc;
	char noOfJointCustomer[2];
	char jointAccNameOnCheck[60]; 
	char jointAccNameOnReports[30];
	char signatureNature;		/*0-single;1-joint*/
	char electronIntlRequired;	
	char electronIntlName[26];	
	char electronIntlSuppRequired;	
	char electronIntlSuppName[26];
	char deliveryToBranchOrPO;	
	char deliveryAddress1[30];
	char deliveryAddress2[30];
	char deliveryPoBox[10];	
	char deliveryCity[20];
	char deliveryZip[10];
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char restrictedBranchFlag;
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char interGroupAccNo[14];
	char specialRefNo[15];
	char samaAuthNo[15];
	char samaAuthDateType;
	char samaAuthDateH[8];
	char samaAuthDateG[8];
	char supervisorComments[200];	

	char currentAccInfo[11];	/*Ledger(3)+currency(2)+accstatus(2)+stmt.freq(2															)+chequeBook(1) +droppedAcc(1) */
	char savingsAccInfo[11];
	char otherAccInfo[11];
	char foundInAList;
	char foundInBList;
	char foundInCList;
	char reportedBank[4];
	char nameInABCList[30];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char newOrUpdate;
	char overrideForNoSamaAuth;
	struct customerOpenUpdateInfo openUpdateInfo;
	char keyDateTime[14];
	char foundInTList;
	char noOfRecs[2];
	char cardType;  /* I-Electron International ; S-Smart Card */
	char marketingMemo[25];
	char addrType; /* 0-PO box ; 1-Saudi post */
	char custOpenSource; /* P-Phone;Othervalue-Branch */
	char bmUpdateStatus;
	char excludeFromAtmFees;
	char excludeFromMinBalFees;
	char accFreezingGracePeriod[3];
	char visaNo[15];
	char visaIssuedAt[20];
	char visaDateType;
	char visaIssueDateH[8];
	char visaIssueDateG[8];
	char visaExpiryDateH[8];
	char visaExpiryDateG[8];
	char approvalRefNo[15]; /* Added for SAR-2*/
	char appDateType; /* Added for SAR-2*/
	char appIssueDateH[8]; /* Added for SAR-2*/
	char appIssueDateG[8]; /* Added for SAR-2*/
	char appExpiryDateH[8]; /* Added for SAR-2*/
	char appExpiryDateG[8]; /* Added for SAR-2*/
	char appRefName[30]; /* Added for SAR-2*/
	char pkgStmtFreqOverride;
	char displayWarningMsgOnDuplicateId;  /* 1-YES ; 0-No */
	char iqamaType; /* 0-Book ; 1-Plastic */ 
	char mainBrCodeUpdAllowed;
	char filler[96];
	struct searchEngineDetails details[50]; 
	char filler2[50];	/* For Future Enhancement */
	char nullPad;
};

struct resMsgQuickCustPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 11 is for Pending Detail Request */
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];	
	char supervisorId[10];	
	char custBranchCode[4];
	char samaMainCategory[2];
	char samaSubCategory[2];
	char idNo[15];	
	char idType;
	char idIssuedAt[20];
	char idDateType;
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char titleCode[2];	
	char sexCode;
	char businessType[3];
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];
	char eFirstName[15];
	char e2ndName[15];
	char e3rdName[15];
	char eLastName[15];	
	char eShortName[30];
	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char currentAccInfo[11];	/*Ledger(3)+currency(2)+accstatus(2)+stmt.freq(2															)+chequeBook(1) +droppedAcc(1) */
	char cardType;  /* I-Electron International ; S-Smart Card */
	char electronIntlRequired;	
	char electronIntlName[26];	
	char supervisorComments[200];
	char foundInAList;
	char foundInBList;
	char foundInCList;
	char reportedBank[4];
	char nameInABCList[30];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char newOrUpdate;
	char altBranchCode[4];
	char restrictedBranchFlag;
	struct customerOpenUpdateInfo openUpdateInfo;
	char keyDateTime[14];
	char foundInTList;
	char noOfRecs[2];
	char dobDateType;		
	char dobDateH[8];		
	char dobDateG[8];		
	char addrType;  /* 0-PO box ; 1-Saudi post */
	char internalCustomer;/* 0-No; 1-Yes */
	char displayWarningMsgOnDuplicateId;  /* 1-YES ; 0-No */
	char mainBrCodeUpdAllowed;
	char filler[29];
	struct searchEngineDetails details[50]; 
	char filler2[50];
	char nullPad;
};

struct resMsgPendingDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 11 is for Pending Detail Request */
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];	
	char supervisorId[20];	
	char custBranchCode[4];
	char idNo[15];	
	char idType;
	char idIssuedAt[20];
	char idDateType;
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];
	char filler1[17];
	char titleCode[2];	
	char dobDateType;
	char dobDateH[8];
	char dobDateG[8];
	char sexCode;
	char vipCode;
	char maritalStatus;	
	char noOfDependents[2];	
	char residentStatus;
	char businessType[4];
	char crNo[15];	
	char crIssuedAt[20];
	char crIssueDateType;
	char crIssueDateH[8];	
	char crIssueDateG[8];
	char aOrgName1[30];	
	char aOrgName2[30];
	char aOrgShortName[30];	
	char eOrgName1[30];	
	char eOrgName2[30];
	char eOrgShortName[30];	
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];
	char eFirstName[15];
	char e2ndName[15];
	char e3rdName[15];
	char eLastName[15];	
	char eShortName[30];
	char address1[30];
	char address2[30];
	char poBox[10];	
	char cityName[20];
	char zipCode[10];
	char country[3];
	char filler[17];
	char telOffAreaCode[4];	
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];
	char telHomeNo[10];	
	char telHomeExt[4];
	char faxAreaCode[4];
	char faxNo[10];	
	char faxExt[4];
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	
	char educationCode[2];	
	char professionCode[2];
	char positionCode[2];
	char monthlyIncome[2];	
	char segmentation;
	char ownerShip[10];	
	char employerName[30];	
	char department[20];
	char employerPoBox[10];	
	char employerCity[20];
	char employerZipCode[10];
	char documents[15];	
	char documentOther[50];	
	char singleJointAcc;
	char packageAcc;
	char noOfJointCustomer[2];
	char jointAccNameOnCheck[60]; 
	char jointAccNameOnReports[30];
	char signatureNature;		
	char electronCardRequired;
	char electronCardName[26];	
	char electronSuppRequired;
	char electronSuppName[26];	
	char electronIntlRequired;
	char electronIntlName[26];	
	char electronIntlSuppRequired;	
	char electronIntlSuppName[26];
	char deliveryToBranchOrPO;	
	char deliveryAddress1[30];
	char deliveryAddress2[30];	
	char deliveryPoBox[10];	
	char deliveryCity[20];
	char deliveryZip[10];
	char supervisorComments[200];
	char custType;
	char currentAccInfo[11];	/*Ledger(3)+currency(2)+accstatus(2)+stmt.freq(2															)+chequeBook(1) +droppedAcc(1) */
	char savingsAccInfo[11];
	char otherAccInfo[11];
	char foundInAList;
	char foundInBList;
	char foundInCList;
	char reportedBank[4];
	char nameInABCList[30];
	char existingCustomer;
	char existCustNo[7];
	char existCustName[30];
	char newOrUpdate;
	char internetBankAcc;
	char custAdviceFlag;
	char altBranchCode[4];
	char orgAlphaSearchCode[6];
	char restrictedBranchFlag;
	char updatedForSama;
	char relationshipManager[25];
	char generalMemo[25];
	char keyDateTime[14];
	char filler2[50];	/* For Future Enhancement */
	char nullPad;
};

struct resMsgJointDetail
{
	char msgLen[6];
	char status[3];
	char service[2];
	char aRemarks[50];
	char eRemarks[50];
	char custNo[7];
	char jointCustNo[2];	
	char filler1[7];
	char newOrUpdate;		
	char supervisorId[20];	
	char idNo[15];		
	char idType;	
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char preferredLang;	
	char nationality[3];	
	char filler2[17];	
	char titleCode[2];
	char dobDateType;
	char dobDateH[8];
	char dobDateG[8];
	char sexCode;
	char vipCode;
	char marritalStatus;	
	char noOfDependents[2];
	char residentStatus;
	char businessType[4];
	char aFirstName[15];
	char a2ndName[15];	
	char a3rdName[15];
	char aLastName[15];		
	char aShortName[30];
	char eFirstName[15];	
	char e2ndName[15];
	char e3rdName[15];
	char eLastName[15];	
	char eShortName[30];
	char address1[30];	
	char address2[30];
	char poBox[10];	
	char cityName[20];	
	char zipCode[10];
	char country[3];
	char filler[17];
	char telOffAreaCode[4];	
	char telOffNo[10];
	char telOffExt[4];
	char telHomeAreaCode[4];
	char telHomeNo[10];	
	char telHomeExt[4];
	char faxAreaCode[4];
	char faxNo[10];	
	char faxExt[4];
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	
	char educationCode[2];
	char professionCode[2];	
	char positionCode[2];
	char monthlyIncome[2];
	char ownerShip[10];	
	char segmentation;
	char employerName[30];
	char department[20];
	char employerPoBox[10];
	char employerCity[20];
	char employerZipCode[10];
	char activeStatus;
	char addressType; /* 0-PO box ; 1-Saudi Post */
	char custOpenSource; /* P-Phone;Othervalue-Branch */
	char filler3[10];
	char nullPad;
};

struct cardTrkInfo
{
	char cardNo[19];  		/* 0 - 19 */
	char nameOnTheCard[26]; /* 19 - 26 */
	char custBranchCode[4]; /* 45 - 4 */
	char cardExpiryDate[6]; /* 49 - 6 */
	char trk1[75];			/* 55 - 75 */
	char trk2[37];			/* 130 - 37 */
	char branchPinSelect;   /* 167 - 1 */
};

struct resMsgSuperDecision
{
	char msgLen[6];
	char status[3];
	char service[2];  /* 19 is for Supervisor Decision */
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char custNo[7];
	char nameChanged;
	char addressChanged;
	char tpinSelected;
	char filler[9];
	struct cardTrkInfo primaryCard;
	struct cardTrkInfo suppCard;
	char ibanAccNo[24];
	char nullPad;
};

struct resMsgCardApproval
{
	char msgLen[6];
	char status[3];
	char service[2]; 	/* 32 is for card approval Request		  */
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char custNo[7];
	char cardNo[19];
	char nameOnTheCard[26];
	char cardExpiryDate[6];
	char custBranchCode[4];
	char pinOffset[4];
	char trk1[75];
	char trk2[37];
	char branchPinSelect;
	char branchCardPrdn;
	char filler[10];
	char nullPad;
};

struct resMsgPrintCard
{
	char msgLen[6];
	char status[3];
	char service[2];	/* 59 is for cardPrint/Pinselect approval */
	char aRemarks[50];
	char eRemarks[50];
	char filler[10];
	char nullPad;
};

struct resMsgAccApproval
{
	char msgLen[6];
	char status[3];
	char service[2];   
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char accNo[19];
	char ibanAccNo[24];
	char filler[10];
	char nullPad;
};

struct resMsgForceCardGeneration
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 29 is for Force Card/Pin Generation */
	char aRemarks[50];
	char eRemarks[50];
	char filler[10];
	char nullPad;
};

struct resMsgRefresh {
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 12 is for Refresh          */
	char	aRemarks[50];
	char	eRemarks[50];
	char	refreshType;		/* 0 - NORMAL; 1 - FULL */
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	char	ctlRecInfo[2000]; /* to hold upto 10 records of 200 chrs each */
	char	nullPad;
};

struct accSearchDetails
{
	char	accNo[14];
	char	bookBal[14];
	char	clearedBal[14];
	char	blockedBal[14];
	char	accStatus[2];
	char	creditLimit[12];
	char	transCount[5];
};

struct resMsgAccSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 21 for Account Search  */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	custBranchCode[4];
	char	custNo[7];
	char	aShortName[30];
	char	eShortName[30];
	char	staffFlag;	/* 0 - Not a staff ; 1 - Staff */
	char	restrictedFlag;
	char	foundInAList;
	char	samaMainCategory[2];
	char	samaSubCategory[2];
	char	customerLang;
	char	filler[9];
	struct  accSearchDetails details[20]; 
	char	inactiveFlag[20];	/* inactiveFlag corresponds to each accSearchDetails */
	char	branchCode[20][4];  /* branchCode   corresponds to each accSearchDetails */
	char	balEnqRestricted[20];  /* balEnqRestricted flag corresponds to each accSearchDetails */
	char	nullPad;
};

struct cardSearchDetails
{
	char	cardNo[19];
	char	nameOnTheCard[26];
	char	issueDate[8];
	char	expiryDate[8];
	char	cardStatus;
	char	requestStatus;
	char	pinRequestStatus;
	char	coreAccNo[16];
	char	filler[50];
};

struct resMsgCardSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 24 for Card Search  */
	char	aRemarks[50];
	union 
	{
		char	eRemarks[50];
		struct
		{
			char	idNo[10];
			char	homeTelNo[20];
			char	offTelNo[20];
		}applnPrint;
	}remarksInfo;
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	custNo[8];
	char	aShortName[30];
	char	eShortName[30];
	char	address1[30];
	char	poBox[10];
	char	cityName[20];
	char	zipCode[10];
	char	custBranchCode[4];
	char	custType; /* earlier, custType was positioned before nullPad */
	char	addressType; /* 0-POBox ; 1-GPS */
	char	customerLang;
	char	filler[50];
	struct  cardSearchDetails details[20]; 
	char	nullPad;
};

struct pensionSearchDetails
{
	char	penCardNo[9];
	char	penName[40];
	char	penIdNo[15];
	char	penHafNo[13];   /* 10 + 3 */
	char	penSalAmt[9];
	char	netAmt[9];
	char	paymentType[5];
};

struct resMsgPensionSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 40  is for Pension Info Search */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct	pensionSearchDetails details[20];
	char	nullPad;
};

struct resMsgPensionDetail
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 41  is for Pension Detail Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	penCardNo[9];
	char	penName[40];
	char	penHafNo[10];
	char	penHafPlC[3];
	char	penHafPl[15];
	char	penBtNo[15];
	char	reprName[30];
	char	reprIdNo[10];
	char	reprIdPl[15];
	char	penAccNo[14];
	char	penAmt[9];
	char	penDedn[9];
	char	penNett[9];	
	char	branchCode[3];
	char	issuerNo[9];
	char	issueDate[8];
	char	cashStat[16];	
	char	inHrNo[2];	
	char	cardType[7];
	char	cardStat[7];
	char	paymentType[5];	
	char	notes1[50];
	char	notes2[50];
	char	notes3[50];
	char	notes4[50];
	char	notes5[50];
	char	notes6[50];
	char	notes7[50];
	char	notes8[50];
	char	notes9[50];
	char	notes10[50];
	char	notes11[50];
	char	notes12[50];
	char	notes13[50];
	char	notes14[50];
	char	notes15[50];
	char	subCard[2];
	char	filler[10];
	char	nullPad;
};

struct resMsgPenCashDetail
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 61  is for Pension cash payment Detail Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	penCardNo[10];
	char	netAmt[14];
	char	paymentStatus;
	char	totAmt[30];
	char	penProxyName[30];
	char	pensionerName[35];
	char	message1[35];
	char	message2[35];
	char	message3[35];
	char	message4[35];
	char	filler[10];
	char	nullPad;
};

struct resMsgPenInhDetail
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 66  is for Pension inheritance detail Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	penCardNo[9];
	char	branchCode[3];	
	char	noOfInh[2];	
	char	penSalary[9];
	char	name1[60];	
	char	name2[60];
	char	name3[60];
	char	name4[60];
	char	name5[60];
	char	name6[60];
	char	name7[60];
	char	name8[60];
	char	name9[60];
	char	name10[60];
	char	name11[60];
	char	name12[60];
	char	name13[60];
	char	name14[60];
	char	name15[60];
	char	name16[60];
	char	name17[60];
	char	name18[60];
	char	name19[60];
	char	name20[60];
	char	name21[60];
	char	name22[60];
	char	name23[60];
	char	name24[60];
	char	name25[60];
	char	filler[10];
	char	nullPad;
};

struct stopChqSearchDetails
{
	char	chequeNo[10];
	char	amount[14];
	char	stopDate[8];
	char	details[25];
};

struct resMsgStopChqSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 45  is for Stop Cheque Search */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct	stopChqSearchDetails details[20];
	char	fromChequeNo[20][8];
	char	nullPad;
};

struct resMsgStopChqApproval
{
	char msgLen[6];
	char status[3];
	char service[2];   
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char chequeNo[10];
	char filler[10];
	char nullPad;
};

struct stopChqPendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	accNo[14];
	char	chequeNo[10];
	char	reason[25];
	char 	pendingType[15];
};

struct resMsgStopChqPendingList
{
	char 	msgLen[6];
	char	status[3];
	char	service[2];	/* 53 is for stop cheque pending list */
	char 	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct	stopChqPendingDetails details[20];
	char	nullPad;
};

struct resMsgStopChqDetail
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 46 is for Stop Cheque Detail */
	char	aRemarks[50];
	char	eRemarks[50];
	char	accNo[14];		
	char	filler1[7];	
	char	chequeNo[10];
	char	amount[14];
	char	dateStop[8];
	char	payeeName[25];
	char	chequeFrom[8];
	char	newOrUpdate;
	char	supervisorComments[200];
	char	stopChqUserId[10];
	char 	filler[10];
	char	nullPad;
};

struct stdOrdSearchDetails
{
	char	sodNo[6];
	char	paymentType;
	char	paymentAmt[14];
	char	payAccNo[14];
	char	orderType;
	char	paymentFrequency;
	char	branchCode[4];
};

struct resMsgStdOrdSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 42  is for Standing Order Search */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct	stdOrdSearchDetails details[20];
	char	nullPad;
};

struct stdOrdPendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	accNo[14];
	char	sodNo[6];
	char	paymentType;
};

struct resMsgStdOrdPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* 51 is for standing order pending list */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  stdOrdPendingDetails details[20]; 
	char	nullPad;
};

struct resMsgStdOrdApproval
{
	char msgLen[6];
	char status[3];
	char service[2]; 	/* 52 is for Standing Order approval Request		  */
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char sodNo[6];
	char filler[10];
	char nullPad;
};

struct resMsgStdOrdDetails
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 43  is for Standing Order Detail */
	char	aRemarks[50];
	char	eRemarks[50];
	char	accNo[14];
	char	sodNo[6];
	char	orderType;
	char	paymentType;
	char	paymentMode;
	char	paymentFrequency;
	char	firstPaymentDate[8];
	char	nextPaymentDate[8];
	char	finalPaymentDate[8];
	char	lastProcessedDate[8];
	char	paymentsToBeMade[3];
	char	paymentsMade[3];
	char	limitInExcessFlag;
	char	commissionFlag;
	char	processNextDayFlag;
	char	thresholdAmt[10];
	char	paymentAmt[14];
	char	totalPaidToDate[14];
	char	totalToPay[14];
	char	payAccNo[14];
	char	drNarrative1[20];
	char	drNarrative2[20];
	char	crNarrative1[20];
	char	crNarrative2[20];
	char	transactionDateFlag;
	char	branchCode[4];
	char	newOrUpdate;
	char	supervisorComments[200];
	char	payeeCustName[30];
	char	lastUpdateUserId[10];
	char	lastUpdateDate[8];
	char	custName[30];
	char	custBranchCode[4];
	char	remarks[25];
	char	filler[10];
	char 	nullPad;
};

struct chequeBookSearchDetails
{
	char	deliveryBranchCode[4]; /* changed from customer branch code to delivery branch code */
	char	chequeType;
	char	booksRequested[2];
	char	requestDate[8];
	char	requestStatus;
	char	chequeNoFrom[8];
	char	chequeNoTo[8];
};

struct resMsgChequeBookSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 55  is for Stop Cheque Search */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	accNo[14];
	char	alternativeBranchCode[4];
	char	filler[6];
	struct	chequeBookSearchDetails details[20];
	char	requestUserId[20][10];
	char	nullPad;
};

struct resMsgChequeBookDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; 		/* 56 is for chequebook detail/cheque book history */
	char aRemarks[50];
	char eRemarks[50];
	char accNo[14];
	char requestDateTime[14];
	char chequeType;
	char booksRequested[2];
	char requestStatus;
	char custBranchCode[4];
	char chequeNoFrom[8];
	char chequeNoTo[8];
	char deliveryBranchCode[4];
	char nullPad;
};

struct chequeBookHistoryDetails
{
	char requestUserId[10];
	char requestDate[8];
	char producedDate[8];
	char producedUserId[10];
	char recdByBranchDate[8];
	char recdByBranchUserId[10];
	char issuedToCustDate[8]; 
	char issuedToCustUserId[10];
	char rejectedDate[8];
	char rejectedUserId[10];
	char rejectedReason[20];
	char requestTime[6];
	char producedTime[6];
	char recdByBranchTime[6];
	char issuedToCustTime[6];
	char rejectedTime[6];
};

struct resMsgChequeBookHistory
{
	char msgLen[6];
	char status[3];
	char service[2]; 	/* 56 is for chequebook detail/cheque book history */
	char aRemarks[50];
	char eRemarks[50];
	char noOfRecs[2];
	char filler[10];
	struct chequeBookHistoryDetails details[20];
	char nullPad;
};

struct chequeBookDetail
{
	char accNo[14];
	char chequeType;
	char booksRequested[2];
	char requestUserId[10];
	char requestStatus;
	char custBranchCode[4];
	char chequeNoFrom[8];
	char chequeNoTo[8];
};

struct resMsgChequeBookReport
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 58 is for cheque book daily activity report */
	char aRemarks[50];
	char eRemarks[50];
	char lastRecCount[5];
	char noOfRecs[2];
	char reportDate[8];
	char filler[10];
	struct chequeBookDetail	details[50];
	char nullPad;
};

struct acctStatusHistoryDetails
{
	char changeDateTime[14];
	char userId[10];
	char supervisorId[10];
	char fromStatus[2];
	char toStatus[2];
	char lastUpdateDateTime[14];
	char accStatusChangeReason[30];
};

struct resMsgAcctStatusHistory
{
	char msgLen[6];
	char status[3];
	char service[2];
	char aRemarks[50];
	char eRemarks[50];
	char noOfRecs[2];
	char filler[10];
	struct acctStatusHistoryDetails details[50];
	char nullPad;
};

struct statusDetails
{
	char 	cardNo[19];
	char	nameOnTheCard[26];
	char	cardGeneratedDate[8];
	char	issueDate[8];
	char	expireDate[8];
};

struct resMsgStatusList
{
	char	msgLen[6];
	char	status[3];
	char 	service[2];  /* 26 is for Card/Pin-mailer Status List Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct	statusDetails details[20];
	char	nullPad;
};

struct chqBkStatusDetails
{
	char	accNo[14];
	char	chequeType;
	char	requestedDate[8];
	char	prodDate[8];
	char	booksRequested[2];
};

struct resMsgChqBkStatusList
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 38 is for Cheque Book Status List */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[10];
	struct	chqBkStatusDetails details[20];
	char	requestUserId[20][10];
	char	custName[20][30];
	char	nullPad;
};

struct searchDetails 
{
	char	custNo[7];
	char	idType;
	char	idNo[15];
	char	telNo[10];
	char	telExt[4];
	char	lastName[15];
	char	secondName[15];
	char	firstName[15];
	char	shortName[30];
	char	branchCode[4];
	char	mainCategoryCode[2];
	char	subCategoryCode[2];
};

struct resMsgSearch 
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 16 is for Search    */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	incompleteFlag;	/* 0-Completed; 1-Search could not be completed */
	char	filler[10];
	struct  searchDetails details[20]; 
	char	nullPad;
};

struct custHistoryDetails
{
	  char branchCode[4];
	  char userId[20];
	  char dateTime[14];
	  char pendingStatus;
	  char supervisorId[20];
	  char lastUpdateDateTime[14];
	  char mainCategoryCode[2];
	  char subCategoryCode[2];
};


struct resMsgCustHistory
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 67 is for Customer Update History  */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	custNo[7];
	char    shortName[30];
	char	custBranchCode[4];
	char	filler[10];
	struct  custHistoryDetails details[20]; 
	char	nullPad;
};

struct resMsgTpinRequest
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 68 is for New TPIN request from CSO */
	char	aRemarks[50];
	char	eRemarks[50];
	char	custNo[7];
	char	tpinExistFlag;	/* 0 - Not Exist ; 1 - Exist */
	char	tpinStatus;		/* 1 - Active ; 0 - Inactive */
	char	filler[10];
	char	nullPad;
};

struct tpinPendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	custBranchCode[4];
	char	custShortName[30];
};

struct resMsgTpinPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* 69 is for TPIN pending list */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  tpinPendingDetails details[20]; 
	char	nullPad;
};

struct resMsgCheckCategory
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 70 is for checking the category valid or not */
	char	aRemarks[50];
	char	eRemarks[50];
	char	samaMainCategory[2];
	char	samaSubCategory[2];
	char	categoryStatus; /* 0 - Invalid ; 1 - Valid */
	char	generalCustOpenAllowed;
	char	filler[50];
	char	nullPad;
};

struct jointInfoDetails
{
	char	custNo[7];
	char	jointCustNo[2];
	char	custBranchCode[4];
	char	custShortName[30];
	char	idType;
	char	idNo[15];
};

struct resMsgJointInfoSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* 72 is for Joint info search */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  jointInfoDetails details[20]; 
	char	nullPad;
};

struct referenceDetails
{
	char	custNo[7];
	char	referenceNo[4];
	char	custBranchCode[4];
	char	custShortName[30];
	char	idType;
	char	idNo[15];
};

struct resMsgReferenceSearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* 73 is for reference info search */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  referenceDetails details[20]; 
	char	nullPad;
};

struct resMsgIdCheck
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* 74 for id number existance check */
	char	aRemarks[50];
	char	eRemarks[50];
	char	idType;
	char	idNo[15];
	char	idExistFlag;	/* 0-No ; 1-Yes */
	char	idIssuedAt[20];
	char	idDateType;
	char	idIssueDateH[8];
	char	idIssueDateG[8];
	char	idExpiryDateH[8];
	char	idExpiryDateG[8];
	char	nullPad;
};

struct signatoryDetails
{
	char	accNo[14];
	char	signatoryNo[4];
	char	custBranchCode[4];
	char	signatoryShortName[30];
	char	idType;
	char	idNo[15];
};

struct resMsgSignatorySearch
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* 76 is for signatory/owner/reference search */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[10];
	struct  signatoryDetails details[20]; 
	char	nullPad;
};

struct resMsgReferenceDetail
{
	char msgLen[6];
	char status[3];
	char service[2]; /* 77 is for reference detail request */
	char aRemarks[50];
	char eRemarks[50];

	char custNo[7];
	char referenceNo[4];
	char referenceReqdFor[10];		
	char referenceType;
	char newOrUpdate;
	char supervisorId[10];
	char custBranchCode[4];
	char idType;
	char idNo[15];
	char idIssuedAt[20];
	char idDateType;		/* 0-Hijri ; 1-Gregorian */
	char idIssueDateH[8];
	char idIssueDateG[8];
	char idExpiryDateH[8];
	char idExpiryDateG[8];
	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];

	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	
	char addrType;
	char custOpenSource; /* P-Phone;Othervalue-Branch */
	char proxyNo[15];
	char proxyDateType;
	char proxyIssueDateH[8];
	char proxyIssueDateG[8];
	char nullPad;
};

struct resMsgSignatoryDetail
{
	char msgLen[6];
	char status[3];
	char service[2];
	char aRemarks[50];
	char eRemarks[50];

	char accNo[14];
	char signatoryNo[4];
	char newOrUpdate;
	char supervisorId[10];	
	char custBranchCode[4];
	char idType;	
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];

	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];
	char diplomaticPpNo[15];
	char activeStatus;
	char disableReason[25];
	char signatoryForOthers;
	char nullPad;
};

struct resMsgOwnerDetail
{
	char msgLen[6];
	char status[3];
	char service[2];
	char aRemarks[50];
	char eRemarks[50];

	char custNo[7];
	char ownerNo[4];
	char ownerType;
	char newOrUpdate;
	char supervisorId[10];	
	char custBranchCode[4];
	char idType;	
	char idNo[15];		
	char idIssuedAt[20];	
	char idDateType;	
	char idIssueDateH[8];	
	char idIssueDateG[8];
	char idExpiryDateH[8];	
	char idExpiryDateG[8];
	char parentCompanyName[30];
	char shareHoldingPerc[3];

	char aFirstName[15];
	char a2ndName[15];
	char a3rdName[15];
	char aLastName[15];	
	char aShortName[30];		
	char eFirstName[15];	
	char e2ndName[15];	
	char e3rdName[15];
	char eLastName[15];		
	char eShortName[30];

	char address1[30];
	char address2[30];		
	char poBox[10];		
	char cityName[20];
	char zipCode[10];
	char country[3];
	char telOffAreaCode[4];
	char telOffNo[10];	
	char telOffExt[4];
	char telHomeAreaCode[4];	
	char telHomeNo[10];		
	char telHomeExt[4];	
	char faxAreaCode[4];		
	char faxNo[10];			
	char faxExt[4];		
	char mobileNo[10];
	char pagerNo[10];
	char eMail[30];	

	char homeAddress1[30];
	char homeAddress2[30];		
	char homePoBox[10];		
	char homeCityName[20];
	char homeZipCode[10];
	char homeCountry[3];
	char homeTelOffAreaCode[4];
	char homeTelOffNo[10];	
	char homeTelOffExt[4];
	char homeTelHomeAreaCode[4];	
	char homeTelHomeNo[10];		
	char homeTelHomeExt[4];	
	char homeFaxAreaCode[4];		
	char homeFaxNo[10];			
	char homeFaxExt[4];		
	char homeMobileNo[10];
	char homePagerNo[10];
	char homeEmail[30];	
	char ownerActiveStatus;
	char addrType; /* 0-PO Box; 1-Saudi Post */
	char nullPad;
};

struct billInfo
{
	char billRefNo[19];        /* 0 - 19  */
	char billStatusCode[10];   /* 19 - 10 */ /* Paid, PartialPd, OvrPd, Unpaid */ 
	char billAmountDue[19];	   /* 29 - 19 */
	char billExpiryDate[19];   /* 48 - 19 */
	char paymentDueDate[19];   /* 67 - 19 */
	char exactPaymentOnly;     /* 86 - 1  *//* T - True ; F - False */
	char billAmountPaid[19];   /* 87 - 19 */
	char billPaymentStatus[12];/* 106- 12 *//* if paid */
	char paymentDate[19];      /* 118- 19 *//* YYYY-MM-DDTHH:MM:SS */
	char bankTransactionId[36];/* 137- 36 *//* ANB Transaction Reference number (if paid )*/
	char sadadTransactionId[36];/*173- 36 *//* SADAD Transaction Reference number (if paid )*/
	char errorCode[4];		    /*209- 4  */
};

struct resMsgSadadEnq
{
	char   msgLen[6];
	char   status[3];
	char   service[2]; 	 /* 81 is for SADAD Enq */
	char   aRemarks[50];
	char   eRemarks[50];
	char   subscriptionNo[19];
	char   companyId[4];
	char   billQueryStatusCode[4];/* 0 - Success 
								     1 - Success with Errors 
								     11- Failure */
	struct billInfo	normalBill;
	struct billInfo	highTollBill; 
	char   nullPad;
};

struct billInfo1
{
	char	billStatusCode[15];		/* BillOverPd	- 	Over Paid
									   BillPaid		-	Fully Paid
									   BillPartialPd-	Partially Paid
									   BillUnPaid	-	No payments have been applied to
														this bill
									*/
	char	bankPaymentId[32];		/* ANB Transaction ID */
	char	sadadPaymentId[32];		/* SADAD Transaction Id */
	char	paymentStatusCode[15];	/* PmtNotCompleted, PmtCompleted */
	char	currentAmount[19];
	char	effectiveDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	exactPaymentReqd[5];	/* True, False */
	char	customerId[32];			/* Same as request */
	char	customerType[3];		/* Same as request */
	char 	messageText[20];		/* Informational message send by SADAD/biller */
	char	billCategory[4];		/* CIP	- Customer Initiated payments
									   HTOL - High Toll Bills 
									*/
	char	serviceType[4];
	char	billCycle[16];
	char	billNumber[19];
	char	billingAcct[19];		/* Subscriber Number */
	char	companyId[3];			/* 001 - STC
									   002 - SCECO
									   003 - NCCI
									   004 - Marafiq
									   005 - Mobily 
									*/
	char	amountDue[19];
	char	billDueDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billOpenDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billCloseDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billExpiryDate[19];		/* YYYY-MM-DDTHH:MI:SS */
	char	billCheckDigit[2];		/* For future use; filled with spaces */
	char	billRefInfo[20];		/* Bill additional information  */
		/* Total - 374 bytes */
};

struct resMsgSadadEnq1
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 	 /* 81 is for SADAD Enq with new layout */
	char	aRemarks[50];
	char	eRemarks[50];
	char	langInd[5];
	char	statusCode[6];
	char	errorCode[6];/* 0 - Success 
							3000 - Invalid XML. Schema validation failed
					        3005 - Failed to get Sender ID, receiver ID or message code from XML message 
							3008 - Failed to get message parameters from configuration file
							3011 - Failed to read MessageDetails.cnf file
							3014 - Failed to validate the message
							4100 - Failed to query bill
							4087 - Failed to sign or persist response message
							*/
	char	text[100];		/* Informational message send by SADAD */
	char	recCount[3];
	struct 	billInfo1 details[100];
	char   	nullPad;
};

struct transferInfo
{
	char	transRefNo[10];
	char	issueDate[8];
	char	valueDate[8];
	char	drAccNo[14];
	char	transCurr[3];
	char	transAmt[14];
	char	paymentCurr[3];
	char	paymentAmt[14];
	char	recordStatus;
};

struct resMsgTransferEnq
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* 82 is for SARIE/SWIFT transfer Enq */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	totNoOfTrans[5];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	accNo[14];
	char	completionFlag;		/* 1-Complete ; 0-Not complete */
	char	filler[10];
	struct  transferInfo details[20];
	char 	nullPad;
};

struct resMsgTransferDetail
{
	char	msgLen[6];
	char	status[3];
	char   	service[2]; 	 /* 83 is for SARIE/SWIFT transfer Details */
	char	aRemarks[50];
	char	eRemarks[50];
	char	transRefNo[10];
	char	accNo[14];
	char	custName[30];
	char	drAccNo[14];
	char	issueDate[8];
	char	valueDate[8];
	char	transCurrCode[3];
	char	transAmt[14];
	char	paymentCurrCode[3];
	char	paymentAmt[14];
	char	transType;
	char	paymentType;
	char	applicantName[30];
	char	benefName[30];
	char	benefAddr1[35];
	char	benefAddr2[35];
	char	benefBank[35];	
	char	coveringBank[35];
	char	branchCode[4];
	char	message1[35];
	char	message2[35];
	char	message3[35];
	char	message4[35];
	/* The following additional fields are added during SWIFT centralization project */
	char	transferPurpose[2];
	char	applicantAddr1[35];
	char	applicantAddr2[35];
	char	applicantIdNo[15];
	char	applicantAddr3[35];
	char	applicantCountryCode[3];
	char	ibanOrAccNo;
	char	benefAccNo[35];
	char	benefNationality[2];
	char	benefAddr3[35];
	char	benefBankAddr1[35];
	char	benefBankAddr2[35];
	char	benefBankBICcode[11];
	char	exchangeRate[12];
	char	bankSortCode[35];
	char	supervisorId[10];
	char	supervisorComments[200];
	/* Till here */
	char	filler[50];
	char	nullPad;
};

struct resMsgBmTransDetail
{
	char	msgLen[6];
	char	status[3];
	char   	service[2]; 	 /* 84 is for Bankmaster transaction Details */
	char	aRemarks[50];
	char	eRemarks[50];
	char	accNo[14];
	char	transRefNo[10];
	char	custName[30];
	char	postDate[8];
	char	valueDate[8];
	char	transAmt[14];
	char	transType[2];
	char	userId[3];
	char	supervisorId[3];
	char	stmtFlag;
	char	narrative1[25];
	char	narrative2[25];
	char	narrative3[25];
	char	filler[10];
	char	nullPad;
};

struct bmTransInfo
{
	char	transRefNo[10];
	char	transDate[8];
	char	valueDate[8];
	char	userId[3];
	char	transAmt[14];
	char	transCtr[5];
	char	transType[2];
};

struct resMsgBmTransEnq
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* 85 is for BM transaction enquiry */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	totNoOfTrans[5];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	accNo[14];
	char	completionFlag;		/* 1-Complete ; 0-Not complete */
	char	filler[10];
	struct  bmTransInfo details[20];
	char 	nullPad;
};

struct blockInfo
{
	char	productType; /* B-Bankmaster Loan ; F-Finnone Loan; C-Credit Card ; M-Manual Blocking ; O-Other Blocking */
	char	productNo[20];
	char	blockedAmt[14];
	char	userIdBlocked[10];
	char	filler[10];			/* for future use */
};

struct resMsgBlockBreakup
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* 86 is for breakup for the GL blocking amount */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	noOfRecs[2];
	char	accNo[14];
	char	blockedBal[14];
	char	filler[50];
	struct	blockInfo	details[30];
	char 	nullPad;
};

struct acctHistoryDetails
{
	  char branchCode[4];
	  char userId[20];
	  char dateTime[14];
	  char pendingStatus;
	  char supervisorId[20];
	  char lastUpdateDateTime[14];
	  char filler[10];
};


struct resMsgAcctHistory
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* 87 is for Account Update History  */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	accNo[14];
	char	filler[50];
	struct  acctHistoryDetails details[20]; 
	char	nullPad;
};

struct blockDetails
{
	char	userId[10];
	char	dateTime[14];
	char	cardNo[16];
	char	bmAccNo[14];
	char	action;
	char	oldAmt[14];
	char	blockAmt[14];
	char	supervisorComments[200];
	char	filler[10];
};

struct resMsgBlockPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 89 is for Manual blocking PendingList Request */
	char	aRemarks[50];
	char	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	filler[50];
	struct  blockDetails details[20]; 
	char	nullPad;
};

struct resMsgSearchEngine
{
	char	msgLen[6];
	char	status[3];
	char	service[2];  /* 80 is for Search Engine */ 
	char	aRemarks[50];
	char	eRemarks[50];
	char	foundInTList;
	char	noOfRecs[2];
	char	filler[50];
	struct  searchEngineDetails details[50]; 
	char	nullPad;
};

struct profileEnq
{
	char	isInProfile[5];		/* True, False */
	char	billingAcct[19];	/* Subscriber Number */
	char	billerId[3];		/* company id */
};

struct resMsgSadadProfileEnq
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 95 is for SADAD customer profile maintenance */
	char	aRemarks[50];
	char	eRemarks[50];
	char	langInd[5];
	char	queryStatusCode[6];
	char	customerId[32];
	char	customerType[3];
	char	recCount[3];
	struct  profileEnq	details[100]; /* Max. 100 to be confirmed with Althaf */
	char	nullPad;
};

struct profileUpd
{
	char	updStatusCode[6];
	char	isInProfile[5];		/* True, False */
	char	billingAcct[19];	/* Subscriber Number */
	char	billerId[3];		/* company id */
};

struct resMsgSadadProfileUpd
{
	char	msgLen[6];
	char	status[3];
	char	service[2];   /* 95 is for SADAD customer profile maintenance */
	char	aRemarks[50];
	char	eRemarks[50];
	char	langInd[5];
	char	msgStautsCode[6];
	char	customerId[32];
	char	customerType[3];
	char	recCount[3];
	struct  profileUpd	details[100]; /* Max. 100 to be confirmed with Althaf */
	char	nullPad;
};

struct resMsgSadadMaintenance 
{
	char	msgLen[6];
	char	status[3];
	char	remarks[50];
	char	service[2];				/* AA for Sadad Codes Maintenance     */
	char	keyValue[12];
	char	action;					/*E-equal;N-next;P-Prev;F-First;L-Last;
										A-add;U-update,D-delete*/
	char	arabicName[50];
	char	englishName[50];
	char	otherDetails[100]; 
	char	filler[10];/* for future use */
	char	nullPad;
};

struct resMsgReturnedMail 
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; 		/* AB for register returned mail & to get details about the reference number */
	char	aRemarks[50];
	char	eRemarks[50];
	char	refNo[16];
	char	custNo[7];
	char	productId[20];
	char	custName[30];
	char	custSegmentFlag;
	char	address1[30];
	char	poBox[10];
	char	cityName[20];
	char	zipCode[10];
	char	offTelNo[20];
	char	homeTelNo[20];
	char	faxNo[20];
	char	mobileNo[10];
	char	eMail[30];
	char	dateGenerated[8];
	char	branchCode[4];
	char	returnedDate[8];
	char	registeredUser[10];	
	char	registeredBranch[4];
	char	returnedReason;				 /* 0-Unknown;1-Wrong PO;2-Empty Address;3-Others*/
	char	verficationActionDate[8];		
	char	verficationActionUser[10];		
	char	verficationActionBranch[4];	
	char	verificationActionTaken;		/* 	0-Pending 
												1-Address different from documents & fixed
												2-Address same; forward to call center */
	char	verificationUserRemarks[75];
	char	callCenterActionDate[8];		
	char	callCenterActionUser[10];		
	char	callCenterActionBranch[4];	
	char	callCenterActionTaken;			/* 	0-Pending
											    1-Address updated
												3-Customer not reachable
											    9-Action completed without address update */
	char	callCenterUserRemarks[75];
	char	deliveryDate[8];				
	char	deliveryUser[10];			
	char	deliveryBranch[4];		
	char	deliveryActionTaken;			/* 	0-pending
											    1-Address updated 
												3-Statement disabled for the customer
											    9-delivered to customer without address update */
	char	deliveredToCustomer;			/* 0-NO; 1-YES */
	char	deliveryUserRemarks[75];
	char	noOfPrevOccur[3];
	/*char	addressType; /*0-PO.Box ; 1-GPS */
	char	filler[50];
	char	nullPad;
};

struct returnMailPendingDetails
{
	char	letterRefNo[16];
	char	custNo[7];
	char	productId[20];
	char	address1[30];
	char	poBox[10];
	char	cityName[20];
	char	zipCode[10];
	char	filler[50];
};

struct resMsgReturnedMailPendingList 
{
	char	msgLen[6];			/* 0  - 6 */
	char	status[3];			/* 6  - 3 */
	char	service[2]; 		/* 9  - 2 */ /* AC for getting pending list of returned mail */
	char	aRemarks[50];		/* 11 - 50*/
	char	eRemarks[50];		/* 61 - 50*/
	char	lastRecCount[5];	/* 111- 5*/
	char	noOfRecs[2];		/* 116- 2*/
	char	filler[50];			/* 118- 50*/
	struct  returnMailPendingDetails details[20]; /* 168 -  */ 
	char	nullPad;
};

struct returnedMailDetail
{
	char refNo[16];
	char branchCode[4];
	char letterTypeDesc[30];
	char custNo[7];
	char custName[30];
	char productId[20];
	char filler[50];
};

struct resMsgReturnedMailReport
{
	char msgLen[6];
	char status[3];
	char service[2]; /* AE is for returned mail report */
	char aRemarks[50];
	char eRemarks[50];
	char lastRecCount[5];
	char noOfRecs[2];
	char reportDate[8];
	char branchCode[4];
	char filler[50];
	struct returnedMailDetail	details[50];
	char nullPad;
};

struct newCustomerDetail
{
	char custNo[7];
	char custBranchCode[4];
	char custName[30];
	char createdThruQuickScreen; /* 0-NO ; 1-YES */
	char filler[50];
};

struct resMsgNewCustomerReport
{
	char msgLen[6];
	char status[3];
	char service[2]; 		/* AF is for online report on new customer opened on current date */
	char aRemarks[50];
	char eRemarks[50];
	char lastRecCount[5];
	char noOfRecs[2];
	char reportDate[8];
	char filler[50];
	struct newCustomerDetail	details[50];
	char nullPad;
};

struct generalCustInfo
{
	char	branchCode[4];
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	custBranchCode[4];
	char	pendingStatus;
	char	branchUserId[10];
	char	branchActionDateTime[14];
	char	branchSupervisorId[10];
	char	approvedDateTime[14];
	char	custOpenDate[8];
	char	filler[20];
};

struct resMsgGeneralCustStatusEnq
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* 30 is for general Customer status enquiry */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	completionFlag;		/* 1-Complete ; 0-Not complete */
	char	filler[20];
	struct  generalCustInfo details[20];
	char 	nullPad;
};

struct resMsgTimeDepositIntRateEnq
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* AG is for fetching the time deposit interest rate */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	tdLedger[3];
	char	tdCurrency[2];
	char	tenorType;
	char	tenor[3];
	char	depositAmt[15];
	char	debitAccNo[14];
	char	intRate[9];
	char	exRate[14];
	char	maturityDate[8];
	char	crBaseDays[3];
	char	diffDays[3];
	char	fxTolerance[2];
	char	minIntRate[9];
	char	maxIntRate[9];
	char    buyingRate[14]; /* Arul added on 19 Feb 07 */
	char	sellingRate[14]; /* Arul added on 19 Feb 07 */
	char	costRate[14]; /* Arul added on 19 Feb 07 */
	char	valueDate[8];	/* Arul : added to support back-value dated TD */
	char	maxBackValueDate[8];	/* Arul : added to support back-value dated TD */
	char	payAccCustName[30];     /* Arul : added to support payee customer to be different than deposit customer */
	char	filler[50];
	char 	nullPad;
};

struct timeDepositPendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	custNo[7];
	char	accNo[14];
	char	custName[30];
	char	tdCurrency[2];
	char	tdLedger[3];
	char	newOrUpdate;
	char	filler[50];
};

struct resMsgTimeDepositPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* AI is for Time Deposit pending list */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[50];
	struct  timeDepositPendingDetails details[20]; 
	char 	filler1[50];
	char	nullPad;
};

struct resMsgTimeDepositDetails
{
	char	msgLen[6];
	char	status[3];
	char	service[2];		/* AJ  is for Time Deposit Detail */
	char	aRemarks[50];
	char	eRemarks[50];
	char	accNo[14];
	char	custNo[7];
	char	custName[30];
	char	newOrUpdate;
	char	supervisorId[10];
	char	tdCurrency[2];
	char	tdLedger[3];
	char	tenorType;
	char	tenor[3];
	char	depositAmt[14];
	char	debitAccNo[14];
	char	fundIntRate[9];
	char	exRate[14];
	char	maturityAmt[14];
	char	maturityDate[8];
	char	valueDate[8];	/* Added to support back-value dated TD */
	char	overrideExRate;			
	char	overrideIntRate;	
	char	overrideValueDate;	/* Added to support back-value dated TD */
	char	orgFundIntRate[9];
	char	orgExRate[14];	
	char	autoRenewFlag;
	char	crBaseDays[3];
	char	diffDays[3];
	char	intAppln;
	char	payAccNo[14];
	char	debitAmt[14];	/* Added along with back-value date TD amendments */
	char	supervisorComments[200];
	char	payAccCustName[30];	/* Added to display payee customer name */
	char	filler[50];
	char 	nullPad;
};

struct resMsgTimeDepositApproval
{
	char msgLen[6];
	char status[3];
	char service[2]; 	/* AK is for Time Deposit approval Request		  */
	char aRemarks[50];
	char eRemarks[50];
	char appRejectFlag;
	char tdAccNo[14];
	char intRate[9];
	char filler[20];
	char nullPad;
};

struct cardActivityDetail 
{
	char    coreAccNo[16];
	char    cardNo[19];
	char    requestType;
	char    requestStatus;
	char    issueDate[8];
	char    expireDate[8];
	char    requestBranch[4];
	char    requestUser[10];
	char    nameOnProduct[26];
	char    deliveryToBranchOrPO;
	char    pendingStatus;
	char	supervisorId[10];
	char	filler[50];
};

struct pinActivityDetail
{
	char    coreAccNo[16];
	char    cardNo[19];
	char    requestType;
	char    requestStatus;
	char    issueDate[8];
	char    expireDate[8];
	char    customerBranch[4];
	char    requestUser[10];
	char    nameOnProduct[26];
	char    deliveryToBranchOrPO;
	char    pendingStatus;
	char    supervisorId[10];
	char	filler[50];
};

struct tpinActivityDetail
{
	char	userId[10];
	char    dateTime[14];
	char    newOrUpdate;
	char    custNo[7];
	char    supervisorId[10];
	char    custBranchCode[4];
	char    pendingStatus;
	char	lastUpdateDateTime[14];
	char	custName[30];
	char	filler[50];
};

struct resMsgCardActivityReport
{
	char msgLen[6];
	char status[3];
	char service[2]; 		/* AL is for online report on ATM card activity/ATM Pin/TelephonePin for the current banking Date */
	char aRemarks[50];
	char eRemarks[50];
	char lastRecCount[5];
	char noOfRecs[2];
	char reportDate[8];
	char reportType; 		/* copied from request */
	char filler[50];
	union
	{
		struct cardActivityDetail	cardDetails[50];
		struct pinActivityDetail	pinDetails[50];
		struct tpinActivityDetail	tpinDetails[50];
	}reportDetail;
	char nullPad;
};

struct branchSwiftInfo
{
	char	branchCode[4];
	char	transRefNo[10];
	char	transDate[8];
	char	valueDate[8];
	char	drAccNo[14];
	char	crAccNo[14];
	char	transCurr[3];
	char	transAmt[14];
	char	senderName[30];
	char	recordStatus;
	char	filler[50];
};

struct resMsgBranchSwiftTransfers
{
	char msgLen[6];
	char status[3];
	char service[2]; /* AN is for branch SWIFT transfer enquiry */
	char aRemarks[50];
	char eRemarks[50];
	char lastRecCount[5];
	char noOfRecs[2];
	char filler[50]; 
	struct branchSwiftInfo details[20];
	char filler1[50];
	char nullPad;
};

struct swiftCentrePendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	transRefNo[10];
	char	issueDate[8];
	char	applicantName[35];
	char	benefName[30];
	char	branchCode[4];
	char	filler[50];
};

struct resMsgSwiftCentrePendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* AP is for Swfit Transfer pending list */ 
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[50];
	struct  swiftCentrePendingDetails details[20]; 
	char 	filler1[50];
	char	nullPad;
};

struct swiftTransferEnqInfo
{
	char	branchCode[4];
	char	transRefNo[10];
	char	transDate[8];
	char	valueDate[8];
	char	transCurr[3];
	char	transAmt[14];
	char	pendingStatus;
	char	drAccNo[14];
	char	applicantName[30];
	char	homeBranch[4];
	char	csoUserId[10];
	char	csoActionDateTime[14];
	char	supervisorId[10];
	char	approvedDateTime[14];
	char	filler[50];
};

struct resMsgSwiftTransferEnq
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* AS is for SWIFT transfer enquiry */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char	reqdDate[8]; /* copied from request message */
	char	requestType; /* copied from request message */
	char	filler[50];
	struct  swiftTransferEnqInfo details[20];
	char 	nullPad;
};

struct resMsgSadadPayment
{
	char   	msgLen[6];
	char   	status[3];
	char   	service[2]; 	 /* AT is for Sadad payment */
	char   	aRemarks[50];
	char   	eRemarks[50];
	char	transRefNo[10];
	char	contraAccNo[14];
	char	aNarrative1[25];
	char	eNarrative1[25];
	char	custName[30]; /* required for receipt printing & update branchpower DB */
	char	customerBranch[4];	/* Required to update the branchpower DB */
	char	contraCustName[30];	/* Required for receipt printing */
	char	transDate[8]; /* required for receipt printing */
	char	valueDate[8]; /* required for receipt printing */
	char	narrative3[25]; /* required for receipt printing */
	char	msgStatusCode[6];
	char	paymentStatusCode[6];
	char	filler[50];
	char 	nullPad;
};

struct resMsgSadadReversal
{
	char msgLen[6];
	char status[3];
	char service[2]; /* AU is for Sadad Bill reversal */
	char aRemarks[50];
	char eRemarks[50];
	char userId[10];
	char tellerId[3];
	char companyId[4];
	char subscriptionNo[19]; 
	char billNo[19];
	char langInd[5];
	char paymentType[4];
	char drAccNo[14];
	char billAmt[19];
	char transRefNo[10];
	char cashOrAcc; /* A-A/c ; C-Cash */
	char preOrPostpaid; /* 0-Post paid; 1-Prepaid */
	char custName[30];
	char nullPad;
};

struct sadadPendingDetails
{
	char	userId[10];
	char	dateTime[14];
	char	tellerId[3];
	char	transRefNo[10];
	char	billerId[4];
	char	subsNo[19];
	char	billAmt[19];
	char	filler[50];
};

struct resMsgSadadReversalPendingList
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* AX is for CSD trans reversal pending List */
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	filler[50];
	struct  sadadPendingDetails details[20]; 
	char 	filler1[50];
	char	nullPad;
};

struct  sadadTranInfo 
{
	char transDate[8];
	char branchCode[4];
	char tellerId[3];
	char companyId[4];
	char subsNo[19];
	char debitAccNo[14];
	char billAmt[19];
	char transRefNo[10];
	char valueDate[8];
	char paymentType[4];
	char preOrPostpaid;
	char transType[2];
	char postingStatus;
	char cashOrAcc;
	char supervisorId[10];
	char filler[50];
};

struct resMsgSadadTransEnq
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* AY is for SADAD transaction enquiry */
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	totalTrans[5];
	char	lastRecCount[5];
	char	noOfRecs[2];
	char 	companyId[4];
	char 	transDate[8];
	char 	enqTellerId[3];
	char 	subscriptionNo[19];
	char	completionFlag;		/* 1-Complete ; 0-Not complete */
	char	filler[50];
	struct  sadadTranInfo details[20];
	char 	nullPad;
};

struct resMsgAccOpeningCard	
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* AZ is for Account opening card print */
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	custNo[7];
	char	accNo[14];
	char	iban[24];
	char	customerLang;
	char	aShortName[30];
	char	eShortName[30];
	char	custOpenDate[8];
	char	custBranchCode[4];
	char	accOpenDate[8];
	char	firstName[15];
	char	secondName[15];
	char	thirdName[15];
	char	lastName[15];
	char	filler[50];
	char	nullPad;
};

struct resMsgFetchAccDetails
{
	char	msgLen[6];
	char	status[3];
	char	service[2]; /* BB is for getting IBAN for the given account number */
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	accNo[14];
	char	iban[24];
	char	filler[100];
	char	nullPad;
};

struct resMsgFetchEstmtStatus
{
	char	msgLen[6];
	char	status[3];
	char 	service[2]; /* BC is for getting eStatement status for a given customer */
	char	aRemarks[50]; 
	char	eRemarks[50]; 
	char	custNo[7];
	char	custName[30];
	char	branchCode[4];
	char	emailAddress[30];
	char	stmtDeliveryMode;
	char	supervisorComments[200];
	char	filler[100];
	char	nullPad;
};

union msgResponse 
{
	struct resMsgLogin 	        login;
	struct resMsgPassword		passwordChange;
	struct resMsgMaintenance	maintenance;
	struct resMsgSecurity   	security;
	struct resMsgUserList		userList;
	struct resMsgCustomer    	customer;
    struct resMsgPendingList    pendingList;
    struct resMsgPendingList1   pendingList1;
	struct resMsgPendingDetail  pendingDetail;
	struct resMsgSuperDecision  superDecision;
	struct resMsgJointDetail 	jointDetail;
	struct resMsgRefresh		refresh;
	struct resMsgSearch 		search;
	struct resMsgAccSearch		accSearch;
	struct resMsgCardSearch		cardSearch;
	struct resMsgAccPendingList	accPendingList;
	struct resMsgAccPendingDetail accPendingDetail;
	struct resMsgCardInfo		cardInfo;
	struct resMsgCardPendingList cardPendingList;
	struct resMsgCardPendingDetail cardPendingDetail;
	struct resMsgCardApproval	cardApproval;
	struct resMsgAccApproval	accApproval;
	struct resMsgForceCardGeneration forceCard;
	struct resMsgStatusList		statusList;
	struct resMsgCardHistory    cardHistory;
	struct resMsgChqBkStatusList chqBkStatusList;
	struct resMsgPensionSearch	pensionSearch;
	struct resMsgPensionDetail	pensionDetail;
	struct resMsgStdOrdSearch	stdOrdSearch;
	struct resMsgStdOrdDetails	stdOrdDetail;
	struct resMsgStopChqSearch	stopChqSearch;
	struct resMsgStopChqDetail	stopChqDetail;
	struct resMsgCheckCust		checkCust;
	struct resMsgStdOrdPendingList stdOrdPendingList;
	struct resMsgStdOrdApproval stdOrdApproval;
	struct resMsgStopChqPendingList	stopChqPendingList;
	struct resMsgStopChqApproval	stopChqApproval;
	struct resMsgChequeBookSearch	chequeBookSearch;
	struct resMsgChequeBookHistory	chequeBookHistory;
	struct resMsgChequeBookDetail	chequeBookDetail;
	struct resMsgAcctStatusHistory	acctStatusHistory;
	struct resMsgChequeBookReport	chequeBookReport;
	struct resMsgPrintCard			printCard;
	struct resMsgPenCashDetail		penCashDetail;
	struct resMsgPenInhDetail		penInhDetail;
	struct resMsgCustHistory		custHistory;
	struct resMsgTpinRequest		tpinRequest;
	struct resMsgTpinPendingList	tpinPendingList;
	struct resMsgCheckCategory		checkCategory;
	struct resMsgIndividualOthersPendingDetail individualOthersPendingDetail;
	struct resMsgSaudiIndividualPendingDetail  saudiIndividualPendingDetail;
	struct resMsgJointInfoSearch	jointInfoSearch;
	struct resMsgReferenceSearch	referenceSearch;
	struct resMsgReferenceDetail	referenceDetail;
	struct resMsgSignatorySearch	signatorySearch;
	struct resMsgSignatory 			signatory;
	struct resMsgIdCheck			idCheck;
	struct resMsgJuristicPendingDetail	juristicPendingDetail;
	struct resMsgSignatoryDetail	signatoryDetail;
	struct resMsgOwnerDetail		ownerDetail;
	struct resMsgQuickCustPendingDetail	quickCustPendingDetail;
	struct resMsgSadadEnq			sadadEnq;
	struct resMsgTransferEnq		transferEnq;
	struct resMsgTransferDetail		transferDetail;
	struct resMsgBmTransDetail		bmTransDetail;
	struct resMsgBmTransEnq			bmTransEnq;
	struct resMsgBlockBreakup		blockBreakup;
	struct resMsgAcctHistory		acctHistory;
	struct resMsgBlockPendingList	blockPendingList;
	struct resMsgSearchEngine		searchEngine;
	struct resMsgSadadEnq1			sadadEnq1;
	struct resMsgSadadProfileUpd	sadadProfileUpd;
	struct resMsgSadadProfileEnq	sadadProfileEnq;
	struct resMsgSadadMaintenance 	sadadMaintenance;
	struct resMsgCardUpdateHistory	cardUpdateHistory;
	struct resMsgReturnedMail 		returnedMail;
	struct resMsgReturnedMailPendingList 	returnedMailPendingList;
	struct resMsgReturnedMailReport	returnedMailReport;
	struct resMsgNewCustomerReport	newCustomerReport;
	struct resMsgGeneralCustStatusEnq generalCustStatusEnq;
	struct resMsgTimeDepositIntRateEnq	timeDepositIntRateEnq;
	struct resMsgTimeDepositPendingList	timeDepositPendingList;
	struct resMsgTimeDepositDetails		timeDepositDetail;
	struct resMsgTimeDepositApproval	timeDepositApproval;
	struct resMsgCardActivityReport		cardActivityReport;
	struct resMsgBranchSwiftTransfers	branchSwiftTransfers;
	struct resMsgSwiftCentrePendingList	swiftCentrePendingList;
	struct resMsgSwiftTransferEnq		swiftTransferEnq;
	struct resMsgSadadPayment			sadadPayment;
	struct resMsgSadadReversal			sadadReversal;
	struct resMsgSadadReversalPendingList	sadadReversalPendingList;
	struct resMsgSadadTransEnq			sadadTransEnq;
	struct resMsgAccOpeningCard			accOpeningCard;
	struct resMsgFetchAccDetails		fetchAccDetails;
	struct resMsgFetchEstmtStatus		fetchEstmtStatus;
} responseMsg;
