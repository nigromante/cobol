
       307-CONVERT.

           MOVE "_" TO W300-RESULT.

           PERFORM 307-INIT.

           PERFORM 300-CALCULATE.

           PERFORM 307-CDU-CALC THROUGH 307-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMiTED BY SIZE
             INTO W300-RESULT.



       307-INIT.

           MOVE "I_"             TO  W307-UNIDADES(1).
           MOVE "II_"            TO  W307-UNIDADES(2).
           MOVE "III_"           TO  W307-UNIDADES(3).
           MOVE "IV_"         TO  W307-UNIDADES(4).
           MOVE "V_"          TO  W307-UNIDADES(5).
           MOVE "VI_"           TO  W307-UNIDADES(6).
           MOVE "VII_"          TO  W307-UNIDADES(7).
           MOVE "VIII_"           TO  W307-UNIDADES(8).
           MOVE "IX_"          TO  W307-UNIDADES(9).

           MOVE "XI_"           TO  W307-DECENAS-1(1).
           MOVE "XII_"           TO  W307-DECENAS-1(2).
           MOVE "XIII_"          TO  W307-DECENAS-1(3).
           MOVE "XIV_"        TO  W307-DECENAS-1(4).
           MOVE "XV_"         TO  W307-DECENAS-1(5).
           MOVE "XVI_"      TO  W307-DECENAS-1(6).
           MOVE "XVII_"     TO  W307-DECENAS-1(7).
           MOVE "XVIII_"      TO  W307-DECENAS-1(8).
           MOVE "XIX_"     TO  W307-DECENAS-1(9).

           MOVE "X_"           TO  W307-DECENAS(1).
           MOVE "XX_"         TO  W307-DECENAS(2).
           MOVE "XXX_"        TO  W307-DECENAS(3).
           MOVE "XL_"       TO  W307-DECENAS(4).
           MOVE "L_"      TO  W307-DECENAS(5).
           MOVE "LX_"        TO  W307-DECENAS(6).
           MOVE "LXX_"        TO  W307-DECENAS(7).
           MOVE "LXXX"        TO  W307-DECENAS(8).
           MOVE "XC_"        TO  W307-DECENAS(9).

           MOVE "C_"           TO  W307-CENTENAS(1).
           MOVE "CC_"     TO  W307-CENTENAS(2).
           MOVE "CCC_"    TO  W307-CENTENAS(3).
           MOVE "CD_"  TO  W307-CENTENAS(4).
           MOVE "D_"     TO  W307-CENTENAS(5).
           MOVE "DC_"    TO  W307-CENTENAS(6).
           MOVE "DCC_"    TO  W307-CENTENAS(7).
           MOVE "DCCC_"    TO  W307-CENTENAS(8).
           MOVE "CM_"    TO  W307-CENTENAS(9).



       307-CDU-CALC.

           MOVE W300-TAB(W300-PART,1) TO W300-C.
           MOVE W300-TAB(W300-PART,2) TO W300-D.
           MOVE W300-TAB(W300-PART,3) TO W300-U.
           MOVE W300-TAB(W300-PART,4) TO w300-CDU.
           MOVE W300-TAB(W300-PART,5) TO w300-DU.



       307-SEGMENT.

           IF (W300-PART = 1 OR W300-PART = 3)  AND (W300-CDU > 0)
               IF (W300-CDU > 1)
                 PERFORM 307-CDU-PARSE
               END-IF
               STRING  W300-RESULT DELIMITED BY "_"
                 "M_" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.

           IF (W300-PART = 2) AND W300-TAB(2,7) > 0
               IF W300-TAB(2,7) > 1
                 PERFORM 307-CDU-PARSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "MILLONES _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               ELSE
                 STRING  W300-RESULT DELIMITED BY "_"
                   "UN MILLON _" DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               END-IF
           END-IF.

           IF ( W300-PART = 4 AND W300-CDU > 0 )
               PERFORM 307-CDU-PARSE
           END-IF.



       307-CDU-PARSE.

           IF W300-C > 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W307-CENTENAS(W300-C) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
           END-IF.

           IF W300-D > 0
             IF W300-D = 1 AND W300-U <> 0
                 STRING  W300-RESULT DELIMITED BY "_"
                   W307-DECENAS-1(W300-U) DELIMITED BY "_"
                   W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W300-U
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 W307-DECENAS(W300-D) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
             END-IF
           END-IF.

           IF W300-U > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W307-UNIDADES(W300-U) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.



