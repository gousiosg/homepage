TOP_DIR=../..
INSTALLDIR=$(OUTPUTDIR)/labs/isrm
ISRMLAB=/Volumes/Files/Documents/Misc/labs/isrm/

include $(TOP_DIR)/Makefile.common

local-build:
	echo "cd $(ISRMLAB) && make"

local-install:
	echo cp -Rv $(ISRMLAB)/* $(INSTALLDIR)

local-clean:
	echo "cd $(ISRMLAB) && make clean"
