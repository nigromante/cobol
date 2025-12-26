           77  W301-VERSION  PIC X(20) VALUE 'NUM2ESSTR V 1.0'.

      *    Input/Output
           77 W301-NUMERO    PIC X(12).
           77 W301-CHARS REDEFINES W301-NUMERO OCCURS 12 TIMES PIC X.

           77 W301-RESULT    PIC X(2000).

      *    Textos
           77 W301-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W301-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W301-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W301-U  PIC 9.
           77 W301-D  PIC 9.
           77 W301-C  PIC 9.

           77 W301-PART    PIC  9.
           77 W301-CDU     PIC  999999 VALUE 0.
           77 W301-MILLAR  PIC  999999 VALUE 0.

           77 W301-IDX     PIC  999.
           77 W301-EOF     PIC   XX.


