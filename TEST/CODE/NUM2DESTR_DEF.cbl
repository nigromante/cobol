           77  W303-VERSION  PIC X(20) VALUE 'NUM2DESTR (1.0)'.

      *    Textos
           77 W303-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W303-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W303-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W303-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W303-CDU     PIC  999999 VALUE 0.
           77 W303-DU      PIC  999999 VALUE 0.
           77 W303-U  PIC 9.
           77 W303-D  PIC 9.
           77 W303-C  PIC 9.

           77 W303-MILLAR  PIC  999999 VALUE 0.




