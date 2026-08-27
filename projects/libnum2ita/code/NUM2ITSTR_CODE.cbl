
       308-CONVERT.

           PERFORM 308-INIT.

           PERFORM 300-CALCULATE.

           PERFORM 308-CDU-CALC THROUGH 308-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.



       308-INIT.

           MOVE "UNO_"             TO  W308-UNIDADES(1).
           MOVE "DUE_"            TO  W308-UNIDADES(2).
           MOVE "TRE_"           TO  W308-UNIDADES(3).
           MOVE "QUATTRO_"         TO  W308-UNIDADES(4).
           MOVE "CINQUE_"          TO  W308-UNIDADES(5).
           MOVE "SEI_"           TO  W308-UNIDADES(6).
           MOVE "SETTE_"          TO  W308-UNIDADES(7).
           MOVE "OTTO_"           TO  W308-UNIDADES(8).
           MOVE "NOVE_"          TO  W308-UNIDADES(9).

           MOVE "UNDICI_"           TO  W308-DECENAS-1(1).
           MOVE "DODICI_"           TO  W308-DECENAS-1(2).
           MOVE "TREDICO_"          TO  W308-DECENAS-1(3).
           MOVE "QUATTRODICI_"        TO  W308-DECENAS-1(4).
           MOVE "QUINDICI_"         TO  W308-DECENAS-1(5).
           MOVE "SEDICI_"      TO  W308-DECENAS-1(6).
           MOVE "DICIASETTE_"     TO  W308-DECENAS-1(7).
           MOVE "DICIOTTO_"      TO  W308-DECENAS-1(8).
           MOVE "DICIANNOVE_"     TO  W308-DECENAS-1(9).

           MOVE "DIECI_"           TO  W308-DECENAS(1).
           MOVE "VENTI_"         TO  W308-DECENAS(2).
           MOVE "TRENTA_"        TO  W308-DECENAS(3).
           MOVE "QUARANTA_"       TO  W308-DECENAS(4).
           MOVE "CINQUANTA_"      TO  W308-DECENAS(5).
           MOVE "SESSANTA_"        TO  W308-DECENAS(6).
           MOVE "SETTANTA_"        TO  W308-DECENAS(7).
           MOVE "OTTANTA_"        TO  W308-DECENAS(8).
           MOVE "NOVANTA_"        TO  W308-DECENAS(9).

           MOVE "CENTO_"           TO  W308-CENTENAS(1).
           MOVE "DUECENTO_"     TO  W308-CENTENAS(2).
           MOVE "TRECENTO_"    TO  W308-CENTENAS(3).
           MOVE "QUATTROCENTO_"  TO  W308-CENTENAS(4).
           MOVE "CINQUECENTO_"     TO  W308-CENTENAS(5).
           MOVE "SEICENTO_"    TO  W308-CENTENAS(6).
           MOVE "SETTECENTO_"    TO  W308-CENTENAS(7).
           MOVE "OTTOCENTO_"    TO  W308-CENTENAS(8).
           MOVE "NOVECENTO_"    TO  W308-CENTENAS(9).



       308-CDU-CALC.

           MOVE W300-TAB(W300-PART,1) TO W300-C.
           MOVE W300-TAB(W300-PART,2) TO W300-D.
           MOVE W300-TAB(W300-PART,3) TO W300-U.
           MOVE W300-TAB(W300-PART,4) TO w300-CDU.
           MOVE W300-TAB(W300-PART,5) TO w300-DU.



       308-SEGMENT.

           IF (W300-PART = 1 OR W300-PART = 3)  AND (W300-CDU > 0)
               IF (W300-CDU > 1)
                 PERFORM 308-CDU-PARSE
               END-IF
               STRING  W300-RESULT DELIMITED BY "_"
                 "MILLE_" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.

           IF (W300-PART = 2) AND W300-TAB(2,7) > 0
               IF W300-TAB(2,7) > 1
                 PERFORM 308-CDU-PARSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "MILIONI _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "UN MILIONE _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
           END-IF.

           IF ( W300-PART = 4 AND W300-CDU > 0 )
               PERFORM 308-CDU-PARSE
           END-IF.



       308-CDU-PARSE.

           IF W300-C > 0
             IF W300-C = 1
               IF W300-DU = 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CENTO_" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CENTO_" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   W308-CENTENAS(W300-C) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF W300-D > 0
             IF W300-D = 1 AND W300-U <> 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W308-DECENAS-1(W300-U) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W300-U
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 W308-DECENAS(W300-D) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
           END-IF.

           IF W300-U > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W308-UNIDADES(W300-U) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.



