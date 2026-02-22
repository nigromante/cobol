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
      *        - ROMANO
      *        - ITALIANO
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
           INCLUDE NUM2ROSTR_DEF.
           INCLUDE NUM2ITSTR_DEF.


      *    *****************************************
      *    DECLARACION DE PARAMETROS
      *    DE LAS FUNCIONES PUBLiCAS
      *    *****************************************
       LINKAGE SECTION.
           77  NUMERO  PIC X(12).
           77  TEXTO   PIC X(2000).
           77  VERSION PIC X(20).
           77  COUNTRY PIC X(2).

      *    *****************************************
      *    PROCEDIMIENTO LLAMADO AL CARGAR LA
      *    LIBRERIA. SE DEBE LLAMAR PARA FORZAR LA
      *    INICIALIZACION DE LA LIBRERIA.
      *
      *      CALL LIBNUM2STR.
      *    *****************************************
       PROCEDURE DIVISION.
           PERFORM   300-INIT.
           GOBACK.



      *    *****************************************
      *    VERSION
      *      CALL "VERSION"  USING "ES" VERSION-ES.
      *    *****************************************
       ENTRY "VERSION" USING COUNTRY VERSION.

           EVALUATE COUNTRY
             WHEN "ES"
               MOVE W301-VERSION TO  VERSION
             WHEN "EN"
               MOVE W302-VERSION TO  VERSION
             WHEN "DE"
               MOVE W303-VERSION TO  VERSION
             WHEN "FR"
               MOVE W304-VERSION TO  VERSION
             WHEN "PO"
               MOVE W305-VERSION TO  VERSION
             WHEN "NO"
               MOVE W306-VERSION TO  VERSION
             WHEN "RO"
               MOVE W307-VERSION TO  VERSION
             WHEN "IT"
               MOVE W308-VERSION TO  VERSION
           END-EVALUATE.

           GOBACK.



      *    *****************************************
      *    CONVERT
      *    CALL "CONVERT"   USING "ES" NUMERO-INP TEXTO-ES.
      *    *****************************************
       ENTRY "CONVERT" USING COUNTRY NUMERO TEXTO.

           MOVE "_" TO W300-RESULT.

           MOVE NUMERO   TO W300-NUMERO.

           EVALUATE COUNTRY
             WHEN "ES"
               PERFORM 301-CONVERT
             WHEN "EN"
               PERFORM 302-CONVERT
             WHEN "DE"
               PERFORM 303-CONVERT
             WHEN "FR"
               PERFORM 304-CONVERT
             WHEN "PO"
               PERFORM 305-CONVERT
             WHEN "NO"
               PERFORM 306-CONVERT
             WHEN "RO"
               PERFORM 307-CONVERT
             WHEN "IT"
               PERFORM 308-CONVERT
           END-EVALUATE.

           STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMITED BY SIZE
             INTO W300-RESULT.
           
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
       INCLUDE NUM2ROSTR_CODE.
       INCLUDE NUM2ITSTR_CODE.

       END PROGRAM LIBNUM2STR.

