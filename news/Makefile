TOP_DIR=..
SUBDIRS=
COPYFILES=
PROCESS=news.pre
OUTPUT=$(OUTPUTDIR)/gousiosg-news.xml $(INCLUDE)/news.inc news.html.pre
HTMLOUTPUT=$(OUTPUTDIR)/news.html

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT) $(HTMLOUTPUT)

$(OUTPUT) : $(PROCESS)
	@echo "#Generating site news feeds and includes" 
	@INCL=$(INCLUDE) ${TOOLS}/news.pl $(shell pwd)/$< $(OUTPUTDIR)

$(HTMLOUTPUT) : news.html.pre
