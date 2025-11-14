       identification division.
       program-id.    NUM2STR.
       author.        Julian Vidal.

       environment division.
       configuration section.
       repository.
           program LIBNUM2STR.

       special-names.
            console is crt
            decimal-point is comma.

       data division.

       working-storage section.

       01  parametro   PIC x(12).
       01  texto       PIC x(2000).

       procedure division.


       main section.

           MOVE "012345678921"  TO parametro.
           display parametro line 10 position 10.
           call LIBNUM2STR USING parametro texto.
           display texto line 12 position 10.

           stop run.

