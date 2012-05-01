#SUBDIRS=isrm stuff
SUBDIRS=stuff
TOP_DIR=..
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/labs/,$(PROCESS)))
INSTALLDIR=$(OUTPUTDIR)/labs/

include $(TOP_DIR)/Makefile.common

local-build:

local-install: create-install-dir $(OUTPUT)

local-clean:

