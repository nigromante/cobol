
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


       301T-LOOP.
           PERFORM 301T-LOOPI 
             VARYING W301T-Idx FROM 1 BY 1 UNTIL W301T-Idx > 30.


       301T-LOOPI.
           MOVE W301T-Nums(W301T-Idx)  TO W301-Num.
           PERFORM 301-TEST-BODY.


       301T-LOOPINIT.

           MOVE 0 TO W301T-Nums(1).
           MOVE 1 TO W301T-Nums(2).
           MOVE 4 TO W301T-Nums(3).
           MOVE 10 TO W301T-Nums(4).
           MOVE 11 TO W301T-Nums(5).
           MOVE 15 TO W301T-Nums(6).
           MOVE 20 TO W301T-Nums(7).
           MOVE 22 TO W301T-Nums(8).
           MOVE 70 TO W301T-Nums(9).
           MOVE 99 TO W301T-Nums(10).

           MOVE 100 TO W301T-Nums(11).
           MOVE 101 TO W301T-Nums(12).
           MOVE 104 TO W301T-Nums(13).
           MOVE 110 TO W301T-Nums(14).
           MOVE 111 TO W301T-Nums(15).
           MOVE 215 TO W301T-Nums(16).
           MOVE 520 TO W301T-Nums(17).
           MOVE 622 TO W301T-Nums(18).
           MOVE 970 TO W301T-Nums(19).
           MOVE 999 TO W301T-Nums(20).
           
           MOVE 1000 TO W301T-Nums(21).
           MOVE 1001 TO W301T-Nums(22).
           MOVE 1004 TO W301T-Nums(23).
           MOVE 1110 TO W301T-Nums(24).
           MOVE 1111 TO W301T-Nums(25).
           MOVE 2015 TO W301T-Nums(26).
           MOVE 5020 TO W301T-Nums(27).
           MOVE 6022 TO W301T-Nums(28).
           MOVE 9870 TO W301T-Nums(29).
           MOVE 9999 TO W301T-Nums(30).

