       IDENTIFICATION DIVISION.
       PROGRAM-ID. READVERB.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT STUDENT ASSIGN TO'C:\Users\25-00229\Desktop\input.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD STUDENT.
           01 STUDENT-FILE.
                05 STUDENT-ID PIC 9(5).
                05 STUDENT-NAME PIC X(15).

       WORKING-STORAGE SECTION.
           01 WS-STUDENT.
                  05 WS-STUDENT-ID PIC 9(5).
                  05 WS-STUDENT-NAME PIC X(15).
           01 WS-EOF PIC A(1).

       PROCEDURE DIVISION.
           OPEN INPUT STUDENT.
              PERFORM UNTIL WS-EOF='Y'
                   READ STUDENT INTO WS-STUDENT
                       AT END MOVE 'Y' TO WS-EOF
                       NOT AT END DISPLAY WS-STUDENT
                   END-READ
              END-PERFORM.
           CLOSE STUDENT.
           STOP RUN.

       END PROGRAM READVERB.
