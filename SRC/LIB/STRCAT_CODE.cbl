
       300-RESET.
           MOVE 0 TO W300-Out-Len.
           MOVE SPACES TO W300-Out.
           MOVE 1 TO W300-Out-Idx.

       300-COPY-STRING.
           MOVE WS-FALSE TO W300-In-EOF
           PERFORM 300-COPY-CHAR 
             VARYING W300-In-Idx FROM 1 By 1 UNTIL W300-In-Idx > 200.
           MOVE W300-Out-Idx TO W300-Out-Len.
           SUBTRACT 1 FROM W300-Out-Len.

       300-COPY-CHAR.
           IF ( W300-In-EOF = WS-FALSE AND 
             W300-In-Chars(W300-In-Idx) = "_" )
             MOVE WS-TRUE TO W300-In-EOF
           END-IF
           IF ( W300-In-EOF = WS-FALSE )
             MOVE W300-In-Chars(W300-In-Idx) 
                 TO W300-Out-Chars(W300-Out-Idx)
             ADD 1 TO W300-Out-Idx
           END-IF.

       300-CUT-LAST-CHAR.
           SUBTRACT 1 FROM W300-Out-Len.
           SUBTRACT 1 FROM W300-Out-Idx.


