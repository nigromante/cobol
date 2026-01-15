           77  W306-VERSION  PIC X(20) VALUE 'NUM2NOSTR (1.0)'.

      *    Input
           77 W306-NUMERO    PIC X(12).
           77 W306-CHARS REDEFINES W306-NUMERO OCCURS 12 TIMES PIC X.

      *    Output
           77 W306-RESULT    PIC X(2000).

      *    Textos
           77 W306-DECENAS     OCCURS 10 TIMES PIC X(20).
           77 W306-DECENAS-1   OCCURS 10 TIMES PIC X(20).
           77 W306-UNIDADES    OCCURS 10  TIMES PIC X(20).

