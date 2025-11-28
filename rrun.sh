#!/bin/bash

export COB_LIBRARY_PATH=~/Work/proyectos/cobol/BUILD/RELEASE/LIB

make -f Makefile input=LIBNUM2STR module
make -f Makefile input=NUM2STR compile
make -f Makefile input=NUM2STR run
