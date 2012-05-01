TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/lsses/
OUTPUT=$(addprefix ${INSTALLDIR},$(HTML))

include $(TOP_DIR)/Makefile.common

local-build: $(HTML) 

local-install: $(FILESDIR) $(INSTALLDIR)
	cp -v *.txt $(FILESDIR)
	cp -v $(HTML) $(INSTALLDIR)

local-clean: 
	-rm $(HTML)
