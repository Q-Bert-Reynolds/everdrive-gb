; OS page 8: runtime $a000-$bfff via $BD08.
; Linker addresses $4000-$5fff describe its location in the BIN only.
; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $004", ROMX[$4000], BANK[$4]
RecentGamesDispatch::
; OS page 8 entry: command 1 shows recent games; command 2 updates the list.
; Runtime $a000; selected by $BD08=8.

    add sp, -$05
    ld hl, $bc16
    ld [hl], $00
    inc hl
    ld [hl], $02
    ld hl, sp+$07
    ld a, [hl+]
    ld e, [hl]
    ld hl, $bc18
    ld [hl+], a
    ld [hl], e
    ld hl, sp+$00
    ld [hl], $00
  ld hl, sp + $03
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, sp+$00
    ld c, [hl]
    ld b, $00
    sla c
    rl b
    ld hl, $bc00
    add hl, bc
    ld a, l
    ld d, h
  ld hl, sp + $01
    ld [hl+], a
    ld [hl], d
  inc hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $ac00
    add hl, bc
    ld c, l
    ld b, h
  ld hl, sp + $01
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], c
    inc hl
    ld [hl], b
  ld hl, sp + $04
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $00e5
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $03
    ld [hl+], a
    ld [hl], d
  ld hl, sp + $00
    inc [hl]
    ld a, [hl]
    sub $0b
  jp c, $a01e

    ld hl, sp+$08
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    dec a
    jr nz, jr_004_406d

  call ShowRecentGames + OS_WINDOW_FROM_4000
    jr jr_004_4079

jr_004_406d:
    ld a, b
    sub $02
    jr nz, jr_004_4077

  call UpdateRecentGames + OS_WINDOW_FROM_4000
    jr jr_004_4079

jr_004_4077:
    ld e, $00

jr_004_4079:
    add sp, $05
    ret
ShowRecentGames::
; Load and display the recent-games list.


    add sp, -$80
    add sp, -$7c
  ld hl, $00fb
    add hl, sp
    ld [hl], $00
  ld hl, $00e7
  add hl, sp
    ld a, l
    ld d, h
  ld hl, $00f1
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  ld [hl], $ce
    inc hl
    ld [hl], $a3
  ld hl, $00f2
    add hl, sp
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
  ld a, $de
    ld [bc], a
    inc bc
    ld a, $a3
    ld [bc], a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld b, l
    ld c, h
  ld [hl], $df
    inc hl
    ld [hl], $a3
  ld hl, $00f2
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld b, l
    ld c, h
  ld [hl], $de
    inc hl
    ld [hl], $a3
  ld hl, $00f2
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    add hl, de
    ld b, l
    ld c, h
    ld [hl], $01
    inc hl
    ld [hl], $00
    ld hl, $bc17
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    ld hl, $bc17
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
  ld hl, sp + $01
    ld e, l
    ld d, h
    ld hl, $0000
    push hl
    push de
  call $a50f
    add sp, $04
    ld b, e
    ld a, b
    or a
    jr z, jr_004_4128

    ld e, b
  jp $a3c9


jr_004_4128:
    ld hl, $bc17
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
  ld hl, $00f9
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc00
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, $01
    push af
    inc sp
    ld hl, $0008
    push hl
    push bc
  ld hl, $00fe
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $05
    ld a, e
    or a
    jr z, jr_004_4165

    ld e, a
  jp $a3c9


jr_004_4165:
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0064
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0066
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
    ld hl, $000c
    push hl
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0066
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
  ld de, $a3f2
    push de
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  ld hl, $00e6
  add hl, sp
    ld [hl], $00
  ld hl, $00e6
  add hl, sp
    ld c, [hl]
    ld b, $00
    sla c
    rl b
    ld hl, $bc00
    add hl, bc
    ld a, l
    ld d, h
  ld hl, $00f9
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $00e0
    add hl, bc
    ld a, l
    ld d, h
  ld hl, $00f3
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  inc hl
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
    ld a, [hl-]
    or [hl]
    dec hl
    or [hl]
    dec hl
    or [hl]
  jp z, $a287

    ld hl, $0012
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
  ld hl, sp + $00
    ld [hl], a
    xor a
    ld [bc], a
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0066
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
  ld hl, $00f5
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, $00fa
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
    push bc
  ld hl, $00f7
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0066
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
  ld de, $a408
    push de
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
  ld hl, $00fa
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
    ld hl, $0012
    add hl, bc
    ld c, l
    ld b, h
  ld hl, sp + $00
    ld a, [hl]
    ld [bc], a
  ld hl, $00e6
  add hl, sp
    inc [hl]
    ld a, [hl]
    sub $0b
  jp c, $a1c3

    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
  ld hl, $00e6
  add hl, sp
    ld a, [hl]
    or a
    jr nz, jr_004_42b4

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
  ld hl, $00f2
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $03
    ld e, $00
  jp $a3c9


jr_004_42b4:
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    inc sp
    ld hl, $bc17
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
    ld hl, $0e14
    push hl
    ld hl, $0100
    push hl
    ld hl, $0020
    push hl
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $06
  ld hl, $00fb
    add hl, sp
    ld c, [hl]
    ld b, $00
    sla c
    rl b
    ld hl, $bc00
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
    push bc
  call $a40a
    add sp, $02
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $006e
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
    ld a, $01
    push af
    inc sp
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    inc sp
    ld hl, $bc17
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
  ld hl, $00fb
    add hl, sp
    ld a, [hl]
    push af
    inc sp
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $03
    ld c, e
    ld a, c
    inc a
    jr nz, jr_004_435e

    ld e, $00
  jp $a3c9


jr_004_435e:
    ld a, c
    cp $80
    jr c, jr_004_436d

    add $80
  ld hl, $00fb
    add hl, sp
    ld [hl], a
  jp $a2f9


jr_004_436d:
    ld hl, $bc16
    ld a, [hl+]
    ld e, [hl]
  ld hl, $00f5
    add hl, sp
    ld [hl+], a
    ld [hl], e
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
    ld b, $00
    sla c
    rl b
    ld hl, $bc00
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
    xor a
    push af
    inc sp
    push bc
  ld hl, $00f8
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $03
    ld a, e
    or a
    jr z, jr_004_43ac

    ld e, a
    jr jr_004_43c2

jr_004_43ac:
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld l, c
    ld h, b
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    ld a, e

jr_004_43c2:
    add sp, $7f
    add sp, $7d
    ret
RecentGamesTitleText::
  DB "Recently Played", $00
    nop
RecentGamesEmptyText::
  DB " There is no games", $00
  jr nz, @ + 34

    ld d, d
    ld h, l
    ld h, e
    ld h, l
    ld l, [hl]
    ld [hl], h
    ld l, h
    ld a, c
    jr nz, jr_004_4447

    ld l, h
    ld h, c
    ld a, c
    ld h, l
    ld h, h
    jr nz, jr_004_441e

    jr nz, jr_004_440a

    nop
    ld a, [bc]
    nop
    add sp, -$07
    ld hl, $bc17
    dec hl
    ld c, [hl]

jr_004_440a:
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

jr_004_441e:
  call RecentGamesCallHL + OS_WINDOW_FROM_4000

jr_004_4421:
    inc sp
    ld hl, $bc17
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003e
    add hl, bc
    ld c, l

jr_004_442e:
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
    ld hl, $0f00
    push hl
    ld hl, $0020
    push hl
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000

jr_004_4447:
    add sp, $06

jr_004_4449:
    ld hl, $bc17
    dec hl

jr_004_444d:
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
    ld hl, $0e00
    push hl
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, $bc17
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld a, e
  ld hl, sp + $00
  ld [hl+], a
  inc hl
  ld [hl], $00
    ld hl, sp+$02
  ld a, [hl-]
  dec hl
    sub [hl]
  jp nc, $a50c
  inc hl
  inc hl
    ld a, [hl]
    sub $3c
  jp nc, $a50c

    ld c, [hl]
    ld b, $00
    ld hl, $0014
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
  ld hl, sp + $01
    ld [hl], a
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $00
    ld hl, $bc17
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
  ld hl, sp + $02
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
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $02
    ld hl, sp+$06
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $01
    ld a, [hl]
    ld [de], a
    inc hl
    ld a, [hl]
    add $14
    ld [hl], a
  jp $a497


    add sp, $07
    ret


    add sp, -$02
    ld hl, $bc17
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
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld de, RecentGamesPathText + OS_WINDOW_FROM_4000
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    ld a, e
    sub $f0
  jp nz, $a609

    ld hl, $bc17
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
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc00
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $1000
    push hl
    xor a
    push af
    inc sp
    push bc
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $05
    ld hl, $bc17
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
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld de, RecentGamesPathText + OS_WINDOW_FROM_4000
    ld hl, $0008
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    ld a, e
    or a
    jr z, jr_004_4599

    ld e, a
  jp $a609


jr_004_4599:
    ld hl, $bc17
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
    ld hl, sp+$00
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc00
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, $01
    push af
    inc sp
    ld hl, $0008
    push hl
    push bc
    ld hl, sp+$05
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $05
    ld a, e
    or a
    jr z, jr_004_45d2

    ld e, a
  jp $a609


jr_004_45d2:
    ld hl, $bc17
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
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld de, RecentGamesPathText + OS_WINDOW_FROM_4000
    ld hl, $0000
    push hl
    ld hl, sp+$06
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push de
    ld l, b
    ld h, c
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    ld a, e
    or a
    jr nz, jr_004_45ff

jr_004_45ff:
    add sp, $02
    ret
RecentGamesPathText::
  DB "/GBCSYS/recentlist.bin", $00
UpdateRecentGames::
; Update /GBCSYS/recentlist.bin for the selected game.
    add sp, -$80
    add sp, -$6c
    ld hl, sp+$00
    ld a, l
    ld d, h
  ld hl, $00e8
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0000
    push hl
    push de
  call $a50f
    add sp, $04
  ld hl, $00e7
    add hl, sp
    ld [hl], e
    ld a, [hl]
    or a
    jr z, jr_004_4642

    ld e, [hl]
  jp $a762


jr_004_4642:
    ld hl, $bc17
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
    ld hl, $00e5
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc02
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld a, $01
    push af
    inc sp
    ld hl, $0007
    push hl
    push bc
    ld hl, $00ea
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $05
    ld a, e
    or a
    jr z, jr_004_467f

    ld e, a
  jp $a762


jr_004_467f:
    ld hl, $bc17
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
    ld hl, $00e5
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc00
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld hl, $00ea
  add hl, sp
    ld [hl], b
    inc hl
    ld [hl], c
    ld hl, $bc19
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $00e5
    push hl
  ld hl, $00ec
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
    push bc
    ld hl, $00eb
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $06
    ld hl, $bc17
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
    ld c, a
    inc de
    ld a, [de]
    ld b, a
  ld hl, $00e9
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0008
    push hl
    push de
    ld l, c
    ld h, b
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $04
    ld a, e
    or a
    jr z, jr_004_46fb

    ld e, a
  jp $a762


jr_004_46fb:
    ld hl, $bc17
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
  ld hl, $00ea
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld de, $bc00
    ld a, [de]
    ld hl, $00e5
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    ld a, $01
    push af
    inc sp
    ld hl, $0008
    push hl
    ld hl, $00e8
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    push hl
  ld hl, $00ef
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call RecentGamesCallHL + OS_WINDOW_FROM_4000
    add sp, $05
  ld hl, $00ea
    add hl, sp
    ld [hl], e
    push hl
  ld hl, $00ec
    add hl, sp
    ld a, [hl]
    ld [hl], a
    pop hl
  ld hl, $00ea
    add hl, sp
    ld a, [hl]
    or a
    jr z, jr_004_4753

    ld e, [hl]
    jr jr_004_4755

jr_004_4753:
    ld e, $00

jr_004_4755:
    add sp, $7f
    add sp, $6d
    ret
RecentGamesCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.


    jp hl


  DS 6296, $ff ; unused file padding
