

       301-INIT.

           MOVE "UN _"             TO  W301-Unidades(1).  
           MOVE "DOS _"            TO  W301-Unidades(2).  
           MOVE "TRES _"           TO  W301-Unidades(3).  
           MOVE "CUATRO _"         TO  W301-Unidades(4).  
           MOVE "CINCO _"          TO  W301-Unidades(5).  
           MOVE "SEIS _"           TO  W301-Unidades(6).  
           MOVE "SIETE _"          TO  W301-Unidades(7).  
           MOVE "OCHO _"           TO  W301-Unidades(8).  
           MOVE "NUEVE _"          TO  W301-Unidades(9).  
           
           MOVE "ONCE _"           TO  W301-Decenas-1(1).  
           MOVE "DOCE _"           TO  W301-Decenas-1(2).  
           MOVE "TRECE _"          TO  W301-Decenas-1(3).  
           MOVE "CATORCE _"        TO  W301-Decenas-1(4).  
           MOVE "QUINCE _"         TO  W301-Decenas-1(5).  
           MOVE "DIECISEIS _"      TO  W301-Decenas-1(6).  
           MOVE "DIECISIETE _"     TO  W301-Decenas-1(7).  
           MOVE "DIECIOCHO _"      TO  W301-Decenas-1(8).  
           MOVE "DIECINUEVE _"     TO  W301-Decenas-1(9).  

           MOVE "DIEZ _"           TO  W301-Decenas(1).  
           MOVE "VEINTE _"         TO  W301-Decenas(2).  
           MOVE "TREINTA _"        TO  W301-Decenas(3).  
           MOVE "CUARENTA _"       TO  W301-Decenas(4).  
           MOVE "CINCUENTA _"      TO  W301-Decenas(5).  
           MOVE "SESENTA _"        TO  W301-Decenas(6).  
           MOVE "SETENTA _"        TO  W301-Decenas(7).  
           MOVE "OCHENTA _"        TO  W301-Decenas(8).  
           MOVE "NOVENTA _"        TO  W301-Decenas(9).  

           MOVE "CIEN _"           TO  W301-Centenas(1).  
           MOVE "DOSCIENTOS _"     TO  W301-Centenas(2).  
           MOVE "TRESCIENTOS _"    TO  W301-Centenas(3).  
           MOVE "CUATROCIENTOS _"  TO  W301-Centenas(4).  
           MOVE "QUINIENTOS _"     TO  W301-Centenas(5).  
           MOVE "SEISCIENTOS _"    TO  W301-Centenas(6).  
           MOVE "SETECIENTOS _"    TO  W301-Centenas(7).  
           MOVE "OCHOCIENTOS _"    TO  W301-Centenas(8).  
           MOVE "NOVECIENTOS _"    TO  W301-Centenas(9).  



       301-CDU.

           IF W301-C > 0
             IF W301-C = 1
               IF W301-D= 0 AND W301-U = 0
                 MOVE "CIEN _" TO W300-In
                 PERFORM 300-COPY-STRING
               ELSE
                 MOVE "CIENTO _" TO W300-In
                 PERFORM 300-COPY-STRING
               END-IF
             ELSE
               MOVE W301-Centenas(W301-C) TO W300-In
               PERFORM 300-COPY-STRING
             END-IF
           END-IF.

           IF W301-D > 0
             IF W301-D = 1 AND W301-U <> 0
               MOVE W301-Decenas-1(W301-U)   TO  W300-In
               PERFORM 300-COPY-STRING
               MOVE 0 TO W301-U
             ELSE
               MOVE W301-Decenas(W301-D) TO W300-In
               PERFORM 300-COPY-STRING
               IF W301-U > 0
                 MOVE "Y _" TO W300-In
                 PERFORM 300-COPY-STRING
               END-IF
             END-IF
           END-IF.

           IF W301-U > 0
             MOVE W301-Unidades(W301-U)   TO  W300-In
             PERFORM 300-COPY-STRING
           END-IF.



       301-GRUPO.

           COMPUTE W301-Idx2 = 3 * (W301-Idx - 1) + 1.

           MOVE FUNCTION NUMVAL(W301-Num-Chars(W301-Idx2)) TO W301-C.
           ADD 1 TO W301-Idx2.
           MOVE FUNCTION NUMVAL(W301-Num-Chars(W301-Idx2)) TO W301-D.
           ADD 1 TO W301-Idx2.
           MOVE FUNCTION NUMVAL(W301-Num-Chars(W301-Idx2)) TO W301-U.

           COMPUTE W301-Idx2 = W301-C * 100 + W301-D * 10 + W301-U.


           IF (W301-Idx = 1 OR W301-Idx = 3)
             COMPUTE W301-Idx3 = W301-Idx2 * 1000
             IF W301-Idx2 > 0
               IF W301-Idx2 > 1
                 PERFORM 301-CDU
               END-IF
               MOVE "MIL _" TO W300-In
               PERFORM 300-COPY-STRING
             END-IF
           END-IF.

           IF (W301-Idx = 2)
             COMPUTE W301-Idx3 = W301-Idx2 + W301-Idx3
             IF W301-Idx3 > 0
               IF W301-Idx3 > 1
                 PERFORM 301-CDU
                 MOVE "MILLONES _" TO W300-In
                 PERFORM 300-COPY-STRING
               ELSE
                 MOVE "UN MILLON _" TO W300-In
                 PERFORM 300-COPY-STRING
               END-IF
             END-IF
           END-IF.

           IF ( W301-Idx = 4 AND W301-Idx2 > 0 )
               PERFORM 301-CDU
           END-IF.


       301-LOOP.

           PERFORM 300-RESET.

           PERFORM 301-GRUPO 
             VARYING W301-Idx
             FROM 1 BY 1 UNTIL W301-Idx > 4. 

           PERFORM 300-CUT-LAST-CHAR.


