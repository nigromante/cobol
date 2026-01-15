
       302-CONVERT.

           MOVE "_" TO W300-RESULT.

           PERFORM 302-INIT.

           PERFORM 300-CALCULATE.

           MOVE  0   TO    W302-MILLAR.

           PERFORM 302-CDU-CALC THROUGH 302-SEGMENT
             VARYING W300-PART
             FROM 1 BY 1 UNTIL W300-PART > 4.


            STRING  W300-RESULT DELIMITED BY "_"
             " " DELIMITED BY SIZE
             INTO W300-RESULT.



       302-INIT.

           MOVE "ONE _"          TO  W302-UNIDADES(1).
           MOVE "TWO _"          TO  W302-UNIDADES(2).
           MOVE "THREE _"        TO  W302-UNIDADES(3).
           MOVE "FOUR _"         TO  W302-UNIDADES(4).
           MOVE "FIVE _"         TO  W302-UNIDADES(5).
           MOVE "SIX _"          TO  W302-UNIDADES(6).
           MOVE "SEVEN _"        TO  W302-UNIDADES(7).
           MOVE "EIGHT _"        TO  W302-UNIDADES(8).
           MOVE "NINE _"         TO  W302-UNIDADES(9).

           MOVE "ELEVEN _"       TO  W302-DECENAS-1(1).
           MOVE "TWELVE _"       TO  W302-DECENAS-1(2).
           MOVE "THIRTEEN _"     TO  W302-DECENAS-1(3).
           MOVE "FOURTEEN _"     TO  W302-DECENAS-1(4).
           MOVE "FIVETEEN _"     TO  W302-DECENAS-1(5).
           MOVE "SISTEEN _"      TO  W302-DECENAS-1(6).
           MOVE "SEVENTEEN _"    TO  W302-DECENAS-1(7).
           MOVE "EIGHTEEN _"     TO  W302-DECENAS-1(8).
           MOVE "NINETEEN _"     TO  W302-DECENAS-1(9).

           MOVE "TEN _"          TO  W302-DECENAS(1).
           MOVE "TWENTY _"       TO  W302-DECENAS(2).
           MOVE "THIRTY _"       TO  W302-DECENAS(3).
           MOVE "FORTY _"        TO  W302-DECENAS(4).
           MOVE "FIFTY _"        TO  W302-DECENAS(5).
           MOVE "SIXTY _"        TO  W302-DECENAS(6).
           MOVE "SEVENTY _"      TO  W302-DECENAS(7).
           MOVE "EIGHTY _"       TO  W302-DECENAS(8).
           MOVE "NINETY _"       TO  W302-DECENAS(9).



       302-CDU-CALC.

           MOVE W300-TAB(W300-PART,1) TO W302-C.
           MOVE W300-TAB(W300-PART,2) TO W302-D.
           MOVE W300-TAB(W300-PART,3) TO W302-U.
           MOVE W300-TAB(W300-PART,4) TO W302-CDU.
           MOVE W300-TAB(W300-PART,5) TO W302-DU.



       302-SEGMENT.

           PERFORM 302-CDU-CALC.

           IF (W300-PART = 1 AND W302-CDU > 0)
             PERFORM 302-CDU-PARSE
               STRING  W300-RESULT DELIMITED BY "_"
                 "BILLION _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
           END-IF.

           IF (W300-PART = 2)
             COMPUTE W302-MILLAR = W302-CDU + W302-MILLAR
             IF W302-MILLAR > 0
               PERFORM 302-CDU-PARSE
               STRING  W300-RESULT DELIMITED BY "_"
                 "MILLION _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF (W300-PART = 3 AND W302-CDU > 0)
               PERFORM 302-CDU-PARSE
               STRING  W300-RESULT DELIMITED BY "_"
                 "THOUSAND _" DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
           END-IF.

           IF ( W300-PART = 4 AND W302-CDU > 0 )
             PERFORM 302-CDU-PARSE
           END-IF.



       302-CDU-PARSE.

           IF W302-C > 0
             STRING  W300-RESULT DELIMITED BY "_"
               W302-UNIDADES(W302-C) DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT

             STRING  W300-RESULT DELIMITED BY "_"
               "HUNDRED _" DELIMITED BY "_"
               W300-EOF  DELIMITED BY "#"
               INTO W300-RESULT
           END-IF.

           IF W302-D > 0
             IF W302-D = 1 AND W302-U <> 0
               STRING  W300-RESULT DELIMITED BY "_"
                 W302-DECENAS-1(W302-U) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
               MOVE 0 TO W302-U
             ELSE
               STRING  W300-RESULT DELIMITED BY "_"
                 W302-DECENAS(W302-D) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
             END-IF
           END-IF.

           IF W302-U > 0
               STRING  W300-RESULT DELIMITED BY "_"
                 W302-UNIDADES(W302-U) DELIMITED BY "_"
                 W300-EOF  DELIMITED BY "#"
                 INTO W300-RESULT
           END-IF.



