
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


