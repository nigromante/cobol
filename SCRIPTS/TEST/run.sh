#!/bin/bash

export COB_LIBRARY_PATH=~/work/cobol/BUILD/DEBUG/LIB

make -f ./SCRIPTS/MAKEFILES/Makefile.test input=$1 run

