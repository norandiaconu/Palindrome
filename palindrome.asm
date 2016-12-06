;
; Programmer: Noran Diaconu
; Userid: diaconuna
; Purpose: Determine whether an entered string is a palindrome or not.
;
            .ORIG x3000
            LEA R0, START ;Loads the starting message in R0
            PUTS ;Prints the starting message
            LEA R1, WORD ;Loads the word in R1
            LD R2, NEWLINE ;Loads the check for a newline charater

INPUT       GETC ;Gets the next user entered character
            OUT ;Outputs that character
            ;ADD R3, R1, 1
            ADD R3, R3, 1 ;Counts the number of characters in the string
            ADD R4, R0, R2 ;Checks to stop reading characters if enter is pressed
            BRnp INPUT ;Loops for another character

            NOT R3, R3 ;Negates R3
CHECK       ADD R5, R1, R3 ;Adds R1 and R3
            BRz EQUAL ;If R1 + R3 is 0 then break to EQUAL
            LEA R0, NOTPALINDROME ;Loads the not palindrome message in R0
            PUTS ;Prints the not palindrome message
            BRnzp STOP ;Breaks to the program halt
EQUAL       ADD R1, R1, 1 ;Adds 1 to R1
            ADD R3, R3, -1 ;Subtracts 1 from R3
            ADD R6, R1, R3 ;Adds R1 and R3
            BRnp CHECK ;Checks whether the values of R1 and R3 are equal
            LEA R0, PALINDROME ;Loads the palindrome message in R0
            PUTS ;Prints the palindrome message
STOP        HALT ;Ends the program
START           .STRINGZ    "Enter a string > "
WORD            .BLKW       50
NEWLINE         .FILL       -10
NOTPALINDROME   .STRINGZ    "is not a palindrome."
PALINDROME      .STRINGZ    "is a palindrome."
                .END
