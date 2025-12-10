       identification division.
       program-id.    isamfile.
       author.        kik.

       environment division.
       configuration section.

       special-names.
            console is crt
            decimal-point is comma.

       input-output section.
       file-control.
           select isamfile
               assign "./DATA/INOUTFILE"
               organization is indexed
               access is random
               record key is acctno
               status is file-error.

       data division.
       file section.
       fd  isamfile.
       01  in-record.
           03  acctno      pic 99.
           03  amount      pic 99999v99.

       working-storage section.
       01  file-error         pic XX.
        01 WS-VAR.
         05  WS-EOF-SW PIC X(01).
           88  WS-EOF  VALUE 'Y'.
           88  WS-NOT-EOF  VALUE 'N'.

       01  parametro   PIC x(12).
       01  texto       PIC x(2000).
       01  idx     PIC 99 VALUE 1.
       77  formato PIC zzzzzz9.99.

       procedure division.

      *  ------  Trap for IO-errors
       declaratives.
       in-errors section.
           use after error procedure on isamfile.
       in-error.
           display "Error access directory : "  line 24 column 1.
           display file-error line 24.
           stop run.
       in-error-out.
           exit.
       end declaratives.


       main section.

           perform open-files.
           perform show-screen.

           display parametro line 2 position 10.
           perform listado.

           perform read-account.

           perform process-x
               until acctno in in-record = zero.

           perform close-files.

           stop run.


       show-screen.
          display space.
          display "Index-sequential files" line 3 position 25.
          display "Account number   :" line 4 position 10.
          display "Balance          :" line 6 position 10.



       listado.
           MOVE 10 To idx.
           set WS-NOT-EOF to TRUE.
           PERFORM UNTIL WS-EOF
             READ isamfile NEXT RECORD
               AT END SET WS-EOF TO TRUE
               NOT AT END PERFORM print-record
           END-PERFORM.

       print-record.
           MOVE amount TO formato.
           display acctno line idx position 4.
           display formato line idx position 10.
           add 1 TO idx.


       open-files.
           open i-o isamfile.


       process-x.
           read isamfile
                invalid key
                   move zero to amount in in-record
                not invalid key
                   display amount in in-record line 5 position 29
           end-read.

           perform read-amount.
           rewrite in-record
                invalid key
                   write in-record.

           perform read-account.


       read-account.
           accept acctno in in-record line number 4 col 29.


       read-amount.
           accept formato line 6 COLUMN 29.
           move formato to amount.

       close-files.
           close isamfile.


