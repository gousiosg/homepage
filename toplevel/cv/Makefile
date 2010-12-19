TOP_DIR=../..
CVDIR=/Volumes/Files/Documents/Misc/misc/cv

include $(TOP_DIR)/Makefile.common

local-build:
	cd $(CVDIR) && make 

local-install: 
	cp -v $(CVDIR)/build/cv_en.pdf $(FILESDIR)/gousiosg-cv-en.pdf

local-clean:
	 cd $(CVDIR) && make clean
