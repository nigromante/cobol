

       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOOP.
       AUTHOR. JULIAN VIDAL.
       DATA DIVISION.
          
       WORKING-STORAGE SECTION.


           INCLUDE 000_DEFINES.
           INCLUDE 001_DEFINES.
           INCLUDE 300_DEFINES.
           INCLUDE 301_DEFINES.

           77 WS-I   PIC 999 VALUE 1.
           77 WS-NUMS  OCCURS 100 TIMES  PIC   9(12).

           77 WS-Idx   PIC 9(12).
           77 WS-Word  REDEFINES  WS-Idx PIC X(12).

       PROCEDURE DIVISION.

           MOVE 0 TO WS-NUMS(1).
           MOVE 1 TO WS-NUMS(2).
           MOVE 4 TO WS-NUMS(3).
           MOVE 10 TO WS-NUMS(4).
           MOVE 11 TO WS-NUMS(5).
           MOVE 15 TO WS-NUMS(6).
           MOVE 20 TO WS-NUMS(7).
           MOVE 22 TO WS-NUMS(8).
           MOVE 70 TO WS-NUMS(9).
           MOVE 99 TO WS-NUMS(10).

           MOVE 100 TO WS-NUMS(11).
           MOVE 101 TO WS-NUMS(12).
           MOVE 104 TO WS-NUMS(13).
           MOVE 110 TO WS-NUMS(14).
           MOVE 111 TO WS-NUMS(15).
           MOVE 215 TO WS-NUMS(16).
           MOVE 520 TO WS-NUMS(17).
           MOVE 622 TO WS-NUMS(18).
           MOVE 970 TO WS-NUMS(19).
           MOVE 999 TO WS-NUMS(20).
           
           MOVE 1000 TO WS-NUMS(21).
           MOVE 1001 TO WS-NUMS(22).
           MOVE 1004 TO WS-NUMS(23).
           MOVE 1110 TO WS-NUMS(24).
           MOVE 1111 TO WS-NUMS(25).
           MOVE 2015 TO WS-NUMS(26).
           MOVE 5020 TO WS-NUMS(27).
           MOVE 6022 TO WS-NUMS(28).
           MOVE 9870 TO WS-NUMS(29).
           MOVE 9999 TO WS-NUMS(30).

           PERFORM   301-INIT.

           PERFORM WS-LOOP VARYING WS-I FROM 1 BY 1 UNTIL WS-I > 30.

           STOP RUN.

       WS-LOOP.
           MOVE WS-NUMS(WS-I) TO W301-Num.
           PERFORM 301-TEST-BODY.

           INCLUDE 001_CODE.
           INCLUDE 300_CODE.
           INCLUDE 301_CODE.

           INCLUDE 301_TEST.


