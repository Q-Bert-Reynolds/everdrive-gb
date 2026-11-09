; OS page 7: runtime $a000-$bfff via $BD08.
; Linker addresses $6000-$7fff describe its location in the BIN only.
SECTION "OS page 7 image", ROMX[$6000], BANK[3]

CheatServiceDispatch:
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
    ld de, OSAPI_ClearShadowScreen
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld b, e
    ld c, d
    ld a, b
  add $22
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld b, e
    ld c, d
    ld a, b
  add $22
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld b, e
    ld c, d
    ld a, b
  add $22
    ld hl, $bc02
    ld [hl], a
    ld a, c
    adc $00
    inc hl
    ld [hl], a
  call $a6f1
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
    ld de, CheatImportLine1 + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
    ld de, CheatImportLine2 + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call $aa3a
    add sp, $02
    pop bc
    ld a, e
    or a
    jr nz, jr_003_62b3

    ld e, c
    ld d, b
    push bc
    push de
  call $abbd
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

    jr nz, CheatImportLine2

    jr nz, jr_003_62e0

    jr nz, jr_003_62e2

  jr nz, @ + 34

    nop
    ld e, c
    ld h, l
    ld [hl], e
    nop
    ld c, [hl]
    ld l, a
    jr nz, CheatImportLine1
CheatImportLine1::
  DB "Load cheats f"
jr_003_62da:
  DB "ro"
jr_003_62dc:
  DB "m", $00
CheatImportLine2::
  DB " t"
jr_003_62e0:
  DB "ex"
jr_003_62e2:
  DB "t file?", $00
    add sp, -$80
    add sp, -$11
    xor a
    push af
    inc sp
  call $a8cf
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call $aa3a

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
  call $abbd
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
    ld de, CheatLastGameText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
    ld de, CheatApplyLine1 + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
    ld de, CheatApplyLine2 + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call $a8cf
    inc sp
    ld a, e
    or a
    jr nz, jr_003_6614

    ld hl, sp+$03
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $af9b
    add sp, $02

jr_003_6614:
    inc sp
    ret
CheatLastGameText::
  DB "Last played game:", $00
    nop
CheatApplyLine1::
  DB "Apply cheats to", $00
CheatApplyLine2::
  DB "last played game?", $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld a, e
  ld hl, sp + $01
  ld [hl-], a
  ld [hl], $00
    ld hl, sp+$00
  ld a, [hl+]
    sub [hl]
  jp nc, $a6ee
  dec hl
    ld a, [hl]
    sub $3c

jr_003_668a:
  jp nc, $a6ee

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
  ld hl, sp + $03
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  dec hl
  dec hl
  ld [hl+], a
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
  ld hl, sp + $05
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$0a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    push bc
  ld hl, sp + $07
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  dec hl
  dec hl
    ld a, [hl]
    ld [de], a
  dec hl
  dec hl
    ld a, [hl]
    add $14
    ld [hl], a
  jp $a67c


    add sp, $07
    ret


    add sp, -$80
    add sp, -$14
    xor a
    push af
    inc sp
  call $a8cf
    inc sp
    ld a, e
    sub $f0
    jr nz, jr_003_6709

    ld e, a
  jp $a752


jr_003_6709:
    ld a, e
    or a
  jp nz, $a752

    ld hl, sp+$00
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
  push de
  call $aa3a
  add sp, $02
  ld a, e
  or a
  jp nz, $a752
  ld bc, $0000
  ld hl, $0090
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
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
    push bc
    push de
  call $a757
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
  jr c, @ - 40

    ld e, $00
    add sp, $7f
    add sp, $15
    ret


    add sp, -$12
  ld hl, sp + $04
    ld a, l
    ld d, h
  ld hl, sp + $10
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
  call $b1b7
    add sp, $04
    ld a, e
    or a
  jp nz, $a8cc

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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld c, e
    ld b, d
  ld hl, $0007
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
  ld hl, sp + $0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, sp + $11
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
  ld hl, sp + $09
    ld [hl], b
  ld hl, sp + $11
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
  ld hl, sp + $0c
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
  ld hl, sp + $02
    ld [hl+], a
    ld [hl], d
    ld a, b
    and $3f
    ld b, a
    srl a
  ld hl, sp + $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld hl, sp+$0f
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, sp + $0c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, sp + $11
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
  ld hl, sp + $0d
    ld a, [hl]
    or a
  jp nz, $a892
  ld hl, sp + $0c
    ld [hl], c
    inc hl
    ld [hl], b
  ld hl, sp + $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
  ld hl, sp + $09
    ld a, [hl]
    sub b
    jr nz, jr_003_6873
  ld hl, sp + $0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
  ld hl, sp + $02
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
  ld hl, sp + $0a
    ld d, h
    ld e, l
    ld hl, sp+$0e
    ld a, [de]
    sub [hl]
    inc hl
    inc de
    ld a, [de]
    sbc [hl]
  jp c, $a8cc

  jp $a833


    ld hl, $bc00
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $0c
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
  ld hl, sp + $0c
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
  pop de
  pop hl
    push hl
  push de
  push hl
  ld hl, sp + $10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    pop bc
    ld a, [bc]
    ld b, a
  ld hl, sp + $02
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
  jp z, $a94e

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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  ld de, CheatSavingText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  ld hl, sp + $00
    ld a, l
    ld d, h
  ld hl, $01e9
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  ld hl, $a9f7
    push hl
    ld hl, $bc02
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  ld hl, $a9e8
    push hl
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  ld hl, $01e5
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
  ld hl, $0100
  add hl, sp
    ld e, l
    ld d, h
  ld hl, $01ea
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
  ld hl, $01e7
  add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    push bc
  ld hl, $01eb
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $06
    ld a, e
    add sp, $7f
    add sp, $7f
    add sp, $7f
    add sp, $6e
    ret
CheatSavingText::
  DB "Saving data...", $00
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
  ld hl, sp + $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld a, e
    or a
    jr z, jr_003_6a84

    ld e, a
  jp $abb3


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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $05
  ld hl, $0200
    add hl, sp
  ld [hl], $00
  inc hl
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
  jp nz, $ab91

    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $a9fb
    add sp, $02
    ld a, e
    or a
  jp z, $ab91

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
  dec hl
  dec hl
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
  ld hl, $0203
  add hl, sp
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
  ld hl, $0203
  add hl, sp
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
  jp nz, $ab87

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
  dec hl
  dec hl
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
  ld hl, $0203
  add hl, sp
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
  ld hl, $0200
  add hl, sp
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
  ld hl, $0201
    add hl, sp
    inc [hl]
    jr nz, jr_003_6b9d

    inc hl
    inc [hl]

jr_003_6b9d:
  ld hl, $0201
    add hl, sp
    ld a, [hl]
    sub $f8
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $aabb

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
  ld hl, sp + $06
    ld c, l
    ld b, h
  ld [hl], $fe
    inc hl
    ld [hl], $ad
    ld hl, $0002
    add hl, bc
    ld a, l
    ld d, h
  ld hl, sp + $0f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  ld [hl], $08
    inc hl
    ld [hl], $ae
    ld hl, $0004
    add hl, bc
    ld a, l
    ld d, h
  ld hl, sp + $0f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  ld [hl], $0d
    inc hl
    ld [hl], $ae
    ld hl, $0006
    add hl, bc
    ld a, l
    ld d, h
  ld hl, sp + $0f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $04
  ld [hl], $00
  ld hl, sp + $01
  ld [hl], $00
  dec hl
  ld [hl], $01
    ld hl, sp+$03
    ld [hl], $00
    push bc
    ld hl, sp+$19
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $af6b
    add sp, $02
    pop bc
    ld hl, sp+$02
    ld [hl], e
  ld hl, sp + $0f
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, sp+$17
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $13
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $0e
    ld [hl], $00
  ld hl, sp + $04
  ld a, [hl]
  ld hl, sp + $0e
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
  inc hl
    ld a, [hl]
  ld hl, sp + $0e
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
  ld hl, sp + $14
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $b358
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
  ld de, $ae13
    push de
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02

jr_003_6ca2:
  ld hl, sp + $14
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $13
    ld [hl+], a
    ld [hl], d
  ld hl, sp + $0e
    inc [hl]
    ld a, [hl]
    sub $10
  jp c, $ac50

    push hl
  ld hl, sp + $06
    ld a, [hl]
  ld hl, sp + $03
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld a, e
  ld hl, sp + $05
    ld [hl], a
    bit 6, [hl]
    jr z, jr_003_6d18
  ld hl, sp + $04
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
  ld hl, sp + $04
    ld b, [hl]
    dec b

jr_003_6d15:
  ld hl, sp + $04
    ld [hl], b

jr_003_6d18:
  ld hl, sp + $05
    bit 7, [hl]
    jr z, jr_003_6d2c
  ld hl, sp + $04
    ld a, [hl]
    sub $0f
    jr z, jr_003_6d29
  ld hl, sp + $04
    ld a, [hl]
    inc a

jr_003_6d29:
  ld hl, sp + $04
    ld [hl], a

jr_003_6d2c:
  ld hl, sp + $05
    bit 0, [hl]
  jp z, $adc9

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
  ld hl, sp + $10
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $03
    ld a, e
  ld hl, sp + $13
    ld [hl], a
    ld hl, sp+$00
    ld [hl], $01
  ld hl, sp + $13
    ld a, [hl]
    inc a
  jp z, $ac25
  ld hl, sp + $03
    ld [hl], $01
  inc hl
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
  inc hl
    ld a, [hl]
    or a
    jr nz, jr_003_6d95
  dec hl
  dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $ae14
    add sp, $02

jr_003_6d95:
  ld hl, sp + $13
    ld a, [hl]
    dec a
  jp nz, $adc9

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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $05
  ld hl, sp + $05
    bit 1, [hl]
  jp z, $ac25

    ld hl, sp+$17
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $af6b
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
  ld hl, sp + $03
    ld a, [hl]
    or a
    jr z, jr_003_6df8

    ld a, e
    set 0, a
    ld e, a

jr_003_6df8:
    add sp, $15
    ret
CheatCodeMenuText::
  DB "Code menu", $00
    ld b, l
    ld h, h
    ld l, c
    ld [hl], h
    nop
CheatClearText::
  DB "Clear", $00
    nop
    add sp, -$06
  ld hl, sp + $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $00
    ld a, [hl]
    push af
    inc sp
    ld hl, sp+$09
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  call $b358
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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    ld a, e
    ld hl, sp+$02
    ld [hl], a
    ld a, [hl]
    dec a
  jp z, $af68

    ld hl, sp+$02
    ld a, [hl]
    sub $02
  jp z, $af68

    ld hl, sp+$09
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $00
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
  ld hl, sp + $01
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
  ld hl, sp + $01
    ld a, [hl]
    sub $30
    jr nz, jr_003_6ee4

    ld b, $58
    jr jr_003_6ef3

jr_003_6ee4:
  ld hl, sp + $01
    ld a, [hl]
    sub $41
    jr nz, jr_003_6eef

    ld b, $39
    jr jr_003_6ef3

jr_003_6eef:
  ld hl, sp + $01
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
  jp z, $af33

    ld hl, sp+$05
    ld a, [hl]
    or a
    jr z, jr_003_6f0a

    ld [hl], $30
    jr jr_003_6f27

jr_003_6f0a:
  ld hl, sp + $01
    ld a, [hl]
    sub $46
    jr nz, jr_003_6f15

    ld a, $58
    jr jr_003_6f24

jr_003_6f15:
  ld hl, sp + $01
    ld a, [hl]
    sub $39
    jr nz, jr_003_6f20

    ld a, $41
    jr jr_003_6f24

jr_003_6f20:
  ld hl, sp + $01
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

  ld hl, sp + $00
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
  ld hl, sp + $00
    ld b, [hl]
    dec b

jr_003_6f4a:
  ld hl, sp + $00
    ld [hl], b

jr_003_6f4d:
    ld hl, sp+$02
    bit 4, [hl]
  jp z, $ae33
  ld hl, sp + $00
    ld a, [hl]
    sub $08
    jr z, jr_003_6f5f
  ld hl, sp + $00
    ld a, [hl]
    inc a

jr_003_6f5f:
  ld hl, sp + $00
    ld [hl], a
  jp $ae33


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
  ld hl, sp + $00
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld hl, $020f
    add hl, sp
    ld a, [hl+]
    ld e, [hl]
  ld hl, $020b
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
  ld hl, $0201
  add hl, sp
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
  ld hl, $0200
  add hl, sp
    ld [hl], $00
    ld hl, $0208
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $0200
  add hl, sp
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
  ld hl, $0205
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $020c
  add hl, sp
  dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $0200
  add hl, sp
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
  ld hl, $0205
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
  ld hl, $0200
  add hl, sp
    ld a, [hl]
  ld hl, $0205
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
  ld hl, $0203
    add hl, sp
    ld [hl+], a
    ld [hl], d
  inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    inc bc
  ld hl, $020b
  add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
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
  ld hl, $0206
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
  ld hl, $0203
    add hl, sp
    ld [hl+], a
    ld [hl], d
  inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
  ld hl, $020b
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, bc
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
  ld hl, $0200
  add hl, sp
    inc [hl]
    ld a, [hl]
    sub $03
  jp c, $b037

  ld hl, $020c
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
  ld hl, $020b
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $0208
  add hl, sp
  dec hl
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
  ld hl, $0202
  add hl, sp
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
  jp nz, $aff4

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
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  ld hl, sp + $04
    ld [hl+], a
    ld [hl], e
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $ff
    inc hl
    ld [hl], $ff
  ld hl, sp + $05
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $06
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
  jp $b355


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
  call $b16c
    inc sp
    ld b, e
    ld c, $00
    ld a, b
    sub $08
    ld a, c
    sbc $00
    jr nc, jr_003_7216

    ld e, $01
  jp $b355


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
  call $b16c
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
  call $b16c
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
  call $b16c
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
  ld hl, sp + $03
    ld [hl], a
    ld a, [hl]
    sub $58
  jp z, $b30b

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
  jp z, $b30b

    push bc
  ld hl, sp + $05
    ld a, [hl]
    push af
    inc sp
  call $b16c
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
  call $b16c
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
  ld hl, sp + $06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
  ld hl, sp + $05
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
  ld hl, sp + $05
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
  call $b16c
    inc sp
    ld a, e
    pop bc
    swap a
    and $f0
  ld hl, sp + $03
    ld [hl], a
    inc bc
    ld a, [bc]
    push af
    inc sp
  call $b16c
    inc sp
    ld a, e
  ld hl, sp + $03
    or [hl]
    ld b, a
  ld hl, sp + $08
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
  ld hl, sp + $11
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
  ld hl, sp + $11
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
  ld hl, sp + $11
    ld [hl+], a
    ld [hl], d
  ld hl, sp + $0c
  ld a, [hl+]
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
  ld hl, sp + $11
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
  ld hl, sp + $11
    ld [hl+], a
    ld [hl], d
  ld hl, sp + $0e
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
  ld hl, sp + $11
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    ld hl, sp+$0c
    inc [hl]
    ld a, [hl]
    sub $03
  jp c, $b38b

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
  call CheatCallHL + OS_WINDOW_FROM_6000
    inc sp
    jr jr_003_743e

jr_003_7435:
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
  call CheatCallHL + OS_WINDOW_FROM_6000
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
  call CheatCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    add sp, $13
    ret
CheatCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.


    jp hl


  DS 2915, $ff ; unused file padding
