           77  W303-VERSION  PIC X(20) VALUE 'NUM2DESTR (1.0)'.

      *    Input/Output
           77 W303-NUMERO    PIC X(12).
           77 W303-CHARS REDEFINES W303-NUMERO OCCURS 12 TIMES PIC X.

           77 W303-RESULT    PIC X(2000).

      *    Textos
           77 W303-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W303-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W303-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W303-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W303-U  PIC 9.
           77 W303-D  PIC 9.
           77 W303-C  PIC 9.

           77 W303-PART    PIC  9.
           77 W303-CDU     PIC  999999 VALUE 0.
           77 W303-MILLAR  PIC  999999 VALUE 0.

           77 W303-IDX     PIC  999.

           77 W303-EOF     PIC   XX.


