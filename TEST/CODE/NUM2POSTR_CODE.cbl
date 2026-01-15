
      *    FUNCION DE ENTRADA PRINCIPAL
       305-CONVERT.

           MOVE "_" TO W300-RESULT.

           PERFORM 305-INIT.

           PERFORM 300-CALCULATE.

           PERFORM 305-1-PART THROUGH 305-4-PART
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMITED BY SIZE
             INTO W300-RESULT.


       305-INIT.

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

       305-CDU-CALC.

           MOVE W300-TAB(W300-PART,1) TO W305-C.
           MOVE W300-TAB(W300-PART,2) TO W305-D.
           MOVE W300-TAB(W300-PART,3) TO W305-U.
           MOVE W300-TAB(W300-PART,4) TO w305-CDU.
           MOVE W300-TAB(W300-PART,5) TO w305-DU.

       305-CDU-CALC-2.

           IF W300-PART = 1 OR W300-PART = 3
             COMPUTE W300-PART2 = W300-PART  + 1
             MOVE W300-TAB(W300-PART2,1) TO W305-C2
             MOVE W300-TAB(W300-PART2,2) TO W305-D2
             MOVE W300-TAB(W300-PART2,3) TO W305-U2
             MOVE W300-TAB(W300-PART2,4) TO w305-CDU2
             MOVE W300-TAB(W300-PART2,5) TO w305-DU2
           END-IF.




       305-CDU-PARSE-C.

           IF W305-C > 0
             IF W305-C = 1
               IF W305-D= 0 AND W305-U = 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CEM _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "CENTO _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   W305-CENTENAS(W305-C) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF

             IF W305-DU > 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "E _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.


       305-CDU-PARSE-D.

           IF W305-D > 0
             IF W305-D = 1 AND W305-U <> 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W305-DECENAS-1(W305-U) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W305-U
             ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   W305-DECENAS(W305-D) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               IF W305-U > 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   "E _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
             END-IF
           END-IF.


       305-CDU-PARSE-U.

           IF W305-U > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W305-UNIDADES(W305-U) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.



       305-1-PART.
           PERFORM 305-CDU-CALC THROUGH 305-CDU-CALC-2.

           IF ( W300-PART = 1 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             IF W305-CDU > 1
               STRING  W300-RESULT DELIMITED BY "_"
                 "BILHOES _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 "BILHAO _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
             IF W300-TAB(1,6) > 0
               STRING  W300-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
           END-IF.


       305-2-PART.
           IF (W300-PART = 2 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             IF W305-CDU > 1
               STRING  W300-RESULT DELIMITED BY "_"
                 "MILHOES _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 "MILHAO _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
             IF W300-TAB(2,6) > 0
               STRING  W300-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
           END-IF.


       305-3-PART.
           IF ( W300-PART = 3 AND W305-CDU >0 )
             IF (W305-CDU > 1)
               PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             END-IF

             STRING  W300-RESULT DELIMITED BY "_"
               "MIL _" DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
             INTO W300-RESULT

             IF W305-CDU2 > 0 AND W305-DU2 = 0
               STRING  W300-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
           END-IF.


       305-4-PART.
           IF ( W300-PART = 4 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
           END-IF.




