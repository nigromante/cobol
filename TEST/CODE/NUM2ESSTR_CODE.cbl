
       301-CONVERT.

           MOVE "_" TO W300-RESULT.

           PERFORM 301-INIT.

           PERFORM 300-CALCULATE.

           PERFORM 301-CDU-CALC THROUGH 301-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W300-RESULT.



       301-INIT.

           MOVE "UN _"             TO  W301-UNIDADES(1).
           MOVE "DOS _"            TO  W301-UNIDADES(2).
           MOVE "TRES _"           TO  W301-UNIDADES(3).
           MOVE "CUATRO _"         TO  W301-UNIDADES(4).
           MOVE "CINCO _"          TO  W301-UNIDADES(5).
           MOVE "SEIS _"           TO  W301-UNIDADES(6).
           MOVE "SIETE _"          TO  W301-UNIDADES(7).
           MOVE "OCHO _"           TO  W301-UNIDADES(8).
           MOVE "NUEVE _"          TO  W301-UNIDADES(9).

           MOVE "ONCE _"           TO  W301-DECENAS-1(1).
           MOVE "DOCE _"           TO  W301-DECENAS-1(2).
           MOVE "TRECE _"          TO  W301-DECENAS-1(3).
           MOVE "CATORCE _"        TO  W301-DECENAS-1(4).
           MOVE "QUINCE _"         TO  W301-DECENAS-1(5).
           MOVE "DIECISEIS _"      TO  W301-DECENAS-1(6).
           MOVE "DIECISIETE _"     TO  W301-DECENAS-1(7).
           MOVE "DIECIOCHO _"      TO  W301-DECENAS-1(8).
           MOVE "DIECINUEVE _"     TO  W301-DECENAS-1(9).

           MOVE "DIEZ _"           TO  W301-DECENAS(1).
           MOVE "VEINTE _"         TO  W301-DECENAS(2).
           MOVE "TREINTA _"        TO  W301-DECENAS(3).
           MOVE "CUARENTA _"       TO  W301-DECENAS(4).
           MOVE "CINCUENTA _"      TO  W301-DECENAS(5).
           MOVE "SESENTA _"        TO  W301-DECENAS(6).
           MOVE "SETENTA _"        TO  W301-DECENAS(7).
           MOVE "OCHENTA _"        TO  W301-DECENAS(8).
           MOVE "NOVENTA _"        TO  W301-DECENAS(9).

           MOVE "CIEN _"           TO  W301-CENTENAS(1).
           MOVE "DOSCIENTOS _"     TO  W301-CENTENAS(2).
           MOVE "TRESCIENTOS _"    TO  W301-CENTENAS(3).
           MOVE "CUATROCIENTOS _"  TO  W301-CENTENAS(4).
           MOVE "QUINIENTOS _"     TO  W301-CENTENAS(5).
           MOVE "SEISCIENTOS _"    TO  W301-CENTENAS(6).
           MOVE "SETECIENTOS _"    TO  W301-CENTENAS(7).
           MOVE "OCHOCIENTOS _"    TO  W301-CENTENAS(8).
           MOVE "NOVECIENTOS _"    TO  W301-CENTENAS(9).



       301-CDU-CALC.

           MOVE W300-TAB(W300-PART,1) TO W300-C.
           MOVE W300-TAB(W300-PART,2) TO W300-D.
           MOVE W300-TAB(W300-PART,3) TO W300-U.
           MOVE W300-TAB(W300-PART,4) TO w300-CDU.
           MOVE W300-TAB(W300-PART,5) TO w300-DU.



       301-SEGMENT.

           IF (W300-PART = 1 OR W300-PART = 3)  AND (W300-CDU > 0)
               IF (W300-CDU > 1)
                 PERFORM 301-CDU-PARSE
               END-IF
               STRING  W300-RESULT DELIMITED BY "_"
                 "MIL _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.

           IF (W300-PART = 2) AND W300-TAB(2,7) > 0
               IF W300-TAB(2,7) > 1
                 PERFORM 301-CDU-PARSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "MILLONES _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "UN MILLON _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
           END-IF.

           IF ( W300-PART = 4 AND W300-CDU > 0 )
               PERFORM 301-CDU-PARSE
           END-IF.



       301-CDU-PARSE.

           IF W300-C > 0
             IF W300-C = 1
               IF W300-DU = 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CIEN _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CIENTO _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   W301-CENTENAS(W300-C) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF W300-D > 0
             IF W300-D = 1 AND W300-U <> 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W301-DECENAS-1(W300-U) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W300-U
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 W301-DECENAS(W300-D) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
               IF W300-U > 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "Y _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             END-IF
           END-IF.

           IF W300-U > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W301-UNIDADES(W300-U) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.



