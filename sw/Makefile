TOP_DIR=..
SUBDIRS=whereami jdt
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/sw/,$(PROCESS)))
INSTALLDIR=$(OUTPUTDIR)/sw/

include $(TOP_DIR)/Makefile.common

local-build:

local-install: $(OUTPUT)

local-clean:
