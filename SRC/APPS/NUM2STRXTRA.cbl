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
       01  TEXTO-EN    PIC x(2000).
       01  TEXTO-ES    PIC x(2000).
       01  VERSION-EN  PIC X(20).
       01  VERSION-ES  PIC X(20).
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

      *    LLAMAR FUNCiONES DE VERSIONES
           CALL "EN-VERSION"   USING VERSION-EN.
           CALL "ES-VERSION"   USING VERSION-ES.

       000-TEST.
           MOVE "1"          TO  NUMERO-INP.
           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           PERFORM 000-TEST-LOOP
             UNTIL NUMERO-INP = ' '.

       000-TEST-LOOP.

      *    LLAMAR FUNCIONES DE MONTO ESCRITO
           CALL "EN-CONVERT"   USING NUMERO-INP TEXTO-EN.
           CALL "ES-CONVERT"   USING NUMERO-INP TEXTO-ES.

           MOVE  NUMERO-INP  TO  NUMERO-CUR.

           DISPLAY INPUT-SCREEN.

           MOVE 0 TO NUMERO-INP.
           ACCEPT  INPUT-SCREEN.

       END PROGRAM NUM2STRXTRA.
