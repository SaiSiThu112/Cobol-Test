      ******************************************************************
      * Author: Sai Si Thu
      * Date: 12/21/2022
      * Purpose: Test
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ASSIGNONE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
           FILE-CONTROL.
           SELECT PRODUCT-FILE ASSIGN
           TO"C:\Users\25-00229\Desktop\Simple1.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD PRODUCT-FILE.

           01 PRODUCT.
               05 BRANCH-CODE PIC 9(3).
               05 PRODUCT-CODE PIC 9(2).
               05 QUANTITY PIC 9(2).

       WORKING-STORAGE SECTION.
           01 WS-PRODUCT.
               05 WS-BRANCH-CODE PIC 9(3).
               05 WS-PRODUCT-CODE PIC 9(2).
               05 WS-QUANTITY PIC 9(2).

           01 WS-ENDOFFILE PIC A(1).
           01 WS-TITLE PIC A(34)
           VALUE "BRANCH CODE QUANTITY".

           01 WS-TEMP-PRODUCT.
               05 WS-TEMP-BRANCH-CODE PIC 9(3).
               05 WS-TEMP-PRODUCT-CODE PIC 9(2).
               05 WS-TEMP-QUANTITY PIC 9(2).
           01 WS-TOTALQUANTITY PIC 9(3).

       PROCEDURE DIVISION.
           OPEN INPUT PRODUCT-FILE.
           DISPLAY WS-TITLE.

                PERFORM UNTIL WS-ENDOFFILE='Y'
                   READ PRODUCT-FILE INTO WS-PRODUCT
                       AT END MOVE 'Y' TO WS-ENDOFFILE
                       NOT AT END

                 IF WS-TEMP-BRANCH-CODE = ZERO AND
                     WS-TEMP-QUANTITY = ZERO
                     THEN
                     ADD BRANCH-CODE TO WS-TEMP-BRANCH-CODE
                     ADD QUANTITY TO WS-TEMP-QUANTITY
                END-IF
                *> check zero condition
                IF
                    WS-BRANCH-CODE = ZERO
                    THEN
                    DISPLAY "Zero is just zero."
                END-IF

                IF WS-BRANCH-CODE = WS-TEMP-BRANCH-CODE
                   ADD WS-QUANTITY TO WS-TOTALQUANTITY

                ELSE
                   DISPLAY "       " WS-TEMP-BRANCH-CODE
                           "       " WS-TOTALQUANTITY

                     MOVE WS-PRODUCT TO WS-TEMP-PRODUCT
                     MOVE WS-QUANTITY TO WS-TOTALQUANTITY

                   END-IF
                 END-READ
               END-PERFORM.

           CLOSE PRODUCT-FILE.
           STOP RUN.
       END PROGRAM ASSIGNONE.
