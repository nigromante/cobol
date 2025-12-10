#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/RELEASE/LIB

make -f ./SCRIPTS/Makefile.release input=$1 clean

make -f ./SCRIPTS/Makefile.release input=$1 

make -f ./SCRIPTS/Makefile.release input=$1 run

