#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/RELEASE/LIB

make -f Makefile input=LIBNUM2ESSTR module
make -f Makefile input=NUM2ESSTR compile
make -f Makefile input=NUM2ESSTR run

