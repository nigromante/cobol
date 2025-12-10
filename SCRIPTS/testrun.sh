#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

make -f ./SCRIPTS/Makefile.test input=$1 

make -f ./SCRIPTS/Makefile.test input=$1 run

