; Prints "Hello, world!"
;
; Symbol Table:
; LOOP   -- 0x3001
; DONE   -- 0x3006
; STRING -- 0x3007

        .ORIG x3000
        LEA R1, STRING  ; 0x3000: Get address of first char.
LOOP    LDR R0, R1, #0  ; 0x3001: Load current char.
        BRz DONE        ; 0x3002: While char is not null...
        OUT             ; 0x3003: ...print the char...
        ADD R1, R1, #1  ; 0x3004: ...increment address...
        BRnzp LOOP      ; 0x3005: ...loop back.
DONE    HALT            ; 0x3006: Halt.
                        ; (requires no space in memory)
STRING  .STRINGZ "Hello, world!\n" ; 0x3007: Note that this string occupies
                                   ;         more than one location in memory.
        .END
