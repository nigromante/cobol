
           77 W301-NUM  PIC X(12).
           77 W301-NUM-CHARS REDEFINES W301-NUM OCCURS 12 TIMES PIC X.
           77 W301-IDX  PIC  9.
           77 W301-IDX2 PIC  999.
           77 W301-IDX3 PIC  999999 VALUE 0.

           77 W301-U  PIC 9.
           77 W301-D  PIC 9.
           77 W301-C  PIC 9.

           77 W301-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS-1   OCCURS 10 TIMES PIC X(20).

           77 W301-UNIDADES    OCCURS 10  TIMES PIC X(20).

           77 W301-OUT     PIC X(2000).

      * tests support
           77 W301T-Idx   PIC 999 VALUE 1.
           77 W301T-Nums  OCCURS 100 TIMES  PIC   9(12).

