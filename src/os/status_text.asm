; Resident status-text buffer. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "Resident status-text buffer", ROMX[$6b05], BANK[1]

ResetStatusText::
  ld hl, $d7d1
  ld [hl], $00
  ld hl, $d7d2
  ld [hl], $00
  ld hl, $d7d3
  ld [hl], $00
  ld hl, $d7d4
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, wMenuRowOverride
  ld [hl], $ff
  ret
AppendStatusText::


  add sp, -$03
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, c
  sub $10
  ld a, b
  sbc $00
  jr nc, jr_001_6b28

  ld hl, $d7d4
  ld [hl], c
  inc hl
  ld [hl], b
  jp Jump_001_6bdb


jr_001_6b28:
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  ld hl, sp+$00
  ld [hl], e
  ld a, [hl+]
  ld [hl+], a
  ld [hl], $00
  ld a, $ab
  ld hl, $d7d2
  add [hl]
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  push de
  call CopyMemory
  add sp, $06
  ld hl, $d7d2
  ld a, [hl]
  ld hl, sp+$00
  add [hl]
  ld hl, $d7d2
  ld [hl], a
  add $ab
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  xor a
  ld [bc], a
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, $d6ab
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  sub $0a
  jp nz, Jump_001_6bdb

  ld hl, $d7d1
  ld c, [hl]
  inc [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $d7ab
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  ld a, $ab
  ld hl, $d7d3
  add [hl]
  ld b, a
  ld a, $d6
  adc $00
  ld c, a
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $d7d1
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $d7ab
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $d7d4
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld a, d
  ld [bc], a
  inc bc
  ld a, e
  ld [bc], a
  push hl
  ld hl, $d7d2
  ld a, [hl]
  ld hl, $d7d3
  ld [hl], a
  pop hl
  ld hl, $d7d2
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, $d6ab
  add hl, bc
  ld c, l
  ld b, h
  xor a
  ld [bc], a

Jump_001_6bdb:
  add sp, $03
  ret
AppendStatusDecimal32::


  ld a, $ab
  ld hl, $d7d2
  add [hl]
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  push bc
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
  call AppendDecimal32
  add sp, $06
  ld a, $ab
  ld hl, $d7d2
  add [hl]
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  push bc
  call StringLength
  add sp, $02
  ld hl, $d7d2
  ld a, [hl]
  add e
  ld [hl], a
  ret


AppendStatusHexByte:
  ld a, $ab
  ld hl, $d7d2
  add [hl]
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  push bc
  ld hl, sp+$04
  ld a, [hl]
  push af
  inc sp
  call AppendHexByte
  add sp, $03
  ld hl, $d7d2
  inc [hl]
  inc [hl]
  ret
AppendStatusHexWord::


  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call AppendStatusHexByte
  inc sp
  ld hl, sp+$02
  ld d, [hl]
  push de
  inc sp
  call AppendStatusHexByte
  inc sp
  ret
