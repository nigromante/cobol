       IDENTIFICATION DIVISION.
       PROGRAM-ID. CANCELAR.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.
       LINKAGE SECTION.
       01  numero  PIC X(10).
       01  texto   PIC X(2000).

       WORKING-STORAGE SECTION.

           INCLUDE GLOBAL_DEF.
           INCLUDE TRACE_DEF.
           INCLUDE STRCAT_DEF.
           INCLUDE NUM2STR_DEF.

       PROCEDURE DIVISION using numero, texto.


           PERFORM   301-INIT.

           MOVE numero TO W301-Num.

           PERFORM 301-LOOP.
           MOVE W300-Out TO  texto.

           GOBACK.

           INCLUDE TRACE_CODE.
           INCLUDE STRCAT_CODE.
           INCLUDE NUM2STR_CODE.
