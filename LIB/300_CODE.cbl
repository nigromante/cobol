
       300-RESET.
           MOVE 0 TO WS-Out-Len.
           MOVE SPACES TO WS-Out.
           MOVE 1 TO WS-Out-Idx.

       300-COPY-STRING.
           MOVE WS-FALSE TO WS-In-EOF
           PERFORM 300-COPY-CHAR 
             VARYING WS-In-Idx FROM 1 By 1 UNTIL WS-In-Idx > 200.
           MOVE WS-Out-Idx TO WS-Out-Len.
           SUBTRACT 1 FROM WS-Out-Len.

       300-COPY-CHAR.
           IF ( WS-In-EOF = WS-FALSE AND WS-In-Chars(WS-In-Idx) = "_" )
             MOVE WS-TRUE TO WS-In-EOF
           END-IF
           IF ( WS-In-EOF = WS-FALSE )
             MOVE WS-In-Chars(WS-In-Idx) TO WS-Out-Chars(WS-Out-Idx)
             ADD 1 TO WS-Out-Idx
           END-IF.

       300-CUT-LAST-CHAR.
           SUBTRACT 1 FROM WS-Out-Len.
           SUBTRACT 1 FROM WS-Out-Idx.


