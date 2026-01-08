           77  W305-VERSION  PIC X(20) VALUE 'NUM2POSTR (1.0)'.

      *    Input/Output
           77 W305-NUMERO    PIC X(12).
           77 W305-CHARS REDEFINES W305-NUMERO OCCURS 12 TIMES PIC X.

           77 W305-RESULT    PIC X(2000).

      *    Textos
           77 W305-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W305-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W305-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W305-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W305-U  PIC 9.
           77 W305-D  PIC 9.
           77 W305-C  PIC 9.

           77 W305-PART    PIC  9.
           77 W305-CDU     PIC  999999 VALUE 0.
           77 W305-DU      PIC  999999 VALUE 0.
           77 W305-MILLAR  PIC  999999 VALUE 0.

           77 W305-IDX     PIC  999.

           77 W305-EOF     PIC   XX.


           77 W305-IDX2  PIC  999.
           77 W305-U2    PIC 9.
           77 W305-D2    PIC 9.
           77 W305-C2    PIC 9.
           77 W305-CDU2  PIC  999999 VALUE 0.
           77 W305-DU2   PIC  999999 VALUE 0.
