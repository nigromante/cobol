

       IDENTIFICATION DIVISION.
       PROGRAM-ID. CANCELAR.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.
       LINKAGE SECTION.
       01  numero  PIC X(10).

       PROCEDURE DIVISION using numero.
           MOVE "abcdsabcde" TO  numero.
       GOBACK.

