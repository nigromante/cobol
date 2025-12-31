#!/bin/bash

rm -rf ./BUILD/DEBUG/LIB/*
echo && make -f ./SCRIPTS/MAKEFILES/Makefile.test.module input=LIBNUM2STR
#echo && make -f ./SCRIPTS/MAKEFILES/Makefile.test.module input=LIBESNUM2STR
#echo && make -f ./SCRIPTS/MAKEFILES/Makefile.test.module input=LIBENNUM2STR
#echo && make -f ./SCRIPTS/MAKEFILES/Makefile.test.module input=LIBENTRY

echo '----->'

