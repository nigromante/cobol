#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/RELEASE/LIB

make -f ./SCRIPTS/MAKEFILES/Makefile.release input=$1 run

