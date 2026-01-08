           77  W304-VERSION  PIC X(20) VALUE 'NUM2FRSTR (1.0)'.

      *    Input/Output
           77 W304-NUMERO    PIC X(12).
           77 W304-CHARS REDEFINES W304-NUMERO OCCURS 12 TIMES PIC X.

           77 W304-RESULT    PIC X(2000).

      *    Textos
           77 W304-CENTENAS    OCCURS 10 TIMES PIC X(20).
           77 W304-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W304-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W304-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W304-U  PIC 9.
           77 W304-D  PIC 9.
           77 W304-C  PIC 9.

           77 W304-PART    PIC  9.
           77 W304-CDU     PIC  999999 VALUE 0.
           77 W304-MILLAR  PIC  999999 VALUE 0.

           77 W304-IDX     PIC  999.

           77 W304-EOF     PIC   XX.


