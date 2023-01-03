       IDENTIFICATION DIVISION.
       PROGRAM-ID. SortTest.
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INPUT-FILE1 ASSIGN TO INP1.

           SELECT INPUT-FILE2 ASSIGN TO INP2.

           SELECT OUTPUT-FILE ASSIGN TO EXE.

           SELECT WORK ASSIGN TO WRK.

       DATA DIVISION.
       FILE SECTION.

           FD INPUT-FILE1.
           01 INPUT-STU1.
               05 STUDENT-ID-I1 PIC 9(5).
               05 STUDENT-NAME-I1 PIC A(10).

           FD INPUT-FILE2.
           01 INPUT-STU2.
               05 STUDENT-ID-I2 PIC 9(5).
               05 STUDENT-NAME-I2 PIC A(10).

           FD OUTPUT-FILE.
           01 OUTPUT-STU.
               05 STUDENT-ID-O PIC 9(5).
               05 STUDENT-NAME-O PIC A(10).

           SD WORK.
           01 WORK-STU.
               05 STUDENT-ID-W PIC 9(5).
               05 STUDENT-NAME-W PIC A(10).

       PROCEDURE DIVISION.
           MERGE WORK ON ASCENDING KEY STUDENT-ID-O USING INPUT-FILE1 ,
           INPUT-FILE2 GIVING OUTPUT-FILE.
       MAIN-PROCEDURE.
            DISPLAY "Successfully Merge!"
            STOP RUN.
       END PROGRAM SortTest.
