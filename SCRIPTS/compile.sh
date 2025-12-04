#!/bin/bash
clear

# lib dependencies
echo "-----------------------------"
make -f ./SCRIPTS/Makefile.test input=LIBENNUM2STR module
echo "-----------------------------"
make -f ./SCRIPTS/Makefile.test input=LIBESNUM2STR module
echo "-----------------------------"

make -f ./SCRIPTS/Makefile.test input=NUM2STR compile
echo "-----------------------------"

