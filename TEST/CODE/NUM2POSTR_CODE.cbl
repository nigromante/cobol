
       305-INIT.

           MOVE  "_#"              TO  W305-EOF.

           MOVE "UM _"             TO  W305-UNIDADES(1).
           MOVE "DOIS _"           TO  W305-UNIDADES(2).
           MOVE "TRES _"           TO  W305-UNIDADES(3).
           MOVE "QUATRO _"         TO  W305-UNIDADES(4).
           MOVE "CINCO _"          TO  W305-UNIDADES(5).
           MOVE "SEIS _"           TO  W305-UNIDADES(6).
           MOVE "SETE _"           TO  W305-UNIDADES(7).
           MOVE "OITO _"           TO  W305-UNIDADES(8).
           MOVE "NOVE _"           TO  W305-UNIDADES(9).

           MOVE "ONZE _"           TO  W305-DECENAS-1(1).
           MOVE "DOZE _"           TO  W305-DECENAS-1(2).
           MOVE "TREZE _"          TO  W305-DECENAS-1(3).
           MOVE "QUATORZE _"       TO  W305-DECENAS-1(4).
           MOVE "QUINZE _"         TO  W305-DECENAS-1(5).
           MOVE "DEZESEIS _"       TO  W305-DECENAS-1(6).
           MOVE "DEZESETE _"       TO  W305-DECENAS-1(7).
           MOVE "DEZOITO _"        TO  W305-DECENAS-1(8).
           MOVE "DEZENOVE _"       TO  W305-DECENAS-1(9).

           MOVE "DEZ _"            TO  W305-DECENAS(1).
           MOVE "VINTE _"          TO  W305-DECENAS(2).
           MOVE "TRINTA _"         TO  W305-DECENAS(3).
           MOVE "QUARENTA _"       TO  W305-DECENAS(4).
           MOVE "CINQUENTA _"      TO  W305-DECENAS(5).
           MOVE "SESSENTA _"       TO  W305-DECENAS(6).
           MOVE "SETENTA _"        TO  W305-DECENAS(7).
           MOVE "OITENTA _"        TO  W305-DECENAS(8).
           MOVE "NOVENTA _"        TO  W305-DECENAS(9).

           MOVE "CEM _"            TO  W305-CENTENAS(1).
           MOVE "DUZENTOS _"       TO  W305-CENTENAS(2).
           MOVE "TREZENTOS _"      TO  W305-CENTENAS(3).
           MOVE "QUATROCENTOS _"   TO  W305-CENTENAS(4).
           MOVE "QUINHENTOS _"     TO  W305-CENTENAS(5).
           MOVE "SEISCENTOS _"     TO  W305-CENTENAS(6).
           MOVE "SETECENTOS _"     TO  W305-CENTENAS(7).
           MOVE "OITOCENTOS _"     TO  W305-CENTENAS(8).
           MOVE "NOVOCENTOS _"     TO  W305-CENTENAS(9).



       305-CDU-PARSE-C.

           IF W305-C > 0
             IF W305-C = 1
               IF W305-D= 0 AND W305-U = 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   "CEM _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   "CENTO _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   W305-CENTENAS(W305-C) DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
             END-IF

             IF W305-DU > 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   "E _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
             END-IF
           END-IF.


       305-CDU-PARSE-D.

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
                   "E _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             END-IF
           END-IF.


       305-CDU-PARSE-U.

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
           COMPUTE W305-DU  = W305-D * 10 + W305-U.


       305-CDU-CALC-2.
           IF W305-PART = 1 OR W305-PART = 3
             COMPUTE W305-IDX2 = 3 * (W305-PART - 0) + 1

             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX2)) TO W305-C2
             ADD 1 TO W305-IDX2
             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX2)) TO W305-D2
             ADD 1 TO W305-IDX2
             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX2)) TO W305-U2

             COMPUTE W305-CDU2 = W305-C2*100 + W305-D2*10 + W305-U2
           END-IF.


       305-SEGMENT.

           PERFORM 305-CDU-CALC.
           PERFORM 305-CDU-CALC-2.

           IF (W305-PART = 1 OR W305-PART = 3)

             IF (W305-PART = 1)
               COMPUTE W305-MILLAR = W305-CDU * 1000
             END-IF

             IF (W305-CDU > 0)
               IF (W305-CDU > 1)
                 PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
               END-IF
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MIL _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
                IF W305-CDU2 > 0
                 STRING  W305-RESULT DELIMITED BY "_"
                   "E _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
                END-IF
             END-IF
           END-IF.

           IF (W305-PART = 2)
             COMPUTE W305-MILLAR = W305-CDU + W305-MILLAR
             IF W305-MILLAR > 0
               PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
               IF W305-MILLAR > 1
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MILHOES _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               ELSE
                 STRING  W305-RESULT DELIMITED BY "_"
                   "MILHAO _" DELIMITED BY "_"
                   W305-EOF  DELIMITED BY "#"
                 INTO W305-RESULT
               END-IF
             END-IF
           END-IF.

           IF ( W305-PART = 4 AND W305-CDU > 0 )
               PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
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

