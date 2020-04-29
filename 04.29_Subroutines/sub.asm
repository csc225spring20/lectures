; Computes R2 = R0 - R1.
NOT R3, R1      ; Negate R1.
ADD R3, R3, #1
ADD R2, R0, R3  ; Add -R1 to R0.
