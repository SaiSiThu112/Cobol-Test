       IDENTIFICATION DIVISION.
       PROGRAM-ID. WRITETEST.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT PERSON ASSIGN
           TO'C:\Users\25-00229\Desktop\Person Info.txt'
               ORGANIZATION IS LINE SEQUENTIAL .

       DATA DIVISION.
       FILE SECTION.
           FD PERSON.
           01 PERSON-INFO-FILE.
               05 P-ID PIC 9(5).
               05 NAME PIC A(11).
               05 AGE PIC 9(4).
               05 GENDER PIC A(15).

       WORKING-STORAGE SECTION.
           01 WS-PERSON-INFO-FILE.
               05 WS-PERSOM-ID PIC 9(5).
               05 WS-PERSON-NAME PIC A(10).
               05 WS-PERSON-AGE PIC 9(4).
               05 WS-PERSON-GENDER PIC A(15).

       PROCEDURE DIVISION.
           OPEN EXTEND PERSON.
               MOVE 00002 TO P-ID.
               MOVE ' Su Su' TO NAME.
               MOVE ' 27 ' TO AGE.
               MOVE 'Female' TO GENDER.
               WRITE PERSON-INFO-FILE
               END-WRITE.
           CLOSE PERSON.
           STOP RUN.

       END PROGRAM WRITETEST.
