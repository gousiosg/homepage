TOP_DIR=..
include $(TOP_DIR)/Makefile.conf

build:
	cp $(BIBBASE)/*.bib . 
	cat *.bib > all.bib

install:
	cp all.bib $(OUTPUTDIR)/gousiosg.bib	

clean:
	rm *.bib
