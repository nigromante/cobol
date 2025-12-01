#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

make -f ./SCRIPTS/Makefile.test input=LIBNUM2ESSTR module
make -f ./SCRIPTS/Makefile.test input=NUM2ESSTR compile
make -f ./SCRIPTS/Makefile.test input=NUM2ESSTR run

