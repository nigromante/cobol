#!/bin/bash

echo && make -f ./SCRIPTS/Makefile.release.module input=LIBESNUM2STR
echo && make -f ./SCRIPTS/Makefile.release.module input=LIBENNUM2STR
echo && make -f ./SCRIPTS/Makefile.release.module input=LIBENTRY

echo '----->'

