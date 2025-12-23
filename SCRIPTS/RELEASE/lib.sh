#!/bin/bash

echo && make -f ./SCRIPTS/MAKEFILES/Makefile.release.module input=LIBNUM2STR
echo && make -f ./SCRIPTS/MAKEFILES/Makefile.release.module input=LIBESNUM2STR
echo && make -f ./SCRIPTS/MAKEFILES/Makefile.release.module input=LIBENNUM2STR
echo && make -f ./SCRIPTS/MAKEFILES/Makefile.release.module input=LIBENTRY

echo '----->'

