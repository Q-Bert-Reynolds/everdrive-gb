; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $002", ROMX[$4000], BANK[$2]
Bank2Section1::
  add sp, -$07
  ld hl, $bc02
  ld [hl], $00
  inc hl
  ld [hl], $02
  ld de, $0256
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call $b805
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
  call $b805
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
  call $b805
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
  call $b89d
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
  ld hl, sp+$02
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
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$03
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
  ld hl, sp+$03
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

  ld hl, sp+$01
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
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  ld hl, $bc85
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$03
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
  ld hl, sp+$03
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

  ld hl, sp+$03
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

  ld hl, sp+$01
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
  ld hl, sp+$04
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
  ld hl, sp+$03
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

  ld hl, sp+$01
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
  ld hl, sp+$04
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
  call $b89d
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
  ld hl, sp+$03
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

  ld hl, sp+$01
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
  call $a9a0
  add sp, $02
  ld a, e
  or a
  jp z, $a079

  jp $a306


jr_002_42b1:
  ld hl, sp+$00
  bit 1, [hl]
  jr z, jr_002_42bd

  call $b796
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
  call $b805
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
  call $b805
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
  call $b805
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
  call $b805
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4399

  ld e, a
  jp $a878


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
  call $b805
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
  call $b805
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
  call $b805
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
  call $b805
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
  call $b89d
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
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  ld hl, $bc8c
  ld d, h
  ld e, l
  ld hl, sp+$05
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
  ld hl, sp+$05
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
  call $b89d
  add sp, $04
  ld hl, sp+$00
  ld [hl], e
  ld hl, $000c
  push hl
  ld hl, $bc8c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b8b1
  add sp, $04
  ld a, d
  or e
  jr z, jr_002_44de

  ld hl, sp+$00
  inc [hl]

jr_002_44de:
  ld hl, $bc8e
  ld a, [hl]
  or a
  jp z, $a610

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
  call $b805
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
  call $b805
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
  call $b805
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
  ld de, $a87d
  ld hl, $0000
  push hl
  push de
  ld l, b
  ld h, c
  call $b805
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
  ld de, $a884
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $02
  jp $a5c3


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
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $b89d
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
  call $b805
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
  ld de, $a886
  push de
  ld l, b
  ld h, c
  call $b805
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
  ld hl, sp+$00
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
  call $b805
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
  call $b805
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
  call $b805
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
  call $b805
  add sp, $02
  ld hl, $bc8d
  ld a, [hl-]
  or [hl]
  jp nz, $a6f5

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
  call $b805
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
  call $b805
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
  ld de, $a88b
  push de
  ld l, b
  ld h, c
  call $b805
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
  call $b805
  ld e, $00
  jp $a878


  ld hl, sp+$03
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$01
  ld d, h
  ld e, l
  ld hl, sp+$05
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, $a85a

  ld hl, $bc8e
  ld a, [hl]
  or a
  jp nz, $a75a

  ld hl, $bc84
  ld a, [hl]
  ld hl, sp+$01
  sub [hl]
  jr nz, jr_002_472d

  ld hl, $bc85
  ld a, [hl]
  ld hl, sp+$02
  sub [hl]
  jr z, jr_002_475a

jr_002_472d:
  ld hl, $bc00
  ld a, [hl]
  ld hl, sp+$01
  sub [hl]
  jr nz, jr_002_473f

  ld hl, $bc01
  ld a, [hl]
  ld hl, sp+$02
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
  ld de, $a89e
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $02
  jp $a84f


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
  ld hl, sp+$07
  ld a, l
  ld d, h
  ld hl, $00ee
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $00ec
  add hl, sp
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$01
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
  ld hl, $00f4
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
  ld hl, $00ec
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $00f8
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $00f8
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
  call $b805
  add sp, $06
  ld a, e
  or a
  jr z, jr_002_47d2

  ld e, a
  jp $a878


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
  ld hl, sp+$01
  sub [hl]
  jr nz, jr_002_4812

  ld hl, $bc85
  ld a, [hl]
  ld hl, sp+$02
  sub [hl]
  jr nz, jr_002_4812

  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call $b805
  inc sp
  ld hl, $00ef
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $a89f
  add sp, $02
  jr jr_002_481b

jr_002_4812:
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call $b805
  inc sp

jr_002_481b:
  ld hl, $00ef
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
  ld hl, $00ef
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $02
  ld hl, sp+$01
  inc [hl]
  jp nz, $a6fd

  inc hl
  inc [hl]
  jp $a6fd


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
  call $b805
  ld e, $00
  add sp, $7f
  add sp, $79
  ret


  ld d, b
  ld h, c
  ld h, a
  ld h, l
  ld a, [hl-]
  jr nz, jr_002_4884

jr_002_4884:
  jr nc, jr_002_4886

jr_002_4886:
  jr nz, jr_002_48f7

  ld h, [hl]
  jr nz, jr_002_488b

jr_002_488b:
  ld d, h
  ld l, b
  ld h, l
  ld [hl], d
  ld h, l
  jr nz, jr_002_48f3

  ld [hl], d
  ld h, l
  jr nz, jr_002_4904

  ld l, a
  jr nz, @+$68

  ld l, c
  ld l, h
  ld h, l
  ld [hl], e
  nop
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
  call $b805
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
  call $b805
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
  call $b805
  add sp, $02
  ld hl, sp+$01

jr_002_4904:
  ld [hl], $00
  ld hl, sp+$01
  ld a, [hl-]
  sub [hl]
  jp nc, $a97a

  inc hl
  ld a, [hl]
  sub $3c
  jp nc, $a97a

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
  ld hl, sp+$03
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
  ld hl, sp+$01
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
  call $b805
  add sp, $02
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$03
  ld a, [hl]
  ld [de], a
  dec hl
  dec hl
  ld a, [hl]
  add $14
  ld [hl], a
  jp $a906


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
  call $b805
  add sp, $02
  add sp, $08
  ret


  add sp, -$80
  add sp, -$80
  add sp, -$22
  ld hl, sp+$14
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
  ld [hl], $b3
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
  ld a, $b7
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
  ld [hl], $ba
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
  ld hl, $0101
  add hl, sp
  ld a, l
  ld d, h
  ld hl, $0116
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $be
  inc hl
  ld [hl], $ad
  ld hl, $0117
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $c2
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
  ld [hl], $c6
  inc hl
  ld [hl], $ad
  ld hl, $0117
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $c9
  inc hl
  ld [hl], $ad
  ld hl, $0117
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
  ld hl, sp+$0a
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
  ld [hl], $cd
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
  ld [hl], $e6
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
  ld [hl], $f7
  inc hl
  ld [hl], $ad
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
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $0112
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $cd
  inc hl
  ld [hl], $ad
  ld hl, $0113
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $01
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
  ld [hl], $02
  inc hl
  ld [hl], $ae
  ld hl, $0113
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $01
  inc hl
  ld [hl], $ae
  ld hl, $0113
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
  jp $adac


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
  ld hl, sp+$1c
  ld a, l
  ld d, h
  ld hl, $0120
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0114
  add hl, sp
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
  ld hl, $0118
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
  ld hl, $011c
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $011c
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
  call $b805
  add sp, $06
  ld a, e
  or a
  jr z, jr_002_4b8b

  ld e, a
  jp $adac


jr_002_4b8b:
  ld hl, $0121
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

  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b742
  add sp, $02
  ld e, $00
  jp $adac


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
  call $b805
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
  call $b805
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
  ld hl, $0118
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $0121
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0111
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  ld hl, $011c
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $b805
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4c2d

  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $ae1d
  add sp, $02
  jp $adac


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
  ld hl, $0118
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $0121
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0117
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  ld hl, $011c
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $b805
  add sp, $04
  ld hl, $0118
  add hl, sp
  ld [hl], e
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0118
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
  call $b805
  add sp, $03
  ld e, $00
  jp $adac


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
  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, $ae15
  push hl
  ld l, b
  ld h, c
  call $b805
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_4cd2

  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b59d
  add sp, $02
  jp $adac


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
  ld hl, $0121
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, $ae19
  push hl
  ld l, b
  ld h, c
  call $b805
  add sp, $04
  ld a, e
  or a
  jp z, $ad51

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
  ld hl, $0118
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, $0120
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
  ld hl, $0119
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
  call $b805
  add sp, $03
  ld a, e
  jp $adac


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
  call $b805
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
  call $b805
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
  ld hl, $0113
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
  call $b805
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
  jr nz, jr_002_4dcd

jr_002_4dcd:
  ld b, [hl]
  ld l, c
  ld l, h
  ld h, l
  jr nz, @+$4f

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld b, c
  ld [hl], d
  ld h, e
  ld l, b
  ld l, c
  db $76
  ld h, l
  ld h, h
  jr nz, jr_002_4e47

  ld l, c
  ld l, h
  ld h, l
  ld [hl], e
  nop
  ld l, c
  ld [hl], e
  jr nz, jr_002_4e58

  ld l, a
  ld [hl], h
  jr nz, @+$75

  ld [hl], l
  ld [hl], b
  ld [hl], b
  ld l, a
  ld [hl], d
  ld [hl], h
  ld h, l
  ld h, h
  nop
  ld d, l
  ld l, [hl]
  ld a, d
  ld l, c
  ld [hl], b
  jr nz, jr_002_4e6b

  ld h, l
  ld hl, $0000
  ld d, l
  ld l, [hl]
  ld l, e
  ld l, [hl]
  ld l, a
  ld [hl], a
  ld l, [hl]
  jr nz, jr_002_4e5d

  ld c, a
  ld c, l
  jr nz, jr_002_4e75

  ld l, a
  ld [hl], d
  ld l, l
  ld h, c
  ld [hl], h
  nop
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
  ld [hl], h
  ld a, b
  ld [hl], h
  nop
  add sp, -$18
  ld hl, sp+$11
  ld [hl], $00
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld [hl], $a5
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
  ld [hl], $af
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
  ld [hl], $c0
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
  ld [hl], $cc
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
  ld [hl], $d3

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
  ld hl, sp+$0c
  ld a, l
  ld d, h
  ld hl, sp+$16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$12
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
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec hl
  dec hl
  ld a, [hl]
  push af
  inc sp
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $03
  ld a, e
  ld hl, sp+$11
  ld [hl], a
  ld a, [hl]
  inc a
  jr nz, jr_002_4ed3

  ld e, $00
  jp $afa2


jr_002_4ed3:
  ld hl, sp+$11
  ld a, [hl]
  or a
  jr z, jr_002_4ede

  ld a, [hl]
  dec a
  jp nz, $af28

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
  call $b805
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_4f04

  ld e, a
  jp $afa2


jr_002_4f04:
  ld hl, sp+$11
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
  call $b805
  ld a, e
  jp $afa2


jr_002_4f23:
  ld e, $00
  jp $afa2


  ld hl, sp+$11
  ld a, [hl]
  sub $02
  jp nz, $af74

  ld hl, sp+$0c
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
  ld hl, sp+$15
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
  call $b805
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_4f74

  ld e, a
  jp $afa2


jr_002_4f74:
  ld hl, sp+$11
  ld a, [hl]
  sub $03
  jr nz, jr_002_4f86

  ld hl, sp+$1a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $afdc
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
  call $b805
  jp $ae9f


  add sp, $18
  ret


  ld b, a
  ld h, c
  ld l, l
  ld h, l
  jr nz, @+$4f

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld d, e
  ld h, l
  ld l, h
  ld h, l
  ld h, e
  ld [hl], h
  jr nz, @+$43

  ld l, [hl]
  ld h, h
  jr nz, @+$55

  ld [hl], h
  ld h, c
  ld [hl], d
  ld [hl], h
  nop
  ld d, e
  ld h, l
  ld l, h
  ld h, l
  ld h, e
  ld [hl], h
  jr nz, jr_002_5017

  ld l, [hl]
  ld l, h
  ld a, c
  nop
  ld b, e
  ld l, b
  ld h, l
  ld h, c
  ld [hl], h
  ld [hl], e
  nop
  ld d, d
  ld l, a
  ld l, l
  jr nz, jr_002_5021

  ld l, [hl]
  ld h, [hl]
  ld l, a
  nop
  add sp, -$7d
  ld hl, sp+$5f
  ld a, l
  ld d, h
  ld hl, sp+$79
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $f0
  inc hl
  ld [hl], $b4
  ld hl, sp+$7a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $fb
  ld [bc], a
  inc bc
  ld a, $b4
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $06
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
  ld [hl], $11
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
  ld [hl], $1c
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
  ld [hl], $27
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
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$38
  ld a, l
  ld d, h
  ld hl, sp+$6f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $32
  inc hl
  ld [hl], $b5
  ld hl, sp+$70
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $37
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
  ld [hl], $3c
  inc hl
  ld [hl], $b5
  ld hl, sp+$70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $41
  inc hl
  ld [hl], $b5
  ld hl, sp+$70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $46
  inc hl
  ld [hl], $b5
  ld hl, sp+$70
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $4b
  inc hl
  ld [hl], $b5
  ld hl, sp+$10
  ld a, l
  ld d, h
  ld hl, sp+$77
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $50
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $54
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
  ld [hl], $58
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $5d
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $62
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $67
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $6a
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000e
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $6d
  inc hl
  ld [hl], $b5
  ld hl, sp+$78
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0010
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $70
  inc hl
  ld [hl], $b5
  ld hl, sp+$2c
  ld a, l
  ld d, h
  ld hl, sp+$7b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $73
  inc hl
  ld [hl], $b5
  ld hl, sp+$7c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $75
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
  ld [hl], $78
  inc hl
  ld [hl], $b5
  ld hl, sp+$7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $50
  inc hl
  ld [hl], $b5
  ld hl, sp+$7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $54
  inc hl
  ld [hl], $b5
  ld hl, sp+$7c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $58
  inc hl
  ld [hl], $b5
  ld hl, sp+$26
  ld a, l
  ld d, h
  ld hl, sp+$71
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $7c
  inc hl
  ld [hl], $b5
  ld hl, sp+$72
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $7f
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
  ld [hl], $86
  inc hl
  ld [hl], $b5
  ld hl, sp+$22
  ld a, l
  ld d, h
  ld hl, sp+$75
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $8a
  inc hl
  ld [hl], $b5
  ld hl, sp+$76
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
  call $b805
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
  ld hl, sp+$44
  ld a, l
  ld d, h
  ld hl, sp+$73
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
  call $b805
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_5248

  ld e, a
  jp $b4ed


jr_002_5248:
  ld hl, sp+$74
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0e
  ld [hl], a
  ld hl, sp+$74
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld hl, sp+$0f
  ld [hl], a
  ld hl, sp+$74
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
  ld hl, sp+$0c
  ld [hl], e
  ld hl, sp+$74
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  or a
  jr nz, jr_002_5286

  ld hl, sp+$0c
  ld [hl], $00

jr_002_5286:
  ld hl, sp+$0d
  ld [hl], $00

jr_002_528a:
  ld hl, sp+$0f
  ld a, [hl]
  or a
  jr z, jr_002_529b

  ld hl, sp+$0d
  inc [hl]
  inc hl
  inc hl
  ld a, [hl]
  srl a
  ld [hl], a
  jr jr_002_528a

jr_002_529b:
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$6d
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$0e
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$6f
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
  ld hl, sp+$6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$6f
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$0d
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
  ld hl, sp+$6f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$77
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$0c
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$7b
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
  ld hl, sp+$77
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$7b
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$74
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
  ld hl, sp+$71
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
  ld hl, sp+$7b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$71
  ld [hl+], a
  ld [hl], d
  inc hl
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
  ld hl, sp+$71
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$6e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$71
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
  ld hl, sp+$71
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
  call $b805
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
  call $b805
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
  ld de, $b591
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $02
  ld hl, sp+$0d
  ld [hl], $00
  ld hl, sp+$0d
  ld d, [hl]
  ld e, $00
  sla d
  rl e
  ld hl, sp+$73
  ld [hl], d
  inc hl
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$79
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$75
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$75
  ld a, [hl+]
  or [hl]
  jp z, $b4d0

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
  ld hl, sp+$75
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, c
  ld h, b
  call $b805
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
  ld hl, sp+$75
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$6d
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
  ld hl, sp+$77
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $b805
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
  ld de, $b59b
  push de
  ld l, b
  ld h, c
  call $b805
  add sp, $02
  ld hl, sp+$0d
  inc [hl]
  jp $b42b


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
  call $b805
  add sp, $03
  ld e, $00
  add sp, $7d
  ret


  ld c, l
  ld h, c
  ld [hl], b
  ld [hl], b
  ld h, l
  ld [hl], d
  jr nz, @+$22

  ld a, [hl-]
  jr nz, jr_002_54fb

jr_002_54fb:
  ld d, d
  ld l, a
  ld l, l
  jr nz, jr_002_5573

  ld l, c
  ld a, d
  ld h, l
  ld a, [hl-]
  jr nz, jr_002_5506

jr_002_5506:
  ld d, d
  ld h, c
  ld l, l
  jr nz, jr_002_557e

  ld l, c
  ld a, d
  ld h, l
  ld a, [hl-]
  jr nz, jr_002_5511

jr_002_5511:
  ld d, e
  ld a, c
  ld [hl], e
  ld [hl], h
  ld h, l
  ld l, l
  jr nz, jr_002_5539

  ld a, [hl-]
  jr nz, jr_002_551c

jr_002_551c:
  ld d, e
  ld b, a
  ld b, d
  jr nz, jr_002_5541

  jr nz, jr_002_5543

  jr nz, jr_002_555f

  jr nz, jr_002_5527

jr_002_5527:
  ld d, d
  ld d, h
  ld b, e
  jr nz, jr_002_554c

  jr nz, jr_002_554e

  jr nz, jr_002_556a

  jr nz, jr_002_5532

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
  ld hl, sp+$01
  ld a, l
  ld d, h
  ld hl, sp+$0b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $b3
  inc hl
  ld [hl], $b6
  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $bc
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
  ld [hl], $c3
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
  ld [hl], $d4
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
  call $b805
  add sp, $03
  ld a, e
  ld hl, sp+$00
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_002_5621

  ld a, [hl]
  inc a
  jr nz, jr_002_5626

jr_002_5621:
  ld e, $00
  jp $b6b0


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
  call $b805
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
  call $b805
  ld hl, $bc03
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
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
  call $b805
  add sp, $04
  ld a, e
  jr jr_002_56b0

jr_002_5686:
  ld hl, sp+$00
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
  call $b805
  add sp, $04
  ld a, e
  jr jr_002_56b0

jr_002_56ae:
  ld e, $00

jr_002_56b0:
  add sp, $0d
  ret


  ld d, e
  ld h, c
  db $76
  ld h, l
  jr nz, @+$54

  ld b, c
  ld c, l
  nop
  ld b, e
  ld h, c
  ld l, [hl]
  ld h, e
  ld h, l
  ld l, h
  nop
  ld b, e
  ld l, a
  ld [hl], b
  ld a, c
  jr nz, jr_002_570f

  ld l, c
  ld l, h
  ld h, l
  jr nz, jr_002_5722

  ld l, a
  jr nz, jr_002_5723

  ld b, c
  ld c, l
  nop
  ld b, e
  ld l, a
  ld [hl], b
  ld a, c
  jr nz, jr_002_572c

  ld b, c
  ld c, l
  jr nz, @+$56

  ld l, a
  jr nz, jr_002_5727

  ld l, c
  ld l, h
  ld h, l
  nop
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
  call $b805
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
  call $b805

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
  jp $b805


  ld hl, $bc86
  ld a, [hl]
  sub $40
  inc hl
  ld a, [hl]
  sbc $00
  ret nc

  call $b6e5
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
  jp z, $b802

  call $b6e5
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
  call $b805
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


  jp hl


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call $b8c7
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp $b8c7


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
  call $b8cb
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
  call $b8cb
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b8c3
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b8c3
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
  call $b8cb
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
  call $b8cb
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b901
  ld e, c
  ld d, b
  ret


  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $b901
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
  call $b904
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
  call $b904
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
  call $b904
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


SECTION "ROM Bank 2, Section 2", ROMX[$6000], BANK[2]
Bank2Section2::
  add sp, -$27
  ld hl, sp+$0b
  ld a, l
  ld d, h
  ld hl, sp+$25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $29
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $33
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
  ld [hl], $3b
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $4b
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $57
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $5e
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $6a
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000e
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $76
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0010
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $80
  inc hl
  ld [hl], $a3
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0012
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$0a
  ld [hl], $00
  ld hl, $bc00
  ld [hl], $00
  inc hl
  ld [hl], $02
  ld de, $0254
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call $ba79
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
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b2e4
  add sp, $02
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
  call $ba79
  ld c, e
  ld b, d
  inc bc
  inc bc
  ld a, [bc]
  or a
  jr nz, jr_002_6101

  ld a, $06
  push af
  inc sp
  call $b33c
  inc sp

jr_002_6101:
  ld hl, sp+$04
  ld a, l
  ld d, h
  ld hl, sp+$25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1f
  ld [hl+], a
  ld [hl], e
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
  call $ba79
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
  ld de, $bc02
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $03
  ld a, e
  ld hl, sp+$0a
  ld [hl], a
  ld a, [hl]
  push af
  inc sp
  call $b3b7
  inc sp
  ld hl, sp+$09
  ld [hl], e
  ld a, [hl]
  inc a
  jr nz, jr_002_6164

  ld e, $00
  jp $a326


jr_002_6164:
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
  call $ba79
  ld hl, sp+$09
  ld a, [hl]
  or a
  jr nz, jr_002_618b

  call $b069
  ld a, e
  or a
  jp nz, $a326

jr_002_618b:
  ld hl, sp+$09
  ld a, [hl]
  dec a
  jp nz, $a1c7

  ld hl, sp+$04
  ld e, l
  ld d, h
  ld a, $01
  ld [de], a
  ld hl, $bc01
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
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $08
  push af
  inc sp
  ld l, b
  ld h, c
  call $ba79
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_61c7

  ld e, a
  jp $a326


jr_002_61c7:
  ld hl, sp+$09
  ld a, [hl]
  sub $02
  jp nz, $a292

  ld hl, $bc01
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
  call $ba79
  push hl
  ld hl, sp+$23
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp+$00
  ld a, [hl]
  ld hl, sp+$21
  sub [hl]
  jr nz, jr_002_6214

  ld hl, sp+$01
  ld a, [hl]
  ld hl, sp+$22
  sub [hl]
  jr nz, jr_002_6214

  ld hl, sp+$02
  ld a, [hl]
  ld hl, sp+$23
  sub [hl]
  jr nz, jr_002_6214

  ld hl, sp+$03
  ld a, [hl]
  ld hl, sp+$24
  sub [hl]
  jp z, $a275

jr_002_6214:
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
  call $ba79
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
  call $ba79
  ld hl, $bc01
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
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call $ba79
  add sp, $04
  ld a, e
  or a
  jr z, jr_002_6275

  ld e, a
  jp $a326


jr_002_6275:
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0010
  add hl, bc
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
  call $ba79
  ld a, e
  jp $a326


  ld hl, sp+$09
  ld a, [hl]
  sub $03
  jp nz, $a2cf

  ld hl, sp+$04
  ld e, l
  ld d, h
  ld a, $04
  ld [de], a
  ld hl, $bc01
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
  ld hl, sp+$20
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
  call $ba79
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_62cf

  ld e, a
  jp $a326


jr_002_62cf:
  ld hl, sp+$09
  ld a, [hl]
  sub $04
  jr nz, jr_002_62dc

  call $a7df
  jp $a110


jr_002_62dc:
  ld hl, sp+$09
  ld a, [hl]
  sub $05
  jr nz, jr_002_630e

  ld hl, $bc01
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
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, $0000
  push hl
  ld a, $09
  push af
  inc sp
  ld l, c
  ld h, b
  call $ba79
  add sp, $03
  ld a, e
  or a
  jp z, $a110

  ld e, a
  jr jr_002_6326

jr_002_630e:
  ld hl, sp+$09
  ld a, [hl]
  sub $06
  jr nz, jr_002_6318

  call $b436

jr_002_6318:
  ld hl, sp+$09
  ld a, [hl]
  sub $07
  jp nz, $a110

  call $a386
  jp $a110


jr_002_6326:
  add sp, $27
  ret


  ld c, l
  ld h, c
  ld l, c
  ld l, [hl]
  jr nz, @+$4f

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld c, a
  ld [hl], b
  ld [hl], h
  ld l, c
  ld l, a
  ld l, [hl]
  ld [hl], e
  nop
  ld d, d
  ld h, l
  ld h, e
  ld h, l
  ld l, [hl]
  ld [hl], h
  ld l, h
  ld a, c
  jr nz, jr_002_6395

  ld l, h
  ld h, c
  ld a, c
  ld h, l
  ld h, h
  nop
  ld d, d
  ld h, c
  ld l, [hl]
  ld h, h
  ld l, a
  ld l, l
  jr nz, jr_002_639a

  ld h, c
  ld l, l
  ld h, l
  nop
  ld b, e
  ld l, b
  ld h, l
  ld h, c
  ld [hl], h
  ld [hl], e
  nop
  ld b, h
  ld h, l
  db $76
  ld l, c
  ld h, e
  ld h, l
  jr nz, jr_002_63af

  ld l, [hl]
  ld h, [hl]
  ld l, a
  nop
  ld b, h
  ld l, c
  ld h, c
  ld h, a
  ld l, [hl]
  ld l, a
  ld [hl], e
  ld [hl], h
  ld l, c
  ld h, e
  ld [hl], e
  nop
  ld d, e
  ld h, l
  ld [hl], h
  ld [hl], l
  ld [hl], b
  jr nz, jr_002_63cf

  ld d, h
  ld b, e
  nop
  ld b, c
  ld h, d
  ld l, a
  ld [hl], l
  ld [hl], h
  nop
  add sp, -$04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000c
  add hl, bc
  ld c, l
  ld b, h

jr_002_6395:
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de

jr_002_639a:
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call $ba79
  ld b, e
  ld c, d
  ld hl, sp+$00
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_002_63af:
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
  call $ba79
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022

jr_002_63cf:
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $a701
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld hl, sp+$02
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  pop de
  push de
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $04
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
  ld de, $a710
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a711
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a726
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a710
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a735
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a74a
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a75c
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a710
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a76b
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
  inc sp
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
  ld de, $a780
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
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
  call $ba79
  ld c, e
  ld b, d
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  ld hl, sp+$02
  ld [hl], a
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
  ld hl, sp+$02
  ld a, [hl]
  or a
  jr z, jr_002_6664

  ld de, $a794
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a7a0
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  jr jr_002_668e

jr_002_6664:
  ld de, $a7a7
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a7b3
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02

jr_002_668e:
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
  ld de, $a7ba
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $a7cb
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
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
  call $ba79
  add sp, $04
  ret

Bank2DataProbably::
  ld b, l
  db $76
  ld h, l
  ld [hl], d
  ld b, h
  ld [hl], d
  ld l, c
  db $76
  ld h, l
  dec l
  ld b, a
  ld b, d
  jr nz, @+$5a

  nop
  nop
  ld b, h
  ld h, l
  db $76
  ld h, l
  ld l, h
  ld l, a
  ld [hl], b
  ld h, l
  ld h, h
  jr nz, @+$64

  ld a, c
  ld a, [hl-]
  jr nz, @+$22

  jr nz, @+$22

  jr nz, @+$22

  jr nz, jr_002_6726

jr_002_6726:
  ld c, c
  ld l, $20
  ld b, a
  ld l, a
  ld l, h
  ld [hl], l
  ld h, d
  ld l, a
  db $76
  ld [hl], e
  ld l, e
  ld l, c
  ld a, c
  nop
  ld d, e
  ld [hl], l
  ld [hl], b
  ld [hl], b
  ld l, a
  ld [hl], d
  ld [hl], h
  ld a, [hl-]
  jr nz, jr_002_675f

  jr nz, jr_002_6761

  jr nz, jr_002_6763

  jr nz, jr_002_6765

  jr nz, @+$22

  jr nz, jr_002_6769

  nop
  ld h, d
  ld l, c
  ld l, a
  ld l, e
  ld [hl], d
  ld l, c
  ld l, e
  ld b, b
  ld h, a
  ld l, l
  ld h, c
  ld l, c
  ld l, h
  ld l, $63
  ld l, a
  ld l, l
  nop
  ld [hl], a
  ld [hl], a
  ld [hl], a

jr_002_675f:
  ld l, $6b

jr_002_6761:
  ld [hl], d
  ld l, c

jr_002_6763:
  ld l, e
  ld a, d

jr_002_6765:
  ld a, d
  ld l, $63
  ld l, a

jr_002_6769:
  ld l, l
  nop
  ld b, e
  ld l, a
  ld l, [hl]
  ld [hl], h
  ld [hl], d
  ld l, a
  ld l, h
  ld a, [hl-]
  jr nz, jr_002_6795

  jr nz, jr_002_6797

  jr nz, jr_002_6799

  jr nz, @+$22

  jr nz, jr_002_679d

  jr nz, jr_002_679f

  nop
  ld c, h
  ld b, l
  ld b, [hl]
  cpl
  ld d, d
  ld c, c
  ld b, a
  dec l
  ld [hl], e
  ld [hl], a
  ld l, c
  ld [hl], h
  ld h, e
  ld l, b
  jr nz, jr_002_6800

  ld h, c
  ld h, a
  ld h, l
  nop
  ld b, d

jr_002_6795:
  dec l
  ld h, [hl]

jr_002_6797:
  ld l, c
  ld l, h

jr_002_6799:
  ld h, l
  jr nz, jr_002_6809

  ld h, l

jr_002_679d:
  ld l, [hl]
  ld [hl], l

jr_002_679f:
  nop
  ld b, c
  dec l
  ld h, d
  ld h, c
  ld h, e
  ld l, e
  nop
  ld b, c
  dec l
  ld h, [hl]
  ld l, c
  ld l, h
  ld h, l
  jr nz, jr_002_681c

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld b, d
  dec l
  ld h, d
  ld h, c
  ld h, e
  ld l, e
  nop
  ld d, e
  ld b, l
  ld c, h
  ld b, l
  ld b, e
  ld d, h
  dec l
  ld l, l
  ld h, c
  ld l, c
  ld l, [hl]
  jr nz, jr_002_6834

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld d, e
  ld d, h
  ld b, c
  ld d, d
  ld d, h
  dec l
  ld [hl], d
  ld [hl], l
  ld l, [hl]
  jr nz, @+$6e

  ld h, c
  ld [hl], e
  ld [hl], h
  jr nz, @+$69

  ld h, c
  ld l, l
  ld h, l
  nop
  add sp, -$1c
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $ef
  inc hl
  ld [hl], $af
  ld hl, sp+$15
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $f3
  ld [bc], a
  inc bc
  ld a, $af

jr_002_6800:
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de

jr_002_6809:
  ld b, l
  ld c, h
  ld [hl], $f6
  inc hl
  ld [hl], $af
  ld hl, sp+$15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h

jr_002_681c:
  ld [hl], $fa
  inc hl
  ld [hl], $af
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

jr_002_6834:
  ld c, a
  ld l, b
  ld h, c
  call $ba79
  ld b, e
  ld c, d
  ld hl, sp+$08
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc01
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
  call $ba79
  ld hl, $bc01
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
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $affe
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b012
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
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
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, sp+$1e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $04
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b025
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
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
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$12
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
  ld b, $00
  ld de, $0000
  push de
  push bc
  ld hl, sp+$1e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $04
  ld hl, $bc01
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
  ld de, $b02f
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
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
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  push bc
  inc sp
  ld hl, sp+$1b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b031
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
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
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  ld l, b
  ld h, c
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b03b
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b045
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$1a
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
  ld a, b
  and $1f
  ld d, a
  ld e, $00
  push de
  inc sp
  call $ba48
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b02f
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  ld a, b
  and $0f
  ld d, a
  ld e, $00
  push de
  inc sp
  call $ba48
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b02f
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl a
  ld c, a
  ld b, $00
  ld hl, $07bc
  add hl, bc
  ld c, l
  ld b, h
  ld de, $0000
  push de
  push bc
  ld hl, sp+$16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $04
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b04f
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000f
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$1a
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
  sla c
  rl b
  ld hl, $003c
  push hl
  push bc
  call $bb11
  add sp, $04
  ld hl, $003c
  push hl
  push de
  call $bb11
  add sp, $04
  ld d, e
  push de
  inc sp
  call $ba48
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b059
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  sla c
  rl b
  ld hl, $003c
  push hl
  push bc
  call $bb11
  add sp, $04
  ld hl, $003c
  push hl
  push de
  call $bb25
  add sp, $04
  ld d, e
  push de
  inc sp
  call $ba48
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b059
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  sla c
  rl b
  ld hl, $003c
  push hl
  push bc
  call $bb25
  add sp, $04
  ld d, e
  push de
  inc sp
  call $ba48
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b05b
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001b
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$0e
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $04
  ld hl, $bc01
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
  ld de, $b023
  push de
  ld l, b
  ld h, c
  call $ba79
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
  call $ba79
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
  ld hl, $1010;probably not a jump address
  push hl
  ld l, b
  ld h, c
  call $ba79
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
  ld hl, $1000
  push hl
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $b065
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0e
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0013
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$16
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b059
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld hl, sp+$16
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0017
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
  ld hl, sp+$0a
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
  ld hl, sp+$0c
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $18

jr_002_6f02:
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, jr_002_6f02

  push de
  inc sp
  ld hl, sp+$17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  inc sp
  ld hl, $bc01
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
  ld de, $b059
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b059
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001f
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$16
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
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
  xor a
  push af
  inc sp
  ld hl, $0000
  push hl
  ld l, b
  ld h, c
  call $ba79
  add sp, $03
  add sp, $1c
  ret


  ccf
  ccf
  ccf
  nop
  ld b, a
  ld b, d
  nop
  ld d, e
  ld b, a
  ld b, d
  nop
  ld b, a
  ld b, d
  ld b, e
  nop
  ld d, e
  ld a, c
  ld [hl], e
  ld [hl], h
  ld h, l
  ld l, l
  jr nz, jr_002_704f

  ld l, [hl]
  ld h, [hl]
  ld l, a
  ld [hl], d
  ld l, l
  ld h, c
  ld [hl], h
  ld l, c
  ld l, a
  ld l, [hl]
  ld a, [bc]
  nop
  ld b, e
  ld h, c
  ld [hl], d
  ld [hl], h
  jr nz, jr_002_7038

  jr nz, jr_002_703a

  ld a, [hl-]
  ld b, l
  ld b, h
  dec l
  ld b, a
  ld b, d
  dec l
  ld e, b
  nop
  ld a, [bc]
  nop
  ld c, a
  ld d, e
  jr nz, jr_002_709f

  ld h, l
  ld [hl], d
  jr nz, jr_002_704d

  ld a, [hl-]
  nop
  ld l, $00
  ld b, [hl]
  ld d, b
  ld b, a
  ld b, c
  jr nz, jr_002_70ad

  ld h, l

jr_002_7038:
  ld [hl], d
  ld a, [hl-]

jr_002_703a:
  nop
  ld d, e
  ld a, c
  ld [hl], e
  jr nz, @+$76

  ld a, c
  ld [hl], b
  ld h, l
  ld a, [hl-]
  nop
  ld b, c
  ld [hl], e
  ld l, l
  jr nz, jr_002_70ae

  ld h, c
  ld [hl], h
  ld h, l

jr_002_704d:
  ld a, [hl-]
  nop

jr_002_704f:
  ld b, c
  ld [hl], e
  ld l, l
  jr nz, jr_002_70c8

  ld l, c
  ld l, l
  ld h, l
  ld a, [hl-]
  nop
  ld a, [hl-]
  nop
  ld d, b
  ld [hl], a
  ld [hl], d
  jr nz, @+$65

  ld l, [hl]
  ld [hl], h
  ld [hl], d
  ld a, [hl-]
  nop
  ld d, e
  ld c, [hl]
  ld a, [hl-]
  nop
  add sp, -$17
  ld hl, sp+$07
  ld [hl], $00
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$09
  ld a, l
  ld d, h
  ld hl, sp+$13
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $99
  inc hl
  ld [hl], $b2
  ld hl, sp+$14
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $a7
  ld [bc], a
  inc bc
  ld a, $b2
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $b5

jr_002_709f:
  inc hl
  ld [hl], $b2
  ld hl, sp+$14
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l

jr_002_70ad:
  ld c, h

jr_002_70ae:
  ld [hl], $c3
  inc hl
  ld [hl], $b2
  ld hl, sp+$01
  ld a, l
  ld d, h
  ld hl, sp+$11
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $d1
  inc hl
  ld [hl], $b2
  ld hl, sp+$12
  dec hl
  ld c, [hl]

jr_002_70c8:
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $d5
  ld [bc], a
  inc bc
  ld a, $b2
  ld [bc], a
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
  call $ba79
  ld c, e
  ld b, d
  inc bc
  inc bc
  ld hl, sp+$05
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $bc01
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
  call $ba79
  ld hl, $bc01
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
  ld hl, $0002
  push hl
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b2d9
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, sp+$08
  ld [hl], $00
  ld hl, $bc01
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
  ld hl, sp+$15
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$08
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp+$17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld hl, sp+$15
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  inc hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp+$17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld hl, $bc01
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
  ld de, $b2e2
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, sp+$08
  inc [hl]
  ld a, [hl]
  sub $04
  jp c, $b150

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
  ld hl, sp+$07
  ld a, [hl]
  push af
  inc sp
  ld hl, $0000
  push hl
  ld l, b
  ld h, c
  call $ba79
  add sp, $03
  ld a, e
  ld hl, sp+$07
  ld [hl], a
  ld a, [hl]
  inc a
  jp nz, $b27c

  ld hl, sp+$00
  ld a, [hl]
  or a
  jr nz, jr_002_722e

  ld e, a
  jp $b296


jr_002_722e:
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
  call $ba79
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
  call $ba79
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000a
  add hl, bc
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
  call $ba79
  ld a, e
  jr jr_002_7296

  ld hl, sp+$00
  ld [hl], $01
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  inc a
  ld [bc], a
  and $01
  ld [bc], a
  jp $b0f5


jr_002_7296:
  add sp, $17
  ret


  ld b, e
  ld l, b
  ld h, l
  ld h, c
  ld [hl], h
  ld [hl], e
  jr nz, jr_002_72c1

  jr nz, jr_002_72c3

  jr nz, jr_002_72df

  jr nz, jr_002_72a7

jr_002_72a7:
  ld d, e
  ld [hl], a
  ld h, c
  ld [hl], b
  jr nz, @+$43

  cpl
  ld b, d
  jr nz, jr_002_72d1

  jr nz, jr_002_72ed

  jr nz, jr_002_72b5

jr_002_72b5:
  ld c, b
  ld l, c
  ld h, h
  ld h, l
  jr nz, jr_002_7302

  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  ld a, [hl-]

jr_002_72c1:
  jr nz, jr_002_72c3

jr_002_72c3:
  ld d, e
  ld a, c
  ld [hl], e
  jr nz, @+$44

  ld [hl], l
  ld [hl], h
  ld [hl], h
  ld l, a
  ld l, [hl]
  jr nz, jr_002_7309

  jr nz, jr_002_72d1

jr_002_72d1:
  ld l, a
  ld h, [hl]
  ld h, [hl]
  nop
  ld l, a
  ld l, [hl]
  jr nz, jr_002_72d9

jr_002_72d9:
  ld c, a
  ld [hl], b
  ld [hl], h
  ld l, c
  ld l, a
  ld l, [hl]

jr_002_72df:
  ld [hl], e
  ld a, [bc]
  nop
  ld a, [bc]
  nop
  add sp, -$03
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$00
  ld c, [hl]

jr_002_72ed:
  ld b, $00
  sla c
  rl b
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl

jr_002_7302:
  ld d, [hl]
  ld a, [de]
  dec hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a

jr_002_7309:
  ld hl, $bc02
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$01
  ld a, [hl+]
  or [hl]
  jr z, jr_002_7332

  ld hl, sp+$01
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  ld de, $bc2a
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld a, [hl]
  add $ff
  ld [bc], a
  inc [hl]
  jp $b2ea


jr_002_7332:
  ld a, $00
  ld [bc], a
  inc bc
  ld a, $00
  ld [bc], a
  add sp, $03
  ret


  add sp, -$04
  ld hl, sp+$06
  ld a, [hl]
  inc a
  ld hl, sp+$01
  ld [hl], a
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $bc02
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$02
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
  or b
  jp z, $b3b4

  ld hl, sp+$06
  ld a, [hl]
  add $02
  ld hl, sp+$00
  ld [hl], a
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $bc02
  add hl, bc
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
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld de, $bc2a
  ld hl, sp+$01
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
  ld de, $bc2a
  ld hl, sp+$00
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  push hl
  ld hl, sp+$03
  ld a, [hl]
  ld hl, sp+$08
  ld [hl], a
  pop hl
  jp $b33e


  add sp, $04
  ret


  ld hl, sp+$02
  ld a, [hl]
  inc a
  jr nz, jr_002_73c1

  ld hl, sp+$02
  ld e, [hl]
  ret


jr_002_73c1:
  ld hl, sp+$02
  ld a, [hl]
  sub $80
  jr c, jr_002_73dc

  ld a, [hl]
  add $80
  ld [hl], a
  ld b, [hl]
  inc b
  ld a, $2a
  add b
  ld c, a
  ld a, $bc
  adc $00
  ld b, a
  ld a, [bc]
  add $80
  ld e, a
  ret


jr_002_73dc:
  ld hl, sp+$02
  ld b, [hl]
  inc b
  ld a, $2a
  add b
  ld c, a
  ld a, $bc
  adc $00
  ld b, a
  ld a, [bc]
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld c, a
  ld a, [hl]
  and $f0
  ld b, a
  inc c
  ld a, $09
  sub c
  jr nc, jr_002_7402

  ld a, b
  add $10
  ld b, a
  ld c, $00

jr_002_7402:
  ld a, $90
  sub b
  jr nc, jr_002_7409

  ld b, $00

jr_002_7409:
  ld a, b
  or c
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld b, a
  ld a, [hl]
  and $f0
  ld c, a
  ld a, b
  or a
  jr nz, jr_002_7431

  ld a, c
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_002_7429

  ld a, $90
  jr jr_002_742c

jr_002_7429:
  ld a, c
  add $f0

jr_002_742c:
  ld c, a
  ld b, $09
  jr jr_002_7432

jr_002_7431:
  dec b

jr_002_7432:
  ld a, c
  or b
  ld e, a
  ret


  add sp, -$35
  ld hl, sp+$15
  ld a, l
  ld d, h
  ld hl, sp+$31
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $02
  ld hl, sp+$32
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $05
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $08
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $0c
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $0f
  ld [bc], a
  ld hl, sp+$32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, $12
  ld [bc], a
  ld hl, sp+$1b
  ld a, l
  ld d, h
  ld hl, sp+$2f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $06
  ld hl, sp+$30
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $05
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $04
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $02
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $01
  ld [bc], a
  ld hl, sp+$30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp+$22
  ld [hl], $00
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $04
  ld hl, sp+$21
  ld [hl], $00
  ld hl, sp+$04
  ld a, l
  ld d, h
  ld hl, sp+$33
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
  call $ba79
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
  call $ba79
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
  ld hl, $0c14
  push hl
  ld hl, $0300
  push hl
  ld hl, $0020
  push hl
  ld l, b
  ld h, c
  call $ba79
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
  ld hl, $0200
  push hl
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $b9d5
  push de
  ld l, b
  ld h, c
  call $ba79
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
  ld de, $b9df
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld hl, sp+$33
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$29
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$21
  ld a, [hl]
  or a
  jr nz, jr_002_75d0

  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0078
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$2a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02

jr_002_75d0:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$2b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $99
  sub b
  jr nc, jr_002_75f1

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_75f1:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$27
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_002_760f

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $12

jr_002_760f:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$2d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_002_762d

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $31

jr_002_762d:
  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $13
  jr nz, jr_002_763e

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

jr_002_763e:
  ld hl, sp+$2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $32
  jr nz, jr_002_764f

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

jr_002_764f:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $24
  jr nz, jr_002_766e

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_766e:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$23
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $60
  jr nz, jr_002_768d

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_768d:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $60
  jr nz, jr_002_769e

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_769e:
  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $12
  sub b
  jr nc, jr_002_76b1

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $12

jr_002_76b1:
  ld hl, sp+$2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $31
  sub b
  jr nc, jr_002_76c4

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $31

jr_002_76c4:
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $23
  sub b
  jr nc, jr_002_76d7

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $23

jr_002_76d7:
  ld hl, sp+$24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $59
  sub b
  jr nc, jr_002_76ea

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $59

jr_002_76ea:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $59
  sub b
  jr nc, jr_002_76fd

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $59

jr_002_76fd:
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
  ld hl, $0900
  push hl
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ld de, $b9f4
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
  inc sp
  ld de, $b9f7
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
  inc sp
  ld de, $b9f7
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
  inc sp
  ld de, $b9f9
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
  inc sp
  ld de, $b9fc
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
  inc sp
  ld de, $b9fc
  push de
  call $ba07
  add sp, $02
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call $ba28
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
  ld hl, sp+$23
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$32
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
  ld hl, sp+$25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $08
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$25
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld de, $b9fe
  push de
  call $ba07
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
  ld hl, sp+$23
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$22
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$2d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $08
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$25
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld de, $ba01
  push de
  call $ba07
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
  ld hl, sp+$23
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $0a
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$25
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld de, $b9fe
  push de
  call $ba07
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
  ld hl, sp+$23
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $0a
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$25
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call $ba79
  add sp, $02
  ld de, $ba04
  push de
  call $ba07
  add sp, $02
  push hl
  ld hl, sp+$24
  ld a, [hl]
  ld hl, sp+$02
  ld [hl], a
  pop hl
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
  call $ba79
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$21
  ld a, [hl]
  or a
  jr z, jr_002_78df

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
  call $ba79
  ld a, e
  ld hl, sp+$01
  ld [hl], a
  jr jr_002_7904

jr_002_78df:
  push hl
  ld hl, sp+$03
  ld a, [hl]
  ld hl, sp+$16
  ld [hl], a
  pop hl
  ld hl, $0020
  add hl, bc
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
  call $ba79
  ld a, e
  ld hl, sp+$01
  ld [hl], a
  ld hl, sp+$14
  ld a, [hl]
  or a
  jp nz, $b5a8

jr_002_7904:
  ld hl, sp+$01
  ld a, [hl]
  and $03
  jp z, $b938

  ld hl, sp+$21
  ld a, [hl]
  or a
  jp z, $b9d2

  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $007a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  jp $b9d2


  ld hl, sp+$30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$22
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$23
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$01
  ld a, [hl]
  sub $40
  jr nz, jr_002_7974

  ld hl, sp+$24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp+$03
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
  push bc
  push af
  inc sp
  call $b3ec
  inc sp
  ld a, e
  pop bc
  ld [bc], a
  ld hl, sp+$21
  ld [hl], $01

jr_002_7974:
  ld hl, sp+$01
  ld a, [hl]
  sub $80
  jr nz, jr_002_799e

  ld hl, sp+$24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp+$03
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
  push bc
  push af
  inc sp
  call $b40d
  inc sp
  ld a, e
  pop bc
  ld [bc], a
  ld hl, sp+$21
  ld [hl], $01

jr_002_799e:
  ld hl, sp+$01
  ld a, [hl]
  sub $20
  jr nz, jr_002_79bc

  ld hl, sp+$22
  ld a, [hl]
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_002_79b5

  ld b, $05
  jr jr_002_79b9

jr_002_79b5:
  ld hl, sp+$22
  ld b, [hl]
  dec b

jr_002_79b9:
  ld hl, sp+$22
  ld [hl], b

jr_002_79bc:
  ld hl, sp+$01
  ld a, [hl]
  sub $10
  jp nz, $b5a8

  ld hl, sp+$22
  inc [hl]
  ld a, [hl]
  sub $06
  jp c, $b5a8

  ld [hl], $00
  jp $b5a8


  add sp, $35
  ret


  ld d, d
  ld d, h
  ld b, e
  jr nz, jr_002_7a2d

  ld h, l
  ld [hl], h
  ld [hl], l
  ld [hl], b
  nop
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  nop
  ld [hl-], a
  jr nc, jr_002_79f7

jr_002_79f7:
  cpl
  nop
  dec l
  dec l
  nop
  ld a, [hl-]
  nop
  jr nz, jr_002_7a20

  nop
  cpl
  ld e, h
  nop
  ld e, h
  cpl
  nop

Bank2Function7A07::
  ld hl, $bc01
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
  pop de
  pop hl
  push hl
  push de
  push hl

jr_002_7a20:
  ld l, b
  ld h, c
  call $ba79
  add sp, $02
  ret

Bank2Function7A28::
  ld hl, $bc01
  dec hl
  ld c, [hl]

jr_002_7a2d:
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
  ld hl, sp+$02
  ld a, [hl]
  push af
  inc sp
  ld l, b
  ld h, c
  call $ba79
  inc sp
  ret

Bank2Function7A48::
  ld a, $63
  ld hl, sp+$02
  sub [hl]
  jr nc, .skip
  ld [hl], $63
.skip:
  ld a, $0a
  push af
  inc sp
  ld hl, sp+$03
  ld a, [hl]
  push af
  inc sp
  call $baf7
  add sp, $02
  ld a, e
  swap a
  and $f0
  ld d, a
  push de
  ld a, $0a
  push af
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  call $bb05
  add sp, $02
  ld a, e
  pop de
  or d
  ld e, a
  ret

Bank2Function7A79::
  jp hl

Bank2Function7A7A::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call $bb3b
  ld e, c
  ld d, b
  ret

Bank2Function7A89::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp $bb3b

Bank2Function7A95::
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
  call $bb3f
  ld e, c
  ld d, b
  ret

Bank2Function7AA7::
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
  call $bb3f
  ret

Bank2Function7AB7::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb37
  ld e, c
  ld d, b
  ret

Bank2Function7AC5::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb37
  ret

Bank2Function7AD1::
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
  call $bb3f
  ld e, c
  ld d, b
  ret

Bank2Function7AE5::
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
  call $bb3f
  ret

Bank2Function7AF7::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb75
  ld e, c
  ld d, b
  ret

Bank2Function7B05::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb75
  ret

Bank2Function7B11::
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
  call $bb78
  ld e, c
  ld d, b
  ret


Bank2Function7B25::
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
  call $bb78
  ret

Bank2Function7B37::
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
  jr z, jr_002_7b4d

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a

jr_002_7b4d:
  bit 7, b
  jr z, jr_002_7b57

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_7b57:
  call $bb78
  jr c, jr_002_7b72

  pop af
  and $80
  jr z, jr_002_7b67

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_7b67:
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


jr_002_7b72:
  pop af
  pop af
  ret


  ld b, $00
  ld d, b
  ld a, e
  or d
  jr nz, jr_002_7b83

  ld bc, $0000
  ld d, b
  ld e, c
  scf
  ret


jr_002_7b83:
  ld l, c
  ld h, b
  ld bc, $0000
  or a
  ld a, $10

jr_002_7b8b:
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
  jr c, jr_002_7ba6

  pop bc
  pop af
  dec a
  or a
  jr nz, jr_002_7b8b

  jr jr_002_7baf

jr_002_7ba6:
  inc sp
  inc sp
  pop af
  dec a
  scf
  jr nz, jr_002_7b8b

  jr jr_002_7baf

jr_002_7baf:
  ld d, b
  ld e, c
  rl l
  ld c, l
  rl h
  ld b, h
  or a
  ret
