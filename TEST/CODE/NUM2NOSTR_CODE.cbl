
       306-INIT.

           MOVE  "_#"            TO  W306-EOF.

           MOVE "EN _"          TO  W306-UNIDADES(1).
           MOVE "TO _"          TO  W306-UNIDADES(2).
           MOVE "TRE _"        TO  W306-UNIDADES(3).
           MOVE "FIRE _"         TO  W306-UNIDADES(4).
           MOVE "FEM _"         TO  W306-UNIDADES(5).
           MOVE "SEKS _"          TO  W306-UNIDADES(6).
           MOVE "SJU _"        TO  W306-UNIDADES(7).
           MOVE "ATTE _"        TO  W306-UNIDADES(8).
           MOVE "NI _"         TO  W306-UNIDADES(9).

           MOVE "ELLEVE _"       TO  W306-DECENAS-1(1).
           MOVE "TOLVE _"       TO  W306-DECENAS-1(2).
           MOVE "TRETTEN _"     TO  W306-DECENAS-1(3).
           MOVE "FJORTEN _"     TO  W306-DECENAS-1(4).
           MOVE "FEMTEN _"     TO  W306-DECENAS-1(5).
           MOVE "SEKSTEN _"      TO  W306-DECENAS-1(6).
           MOVE "SYTTEN _"    TO  W306-DECENAS-1(7).
           MOVE "ATTEN _"     TO  W306-DECENAS-1(8).
           MOVE "NITTEN _"     TO  W306-DECENAS-1(9).

           MOVE "TI_"          TO  W306-DECENAS(1).
           MOVE "TJUE_"       TO  W306-DECENAS(2).
           MOVE "TRETTI_"       TO  W306-DECENAS(3).
           MOVE "FORTI_"        TO  W306-DECENAS(4).
           MOVE "FEMTI_"        TO  W306-DECENAS(5).
           MOVE "SEKSTI_"        TO  W306-DECENAS(6).
           MOVE "SYTTI_"      TO  W306-DECENAS(7).
           MOVE "ATTI_"       TO  W306-DECENAS(8).
           MOVE "NITTI_"       TO  W306-DECENAS(9).


           MOVE 1000000000 TO W306VAL(1).
           MOVE 1000000    TO W306VAL(2).
           MOVE 1000       TO W306VAL(3).
           MOVE 1       TO W306VAL(4).

       306-CDU-PARSE.

           IF W306-C > 0
             IF W306-C > 1
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-UNIDADES(W306-C) DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
               INTO W306-RESULT
             END-IF

             STRING  W306-RESULT DELIMITED BY "_"
               "HUNDRE _" DELIMITED BY "_"
               W306-EOF  DELIMITED BY "#"
               INTO W306-RESULT

               IF W306-D > 0 OR W306-U > 0
                 STRING  W306-RESULT DELIMITED BY "_"
                   "OG _" DELIMITED BY "_"
                   W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT

               END-IF
           END-IF.

           IF W306-D > 0
             IF W306-D = 1 AND W306-U <> 0
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-DECENAS-1(W306-U) DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
               MOVE 0 TO W306-U
             ELSE
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-DECENAS(W306-D) DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT

                 IF W306-U = 0
                   STRING  W306-RESULT DELIMITED BY "_"
                     " _" DELIMITED BY "_"
                     W306-EOF  DELIMITED BY "#"
                   INTO W306-RESULT
                 END-IF
             END-IF
           END-IF.

           IF W306-U > 0
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-UNIDADES(W306-U) DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
           END-IF.



       306-CDU-CALC.

           COMPUTE W306-IDX = 3 * (W306-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-C.
           ADD 1 TO W306-IDX.
           MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-D.
           ADD 1 TO W306-IDX.
           MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-U.

           COMPUTE W306-CDU = W306-C * 100 + W306-D * 10 + W306-U.



       306-SEGMENT.

           PERFORM 306-CDU-CALC.

           IF (W306-PART = 1 AND W306-CDU > 0)
             PERFORM 306-CDU-PARSE
               STRING  W306-RESULT DELIMITED BY "_"
                 "MILLIARD _" DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
           END-IF.

           IF (W306-PART = 2)
             COMPUTE W306-MILLAR = W306-CDU + W306-MILLAR
             IF W306-MILLAR > 0
               PERFORM 306-CDU-PARSE
               STRING  W306-RESULT DELIMITED BY "_"
                 "MILLION _" DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
             END-IF
           END-IF.

           IF (W306-PART = 3 AND W306-CDU > 0)
             IF W306-CDU > 1
               PERFORM 306-CDU-PARSE
             END-IF
             STRING  W306-RESULT DELIMITED BY "_"
               "TUSEN _" DELIMITED BY "_"
               W306-EOF  DELIMITED BY "#"
             INTO W306-RESULT

             IF W306-TAB(3,6) > 0
               STRING  W306-RESULT DELIMITED BY "_"
                 "OG _" DELIMITED BY "_"
                 W306-EOF  DELIMITED BY "#"
               INTO W306-RESULT
             END-IF
           END-IF.

           IF ( W306-PART = 4 AND W306-CDU > 0 )
             PERFORM 306-CDU-PARSE
           END-IF.




       306-CALCULATE.
           PERFORM VARYING W306-PART FROM 1 BY 1 UNTIL W306-PART > 4
             COMPUTE W306-IDX = 3 * (W306-PART - 1) + 1

             MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-C
             ADD 1 TO W306-IDX
             MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-D
             ADD 1 TO W306-IDX
             MOVE FUNCTION NUMVAL(W306-CHARS(W306-IDX)) TO W306-U

             MOVE W306-C  TO W306-TAB(W306-PART,1)
             MOVE W306-D  TO W306-TAB(W306-PART,2)
             MOVE W306-U  TO W306-TAB(W306-PART,3)

             COMPUTE  W306-TAB(W306-PART,4)
                 =  W306-C * 100 + W306-D * 10 + W306-U

             COMPUTE W306-TAB(W306-PART,5)
                 = W306-D * 10 + W306-U

             MOVE 0 TO W306-TAB(W306-PART,6)
             MOVE 0 TO W306-TAB(W306-PART,7)
           END-PERFORM.

           PERFORM VARYING W306-PART FROM 1 BY 1 UNTIL W306-PART > 3
             MOVE 0 TO W306-AUX
             COMPUTE W306-IDX2 = W306-PART + 1
             PERFORM VARYING W306-IDX
               FROM W306-IDX2  BY 1 UNTIL W306-IDX > 4

               COMPUTE W306K=W306VAL(W306-IDX)*W306-TAB(W306-IDX,4)
               ADD W306K TO W306-AUX
             END-PERFORM
             MOVE W306-AUX TO W306-TAB(W306-PART,6)
           END-PERFORM.




       306-CONVERT.

           PERFORM 306-CALCULATE.

           DISPLAY  W306-TABLE(1).
           DISPLAY  W306-TABLE(2).
           DISPLAY  W306-TABLE(3).
           DISPLAY  W306-TABLE(4).
           DISPLAY  W306-TABLE(5).

           MOVE "_" TO W306-RESULT.

           MOVE  0   TO    W306-MILLAR.

           PERFORM 306-SEGMENT
             VARYING W306-PART
             FROM 1 BY 1 UNTIL W306-PART > 4.


            STRING  W306-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W306-RESULT.

