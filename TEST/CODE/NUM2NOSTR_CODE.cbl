
       306-INIT.

           MOVE "EN _"       TO  W306-UNIDADES(1).
           MOVE "TO _"       TO  W306-UNIDADES(2).
           MOVE "TRE _"      TO  W306-UNIDADES(3).
           MOVE "FIRE _"     TO  W306-UNIDADES(4).
           MOVE "FEM _"      TO  W306-UNIDADES(5).
           MOVE "SEKS _"     TO  W306-UNIDADES(6).
           MOVE "SJU _"      TO  W306-UNIDADES(7).
           MOVE "ATTE _"     TO  W306-UNIDADES(8).
           MOVE "NI _"       TO  W306-UNIDADES(9).

           MOVE "ELLEVE _"   TO  W306-DECENAS-1(1).
           MOVE "TOLVE _"    TO  W306-DECENAS-1(2).
           MOVE "TRETTEN _"  TO  W306-DECENAS-1(3).
           MOVE "FJORTEN _"  TO  W306-DECENAS-1(4).
           MOVE "FEMTEN _"   TO  W306-DECENAS-1(5).
           MOVE "SEKSTEN _"  TO  W306-DECENAS-1(6).
           MOVE "SYTTEN _"   TO  W306-DECENAS-1(7).
           MOVE "ATTEN _"    TO  W306-DECENAS-1(8).
           MOVE "NITTEN _"    TO  W306-DECENAS-1(9).

           MOVE "TI_"        TO  W306-DECENAS(1).
           MOVE "TJUE_"      TO  W306-DECENAS(2).
           MOVE "TRETTI_"    TO  W306-DECENAS(3).
           MOVE "FORTI_"     TO  W306-DECENAS(4).
           MOVE "FEMTI_"     TO  W306-DECENAS(5).
           MOVE "SEKSTI_"    TO  W306-DECENAS(6).
           MOVE "SYTTI_"     TO  W306-DECENAS(7).
           MOVE "ATTI_"      TO  W306-DECENAS(8).
           MOVE "NITTI_"     TO  W306-DECENAS(9).



       306-CDU-PARSE.

           IF W300-C > 0
             IF W300-C > 1
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-UNIDADES(W300-C) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W306-RESULT
             END-IF

             STRING  W306-RESULT DELIMITED BY "_"
               "HUNDRE _" DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W306-RESULT

               IF W300-D > 0 OR W300-U > 0
                 STRING  W306-RESULT DELIMITED BY "_"
                   "OG _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT

               END-IF
           END-IF.

           IF W300-D > 0
             IF W300-D = 1 AND W300-U <> 0
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-DECENAS-1(W300-U) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
               MOVE 0 TO W300-U
             ELSE
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-DECENAS(W300-D) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT

                 IF W300-U = 0
                   STRING  W306-RESULT DELIMITED BY "_"
                     " _" DELIMITED BY "_"
                     W300-EOF  DELIMITED BY "#"
                   INTO W306-RESULT
                 END-IF
             END-IF
           END-IF.

           IF W300-U > 0
               STRING  W306-RESULT DELIMITED BY "_"
                 W306-UNIDADES(W300-U) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
           END-IF.



       306-CDU-CALC.
           MOVE W300-TAB(W300-PART,1) TO W300-C.
           MOVE W300-TAB(W300-PART,2) TO W300-D.
           MOVE W300-TAB(W300-PART,3) TO W300-U.
           MOVE W300-TAB(W300-PART,4) TO w300-CDU.
           MOVE W300-TAB(W300-PART,5) TO w300-DU.



       306-SEGMENT.

           IF (W300-PART = 1 AND w300-CDU > 0)
             PERFORM 306-CDU-PARSE
               STRING  W306-RESULT DELIMITED BY "_"
                 "MILLIARD _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
           END-IF.

           IF (W300-PART = 2 AND w300-CDU >0)
               PERFORM 306-CDU-PARSE
               STRING  W306-RESULT DELIMITED BY "_"
                 "MILLION _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W306-RESULT
           END-IF.

           IF (W300-PART = 3 AND w300-CDU > 0)
             IF w300-CDU > 1
               PERFORM 306-CDU-PARSE
             END-IF
             STRING  W306-RESULT DELIMITED BY "_"
               "TUSEN _" DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
             INTO W306-RESULT

             IF W300-TAB(3,6) > 0
               STRING  W306-RESULT DELIMITED BY "_"
                 "OG _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W306-RESULT
             END-IF
           END-IF.

           IF (W300-PART = 4 AND w300-CDU > 0)
             PERFORM 306-CDU-PARSE
           END-IF.



       306-CONVERT.

           MOVE "_" TO W306-RESULT.

           MOVE W306-NUMERO   TO W300-NUMERO.
           PERFORM 300-CALCULATE.


           PERFORM 306-CDU-CALC THROUGH 306-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W306-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W306-RESULT.

