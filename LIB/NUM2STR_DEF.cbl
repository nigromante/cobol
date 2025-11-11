
           77 W301-Num  PIC X(12).
           77 W301-Num-Chars REDEFINES W301-Num OCCURS 12 TIMES PIC X.
           77 W301-Idx  PIC  9.
           77 W301-Idx2 PIC  999.
           77 W301-Idx3 PIC  999999 VALUE 0.

           77 U  PIC 9.
           77 D  PIC 9. 
           77 C  PIC 9.

           77 W301-Centenas    OCCURS 10 TIMES PIC X(20).
           77 W301-Decenas     OCCURS 10 TIMES PIC X(20).
           77 W301-Decenas-1   OCCURS 10 TIMES PIC X(20).

           77 W301-Unidades    OCCURS 10  TIMES PIC X(20).

      * tests support
           77 W301T-Idx   PIC 999 VALUE 1.
           77 W301T-Nums  OCCURS 100 TIMES  PIC   9(12).

