TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/whereami/
COPYDIRS=js

include $(TOP_DIR)/Makefile.common

local-build: $(HTML) 

local-install: 
	cp -v $(HTML) $(INSTALLDIR)

local-clean: 
	-rm $(HTML)
