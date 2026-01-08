
       305-INIT.

           MOVE  "_#"              TO  W305-EOF.

           MOVE "UN _"             TO  W305-UNIDADES(1).
           MOVE "DOS _"            TO  W305-UNIDADES(2).
           MOVE "TRES _"           TO  W305-UNIDADES(3).
           MOVE "CUATRO _"         TO  W305-UNIDADES(4).
           MOVE "CINCO _"          TO  W305-UNIDADES(5).
           MOVE "SEIS _"           TO  W305-UNIDADES(6).
           MOVE "SIETE _"          TO  W305-UNIDADES(7).
           MOVE "OCHO _"           TO  W305-UNIDADES(8).
           MOVE "NUEVE _"          TO  W305-UNIDADES(9).

           MOVE "ONCE _"           TO  W305-DECENAS-1(1).
           MOVE "DOCE _"           TO  W305-DECENAS-1(2).
           MOVE "TRECE _"          TO  W305-DECENAS-1(3).
           MOVE "CATORCE _"        TO  W305-DECENAS-1(4).
           MOVE "QUINCE _"         TO  W305-DECENAS-1(5).
           MOVE "DIECISEIS _"      TO  W305-DECENAS-1(6).
           MOVE "DIECISIETE _"     TO  W305-DECENAS-1(7).
           MOVE "DIECIOCHO _"      TO  W305-DECENAS-1(8).
           MOVE "DIECINUEVE _"     TO  W305-DECENAS-1(9).

           MOVE "DIEZ _"           TO  W305-DECENAS(1).
           MOVE "VEINTE _"         TO  W305-DECENAS(2).
           MOVE "TREINTA _"        TO  W305-DECENAS(3).
           MOVE "CUARENTA _"       TO  W305-DECENAS(4).
           MOVE "CINCUENTA _"      TO  W305-DECENAS(5).
           MOVE "SESENTA _"        TO  W305-DECENAS(6).
           MOVE "SETENTA _"        TO  W305-DECENAS(7).
           MOVE "OCHENTA _"        TO  W305-DECENAS(8).
           MOVE "NOVENTA _"        TO  W305-DECENAS(9).

           MOVE "CIEN _"           TO  W305-CENTENAS(1).
           MOVE "DOSCIENTOS _"     TO  W305-CENTENAS(2).
           MOVE "TRESCIENTOS _"    TO  W305-CENTENAS(3).
           MOVE "CUATROCIENTOS _"  TO  W305-CENTENAS(4).
           MOVE "QUINIENTOS _"     TO  W305-CENTENAS(5).
           MOVE "SEISCIENTOS _"    TO  W305-CENTENAS(6).
           MOVE "SETECIENTOS _"    TO  W305-CENTENAS(7).
           MOVE "OCHOCIENTOS _"    TO  W305-CENTENAS(8).
           MOVE "NOVECIENTOS _"    TO  W305-CENTENAS(9).



       305-CDU-PARSE.

           IF W305-C > 0
             IF W305-C = 1
               IF W305-D= 0 AND W305-U = 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   "CIEN _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   "CIENTO _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   W305-CENTENAS(W305-C) DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
             END-IF
           END-IF.

           IF W305-D > 0
             IF W305-D = 1 AND W305-U <> 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   W305-DECENAS-1(W305-U) DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               MOVE 0 TO W305-U
             ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   W305-DECENAS(W305-D) DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               IF W305-U > 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   "Y _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             END-IF
           END-IF.

           IF W305-U > 0
             STRING  W305-RESULT DELIMITED BY "_"
               W305-UNIDADES(W305-U) DELIMITED BY "_"
               W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
           END-IF.



       305-CDU-CALC.

           COMPUTE W305-IDX = 3 * (W305-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-C.
           ADD 1 TO W305-IDX.
           MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-D.
           ADD 1 TO W305-IDX.
           MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-U.

           COMPUTE W305-CDU = W305-C * 100 + W305-D * 10 + W305-U.


       305-SEGMENT.

           PERFORM 305-CDU-CALC.

           IF (W305-PART = 1 OR W305-PART = 3)

             IF (W305-PART = 1)
               COMPUTE W305-MILLAR = W305-CDU * 1000
             END-IF

             IF (W305-CDU > 0)
               IF (W305-CDU > 1)
                 PERFORM 305-CDU-PARSE
               END-IF
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MIL _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
             END-IF
           END-IF.

           IF (W305-PART = 2)
             COMPUTE W305-MILLAR = W305-CDU + W305-MILLAR
             IF W305-MILLAR > 0
               PERFORM 305-CDU-PARSE
               IF W305-MILLAR > 1
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MILLONES _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MILLON _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             END-IF
           END-IF.

           IF ( W305-PART = 4 AND W305-CDU > 0 )
               PERFORM 305-CDU-PARSE
           END-IF.


       305-CONVERT.

           MOVE "_" TO W305-RESULT.

           MOVE  0   TO    W305-MILLAR.

           PERFORM 305-SEGMENT
             VARYING W305-PART
             FROM 1 BY 1 UNTIL W305-PART > 4.


            STRING  W305-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W305-RESULT.

