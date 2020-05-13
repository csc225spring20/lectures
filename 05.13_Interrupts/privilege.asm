            .ORIG x300

EX_PRIV     ST R0, EX_PRIV_R0
            LEA R0, EX_PRIV_MSG
            PUTS
            LD R0, EX_PRIV_R0
            RTI

EX_PRIV_R0
 .FILL x0000
EX_PRIV_MSG
 .STRINGZ "\n\n--- You'd better not do that again! ---\n\n"

            .END
