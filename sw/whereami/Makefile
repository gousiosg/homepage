TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/whereami/
COPYDIRS=js
WHEREAMIPATH=/Volumes/Files/Documents/Misc/projects/whereami
BUNDLE=whereami.tar.gz

include $(TOP_DIR)/Makefile.common

local-build: $(HTML) 
	find $(WHEREAMIPATH) -type f|grep "\._"|xargs rm
	find $(WHEREAMIPATH) -type f|grep "DS_Store"|xargs rm
	tar zcvf $(BUNDLE) -C $(WHEREAMIPATH) src loggps-db.pl update.sh

local-install: 
	cp -v $(HTML) $(INSTALLDIR)
	cp -v $(BUNDLE) $(FILESDIR)

local-clean: 
	-rm $(HTML)
	-rm $(BUNDLE)
