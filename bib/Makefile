TOP_DIR=..
include $(TOP_DIR)/Makefile.conf
include $(TOP_DIR)/Makefile.common

local-build:
	find $(BIBBASE) -type f|grep bib$$|while read file; do cp $$file .; done 
	cat *.bib > all.bib

local-install:
	cat all.bib|grep -iv "Date-"|grep -v "^%"|grep -iv XE > $(OUTPUTDIR)/gousiosg.bib	

local-clean:
	-rm *.bib
