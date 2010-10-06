TOP_DIR=..
SUBDIRS=whereami jdt

include $(TOP_DIR)/Makefile.common

build: sw.html.pre
	INCL=$(INCLUDE) LANG=C LINKBASE=$(BASEURL) ${TOOLS}/preprocessor.pl $< $@


