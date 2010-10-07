TOP_DIR=..
SUBDIRS=
COPYFILES=homepage.css #progress-vars.js
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/,$(PROCESS))) 

include $(TOP_DIR)/Makefile.common

local-build:

local-install: $(OUTPUT) copy-files 

local-clean:

