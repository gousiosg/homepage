TOP_DIR=..
SUBDIRS=
FILES=homepage.css

include $(TOP_DIR)/Makefile.common

install: ${OUTPUTDIR}/%.html
	(for file in ${FILES}; do cp -v $$file ${OUTPUTDIR}/$$file; done)||exit 1;

${OUTPUTDIR}/%.html: %.pre
	${TOOLS}/preprocessor 
