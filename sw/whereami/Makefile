TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/whereami
OUTPUT=$(addprefix ${INSTALLDIR},$(HTML))

include $(TOP_DIR)/Makefile.common

create-install-dir:
	mkdir -p $(OUTPUTDIR)/sw/whereami

build: $(HTML) 

install: create-install-dir $(OUTPUT)

clean: 
	-rm $(HTML)
