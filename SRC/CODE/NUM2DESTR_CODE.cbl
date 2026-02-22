
       303-CONVERT.

           MOVE "_" TO W300-RESULT.

           PERFORM 303-INIT.

           PERFORM 300-CALCULATE.

           MOVE  0   TO    W303-MILLAR.

           PERFORM 303-CDU-CALC THROUGH 303-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W300-RESULT.



       303-INIT.

           MOVE "EINS_"           TO  W303-UNIDADES(1).
           MOVE "ZWEI_"           TO  W303-UNIDADES(2).
           MOVE "DREI_"           TO  W303-UNIDADES(3).
           MOVE "VIER_"           TO  W303-UNIDADES(4).
           MOVE "FUNF_"           TO  W303-UNIDADES(5).
           MOVE "SECHS_"          TO  W303-UNIDADES(6).
           MOVE "SIEBEN_"         TO  W303-UNIDADES(7).
           MOVE "ACHT_"           TO  W303-UNIDADES(8).
           MOVE "NEUN_"           TO  W303-UNIDADES(9).

           MOVE "ELF_"           TO  W303-DECENAS-1(1).
           MOVE "ZWOLF_"           TO  W303-DECENAS-1(2).
           MOVE "DREIZEHN_"          TO  W303-DECENAS-1(3).
           MOVE "VIERZEHN_"        TO  W303-DECENAS-1(4).
           MOVE "FUNFZEHN_"         TO  W303-DECENAS-1(5).
           MOVE "SECHZEHN_"      TO  W303-DECENAS-1(6).
           MOVE "SiEBZEHN_"     TO  W303-DECENAS-1(7).
           MOVE "ACHTZEHN_"      TO  W303-DECENAS-1(8).
           MOVE "NEUNZEHN_"     TO  W303-DECENAS-1(9).

           MOVE "ZEHN_"           TO  W303-DECENAS(1).
           MOVE "ZWANZIG_"         TO  W303-DECENAS(2).
           MOVE "DREIZIG_"        TO  W303-DECENAS(3).
           MOVE "VIERZIG_"       TO  W303-DECENAS(4).
           MOVE "FUNFZIG_"      TO  W303-DECENAS(5).
           MOVE "SECHZIG_"        TO  W303-DECENAS(6).
           MOVE "SIEBZIG_"        TO  W303-DECENAS(7).
           MOVE "ACHTZIG_"        TO  W303-DECENAS(8).
           MOVE "NEUNZIG_"        TO  W303-DECENAS(9).

           MOVE "HUNDERT_"           TO  W303-CENTENAS(1).
           MOVE "ZWEIHUNDERT_"     TO  W303-CENTENAS(2).
           MOVE "DREIHUNDERT_"    TO  W303-CENTENAS(3).
           MOVE "VIERHUNDERT_"  TO  W303-CENTENAS(4).
           MOVE "FUNFHUNDERT_"     TO  W303-CENTENAS(5).
           MOVE "SECHSHUNDERT_"    TO  W303-CENTENAS(6).
           MOVE "SIEBENHUNDERT_"    TO  W303-CENTENAS(7).
           MOVE "ACHHUNDERT_"    TO  W303-CENTENAS(8).
           MOVE "NEUNHUNDERT_"    TO  W303-CENTENAS(9).



       303-CDU-CALC.
           MOVE W300-TAB(W300-PART,1) TO W303-C.
           MOVE W300-TAB(W300-PART,2) TO W303-D.
           MOVE W300-TAB(W300-PART,3) TO W303-U.
           MOVE W300-TAB(W300-PART,4) TO w303-CDU.
           MOVE W300-TAB(W300-PART,5) TO w303-DU.



       303-SEGMENT.

           IF (W300-PART = 1 OR W300-PART = 3)

             IF (W300-PART = 1)
               COMPUTE W303-MILLAR = W303-CDU * 1000
             END-IF

             IF (W303-CDU > 0)
               IF (W303-CDU > 1)
                 PERFORM 303-CDU-PARSE
               END-IF
                 STRING  W300-RESULT DELIMITED BY "_"
                   "TAUSEND_" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF (W300-PART = 2)
             COMPUTE W303-MILLAR = W303-CDU + W303-MILLAR
             IF W303-MILLAR > 0
               IF W303-MILLAR = 1
                 STRING  W300-RESULT DELIMITED BY "_"
                   "EINE MILLION _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                   INTO W300-RESULT
               ELSE
               PERFORM 303-CDU-PARSE
               STRING  W300-RESULT DELIMITED BY "_"
                 " MILLIONEN _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             END-IF
           END-IF.

           IF ( W300-PART = 4 AND W303-CDU > 0 )
               PERFORM 303-CDU-PARSE
           END-IF.



       303-CDU-PARSE.

           IF W303-C > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W303-CENTENAS(W303-C) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.

           IF W303-U > 0  AND W303-D <> 1
             STRING  W300-RESULT DELIMITED BY "_"
               W303-UNIDADES(W303-U) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             IF W303-D > 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "UND_" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF W303-D > 0
             IF W303-D = 1 AND W303-U <> 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W303-DECENAS-1(W303-U) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W303-U
             ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   W303-DECENAS(W303-D) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.



