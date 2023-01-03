       IDENTIFICATION DIVISION.
       PROGRAM-ID. RECORDTEST.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT STUDENT ASSIGN TO'C:\Users\25-00229\Desktop\input.txt'
               ORGANIZATION IS INDEXED
               ACCESS IS RANDOM
               RECORD KEY IS STUDENT-ID.
       DATA DIVISION.
       FILE SECTION.
           FD STUDENT.
               01 STUDENT-FLIE.
                      05 STUDENT-ID PIC 9(5).
                      05 STUDENT-NAME PIC A(10).

       WORKING-STORAGE SECTION.
           01 WS-STUDENT-FILE.
               05 WS-STUDENT-ID PIC 9(5).
               05 WS-STIDENT-NAME PIC A(10).

       PROCEDURE DIVISION.
           OPEN INPUT STUDENT.
               MOVE 00001 TO STUDENT-ID.
               READ STUDENT RECORD INTO WS-STUDENT-FILE
                   KEY IS STUDENT-ID
                   INVALID KEY DISPLAY "INVALID STUDENT ID"
                   NOT INVALID KEY DISPLAY WS-STUDENT-FILE
               END-READ.
            CLOSE STUDENT.
            STOP RUN.
       END PROGRAM RECORDTEST.
