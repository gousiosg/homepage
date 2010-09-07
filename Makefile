###
# Makefile for building home page
#

SUBDIRS=bib projects labs news toplevel img
TOP_DIR=.

.PHONY: all build dist all-install
.DEFAULT: all-install

all: all-install

include Makefile.conf
include $(TOP_DIR)/Makefile.common

all-install: output build install bib

output:
	mkdir -p ${OUTPUTDIR}

distclean : clean 
	-rm -rf ${OUTPUTDIR}/* 
	-find . -type f -name '*~' | xargs rm
	-find . -type f -name DS_Store | xargs rm
	-find . -type f -name .tmp | xargs rm

dist: all
	rsync -rv ${OUTPUTDIR}/* ${HOST}

bib: install
	@for file in `find ${OUTPUTDIR} -type f|grep html$$`; do \
		echo $$file; \
		bibfiles=`cat $$file |grep "BEGIN BIBLIOGRAPHY" | tr -s ' '|cut -f4 -d' '`; \
		for bibfile in $$bibfiles; do \
			perl tools/bib2xhtml.pl -s unsortlist $$bibfile.bib $$file;\
		done ; \
		cites=`cat $$file |grep "BEGIN CITATIONS" | tr -s ' '|cut -f4 -d' '`; \
		for cite in $$cites; do \
			perl tools/bib2xhtml.pl -s plain -i $$cite.bib $$file; \
			break;\
		done; \
	done

