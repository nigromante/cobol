
       301-INIT.

           MOVE  "_#"              TO  W301-EOF.

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



       301-CDU-PARSE.

           IF W301-C > 0
             IF W301-C = 1
               IF W301-D= 0 AND W301-U = 0
                 STRING  W301-RESULT DELIMITED BY "_"
                   "CIEN _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               ELSE
                 STRING  W301-RESULT DELIMITED BY "_"
                   "CIENTO _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               END-IF
             ELSE
                 STRING  W301-RESULT DELIMITED BY "_"
                   W301-CENTENAS(W301-C) DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
             END-IF
           END-IF.

           IF W301-D > 0
             IF W301-D = 1 AND W301-U <> 0
                 STRING  W301-RESULT DELIMITED BY "_"
                   W301-DECENAS-1(W301-U) DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               MOVE 0 TO W301-U
             ELSE
                 STRING  W301-RESULT DELIMITED BY "_"
                   W301-DECENAS(W301-D) DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               IF W301-U > 0
                 STRING  W301-RESULT DELIMITED BY "_"
                   "Y _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               END-IF
             END-IF
           END-IF.

           IF W301-U > 0
             STRING  W301-RESULT DELIMITED BY "_"
               W301-UNIDADES(W301-U) DELIMITED BY "_"
               W301-EOF  DELIMITED BY "#"
               INTO W301-RESULT
           END-IF.



       301-CDU-CALC.

           COMPUTE W301-IDX = 3 * (W301-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W301-CHARS(W301-IDX)) TO W301-C.
           ADD 1 TO W301-IDX.
           MOVE FUNCTION NUMVAL(W301-CHARS(W301-IDX)) TO W301-D.
           ADD 1 TO W301-IDX.
           MOVE FUNCTION NUMVAL(W301-CHARS(W301-IDX)) TO W301-U.

           COMPUTE W301-CDU = W301-C * 100 + W301-D * 10 + W301-U.


       301-SEGMENT.

           PERFORM 301-CDU-CALC.

           IF (W301-PART = 1 OR W301-PART = 3)

             IF (W301-PART = 1)
               COMPUTE W301-MILLAR = W301-CDU * 1000
             END-IF

             IF (W301-CDU > 0)
               IF (W301-CDU > 1)
                 PERFORM 301-CDU-PARSE
               END-IF
                 STRING  W301-RESULT DELIMITED BY "_"
                   "MIL _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
             END-IF
           END-IF.

           IF (W301-PART = 2)
             COMPUTE W301-MILLAR = W301-CDU + W301-MILLAR
             IF W301-MILLAR > 0
               PERFORM 301-CDU-PARSE
               IF W301-MILLAR > 1
                 STRING  W301-RESULT DELIMITED BY "_"
                   "MILLONES _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               ELSE
                 STRING  W301-RESULT DELIMITED BY "_"
                   "MILLON _" DELIMITED BY "_"
                   W301-EOF  DELIMITED BY "#"
                 INTO W301-RESULT
               END-IF
             END-IF
           END-IF.

           IF ( W301-PART = 4 AND W301-CDU > 0 )
               PERFORM 301-CDU-PARSE
           END-IF.


       301-CONVERT.

           MOVE "_" TO W301-RESULT.

           MOVE  0   TO    W301-MILLAR.

           PERFORM 301-SEGMENT
             VARYING W301-PART
             FROM 1 BY 1 UNTIL W301-PART > 4.


            STRING  W301-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W301-RESULT.

