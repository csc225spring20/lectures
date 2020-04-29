        .ORIG x3000

; Example "main" program:
        AND R0, R0, #0  ; Set the minuend to 4.  
        ADD R0, R0, #4
        AND R1, R1, #0  ; Set the subtrahend to 2.
        ADD R1, R1, #2

        ; Save R2 and R7, if desired.
        JSR SUB         ; Call "SUB".
        ; Restore R2 and R7, if desired.

        ; Do something with the difference in R2.
        HALT

; Subtracts one integer from another.
;  Takes the minuend in R0, the subtrahend in R1.
;  Returns the difference in R2.
SUB     ST R3, SAVER3   ; Save R3.
        NOT R3, R1      ; Negate R1.
        ADD R3, R3, #1
        ADD R2, R0, R3  ; Add -R1 to R0.
        LD R3, SAVER3   ; Restore R3.
        RET             ; Return.

SAVER3  .FILL x00       ; Space to save R3.

        .END
