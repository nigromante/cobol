       IDENTIFICATION DIVISION.
       PROGRAM-ID.    NUM2STRXTRA.
       AUTHOR.        JULIAN VIDAL.


       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *    *****************************************
      *    DECLARACION DE LIBRERIAS USADAS
      *    *****************************************
       REPOSITORY.
           PROGRAM LIBNUM2STR.


       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  NUMERO-INP  PIC 9(12) BLANK WHEN ZERO.
       01  NUMERO-CUR  PIC 9(12) BLANK WHEN ZERO.
       01  TEXTO-ES    PIC x(2000).
       01  TEXTO-EN    PIC x(2000).
       01  TEXTO-DE    PIC x(2000).
       01  TEXTO-FR    PIC x(2000).
       01  TEXTO-PO    PIC x(2000).
       01  TEXTO-NO    PIC x(2000).
       01  TEXTO-RO    PIC x(2000).
       01  TEXTO-IT    PIC x(2000).
       01  VERSION-ES  PIC X(20).
       01  VERSION-EN  PIC X(20).
       01  VERSION-DE  PIC X(20).
       01  VERSION-FR  PIC X(20).
       01  VERSION-PO  PIC X(20).
       01  VERSION-NO  PIC X(20).
       01  VERSION-RO  PIC X(20).
       01  VERSION-IT  PIC X(20).
       01  VERSION-APP PIC X(20) VALUE "NUM2STRXTRA (1.0)".

       SCREEN SECTION.
      *    *****************************************
      *    INCLUSION DE PANTALLAS
      *    *****************************************
       INCLUDE NUMBER-SCRN.


       PROCEDURE DIVISION.
           PERFORM 000-START.
           PERFORM 000-TEST.
           STOP  RUN.

       000-START.
      *    CARGAR LA LIBRERIA
           CALL LIBNUM2STR.

      *    LLAMAR FUNCIONES DE VERSIONES
           CALL "VERSION"   USING "ES" VERSION-ES.
           CALL "VERSION"   USING "EN" VERSION-EN.
           CALL "VERSION"   USING "DE" VERSION-DE.
           CALL "VERSION"   USING "FR" VERSION-FR.
           CALL "VERSION"   USING "PO" VERSION-PO.
           CALL "VERSION"   USING "NO" VERSION-NO.
           CALL "VERSION"   USING "RO" VERSION-RO.
           CALL "VERSION"   USING "IT" VERSION-IT.

       000-TEST.
           MOVE "123456789012"          TO  NUMERO-INP.
           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           PERFORM 000-TEST-LOOP
             UNTIL NUMERO-INP = ' '.

       000-TEST-LOOP.

      *    LLAMAR FUNCIONES DE MONTO ESCRITO
           CALL "CONVERT"   USING "ES" NUMERO-INP TEXTO-ES.
           CALL "CONVERT"   USING "EN" NUMERO-INP TEXTO-EN.
           CALL "CONVERT"   USING "DE" NUMERO-INP TEXTO-DE.
           CALL "CONVERT"   USING "FR" NUMERO-INP TEXTO-FR.
           CALL "CONVERT"   USING "PO" NUMERO-INP TEXTO-PO.
           CALL "CONVERT"   USING "NO" NUMERO-INP TEXTO-NO.
           CALL "CONVERT"   USING "RO" NUMERO-INP TEXTO-RO.
           CALL "CONVERT"   USING "IT" NUMERO-INP TEXTO-IT.

           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           DISPLAY INPUT-SCREEN.

           MOVE 0 TO NUMERO-INP.
           ACCEPT  INPUT-SCREEN.

       END PROGRAM NUM2STRXTRA.
