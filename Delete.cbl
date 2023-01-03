
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELETETEST.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT PERSON-INFO
           ASSIGN TO'C:\Users\25-00229\Desktop\Delete.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD PERSON-INFO.
               01 PERSON-INFO-FILE.
                  05 PERSON-ID PIC 9(5).
                  05 PERSON-NAME PIC A(20).
                  05 PERSON-AGE PIC 9(4).
                  05 PERSON-GENDER PIC A(15).

       WORKING-STORAGE SECTION.
           01 WS-PERSON-INFO-FILE.
                   05 WS-PERSON-ID PIC 9(5).
                   05 WS-PERSON-NAME PIC A(20).
                   05 WS-PERSON-AGE PIC 9(4).
                   05 WS-PERSON-GENDER PIC A(15).

       PROCEDURE DIVISION.
           OPEN I-O PERSON-INFO.
           MOVE 10000 TO PERSON-ID.

           READ PERSON-INFO
           END-READ.

           DELETE PERSON-INFO RECORD
               INVALID KEY DISPLAY "INVALID KEY"
               NOT INVALID KEY DISPLAY "RECORD IS DELETED"
           END-DELETE.
           CLOSE PERSON-INFO.
           STOP RUN.

       END PROGRAM DELETETEST.
