#!/bin/bash

make -f Makefile.test input=LIBNUM2STR module
make -f Makefile.test input=NUM2STR compile
make -f Makefile.test input=NUM2STR run
