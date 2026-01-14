
       300-INIT.
           MOVE 1000000000 TO W300VAL(1).
           MOVE 1000000    TO W300VAL(2).
           MOVE 1000       TO W300VAL(3).
           MOVE 1          TO W300VAL(4).


      *    C D U CDU DU  P+1 0
      *    - Centenas
      *      - Decenas
      *        - Unidades
      *          - CDU
      *              - DU
      *                  P+1 Sumatoria de las siguientes partes
       300-CALCULATE.

           PERFORM VARYING W300-PART FROM 1 BY 1 UNTIL W300-PART > 4
             COMPUTE W300-IDX = 3 * (W300-PART - 1) + 1

             MOVE FUNCTION NUMVAL(W300-CHARS(W300-IDX)) TO W300-C
             ADD 1 TO W300-IDX
             MOVE FUNCTION NUMVAL(W300-CHARS(W300-IDX)) TO W300-D
             ADD 1 TO W300-IDX
             MOVE FUNCTION NUMVAL(W300-CHARS(W300-IDX)) TO W300-U

             MOVE W300-C  TO W300-TAB(W300-PART,1)
             MOVE W300-D  TO W300-TAB(W300-PART,2)
             MOVE W300-U  TO W300-TAB(W300-PART,3)

             COMPUTE  W300-TAB(W300-PART,4)
                 =  W300-C * 100 + W300-D * 10 + W300-U

             COMPUTE W300-TAB(W300-PART,5)
                 = W300-D * 10 + W300-U

             MOVE 0 TO W300-TAB(W300-PART,6)
             MOVE 0 TO W300-TAB(W300-PART,7)
           END-PERFORM.

           PERFORM VARYING W300-PART FROM 1 BY 1 UNTIL W300-PART > 3
             MOVE 0 TO W300-AUX
             COMPUTE W300-IDX2 = W300-PART + 1
             PERFORM VARYING W300-IDX
               FROM W300-IDX2  BY 1 UNTIL W300-IDX > 4

               COMPUTE W300K=W300VAL(W300-IDX)*W300-TAB(W300-IDX,4)
               ADD W300K TO W300-AUX
             END-PERFORM
             MOVE W300-AUX TO W300-TAB(W300-PART,6)
           END-PERFORM.

