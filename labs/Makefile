SUBDIRS=isrm stuff
TOP_DIR=..
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/labs/,$(PROCESS)))

include $(TOP_DIR)/Makefile.common

create-install-dir:
	mkdir -p $(OUTPUTDIR)/labs/

install: create-install-dir $(OUTPUT)
