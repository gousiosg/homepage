TOP_DIR=..
SUBDIRS=scripts styles cv
COPYFILES=homepage.css #progress-vars.js
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/,$(PROCESS))) 
INSTALLDIR=$(OUTPUTDIR)

include $(TOP_DIR)/Makefile.common

local-build:

local-install: $(OUTPUT) 

local-clean:

