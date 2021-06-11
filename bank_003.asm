; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]

    ld hl, $bc00
    ld [hl], $00
    inc hl
    ld [hl], $02
    pop bc
    pop de
    push de
    push bc
    ld hl, $bc02
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, [de]
    ld d, a
    dec a
    jr nz, jr_003_401d

    call $a20e
    ld e, $00
    ret


jr_003_401d:
    ld a, d
    sub $02
    jr nz, jr_003_403d

    ld hl, $bc03
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, [bc]
    push af
    inc sp
    call $a849
    inc sp
    ld e, $00
    ret


jr_003_403d:
    ld a, d
    sub $03
    jr nz, jr_003_4045

    jp $afaf


jr_003_4045:
    ld e, $00
    ret


    add sp, -$11
    ld hl, sp+$13
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$06
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$01
    ld a, l
    ld d, h
    ld hl, sp+$0d
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $44
    ld hl, sp+$0e
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    ld a, $51
    ld [bc], a
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld a, $44
    ld [bc], a
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, $46
    ld [bc], a
    ld hl, sp+$00
    ld [hl], $00

jr_003_4081:
    ld hl, sp+$0e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    inc a
    ld [bc], a
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $04
    jr c, jr_003_4081

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$13
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], e
    ld hl, $0100
    push hl
    xor a
    push af
    inc sp
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $05
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0072
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0008
    push hl
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $8080
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0072
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0008
    push hl
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $80f8
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0070
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0100
    push hl
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, _VRAM
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0060
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$0e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, $04
    push af
    inc sp
    ld hl, sp+$07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $05
    ld hl, sp+$08
    ld [hl], e
    ld hl, sp+$08
    ld a, [hl]
    or a
    jp nz, $a209

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0080
    push hl
    xor a
    push af
    inc sp
    ld hl, sp+$12
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $05
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001a
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, [hl]
    inc hl
    inc hl
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$0e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    push hl
    ld hl, sp+$0b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0072
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0080
    push hl
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, _VRAM
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld e, $01
    jr jr_003_420b

    ld e, $00

jr_003_420b:
    add sp, $11
    ret


    ld hl, $fde8
    add hl, sp
    ld sp, hl
    ld hl, $0108
    add hl, sp
    ld a, l
    ld d, h
    ld hl, $020c
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld hl, sp+$02
    ld [hl], d
    inc hl
    ld [hl], e
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $000c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld b, e
    ld c, d
    ld hl, sp+$00
    ld [hl], b
    inc hl
    ld [hl], c
    ld hl, $020d
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $a048
    add sp, $02
    ld hl, $0106
    add hl, sp
    ld [hl], e
    ld a, [hl]
    dec a
    jr nz, jr_003_4272

    ld hl, $020d
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $a048
    add sp, $02
    ld hl, $0106
    add hl, sp
    ld [hl], e

jr_003_4272:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0070
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$06
    ld a, l
    ld d, h
    ld hl, $0212
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0100
    push hl
    push de
    ld h, $3f
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    pop de
    push de
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0216
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld a, b
    or a
    jp z, $a32c

    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0208
    add hl, sp
    inc [hl]
    jr nz, jr_003_42e8

    inc hl
    inc [hl]
    jr nz, jr_003_42e8

    inc hl
    inc [hl]
    jr nz, jr_003_42e8

    inc hl
    inc [hl]

jr_003_42e8:
    ld hl, $0217
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0072
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0013
    push hl
    push de
    ld hl, _VRAM
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    pop de
    push de
    ld hl, $000d
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0020
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0215
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0021
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0214
    add hl, sp
    ld a, [hl]
    or d
    ld b, a
    inc hl
    ld a, [hl]
    or e
    ld c, a
    ld hl, $0208
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
    pop de
    push de
    ld hl, $000f
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0022
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0209
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0023
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    or d
    ld b, a
    inc hl
    ld a, [hl]
    or e
    ld c, a
    ld hl, $0214
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
    pop de
    push de
    ld hl, $0013
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0026
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0209
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0027
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    or c
    ld d, a
    inc hl
    ld a, [hl]
    or b
    ld e, a
    dec hl
    ld [hl], d
    inc hl
    ld [hl], e
    ld a, e
    rla
    sbc a
    inc hl
    ld [hl+], a
    ld [hl], a
    ld hl, $0215
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld hl, $0017
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $002a
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0209
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $002b
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld c, a
    ld b, $00
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    or c
    ld d, a
    inc hl
    ld a, [hl]
    or b
    ld e, a
    dec hl
    ld [hl], d
    inc hl
    ld [hl], e
    ld a, e
    rla
    sbc a
    inc hl
    ld [hl+], a
    ld [hl], a
    ld hl, $0215
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    pop de
    push de
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0018
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0209
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0019
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    or d
    ld b, a
    inc hl
    ld a, [hl]
    or e
    ld c, a
    ld hl, $0214
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
    pop de
    push de
    ld hl, $000b
    add hl, de
    ld b, l
    ld c, h
    ld [hl], $04
    inc hl
    ld [hl], $01
    pop de
    push de
    ld hl, $001b
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0217
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    pop de
    push de
    ld hl, $001f
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $0208
    add hl, sp
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    inc bc
    inc hl
    ld a, [hl]
    ld [bc], a
    pop de
    push de
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    pop de
    push de
    ld hl, $0003
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0216
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    pop de
    push de
    ld hl, $0007
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0210
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, $0215
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld d, $00
    ld hl, $0107
    add hl, sp
    ld [hl], b
    pop de
    push de
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0107
    add hl, sp
    ld a, [hl]
    sub $0d
    jr nz, jr_003_45be

    ld a, $03
    ld [bc], a

jr_003_45be:
    ld hl, $0107
    add hl, sp
    ld a, [hl]
    sub $0e
    jr nz, jr_003_45ca

    ld a, $05
    ld [bc], a

jr_003_45ca:
    ld hl, $0107
    add hl, sp
    ld a, [hl]
    sub $0f
    jr nz, jr_003_45d6

    ld a, $07
    ld [bc], a

jr_003_45d6:
    ld a, [bc]
    sub $07
    jr nz, jr_003_45ed

    ld hl, $0208
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, $0216
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01

jr_003_45ed:
    ld a, [bc]
    sub $03
    jr nz, jr_003_45fb

    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_45fb:
    pop de
    push de
    ld hl, $0008
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0211
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr z, jr_003_462b

    ld hl, $0209
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $0210
    add hl, sp
    ld [hl], a
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    ld d, a
    or a
    jr z, jr_003_462b

    ld a, $01
    jr jr_003_462d

jr_003_462b:
    ld a, $00

jr_003_462d:
    ld [bc], a
    pop de
    push de
    ld hl, $0005
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0210
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, $0107
    add hl, sp
    ld [hl], $00

jr_003_4648:
    ld hl, $0107
    add hl, sp
    ld c, [hl]
    ld b, $00
    ld hl, $0080
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $020c
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    inc a
    jr z, jr_003_466c

    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_466c:
    ld hl, $0107
    add hl, sp
    inc [hl]
    ld a, [hl]
    sub $78
    jr c, jr_003_4648

    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0208
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0107
    add hl, sp
    ld [hl], $00
    ld hl, $0107
    add hl, sp
    ld c, [hl]
    ld b, $00
    ld hl, $00f8
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $020c
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, $0216
    add hl, sp
    ld [hl-], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0107
    add hl, sp
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, $020e
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0209
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0107
    add hl, sp
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, $020f
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    xor b
    ld d, a
    ld hl, $0216
    add hl, sp
    ld a, [hl]
    sub d
    jr z, jr_003_4703

    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_4703:
    ld hl, $0107
    add hl, sp
    inc [hl]
    ld a, [hl]
    sub $08
    jp c, $a6a2

    ld hl, $020e
    add hl, sp
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0107
    add hl, sp
    ld [hl], $00

jr_003_4725:
    ld a, [bc]
    inc bc
    ld d, a
    ld e, $00
    ld hl, $0214
    add hl, sp
    ld [hl], d
    inc hl
    ld [hl], e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $020e
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld a, l
    ld d, h
    ld hl, $020e
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0107
    add hl, sp
    inc [hl]
    ld a, [hl]
    sub $fc
    jr c, jr_003_4725

    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $00fc
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0214
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $00fe
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $0209
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $00ff
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld a, d
    ld hl, $0208
    add hl, sp
    or [hl]
    ld d, a
    ld a, e
    inc hl
    or [hl]
    ld e, a
    ld hl, $020e
    add hl, sp
    ld a, [hl]
    sub d
    jr nz, jr_003_47a5

    inc hl
    ld a, [hl]
    sub e
    jr z, jr_003_47ae

jr_003_47a5:
    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_47ae:
    ld hl, $020e
    add hl, sp
    ld a, [hl]
    xor $ff
    ld hl, sp+$04
    ld [hl], a
    ld hl, $020f
    add hl, sp
    ld a, [hl]
    xor $ff
    ld hl, sp+$05
    ld [hl], a
    ld hl, $0215
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld d, a
    ld e, $00
    ld hl, $020f
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
    ld hl, $0213
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $00fd
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
    ld hl, $020e
    add hl, sp
    ld a, [hl]
    or d
    ld c, a
    inc hl
    ld a, [hl]
    or e
    ld b, a
    ld hl, sp+$04
    ld a, [hl]
    sub c
    jr nz, jr_003_47fe

    inc hl
    ld a, [hl]
    sub b
    jr z, jr_003_4807

jr_003_47fe:
    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_4807:
    ld hl, $0106
    add hl, sp
    ld a, [hl]
    or a
    jr z, jr_003_4818

    ld hl, $0210
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_4818:
    pop de
    push de
    ld hl, $0011
    add hl, de
    ld a, l
    ld d, h
    ld hl, $020e
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld b, l
    ld c, h
    ld e, b
    ld d, c
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $020e
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
    ld hl, $0218
    add hl, sp
    ld sp, hl
    ret


    add sp, -$03
    ld hl, sp+$00
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld a, $80
    push af
    inc sp
    ld l, b
    ld h, c
    call $b266
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0314
    push hl
    ld hl, $0000
    push hl
    ld l, $20
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad40
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$05
    ld a, [hl]
    push af
    inc sp
    ld l, b
    ld h, c
    call $b266
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0600
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b266
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$05
    ld a, [hl]
    sub $30
    jr nz, jr_003_496e

    ld de, $ad4d
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    jp $ac49


jr_003_496e:
    ld hl, sp+$05
    ld a, [hl]
    sub $fb
    jr nz, jr_003_49a2

    ld de, $ad5f
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad73
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    jp $ac49


jr_003_49a2:
    ld hl, sp+$05
    ld a, [hl]
    sub $c0
    ld a, $00
    rla
    ld hl, sp+$01
    ld [hl], a
    ld a, [hl]
    or a
    jp nz, $aa76

    ld a, $d8
    ld hl, sp+$05
    sub [hl]
    ld a, $00
    rla
    ld hl, sp+$02
    ld [hl], a
    ld a, [hl]
    or a
    jp nz, $aa76

    ld de, $ad84
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad90
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, sp+$01
    ld a, [hl]
    or a
    jr nz, jr_003_4a18

    ld a, $ca
    ld hl, sp+$05
    sub [hl]
    jr c, jr_003_4a18

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad91
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02

jr_003_4a18:
    ld hl, sp+$05
    ld a, [hl]
    sub $d2
    jr z, jr_003_4a26

    ld hl, sp+$05
    ld a, [hl]
    sub $d3
    jr nz, jr_003_4a45

jr_003_4a26:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad9f
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02

jr_003_4a45:
    ld hl, sp+$05
    ld a, [hl]
    sub $d4
    jp c, $ac49

    ld hl, sp+$02
    ld a, [hl]
    or a
    jp nz, $ac49

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $adaf
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    jp $ac49


    ld hl, sp+$05
    ld a, [hl]
    sub $f0
    jr c, jr_003_4a8b

    ld de, $adc0
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    jp $ac49


jr_003_4a8b:
    ld hl, sp+$05
    ld a, [hl]
    sub $32
    jr z, jr_003_4a99

    ld hl, sp+$05
    ld a, [hl]
    sub $33
    jr nz, jr_003_4aa7

jr_003_4a99:
    ld de, $adca
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    jp $ac49


jr_003_4aa7:
    ld hl, sp+$05
    ld a, [hl]
    sub $37
    jr nz, jr_003_4ab2

    ld a, $01
    jr jr_003_4ab3

jr_003_4ab2:
    xor a

jr_003_4ab3:
    ld hl, sp+$02
    ld [hl], a
    ld a, [hl]
    or a
    jr nz, jr_003_4ac2

    ld hl, sp+$05
    ld a, [hl]
    sub $38
    jp nz, $ab94

jr_003_4ac2:
    ld de, $addd
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    ld hl, sp+$02
    ld a, [hl]
    or a
    jr z, jr_003_4af2

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $adf1
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02

jr_003_4af2:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad90
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae06
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae15
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad90
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae21
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, sp+$00
    ld [hl], $01
    jp $ac49


    ld hl, sp+$05
    ld a, [hl]
    sub $35
    jp nz, $ac0b

    ld de, $ae2f
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae3e
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ad90
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae21
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, sp+$00
    ld [hl], $01
    jp $ac49


    ld hl, sp+$05
    ld a, [hl]
    sub $52
    jr nz, jr_003_4c3e

    ld de, $ae49
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae58
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    jr jr_003_4c49

jr_003_4c3e:
    ld de, $ae6b
    push de
    ld l, c
    ld h, b
    call $b266
    add sp, $02

jr_003_4c49:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld a, $80
    push af
    inc sp
    ld l, b
    ld h, c
    call $b266
    inc sp
    ld hl, sp+$00
    ld a, [hl]
    or a
    jp z, $acd2

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0314
    push hl
    ld hl, $0000
    push hl
    ld l, $20
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae7d
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld hl, sp+$00
    ld a, [hl]
    or a
    jp z, $ad3d

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    add sp, $03
    ret

ErrorHeadingText::      DB "      ERROR:", 0
FileTooLargeText::      DB "File is too large", 0
Fat16NotSupportedText:: DB "FAT16 not supported", 0
PleaseUseFat32Text::    DB "Please use FAT32", 0
SDIOErrorText::         DB "SD IO error", 0
SDInitErrorText::       DB "SD init error", 0
DiskReadErrorText::     DB "disk read error", 0
DiskWriteErrorText::    DB "disk write error", 0
FatErrorText::          DB "FAT error", 0
GameNotLoadedText::     DB "Game is not loaded", 0
BatteryDryText::        DB "Battery has run dry", 0
RTCResetText::          DB "RTC reset to default", 0
PleaseReplaceText::     DB "Please replace", 0
TheBatteryText::        DB "the battery",0
PressAnyKeyText::       DB "Press any key", 0, 
SettingsResetText::     DB "Settings reset", 0
ToDefaultText::         DB "to default", 0
UnsupportedOSText::     DB "Unsupported OS", 0
OSUpdateRequiredText::  DB "OS update required", 0
UnexpectedErrorText::   DB "Unexcpected error", 0
WarningText::           DB "WARNING", 0

    add sp, -$1c
    ld hl, sp+$01

jr_003_4e89:
    ld a, l
    ld d, h
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $0f
    ld hl, sp+$19

jr_003_4e97:
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    ld a, $0e
    ld [bc], a
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc

jr_003_4ea5:
    ld a, $0d
    ld [bc], a
    dec hl
    ld c, [hl]
    inc hl

jr_003_4eab:
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, $0c
    ld [bc], a
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$1a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$05
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    push bc
    ld hl, $0010
    push hl
    xor a
    push af

jr_003_4ed5:
    inc sp
    push de
    ld hl, sp+$21
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $b266
    add sp, $05
    pop bc
    ld a, $89
    ld [bc], a
    ld hl, $0001
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$1a
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $03
    ld e, c
    ld d, b
    push bc
    push de
    call $b1dc
    add sp, $02
    pop bc
    ld hl, sp+$00
    ld [hl], $00

jr_003_4f03:
    ld hl, $ff00
    ld [hl], $20
    ld l, $00
    ld [hl], $01
    ld l, $00
    ld [hl], $30
    ld de, $ff00
    ld a, [de]
    and $0f
    sub $0c
    jr z, jr_003_4f22

    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $04
    jr c, jr_003_4f03

jr_003_4f22:
    ld hl, sp+$00
    ld [hl], $00
    ld hl, $ff00
    ld [hl], $20
    ld l, $00
    ld [hl], $01
    ld l, $00
    ld [hl], $30
    ld de, $ff00
    ld a, [de]
    and $0f
    ld hl, sp+$17
    ld [hl+], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$15
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc hl
    ld a, [hl-]
    dec hl
    sub [hl]
    jr z, jr_003_4f5c

    ld e, $00
    jr jr_003_4f77

jr_003_4f5c:
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $04
    jp c, $af26

    ld a, $89
    ld [bc], a
    ld hl, sp+$1a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
    call $b1dc
    add sp, $02
    ld e, $01

jr_003_4f77:
    add sp, $1c
    ret


    ld hl, sp+$03
    ld d, [hl]
    ld b, $00
    sla d
    rl b
    sla d
    rl b
    sla d
    rl b
    sla d
    rl b
    sla d
    rl b
    dec hl
    ld e, [hl]
    ld c, $00
    ld a, e
    or d
    ld e, a
    ld a, c
    or b
    ld d, a
    inc hl
    inc hl
    ld c, [hl]
    ld b, $00
    ld a, c
    add a
    add a
    ld c, a
    ld b, $00
    ld a, e
    or b
    ld e, a
    ld a, d
    or c
    ld d, a
    ret


    add sp, -$1c
    call $ae85
    ld c, e
    ld a, c
    or a
    jr nz, jr_003_4fbd

    ld e, a
    jp $b1d9


jr_003_4fbd:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$11
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0010
    push hl
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $05
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $41
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0003
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$16
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $ff
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld hl, sp+$16
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $89
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0001
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$18
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $b9
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $29
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $0e
    ld bc, $0000
    ld hl, sp+$10
    ld [hl], c
    ld a, [hl]
    add $02
    ld hl, sp+$13
    ld [hl-], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$14
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$10
    ld a, [hl]
    ld [de], a
    inc bc
    ld a, c
    sub $0e
    ld a, b
    sbc $00
    jp c, $b070

    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld bc, $0000
    ld hl, sp+$14
    ld [hl], c
    ld a, [hl]
    add $02
    dec hl
    ld [hl-], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$1a
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$14
    ld a, [hl]
    add $0e
    ld hl, sp+$1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    inc bc
    ld a, c
    sub $0e
    ld a, b
    sbc $00
    jp c, $b0a7

    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $04
    ld bc, $0000
    ld hl, sp+$1a
    ld [hl], c
    ld a, [hl]
    add $02
    ld hl, sp+$14
    ld [hl-], a
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    inc hl
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$14
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$1a
    ld a, [hl]
    add $1c
    ld hl, sp+$15
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    inc bc
    ld a, c
    sub $04
    ld a, b
    sbc $00
    jp c, $b0ea

    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0010
    push hl
    ld a, $ff
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b266
    add sp, $05
    ld hl, sp+$11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, sp+$19
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push bc
    ld hl, Bank0Address191D
    push hl
    ld a, $1f
    push af
    inc sp
    call $af7a
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    push bc
    ld hl, $0912
    push hl
    ld a, $1b
    push af
    inc sp
    call $af7a
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    push bc
    ld hl, $0405
    push hl
    ld a, $15
    push af
    inc sp
    call $af7a
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld c, l
    ld b, h
    push bc
    ld hl, $0a03
    push hl
    ld a, $06
    push af
    inc sp
    call $af7a
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $b1dc
    add sp, $02
    ld e, $01
    add sp, $1c
    ret


    add sp, -$03
    ld hl, $ff00
    ld [hl], $00
    ld l, $00
    ld [hl], $30
    ld hl, sp+$00
    ld [hl], $00
    ld hl, sp+$06
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    ld hl, sp+$01
    ld [hl], a
    inc bc
    inc hl
    ld [hl], $00

jr_003_51f9:
    ld hl, sp+$01
    bit 0, [hl]
    jr z, jr_003_520a

    ld hl, $ff00
    ld [hl], $10
    ld l, $00
    ld [hl], $30
    jr jr_003_5213

jr_003_520a:
    ld hl, $ff00
    ld [hl], $20
    ld l, $00
    ld [hl], $30

jr_003_5213:
    ld hl, sp+$01
    ld a, [hl]
    srl a
    ld [hl+], a
    inc [hl]
    ld a, [hl]
    sub $08
    jr c, jr_003_51f9

    dec hl
    dec hl
    inc [hl]
    ld a, [hl]
    sub $10
    jp c, $b1f1

    ld hl, $ff00
    ld [hl], $20
    ld l, $00
    ld [hl], $30
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0040
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0040
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b266
    add sp, $03
    ret


    jp hl


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
THEFUCKISTHIS::
    add sp, -$07
    ld hl, $bc00
    ld [hl], $00
    inc hl
    ld [hl], $02
    ld hl, sp+$09
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$00
    ld [hl+], a
    ld [hl], e
    ld de, $0234
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    pop de
    push de
    ld a, [de]
    ld hl, sp+$04
    ld [hl], a
    pop de
    push de
    ld hl, $0001
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    ld a, [hl]
    dec a
    jr nz, jr_003_6069

    ld hl, sp+$06
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, $bc02
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, $01
    push af
    inc sp
    call $a2ea
    inc sp
    jp $a10d


jr_003_6069:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $000e
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$02
    ld [hl+], a
    ld [hl], d
    inc hl
    ld a, [hl]
    sub $04
    jr nz, jr_003_60a8

    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld b, e
    ld c, d
    ld a, b
    add $21
    ld hl, $bc02
    ld [hl], a
    ld a, c
    adc $00
    inc hl
    ld [hl], a
    xor a
    push af
    inc sp
    call $a2ea
    inc sp
    jp $a10d


jr_003_60a8:
    ld hl, sp+$04
    ld a, [hl]
    sub $02
    jp nz, $a0e1

    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld b, e
    ld c, d
    ld a, b
    add $21
    ld hl, $bc02
    ld [hl], a
    ld a, c
    adc $00
    inc hl
    ld [hl], a
    ld hl, sp+$06
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    push bc
    call $a110
    add sp, $02
    jr jr_003_610d

    ld hl, sp+$04
    ld a, [hl]
    sub $03
    jr nz, jr_003_610b

    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld b, e
    ld c, d
    ld a, b
    add $21
    ld hl, $bc02
    ld [hl], a
    ld a, c
    adc $00
    inc hl
    ld [hl], a
    call $a6f5
    jr jr_003_610d

jr_003_610b:
    ld e, $00

jr_003_610d:
    add sp, $07
    ret


    add sp, -$80
    add sp, -$1a
    ld hl, $0090
    add hl, sp
    ld a, l
    ld d, h
    ld hl, $0098
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $b8
    inc hl
    ld [hl], $a2
    ld hl, $0099
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld a, $c5
    ld [bc], a
    inc bc
    ld a, $a2
    ld [bc], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld b, l
    ld c, h
    ld [hl], $c9
    inc hl
    ld [hl], $a2
    ld hl, $0099
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld b, l
    ld c, h
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0200
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a2cd
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a2de
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0062
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0099
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $03
    ld c, e
    ld a, c
    or a
    jr z, jr_003_6220

    ld e, $00
    jp $a2b3


jr_003_6220:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0046
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0000
    push hl
    ld hl, $009e
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $04
    ld a, e
    or a
    jr z, jr_003_6281

    ld e, a
    jp $a2b3


jr_003_6281:
    ld hl, sp+$00
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    push bc
    push de
    call $aa3b
    add sp, $02
    pop bc
    ld a, e
    or a
    jr nz, jr_003_62b3

    ld e, c
    ld d, b
    push bc
    push de
    call $abb7
    add sp, $02
    pop bc
    bit 1, e
    jr nz, jr_003_62a5

    ld e, $00
    jr jr_003_62b3

jr_003_62a5:
    xor a
    push af
    inc sp
    push bc
    call $a373
    add sp, $03
    ld a, e
    or a
    jr nz, jr_003_62b3

    ld e, a

jr_003_62b3:
    add sp, $7f
    add sp, $1b
    ret


    jr nz, jr_003_62da

    jr nz, jr_003_62dc

    jr nz, jr_003_62de

    jr nz, jr_003_62e0

    jr nz, jr_003_62e2

    jr nz, @+$22

    nop
    ld e, c
    ld h, l
    ld [hl], e
    nop
    ld c, [hl]
    ld l, a
    jr nz, jr_003_62cd

jr_003_62cd:
    ld c, h
    ld l, a
    ld h, c
    ld h, h
    jr nz, @+$65

    ld l, b
    ld h, l
    ld h, c
    ld [hl], h
    ld [hl], e
    jr nz, jr_003_6340

jr_003_62da:
    ld [hl], d
    ld l, a

jr_003_62dc:
    ld l, l
    nop

jr_003_62de:
    jr nz, jr_003_6354

jr_003_62e0:
    ld h, l
    ld a, b

jr_003_62e2:
    ld [hl], h
    jr nz, jr_003_634b

    ld l, c
    ld l, h
    ld h, l
    ccf
    nop
    add sp, -$80
    add sp, -$11
    xor a
    push af
    inc sp
    call $a8d3
    inc sp
    ld hl, $0090
    add hl, sp
    ld [hl], e
    ld a, [hl]
    or a
    jp z, $a338

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, $0090
    push hl
    ld a, $58
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld hl, $0090
    add hl, sp
    ld a, [hl]
    sub $f0
    jr z, jr_003_6346

    ld hl, $0090
    add hl, sp
    ld e, [hl]
    jp $a36e


    ld hl, sp+$00
    ld e, l
    ld d, h
    push de
    call $aa3b

jr_003_6340:
    add sp, $02
    ld a, e
    or a
    jr nz, jr_003_636e

jr_003_6346:
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld c, e

jr_003_634b:
    ld b, d
    push de
    push bc
    call $abb7
    add sp, $02
    ld a, e

jr_003_6354:
    pop de
    rrca
    jr c, jr_003_635c

    ld e, $00
    jr jr_003_636e

jr_003_635c:
    ld hl, $0093
    add hl, sp
    ld a, [hl]
    push af
    inc sp
    push de
    call $a373
    add sp, $03
    ld a, e
    or a
    jr nz, jr_003_636e

    ld e, a

jr_003_636e:
    add sp, $7f
    add sp, $12
    ret


    dec sp
    ld hl, sp+$00
    ld [hl], $00
    ld hl, sp+$05
    ld a, [hl]
    or a
    jp nz, $a5fd

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld a, $80
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0314
    push hl
    ld l, $00
    push hl
    ld hl, $0020
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $06
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a616
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a628
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld a, $80
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $a653
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0700
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a629
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a639
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0a00
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$00
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    ld d, a
    or a
    jr z, jr_003_653d

    ld d, $80
    jr jr_003_653f

jr_003_653d:
    ld d, $00

jr_003_653f:
    push de
    inc sp
    ld l, c
    ld h, b
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a64b
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$00
    ld a, [hl]
    dec a
    jr nz, jr_003_6584

    ld d, $80
    jr jr_003_6586

jr_003_6584:
    ld d, $00

jr_003_6586:
    push de
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a64f
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld b, e
    ld a, b
    cp $40
    jr z, jr_003_65e9

    sub $80
    jr nz, jr_003_65f0

jr_003_65e9:
    ld hl, sp+$00
    ld a, [hl]
    inc a
    and $01
    ld [hl], a

jr_003_65f0:
    dec b
    jp nz, $a4fa

    ld hl, sp+$00
    ld a, [hl]
    dec a
    jr nz, jr_003_65fd

    ld e, a
    jr jr_003_6614

jr_003_65fd:
    ld a, $01
    push af
    inc sp
    call $a8d3
    inc sp
    ld a, e
    or a
    jr nz, jr_003_6614

    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $af98
    add sp, $02

jr_003_6614:
    inc sp
    ret


    ld c, h
    ld h, c
    ld [hl], e
    ld [hl], h
    jr nz, @+$72

    ld l, h
    ld h, c
    ld a, c
    ld h, l
    ld h, h
    jr nz, jr_003_668a

    ld h, c
    ld l, l
    ld h, l
    ld a, [hl-]
    nop
    nop
    ld b, c
    ld [hl], b
    ld [hl], b
    ld l, h
    ld a, c
    jr nz, jr_003_6693

    ld l, b
    ld h, l
    ld h, c
    ld [hl], h
    ld [hl], e
    jr nz, @+$76

    ld l, a
    nop
    ld l, h
    ld h, c
    ld [hl], e
    ld [hl], h
    jr nz, jr_003_66af

    ld l, h
    ld h, c
    ld a, c
    ld h, l
    ld h, h
    jr nz, jr_003_66ad

    ld h, c
    ld l, l
    ld h, l
    ccf
    nop
    ld e, c
    ld h, l
    ld [hl], e
    nop
    ld c, [hl]
    ld l, a
    jr nz, jr_003_6653

jr_003_6653:
    add sp, -$07
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $005a
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld a, e
    ld hl, sp+$00
    ld [hl+], a
    inc hl
    ld [hl], $00
    ld hl, sp+$02
    ld a, [hl-]
    dec hl
    sub [hl]
    jp nc, $a6f2

    inc hl
    inc hl
    ld a, [hl]
    sub $3c

jr_003_668a:
    jp nc, $a6f2

    ld c, [hl]
    ld b, $00
    ld hl, $0014

jr_003_6693:
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$01
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]

jr_003_66ad:
    ld h, [hl]
    ld l, a

jr_003_66af:
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$03
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$02
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    push bc
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $b489
    add sp, $02
    ld hl, sp+$06
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$01
    ld a, [hl]
    ld [de], a
    inc hl
    ld a, [hl]
    add $14
    ld [hl], a
    jp $a67d


    add sp, $07
    ret


    add sp, -$80
    add sp, -$14
    xor a
    push af
    inc sp
    call $a8d3
    inc sp
    ld a, e
    sub $f0
    jr nz, jr_003_6709

    ld e, a
    jp $a756


jr_003_6709:
    ld a, e
    or a
    jp nz, $a756

    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, $0092
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call $aa3b
    add sp, $02
    ld a, e
    or a
    jp nz, $a756

    ld bc, $0000

jr_003_672a:
    ld hl, $0092
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld d, h
    ld hl, $0090
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push bc
    push de
    call $a75b
    add sp, $02
    pop bc
    ld hl, $0009
    add hl, bc
    ld c, l
    ld b, h
    ld a, c
    sub $90
    ld a, b
    sbc $00
    jr c, jr_003_672a

    ld e, $00
    add sp, $7f
    add sp, $15
    ret


    add sp, -$12
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0c
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, sp+$16
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $b1a3
    add sp, $04
    ld a, e
    or a
    jp nz, $a8d0

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $000e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld c, e
    ld b, d
    ld hl, $0006
    add hl, bc
    ld c, l
    ld b, h
    ld hl, $0007
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0e
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$07
    ld [hl], b
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, sp+$10
    ld [hl], c
    ld a, b
    and $01
    inc hl
    ld [hl-], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $be00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0a
    ld [hl+], a
    ld [hl], d
    ld a, b
    and $3f
    ld b, a
    srl a
    ld hl, sp+$08
    ld [hl+], a
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0016
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, sp+$0f
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    inc hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$11
    ld a, [hl]
    or a
    jp nz, $a895

    ld hl, sp+$10
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, sp+$08
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$0e
    ld [hl+], a
    ld [hl], e
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, sp+$0b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    ld hl, sp+$07
    ld a, [hl]
    sub b
    jr nz, jr_003_6873

    ld hl, sp+$11
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b

jr_003_6873:
    ld hl, sp+$0f
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0020
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0e
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$05
    ld d, h
    ld e, l
    ld hl, sp+$0e
    ld a, [de]
    sub [hl]
    inc hl
    inc de
    ld a, [de]
    sbc [hl]
    jp c, $a8d0

    jp $a836


    ld hl, $bc00
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$10
    ld [hl+], a
    ld [hl], e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0014
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$10
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push bc
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $b489
    add sp, $02
    pop bc
    ld a, [bc]
    ld b, a
    ld hl, sp+$0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    add sp, $12
    ret


    add sp, -$80
    add sp, -$80
    add sp, -$80
    add sp, -$6b
    ld hl, $01ed
    add hl, sp
    ld a, [hl]
    or a
    jp z, $a952

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $a9da
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0050
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $00e5
    add hl, sp
    ld a, l
    ld d, h
    ld hl, $01e5
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld hl, $a9f8
    push hl
    ld hl, $bc02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $a9e9
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $08
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0048
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, $01e9
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, $01ed
    add hl, sp
    ld a, [hl]
    ld hl, $01e7
    add hl, sp
    ld [hl+], a
    ld [hl], $00
    ld hl, sp+$00
    ld e, l
    ld d, h
    ld hl, $01e6
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    push bc
    ld hl, $01ef
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    call $b489
    add sp, $06
    ld a, e
    add sp, $7f
    add sp, $7f
    add sp, $7f
    add sp, $6e
    ret


    ld d, e
    ld h, c
    db $76
    ld l, c
    ld l, [hl]
    ld h, a
    jr nz, @+$66

    ld h, c
    ld [hl], h
    ld h, c
    ld l, $2e
    ld l, $00
    cpl
    ld b, a
    ld b, d
    ld b, e
    ld d, e
    ld e, c
    ld d, e
    cpl
    ld b, e
    ld c, b
    ld b, l
    ld b, c
    ld d, h
    ld d, e
    nop
    ld [hl], h
    ld a, b
    ld [hl], h
    nop
    add sp, -$02
    ld hl, sp+$05
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, sp+$00
    ld [hl], $00

jr_003_6a08:
    ld a, [bc]
    ld hl, sp+$01
    ld [hl], a
    ld a, [hl]
    sub $41
    jr c, jr_003_6a16

    ld a, $46
    sub [hl]
    jr nc, jr_003_6a2d

jr_003_6a16:
    ld hl, sp+$01
    ld a, [hl]
    sub $30
    jr c, jr_003_6a22

    ld a, $39
    sub [hl]
    jr nc, jr_003_6a2d

jr_003_6a22:
    ld hl, sp+$01
    ld a, [hl]
    sub $58
    jr z, jr_003_6a2d

    ld e, $00
    jr jr_003_6a38

jr_003_6a2d:
    inc bc
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $03
    jr c, jr_003_6a08

    ld e, $01

jr_003_6a38:
    add sp, $02
    ret


    ld hl, $fdf6
    add hl, sp
    ld sp, hl
    ld hl, sp+$02
    ld a, l
    ld d, h
    ld hl, $0204
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld e, [hl]
    inc hl
    ld [hl+], a
    ld [hl], e
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $004a
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0205
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, $01
    push af
    inc sp
    ld hl, $0001
    push hl
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld a, e
    or a
    jr z, jr_003_6a84

    ld e, a
    jp $abad


jr_003_6a84:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $020d
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0090
    push hl
    ld a, $58
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld hl, sp+$00
    ld [hl], $00
    ld hl, $0202
    add hl, sp
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $0207
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    sub $2d
    jp nz, $ab8b

    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $a9fc
    add sp, $02
    ld a, e
    or a
    jp z, $ab8b

    ld hl, $0207
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $020c
    add hl, sp
    ld a, [hl+]
    ld e, [hl]
    ld hl, $0204
    add hl, sp
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$01
    ld [hl], $00

jr_003_6af5:
    ld a, [bc]
    inc bc
    ld hl, $0205
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    dec hl
    inc [hl]
    jr nz, jr_003_6b06

    inc hl
    inc [hl]

jr_003_6b06:
    ld hl, sp+$01
    inc [hl]
    ld a, [hl]
    sub $03
    jr c, jr_003_6af5

    inc bc
    ld [hl], $00

jr_003_6b11:
    ld a, [bc]
    inc bc
    ld hl, $0205
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld [de], a
    dec hl
    inc [hl]
    jr nz, jr_003_6b22

    inc hl
    inc [hl]

jr_003_6b22:
    ld hl, sp+$01
    inc [hl]
    ld a, [hl]
    sub $03
    jr c, jr_003_6b11

    ld hl, $0206
    add hl, sp
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, $0204
    add hl, sp
    ld a, [hl+]
    ld e, [hl]
    ld hl, $020c
    add hl, sp
    ld [hl+], a
    ld [hl], e
    ld a, [bc]
    sub $2d
    jp nz, $ab83

    inc bc
    ld hl, $0208
    add hl, sp
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, $0205
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, sp+$01
    ld [hl], $00

jr_003_6b57:
    ld hl, $0209
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    inc [hl]
    jr nz, jr_003_6b66

    inc hl
    inc [hl]

jr_003_6b66:
    ld [bc], a
    inc bc
    ld hl, sp+$01
    inc [hl]
    ld a, [hl]
    sub $03
    jr c, jr_003_6b57

    ld hl, $0208
    add hl, sp
    ld a, [hl+]
    ld e, [hl]
    ld hl, $0206
    add hl, sp
    ld [hl+], a
    ld [hl], e
    ld hl, $020c
    add hl, sp
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $10
    jr z, jr_003_6bab

    ld hl, $0206
    add hl, sp
    inc [hl]
    jr nz, jr_003_6b94

    inc hl
    inc [hl]

jr_003_6b94:
    ld hl, $0202
    add hl, sp
    inc [hl]
    jr nz, jr_003_6b9d

    inc hl
    inc [hl]

jr_003_6b9d:
    ld hl, $0202
    add hl, sp
    ld a, [hl]
    sub $f8
    inc hl
    ld a, [hl]
    sbc $01
    jp c, $aabd

jr_003_6bab:
    ld e, $00
    ld c, l
    ld b, h
    ld hl, $020a
    add hl, sp
    ld sp, hl
    ld l, c
    ld h, b
    ret


    add sp, -$15
    ld hl, sp+$04
    ld c, l
    ld b, h
    ld [hl], $fb
    inc hl
    ld [hl], $ad
    ld hl, $0002
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$13
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $05
    inc hl
    ld [hl], $ae
    ld hl, $0004
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$13
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $0a
    inc hl
    ld [hl], $ae
    ld hl, $0006
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$13
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, sp+$03
    ld [hl], $00
    ld hl, sp+$0d
    ld [hl], $00
    ld hl, sp+$00
    ld [hl], $01
    ld hl, sp+$0e
    ld [hl], $00
    push bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $af68
    add sp, $02
    pop bc
    ld hl, sp+$02
    ld [hl], e
    ld hl, sp+$13
    ld [hl], c
    inc hl
    ld [hl], b
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, sp+$17
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$01
    ld [hl], $00
    ld hl, sp+$03
    ld a, [hl-]
    dec hl
    sub [hl]
    jr nz, jr_003_6c56

    ld a, $01
    jr jr_003_6c57

jr_003_6c56:
    xor a

jr_003_6c57:
    ld d, a
    ld hl, sp+$00
    ld a, [hl]
    or a
    jr nz, jr_003_6c6a

    ld a, d
    or a
    jr nz, jr_003_6c6a

    ld hl, sp+$0d
    ld a, [hl]
    ld hl, sp+$01
    sub [hl]
    jr nz, jr_003_6c83

jr_003_6c6a:
    ld a, d
    or a
    jr z, jr_003_6c72

    ld d, $ff
    jr jr_003_6c74

jr_003_6c72:
    ld d, $f0

jr_003_6c74:
    push de
    inc sp
    ld hl, sp+$10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $b343
    add sp, $03
    jr jr_003_6ca2

jr_003_6c83:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld de, $ae10
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02

jr_003_6ca2:
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$01
    inc [hl]
    ld a, [hl]
    sub $10
    jp c, $ac4b

    push hl
    inc hl
    inc hl
    ld a, [hl]
    ld hl, sp+$0f
    ld [hl], a
    pop hl
    ld hl, sp+$00
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld a, e
    ld hl, sp+$0c
    ld [hl], a
    bit 6, [hl]
    jr z, jr_003_6d18

    ld hl, sp+$03
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    ld d, a
    or a
    jr z, jr_003_6d11

    ld b, $0f
    jr jr_003_6d15

jr_003_6d11:
    ld hl, sp+$03
    ld b, [hl]
    dec b

jr_003_6d15:
    ld hl, sp+$03
    ld [hl], b

jr_003_6d18:
    ld hl, sp+$0c
    bit 7, [hl]
    jr z, jr_003_6d2c

    ld hl, sp+$03
    ld a, [hl]
    sub $0f
    jr z, jr_003_6d29

    ld hl, sp+$03
    ld a, [hl]
    inc a

jr_003_6d29:
    ld hl, sp+$03
    ld [hl], a

jr_003_6d2c:
    ld hl, sp+$0c
    bit 0, [hl]
    jp z, $adc6

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0062
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$14
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $03
    ld a, e
    ld hl, sp+$0f
    ld [hl], a
    ld hl, sp+$00
    ld [hl], $01
    ld hl, sp+$0f
    ld a, [hl]
    inc a
    jp z, $ac20

    ld hl, sp+$0e
    ld [hl], $01
    ld hl, sp+$03
    ld c, [hl]
    ld b, $00
    ld l, c
    ld h, b
    add hl, hl
    add hl, hl
    add hl, hl
    add hl, bc
    ld c, l
    ld b, h
    ld hl, sp+$17
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld d, h
    ld hl, sp+$11
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0f
    ld a, [hl]
    or a
    jr nz, jr_003_6d95

    inc hl
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $ae11
    add sp, $02

jr_003_6d95:
    ld hl, sp+$0f
    ld a, [hl]
    dec a
    jp nz, $adc6

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0009
    push hl
    ld a, $58
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld hl, sp+$0c
    bit 1, [hl]
    jp z, $ac20

    ld hl, sp+$17
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $af68
    add sp, $02
    ld d, e
    ld a, d
    or a
    jr nz, jr_003_6de6

    ld hl, sp+$02
    ld a, [hl]
    or a
    jr nz, jr_003_6de6

    ld e, a
    jr jr_003_6df8

jr_003_6de6:
    ld e, $00
    ld a, d
    or a
    jr z, jr_003_6dee

    ld e, $02

jr_003_6dee:
    ld hl, sp+$0e
    ld a, [hl]
    or a
    jr z, jr_003_6df8

    ld a, e
    set 0, a
    ld e, a

jr_003_6df8:
    add sp, $15
    ret


    ld b, e
    ld l, a
    ld h, h
    ld h, l
    jr nz, jr_003_6e6e

    ld h, l
    ld l, [hl]
    ld [hl], l
    nop
    ld b, l
    ld h, h
    ld l, c
    ld [hl], h
    nop
    ld b, e
    ld l, h
    ld h, l
    ld h, c
    ld [hl], d
    nop
    nop
    add sp, -$06
    ld hl, sp+$01
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0038
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $0700
    push hl
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    ld hl, sp+$01
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    call $b343
    add sp, $03
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b

jr_003_6e6e:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
    call $b489
    ld a, e
    ld hl, sp+$02
    ld [hl], a
    ld a, [hl]
    dec a
    jp z, $af65

    ld hl, sp+$02
    ld a, [hl]
    sub $02
    jp z, $af65

    ld hl, sp+$09
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$01
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$03
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$00
    ld [hl], a
    ld a, [hl]
    sub $58
    jr nz, jr_003_6ec5

    ld a, $01
    jr jr_003_6ec6

jr_003_6ec5:
    xor a

jr_003_6ec6:
    ld hl, sp+$05
    ld [hl], a
    ld hl, sp+$02
    bit 6, [hl]
    jr z, jr_003_6ef9

    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_003_6ed9

    ld b, $46
    jr jr_003_6ef3

jr_003_6ed9:
    ld hl, sp+$00
    ld a, [hl]
    sub $30
    jr nz, jr_003_6ee4

    ld b, $58
    jr jr_003_6ef3

jr_003_6ee4:
    ld hl, sp+$00
    ld a, [hl]
    sub $41
    jr nz, jr_003_6eef

    ld b, $39
    jr jr_003_6ef3

jr_003_6eef:
    ld hl, sp+$00
    ld b, [hl]
    dec b

jr_003_6ef3:
    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b

jr_003_6ef9:
    ld hl, sp+$02
    bit 7, [hl]
    jp z, $af30

    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_003_6f0a

    ld [hl], $30
    jr jr_003_6f27

jr_003_6f0a:
    ld hl, sp+$00
    ld a, [hl]
    sub $46
    jr nz, jr_003_6f15

    ld a, $58
    jr jr_003_6f24

jr_003_6f15:
    ld hl, sp+$00
    ld a, [hl]
    sub $39
    jr nz, jr_003_6f20

    ld a, $41
    jr jr_003_6f24

jr_003_6f20:
    ld hl, sp+$00
    ld a, [hl]
    inc a

jr_003_6f24:
    ld hl, sp+$05
    ld [hl], a

jr_003_6f27:
    ld hl, sp+$04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    inc hl
    ld a, [hl]
    ld [de], a
    ld hl, sp+$02
    bit 5, [hl]
    jr z, jr_003_6f4d

    ld hl, sp+$01
    ld a, [hl]
    sub $01
    ld a, $00
    rla
    ld d, a
    or a
    jr z, jr_003_6f46

    ld b, $08
    jr jr_003_6f4a

jr_003_6f46:
    ld hl, sp+$01
    ld b, [hl]
    dec b

jr_003_6f4a:
    ld hl, sp+$01
    ld [hl], b

jr_003_6f4d:
    ld hl, sp+$02
    bit 4, [hl]
    jp z, $ae30

    ld hl, sp+$01
    ld a, [hl]
    sub $08
    jr z, jr_003_6f5f

    ld hl, sp+$01
    ld a, [hl]
    inc a

jr_003_6f5f:
    ld hl, sp+$01
    ld [hl], a
    jp $ae30


    add sp, $06
    ret


    add sp, -$02
    ld hl, sp+$00
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, sp+$05
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_003_6f77:
    ld a, [bc]
    inc bc
    sub $58
    jr z, jr_003_6f81

    ld e, $01
    jr jr_003_6f95

jr_003_6f81:
    ld hl, sp+$00
    inc [hl]
    jr nz, jr_003_6f88

    inc hl
    inc [hl]

jr_003_6f88:
    ld hl, sp+$00
    ld a, [hl]
    sub $90
    inc hl
    ld a, [hl]
    sbc $00
    jr c, jr_003_6f77

    ld e, $00

jr_003_6f95:
    add sp, $02
    ret


    ld hl, $fdf3
    add hl, sp
    ld sp, hl
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$03
    ld a, l
    ld d, h
    ld hl, $0209
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0200
    push hl
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld hl, $020f
    add hl, sp
    ld a, [hl+]
    ld e, [hl]
    ld hl, $0205
    add hl, sp
    ld [hl+], a
    ld [hl], e
    ld hl, $0209
    add hl, sp
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld hl, $0207
    add hl, sp
    ld [hl], d
    inc hl
    ld [hl], e
    ld hl, sp+$01
    ld [hl], $10
    inc hl
    ld [hl], $00
    ld hl, $0208
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, $2d
    ld [bc], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld c, l
    ld b, h
    ld a, $2d
    ld [bc], a
    ld hl, $0208
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld c, l
    ld b, h
    ld a, $0d
    ld [bc], a
    ld hl, $0208
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000c
    add hl, de
    ld c, l
    ld b, h
    ld a, $0a
    ld [bc], a
    ld hl, sp+$00
    ld [hl], $00
    ld hl, $0208
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0203
    add hl, sp
    ld [hl+], a
    ld [hl], d
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, $0203
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$00
    ld a, [hl]
    ld hl, $0203
    add hl, sp
    ld [hl+], a
    ld [hl], $00
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0207
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld d, h
    ld hl, $020b
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0204
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, $020b
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, $0204
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0207
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld a, l
    ld d, h
    ld hl, $020b
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0204
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld hl, $0205
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, $020b
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $03
    jp c, $b030

    ld hl, $0206
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0205
    add hl, sp
    ld [hl+], a
    ld [hl], d
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000d
    add hl, de
    ld a, l
    ld d, h
    ld hl, $0207
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$02
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    dec de
    dec hl
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, [hl-]
    or [hl]
    jp nz, $afef

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $004c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, $020a
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, $01
    push af
    inc sp
    ld hl, $0001
    push hl
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $05
    ld a, e
    or a
    jr z, jr_003_714c

    ld e, a
    jr jr_003_714e

jr_003_714c:
    ld e, $00

jr_003_714e:
    ld c, l
    ld b, h
    ld hl, $020d
    add hl, sp
    ld sp, hl
    ld l, c
    ld h, b
    ret


    ld hl, sp+$02
    ld a, [hl]
    sub $58
    jr nz, jr_003_7162

    ld e, $58
    ret


jr_003_7162:
    ld hl, sp+$02
    ld b, [hl]
    ld a, [hl]
    sub $30
    jr c, jr_003_7175

    ld a, $39
    sub [hl]
    jr c, jr_003_7175

    ld a, b
    add $d0
    ld [hl], a
    jr jr_003_719c

jr_003_7175:
    ld hl, sp+$02
    ld a, [hl]
    sub $41
    jr c, jr_003_7187

    ld a, $46
    sub [hl]
    jr c, jr_003_7187

    ld a, b
    add $c9
    ld [hl], a
    jr jr_003_719c

jr_003_7187:
    ld hl, sp+$02
    ld a, [hl]
    sub $61
    jr c, jr_003_7199

    ld a, $66
    sub [hl]
    jr c, jr_003_7199

    ld a, b
    add $a9
    ld [hl], a
    jr jr_003_719c

jr_003_7199:
    ld e, $ff
    ret


jr_003_719c:
    ld hl, sp+$02
    ld a, [hl]
    and $0f
    ld e, a
    ret


    add sp, -$0a
    ld hl, sp+$0e
    ld a, [hl+]
    ld e, [hl]
    ld hl, sp+$03
    ld [hl+], a
    ld [hl], e
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ld hl, sp+$04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$05
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $ff
    inc hl
    ld [hl], $ff
    ld hl, sp+$00
    ld [hl], $00

jr_003_71d3:
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    sub $58
    jr nz, jr_003_71eb

    ld e, $01
    jp $b340


jr_003_71eb:
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $06
    jr c, jr_003_71d3

    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    push af
    inc sp
    call $b158
    inc sp
    ld b, e
    ld c, $00
    ld a, b
    sub $08
    ld a, c
    sbc $00
    jr nc, jr_003_7216

    ld e, $01
    jp $b340


jr_003_7216:
    ld a, $0f
    sub b
    ld b, a
    ld a, $00
    sbc c
    ld c, a
    ld hl, sp+$09
    ld [hl], b
    ld a, b
    swap a
    and $f0
    ld [hl-], a
    ld [hl], $00
    ld hl, sp+$0d
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    push af
    inc sp
    call $b158
    inc sp
    ld d, $00
    ld c, $00
    ld b, e
    ld hl, sp+$08
    ld a, [hl]
    or c
    ld d, a
    inc hl
    ld a, [hl]
    or b
    ld e, a
    ld hl, sp+$01
    ld [hl], d
    inc hl
    ld [hl], e
    ld hl, sp+$0d
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, [bc]
    push af
    inc sp
    call $b158
    inc sp
    ld d, $00
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    sla e
    rl d
    ld hl, sp+$01
    ld a, [hl]
    or e
    ld hl, sp+$08
    ld [hl], a
    ld hl, sp+$02
    ld a, [hl]
    or d
    ld hl, sp+$09
    ld [hl], a
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    push af
    inc sp
    call $b158
    inc sp
    ld d, $00
    ld hl, sp+$08
    ld a, [hl]
    or e
    ld [hl+], a
    ld a, [hl]
    or d
    ld [hl], a
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld hl, sp+$07
    ld [hl], a
    ld a, [hl]
    sub $58
    jp z, $b2f7

    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    sub $58
    jp z, $b2f7

    push bc
    ld hl, sp+$09
    ld a, [hl]
    push af
    inc sp
    call $b158
    inc sp
    ld a, e
    pop bc
    swap a
    and $f0
    ld d, a
    ld a, [bc]
    push de
    push af
    inc sp
    call $b158
    inc sp
    ld a, e
    pop de
    or d
    xor $ff
    ld d, a
    rrca
    rrca
    and $3f
    ld e, a
    ld a, d
    rrca
    rrca
    and $c0
    or e
    xor $45
    ld b, a
    ld c, $00
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
    ld hl, sp+$04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$08
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    ld hl, sp+$04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$08
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$0d
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld a, [bc]
    push bc
    push af
    inc sp
    call $b158
    inc sp
    ld a, e
    pop bc
    swap a
    and $f0
    ld hl, sp+$07
    ld [hl], a
    inc bc
    ld a, [bc]
    push af
    inc sp
    call $b158
    inc sp
    ld a, e
    ld hl, sp+$07
    or [hl]
    ld b, a
    inc hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld e, $00
    add sp, $0a
    ret


    add sp, -$13
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, sp+$0f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld a, $2d
    ld [bc], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0007
    add hl, de
    ld c, l
    ld b, h
    ld a, $2d
    ld [bc], a
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000b
    add hl, de
    ld c, l
    ld b, h
    xor a
    ld [bc], a
    ld hl, sp+$0c
    ld [hl], $00
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0d
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$16
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, sp+$0c
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$0c
    ld b, [hl]
    inc b
    inc b
    inc b
    inc b
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0d
    ld [hl+], a
    ld [hl], d
    dec hl
    dec hl
    ld a, [hl]
    ld hl, sp+$11
    ld [hl+], a
    ld [hl], $00
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
    ld hl, sp+$15
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$0c
    ld a, [hl]
    add $08
    ld b, a
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0d
    ld [hl+], a
    ld [hl], d
    ld hl, sp+$12
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld hl, sp+$15
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
    ld hl, sp+$0d
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$0c
    inc [hl]
    ld a, [hl]
    sub $03
    jp c, $b376

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$17
    ld a, [hl]
    inc a
    jr nz, jr_003_7435

    ld a, $80
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp
    jr jr_003_743e

jr_003_7435:
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
    call $b489
    inc sp

jr_003_743e:
    ld hl, sp+$17
    ld a, [hl]
    sub $09
    jr nc, jr_003_7464

    ld b, [hl]
    ld a, $02
    sub b
    jr nc, jr_003_744c

    inc b

jr_003_744c:
    ld a, $05
    ld hl, sp+$17
    sub [hl]
    jr nc, jr_003_7454

    inc b

jr_003_7454:
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld l, b
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    set 7, a
    ld [bc], a

jr_003_7464:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0024
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
    call $b489
    add sp, $02
    add sp, $13
    ret


    jp hl


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
