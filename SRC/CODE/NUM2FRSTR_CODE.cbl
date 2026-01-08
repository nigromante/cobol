
       304-INIT.

           MOVE  "_#"              TO  W304-EOF.

           MOVE "UN _"             TO  W304-UNIDADES(1).
           MOVE "DEUX _"            TO  W304-UNIDADES(2).
           MOVE "TROIS _"           TO  W304-UNIDADES(3).
           MOVE "QUATRE _"         TO  W304-UNIDADES(4).
           MOVE "CINQ _"          TO  W304-UNIDADES(5).
           MOVE "SIX _"           TO  W304-UNIDADES(6).
           MOVE "SEPT _"          TO  W304-UNIDADES(7).
           MOVE "HUIT _"           TO  W304-UNIDADES(8).
           MOVE "NEUF _"          TO  W304-UNIDADES(9).

           MOVE "ONZE _"           TO  W304-DECENAS-1(1).
           MOVE "DOUZE _"           TO  W304-DECENAS-1(2).
           MOVE "TREIZE _"          TO  W304-DECENAS-1(3).
           MOVE "QUATORZE _"        TO  W304-DECENAS-1(4).
           MOVE "QUINZE _"         TO  W304-DECENAS-1(5).
           MOVE "SEIZE _"      TO  W304-DECENAS-1(6).
           MOVE "DIX-SEPT _"     TO  W304-DECENAS-1(7).
           MOVE "DIX-HUIT _"      TO  W304-DECENAS-1(8).
           MOVE "DIX-NEUF _"     TO  W304-DECENAS-1(9).

           MOVE "DIX _"           TO  W304-DECENAS(1).
           MOVE "VINGT_"         TO  W304-DECENAS(2).
           MOVE "TRENTE_"        TO  W304-DECENAS(3).
           MOVE "QUARANTE_"           TO  W304-DECENAS(4).
           MOVE "CINQUANTE_"          TO  W304-DECENAS(5).
           MOVE "SOIXANTE_"           TO  W304-DECENAS(6).
           MOVE "SOIXANTE-DIX_"       TO  W304-DECENAS(7).
           MOVE "QUATRE-VINGT_"       TO  W304-DECENAS(8).
           MOVE "QUATRE-VINGT-DIX_"   TO  W304-DECENAS(9).

           MOVE "CENT _"               TO  W304-CENTENAS(1).
           MOVE "DOSCIENTOS _"     TO  W304-CENTENAS(2).
           MOVE "TRESCIENTOS _"    TO  W304-CENTENAS(3).
           MOVE "CUATROCIENTOS _"  TO  W304-CENTENAS(4).
           MOVE "QUINIENTOS _"     TO  W304-CENTENAS(5).
           MOVE "SEISCIENTOS _"    TO  W304-CENTENAS(6).
           MOVE "SETECIENTOS _"    TO  W304-CENTENAS(7).
           MOVE "OCHOCIENTOS _"    TO  W304-CENTENAS(8).
           MOVE "NOVECIENTOS _"    TO  W304-CENTENAS(9).



       304-CDU-PARSE-C.
           IF W304-C > 0
             IF W304-C = 1
                 STRING  W304-RESULT DELIMITED BY "_"
                   "CENT _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
             ELSE
                 STRING  W304-RESULT DELIMITED BY "_"
                   W304-UNIDADES(W304-C) DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT

               IF W304-D = 0 AND W304-U = 0
                 STRING  W304-RESULT DELIMITED BY "_"
                   "CENTS _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
               ELSE
                 STRING  W304-RESULT DELIMITED BY "_"
                   "CENT _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
               END-IF
             END-IF
           END-IF.



       304-CDU-PARSE-D.

           IF W304-D = 6 OR W304-D = 7
             STRING  W304-RESULT DELIMITED BY "_"
               W304-DECENAS(6) DELIMITED BY "_"
               W304-EOF  DELIMITED BY "#"
             INTO W304-RESULT
             IF W304-D = 7 OR W304-U > 0
               STRING  W304-RESULT DELIMITED BY "_"
                 "-_" DELIMITED BY "_"
                 W304-EOF  DELIMITED BY "#"
               INTO W304-RESULT
             END-IF
             COMPUTE W304-D = W304-D - 6
           END-IF.

           IF W304-D = 8 OR W304-D = 9
             STRING  W304-RESULT DELIMITED BY "_"
               W304-DECENAS(8) DELIMITED BY "_"
               W304-EOF  DELIMITED BY "#"
             INTO W304-RESULT
             IF W304-D = 9 OR W304-U > 0
               STRING  W304-RESULT DELIMITED BY "_"
                 "-_" DELIMITED BY "_"
                 W304-EOF  DELIMITED BY "#"
               INTO W304-RESULT
             END-IF
             COMPUTE W304-D = W304-D - 8
           END-IF.

           IF W304-D > 0
             IF W304-D = 1 AND W304-U <> 0
                 STRING  W304-RESULT DELIMITED BY "_"
                   W304-DECENAS-1(W304-U) DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
               MOVE 0 TO W304-U
             ELSE
                 STRING  W304-RESULT DELIMITED BY "_"
                   W304-DECENAS(W304-D) DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
                 IF W304-U = 1
                   STRING  W304-RESULT DELIMITED BY "_"
                     " ET _" DELIMITED BY "_"
                     W304-EOF  DELIMITED BY "#"
                   INTO W304-RESULT
                 END-IF
                 IF W304-U > 1
                   STRING  W304-RESULT DELIMITED BY "_"
                     "-_" DELIMITED BY "_"
                     W304-EOF  DELIMITED BY "#"
                   INTO W304-RESULT
                 END-IF
             END-IF
           END-IF.


       304-CDU-PARSE-U.
           IF W304-U > 0
             STRING  W304-RESULT DELIMITED BY "_"
               W304-UNIDADES(W304-U) DELIMITED BY "_"
               W304-EOF  DELIMITED BY "#"
               INTO W304-RESULT
           END-IF.


       304-CDU-CALC.

           COMPUTE W304-IDX = 3 * (W304-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W304-CHARS(W304-IDX)) TO W304-C.
           ADD 1 TO W304-IDX.
           MOVE FUNCTION NUMVAL(W304-CHARS(W304-IDX)) TO W304-D.
           ADD 1 TO W304-IDX.
           MOVE FUNCTION NUMVAL(W304-CHARS(W304-IDX)) TO W304-U.

           COMPUTE W304-CDU = W304-C * 100 + W304-D * 10 + W304-U.



       304-SEGMENT.

           PERFORM 304-CDU-CALC.

           IF ( W304-PART = 1 AND W304-CDU > 0 )
                 PERFORM 304-CDU-PARSE-C THROUGH 304-CDU-PARSE-U
                 STRING  W304-RESULT DELIMITED BY "_"
                   " MILLARD _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT

               COMPUTE W304-MILLAR = W304-CDU * 1000
           END-IF

           IF ( W304-PART = 2 AND W304-CDU > 0 )
               PERFORM 304-CDU-PARSE-C THROUGH 304-CDU-PARSE-U
               IF W304-CDU = 1
                 STRING  W304-RESULT DELIMITED BY "_"
                   " MILLION _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
               ELSE
                 STRING  W304-RESULT DELIMITED BY "_"
                   " MILLIONS _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
             END-IF
           END-IF.

           IF ( W304-PART = 3 AND W304-CDU > 0 )
                 PERFORM 304-CDU-PARSE-C THROUGH 304-CDU-PARSE-U
                 STRING  W304-RESULT DELIMITED BY "_"
                   " MILLE _" DELIMITED BY "_"
                   W304-EOF  DELIMITED BY "#"
                 INTO W304-RESULT
           END-IF.

           IF ( W304-PART = 4 AND W304-CDU > 0 )
               PERFORM 304-CDU-PARSE-C THROUGH 304-CDU-PARSE-U
           END-IF.


       304-CONVERT.

           MOVE "_" TO W304-RESULT.

           MOVE  0   TO    W304-MILLAR.

           PERFORM 304-SEGMENT
             VARYING W304-PART
             FROM 1 BY 1 UNTIL W304-PART > 4.


            STRING  W304-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W304-RESULT.

