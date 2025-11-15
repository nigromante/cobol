
       001-TRACE-CHAR.
           DISPLAY W001-Parts( W001-Idx ) WITH NO ADVANCING.

       001-TRACE.
           DISPLAY "TRACING " , W001-Title,
             "( " , W001-Buffer-Len, " ) [" 
             WITH NO ADVANCING.

           PERFORM 001-TRACE-CHAR
             VARYING W001-Idx 
             FROM 1 By 1 UNTIL W001-Idx > W001-Buffer-Len.

           DISPLAY "]".

