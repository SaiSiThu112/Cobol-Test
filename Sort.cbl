       IDENTIFICATION DIVISION.
       PROGRAM-ID. SortTest.
       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT INPUT-FILE ASSIGN TO INP.

           SELECT OUTPUT-FILE ASSIGN TO EXE.

           SELECT WORK ASSIGN TO WRK.

       DATA DIVISION.
       FILE SECTION.

           FD INPUT-FILE.
           01 INPUT-STU.
               05 STUDENT-ID-I PIC 9(5).
               05 STUDENT-NAME-I PIC A(10).

           FD OUTPUT-FILE.
           01 OUTPUT-STU.
               05 STUDENT-ID-O PIC 9(5).
               05 STUDENT-NAME-O PIC A(10).

           SD WORK.
           01 WORK-STU.
               05 STUDENT-ID-W PIC 9(5).
               05 STUDENT-NAME-W PIC A(10).

       PROCEDURE DIVISION.

           SORT WORK ON ASCENDING KEY STUDENT-ID-O USING INPUT-FILE
           GIVING OUTPUT-FILE.
       MAIN-PROCEDURE.
            DISPLAY "Successfully Execute!"
            STOP RUN.
       END PROGRAM SortTest.
