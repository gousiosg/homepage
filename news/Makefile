TOP_DIR=..
SUBDIRS=
COPYFILES=
PROCESS=news.pre
OUTPUT=$(OUTPUTDIR)/gousiosg-news.xml $(OUTPUTDIR)/news.html $(INCLUDE)/news.inc

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT) 

$(OUTPUT) : $(PROCESS)
	@echo "#Generating site news feeds and includes" 
	@INCL=$(INCLUDE) ${TOOLS}/news.pl $(shell pwd)/$< $(OUTPUTDIR)


