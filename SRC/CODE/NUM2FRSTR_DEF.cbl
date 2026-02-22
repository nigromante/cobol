           77  W304-VERSION  PIC X(20) VALUE 'NUM2FRSTR (1.0)'.

      *    Textos
           77 W304-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W304-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W304-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W304-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W304-CDU     PIC  999999 VALUE 0.
           77 W304-DU      PIC  999999 VALUE 0.
           77 W304-U  PIC 9.
           77 W304-D  PIC 9.
           77 W304-C  PIC 9.


