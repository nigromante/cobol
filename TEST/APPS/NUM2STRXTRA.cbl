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
       01  VERSION-ES  PIC X(20).
       01  VERSION-EN  PIC X(20).
       01  VERSION-DE  PIC X(20).
       01  VERSION-FR  PIC X(20).
       01  VERSION-PO  PIC X(20).
       01  VERSION-NO  PIC X(20).
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
           CALL "ES-VERSION"   USING VERSION-ES.
           CALL "EN-VERSION"   USING VERSION-EN.
           CALL "DE-VERSION"   USING VERSION-DE.
           CALL "FR-VERSION"   USING VERSION-FR.
           CALL "PO-VERSION"   USING VERSION-PO.
           CALL "NO-VERSION"   USING VERSION-NO.

       000-TEST.
           MOVE "123456123456"          TO  NUMERO-INP.
           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           PERFORM 000-TEST-LOOP
             UNTIL NUMERO-INP = ' '.

       000-TEST-LOOP.

      *    LLAMAR FUNCIONES DE MONTO ESCRITO
           CALL "ES-CONVERT"   USING NUMERO-INP TEXTO-ES.
           CALL "EN-CONVERT"   USING NUMERO-INP TEXTO-EN.
           CALL "DE-CONVERT"   USING NUMERO-INP TEXTO-DE.
           CALL "FR-CONVERT"   USING NUMERO-INP TEXTO-FR.
           CALL "PO-CONVERT"   USING NUMERO-INP TEXTO-PO.
           CALL "NO-CONVERT"   USING NUMERO-INP TEXTO-NO.

           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           DISPLAY INPUT-SCREEN.

           MOVE 0 TO NUMERO-INP.
           ACCEPT  INPUT-SCREEN.

       END PROGRAM NUM2STRXTRA.
