

           77 W300-In  PIC X(200).
           77 W300-In-Chars redefines W300-In OCCURS 200 TIMES PIC X.
           77 W300-In-Idx PIC 999 VALUE 1.
           77 W300-In-EOF PIC 1 VALUE 0.
           
           77 W300-Out     PIC X(2000).
           77 W300-Out-Chars  
               redefines W300-Out OCCURS 2000 TIMES PIC X. 
           77 W300-Out-Len PIC 9999 VALUE 0.
           77 W300-Out-Idx PIC 9999 VALUE 1.
