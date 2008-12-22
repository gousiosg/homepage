TOP_DIR=..
SUBDIRS=
COPYFILES=homepage.css
PROCESS=contact.html.pre index.html.pre links.html.pre 
OUTPUT=$(patsubst %.html.pre,%.html,$(addprefix ${OUTPUTDIR}/,$(PROCESS))) 

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT) copy-files 

