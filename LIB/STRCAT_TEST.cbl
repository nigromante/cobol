
       300-TRACE.
           MOVE "STRCAT"   TO W001-Title.
           MOVE WS-Out     TO W001-Buffer.
           MOVE WS-Out-len TO W001-Buffer-Len.
           PERFORM 001-TRACE.
       
       300-TEST.

           MOVE "ABCD 1 2_" TO WS-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.

           MOVE "EFGH_" TO WS-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.
           
           MOVE " _" TO WS-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.

           MOVE "IJKL_" TO WS-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.
