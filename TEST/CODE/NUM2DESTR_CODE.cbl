
       303-INIT.

           MOVE  "_#"              TO  W303-EOF.

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



       303-CDU-PARSE.

           IF W303-C > 0
             STRING  W303-RESULT DELIMITED BY "_"
               W303-CENTENAS(W303-C) DELIMITED BY "_"
               W303-EOF  DELIMITED BY "#"
               INTO W303-RESULT
           END-IF.

           IF W303-U > 0  AND W303-D <> 1
             STRING  W303-RESULT DELIMITED BY "_"
               W303-UNIDADES(W303-U) DELIMITED BY "_"
               W303-EOF  DELIMITED BY "#"
               INTO W303-RESULT
             IF W303-D > 0
                 STRING  W303-RESULT DELIMITED BY "_"
                   "UND_" DELIMITED BY "_"
                   W303-EOF  DELIMITED BY "#"
                 INTO W303-RESULT
             END-IF
           END-IF.

           IF W303-D > 0
             IF W303-D = 1 AND W303-U <> 0
                 STRING  W303-RESULT DELIMITED BY "_"
                   W303-DECENAS-1(W303-U) DELIMITED BY "_"
                   W303-EOF  DELIMITED BY "#"
                 INTO W303-RESULT
               MOVE 0 TO W303-U
             ELSE
                 STRING  W303-RESULT DELIMITED BY "_"
                   W303-DECENAS(W303-D) DELIMITED BY "_"
                   W303-EOF  DELIMITED BY "#"
                 INTO W303-RESULT
             END-IF
           END-IF.



       303-CDU-CALC.

           COMPUTE W303-IDX = 3 * (W303-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W303-CHARS(W303-IDX)) TO W303-C.
           ADD 1 TO W303-IDX.
           MOVE FUNCTION NUMVAL(W303-CHARS(W303-IDX)) TO W303-D.
           ADD 1 TO W303-IDX.
           MOVE FUNCTION NUMVAL(W303-CHARS(W303-IDX)) TO W303-U.

           COMPUTE W303-CDU = W303-C * 100 + W303-D * 10 + W303-U.


       303-SEGMENT.

           PERFORM 303-CDU-CALC.

           IF (W303-PART = 1 OR W303-PART = 3)

             IF (W303-PART = 1)
               COMPUTE W303-MILLAR = W303-CDU * 1000
             END-IF

             IF (W303-CDU > 0)
               IF (W303-CDU > 1)
                 PERFORM 303-CDU-PARSE
               END-IF
                 STRING  W303-RESULT DELIMITED BY "_"
                   "TAUSEND_" DELIMITED BY "_"
                   W303-EOF  DELIMITED BY "#"
                 INTO W303-RESULT
             END-IF
           END-IF.

           IF (W303-PART = 2)
             COMPUTE W303-MILLAR = W303-CDU + W303-MILLAR
             IF W303-MILLAR > 0
               IF W303-MILLAR = 1
                 STRING  W303-RESULT DELIMITED BY "_"
                   "EINE MILLION _" DELIMITED BY "_"
                   W303-EOF  DELIMITED BY "#"
                   INTO W303-RESULT
               ELSE
               PERFORM 303-CDU-PARSE
               STRING  W303-RESULT DELIMITED BY "_"
                 " MILLIONEN _" DELIMITED BY "_"
                 W303-EOF  DELIMITED BY "#"
                 INTO W303-RESULT
               END-IF
             END-IF
           END-IF.

           IF ( W303-PART = 4 AND W303-CDU > 0 )
               PERFORM 303-CDU-PARSE
           END-IF.


       303-CONVERT.

           MOVE "_" TO W303-RESULT.

           MOVE  0   TO    W303-MILLAR.

           PERFORM 303-SEGMENT
             VARYING W303-PART
             FROM 1 BY 1 UNTIL W303-PART > 4.


            STRING  W303-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W303-RESULT.

