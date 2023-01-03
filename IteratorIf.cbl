       IDENTIFICATION DIVISION.
       PROGRAM-ID. Multipler.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-Num1 PIC 9 VALUE 0.
           01 WS-Num2 PIC 9 VALUE 0.
           01 WS-Result PIC 9.
           01 WS-Operator PIC X VALUE SPACE.

       PROCEDURE DIVISION.
           Calculator.
           PERFORM 3 TIMES
               DISPLAY "Enter first number :" WITH NO ADVANCING
               ACCEPT WS-Num1
               DISPLAY "Enter second number :" WITH NO ADVANCING
               ACCEPT WS-Num2
               DISPLAY "Enter Operator(+ or *) " WITH NO ADVANCING
               ACCEPT WS-Operator
               IF WS-Operator="+" THEN
                   ADD WS-Num1 , WS-Num2 GIVING WS-Result
               END-IF
               IF WS-Operator="*" THEN
                   MULTIPLY WS-Num1 BY WS-Num2 GIVING WS-Result
               END-IF
               DISPLAY "Result is :"WS-Result
           END-PERFORM.
           STOP RUN.

       END PROGRAM Multipler.
