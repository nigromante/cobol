           77  W306-VERSION  PIC X(20) VALUE 'NUM2NOSTR (1.0)'.

      *    Input/Output
           77 W306-NUMERO    PIC X(12).
           77 W306-CHARS REDEFINES W306-NUMERO OCCURS 12 TIMES PIC X.

           77 W306-RESULT    PIC X(2000).

      *    Textos
           77 W306-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W306-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W306-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W306-U  PIC 9.
           77 W306-D  PIC 9.
           77 W306-C  PIC 9.

           77 W306-PART    PIC  9.
           77 W306-CDU     PIC  999999 VALUE 0.
           77 W306-MILLAR  PIC  999999 VALUE 0.

           77 W306-IDX     PIC  999.
           77 W306-IDX2  PIC  999.

           77 W306-EOF     PIC   XX.

           01  W306-TABLE OCCURS 10 TIMES.
             05 W306-TAB OCCURS 7 TIMES PIC  9(12).
           01  W306-AUX  PIC 9(12).

           01 W306VAL OCCURS 6 TIMES PIC  9(12).
           01 W306K   PIC  9(12).

