
           77  W300-VERSION  PIC X(20) VALUE 'NUM200STR (1.0)'.

      *    Input/Output
           77 W300-NUMERO    PIC X(12).
           77 W300-CHARS REDEFINES W300-NUMERO OCCURS 12 TIMES PIC X.


      *    Centenas/Decenas/Unidades
           77 W300-U  PIC 9.
           77 W300-D  PIC 9.
           77 W300-C  PIC 9.

           77 W300-PART    PIC  9.

           77 W300-IDX     PIC  999.
           77 W300-IDX2  PIC  999.

           01  W300-TABLE OCCURS 10 TIMES.
             05 W300-TAB OCCURS 7 TIMES PIC  9(12).
           01  W300-AUX  PIC 9(12).

           01 W300VAL OCCURS 6 TIMES PIC  9(12).
           01 W300K   PIC  9(12).

