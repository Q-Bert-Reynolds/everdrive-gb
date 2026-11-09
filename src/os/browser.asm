; OS page 4: runtime $a000-$bfff via $BD08.
; Linker addresses $4000-$5fff describe its location in the BIN only.
; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]
; OS page 4 entry: file browser. Runtime $a000; selected by $BD08=4.
BrowserEntry::
  add sp, -$07
  ld hl, $bc02
  ld [hl], $00
  inc hl
  ld [hl], $02
  ld de, OSAPI_GetDirectoryEntryIDs
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld b, e
  ld c, d
  ld hl, $bc94
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld c, e
  ld b, d
  ld hl, $0027
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $bc96
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
  ld hl, $bc8e
  ld [hl], $02
  ld hl, $bc8f
  ld a, [hl]
  or a
  jr z, jr_002_4079

  xor a
  ld hl, $bc88
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $bc86
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $bc84
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $bc8f
  ld [hl], $00

jr_002_4079:
  call $a309
  ld c, e
  ld a, c
  or a
  jr z, jr_002_4085

  ld e, c
  jp $a306


jr_002_4085:
  ld hl, $bc8e
  ld [hl], $00
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld a, e
  ld hl, sp+$00
  ld [hl], a
  ld hl, $000c
  push hl
  ld hl, $bc84
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b5
  add sp, $04
  ld c, e
  ld b, d
  ld hl, $bc8d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, sp + $04
  ld [hl-], a
  ld [hl], e
  ld l, c
  ld h, b
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$00
  bit 6, [hl]
  jp z, $a13b

  ld hl, sp+$05
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $01
  ld [hl+], a
  ld [hl], e
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld b, a
  ld c, e
  ld a, b
  or c
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_002_410a

  ld bc, $000b
  jr jr_002_410b

jr_002_410a:
  dec bc

jr_002_410b:
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $bc84
  ld [hl+], a
  ld [hl], d
  dec hl
  ld d, h
  ld e, l
  ld hl, $bc8c
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp c, $a079

  ld hl, $bc8d
  ld a, [hl-]
  or [hl]
  jp z, $a079

  ld hl, sp + $03
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc84
  ld [hl+], a
  ld [hl], e
  jp $a079


  ld hl, sp+$00
  bit 7, [hl]
  jp z, $a191

  ld hl, sp+$05
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $01
  ld [hl+], a
  ld [hl], e
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld b, a
  ld c, e
  inc bc
  ld a, c
  sub $0c
  ld a, b
  sbc $00
  jr c, jr_002_4169

  ld bc, $0000

jr_002_4169:
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $bc84
  ld [hl+], a
  ld [hl], d
  dec hl
  ld d, h
  ld e, l
  ld hl, $bc8c
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp c, $a079

  ld hl, sp + $01
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc84
  ld [hl+], a
  ld [hl], e
  jp $a079


  ld hl, $bc8c
  ld a, $0c
  sub [hl]
  inc hl
  ld a, $00
  sbc [hl]
  ld a, $00
  rla
  ld b, a
  ld hl, sp+$00
  bit 4, [hl]
  jp z, $a20b

  ld a, b
  or a
  jr nz, jr_002_41b6

  ld hl, sp + $03
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc84
  ld [hl+], a
  ld [hl], e
  jp $a079


jr_002_41b6:
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld hl, sp + $02
  ld [hl-], a
  ld [hl], e
  ld hl, $000c
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $bc8c
  ld a, c
  sub [hl]
  inc hl
  ld a, b
  sbc [hl]
  jr c, jr_002_41df

  ld bc, $0000

jr_002_41df:
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $bc84
  ld [hl+], a
  ld [hl], d
  dec hl
  ld d, h
  ld e, l
  ld hl, $bc8c
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr c, jr_002_4203

  ld hl, sp + $03
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc84
  ld [hl+], a
  ld [hl], e

jr_002_4203:
  ld hl, $bc8e
  ld [hl], $01
  jp $a079


  ld hl, sp+$00
  bit 5, [hl]
  jp z, $a297

  ld a, b
  or a
  jr nz, jr_002_4221

  ld hl, $bc84
  ld [hl], $00
  inc hl
  ld [hl], $00
  jp $a079


jr_002_4221:
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld hl, sp + $02
  ld [hl-], a
  ld [hl], e
  ld hl, $bc84
  ld a, [hl]
  sub $0c
  inc hl
  ld a, [hl]
  sbc $00
  jp nc, $a284

  ld hl, $000c
  push hl
  ld hl, $bc8c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b5
  add sp, $04
  ld c, e
  ld b, d
  ld l, c
  ld h, b
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  ld c, l
  ld b, h
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $bc84
  ld [hl+], a
  ld [hl], d
  dec hl
  ld d, h
  ld e, l
  ld hl, $bc8c
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr c, jr_002_428f

  ld hl, sp + $03
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc84
  ld [hl+], a
  ld [hl], e
  jr jr_002_428f

  ld hl, $bc84
  ld a, [hl]
  add $f4
  ld [hl+], a
  ld a, [hl]
  adc $ff
  ld [hl], a

jr_002_428f:
  ld hl, $bc8e
  ld [hl], $01
  jp $a079


  ld hl, sp+$00
  bit 0, [hl]
  jr z, jr_002_42b1

  ld hl, $bc84
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $a9ba
  add sp, $02
  ld a, e
  or a
  jp z, $a079

  jp $a306


jr_002_42b1:
  ld hl, sp+$00
  bit 1, [hl]
  jr z, jr_002_42bd

  call $b7ae
  jp $a079


jr_002_42bd:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
  bit 3, [hl]
  jr z, jr_002_42db

  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld a, e
  jr jr_002_4306

jr_002_42db:
  ld hl, sp+$00
  bit 2, [hl]
  jp z, $a079

  ld hl, $0012
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
  ld a, $05
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld hl, $bc8e
  ld [hl], $01
  jp $a079


jr_002_4306:
  add sp, $07
  ret


  add sp, -$80
  add sp, -$78
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0054
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  push hl
  ld hl, $00f2
  add hl, sp
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $00f0
  add hl, sp
  ld a, [hl]
  ld hl, $bc90
  sub [hl]
  jr nz, jr_002_4368

  ld hl, $00f1
  add hl, sp
  ld a, [hl]
  ld hl, $bc91
  sub [hl]
  jr nz, jr_002_4368

  ld hl, $00f2
  add hl, sp
  ld a, [hl]
  ld hl, $bc92
  sub [hl]
  jr nz, jr_002_4368

  ld hl, $00f3
  add hl, sp
  ld a, [hl]
  ld hl, $bc93
  sub [hl]
  jr nz, jr_002_4368

  ld hl, $bc8e
  ld a, [hl]
  sub $02
  jp nz, $a470

jr_002_4368:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0042
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
  ld hl, $bc8a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $bc88
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4399

  ld e, a
  jp $a88f


jr_002_4399:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0054
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  push hl
  ld hl, $00f2
  add hl, sp
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $00f0
  add hl, sp
  ld d, h
  ld e, l
  ld hl, $bc90
  ld a, [de]
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
  ld hl, $bc87
  ld a, [hl-]
  or [hl]
  jp nz, $a427

  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld c, e
  ld b, d
  inc bc
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  or a
  jr z, jr_002_4427

  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0058
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
  ld hl, $bc98
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $bc96
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04

jr_002_4427:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0044
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld b, e
  ld c, d
  ld hl, $bc8c
  ld [hl], b
  inc hl
  ld [hl], c
  ld a, [hl-]
  or [hl]
  jr z, jr_002_4470

  ld hl, $bc84
  ld d, h
  ld e, l
  ld hl, $bc8c
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr c, jr_002_4470

  ld hl, $bc8c
  ld a, [hl]
  add $ff
  ld hl, $bc84
  ld [hl], a
  ld hl, $bc8d
  ld a, [hl]
  adc $ff
  ld hl, $bc85
  ld [hl], a

jr_002_4470:
  ld hl, $000c
  push hl
  ld hl, $bc84
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b5
  add sp, $04
  ld c, e
  ld b, d
  ld l, c
  ld h, b
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  ld a, l
  ld d, h
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  inc sp
  inc sp
  push hl
  ld hl, $bc8c
  ld d, h
  ld e, l
  ld hl, sp + $00
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr nc, jr_002_44b4

  ld hl, $bc8c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $00
  ld [hl+], a
  ld [hl], e

jr_002_44b4:
  ld hl, $000c
  push hl
  ld hl, $bc8c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b5
  add sp, $04
  ld hl, $00e9
  add hl, sp
  ld [hl], e
  ld hl, $000c
  push hl
  ld hl, $bc8c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8c9
  add sp, $04
  ld a, d
  or e
  jr z, jr_002_44de
  ld hl, $00e9
  add hl, sp
  inc [hl]

jr_002_44de:
  ld hl, $bc8e
  ld a, [hl]
  or a
  jp z, $a613

  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp
  ld hl, $bc03
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
  ld hl, $0114
  push hl
  ld hl, $0000
  push hl
  ld l, $20
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $06
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003a
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
  ld de, BrowserPageText + OS_WINDOW_FROM_4000
  ld hl, $0000
  push hl
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $bc8d
  ld a, [hl-]
  or [hl]
  jr nz, jr_002_458f

  ld hl, $002a
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
  ld de, $a89b
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  jp $a5c4


jr_002_458f:
  ld hl, $002c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $00f0
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $000c
  push hl
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b5
  add sp, $04
  ld c, e
  ld b, d
  inc bc
  ld de, $0000
  push de
  push bc
  ld hl, $00f4
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002a
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
  ld de, $a89d
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $00f0
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $00e9
  add hl, sp
  ld e, [hl]
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $00f4
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp
  ld hl, $bc03
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
  ld hl, $0f00
  push hl
  ld hl, $0020
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $06
  ld hl, $bc03
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
  ld hl, $0100
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc8d
  ld a, [hl-]
  or [hl]
  jp nz, $a6f8

  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
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
  ld de, BrowserEmptyText + OS_WINDOW_FROM_4000
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld e, $00
  jp $a88f
  ld hl, sp + $02
  ld a, [hl+]
  ld e, [hl]
  ld hl, $00ea
  add hl, sp
  ld [hl+], a
  ld [hl], e
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00ea
  add hl, sp
  ld d, h
  ld e, l
  ld hl, sp + $00
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, $a871

  ld hl, $bc8e
  ld a, [hl]
  or a
  jp nz, $a769

  ld hl, $bc84
  ld a, [hl]
  ld hl, $00ea
  add hl, sp
  sub [hl]
  jr nz, jr_002_472d

  ld hl, $bc85
  ld a, [hl]
  ld hl, $00eb
  add hl, sp
  sub [hl]
  jr z, jr_002_475a

jr_002_472d:
  ld hl, $bc00
  ld a, [hl]
  ld hl, $00ea
  add hl, sp
  sub [hl]
  jr nz, jr_002_473f

  ld hl, $bc01
  ld a, [hl]
  ld hl, $00eb
  add hl, sp
  sub [hl]
  jr z, jr_002_475a

jr_002_473f:
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
  ld de, $a8b5
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  jp $a864


jr_002_475a:
  ld hl, $004e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $00f0
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $04
  ld a, l
  ld d, h
  ld hl, $00f6
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $00f4
  add hl, sp
  ld [hl+], a
  ld [hl], e
  ld hl, $00ea
  add hl, sp
  ld b, [hl]
  inc hl
  ld c, [hl]
  sla b
  rl c
  sla b
  rl c
  ld a, b
  ld hl, $bc94
  add [hl]
  ld b, a
  ld a, c
  inc hl
  adc [hl]
  ld c, a
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, $00ec
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
  ld hl, $00f4
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $00f0
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $00f0
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $00f6
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $06
  ld a, e
  or a
  jr z, jr_002_47d2

  ld e, a
  jp $a88f


jr_002_47d2:
  ld hl, $bc03
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
  ld hl, $bc84
  ld a, [hl]
  ld hl, $00ea
  add hl, sp
  sub [hl]
  jr nz, jr_002_4812

  ld hl, $bc85
  ld a, [hl]
  ld hl, $00eb
  add hl, sp
  sub [hl]
  jr nz, jr_002_4812

  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp
  ld hl, $00f7
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $a8b6
  add sp, $02
  jr jr_002_481b

jr_002_4812:
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp

jr_002_481b:
  ld hl, $00f7
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0014
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, $bc03
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
  ld hl, $00f7
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $00ea
  add hl, sp
  inc [hl]
  jp nz, $a702

  inc hl
  inc [hl]
  jp $a702


  ld hl, $bc84
  ld a, [hl+]
  ld e, [hl]
  ld hl, $bc00
  ld [hl+], a
  ld [hl], e
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld e, $00
  add sp, $7f
  add sp, $79
  ret
BrowserPageText::
  DB "Page: ", $00

jr_002_4884:
  jr nc, jr_002_4886

jr_002_4886:
  jr nz, jr_002_48f7

  ld h, [hl]
  jr nz, BrowserEmptyText
BrowserEmptyText::
  DB "There are no files", $00
  nop
  add sp, -$08
  ld hl, $bc03
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
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld a, e
  ld hl, sp+$00
  ld [hl], a
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0028
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld a, e
  ld hl, sp+$02
  ld [hl], a
  ld hl, $bc03
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

jr_002_48f3:
  ld b, a
  inc de
  ld a, [de]
  ld c, a

jr_002_48f7:
  ld hl, $0e00
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, sp + $03

jr_002_4904:
  ld [hl], $00
  ld hl, sp + $03
  ld a, [hl]
  ld hl, sp + $00
  sub [hl]
  jp nc, $a994
  ld hl, sp + $03
  ld a, [hl]
  sub $3c
  jp nc, $a994

  ld c, [hl]
  ld b, $00
  ld hl, $0014
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $01
  ld [hl], a
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, $bc03
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
  ld hl, sp+$04
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $03
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $01
  ld a, [hl]
  ld [de], a
  inc hl
  inc hl
  ld a, [hl]
  add $14
  ld [hl], a
  jp $a91d


  ld hl, $bc03
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
  ld hl, sp+$02
  ld a, [hl]
  push af
  inc sp
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  add sp, $08
  ret


  add sp, -$80
  add sp, -$80
  add sp, -$22
  ld hl, $0103
  add hl, sp
  ld a, l
  ld d, h
  ld hl, $0110
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $c8
  inc hl
  ld [hl], $ad
  ld hl, $0111
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $cc
  ld [bc], a
  inc bc
  ld a, $ad
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $cf
  inc hl
  ld [hl], $ad
  ld hl, $0111
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
  ld hl, sp + $14
  ld a, l
  ld d, h
  ld hl, $0120
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $d3
  inc hl
  ld [hl], $ad
  ld hl, $0121
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $d7
  ld [bc], a
  inc bc
  ld a, $ad
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $db
  inc hl
  ld [hl], $ad
  ld hl, $0121
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
  ld [hl], $ad
  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $00
  ld a, l
  ld d, h
  ld hl, $011c
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $e2
  inc hl
  ld [hl], $ad
  ld hl, $011d
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $ec
  ld [bc], a
  inc bc
  ld a, $ad
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $fb
  inc hl
  ld [hl], $ad
  ld hl, $011d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $0c
  inc hl
  ld [hl], $ae
  ld hl, $011d
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
  ld hl, sp + $0a
  ld a, l
  ld d, h
  ld hl, $011a
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $e2
  inc hl
  ld [hl], $ad
  ld hl, $011b
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $16
  ld [bc], a
  inc bc
  ld a, $ae
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $17
  inc hl
  ld [hl], $ae
  ld hl, $011b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $16
  inc hl
  ld [hl], $ae
  ld hl, $011b
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
  ld hl, $bc8d
  ld a, [hl-]
  or [hl]
  jr nz, jr_002_4b04

  ld e, a
  jp $adc1


jr_002_4b04:
  ld hl, $bc8e
  ld [hl], $01
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $004e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $011e
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $1e
  ld a, l
  ld d, h
  ld hl, $0112
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, $0125
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld a, c
  ld hl, $bc94
  add [hl]
  ld c, a
  ld a, b
  inc hl
  adc [hl]
  ld b, a
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $0116
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
  ld hl, $0114
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $011a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $011a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $0124
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $06
  ld a, e
  or a
  jr z, jr_002_4b8b

  ld e, a
  jp $adc1


jr_002_4b8b:
  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  or a
  jr z, jr_002_4bb0

  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b75a
  add sp, $02
  ld e, $00
  jp $adc1


jr_002_4bb0:
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $005e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $0116
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $0113
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  ld hl, $011a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4c2d

  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $ae32
  add sp, $02
  jp $adc1


jr_002_4c2d:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $005e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $0116
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $0113
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  ld hl, $011a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld hl, $0116
  add hl, sp
  ld [hl], e
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0116
  add hl, sp
  ld a, [hl]
  or a
  jr z, jr_002_4c9c

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
  ld hl, $011d
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld e, $00
  jp $adc1


jr_002_4c9c:
  ld hl, $005c
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
  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, $ae2a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4cd2

  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b5b5
  add sp, $02
  jp $adc1


jr_002_4cd2:
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $005c
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
  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, $ae2e
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  or a
  jp z, $ad66

  ld hl, $010b
  add hl, sp
  ld e, l
  ld d, h
  ld a, $02
  ld [de], a
  ld hl, $010b
  add hl, sp
  ld a, l
  ld d, h
  ld hl, $0116
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, $0112
  add hl, sp
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld a, d
  ld [bc], a
  inc bc
  ld a, e
  ld [bc], a
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0012
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
  ld hl, $0117
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $07
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld a, e
  jp $adc1


  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  ld hl, $011b
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld e, $00
  add sp, $7f
  add sp, $7f
  add sp, $24
  ret


  ld h, a
  ld h, d
  jr nz, jr_002_4db7

jr_002_4db7:
  ld h, a
  ld h, d
  nop
  ld h, a
  ld h, d
  ld h, e
  nop
  ld a, d
  ld l, c
  ld [hl], b
  nop
  ld [hl], d
  ld h, c
  ld [hl], d
  nop
  scf
  ld a, d
  nop
  scf
  ld a, d
  jr nz, FileMenuTitleText
FileMenuTitleText::
  DB "File Menu", $00
ArchiveWarningLine1::
  DB "Archived files", $00
ArchiveWarningLine2::
  DB "is not supported", $00
  ld d, l
  ld l, [hl]
  ld a, d
  ld l, c
  ld [hl], b
  jr nz, jr_002_4e6b

  ld h, l
  ld hl, $0000
UnknownROMFormatText::
  DB "Unknown ROM format", $00
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
  ld [hl], h
  ld a, b
  ld [hl], h
  nop
  add sp, -$18
  ld hl, sp + $0c
  ld [hl], $00
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld [hl], $b9
  inc hl
  ld [hl], $af
  ld hl, $0002
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $c3
  inc hl
  ld [hl], $af
  ld hl, $0004
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$16

jr_002_4e47:
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $d4
  inc hl
  ld [hl], $af
  ld hl, $0006
  add hl, bc
  ld a, l
  ld d, h

jr_002_4e58:
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl

jr_002_4e5d:
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $e0
  inc hl
  ld [hl], $af
  ld hl, $0008
  add hl, bc
  ld a, l
  ld d, h

jr_002_4e6b:
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $e7

jr_002_4e75:
  inc hl
  ld [hl], $af
  ld hl, $000a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $0d
  ld a, l
  ld d, h
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $12
  ld [hl+], a
  ld [hl], e
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $bc03
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
  ld hl, sp + $15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0c
  ld a, [hl]
  push af
  inc sp
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld a, e
  ld hl, sp + $0c
  ld [hl], a
  ld a, [hl]
  inc a
  jr nz, jr_002_4ed3

  ld e, $00
  jp $afb6


jr_002_4ed3:
  ld hl, sp + $0c
  ld a, [hl]
  or a
  jr z, jr_002_4ede

  ld a, [hl]
  dec a
  jp nz, $af3c

jr_002_4ede:
  ld hl, $bc02
  ld b, [hl]
  inc hl
  ld c, [hl]
  ld e, b
  ld d, c
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, $01
  push af
  inc sp
  ld hl, sp+$1b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_4f04

  ld e, a
  jp $afb6


jr_002_4f04:
  ld hl, sp + $0c
  ld a, [hl]
  or a
  jr nz, jr_002_4f23

  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld a, e
  jp $afb6


jr_002_4f23:
  ld e, $00
  jp $afb6
  ld hl, sp + $0c
  ld a, [hl]
  sub $02
  jp nz, $af88
  ld hl, sp + $0d
  ld e, l
  ld d, h
  ld a, $01
  ld [de], a
  ld hl, sp+$17
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, sp+$1a
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0012
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
  ld hl, sp + $13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $07
  push af
  inc sp
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_4f74

  ld e, a
  jp $afb6


jr_002_4f74:
  ld hl, sp + $0c
  ld a, [hl]
  sub $03
  jr nz, jr_002_4f86

  ld hl, sp+$1a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $aff0
  add sp, $02

jr_002_4f86:
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  jp $aeb3


  add sp, $18
  ret
GameMenuTitleText::
  DB "Game Menu", $00
GameMenuSelectStartText::
  DB "Select And Start", $00
GameMenuSelectOnlyText::
  DB "Select Only", $00
GameMenuCheatsText::
  DB "Cheats", $00
GameMenuROMInfoText::
  DB "Rom Info", $00
  add sp, -$7d
  ld hl, sp+$5f
  ld a, l
  ld d, h
  ld hl, sp + $7b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $08
  inc hl
  ld [hl], $b5
  ld hl, sp + $7c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $13
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $1e
  inc hl
  ld [hl], $b5
  ld hl, sp + $7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $29
  inc hl
  ld [hl], $b5
  ld hl, sp + $7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $34
  inc hl
  ld [hl], $b5
  ld hl, sp + $7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $3f
  inc hl
  ld [hl], $b5
  ld hl, sp + $7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $3b
  ld a, l
  ld d, h
  ld hl, sp + $6d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $4a
  inc hl
  ld [hl], $b5
  ld hl, sp + $6e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $4f
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $54
  inc hl
  ld [hl], $b5
  ld hl, sp + $6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $59
  inc hl
  ld [hl], $b5
  ld hl, sp + $6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $5e
  inc hl
  ld [hl], $b5
  ld hl, sp + $6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $63
  inc hl
  ld [hl], $b5
  ld hl, sp + $29
  ld a, l
  ld d, h
  ld hl, sp + $79
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $68
  inc hl
  ld [hl], $b5
  ld hl, sp + $7a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $6c
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $70
  inc hl
  ld [hl], $b5
  ld hl, sp+$7a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de

jr_002_5017:
  ld b, l
  ld c, h
  ld [hl], $75
  inc hl
  ld [hl], $b5
  ld hl, sp+$7a
  dec hl

jr_002_5021:
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $7a
  inc hl
  ld [hl], $b5
  ld hl, sp+$7a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $7f
  inc hl
  ld [hl], $b5
  ld hl, sp+$7a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $82
  inc hl
  ld [hl], $b5
  ld hl, sp + $7a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000e
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $85
  inc hl
  ld [hl], $b5
  ld hl, sp + $7a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0010
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $88
  inc hl
  ld [hl], $b5
  ld hl, sp + $00
  ld a, l
  ld d, h
  ld hl, sp + $77
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $8b
  inc hl
  ld [hl], $b5
  ld hl, sp + $78
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $8d
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $90
  inc hl
  ld [hl], $b5
  ld hl, sp + $78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $68
  inc hl
  ld [hl], $b5
  ld hl, sp + $78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $6c
  inc hl
  ld [hl], $b5
  ld hl, sp + $78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $70
  inc hl
  ld [hl], $b5
  ld hl, sp + $4d
  ld a, l
  ld d, h
  ld hl, sp + $75
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $94
  inc hl
  ld [hl], $b5
  ld hl, sp + $76
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $97
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $9e
  inc hl
  ld [hl], $b5
  ld hl, sp + $49
  ld a, l
  ld d, h
  ld hl, sp + $73
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $a2
  inc hl
  ld [hl], $b5
  ld hl, sp + $74
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $a5
  ld [bc], a
  inc bc
  ld a, $b5
  ld [bc], a
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $0e
  ld a, l
  ld d, h
  ld hl, sp + $6f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, $0081
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_5248

  ld e, a
  jp $b505


jr_002_5248:
  ld hl, sp + $70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $0d
  ld [hl], a
  ld hl, sp + $70
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld hl, sp + $47
  ld [hl], a
  ld hl, sp + $70
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, [bc]
  ld d, a
  ld e, $00

jr_002_5269:
  inc e
  ld a, d
  or a
  jr z, jr_002_5272

  srl d
  jr jr_002_5269

jr_002_5272:
  ld hl, sp + $48
  ld [hl], e
  ld hl, sp + $70
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  or a
  jr nz, @ + 6

  ld hl, sp + $48
  ld [hl], $00
  ld hl, sp+$0c
  ld [hl], $00

jr_002_5286:
  ld hl, sp + $47
  ld a, [hl]
  or a
  jr z, jr_002_529b
  ld hl, sp + $0c
  inc [hl]
  ld hl, sp + $47
  ld a, [hl]
  srl a
  ld [hl], a
  jr jr_002_5286

jr_002_529b:
  ld hl, sp + $53
  ld a, l
  ld d, h
  ld hl, sp + $71
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $0d
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp + $6d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp + $71
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $72
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $6d
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $0c
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp + $79
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp+$6d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $72
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $79
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $48
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$77
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp + $79
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $72
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $77
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp+$75
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp + $77
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $72
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $75
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp + $73
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp + $75
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $72
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $75
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp + $73
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp + $75
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  ld hl, $0003
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
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
  ld de, $b5a9
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, sp + $0c
  ld [hl], $00
  ld hl, sp + $0c
  ld d, [hl]
  ld e, $00
  sla d
  rl e
  ld hl, sp + $6f
  ld [hl], d
  inc hl
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $7b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $73
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $73
  ld a, [hl+]
  or [hl]
  jp z, $b4e8

  ld hl, $0066
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
  ld hl, sp + $73
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, c
  ld h, b
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
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
  ld hl, sp + $73
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp + $75
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, $bc03
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
  ld de, $b5b3
  push de
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $02
  ld hl, sp + $0c
  inc [hl]
  jp $b443


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
  xor a
  push af
  inc sp
  ld hl, $0000
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld e, $00
  add sp, $7d
  ret
ROMInfoMapperText::
  DB "Mapper  : ", $00
ROMInfoROMSizeText::
  DB "Rom size: ", $00
ROMInfoRAMSizeText::
  DB "Ram size: ", $00
ROMInfoSystemText::
  DB "System  : ", $00
ROMInfoSGBText::
  DB "SGB     : ", $00
ROMInfoRTCText::
  DB "RTC     : ", $00

jr_002_5532:
  ccf
  ccf
  ccf
  ccf
  nop
  ld c, l
  ld b, d

jr_002_5539:
  ld b, e
  ld sp, $4d00
  ld b, d
  ld b, e
  ld [hl-], a
  nop

jr_002_5541:
  ld c, l
  ld b, d

jr_002_5543:
  ld b, e
  inc sp
  nop
  ld d, d
  ld c, a
  ld c, l
  jr nz, jr_002_554b

jr_002_554b:
  ld c, l

jr_002_554c:
  ld b, d
  ld b, e

jr_002_554e:
  dec [hl]
  nop
  inc sp
  ld [hl-], a
  ld c, e
  nop
  ld [hl], $34
  ld c, e
  nop
  ld sp, $3832
  ld c, e
  nop
  ld [hl-], a
  dec [hl]

jr_002_555f:
  ld [hl], $4b
  nop
  dec [hl]
  ld sp, $4b32
  nop
  ld sp, $004d

jr_002_556a:
  ld [hl-], a
  ld c, l
  nop
  inc [hl]
  ld c, l
  nop
  jr c, jr_002_55bf

  nop

jr_002_5573:
  jr nc, jr_002_5575

jr_002_5575:
  jr c, jr_002_55c2

  nop
  ld sp, $4b36
  nop
  ld b, a
  ld b, d

jr_002_557e:
  nop
  ld b, a
  ld b, d
  ld b, e
  cpl
  ld b, a
  ld b, d
  nop
  ld b, a
  ld b, d
  ld b, e
  nop
  ld c, [hl]
  ld l, a
  nop
  ld e, c
  ld h, l
  ld [hl], e
  nop
  ld d, d
  ld l, a
  ld l, l
  jr nz, jr_002_55ff

  ld l, [hl]
  ld h, [hl]
  ld l, a
  ld a, [bc]
  nop
  ld a, [bc]
  nop
  add sp, -$0d
  ld hl, sp + $00
  ld a, l
  ld d, h
  ld hl, sp+$0b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $cb
  inc hl
  ld [hl], $b6
  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $d4
  ld [bc], a
  inc bc
  ld a, $b6
  ld [bc], a

jr_002_55bf:
  dec hl
  ld e, [hl]
  inc hl

jr_002_55c2:
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $db
  inc hl
  ld [hl], $b6
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $ec
  inc hl
  ld [hl], $b6
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $bc03
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

jr_002_55ff:
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$0c
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $03
  ld a, e
  ld hl, sp + $0a
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_002_5621

  ld a, [hl]
  inc a
  jr nz, jr_002_5626

jr_002_5621:
  ld e, $00
  jp $b6c8


jr_002_5626:
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $0a
  ld a, [hl]
  dec a
  jr nz, jr_002_5686

  ld hl, $0008
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
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  jr jr_002_56b0

jr_002_5686:
  ld hl, sp + $0a
  ld a, [hl]
  sub $02
  jr nz, jr_002_56ae

  ld hl, $0006
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
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000
  add sp, $04
  ld a, e
  jr jr_002_56b0

jr_002_56ae:
  ld e, $00

jr_002_56b0:
  add sp, $0d
  ret
SaveRAMMenuTitleText::
  DB "Save RAM", $00
SaveRAMCancelText::
  DB "Cancel", $00
SaveRAMLoadText::
  DB "Copy File To RAM", $00
SaveRAMSaveText::
  DB "Copy RAM To File", $00
  ld hl, $bc03
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  inc sp
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003e
  add hl, bc
  ld c, l
  ld b, h

jr_002_570f:
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

jr_002_5722:
  ld l, b

jr_002_5723:
  ld h, c
  call BrowserCallHL + OS_WINDOW_FROM_4000

jr_002_5727:
  add sp, $06
  ld hl, $bc03

jr_002_572c:
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
  jp $b81d


  ld hl, $bc86
  ld a, [hl]
  sub $40
  inc hl
  ld a, [hl]
  sbc $00
  ret nc

  call $b6fd
  pop de
  pop bc
  push bc
  push de
  ld hl, $00dc
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $bc88
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
  ld hl, $bc8e
  ld [hl], $02
  ld hl, $bc87
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  inc [hl]
  jr nz, jr_002_577c

  inc hl
  inc [hl]

jr_002_577c:
  sla c
  rl b
  ld hl, $bc04
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $bc84
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  dec hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ret


  add sp, -$04
  ld hl, $bc87
  ld a, [hl-]
  or [hl]
  jp z, $b81a

  call $b6fd
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0052
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
  call BrowserCallHL + OS_WINDOW_FROM_4000
  push hl
  ld hl, sp+$02
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, $bc88
  ld a, [de]
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
  ld hl, $bc8e
  ld [hl], $02
  ld hl, $bc87
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec de
  dec hl
  ld [hl], e
  inc hl
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  ld hl, $bc04
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $bc84
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  add sp, $04
  ret
BrowserCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.


  jp hl


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call $b8df
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp $b8df


  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call $b8e3
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call $b8e3
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b8db
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b8db
  ret


  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $b8e3
  ld e, c
  ld d, b
  ret


  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $b8e3
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b919
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b919
  ret


  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $b91c
  ld e, c
  ld d, b
  ret


  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $b91c
  ret


  ld a, c
  rlca
  sbc a
  ld b, a
  ld a, e
  rlca
  sbc a
  ld d, a
  ld a, b
  push af
  xor d
  push af
  bit 7, d
  jr z, jr_002_58d9

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a

jr_002_58d9:
  bit 7, b
  jr z, jr_002_58e3

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_58e3:
  call $b91c
  jr c, jr_002_58fe

  pop af
  and $80
  jr z, jr_002_58f3

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_58f3:
  pop af
  and $80
  ret z

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a
  ret


jr_002_58fe:
  pop af
  pop af
  ret


  ld b, $00
  ld d, b
  ld a, e
  or d
  jr nz, jr_002_590f

  ld bc, $0000
  ld d, b
  ld e, c
  scf
  ret


jr_002_590f:
  ld l, c
  ld h, b
  ld bc, $0000
  or a
  ld a, $10

jr_002_5917:
  push af
  rl l
  rl h
  rl c
  rl b
  push bc
  ld a, c
  sbc e
  ld c, a
  ld a, b
  sbc d
  ld b, a
  ccf
  jr c, jr_002_5932

  pop bc
  pop af
  dec a
  or a
  jr nz, jr_002_5917

  jr jr_002_593b

jr_002_5932:
  inc sp
  inc sp
  pop af
  dec a
  scf
  jr nz, jr_002_5917

  jr jr_002_593b

jr_002_593b:
  ld d, b
  ld e, c
  rl l
  ld c, l
  rl h
  ld b, h
  or a
  ret
