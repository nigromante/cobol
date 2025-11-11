
       301-TRACE-RESULT.
           MOVE "STRCAT"   TO W001-Title.
           MOVE WS-Out     TO W001-Buffer.
           MOVE WS-Out-len TO W001-Buffer-Len.
           PERFORM 001-TRACE.
           DISPLAY "*".


       301-TRACE-INPUT.
           MOVE "NUMBER"   TO W001-Title.
           MOVE W301-Num   TO W001-Buffer.
           MOVE 12         TO W001-Buffer-Len.
           PERFORM 001-TRACE.


       301-TEST-BODY.
           PERFORM 301-TRACE-INPUT.
           PERFORM 301-LOOP.
           PERFORM 301-TRACE-RESULT.


       301-TEST.

           MOVE "000000000001" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000005" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000010" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000011" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000020" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000023" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000099" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000100" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000101" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000150" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000159" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000300" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000000990" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000001000" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000001001" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000001100" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000001101" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000021101" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000000620101" TO W301-Num.
           PERFORM 301-TEST-BODY.

           DISPLAY "---".  


           MOVE "000001789012" TO W301-Num.
           PERFORM 301-TEST-BODY.

           MOVE "000002789012" TO W301-Num.
           PERFORM 301-TEST-BODY.

