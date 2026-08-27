      *    *****************************************
      *    LIBRERIA :  MONTO ESCRITO
      *    OBJETIVO :
      *      PERMITE OBTENER REPRESENTACION EN TEXTO
      *      DE NUMEROS PARA IDIOMA ESPAÑOL.
      *    *****************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. libnum2nor.
       AUTHOR. JULIAN VIDAL.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
      *    *****************************************
      *    INCLUSION DE DECLARACION DE VARIABLES
      *    USADAS EN FUNCIONES EXTERNAS
      *    *****************************************
           INCLUDE NUM200STR_DEF.
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
           GOBACK.



      *    *****************************************
      *    VERSION
      *      CALL "VERSION_ES"  USING VERSION-ES.
      *    *****************************************
       ENTRY "VERSION_NO" USING VERSION.
           MOVE W306-VERSION TO  VERSION
           GOBACK.



      *    *****************************************
      *    CONVERT
      *    CALL "CONVERT_ES" USING NUMERO-INP TEXTO-ES.
      *    *****************************************
       ENTRY "CONVERT_NO" USING  NUMERO TEXTO.

           MOVE "_" TO W300-RESULT.

           MOVE NUMERO TO W300-NUMERO.

           PERFORM 306-CONVERT.

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
       INCLUDE NUM2NOSTR_CODE.

       END PROGRAM libnum2nor.

