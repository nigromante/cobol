
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

           MOVE 1000000000 TO W305VAL(1).
           MOVE 1000000    TO W305VAL(2).
           MOVE 1000       TO W305VAL(3).
           MOVE 1       TO W305VAL(4).

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
             COMPUTE W305-DU2  = W305-D2*10 + W305-U2
           END-IF.




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



       305-1-PART.
           PERFORM 305-CDU-CALC THROUGH 305-CDU-CALC-2.

           IF ( W305-PART = 1 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             IF W305-CDU > 1
               STRING  W305-RESULT DELIMITED BY "_"
                 "BILHOES _" DELIMITED BY "_"
                 W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
             ELSE
               STRING  W305-RESULT DELIMITED BY "_"
                 "BILHAO _" DELIMITED BY "_"
                 W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
             END-IF
             IF W305-TAB(1,6) > 0
               STRING  W305-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
             END-IF
           END-IF.


       305-2-PART.
           IF (W305-PART = 2 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             IF W305-CDU > 1
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
             IF W305-TAB(2,6) > 0
               STRING  W305-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
             END-IF
           END-IF.


       305-3-PART.
           IF ( W305-PART = 3 AND W305-CDU >0 )
             IF (W305-CDU > 1)
               PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
             END-IF

             STRING  W305-RESULT DELIMITED BY "_"
               "MIL _" DELIMITED BY "_"
               W305-EOF  DELIMITED BY "#"
             INTO W305-RESULT

             IF W305-CDU2 > 0 AND W305-DU2 = 0
               STRING  W305-RESULT DELIMITED BY "_"
                 "E _" DELIMITED BY "_"
                 W305-EOF  DELIMITED BY "#"
               INTO W305-RESULT
             END-IF
           END-IF.


       305-4-PART.
           IF ( W305-PART = 4 AND W305-CDU > 0 )
             PERFORM 305-CDU-PARSE-C THROUGH 305-CDU-PARSE-U
           END-IF.


       305-CALCULATE.
           PERFORM VARYING W305-PART FROM 1 BY 1 UNTIL W305-PART > 4
             COMPUTE W305-IDX = 3 * (W305-PART - 1) + 1

             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-C
             ADD 1 TO W305-IDX
             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-D
             ADD 1 TO W305-IDX
             MOVE FUNCTION NUMVAL(W305-CHARS(W305-IDX)) TO W305-U

             MOVE W305-C  TO W305-TAB(W305-PART,1)
             MOVE W305-D  TO W305-TAB(W305-PART,2)
             MOVE W305-U  TO W305-TAB(W305-PART,3)

             COMPUTE  W305-TAB(W305-PART,4)
                 =  W305-C * 100 + W305-D * 10 + W305-U

             COMPUTE W305-TAB(W305-PART,5)
                 = W305-D * 10 + W305-U

             MOVE 0 TO W305-TAB(W305-PART,6)
             MOVE 0 TO W305-TAB(W305-PART,7)
           END-PERFORM.

           PERFORM VARYING W305-PART FROM 1 BY 1 UNTIL W305-PART > 3
             MOVE 0 TO W305-AUX
             COMPUTE W305-IDX2 = W305-PART + 1
             PERFORM VARYING W305-IDX
               FROM W305-IDX2  BY 1 UNTIL W305-IDX > 4

               COMPUTE W305K=W305VAL(W305-IDX)*W305-TAB(W305-IDX,4)
               ADD W305K TO W305-AUX
             END-PERFORM
             MOVE W305-AUX TO W305-TAB(W305-PART,6)
           END-PERFORM.



      *    FUNCION DE ENTRADA PRINCIPAL
       305-CONVERT.

           PERFORM 305-CALCULATE.

           MOVE "_" TO W305-RESULT.

           MOVE  0   TO    W305-MILLAR.

           PERFORM 305-1-PART THROUGH 305-4-PART
             VARYING W305-PART
             FROM 1 BY 1 UNTIL W305-PART > 4.


            STRING  W305-RESULT DELIMITED BY "_"
             " " DELIMITED BY SIZE
             INTO W305-RESULT.

