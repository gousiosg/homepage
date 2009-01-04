TOP_DIR=..
SUBDIRS=
COPYFILES=
PROCESS=news.pre
NEWSINCL=$(INCLUDE)/news.inc 
NEWSRSS=$(OUTPUTDIR)/gousiosg-rss.xml
NEWSHTML=$(TOPLEVEL)/news.html.pre
OUTPUT= $(INCLUDE)/news.inc $(OUTPUTDIR)/news.html.pre
HTMLOUTPUT=$(OUTPUTDIR)/news.html

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT)

$(OUTPUT) : $(PROCESS)
	@echo "#Generating site news feeds and includes" 
	@INCL=$(INCLUDE) LANG=C NEWS=$(shell pwd) ${TOOLS}/news.pl $(NEWSRSS) $(NEWSINCL) $(NEWSHTML)

clean:
	-rm  $(NEWSRSS) $(NEWSINCL) $(NEWSHTML)

