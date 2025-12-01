#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

make -f Makefile.test input=LIBNUM2ESSTR module
make -f Makefile.test input=NUM2ESSTR compile
make -f Makefile.test input=NUM2ESSTR run

