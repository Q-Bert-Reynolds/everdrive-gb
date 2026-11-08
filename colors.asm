SECTION "Colors", ROM0[$1ed3]

SetGBCPalette::
  ld hl, sp+$02
  ld a, [hl]
  and $03
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, UIColors
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $09
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld d, [hl]
  ld e, $00
  ld a, d
  ld de, rBCPD
  ld [de], a
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld d, $00
  ld hl, rBCPD
  ld [hl], c
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_1edd

  inc hl
  inc [hl]

jr_000_1edd:
  ld hl, sp+$02
  ld a, [hl]
  sub $20
  inc hl
  ld a, [hl]
  sbc $00
  jp c, SetGBCPalette

Jump_000_1ee9:
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $7d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_1ef6:
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $0e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  xor a
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_1f19

  inc hl
  inc [hl]

jr_000_1f19:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $ff
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_1f35

  inc hl
  inc [hl]

jr_000_1f35:
  ld hl, sp+$02
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $03
  jp c, Jump_000_1ef6

  call ClearShadowScreen
  call Bank1Function6AF2
  call DrawToScreen0
  ld hl, rLCDC
  ld [hl], $91
  ld hl, $c2b3
  ld a, [hl]
  dec a
  jr nz, jr_000_1f74

  ld hl, sp+$04
  ld e, l
  ld d, h
  ld a, $03
  ld [de], a
  ld hl, sp+$04
  ld e, l
  ld d, h
  push de
  ld a, $06
  push af
  inc sp
  call OS_CallFarSRAM
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_1f74

  ld hl, $c2b3
  ld [hl], $02

jr_000_1f74:
  add sp, $0f
  ret

;Colors are 15 bit.
;Values range from 0 to 31.
UIColors::
IF CUSTOM_COLORS
  BackgroundColor:     RGB 5,  5,  6
  UnselectedTextColor: RGB 31, 26, 11
  MenuColor:           RGB 9,  18, 23
  SelectedTextColor:   RGB 31, 31, 29
ELSE
  BackgroundColor:     RGB 0,  0,  0
  UnselectedTextColor: RGB 4,  31, 4
  MenuColor:           RGB 15, 15, 15
  SelectedTextColor:   DW $ffff ;original sets the unused bit 15)
ENDC

  nop
  nop
  nop
  nop


PutC2B2inE:
  ld hl, $c2b3
  ld e, [hl]
  ret
