###
# Makefile for building home page
#

SUBDIRS=pubs projects labs toplevel img
TOP_DIR=.

include Makefile.conf
include $(TOP_DIR)/Makefile.common

.PHONY: all dist
.DEFAULT: all

all: output build install

output:
	mkdir -p ${OUTPUTDIR} 

build : build-subdirs

distclean : clean 
	-rm -rf ${OUTPUTDIR}/* 
	-find . -type f -name '*~' | xargs rm
	-find . -type f -name DS_Store | xargs rm

dist:
	rsync -rv ${OUTPUTDIR} ${HOST}

