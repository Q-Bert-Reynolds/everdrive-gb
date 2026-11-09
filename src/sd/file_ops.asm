; Resident filesystem path, allocation, write and directory helpers. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "ROM Bank 1 Code", ROMX[$407e], BANK[1]
OpenFileByPath:
  add sp, -$04
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  xor a
  push af
  inc sp
  push de
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ResolvePathEntry
  add sp, $07
  ld a, e
  pop bc
  sub $f0
  jp nz, Jump_001_40f2

  ld hl, sp+$0b
  ld a, [hl-]
  or [hl]
  jr nz, jr_001_4097

  ld e, $f0
  jp Jump_001_4103


jr_001_4097:
  ld hl, sp+$00
  ld a, [hl]
  inc a
  jr nz, jr_001_40b2

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_40b2

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_40b2

  inc hl
  ld a, [hl]
  sub $0f
  jr nz, jr_001_40b2

  ld e, $fa
  jp Jump_001_4103


jr_001_40b2:
  push bc
  xor a
  push af
  inc sp
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_52d6
  add sp, $09
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_4103

  xor a
  push af
  inc sp
  push bc
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ResolvePathEntry
  add sp, $07
  ld a, e
  or a
  jr nz, Jump_001_4103

Jump_001_40f2:
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call OpenFileForSectorIO
  add sp, $04

Jump_001_4103:
  add sp, $04
  ret

ResolvePathEntry::
  add sp, -$1b
  ld hl, sp + $05
  ld [hl], $00
  xor a
  ld hl, sp + $01
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$21
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $14
  ld [hl+], a
  ld [hl], e
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $0f
  ld hl, sp+$1f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $18
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $16
  ld [hl+], a
  ld [hl], d
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $12
  ld [hl+], a
  ld [hl], d

Jump_001_4154:
  ld hl, sp+$1e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  sub $2f
  jr nz, jr_001_4164

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

jr_001_4164:
  ld hl, sp+$07
  ld [hl], $00

jr_001_4168:
  ld hl, sp+$1e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$07
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld d, a
  sub $2f
  jr z, jr_001_4185

  ld a, d
  or a
  jr z, jr_001_4185

  ld hl, sp+$07
  inc [hl]
  jr jr_001_4168

jr_001_4185:
  push hl
  ld hl, sp+$09
  ld a, [hl]
  ld hl, sp + $1c
  ld [hl], a
  pop hl
  ld a, d
  or a
  jr nz, jr_001_4195
  ld hl, sp + $05
  ld [hl], $01

jr_001_4195:
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadDirectoryIndex
  add sp, $04
  ld hl, sp + $08
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_41b1

  ld e, [hl]
  jp Jump_001_4320


jr_001_41b1:
  ld hl, sp + $10
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $0a
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_001_41bf:
  ld hl, sp + $0a
  ld d, h
  ld e, l
  ld hl, $c2f0
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, Jump_001_42d8
  ld hl, sp + $0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld hl, $c6f3
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0c
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
  ld hl, sp+$1f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadDirectoryEntry
  add sp, $06
  ld hl, sp + $08
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_4214

  ld e, [hl]
  jp Jump_001_4320


jr_001_4214:
  ld hl, sp + $17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_001_4225

  ld hl, sp + $05
  ld a, [hl]
  or a
  jp z, Jump_001_42c6

jr_001_4225:
  ld hl, sp + $06
  ld [hl], $01
  push hl
  ld hl, sp + $1c
  ld a, [hl]
  ld hl, sp + $0b
  ld [hl], a
  pop hl

jr_001_4231:
  ld hl, sp + $19
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $09
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld d, a
  or a
  jr z, jr_001_4254

  ld a, d
  sub $20
  jr z, jr_001_424f

  ld hl, sp + $06
  ld [hl], $00
  jr jr_001_4254

jr_001_424f:
  ld hl, sp + $09
  inc [hl]
  jr jr_001_4231

jr_001_4254:
  ld hl, sp + $06
  ld a, [hl]
  or a
  jp z, Jump_001_42c6
  ld hl, sp + $1a
  ld a, [hl]
  push af
  inc sp
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$20
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call CompareBytesEqual
  add sp, $05
  ld a, e
  or a
  jp z, Jump_001_42c6
  ld hl, sp + $05
  ld a, [hl]
  or a
  jr z, jr_001_429f
  ld hl, sp + $17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  or a
  jr z, jr_001_428e

  ld hl, sp+$23
  ld a, [hl]
  or a
  jp z, Jump_001_42c6

jr_001_428e:
  ld a, b
  or a
  jr nz, jr_001_4299

  ld hl, sp+$23
  ld a, [hl]
  or a
  jp nz, Jump_001_42c6

jr_001_4299:
  ld hl, sp+$00
  ld [hl], $01
  jr jr_001_42b2

jr_001_429f:
  ld hl, sp + $13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $01
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

jr_001_42b2:
  ld hl, sp+$1e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $1a
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$1d
  ld [hl+], a
  ld [hl], d
  jr jr_001_42d8

Jump_001_42c6:
  ld hl, sp + $0a
  inc [hl]
  jr nz, jr_001_42cd

  inc hl
  inc [hl]

jr_001_42cd:
  ld hl, sp + $0a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], e
  jp Jump_001_41bf


Jump_001_42d8:
jr_001_42d8:
  ld hl, sp + $08
  ld a, [hl]
  or a
  jr nz, jr_001_42f8
  ld hl, sp + $05
  ld a, [hl]
  or a
  jr nz, jr_001_42f8

  ld hl, $c2f0
  ld a, [hl]
  ld hl, sp + $10
  sub [hl]
  jp nz, Jump_001_4154

  ld hl, $c2f1
  ld a, [hl]
  ld hl, sp + $11
  sub [hl]
  jp nz, Jump_001_4154

jr_001_42f8:
  ld hl, sp + $05
  ld a, [hl]
  or a
  jr z, jr_001_4314
  ld hl, sp + $15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $01
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

jr_001_4314:
  ld hl, sp+$00
  ld a, [hl]
  or a
  jr nz, jr_001_431e

  ld e, $f0
  jr jr_001_4320

jr_001_431e:
  ld e, $00

Jump_001_4320:
jr_001_4320:
  add sp, $1b
  ret

ReadLittleEndianDWord::
  add sp, -$06
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$08
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $04
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $00
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
  ld hl, sp + $00
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
  add sp, $06
  ret


Call_001_4354:
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$02
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
  ret


Call_001_436b:
  add sp, -$18
  push af
  ld hl, $c2e8
  ld a, [hl]
  ld hl, sp + $02
  ld [hl], a
  ld hl, $c2e9
  ld a, [hl]
  ld hl, sp + $03
  ld [hl], a
  ld hl, $c2ea
  ld a, [hl]
  ld hl, sp + $04
  ld [hl], a
  ld hl, $c2eb
  ld a, [hl]
  ld hl, sp + $05
  ld [hl], a
  pop af
  ld a, $07

jr_001_438d:
  ld hl, sp + $03
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, jr_001_438d

Jump_001_439d:
  ld hl, sp + $02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedFATSector
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_4538

  ld de, $c6ef
  ld a, [de]
  ld hl, sp + $0c
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
  pop de
  push de
  ld a, e
  add $01
  ld e, a
  ld a, d
  adc $00
  push af
  ld hl, sp + $17
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $00
  ld e, a
  ld a, d
  adc $00
  ld hl, sp + $17
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $0f
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jp z, Jump_001_4420
  ld hl, sp + $14
  ld d, h
  ld e, l
  ld hl, sp + $00
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
  ld hl, sp + $00
  ld d, h
  ld e, l
  ld hl, $c2d3
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp c, Jump_001_439d

  ld e, $f4
  jp Jump_001_4538


Jump_001_4420:
  push af
  ld hl, sp + $02
  ld a, [hl]
  ld hl, sp+$0a
  ld [hl], a
  ld hl, sp + $03
  ld a, [hl]
  ld hl, sp + $0b
  ld [hl], a
  ld hl, sp + $04
  ld a, [hl]
  ld hl, sp + $0c
  ld [hl], a
  ld hl, sp + $05
  ld a, [hl]
  ld hl, sp+$0d
  ld [hl], a
  pop af
  ld a, $07

jr_001_443c:
  ld hl, sp + $08
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_443c

  ld hl, sp + $08
  ld a, [hl]
  sub $02
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  jr nc, jr_001_4468

  ld hl, sp + $08
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

jr_001_4468:
  ld hl, sp + $08
  ld d, h
  ld e, l
  ld hl, sp + $0c
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
  ld bc, $0000

Jump_001_447c:
  ld hl, sp + $04
  ld e, l
  ld d, h
  push bc
  push de
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadNextFATCluster
  add sp, $06
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_4538
  ld hl, sp + $0c
  inc [hl]
  jr nz, jr_001_44a8

  inc hl
  inc [hl]
  jr nz, jr_001_44a8

  inc hl
  inc [hl]
  jr nz, jr_001_44a8

  inc hl
  inc [hl]

jr_001_44a8:
  ld hl, sp + $07
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jp nz, Jump_001_451f

  inc bc
  ld hl, sp+$1c
  ld a, [hl]
  sub c
  jp nz, Jump_001_447c

  inc hl
  ld a, [hl]
  sub b
  jp nz, Jump_001_447c

  ld hl, sp+$1b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld a, [hl]
  ld hl, sp + $10
  ld [hl], a
  ld hl, sp+$1d
  ld a, [hl]
  ld hl, sp + $11
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp + $10
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $14
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
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
  ld hl, sp + $10
  ld d, h
  ld e, l
  ld hl, $c2e8
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
  ld e, $00
  jr jr_001_4538

Jump_001_451f:
  ld a, b
  or c
  jp z, Jump_001_447c
  ld hl, sp + $14
  ld d, h
  ld e, l
  ld hl, sp + $00
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
  jp Jump_001_439d


Jump_001_4538:
jr_001_4538:
  add sp, $18
  ret


Call_001_453b:
  add sp, -$08
  ld hl, $c2d0
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, $c2c3
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, $c2d2
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $c2c5
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld de, $c4f3
  ld hl, $0001
  push hl
  push de
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
  call Call_000_2a9c
  add sp, $08
  ld a, e
  or a
  jp nz, Jump_001_45c1

  ld bc, $c4f3
  pop de
  push de
  ld a, e
  ld hl, $c2d3
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $c2d5
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  ld hl, $0001
  push hl
  push bc
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a9c
  add sp, $08

Jump_001_45c1:
  add sp, $08
  ret


Call_001_45c4:
  ld de, $c2f3
  ld hl, $0001
  push hl
  push de
  ld hl, $c2cd
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c2cb
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a9c
  add sp, $08
  ret


Call_001_45e0:
  add sp, -$0a

Jump_001_45e2:
  push af
  ld hl, sp+$0e
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  pop af
  ld a, $07

jr_001_45ef:
  srl b
  rr c
  rr d
  rr e
  dec a
  jr nz, jr_001_45ef

  push bc
  push de
  call ReadCachedFATSector
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_46dc

  ld hl, sp+$0c
  ld d, [hl]
  res 7, d
  ld e, $00
  ld b, $00
  ld c, $00
  push af
  ld hl, sp + $08
  ld [hl], d
  inc hl
  ld [hl], e
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  pop af
  ld a, $02

jr_001_461e:
  ld hl, sp + $06
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_461e

  ld de, $c4f3
  ld hl, sp + $06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld b, l
  ld c, h
  ld hl, sp+$00
  ld [hl], b
  inc hl
  ld [hl], c
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $06
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0c
  ld d, h
  ld e, l
  ld hl, sp + $02
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
  ld hl, sp+$11
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

Jump_001_465b:
  ld hl, sp + $02
  inc [hl]
  jr nz, jr_001_466a

  inc hl
  inc [hl]
  jr nz, jr_001_466a

  inc hl
  inc [hl]
  jr nz, jr_001_466a

  inc hl
  inc [hl]

jr_001_466a:
  ld hl, sp + $02
  ld d, h
  ld e, l
  ld hl, sp+$0c
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
  dec bc
  ld hl, sp+$10
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, b
  or c
  jr nz, jr_001_469b

  pop de
  push de
  push de
  ld hl, $0fff
  push hl
  ld hl, $ffff
  push hl
  call Call_001_4354
  add sp, $06
  call Call_001_453b
  jp Jump_001_46dc


jr_001_469b:
  ld hl, sp + $07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4354
  add sp, $06
  pop bc
  ld hl, sp + $07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  inc hl
  ld a, [hl]
  and $7f
  jp nz, Jump_001_465b

  call Call_001_453b
  ld a, e
  or a
  jp z, Jump_001_45e2

Jump_001_46dc:
  add sp, $0a
  ret

ExtendFileAllocation::
  add sp, -$1b
  ld hl, sp+$1f
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld b, $00
  ld c, $00
  push af
  ld hl, sp + $0d
  ld [hl], d
  inc hl
  ld [hl], e
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  pop af
  ld a, $09

jr_001_46f7:
  ld hl, sp + $0b
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_46f7

  ld hl, sp+$1d
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$19
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e0
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $13
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
  ld hl, sp + $15
  ld d, h
  ld e, l
  ld hl, sp + $0b
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr c, jr_001_4749

  ld e, $fc
  jp Jump_001_48f9


jr_001_4749:
  ld hl, sp+$1a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d8
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $15
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
  ld hl, sp + $15
  ld a, [hl]
  and $0f
  ld d, a
  ld e, $00
  ld b, $00
  ld c, $00
  ld hl, sp + $02
  ld [hl], d
  push af
  ld hl, sp + $17
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  pop af
  ld a, $04

jr_001_4780:
  srl b
  rr c
  rr d
  rr e
  dec a
  jr nz, jr_001_4780

  push bc
  push de
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_48f9
  ld hl, sp + $02
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $c2f3
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $001c
  add hl, bc
  ld c, l
  ld b, h
  push bc
  ld hl, sp + $0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4354
  add sp, $06
  call Call_001_45c4
  ld a, e
  or a
  jp nz, Jump_001_48f9
  ld hl, sp + $14
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
  push af
  ld hl, sp + $17
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $09

jr_001_47f6:
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, jr_001_47f6

  ld hl, sp + $00
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp + $15
  ld a, [hl]
  or a
  jr nz, jr_001_4811

  inc hl
  bit 0, [hl]
  jr z, jr_001_4818

jr_001_4811:
  ld hl, sp + $00
  inc [hl]
  jr nz, jr_001_4818

  inc hl
  inc [hl]

jr_001_4818:
  ld hl, $c2e5
  ld a, [hl]
  ld hl, sp + $15
  ld [hl+], a
  ld [hl], $00
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Bank1Function6D53
  add sp, $04
  ld hl, sp + $09
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $c2e5
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, sp + $13
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp + $00
  ld a, [hl]
  ld hl, sp + $13
  and [hl]
  ld d, a
  ld hl, sp + $01
  ld a, [hl]
  ld hl, sp + $14
  and [hl]
  ld e, a
  or d
  jr z, jr_001_485a
  ld hl, sp + $09
  inc [hl]
  jr nz, jr_001_485a

  inc hl
  inc [hl]

jr_001_485a:
  ld hl, sp + $15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$21
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D53
  add sp, $04
  ld c, e
  ld b, d
  ld hl, sp+$1f
  ld a, [hl]
  ld hl, sp + $13
  and [hl]
  ld d, a
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp + $14
  and [hl]
  ld e, a
  or d
  jr z, jr_001_487f

  inc bc

jr_001_487f:
  ld hl, sp + $09
  ld a, [hl]
  sub c
  jr nz, jr_001_488e

  inc hl
  ld a, [hl]
  sub b
  jr nz, jr_001_488e

  ld e, a
  jp Jump_001_48f9


jr_001_488e:
  ld hl, sp + $0a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, c
  sub e
  ld e, a
  ld a, b
  sbc d
  ld b, a
  ld c, e
  ld hl, sp + $07
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp + $03
  ld d, l
  ld e, h
  ld hl, sp + $15
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp+$1a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $0f
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
  ld hl, sp + $15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_48fc
  add sp, $06
  ld a, e
  or a
  jr nz, jr_001_48f9

  xor a
  push af
  inc sp
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4bf4
  add sp, $07

Jump_001_48f9:
jr_001_48f9:
  add sp, $1b
  ret


Call_001_48fc:
Jump_001_48fc:
  ld hl, sp+$02
  ld a, [hl]
  inc a
  jr nz, jr_001_4912

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_4912

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_4912

  inc hl
  ld a, [hl]
  sub $0f
  jr z, jr_001_4938

jr_001_4912:
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$02
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
  ld hl, sp+$02
  ld e, l
  ld d, h
  push de
  call AdvanceFATCluster
  add sp, $02
  ld a, e
  or a
  jp z, Jump_001_48fc

  ret


jr_001_4938:
  ld e, $00
  ret


Call_001_493b:
  add sp, -$08
  ld hl, sp+$00
  ld e, l
  ld d, h
  push de
  ld hl, sp+$0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadNextFATCluster
  add sp, $06
  ld c, e
  ld a, c
  or a
  jr z, jr_001_495c

  ld e, c
  jp Jump_001_49bf


jr_001_495c:
  ld hl, sp+$00
  ld a, [hl]
  inc a
  jr nz, jr_001_4972

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_4972

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_4972

  inc hl
  ld a, [hl]
  sub $0f
  jr z, jr_001_4977

jr_001_4972:
  ld e, $fe
  jp Jump_001_49bf


jr_001_4977:
  ld hl, sp+$0a
  ld d, [hl]
  res 7, d
  ld e, $00
  ld b, $00
  ld c, $00
  push af
  ld hl, sp+$06
  ld [hl], d
  inc hl
  ld [hl], e
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  pop af
  ld a, $02

jr_001_498f:
  ld hl, sp+$04
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_498f

  ld de, $c4f3
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld c, l
  ld b, h
  push bc
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4354
  add sp, $06
  call Call_001_453b

Jump_001_49bf:
  add sp, $08
  ret


WriteFileSectors:
  add sp, -$12
  ld de, $d6a1
  ld a, [de]
  ld hl, sp + $09
  ld [hl], a
  ld a, [hl]
  or a
  jr nz, jr_001_49d4

  ld e, $f8
  jp Jump_001_4bf1


jr_001_49d4:
  ld de, $d69f
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr nc, jr_001_49ea

  ld e, $fd
  jp Jump_001_4bf1


jr_001_49ea:
  ld e, b
  ld d, c
  ld hl, sp+$16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld c, a
  ld b, e
  ld hl, $d69f
  ld [hl], b
  inc hl
  ld [hl], c
  ld a, c
  or b
  jr nz, jr_001_4a07

  ld hl, $d6a1
  ld [hl], $00

Jump_001_4a07:
jr_001_4a07:
  ld hl, sp+$17
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_4bef

  ld de, $d6a2
  ld a, [de]
  ld c, a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], e
  ld a, c
  or a
  jr nz, jr_001_4a39

  ld hl, $c2e5
  ld b, [hl]
  ld c, $00
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr c, jr_001_4a31

  ld hl, sp + $07
  ld b, [hl]
  inc hl
  ld c, [hl]

jr_001_4a31:
  ld hl, sp + $00
  ld [hl], b
  inc hl
  ld [hl], c
  jp Jump_001_4a6a


jr_001_4a39:
  ld hl, $c2e5
  ld a, [hl]
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], $00
  ld b, $00
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld b, a
  ld c, e
  inc sp
  inc sp
  push bc
  ld hl, sp+$16
  ld d, h
  ld e, l
  ld hl, sp + $00
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr nc, jr_001_4a6a

  ld hl, sp + $07
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $00
  ld [hl+], a
  ld [hl], e

Jump_001_4a6a:
jr_001_4a6a:
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], e
  ld de, $d697
  ld a, [de]
  ld hl, sp+$03
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
  ld hl, sp+$18
  ld a, [hl]
  or a
  jp nz, Jump_001_4acd
  pop hl
  push hl
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ad1
  add sp, $08
  ld hl, sp + $07
  ld [hl], e
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  pop hl
  push hl
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  jp Jump_001_4b01


Jump_001_4acd:
  pop hl
  push hl
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a9c
  add sp, $08
  ld hl, sp + $07
  ld [hl], e
  ld hl, sp + $00
  ld b, [hl]
  ld a, [hl]
  add a
  ld b, a
  ld c, $00
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], d

Jump_001_4b01:
  ld hl, sp + $07
  ld a, [hl]
  or a
  jr z, jr_001_4b0b

  ld e, [hl]
  jp Jump_001_4bf1


jr_001_4b0b:
  ld de, $d6a2
  ld a, [de]
  ld b, a
  ld hl, sp + $00
  ld d, [hl]
  ld a, b
  add d
  ld b, a
  ld hl, $d6a2
  ld [hl], b
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop hl
  push hl
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, sp+$17
  ld [hl-], a
  ld [hl], e
  ld hl, $c2e5
  ld a, [hl]
  sub b
  jp nz, Jump_001_4b97

  ld hl, $d6a2
  ld [hl], $00
  ld de, $d693
  push de
  call AdvanceFATCluster
  add sp, $02
  ld hl, sp + $02
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_4b4f

  ld e, [hl]
  jp Jump_001_4bf1


jr_001_4b4f:
  ld de, $d693
  ld a, [de]
  ld hl, sp+$03
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
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp+$05
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld de, $d697
  ld hl, sp+$03
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
  ld hl, sp + $02
  ld a, [hl]
  or a
  jp z, Jump_001_4a07

  ld e, [hl]
  jp Jump_001_4bf1


Jump_001_4b97:
  ld de, $d697
  ld a, [de]
  ld hl, sp+$03
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
  ld hl, sp + $00
  ld a, [hl]
  ld hl, sp + $0a
  ld [hl], a
  ld hl, sp+$01
  ld a, [hl]
  ld hl, sp + $0b
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp + $0a
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $08
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0e
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld de, $d697
  dec hl
  dec hl
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
  jp Jump_001_4a07


Jump_001_4bef:
  ld e, $00

Jump_001_4bf1:
  add sp, $12
  ret


Call_001_4bf4:
  add sp, -$04
  ld hl, sp+$00
  ld e, l
  ld d, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_001_436b
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_4c6b

  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_45e0
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_001_4c6b

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
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_493b
  add sp, $08
  ld a, e
  or a
  jr nz, jr_001_4c6b

  ld hl, sp+$0c
  ld a, [hl]
  or a
  jr z, jr_001_4c69

  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4c6e
  add sp, $06
  ld a, e
  or a
  jr nz, jr_001_4c6b

jr_001_4c69:
  ld e, $00

Jump_001_4c6b:
jr_001_4c6b:
  add sp, $04
  ret


Call_001_4c6e:
  add sp, -$0b
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  ld b, l
  ld c, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $c2cb
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld de, $c2f3
  ld hl, $0200
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  ld hl, sp+$12
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_001_4cb0:
  ld hl, sp + $09
  ld [hl], c
  inc hl
  ld [hl], b
  dec bc
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_4d1e

  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, sp + $05
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
  ld hl, sp+$04
  ld [hl], $00

Jump_001_4cd0:
  ld hl, sp+$04
  ld a, [hl]
  ld hl, $c2e5
  sub [hl]
  jr nc, jr_001_4cb0

  ld de, $c2f3
  push bc
  ld hl, $0001
  push hl
  push de
  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a9c
  add sp, $08
  pop bc
  ld a, e
  or a
  jr nz, jr_001_4d20

  ld hl, sp + $05
  inc [hl]
  jr nz, jr_001_4d07

  inc hl
  inc [hl]
  jr nz, jr_001_4d07

  inc hl
  inc [hl]
  jr nz, jr_001_4d07

  inc hl
  inc [hl]

jr_001_4d07:
  ld hl, sp + $05
  ld d, h
  ld e, l
  ld hl, sp+$00
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
  ld hl, sp+$04
  inc [hl]
  jp Jump_001_4cd0


Jump_001_4d1e:
  ld e, $00

jr_001_4d20:
  add sp, $0b
  ret


Call_001_4d23:
  add sp, -$0b
  call GetFATDate
  ld hl, sp + $02
  ld [hl], e
  inc hl
  ld [hl], d
  call GetFATTime
  inc sp
  inc sp
  push de
  ld hl, sp+$0f
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $c2f3
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $04
  ld [hl], $00

jr_001_4d58:
  ld hl, sp+$0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $04
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld [bc], a
  inc bc
  ld hl, sp + $04
  inc [hl]
  ld a, [hl]
  sub $0b
  jr c, jr_001_4d58

  ld hl, sp+$10
  ld a, [hl]
  ld [bc], a
  inc bc
  ld hl, sp+$09
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $08

jr_001_4d85:
  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_4d8c

  inc hl
  inc [hl]

jr_001_4d8c:
  add $ff
  or a
  jr nz, jr_001_4d85

  push af
  ld hl, sp+$13
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $10

jr_001_4d9e:
  srl d
  rr e
  rr b
  rr c
  dec a
  jr nz, jr_001_4d9e

  ld b, $00
  ld de, $0000
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_4dbb

  inc hl
  inc [hl]

jr_001_4dbb:
  push af
  ld hl, sp+$13
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $18

jr_001_4dc8:
  srl d
  rr e
  rr b
  rr c
  dec a
  jr nz, jr_001_4dc8

  ld b, $00
  ld de, $0000
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  ld hl, sp+$0a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, sp + $00
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  inc bc
  inc hl
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  inc bc
  inc hl
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  inc bc
  inc hl
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  inc bc
  ld hl, sp+$11
  ld a, [hl]
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$05
  ld a, [hl]
  ld [bc], a
  inc bc
  ld [hl], c
  inc hl
  ld [hl], b
  push af
  ld hl, sp+$13
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $08

jr_001_4e26:
  srl d
  rr e
  rr b
  rr c
  dec a
  jr nz, jr_001_4e26

  ld b, $00
  ld de, $0000
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  push bc
  ld hl, sp+$19
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$19
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4354
  add sp, $06
  call Call_001_45c4
  add sp, $0b
  ret


Call_001_4e5b:
  add sp, -$08
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$0c
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $c2f3
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $01
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0d
  ld c, [hl]
  ld b, $00
  ld l, c
  ld h, b
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, $0020
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  pop bc
  ld hl, sp + $03
  ld [hl], $00
  ld hl, sp + $06
  ld [hl], c
  inc hl
  ld [hl], b

Jump_001_4eb9:
  ld de, LFNCharacterOffsets
  ld hl, sp + $03
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, sp+$04
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
  ld c, l
  ld b, h
  ld hl, sp + $07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec hl
  inc [hl]
  jr nz, jr_001_4ee3

  inc hl
  inc [hl]

jr_001_4ee3:
  ld hl, sp+$00
  or [hl]
  ld hl, sp + $05
  ld [hl], a
  ld a, [hl]
  ld [bc], a
  dec hl
  ld c, [hl]
  ld b, $00
  inc bc
  ld hl, sp + $01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld a, [hl]
  ld [bc], a
  ld hl, sp + $05
  ld a, [hl]
  or a
  jr nz, jr_001_4f07

  ld hl, sp+$00
  ld [hl], $ff

jr_001_4f07:
  ld hl, sp + $03
  inc [hl]
  ld a, [hl]
  sub $0d
  jp c, Jump_001_4eb9
  ld hl, sp + $00
  ld a, [hl]
  or a
  jr nz, jr_001_4f20
  ld hl, sp + $07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_001_4f24

jr_001_4f20:
  ld hl, sp+$00
  ld [hl], $40

jr_001_4f24:
  ld hl, sp+$0d
  ld a, [hl]
  inc a
  ld hl, sp+$00
  or [hl]
  ld b, a
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, $0f
  ld [bc], a
  ld hl, sp + $02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000d
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$0e
  ld a, [hl]
  ld [bc], a
  add sp, $08
  ret


Call_001_4f54:
  add sp, -$10
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $0e
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $0a
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
  ld hl, sp+$16
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$13
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $0d
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jp nz, Jump_001_4fcf
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $0a
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
  ld hl, sp + $0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp + $0c
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0a
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
  jp Jump_001_50ef


Jump_001_4fcf:
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc a
  inc hl
  ld [hl-], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl]
  ld [de], a
  ld hl, sp + $0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$04
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
  ld hl, sp+$04
  inc [hl]
  jr nz, jr_001_5005

  inc hl
  inc [hl]
  jr nz, jr_001_5005

  inc hl
  inc [hl]
  jr nz, jr_001_5005

  inc hl
  inc [hl]

jr_001_5005:
  ld hl, sp + $0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
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
  ld hl, $c2e5
  ld a, [hl]
  ld hl, sp + $0a
  sub [hl]
  jp nz, Jump_001_50ef

  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$00
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
  push bc
  push bc
  call AdvanceFATCluster
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_5111

  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$04
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
  ld hl, sp+$04
  ld a, [hl]
  inc a
  jp nz, Jump_001_50b0

  inc hl
  ld a, [hl]
  inc a
  jp nz, Jump_001_50b0

  inc hl
  ld a, [hl]
  inc a
  jp nz, Jump_001_50b0

  inc hl
  ld a, [hl]
  sub $0f
  jp nz, Jump_001_50b0

  push bc
  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4bf4
  add sp, $07
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_5111

  ld e, c
  ld d, b
  ld hl, sp+$00
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
  push bc
  push bc
  call AdvanceFATCluster
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_5111

Jump_001_50b0:
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$04
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp+$06
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
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

Jump_001_50ef:
  ld hl, sp + $0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$04
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedDirectorySector
  add sp, $04

Jump_001_5111:
  add sp, $10
  ret


Call_001_5114:
  add sp, -$07
  ld hl, sp+$0c
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
  ld hl, $0008
  push hl
  push bc
  push de
  call CopyMemory
  add sp, $06
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld c, l
  ld b, h
  ld a, $20
  ld [bc], a
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld a, $20
  ld [bc], a
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld c, l
  ld b, h
  ld a, $20
  ld [bc], a
  ld b, $00
  ld c, $00

jr_001_515e:
  ld hl, sp+$0a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, c
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $01
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec hl
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_5184

  ld hl, sp + $01
  ld a, [hl]
  sub $2e
  jr nz, jr_001_5181

Bank1Address5180::
  ld b, c

jr_001_5181:
  inc c
  jr jr_001_515e

jr_001_5184:
  ld a, b
  or a
  jp z, Jump_001_51e9

  ld a, b
  inc a
  ld hl, sp + $01
  ld [hl-], a
  ld [hl], $00

Jump_001_5192:
  ld hl, sp+$0a
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
  or a
  jp z, Jump_001_51e9

  ld hl, sp+$00
  ld a, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], $00
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp + $05
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $01
  ld c, [hl]
  ld b, $00
  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  ld hl, sp + $05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $03
  jp c, Jump_001_5192

Jump_001_51e9:
  ld hl, sp+$00
  ld [hl], $00

jr_001_51ed:
  ld hl, sp+$0c
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
  ld hl, sp + $05
  ld [hl], a
  ld a, [hl]
  sub $61
  jr c, jr_001_520d

  ld a, $7a
  sub [hl]
  jr c, jr_001_520d

  ld a, [hl]
  and $df
  ld [bc], a

jr_001_520d:
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $0b
  jr c, jr_001_51ed

  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $7e
  ld [bc], a
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  push bc
  ld hl, $03e8
  push hl
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D67
  add sp, $04
  pop bc
  push bc
  ld hl, $0064
  push hl
  push de
  call Bank1Function6D53
  add sp, $04
  pop bc
  ld a, e
  add $30
  ld [bc], a
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  push bc
  ld hl, $0064
  push hl
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D67
  add sp, $04
  pop bc
  push bc
  ld hl, $000a
  push hl
  push de
  call Bank1Function6D53
  add sp, $04
  pop bc
  ld a, e
  add $30
  ld [bc], a
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  push bc
  ld hl, $000a
  push hl
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D67
  add sp, $04
  pop bc
  ld a, e
  add $30
  ld [bc], a
  ld b, $00
  ld hl, sp+$00
  ld [hl], $00

Jump_001_52a5:
  ld a, b
  and $01
  rrca
  and $80
  ld d, a
  ld a, b
  and $fe
  srl a
  or d
  ld hl, sp + $05
  ld [hl], a
  ld hl, sp+$0c
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
  ld e, a
  ld hl, sp + $05
  ld a, [hl]
  add e
  ld b, a
  ld hl, sp + $00
  inc [hl]
  ld a, [hl]
  sub $0b
  jp c, Jump_001_52a5

  ld e, b
  add sp, $07
  ret


Call_001_52d6:
  add sp, -$2f
  ld hl, sp + $17
  ld [hl], $00
  ld hl, sp+$31
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], e
  pop de
  pop bc
  push bc
  push de

jr_001_52e6:
  ld a, [bc]
  or a
  jr z, jr_001_52f4

  sub $2f
  jr nz, jr_001_52f1
  ld hl, sp + $02
  ld [hl], c
  inc hl
  ld [hl], b

jr_001_52f1:
  inc bc
  jr jr_001_52e6

jr_001_52f4:
  ld hl, sp + $03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $2f
  jr nz, jr_001_5302
  dec hl
  inc [hl]
  jr nz, jr_001_5302

Bank1Address5300::
  inc hl
  inc [hl]

jr_001_5302:
  ld hl, sp+$33
  ld a, [hl]
  sub $02
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  jr nc, @ + 11

  ld hl, sp+$33
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

  pop bc
jr_001_531e:
  pop hl
  push hl
  push bc
  push hl
  call StringLength
  add sp, $02
  ld hl, sp + $0f
  ld [hl], e
  ld hl, sp + $01
  ld [hl], $00
  ld hl, sp + $0f
  ld a, [hl]
  sub $0b
  jr z, @ + 9
  ld hl, sp + $01
  ld [hl], $01
  jp jr_001_5368
  ld hl, sp + $14
  ld [hl], $00

jr_001_533a:
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $14
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  sub $61
  jr c, jr_001_5357

  ld a, $7a
  sub b
  jr c, jr_001_5357

  ld hl, sp + $01
  ld [hl], $01

jr_001_5357:
  ld a, b
  sub $2e
  jr nz, jr_001_5360

  ld hl, sp + $01
  ld [hl], $01

jr_001_5360:
  ld hl, sp + $14
  inc [hl]
  ld a, [hl]
  sub $0b
  jr c, jr_001_533a

jr_001_5368:
  xor a
  ld hl, sp + $10
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $c2e5
  ld c, [hl]
  ld b, $00
  push bc
  push bc
  ld hl, sp+$3b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D53
  add sp, $04
  pop bc
  ld hl, sp + $18
  ld [hl], e
  inc hl
  ld [hl], d
  push bc
  ld hl, sp+$39
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D67
  add sp, $04
  ld a, d
  or e
  jr z, jr_001_539f

  ld hl, sp + $18
  inc [hl]
  jr nz, jr_001_539f

  inc hl
  inc [hl]

jr_001_539f:
  ld hl, sp + $10
  ld e, l
  ld d, h
  ld hl, sp + $18
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_001_436b
  add sp, $04
  ld a, e
  or a
  jr z, jr_001_53b7

  ld e, a
  jp Jump_001_55c8


jr_001_53b7:
  ld hl, sp + $18
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_45e0
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_001_55c8

  ld hl, sp+$39
  ld a, [hl]
  or a
  jr z, jr_001_53f3

  ld hl, $0001
  push hl
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4c6e
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_001_55c8

jr_001_53f3:
  ld hl, sp + $16
  ld [hl], $00
  ld hl, sp + $01
  ld a, [hl]
  or a
  jr nz, jr_001_5411
  ld hl, sp + $04
  ld c, l
  ld b, h
  ld hl, sp + $03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  push hl
  push bc
  push de
  call CopyMemory
  add sp, $06
  jp Jump_001_5450


jr_001_5411:
  ld a, $0d
  push af
  inc sp
  ld hl, sp + $10
  ld a, [hl]
  push af
  inc sp
  call Call_001_6d39
  add sp, $02
  ld hl, sp + $16
  ld [hl], e
  ld a, $0d
  push af
  inc sp
  ld hl, sp + $10
  ld a, [hl]
  push af
  inc sp
  call Call_001_6d47
  add sp, $02
  ld a, e
  or a
  jr z, @ + 5

  ld hl, sp + $16
  inc [hl]
  ld hl, sp+$04
  ld e, l
  ld d, h
  ld hl, $c2f0
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  ld hl, sp + $06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5114
  add sp, $06
  ld hl, sp + $17
  ld [hl], e

Jump_001_5450:
  ld hl, sp+$39
  ld a, [hl]
  or a
  jr z, jr_001_545a

  ld a, $10
  jr jr_001_545c

jr_001_545a:
  ld a, $20

jr_001_545c:
  ld hl, sp + $00
  ld [hl], a
  xor a
  ld hl, sp + $1a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

Jump_001_5466:
  ld hl, sp + $15
  ld a, l
  ld d, h
  ld hl, sp + $25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $1a
  ld a, l
  ld d, h
  ld hl, sp + $1e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$33
  ld a, l
  ld d, h
  ld hl, sp+$2d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, sp + $25
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_001_4f54
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_001_55c8

  ld a, [$c4d3]
  or a
  jp nz, Jump_001_5466

  ld bc, $0000

jr_001_54a9:
  ld hl, $c2f3
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr z, jr_001_54c6

  ld hl, $0020
  add hl, bc
  ld c, l
  ld b, h
  ld a, b
  sub $02
  jr c, jr_001_54a9

jr_001_54c6:
  ld a, c
  or a
  jr nz, jr_001_54d0

  ld a, b
  sub $02
  jp z, Jump_001_5466

jr_001_54d0:
  srl b
  rr c
  srl b
  rr c
  srl b
  rr c
  srl b
  rr c
  srl b
  rr c
  ld hl, sp + $25
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $14
  ld [hl], $00

Jump_001_54f0:
  ld hl, sp + $25
  ld [hl], c
  ld hl, sp + $14
  ld a, [hl+]
  inc hl
  sub [hl]
  jp nc, Jump_001_556a

  ld a, [hl-]
  dec hl
  sub [hl]
  add $ff
  ld hl, sp + $20
  ld [hl], a
  push bc
  ld hl, sp + $19
  ld a, [hl]
  push af
  inc sp
  ld hl, sp + $23
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$29
  ld a, [hl]
  push af
  inc sp
  ld hl, sp + $07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_4e5b
  add sp, $05
  pop bc
  inc bc
  ld a, c
  sub $10
  jp nz, Jump_001_5564

  or b
  jp nz, Jump_001_5564

  ld bc, $0000
  push bc
  call Call_001_45c4
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_55c8
  ld hl, sp + $23
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $21
  ld [hl+], a
  ld [hl], e

  ld hl, sp+$1e
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$2b
  ld [hl+], a
  ld [hl], e
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, sp + $23
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $2f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_001_4f54
  add sp, $06
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_55c8

Jump_001_5564:
  ld hl, sp + $14
  inc [hl]
  jp Jump_001_54f0


Jump_001_556a:
  ld hl, sp+$39
  ld a, [hl]
  or a
  jr z, jr_001_5577

  dec hl
  dec hl
  ld [hl], $00
  inc hl
  ld [hl], $00

jr_001_5577:
  ld hl, sp+$37
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld bc, $0000
  push af
  ld hl, sp + $29
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  pop af
  ld a, $09

jr_001_558c:
  ld hl, sp + $27
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_558c

  ld hl, sp + $04
  ld e, l
  ld d, h
  ld hl, sp + $29
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $29
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $08
  ld a, [hl]
  push af
  inc sp
  ld hl, sp + $2e
  ld a, [hl]
  push af
  inc sp
  push de
  call Call_001_4d23
  add sp, $0c

Jump_001_55c8:
  add sp, $2f
  ret

CreateDirectory:
  add sp, -$0a
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld a, $01
  push af
  inc sp
  push de
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ResolvePathEntry
  add sp, $07
  pop bc
  ld a, e
  or a
  jr nz, jr_001_55f4

  ld e, $f1
  jp Jump_001_570c


jr_001_55f4:
  ld a, e
  sub $f0
  jp nz, Jump_001_570c

  ld hl, sp+$00
  ld a, [hl]
  inc a
  jr nz, jr_001_5615

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_5615

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_001_5615

  inc hl
  ld a, [hl]
  sub $0f
  jr nz, jr_001_5615

  ld e, $fa
  jp Jump_001_570c


jr_001_5615:
  ld hl, $c2e5
  ld e, [hl]
  ld d, $00
  push bc
  ld a, $01
  push af
  inc sp
  push de
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_52d6
  add sp, $09
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_570c

  ld a, $01
  push af
  inc sp
  push bc
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ResolvePathEntry
  add sp, $07
  ld a, e
  sub $f0
  jr nz, jr_001_565e

  ld e, $ff
  jp Jump_001_570c


jr_001_565e:
  ld a, e
  or a
  jp nz, Jump_001_570c

  ld hl, sp+$0d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00dc
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$04
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  ld c, l
  ld b, h
  push bc
  push de
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_570c

  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$04
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
  ld de, Bank1Address570F
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $1000
  push hl
  push de
  call Call_001_4d23
  add sp, $0c
  ld de, Bank1Address570F
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
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
  ld hl, $1001
  push hl
  push de
  call Call_001_4d23
  add sp, $0c
  ld hl, $c2f3
  ld [hl], $2e
  ld hl, $c313
  ld [hl], $2e
  ld hl, $c314
  ld [hl], $2e
  call Call_001_45c4
  ld a, e
  or a
  jr nz, Jump_001_570c
  ;uh.. If nz, jump. Otherwise, fallthrough to the same place
Jump_001_570c:
  add sp, $0a
  ret

Bank1Address570F::
  jr nz, jr_001_5731

  jr nz, jr_001_5733

  jr nz, jr_001_5735

  jr nz, jr_001_5737

  jr nz, @ + 34

  jr nz, jr_001_571b

jr_001_571b:
  add sp, -$05
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00d8
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$01
  ld [hl+], a
  inc de
  ld a, [de]

jr_001_5731:
  ld [hl+], a
  inc de

jr_001_5733:
  ld a, [de]
  ld [hl+], a

jr_001_5735:
  inc de
  ld a, [de]

jr_001_5737:
  ld [hl], a
  ld hl, sp+$01
  ld a, [hl]
  and $0f
  ld d, a
  ld e, $00
  ld bc, $0000
  dec hl
  ld [hl], d
  push af
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  pop af
  ld a, $04

jr_001_5751:
  srl b
  rr c
  rr d
  rr e
  dec a
  jr nz, jr_001_5751

  push bc
  push de
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jr nz, jr_001_5798

  ld hl, sp+$00
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, $c2f3
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $000b
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  set 1, a
  ld [bc], a
  call Call_001_45c4
  ld a, e
  or a
  jr nz, jr_001_5798

  ld e, a

jr_001_5798:
  add sp, $05
  ret
RemoveDirectoryEntryID::


  add sp, -$0c
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_001_57a4:
  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, $c2f0
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, Jump_001_57fe

  pop bc
  push bc
  sla c
  rl b
  sla c
  rl b
  ld hl, $c6f3
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$08
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
  ld hl, sp+$0e
  ld a, [hl]
  ld hl, sp+$08
  sub [hl]
  jr nz, jr_001_57f3

  ld hl, sp+$0f
  ld a, [hl]
  ld hl, sp+$09
  sub [hl]
  jr nz, jr_001_57f3

  ld hl, sp+$10
  ld a, [hl]
  ld hl, sp+$0a
  sub [hl]
  jr nz, jr_001_57f3

  ld hl, sp+$11
  ld a, [hl]
  ld hl, sp+$0b
  sub [hl]
  jr z, jr_001_57fe

jr_001_57f3:
  ld hl, sp+$00
  inc [hl]
  jp nz, Jump_001_57a4

  inc hl
  inc [hl]
  jp Jump_001_57a4


Jump_001_57fe:
jr_001_57fe:
  pop bc
  push bc
  ld hl, $c2f0
  ld a, [hl]
  ld hl, sp+$00
  sub [hl]
  jr nz, jr_001_5818

  ld hl, $c2f1
  ld a, [hl]
  ld hl, sp+$01
  sub [hl]
  jp z, Jump_001_5893

  jr jr_001_5818

  jp Jump_001_5893


jr_001_5818:
  ld hl, $c2f1
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec de
  dec hl
  ld [hl], e
  inc hl
  ld [hl], d

Jump_001_5824:
  ld hl, $c2f0
  ld a, c
  sub [hl]
  inc hl
  ld a, b
  sbc [hl]
  jp nc, Jump_001_5893

  ld hl, sp+$08
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $03
  jr jr_001_583e

jr_001_5838:
  dec hl
  sla [hl]
  inc hl
  rl [hl]

jr_001_583e:
  dec a
  jr nz, jr_001_5838

  ld de, $c6f3
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], d
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld hl, $c6f3
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
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$02
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
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  jp Jump_001_5824


Jump_001_5893:
  add sp, $0c
  ret
GetDirectoryEntryCount::


  ld hl, $c2f1
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ret
GetParentDirectoryCluster::


  ld hl, $c2ed
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


GetDirectoryCluster:
  ld hl, $c2e0
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret

GetDirectoryEntryIDs::
  ld de, $c6f3
  ret
