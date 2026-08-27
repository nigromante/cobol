       IDENTIFICATION DIVISION.
       PROGRAM-ID.    num2text.
       AUTHOR.        JULIAN VIDAL.


       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NUMERO-INP  PIC Z(12).
       01  NUMERO-CUR  PIC Z(12).
       01  VERSION-ES  PIC X(20).
       01  VERSION-EN  PIC X(20).
       01  VERSION-FR  PIC X(20).
       01  VERSION-DE  PIC X(20).
       01  VERSION-IT  PIC X(20).
       01  VERSION-PO  PIC X(20).
       01  VERSION-NO  PIC X(20).
       01  TEXTO-ES    PIC X(2000).
       01  TEXTO-EN    PIC X(2000).
       01  TEXTO-FR    PIC X(2000).
       01  TEXTO-DE    PIC X(2000).
       01  TEXTO-IT    PIC X(2000).
       01  TEXTO-PO    PIC X(2000).
       01  TEXTO-NO    PIC X(2000).

       SCREEN SECTION.
       INCLUDE NUMBER-SCRN.


       PROCEDURE DIVISION.

        000-CONTROL.
           PERFORM 000-LOADER.
           PERFORM 000-VERSION.
           PERFORM 000-TEST.
           STOP  RUN.

       000-VERSION.
      *    LLAMAR FUNCIONES DE VERSIONES
           CALL "VERSION_ES"  USING VERSION-ES.
           CALL "VERSION_EN"  USING VERSION-EN.
           CALL "VERSION_DE"  USING VERSION-DE.
           CALL "VERSION_FR"  USING VERSION-FR.
           CALL "VERSION_IT"  USING VERSION-IT.
           CALL "VERSION_PO"  USING VERSION-PO.
           CALL "VERSION_NO"  USING VERSION-NO.

       000-TEST.
           MOVE 1          TO  NUMERO-INP.

           PERFORM 000-TEST-LOOP
               UNTIL NUMERO-INP = ' '.


       000-TEST-LOOP.

           MOVE NUMERO-INP TO NUMERO-CUR.

           CALL "CONVERT_ES"   USING NUMERO-INP TEXTO-ES.
           CALL "CONVERT_EN"   USING NUMERO-INP TEXTO-EN.
           CALL "CONVERT_DE"   USING NUMERO-INP TEXTO-DE.
           CALL "CONVERT_FR"   USING NUMERO-INP TEXTO-FR.
           CALL "CONVERT_IT"   USING NUMERO-INP TEXTO-IT.
           CALL "CONVERT_PO"   USING NUMERO-INP TEXTO-PO.
           CALL "CONVERT_NO"   USING NUMERO-INP TEXTO-NO.


           DISPLAY INPUT-SCREEN.

           MOVE 0 TO NUMERO-INP.
           ACCEPT  INPUT-SCREEN.


       000-LOADER.
           CALL "libnum2esp".
           CALL "libnum2eng".
           CALL "libnum2deu".
           CALL "libnum2fra".
           CALL "libnum2ita".
           CALL "libnum2pol".
           CALL "libnum2nor".

       END PROGRAM num2text.
