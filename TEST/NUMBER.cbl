
       IDENTIFICATION DIVISION.
       PROGRAM-ID. NUMBER.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.
          
       WORKING-STORAGE SECTION.
           
           INCLUDE 000_DEFINES.
           INCLUDE 001_DEFINES.
           INCLUDE 300_DEFINES.
           INCLUDE 301_DEFINES.


       PROCEDURE DIVISION.

           PERFORM   301-INIT.
           PERFORM   301-TEST.

           STOP RUN.

           INCLUDE 001_CODE.
           INCLUDE 300_CODE.
           INCLUDE 301_CODE.

           INCLUDE 301_TEST.
