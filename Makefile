###
# Makefile for building home page
#

SUBDIRS=pubs projects labs news toplevel img
TOP_DIR=.

.PHONY: all build dist all-install
.DEFAULT: all-install

all: all-install

include Makefile.conf
include $(TOP_DIR)/Makefile.common

all-install: output build install

output:
	mkdir -p ${OUTPUTDIR}

distclean : clean 
	-rm -rf ${OUTPUTDIR}/* 
	-find . -type f -name '*~' | xargs rm
	-find . -type f -name DS_Store | xargs rm
	-find . -type f -name .tmp | xargs rm
dist: all
	rsync -rv ${OUTPUTDIR}/* ${HOST}

