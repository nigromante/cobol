#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/RELEASE/LIB

# lib dependencies
make -f ./SCRIPTS/Makefile input=LIBNUM2ESSTR module

make -f ./SCRIPTS/Makefile input=NUM2ESSTR compile
make -f ./SCRIPTS/Makefile input=NUM2ESSTR run

