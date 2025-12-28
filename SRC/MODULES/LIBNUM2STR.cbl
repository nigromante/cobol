      *    *****************************************
      *    LIBRERIA :  MONTO ESCRITO
      *    OBJETIVO:
      *      PERMITE OBTENER REPRESENTACION EN TEXTO
      *      DE NUMEROS.
      *
      *    *****************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LIBNUM2STR.
       AUTHOR. JULIAN VIDAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    *****************************************
      *    INCLUSION DE DECLARACION DE VARIABLES
      *    USADAS EN FUNCIONES EXTERNAS
      *    *****************************************
           INCLUDE NUM2ENSTR_DEF.
           INCLUDE NUM2ESSTR_DEF.


      *    *****************************************
      *    DECLARACION DE PARAMETROS
      *    DE LAS FUNCIONES PUBLiCAS
      *    *****************************************
       LINKAGE SECTION.
           77  NUMERO  PIC X(12).
           77  TEXTO   PIC X(2000).
           77  VERSION PIC X(20).

      *    *****************************************
      *    PROCEDIMIENTO LLAMADO AL CARGAR LA
      *    LIBRERIA. SE DEBE LLAMAR PARA FORZAR LA
      *    INICIALIZACION DE LA LIBRERIA.
      *
      *      CALL LIBNUM2STR.
      *    *****************************************
       PROCEDURE DIVISION.
           PERFORM   301-INIT.
           PERFORM   302-INIT.
           GOBACK.

      *    *****************************************
      *    EN-VERSION
      *      CALL "EN-VERSION"   USING VERSION-EN.
      *    *****************************************
       ENTRY "EN-VERSION" USING VERSION.
           MOVE W302-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    EN-CONVERT
      *    *****************************************
       ENTRY "EN-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W302-NUMERO.
           PERFORM 302-CONVERT.
           MOVE W302-RESULT TO  TEXTO.
           GOBACK.


      *    *****************************************
      *    ES-VERSION
      *      CALL "ES-VERSION"   USING VERSION-EN.
      *    *****************************************
       ENTRY "ES-VERSION" USING VERSION.
           MOVE W301-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    ES-CONVER
      *    *****************************************
       ENTRY "ES-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W301-NUMERO.
           PERFORM 301-CONVERT.
           MOVE W301-RESULT TO  TEXTO.
           GOBACK.

      *    *****************************************
      *    INCLUSION DE PROCEDIMIENTOS DE
      *    FUNCIONES EXTERNAS
      *    *****************************************
       INCLUDE NUM2ENSTR_CODE.
       INCLUDE NUM2ESSTR_CODE.

       END PROGRAM LIBNUM2STR.
