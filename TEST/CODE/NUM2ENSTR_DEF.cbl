           77  W302-VERSION  PIC X(20) VALUE 'NUM2ENSTR (1.0)'.

      *    Textos
           77 W302-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W302-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W302-UNIDADES    OCCURS 10  TIMES PIC X(20).

      *    Centenas/Decenas/Unidades
           77 W302-CDU     PIC  999999 VALUE 0.
           77 W302-DU      PIC  999999 VALUE 0.
           77 W302-U  PIC 9.
           77 W302-D  PIC 9.
           77 W302-C  PIC 9.

           77 W302-MILLAR  PIC  999999 VALUE 0.

