TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/whereami/
OUTPUT=$(addprefix ${INSTALLDIR},$(HTML))
COPYDIRS=js

include $(TOP_DIR)/Makefile.common

local-build: $(HTML) 

local-install: 
	echo "Installing local target"

local-clean: 
	-rm $(HTML)
