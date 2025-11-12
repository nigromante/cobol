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
 

       procedure division.

      *  ------  Trap for IO-errors
       declaratives.
       in-errors section.
           use after error procedure on isamfile.
       in-error.
           display "Error when accessing diectory: " 
                                  line 24 position 1. 
           display file-error line 24.
           stop run.
       in-error-out.
           exit.
       end declaratives.


       main section.
           perform open-files.
           perform show-screen.
           perform read-account.
           perform process-x
               until acctno in in-record = zero.
           perform close-files.
           stop run.


       show-screen.
          display space.
          display "Index-sequential files" line 1 position 25.           
          display "Account number   :" line 4 position 10.
          display "Balance          :" line 6 position 10.


       open-files.
           open i-o isamfile.


       process-x.
           read isamfile
                invalid key
                   move zero to amount in in-record
                not invalid key
                   display amount in in-record
                                line 5 position 29
                end-read.
           perform read-amount.
           rewrite in-record
                invalid key
                   write in-record.
           perform read-account.


       read-account.
           accept acctno in in-record line 4 position 29.


       read-amount.
           accept amount in in-record line 6 position 29.


       close-files.
           close isamfile.


