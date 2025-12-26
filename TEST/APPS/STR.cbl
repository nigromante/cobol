

       IDENTIFICATION DIVISION.
       PROGRAM-ID. STR.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.

       WORKING-STORAGE SECTION.
       77  TEXTO1   PIC X(100).
       77  TEXTO2   PIC X(100).
       77  TEXTO3   PIC X(100).

       PROCEDURE DIVISION.

           MOVE "JULIAN _ENrIQUE " TO TEXTO1.
           MOVE "VIDAL_ALARCON  " TO TEXTO2.
           STRING  TEXTO1 DELIMITED BY "_"
                   TEXTO2 DELIMITED BY "_"
                   INTO TEXTO3.
           DISPLAY TEXTO1.
           DISPLAY TEXTO2.
           DISPLAY TEXTO3.

           STOP RUN.

