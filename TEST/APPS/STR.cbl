

       IDENTIFICATION DIVISION.
       PROGRAM-ID. STR.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77  TEXTO1   PIC X(100).
       77  TEXTO2   PIC X(100).
       77  TEXTO3   PIC X(100).
       77  XEOF     PIC XX.

       PROCEDURE DIVISION.
           MOVE "_#" TO   XEOF.
           MOVE "NOMBRE: _"        TO  TEXTO3.
           MOVE "JULIAN _ENrIQUE " TO TEXTO1.
           MOVE "VIDAL. _ALARCON  "  TO TEXTO2.

           STRING  TEXTO3 DELIMITED BY "_"
                   TEXTO1 DELIMITED BY "_"
                   TEXTO2 DELIMITED BY "_"
                   XEOF  DELIMITED BY "#"
                   INTO TEXTO3.

           STRING  TEXTO3 DELIMITED BY "_"
                   TEXTO1 DELIMITED BY "_"
                   TEXTO2 DELIMITED BY "_"
                   XEOF  DELIMITED BY "#"
                   INTO TEXTO3.

           STRING  TEXTO3 DELIMITED BY "_"
                   TEXTO1 DELIMITED BY "_"
                   TEXTO2 DELIMITED BY "_"
                   XEOF  DELIMITED BY "#"
                   INTO TEXTO3.

           STRING  TEXTO3 DELIMITED BY "_"
                   TEXTO1 DELIMITED BY "_"
                   TEXTO2 DELIMITED BY "_"
                   XEOF  DELIMITED BY "#"
                   INTO TEXTO3.

           DISPLAY TEXTO1.
           DISPLAY TEXTO2.
           DISPLAY TEXTO3.

           STOP RUN.

