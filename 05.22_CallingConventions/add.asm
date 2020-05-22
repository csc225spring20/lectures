        .ORIG x3000

; int main(void)
MAINFN  LD  R6, INITSP  ; Init. the stack pointer.
        ADD R5, R6, #0  ; Init. the frame pointer.

        ; Caller setup:
        AND R0, R0, #0  ; Push '2'.
        ADD R0, R0, #2
        ADD R6, R6, #-1
        STR R0, R6, #0
        ADD R0, R0, #-1 ; Push '1'.
        ADD R6, R6, #-1
        STR R0, R6, #0
        JSR ADDFN       ; Call "add".

        ; Caller teardown:
        LDR R1, R6, #0  ; Pop the return value.
        ADD R6, R6, #1
        ADD R6, R6, #1  ; Pop '1'.
        ADD R6, R6, #1  ; Pop '2'.

        LEA R0, STRING  ; NOTE: "printf" is really another function call, but
        PUTS            ;       it's defined in stdio, and its implementation
        LD  R0, INTOFF  ;       is beyond the scope of this course.
        ADD R0, R0, R1
        OUT
        LD  R0, NEWLINE
        OUT

        HALT

INITSP  .FILL xFE00
STRING  .STRINGZ "1 + 2 = "
INTOFF  .FILL x30
NEWLINE .FILL x0A


; int add(int, int)
ADDFN   ; Callee setup:
        ADD R6, R6, #-1 ; Push space for the return value.
        ADD R6, R6, #-1 ; Push the return address.
        STR R7, R6, #0
        ADD R6, R6, #-1 ; Push the dynamic link.
        STR R5, R6, #0
        ADD R5, R6, #-1 ; Set the frame pointer.
        ADD R6, R6, #-1 ; Push space for "z".

        ; Callee body:
        LDR R0, R5, #4  ; Load "x" into R0.
        LDR R1, R5, #5  ; Load "y" into R0.
        ADD R0, R0, R1  ; Compute "x + y".
        STR R0, R5, #0  ; Store "x + y" in "z".

        ; Callee teardown:
        LDR R0, R5, #0  ; Load "z" into R0.
        STR R0, R5, #3  ; Set the return value to "z".
        ADD R6, R6, #1  ; Pop "z".
        LDR R5, R6, #0  ; Pop the dynamic link.
        ADD R6, R6, #1
        LDR R7, R6, #0  ; Pop the return address.
        ADD R6, R6, #1
        RET             ; Return to the caller.

        .END
