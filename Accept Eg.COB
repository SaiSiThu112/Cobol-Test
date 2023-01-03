       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLO.

       DATA DIVISION.
           WORKING-STORAGE SECTION.
           01 StudentDetails.
                  02 WS-StudentID PIC 9(2).
                  02 WS-StudentName PIC X(10).
                  02 WS-StudentAge PIC 9(3).
                  02 WS-StudentGender PIC X(9).

           01 CurrentDate.
               02 WS-CurrentYear PIC 9(4).
               02 WS-CurrentMonth PIC 99.
               02 WS-CurrentDay PIC 99.

           01 DayOfYear.
               02 WS-FILLER PIC 9(4).
               02 WS-YearDay PIC 9(3).

           01 CurrentTime.
               02 WS-CurrentHour PIC 99.
               02 WS-CurrentMinutes PIC 99.
               02 WS-FILLER PIC 9(4).
       PROCEDURE DIVISION.
           Begin.
            DISPLAY "Enter student details using template below".
           DISPLAY "Enter - ID,Name,Age,Gender"
           DISPLAY "SSSSSSSNNNNNNNNIICCCCG".
           ACCEPT  StudentDetails.
           ACCEPT  CurrentDate FROM DATE YYYYMMDD.
           ACCEPT  DayOfYear FROM DAY YYYYDDD.
           ACCEPT  CurrentTime FROM TIME.
           DISPLAY "Name is " WS-StudentName.
           DISPLAY "Date is " WS-CurrentDay SPACE WS-CurrentMonth SPACE CurrentYear.
           DISPLAY "Today is day " WS-YearDay " of the year".
           DISPLAY "The time is " WS-CurrentHour ":" WS-CurrentMinutes.
       STOP RUN.
