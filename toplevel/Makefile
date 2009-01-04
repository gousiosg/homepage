TOP_DIR=..
SUBDIRS=
COPYFILES=homepage.css
PROCESS=$(shell ls *.pre)
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/,$(PROCESS))) 

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT) copy-files 

