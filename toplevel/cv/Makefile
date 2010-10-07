TOP_DIR=../..
INSTALLDIR=$(FILESDIR)
CVDIR=/Volumes/Files/Documents/Misc/misc/cv

include $(TOP_DIR)/Makefile.common

local-build:
	cd $(CVDIR) && make 

local-install: 
	cp -v $(CVDIR)/build/cv_en.pdf $(INSTALLDIR)/gousiosg-cv-en.pdf

local-clean:
	 cd $(CVDIR) && make clean
