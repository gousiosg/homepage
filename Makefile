###
# Makefile for building home page
#

include Makefile.conf

DIRS=toplevel labs projects img

.PHONY: all dist
.DEFAULT: all

all: build install 

build : build-subdirs

ifeq ($(SUBDIRS),)
build-subdirs :
else
build-subdirs :
	for i in $(SUBDIRS) ; do ( cd $$i && $(MAKE) build) || exit 1; done
endif

install : install-subdirs

ifeq ($(SUBDIRS),)
install-subdirs :
else
install-subdirs :
	for i in $(SUBDIRS) ; do ( cd $$i && $(MAKE) install) || exit 1; done
endif

clean : clean-subdirs

ifeq ($(SUBDIRS),)
clean-subdirs :
else
clean-subdirs :
	for i in $(SUBDIRS) ; do ( cd $$i && $(MAKE) clean ) || exit 1; done
endif

distclean : clean 
	-rm -rf ${OUTPUTDIR}/* 
	-find . -type f -name '*~' | xargs rm
	-find . -type f -name DS_Store | xargs rm

dist:
	rsync -rv ${OUTPUTDIR} ${HOST}

