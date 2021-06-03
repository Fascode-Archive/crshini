	PWD      := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DESTDIR  ?= /usr/
LIBDIR   := ${DESTDIR}/lib/
BINDIR   := ${DESTDIR}/bin/

install:
	@make PWD=${PWD} DESTDIR=${DESTDIR} LIBDIR=${LIBDIR} BINDIR=${BINDIR} install-libcrshini
	@smake PWD=${PWD} DESTDIR=${DESTDIR} LIBDIR=${LIBDIR} BINDIR=${BINDIR} install-crshini

install-libcrshini:
	install -D -m 755 "${PWD}/src/libcrshini" "${LIBDIR}"

install-crshini:
	install -D -m 755 "${PWD}/src/crshini" "${BINDIR}"

uninstall:
	@make PWD=${PWD} DESTDIR=${DESTDIR} LIBDIR=${LIBDIR} BINDIR=${BINDIR} uninstall-libcrshini
	@make PWD=${PWD} DESTDIR=${DESTDIR} LIBDIR=${LIBDIR} BINDIR=${BINDIR} uninstall-crshini

uninstall-libcrshini:
	rm -rf "${LIBDIR}/libcrshini"

uninstall-crshini:
	rm -rf "${BINDIR}/crshini"

check:
	@shellcheck --shell=bash "${PWD}/src/"* 
