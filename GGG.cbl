      ******************************************************************
      * Author: Sai Si Thu
      * Date:12/23/2022
      * Purpose:For Assign
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. AssignTwo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.

           *> for oldbalance
           SELECT OLD-BALANCE-FILE ASSIGN
           TO "C:\Users\25-00229\Desktop\Oldbalance.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

           *> for today transaction
           SELECT NEW-BALANCE-FILE ASSIGN
           TO "C:\Users\25-00229\Desktop\Newbalance.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

           *> for output
           SELECT OUTPUT-FILE ASSIGN
           TO "C:\Users\25-00229\Desktop\output.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

           *> for title
           SELECT TITLE-FILE ASSIGN
           TO "C:\Users\25-00229\Desktop\output.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

           FD OLD-BALANCE-FILE.
           01 OLD-BALANCE.
               05 OLD-BRANCH-CODE PIC 9(3).
               05 OLD-PRODUCT-CODE PIC 9(2).
               05 OLD-QUANTITY PIC 9(4).

           FD NEW-BALANCE-FILE.
           01 NEW-BALANCE.
               05 NEW-BRANCH-CODE PIC 9(3).
               05 NEW-PRODUCT-CODE PIC 9(2).
               05 SELLBUY PIC 9(1).
               05 NEW-QUANTITY PIC 9(4).

           FD OUTPUT-FILE.
           01 OUTPUTFILE.
               05 FILLER PIC X(7).
               05 OUTPUT-BRANCH-CODE PIC 9(3).
               05 FILLER PIC X(11).
               05 OUTPUT-PRODUCT-CODE PIC 9(2).
               05 FILLER PIC X(5).
               05 OUTPUT-QUANTITY PIC 9(4).

           FD TITLE-FILE.
           01 OUTPUTTITLE.
              05 TITLE PIC A(34).

       WORKING-STORAGE SECTION.

           01 WS-OLD-BALANCE.
               05 WS-OLD-BRANCH-CODE PIC 9(3).
               05 WS-OLD-PRODUCT-CODE PIC 9(2).
               05 WS-OLD-QUANTITY PIC 9(4).

           01 WS-NEW-BALANCE.
               05 WS-NEW-BRANCH-CODE PIC 9(3).
               05 WS-NEW-PRODUCT-CODE PIC 9(2).
               05 WS-SELLBUY PIC 9(1).
               05 WS-NEW-QUANTITY PIC 9(4).

           01 WS-ENDOFFILE PIC A(1).
           01 WS-ENDOFFILE1 PIC A(1).
           01 WS-TITLE PIC A(34)
           VALUE "BRANCH CODE PRODUCT CODE QUANTITY".

       PROCEDURE DIVISION.


           OPEN INPUT OLD-BALANCE-FILE
           *> for file write
           OPEN EXTEND TITLE-FILE.
           MOVE "BRANCH CODE PRODUCT CODE QUANTITY" TO TITLE.
           WRITE OUTPUTTITLE
           END-WRITE
           CLOSE TITLE-FILE
           OPEN EXTEND OUTPUT-FILE.
           WRITE OUTPUTFILE
           END-WRITE
           DISPLAY WS-TITLE.
           *> loop condition
           PERFORM UNTIL WS-ENDOFFILE = 'Y'
                  READ OLD-BALANCE-FILE INTO WS-OLD-BALANCE
                           AT END
                            DISPLAY "       " WS-OLD-BRANCH-CODE
                             "           " WS-OLD-PRODUCT-CODE
                             "     "  WS-OLD-QUANTITY

                      *> file write for different condition
                      MOVE WS-OLD-BRANCH-CODE TO OUTPUT-BRANCH-CODE
                      MOVE WS-OLD-PRODUCT-CODE TO OUTPUT-PRODUCT-CODE
                      MOVE WS-OLD-QUANTITY TO OUTPUT-QUANTITY
                      WRITE OUTPUTFILE

                           MOVE 'Y' TO WS-ENDOFFILE
                           NOT AT END

           *> move old balance data to old balance working storage session
                    MOVE OLD-BRANCH-CODE TO WS-OLD-BRANCH-CODE
                    MOVE OLD-PRODUCT-CODE TO WS-OLD-PRODUCT-CODE
                    MOVE OLD-QUANTITY TO WS-OLD-QUANTITY

           OPEN INPUT NEW-BALANCE-FILE
           PERFORM UNTIL WS-ENDOFFILE1 = 'Y'
                          READ NEW-BALANCE-FILE INTO WS-NEW-BALANCE
                          AT END MOVE 'Y' TO WS-ENDOFFILE1
                          NOT AT END

           *> move today transaction data to today transaction working storage session
                    MOVE NEW-BRANCH-CODE TO WS-NEW-BRANCH-CODE
                    MOVE NEW-PRODUCT-CODE TO WS-NEW-PRODUCT-CODE
                    MOVE NEW-QUANTITY TO WS-NEW-QUANTITY

                   *> condition for old balance and today transaction
                   IF WS-OLD-BRANCH-CODE = NEW-BRANCH-CODE AND
                      WS-OLD-PRODUCT-CODE = NEW-PRODUCT-CODE

                          IF
                      WS-SELLBUY = 1 THEN
             COMPUTE WS-NEW-QUANTITY = WS-OLD-QUANTITY - WS-NEW-QUANTITY

                      DISPLAY "       " WS-NEW-BRANCH-CODE
                       "           "WS-NEW-PRODUCT-CODE
                       "     " WS-NEW-QUANTITY

                      *> file write for different condition
                      MOVE WS-NEW-BRANCH-CODE TO OUTPUT-BRANCH-CODE
                      MOVE WS-NEW-PRODUCT-CODE TO OUTPUT-PRODUCT-CODE
                      MOVE WS-NEW-QUANTITY TO OUTPUT-QUANTITY
                      WRITE OUTPUTFILE

                           ELSE
             COMPUTE WS-NEW-QUANTITY = WS-OLD-QUANTITY + WS-NEW-QUANTITY
                      DISPLAY "       "WS-NEW-BRANCH-CODE
                     "           " WS-NEW-PRODUCT-CODE
                       "     "       WS-NEW-QUANTITY
                      *> file write for different condition
                      MOVE WS-NEW-BRANCH-CODE TO OUTPUT-BRANCH-CODE
                      MOVE WS-NEW-PRODUCT-CODE TO OUTPUT-PRODUCT-CODE
                      MOVE WS-NEW-QUANTITY TO OUTPUT-QUANTITY
                      WRITE OUTPUTFILE
                          END-IF

                  ELSE
                              IF WS-OLD-BRANCH-CODE = WS-NEW-BRANCH-CODE

                         DISPLAY "       "WS-NEW-BRANCH-CODE
                        "           " WS-NEW-PRODUCT-CODE
                         "     "        WS-NEW-QUANTITY
                      *> file write for different condition
                      MOVE WS-NEW-BRANCH-CODE TO OUTPUT-BRANCH-CODE
                      MOVE WS-NEW-PRODUCT-CODE TO OUTPUT-PRODUCT-CODE
                      MOVE WS-NEW-QUANTITY TO OUTPUT-QUANTITY
                      WRITE OUTPUTFILE

                   END-IF
                  END-READ
                END-PERFORM
               CLOSE NEW-BALANCE-FILE
               MOVE ' N ' TO WS-ENDOFFILE1
             END-READ
           END-PERFORM
           CLOSE OUTPUT-FILE.
           CLOSE OLD-BALANCE-FILE.
           STOP RUN.
       END PROGRAM AssignTwo.
