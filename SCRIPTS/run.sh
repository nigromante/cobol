#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

# lib dependencies
make -f ./SCRIPTS/Makefile.test input=LIBNUM2ENSTR module

make -f ./SCRIPTS/Makefile.test input=NUM2ENSTR compile
make -f ./SCRIPTS/Makefile.test input=NUM2ENSTR run

