        .ORIG x3000
MAIN    JSR FOO
        HALT

FOO     ST  R7, SAVER7  ; The call to BAR will
        JSR BAR         ;  overwrite the return
        LD  R7, SAVER7  ;  address in R7.
        RET
SAVER7  .FILL x0000

BAR     RET
        .END
