TOP_DIR=..
include $(TOP_DIR)/Makefile.conf

build:
	cp $(BIBBASE)/*.bib . 
	cat *.bib > all.bib

install:
	cat all.bib|grep -iv "Date-"|grep -v "^%"|grep -iv XE > $(OUTPUTDIR)/gousiosg.bib	

clean:
	rm *.bib
