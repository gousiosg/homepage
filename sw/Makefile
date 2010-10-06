TOP_DIR=..
SUBDIRS=whereami jdt
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/sw/,$(PROCESS)))

include $(TOP_DIR)/Makefile.common

create-install-dir:
	mkdir -p $(OUTPUTDIR)/sw/

install: create-install-dir $(OUTPUT)

