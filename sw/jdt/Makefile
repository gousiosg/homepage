TOP_DIR=../..
PROCESS=$(shell ls *.pre)
HTML=$(patsubst %.html.pre,%.html, $(PROCESS))
INSTALLDIR=$(OUTPUTDIR)/sw/jdt/
OUTPUT=$(addprefix ${INSTALLDIR},$(HTML))
JDTPATH=/Volumes/Files/Documents/Misc/projects/jdt
ARCHIVE=jdt.tar.gz

include $(TOP_DIR)/Makefile.common

local-build: $(HTML) $(ARCHIVE)
	
$(ARCHIVE): $(JDTPATH)
	tar czvf $(ARCHIVE) --exclude ".svn" -C $(JDTPATH)/.. jdt

local-install: $(FILESDIR) $(INSTALLDIR) 
	cp -v $(HTML) $(INSTALLDIR)
	cp -v $(ARCHIVE) $(FILESDIR)/$(ARCHIVE)

local-clean: 
	-rm $(HTML)
	-rm $(ARCHIVE)
