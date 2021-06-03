PWD = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DESTDIR = /usr/
LIBDIR = ${DESTDIR}/lib/
BINDIR = ${DESTDIR}/bin/

install:
	@sudo make install-libcrshini
	@sudo make install-crshini

install-libcrshini:
	sudo install -D -m 755 "${PWD}/src/libcrshini" "${LIBDIR}"

install-crshini:
	sudo install -D -m 755 "${PWD}/src/crshini" "${BINDIR}"

uninstall:
	@sudo make uninstall-libcrshini
	@sudo make uninstall-crshini

uninstall-libcrshini:
	sudo rm -rf "${LIBDIR}/libcrshini"

uninstall-crshini:
	sudo rm -rf "${BINDIR}/crshini"

check:
	@shellcheck --shell=bash "${PWD}/src/"* 
