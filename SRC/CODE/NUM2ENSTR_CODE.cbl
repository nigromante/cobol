
       302-VERSION.
           DISPLAY "VERSION : "  LINE 2  POSITION 10.
           DISPLAY W302-VERSION  LINE 2  POSITION 20.

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



       302-CDU-PARSE.

           IF W302-C > 0

             MOVE W302-UNIDADES(W302-C) TO W300-In
             PERFORM 300-COPY-STRING

             MOVE "HUNDRED _" TO W300-In
             PERFORM 300-COPY-STRING
           END-IF.

           IF W302-D > 0
             IF W302-D = 1 AND W302-U <> 0
               MOVE W302-DECENAS-1(W302-U)   TO  W300-In
               PERFORM 300-COPY-STRING
               MOVE 0 TO W302-U
             ELSE
               MOVE W302-DECENAS(W302-D) TO W300-In
               PERFORM 300-COPY-STRING
             END-IF
           END-IF.

           IF W302-U > 0
             MOVE W302-UNIDADES(W302-U)   TO  W300-In
             PERFORM 300-COPY-STRING
           END-IF.



       302-CDU-CALC.

           COMPUTE W302-IDX = 3 * (W302-PART - 1) + 1.

           MOVE FUNCTION NUMVAL(W302-CHARS(W302-IDX)) TO W302-C.
           ADD 1 TO W302-IDX.
           MOVE FUNCTION NUMVAL(W302-CHARS(W302-IDX)) TO W302-D.
           ADD 1 TO W302-IDX.
           MOVE FUNCTION NUMVAL(W302-CHARS(W302-IDX)) TO W302-U.

           COMPUTE W302-CDU = W302-C * 100 + W302-D * 10 + W302-U.



       302-SEGMENT.

           PERFORM 302-CDU-CALC.

           IF (W302-PART = 1 AND W302-CDU > 0)
             PERFORM 302-CDU-PARSE
             MOVE "BILLION _" TO W300-In
             PERFORM 300-COPY-STRING
           END-IF.

           IF (W302-PART = 2)
             COMPUTE W302-MILLAR = W302-CDU + W302-MILLAR
             IF W302-MILLAR > 0
               PERFORM 302-CDU-PARSE
               MOVE "MILLION _" TO W300-In
               PERFORM 300-COPY-STRING
             END-IF
           END-IF.

           IF (W302-PART = 3 AND W302-CDU > 0)
               PERFORM 302-CDU-PARSE
               MOVE "THOUSAND _" TO W300-In
               PERFORM 300-COPY-STRING
           END-IF.

           IF ( W302-PART = 4 AND W302-CDU > 0 )
             PERFORM 302-CDU-PARSE
           END-IF.



       302-CONVERT.

           MOVE  0   TO    W302-MILLAR.

           PERFORM 300-RESET.

           PERFORM 302-SEGMENT
             VARYING W302-PART
             FROM 1 BY 1 UNTIL W302-PART > 4.

           PERFORM 300-CUT-LAST-CHAR.

           MOVE W300-Out TO W302-RESULT.


