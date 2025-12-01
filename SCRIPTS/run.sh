#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

# lib dependencies
echo "-----------------------------"
make -f ./SCRIPTS/Makefile.test input=LIBENNUM2STR module
echo "-----------------------------"
make -f ./SCRIPTS/Makefile.test input=LIBESNUM2STR module
echo "-----------------------------"

make -f ./SCRIPTS/Makefile.test input=NUM2ENSTR compile
echo "-----------------------------"
make -f ./SCRIPTS/Makefile.test input=NUM2ENSTR run
echo "-----------------------------"

