RGB: MACRO ;\1 = red, \2 = green, \3 = blue
  DW (\3 << 10 | \2 << 5 | \1)
ENDM

ld_long: MACRO
    IF STRLWR("\1") == "a"
        ; ld a, [$ff40]
        db $FA
        dw \2
    ELSE
        IF STRLWR("\2") == "a"
            ; ld [$ff40], a
            db $EA
            dw \1
        ENDC
    ENDC
ENDM