
       300-TRACE.
           MOVE "STRCAT"   TO W001-Title.
           MOVE W300-Out     TO W001-Buffer.
           MOVE W300-Out-len TO W001-Buffer-Len.
           PERFORM 001-TRACE.
       
       300-TEST.

           MOVE "ABCD 1 2_" TO W300-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.

           MOVE "EFGH_" TO W300-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.
           
           MOVE " _" TO W300-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.

           MOVE "IJKL_" TO W300-In.
           PERFORM 300-COPY-STRING.
           PERFORM 300-TRACE.
