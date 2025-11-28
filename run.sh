#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/DEBUG/LIB

make -f Makefile.test input=LIBNUM2STR module
make -f Makefile.test input=NUM2STR compile
make -f Makefile.test input=NUM2STR run
