       IDENTIFICATION DIVISION.
       PROGRAM-ID. Multipler.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
           01 WS-Num1 PIC 9 VALUE 0.
           01 WS-Num2 PIC 9 VALUE 0.
           01 WS-Result PIC 9.

       PROCEDURE DIVISION.
           DISPLAY "Enter First Number :" WITH NO ADVANCING.
           ACCEPT WS-Num1.
           DISPLAY "Enter Second Number :" WITH NO ADVANCING.
           ACCEPT WS-Num2.
           MULTIPLY WS-Num1 BY WS-Num2 GIVING WS-Result
           DISPLAY "Total Result : "WS-Result.
           STOP RUN.

       END PROGRAM Multipler.
