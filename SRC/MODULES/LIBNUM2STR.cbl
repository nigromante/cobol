
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIBNUM2STR.
       AUTHOR. JULIAN VIDAL.

       DATA DIVISION.

       WORKING-STORAGE SECTION.
           INCLUDE GLOBAL_DEF.
           INCLUDE STRCAT_DEF.
           INCLUDE NUM2STR_DEF.

       LINKAGE SECTION.
           77  numero  PIC X(12).
           77  texto   PIC X(2000).


       PROCEDURE DIVISION USING numero texto.

           PERFORM   301-INIT.

           MOVE numero TO W301-Num.

           PERFORM 301-LOOP.

           move W300-Out TO texto.

           GOBACK.

       INCLUDE STRCAT_CODE.
       INCLUDE NUM2STR_CODE.

