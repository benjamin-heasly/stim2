CC = cc
CFLAGS = -g -I/usr/include/tcl8.6 -I/usr/local/include -DUSE_TCL_STUBS -DUSE_INTERP_RESULT -fPIC
LDFLAGS = -T1 $(DEBUG)
LIBS =

all: sockapi.o streamctrl stimctrl

sockapi.o:	sockapi.c sockapi.h
	$(CC) $(CFLAGS) -c sockapi.c

stimctrl:	stimctrl.c sockapi.o
	$(CC) $(CFLAGS) -o stimctrl stimctrl.c sockapi.o -lreadline -ltermcap

stimctrl.so:	tclstimctrl.c sockapi.o
	$(CC) -c $(CFLAGS) -I/usr/include/tcl8.6 tclstimctrl.c
	$(LD) -shared tclstimctrl.o sockapi.o -o stimctrl.so -ltclstub8.6

install-stimctrl:
	cp stimctrl /usr/local/bin

install-stimctrl-package:
	tclsh8.3 pkg.tcl
	cp pkgIndex.tcl /usr/local/lib/stimctrl
	cp stimctrl.so /usr/local/lib/stimctrl

install: install-stimctrl install-stimctrl-package
