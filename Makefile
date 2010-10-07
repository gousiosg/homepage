###
# Makefile for building home page
#

BIBDIR = bib
SUBDIRS=bib sw labs news toplevel img
TOP_DIR=.

.PHONY: all build dist all-install
.DEFAULT: all-install

all: all-install

include Makefile.conf
include $(TOP_DIR)/Makefile.common

all-install: output build install bib

local-build: 

local-install: 

local-clean:

output:
	mkdir -p ${OUTPUTDIR}

distclean : clean 
	-rm -rf ${OUTPUTDIR}/* 
	-find . -type f |grep '~' | xargs rm
	-find . -type f |grep .DS_Store | xargs rm
	-find . -type f -name .tmp | xargs rm

dist: all
	rsync -rv ${OUTPUTDIR}/* ${HOST}

bib: local-install 
	@for file in `find $$PWD/${OUTPUTDIR} -type f|grep html$$`; do \
		echo $$file; \
		bibfiles=`cat $$file |grep "BEGIN BIBLIOGRAPHY" | tr -s ' '|cut -f4 -d' '`; \
		for bibfile in $$bibfiles; do \
			cd $(TOOLS) ;\
			BIB=../$(BIBDIR) perl bib2xhtml.pl -s unsortlist $$bibfile.bib $$file ;\
			cd -;\
		done ; \
	done

	@grep -Ri bibincl $$PWD/public_html/* | cut -f1 -d':' | \
		while read file; do \
			echo Processing bib in $$file; \
			BIB=$$PWD/$(BIBDIR) TOOLS=$$PWD/$(TOOLS) perl tools/bibinclude.pl $$file ; \
		done


