      *    *****************************************
      *    LIBRERIA :  MONTO ESCRITO
      *    OBJETIVO :
      *      PERMITE OBTENER REPRESENTACION EN TEXTO
      *      DE NUMEROS PARA LOS IDIOMAS SIGTES.
      *        - ESPAÑOL
      *        - INGLES
      *        - ALEMAN
      *        - FRANCES
      *        - PORTUGUES
      *        - NORUEGO
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
           INCLUDE NUM200STR_DEF.
           INCLUDE NUM2ESSTR_DEF.
           INCLUDE NUM2ENSTR_DEF.
           INCLUDE NUM2DESTR_DEF.
           INCLUDE NUM2FRSTR_DEF.
           INCLUDE NUM2POSTR_DEF.
           INCLUDE NUM2NOSTR_DEF.


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
           PERFORM   300-INIT.
           PERFORM   301-INIT.
           PERFORM   302-INIT.
           PERFORM   303-INIT.
           PERFORM   304-INIT.
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
      *    DE-VERSION
      *      CALL "DE-VERSION"   USING VERSION-DE.
      *    *****************************************
       ENTRY "DE-VERSION" USING VERSION.
           MOVE W303-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    DE-CONVERT
      *    *****************************************
       ENTRY "DE-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W300-NUMERO.
           PERFORM 303-CONVERT.
           MOVE W300-RESULT TO  TEXTO.
           GOBACK.



      *    *****************************************
      *    FR-VERSION
      *      CALL "FR-VERSION"   USING VERSION-FR.
      *    *****************************************
       ENTRY "FR-VERSION" USING VERSION.
           MOVE W304-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    FR-CONVERT
      *    *****************************************
       ENTRY "FR-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W300-NUMERO.
           PERFORM 304-CONVERT.
           MOVE W300-RESULT TO  TEXTO.
           GOBACK.



      *    *****************************************
      *    PO-VERSION
      *      CALL "PO-VERSION"   USING VERSION-PO.
      *    *****************************************
       ENTRY "PO-VERSION" USING VERSION.
           MOVE W305-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    PO-CONVERT
      *    *****************************************
       ENTRY "PO-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W300-NUMERO.
           PERFORM 305-CONVERT.
           MOVE W300-RESULT TO  TEXTO.
           GOBACK.



      *    *****************************************
      *    NO-VERSION
      *      CALL "NO-VERSION"   USING VERSION-PO.
      *    *****************************************
       ENTRY "NO-VERSION" USING VERSION.
           MOVE W306-VERSION TO  VERSION.
           GOBACK.

      *    *****************************************
      *    NO-CONVERT
      *    *****************************************
       ENTRY "NO-CONVERT" USING NUMERO TEXTO.
           MOVE NUMERO   TO W300-NUMERO.
           PERFORM 306-CONVERT.
           MOVE W300-RESULT TO  TEXTO.
           GOBACK.



      *    *****************************************
      *    INCLUSION DE PROCEDIMIENTOS DE
      *    FUNCIONES EXTERNAS
      *    *****************************************
       INCLUDE NUM200STR_CODE.
       INCLUDE NUM2ESSTR_CODE.
       INCLUDE NUM2ENSTR_CODE.
       INCLUDE NUM2DESTR_CODE.
       INCLUDE NUM2FRSTR_CODE.
       INCLUDE NUM2POSTR_CODE.
       INCLUDE NUM2NOSTR_CODE.

       END PROGRAM LIBNUM2STR.

