TOP_DIR=..
SUBDIRS=
COPYFILES=
PROCESS=news.pre
NEWSINCL=$(INCLUDE)/news.inc 
NEWSRSS=$(shell pwd)/gousiosg-rss.xml
NEWSHTML=$(TOPLEVEL)/news.html.pre
OUTPUT= $(INCLUDE)/news.inc $(OUTPUTDIR)/news.html.pre $(NEWSRSS)
HTMLOUTPUT=$(OUTPUTDIR)/news.html

include $(TOP_DIR)/Makefile.common

install: $(OUTPUT) $(OUTPUTDIR)/gousiosg-rss.xml

$(OUTPUT) : $(PROCESS)
	@echo "#Generating site news feeds and includes" 
	@INCL=$(INCLUDE) LANG=C NEWS=$(shell pwd) ${TOOLS}/news.pl $(NEWSRSS) $(NEWSINCL) $(NEWSHTML)

$(OUTPUTDIR)/gousiosg-rss.xml : $(NEWSRSS)
	@echo Processing $@
	@INCL=$(INCLUDE) LANG=C LINKBASE=$(BASEURL) ${TOOLS}/preprocessor.pl $< $@

clean:
	-rm  $(NEWSRSS) $(NEWSINCL) $(NEWSHTML)

