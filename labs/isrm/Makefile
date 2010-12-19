TOP_DIR=../..
INSTALLDIR=$(OUTPUTDIR)/labs/isrm
ISRMLAB=/Volumes/Files/Documents/Misc/labs/isrm/

include $(TOP_DIR)/Makefile.common

local-build:
	cd $(ISRMLAB) && make html

local-install:
	cp -Rv $(ISRMLAB)/html/* $(INSTALLDIR)

local-clean:
	cd $(ISRMLAB) && make clean
