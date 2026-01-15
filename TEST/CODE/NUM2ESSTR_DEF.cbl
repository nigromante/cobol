           77  W301-VERSION  PIC X(20) VALUE 'NUM2ESSTR (1.0)'.

      *    Textos
           77 W301-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W301-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W301-CDU     PIC  999999 VALUE 0.
           77 W301-DU      PIC  999999 VALUE 0.
           77 W301-U  PIC 9.
           77 W301-D  PIC 9.
           77 W301-C  PIC 9.

           77 W301-MILLAR  PIC  999999 VALUE 0.



