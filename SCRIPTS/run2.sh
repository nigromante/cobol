#!/bin/bash
clear

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

make -f ./SCRIPTS/Makefile.test input=ENTRY run

