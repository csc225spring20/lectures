        .ORIG x3000
MAIN    JSR FOO
        HALT

FOO     ADD R0, R0, #-1 ; Decrement R0.
        BRnz DONE       ; If R0 is positive...
        ST  R7, SAVER7  ; ...recurse...
        JSR FOO
        LD  R7, SAVER7
DONE    RET
SAVER7  .FILL x0000     ; NOTE: This value gets overwritten by repeated calls
        .END            ;       to FOO for all R0 >= 3.
