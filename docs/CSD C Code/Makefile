DEST	      = .

INSTALL	      = /etc/install

CC	      	= cc -c  -I$(TUXDIR)/include

LD	      = cc

LIBS	      = -lisam725  /usr/local/lib/libanb.a  -lsec -L/tuxedo/lib -lwsc -lbuft -lwsc  -lgpnet  -lfml -lfml32 -lengine  -lpthread  -lnsl
# -lwsc -lbuft -lwsc  -lgpnet  -lfml -lfml32 -lengine  -lpthread  -lnsl
#LIBS	      = -lisam  /usr/local/lib/libanb.a  -lsec -L/tuxedo/lib 

MAKEFILE      = Makefile

PRINT	      = pr

PROGRAM       = cbcmssrv

SHELL	      = /bin/sh

SOURCE	      = cbmaintenance.c cbsecurity.c cblogin.c cbrouter.c  cbbranch.c cbsaudi.c cbothers.c cbquick.c cbbranch2.c cbsama.c cbtpin.c cbtuxint.c cbjuristic.c cbsadad.c cbswift.c cbblock.c cbsrch.c cbreturn.c cbtdopen.c cbreport.c 

OBJS	      = cbmaintenance.o cbsecurity.o cblogin.o cbrouter.o  cbbranch.o cbsaudi.o cbothers.o cbquick.o cbbranch2.o stbmupdate.o cbsama.o cbtpin.o cbtuxint.o  cbjuristic.o  cbsadad.o cbswift.o  cbblock.o  cbsrch.o  cbreturn.o cbtdopen.o  cbreport.o  ../cbslib/usr_util.o ../cbslib/greghijri.o

install:	$(PROGRAM)
		@echo Installing $(PROGRAM) in $(DEST)

$(PROGRAM):     $(OBJS) 
		@echo "Linking $(PROGRAM) ..."
		@$(LD) $(OBJS) $(LIBS) -o $(PROGRAM)
		@echo "Building Tuxedo Client ...."
		@bldcbcln
		@echo "done"

$(DEST)/$(PROGRAM): $(SOURCE) $(LIBS) $(HDRS) $(EXTHDRS)
		@$(MAKE) -f $(MAKEFILE) ROOT=$(ROOT) DEST=$(DEST) install 

.o : 		$(CC) $(SOURCE)

