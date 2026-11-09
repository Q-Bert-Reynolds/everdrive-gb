; OS page 6: runtime $a000-$bfff via $BD08.
; Linker addresses $4000-$5fff describe its location in the BIN only.
; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $003", ROMX[$4000], BANK[$3]
OSServiceDispatch::
; OS page 6 entry: command 1 initializes services, 2 displays a status,
; 3 probes SGB support. Runtime $a000; selected by $BD08=6.

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

  call InitializeOSServices + OS_WINDOW_FROM_4000
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
  call ShowOSStatus + OS_WINDOW_FROM_4000
    inc sp
    ld e, $00
    ret


jr_003_403d:
    ld a, d
    sub $03
    jr nz, jr_003_4045

  jp ProbeSuperGameBoy + OS_WINDOW_FROM_4000


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
  ld hl, sp + $0f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $44
  ld hl, sp + $10
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
  ld hl, sp + $10
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
  ld hl, sp + $0c
    ld [hl+], a
    ld [hl], e
    ld hl, $0100
    push hl
    xor a
    push af
    inc sp
  ld hl, sp + $0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $8080
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, $80f8
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, _VRAM
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $10
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $05
  ld hl, sp + $0e
    ld [hl], e
  ld hl, sp + $0e
    ld a, [hl]
    or a
  jp nz, $a208

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
  ld hl, sp + $0f
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld hl, sp+$06
    ld a, [hl+]
    ld e, [hl]
    inc hl
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $10
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    push hl
  ld hl, sp + $0a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
  ld hl, sp + $10
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, sp + $0e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, _VRAM
    push hl
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    ld e, $01
    jr jr_003_420b

    ld e, $00

jr_003_420b:
    add sp, $11
    ret
InitializeOSServices::
; Command-1 initialization and cartridge capability setup.


  ld hl, $fde2
    add hl, sp
    ld sp, hl
  ld hl, sp + $06
    ld a, l
    ld d, h
  ld hl, $021c
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    ld b, e
    ld c, d
    ld hl, sp+$00
    ld [hl], b
    inc hl
    ld [hl], c
  ld hl, $021d
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

  ld hl, $021d
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
  ld hl, $0108
  add hl, sp
    ld a, l
    ld d, h
  ld hl, $021a
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld hl, $0218
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld a, b
    or a
  jp z, $a32b

    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, $0210
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
  ld hl, $0210
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
  ld hl, $0219
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $0210
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    pop de
    push de
    ld hl, $000d
    add hl, de
    ld a, l
    ld d, h
  ld hl, $0210
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $021b
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
  ld hl, $0217
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
  ld hl, $021b
  add hl, sp
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
  ld hl, $0216
    add hl, sp
    ld a, [hl]
    or d
    ld b, a
    inc hl
    ld a, [hl]
    or e
    ld c, a
  ld hl, $0210
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
  ld hl, $0216
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $021b
  add hl, sp
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
  ld hl, $0211
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
  ld hl, $021b
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
  ld hl, $0210
    add hl, sp
    ld a, [hl]
    or d
    ld b, a
    inc hl
    ld a, [hl]
    or e
    ld c, a
  ld hl, $0216
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
  ld hl, $021b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0024
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0216
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, $021b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0028
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0210
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, $0107
  add hl, sp
  ld [hl], $00
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
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, $020c
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
  push af
  pop af
  ld a, $08
  ld hl, $020c
  add hl, sp
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, @ - 16
  ld hl, $0215
  add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $020c
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
  ld hl, $0217
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
    ld d, a
    ld e, $00
    ld b, $00
  ld c, $00
  ld hl, $020c
    add hl, sp
    ld a, [hl]
  or d
  ld [hl+], a
  ld a, [hl]
  or e
  ld [hl+], a
    ld a, [hl]
    or b
    ld [hl+], a
  ld a, [hl]
  or c
    ld [hl], a
    ld hl, $0215
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $020c
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
  ld hl, $020c
    add hl, sp
    ld [hl+], a
    ld [hl], d
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
  push af
  pop af
  ld a, $08
  ld hl, $0208
    add hl, sp
  sla [hl]
    inc hl
  rl [hl]
    inc hl
  rl [hl]
    inc hl
  rl [hl]
  dec a
  jr nz, @ - 16
    inc hl
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
  ld hl, $0211
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
  ld d, a
  ld e, $00
  ld b, $00
  ld c, $00
  ld hl, $0208
  add hl, sp
  ld a, [hl]
  or d
  ld [hl+], a
  ld a, [hl]
  or e
  ld [hl+], a
  ld a, [hl]
  or b
  ld [hl+], a
  ld a, [hl]
  or c
  ld [hl+], a
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
  ld hl, $0107
  add hl, sp
  inc [hl]
  ld a, [hl]
  sub $04
  jp c, $a3f7
    pop de
    push de
    ld hl, $0009
    add hl, de
    ld a, l
    ld d, h
  ld hl, $0208
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $021b
  add hl, sp
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
  ld hl, $020d
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
  ld hl, $021b
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
  ld hl, $020c
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
    ld hl, $000b
    add hl, de
    ld b, l
    ld c, h
  ld [hl], $06
    inc hl
    ld [hl], $01
    pop de
    push de
    ld hl, $001b
    add hl, de
    ld c, l
    ld b, h
  ld hl, $0219
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, $020c
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
  ld hl, $020c
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
  ld hl, $020c
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
  ld hl, $020c
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
  ld hl, $020c
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
  ld hl, $0214
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
  ld hl, $0216
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
  ld hl, $0209
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

  ld hl, $020c
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
  ld hl, $0214
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01

jr_003_45ed:
    ld a, [bc]
    sub $03
    jr nz, jr_003_45fb

  ld hl, $0216
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
  ld hl, $0217
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr z, jr_003_462b

  ld hl, $020d
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, $0208
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
  ld hl, $0208
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
  ld hl, $021c
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

  ld hl, $0208
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

  ld hl, $021b
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld a, l
    ld d, h
  ld hl, $020c
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $021b
  add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0010
    add hl, de
    ld a, l
    ld d, h
  ld hl, $0214
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
  ld hl, $021c
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
  ld [hl], a
  ld hl, $020d
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
    ld a, l
    ld d, h
  ld hl, $0210
    add hl, sp
    ld [hl+], a
    ld [hl], d
  ld hl, $0215
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
  ld hl, $0211
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

  ld hl, $0208
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
  jp c, $a736

  ld hl, $020c
    add hl, sp
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, $021b
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
  ld hl, $020c
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    add hl, de
    ld a, l
    ld d, h
  ld hl, $020c
    add hl, sp
    ld [hl+], a
    ld [hl], d
    ld hl, $0107
    add hl, sp
    inc [hl]
    ld a, [hl]
    sub $fc
    jr c, jr_003_4725

  ld hl, $021b
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
  ld hl, $021b
  add hl, sp
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
  ld hl, $0217
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
  ld hl, $021b
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
  ld hl, $0216
    add hl, sp
    or [hl]
    ld d, a
    ld a, e
    inc hl
    or [hl]
    ld e, a
  ld hl, $020c
    add hl, sp
    ld a, [hl]
    sub d
    jr nz, jr_003_47a5

    inc hl
    ld a, [hl]
    sub e
    jr z, jr_003_47ae

jr_003_47a5:
  ld hl, $0208
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00

jr_003_47ae:
  ld hl, $020c
    add hl, sp
    ld a, [hl]
    xor $ff
    ld hl, sp+$04
    ld [hl], a
  ld hl, $020d
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
  ld hl, $020d
    add hl, sp
    ld [hl], d
    dec hl
    ld [hl], $00
  ld hl, $021b
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
  ld hl, $020c
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
  ld hl, $0208
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

  ld hl, $0208
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
  ld hl, $0208
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
  ld hl, $0208
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], b
    inc hl
    ld [hl], c
  ld hl, $021e
    add hl, sp
    ld sp, hl
    ret
ShowOSStatus::
; Command-2 error/warning/status display.


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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, ErrorHeadingText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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

  ld de, FileTooLargeText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  jp $ace3


jr_003_496e:
    ld hl, sp+$05
    ld a, [hl]
    sub $fb
    jr nz, jr_003_49a2

  ld de, Fat16NotSupportedText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, PleaseUseFat32Text + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  jp $ace3


jr_003_49a2:
    ld hl, sp+$05
    ld a, [hl]
    sub $c0
    ld a, $00
    rla
  ld hl, sp + $02
    ld [hl], a
    ld a, [hl]
    or a
  jp nz, $ab10

    ld a, $d8
    ld hl, sp+$05
    sub [hl]
    ld a, $00
    rla
  ld hl, sp + $01
    ld [hl], a
    ld a, [hl]
    or a
  jp nz, $ab10

  ld de, SDIOErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, $ae2a
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  ld hl, sp + $02
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
  ld de, SDInitErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, DiskReadErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02

jr_003_4a45:
    ld hl, sp+$05
    ld a, [hl]
    sub $d4
  jp c, $ace3
  ld hl, sp + $01
    ld a, [hl]
    or a
  jp nz, $ace3

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
  ld de, DiskWriteErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  jp $ace3


    ld hl, sp+$05
    ld a, [hl]
    sub $f0
    jr c, jr_003_4a8b

  ld de, FatErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  jp $ace3


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
  ld de, GameNotLoadedText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  jp $ace3


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
  ld hl, sp + $01
    ld [hl], a
    ld a, [hl]
    or a
    jr nz, jr_003_4ac2

    ld hl, sp+$05
    ld a, [hl]
    sub $38
  jp nz, $ac2e

jr_003_4ac2:
  ld de, BatteryDryText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  ld hl, sp + $01
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
  ld de, RTCResetText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, $ae2a
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, PleaseReplaceText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, TheBatteryText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, $ae2a
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, PressAnyKeyText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, sp+$00
    ld [hl], $01
  jp $ace3


    ld hl, sp+$05
    ld a, [hl]
    sub $35
  jp nz, $aca5

  ld de, SettingsResetText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, ToDefaultText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, $ae2a
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, PressAnyKeyText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, sp+$00
    ld [hl], $01
  jp $ace3


    ld hl, sp+$05
    ld a, [hl]
    sub $52
    jr nz, jr_003_4c3e

  ld de, UnsupportedOSText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, OSUpdateRequiredText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    jr jr_003_4c49

jr_003_4c3e:
  ld de, UnexpectedErrorText + OS_WINDOW_FROM_4000
    push de
    ld l, c
    ld h, b
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    inc sp
    ld hl, sp+$00
    ld a, [hl]
    or a
  jp z, $ad6c

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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  ld de, WarningText + OS_WINDOW_FROM_4000
    push de
    ld l, b
    ld h, c
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    ld hl, sp+$00
    ld a, [hl]
    or a
  jp z, $add7

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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $03
    ret

ErrorHeadingText::      DB "      ERROR:", 0
FileTooLargeText::      DB "File is too large", 0
Fat16NotSupportedText:: DB "FAT16 not supported", 0
PleaseUseFat32Text::    DB "Please use FAT32", 0
SDIOErrorText::         DB "SD IO error", 0, 0
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
  ld hl, sp + $11

jr_003_4e89:
    ld a, l
    ld d, h
  ld hl, sp + $1a
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $0f
  ld hl, sp + $1b

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
  ld hl, sp + $17
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, sp + $01
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
  ld hl, sp + $1e
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $05
    pop bc
    ld a, $89
    ld [bc], a
    ld hl, $0001
    add hl, bc
    ld a, l
    ld d, h
  ld hl, sp + $17
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
  call $b27f
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
  ld hl, sp + $19
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
  ld [hl], a
  ld hl, sp + $19
  ld a, [hl]
  ld hl, sp + $15
    sub [hl]
    jr z, jr_003_4f5c

    ld e, $00
    jr jr_003_4f77

jr_003_4f5c:
    ld hl, sp+$00
    inc [hl]
    ld a, [hl]
    sub $04
  jp c, $afc0

    ld a, $89
    ld [bc], a
  ld hl, sp + $17
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    push bc
  call $b27f
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
ProbeSuperGameBoy::
; Command-3 path used by display initialization to probe SGB support.


    add sp, -$1c
  call $af1f
    ld c, e
    ld a, c
    or a
    jr nz, jr_003_4fbd

    ld e, a
  jp $b27c


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
  ld hl, sp + $1a
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $05
  ld hl, sp + $1a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $41
  ld hl, sp + $1b
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
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
    add sp, $02
    ld hl, sp+$16
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
  ld hl, sp + $1a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $89
  ld hl, sp + $1b
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
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
    add sp, $02
  ld hl, sp + $1a
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $b9
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
    add sp, $02
  ld hl, sp + $1a
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
  ld hl, sp + $15
    ld [hl], c
    ld a, [hl]
    add $02
  dec hl
  ld [hl], a
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $14
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $12
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  inc hl
  inc hl
    ld a, [hl]
    ld [de], a
    inc bc
    ld a, c
    sub $0e
    ld a, b
    sbc $00
  jp c, $b10c
  ld hl, sp + $1b
  dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
    add sp, $02
    ld bc, $0000
  ld hl, sp + $12
    ld [hl], c
    ld a, [hl]
    add $02
  inc hl
  inc hl
  ld [hl], a
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $14
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $10
    ld [hl+], a
    ld [hl], d
  inc hl
    ld a, [hl]
    add $0e
  dec hl
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
  jp c, $b147
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
    add sp, $02
    ld hl, sp+$18
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $04
    ld bc, $0000
  ld hl, sp + $10
    ld [hl], c
    ld a, [hl]
    add $02
  inc hl
  inc hl
  ld [hl], a
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $12
    ld l, [hl]
    ld h, $00
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $12
    ld [hl+], a
    ld [hl], d
  ld hl, sp + $10
    ld a, [hl]
    add $1c
  ld hl, sp + $13
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
  jp c, $b18c
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
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
  ld hl, sp + $1b
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $05
  ld hl, sp + $1a
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
  ld hl, $191d
    push hl
    ld a, $1f
    push af
    inc sp
  call $b016
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
  call $b016
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
  ld hl, sp + $1b
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
  call $b016
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
  ld hl, sp + $1b
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
  call $b016
    add sp, $03
    pop bc
    ld a, e
    ld [bc], a
    inc bc
    ld a, d
    ld [bc], a
  ld hl, sp + $1b
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
  call $b27f
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
  jp c, $b294

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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
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
  call OSServiceCallHL + OS_WINDOW_FROM_4000
    add sp, $03
    ret
OSServiceCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.


    jp hl
  DS 3318, $ff ; unused file padding
; OS page 7 entry: cheat services and editor. Runtime $a000; $BD08=7.
