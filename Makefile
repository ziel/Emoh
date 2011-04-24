

INSTALLDIR=/usr/local

BINDIR=${INSTALLDIR}/bin
MANDIR=${INSTALLDIR}/man/man1

SRC_BINDIR=src/bin
SRC_MANDIR=src/man

BASENAME=emoh

all: install

install:
	@mkdir -p ${BINDIR}
	@mkdir -p ${MANDIR}
	@cp ${SRC_BINDIR}/${BASENAME} ${BINDIR}
	@echo Script installed in: ${BINDIR}
	@cat ${SRC_MANDIR}/${BASENAME}.1 | gzip > ${MANDIR}/${BASENAME}.1.gz
	@echo Man page installed in: ${MANDIR}

testman:
	nroff -man ${SRC_MANDIR}/${BASENAME}.1 | less
