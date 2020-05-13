EX_PRIV     LEA R0, EX_PRIV_MSG
            PUTS
            HALT

EX_PRIV_MSG
 .STRINGZ "\n\n--- Access Violation ---\n\n"
