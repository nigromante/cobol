           77  W302-VERSION  PIC X(20) VALUE 'NUM2ENSTR (1.0)'.

      *    Input/Output
           77 W302-NUMERO    PIC X(12).
           77 W302-CHARS REDEFINES W302-NUMERO OCCURS 12 TIMES PIC X.

           77 W302-RESULT    PIC X(2000).

      *    Textos
           77 W302-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W302-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W302-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W302-U  PIC 9.
           77 W302-D  PIC 9.
           77 W302-C  PIC 9.

           77 W302-PART    PIC  9.
           77 W302-CDU     PIC  999999 VALUE 0.
           77 W302-MILLAR  PIC  999999 VALUE 0.

           77 W302-IDX     PIC  999.

           77 W302-EOF     PIC   XX.
