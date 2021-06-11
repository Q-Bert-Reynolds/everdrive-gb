SECTION "ROM Bank 1 Data", ROMX[$4000], BANK[1]

  DB $18, $ea, $af, $02, $c3, $64, $40, $f8, $06, $2b, $4e, $23, $46, $0a, $b7, $28
  DB $0b, $d6, $2e, $20, $04, $f8, $00, $36, $01, $03, $18, $f1, $f8, $03, $71, $23
  DB $70, $f8, $00, $7e, $b7, $28, $0d, $0a, $d6, $2e, $28, $03, $0b, $18, $f8, $f8
  
Bank1Data4030::
  DB $03, $71, $23, $70, $f8, $02, $2b, $5e, $23, $56, $1a, $d6, $2e, $28, $0d, $23
  DB $2a, $66, $6f, $36, $2e, $f8, $03, $34, $20, $02, $23, $34, $f8, $03, $2a, $66
  DB $6f, $36, $00, $f8, $01, $2a, $66, $6f, $e5, $f8, $09, $2a, $66, $6f, $e5, $cd
  DB $4a, $2d, $e8, $04, $e8, $09, $c9

SECTION "ROM Bank 1 Code", ROMX[$4067], BANK[1]
Bank1Function4067:
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
  call Bank1Function4106
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
  call Bank1Function4106
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
  call Call_000_3a3f
  add sp, $04

Jump_001_4103:
  add sp, $04
  ret

Bank1Function4106::
  add sp, -$1b
  ld hl, sp+$0b
  ld [hl], $00
  xor a
  ld hl, sp+$03
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$21
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$15
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
  ld hl, sp+$10
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
  ld hl, sp+$19
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$17
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
  ld hl, sp+$16
  ld [hl], a
  pop hl
  ld a, d
  or a
  jr nz, jr_001_4195

  ld hl, sp+$0b
  ld [hl], $01

jr_001_4195:
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_31eb
  add sp, $04
  ld hl, sp+$01
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_41b1

  ld e, [hl]
  jp Jump_001_4320


jr_001_41b1:
  ld hl, sp+$12
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$08
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_001_41bf:
  ld hl, sp+$08
  ld d, h
  ld e, l
  ld hl, $c2ef
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, Jump_001_42d8

  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld hl, $c6f2
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
  call Call_000_3670
  add sp, $06
  ld hl, sp+$01
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_4214

  ld e, [hl]
  jp Jump_001_4320


jr_001_4214:
  ld hl, sp+$1a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_001_4225

  ld hl, sp+$0b
  ld a, [hl]
  or a
  jp z, Jump_001_42c6

jr_001_4225:
  ld hl, sp+$02
  ld [hl], $01
  push hl
  ld hl, sp+$16
  ld a, [hl]
  ld hl, sp+$0c
  ld [hl], a
  pop hl

jr_001_4231:
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0a
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

  ld hl, sp+$02
  ld [hl], $00
  jr jr_001_4254

jr_001_424f:
  ld hl, sp+$0a
  inc [hl]
  jr jr_001_4231

jr_001_4254:
  ld hl, sp+$02
  ld a, [hl]
  or a
  jp z, Jump_001_42c6

  ld hl, sp+$14
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$20
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2b5a
  add sp, $05
  ld a, e
  or a
  jp z, Jump_001_42c6

  ld hl, sp+$0b
  ld a, [hl]
  or a
  jr z, jr_001_429f

  ld hl, sp+$1a
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
  ld hl, sp+$18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
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

jr_001_42b2:
  ld hl, sp+$1e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$14
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
  ld hl, sp+$08
  inc [hl]
  jr nz, jr_001_42cd

  inc hl
  inc [hl]

jr_001_42cd:
  ld hl, sp+$08
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$12
  ld [hl+], a
  ld [hl], e
  jp Jump_001_41bf


Jump_001_42d8:
jr_001_42d8:
  ld hl, sp+$01
  ld a, [hl]
  or a
  jr nz, jr_001_42f8

  ld hl, sp+$0b
  ld a, [hl]
  or a
  jr nz, jr_001_42f8

  ld hl, $c2ef
  ld a, [hl]
  ld hl, sp+$12
  sub [hl]
  jp nz, Jump_001_4154

  ld hl, $c2f0
  ld a, [hl]
  ld hl, sp+$13
  sub [hl]
  jp nz, Jump_001_4154

jr_001_42f8:
  ld hl, sp+$0b
  ld a, [hl]
  or a
  jr z, jr_001_4314

  ld hl, sp+$16
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
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

Bank1Function4323::
  add sp, -$06
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$08
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  pop de
  push de
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
  ld hl, sp+$02
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
  ld hl, $c2e7
  ld a, [hl]
  ld hl, sp+$0a
  ld [hl], a
  ld hl, $c2e8
  ld a, [hl]
  ld hl, sp+$0b
  ld [hl], a
  ld hl, $c2e9
  ld a, [hl]
  ld hl, sp+$0c
  ld [hl], a
  ld hl, $c2ea
  ld a, [hl]
  ld hl, sp+$0d
  ld [hl], a
  pop af
  ld a, $07

jr_001_438d:
  ld hl, sp+$0b
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
  call Call_000_3106
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_4538

  ld de, $c6ee
  ld a, [de]
  ld hl, sp+$14
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
  ld a, e
  add $01
  ld e, a
  ld a, d
  adc $00
  push af
  ld hl, sp+$13
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0d
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
  ld hl, sp+$13
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$17
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jp z, Jump_001_4420

  ld hl, sp+$10
  ld d, h
  ld e, l
  ld hl, sp+$08
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
  ld hl, sp+$08
  ld d, h
  ld e, l
  ld hl, $c2d2
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
  ld hl, sp+$0a
  ld a, [hl]
  ld hl, sp+$06
  ld [hl], a
  ld hl, sp+$0b
  ld a, [hl]
  ld hl, sp+$07
  ld [hl], a
  ld hl, sp+$0c
  ld a, [hl]
  ld hl, sp+$08
  ld [hl], a
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp+$09
  ld [hl], a
  pop af
  ld a, $07

jr_001_443c:
  ld hl, sp+$04
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_443c

  ld hl, sp+$04
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

  ld hl, sp+$04
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

jr_001_4468:
  ld hl, sp+$04
  ld d, h
  ld e, l
  ld hl, sp+$14
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
  ld hl, sp+$00
  ld e, l
  ld d, h
  push bc
  push de
  ld hl, sp+$1a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_35df
  add sp, $06
  pop bc
  ld a, e
  or a
  jp nz, Jump_001_4538

  ld hl, sp+$14
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
  ld hl, sp+$03
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
  ld hl, sp+$0c
  ld [hl], a
  ld hl, sp+$1d
  ld a, [hl]
  ld hl, sp+$0d
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$0c
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$19
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$10
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
  ld hl, sp+$0c
  ld d, h
  ld e, l
  ld hl, $c2e7
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

  ld hl, sp+$10
  ld d, h
  ld e, l
  ld hl, sp+$08
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
  ld hl, $c2cf
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, $c2c2
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, $c2d1
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $c2c4
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
  ld de, $c4f2
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

  ld bc, $c4f2
  pop de
  push de
  ld a, e
  ld hl, $c2d2
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
  ld hl, $c2d4
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
  ld de, $c2f2
  ld hl, $0001
  push hl
  push de
  ld hl, $c2cc
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c2ca
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
  call Call_000_3106
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
  ld hl, sp+$04
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
  ld hl, sp+$02
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_461e

  ld de, $c4f2
  ld hl, sp+$02
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
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0c
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  ld hl, sp+$06
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
  ld hl, sp+$06
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
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
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
  call Call_001_4354
  add sp, $06
  pop bc
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$06
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

Bank1Function46DF::
  add sp, -$1b
  ld hl, sp+$1f
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld b, $00
  ld c, $00
  push af
  ld hl, sp+$0b
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
  ld hl, sp+$09
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
  ld hl, sp+$17
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0f
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
  ld hl, sp+$0f
  ld d, h
  ld e, l
  ld hl, sp+$09
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
  ld hl, sp+$0f
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
  ld hl, sp+$0f
  ld a, [hl]
  and $0f
  ld d, a
  ld e, $00
  ld b, $00
  ld c, $00
  ld hl, sp+$08
  ld [hl], d
  push af
  ld hl, sp+$11
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
  call Call_000_30bd
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_001_48f9

  ld hl, sp+$08
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
  ld hl, $c2f2
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $001c
  add hl, bc
  ld c, l
  ld b, h
  push bc
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
  call Call_001_4354
  add sp, $06
  call Call_001_45c4
  ld a, e
  or a
  jp nz, Jump_001_48f9

  ld hl, sp+$18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0f
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
  ld hl, sp+$11
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

  ld hl, sp+$04
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp+$0f
  ld a, [hl]
  or a
  jr nz, jr_001_4811

  inc hl
  bit 0, [hl]
  jr z, jr_001_4818

jr_001_4811:
  ld hl, sp+$04
  inc [hl]
  jr nz, jr_001_4818

  inc hl
  inc [hl]

jr_001_4818:
  ld hl, $c2e4
  ld a, [hl]
  ld hl, sp+$0f
  ld [hl+], a
  ld [hl], $00
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D53
  add sp, $04
  ld hl, sp+$06
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $c2e4
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, sp+$17
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$04
  ld a, [hl]
  ld hl, sp+$17
  and [hl]
  ld d, a
  ld hl, sp+$05
  ld a, [hl]
  ld hl, sp+$18
  and [hl]
  ld e, a
  or d
  jr z, jr_001_485a

  ld hl, sp+$06
  inc [hl]
  jr nz, jr_001_485a

  inc hl
  inc [hl]

jr_001_485a:
  ld hl, sp+$0f
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
  ld hl, sp+$17
  and [hl]
  ld d, a
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp+$18
  and [hl]
  ld e, a
  or d
  jr z, jr_001_487f

  inc bc

jr_001_487f:
  ld hl, sp+$06
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
  ld hl, sp+$07
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
  ld hl, sp+$0d
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$00
  ld d, l
  ld e, h
  ld hl, sp+$0f
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
  ld hl, sp+$13
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
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$17
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
  ld hl, sp+$0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$05
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
  call Call_000_3645
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
  call Call_000_35df
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

  ld de, $c4f2
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


Bank1Function49C2:
  add sp, -$12
  ld de, $d6a0
  ld a, [de]
  ld hl, sp+$0b
  ld [hl], a
  ld a, [hl]
  or a
  jr nz, jr_001_49d4

  ld e, $f8
  jp Jump_001_4bf1


jr_001_49d4:
  ld de, $d69e
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
  ld hl, $d69e
  ld [hl], b
  inc hl
  ld [hl], c
  ld a, c
  or b
  jr nz, jr_001_4a07

  ld hl, $d6a0
  ld [hl], $00

Jump_001_4a07:
jr_001_4a07:
  ld hl, sp+$17
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_4bef

  ld de, $d6a1
  ld a, [de]
  ld c, a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$10
  ld [hl+], a
  ld [hl], e
  ld a, c
  or a
  jr nz, jr_001_4a39

  ld hl, $c2e4
  ld b, [hl]
  ld c, $00
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr c, jr_001_4a31

  ld hl, sp+$10
  ld b, [hl]
  inc hl
  ld c, [hl]

jr_001_4a31:
  ld hl, sp+$01
  ld [hl], b
  inc hl
  ld [hl], c
  jp Jump_001_4a6a


jr_001_4a39:
  ld hl, $c2e4
  ld a, [hl]
  ld hl, sp+$0c
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
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$16
  ld d, h
  ld e, l
  ld hl, sp+$01
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr nc, jr_001_4a6a

  ld hl, sp+$10
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e

Jump_001_4a6a:
jr_001_4a6a:
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$0c
  ld [hl+], a
  ld [hl], e
  ld de, $d696
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

  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0e
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
  ld hl, sp+$10
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
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0e
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
  ld hl, sp+$10
  ld [hl], e
  ld hl, sp+$01
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
  ld hl, sp+$10
  ld a, [hl]
  or a
  jr z, jr_001_4b0b

  ld e, [hl]
  jp Jump_001_4bf1


jr_001_4b0b:
  ld de, $d6a1
  ld a, [de]
  ld b, a
  ld hl, sp+$01
  ld d, [hl]
  ld a, b
  add d
  ld b, a
  ld hl, $d6a1
  ld [hl], b
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, sp+$17
  ld [hl-], a
  ld [hl], e
  ld hl, $c2e4
  ld a, [hl]
  sub b
  jp nz, Jump_001_4b97

  ld hl, $d6a1
  ld [hl], $00
  ld de, $d692
  push de
  call Call_000_3645
  add sp, $02
  ld hl, sp+$00
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_001_4b4f

  ld e, [hl]
  jp Jump_001_4bf1


jr_001_4b4f:
  ld de, $d692
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
  call Call_000_34ab
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
  ld de, $d696
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
  ld hl, sp+$00
  ld a, [hl]
  or a
  jp z, Jump_001_4a07

  ld e, [hl]
  jp Jump_001_4bf1


Jump_001_4b97:
  ld de, $d696
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
  ld hl, sp+$01
  ld a, [hl]
  ld hl, sp+$07
  ld [hl], a
  ld hl, sp+$02
  ld a, [hl]
  ld hl, sp+$08
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
  ld hl, sp+$07
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0b
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld de, $d696
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
  call Call_000_34ab
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
  ld hl, $c2ca
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld de, $c2f2
  ld hl, $0200
  push hl
  xor a
  push af
  inc sp
  push de
  call ClearC144toC2AB
  add sp, $05
  ld hl, sp+$12
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_001_4cb0:
  ld hl, sp+$05
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
  ld hl, sp+$07
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
  ld hl, $c2e4
  sub [hl]
  jr nc, jr_001_4cb0

  ld de, $c2f2
  push bc
  ld hl, $0001
  push hl
  push de
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
  call Call_000_2a9c
  add sp, $08
  pop bc
  ld a, e
  or a
  jr nz, jr_001_4d20

  ld hl, sp+$07
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
  ld hl, sp+$07
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
  call Call_000_1179
  ld hl, sp+$01
  ld [hl], e
  inc hl
  ld [hl], d
  call Call_000_1184
  ld hl, sp+$03
  ld [hl], e
  inc hl
  ld [hl], d
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
  ld hl, $c2f2
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld [hl], $00

jr_001_4d58:
  ld hl, sp+$0e
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
  ld hl, sp+$00
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
  ld hl, sp+$03
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
  ld hl, sp+$01
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
  ld hl, $c2f2
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$03
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
  ld hl, sp+$04
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
  call ClearC144toC2AB
  add sp, $05
  pop bc
  ld hl, sp+$02
  ld [hl], $00
  ld hl, sp+$05
  ld [hl], c
  inc hl
  ld [hl], b

Jump_001_4eb9:
  ld de, $30b0
  ld hl, sp+$02
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, sp+$01
  ld [hl], a
  ld hl, sp+$04
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
  ld hl, sp+$06
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
  ld hl, sp+$07
  ld [hl], a
  ld a, [hl]
  ld [bc], a
  ld hl, sp+$01
  ld c, [hl]
  ld b, $00
  inc bc
  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld a, [hl]
  ld [bc], a
  ld hl, sp+$07
  ld a, [hl]
  or a
  jr nz, jr_001_4f07

  ld hl, sp+$00
  ld [hl], $ff

jr_001_4f07:
  ld hl, sp+$02
  inc [hl]
  ld a, [hl]
  sub $0d
  jp c, Jump_001_4eb9

  dec hl
  dec hl
  ld a, [hl]
  or a
  jr nz, jr_001_4f20

  ld hl, sp+$06
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
  ld hl, sp+$03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$04
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
  ld hl, sp+$04
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
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], e
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
  ld hl, sp+$0f
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jp nz, Jump_001_4fcf

  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
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
  ld [hl-], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_34ab
  add sp, $04
  push hl
  ld hl, sp+$0e
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp+$0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
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
  ld hl, sp+$0c
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0c
  ld a, [hl]
  ld [de], a
  dec hl
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
  ld hl, sp+$0b
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
  ld hl, $c2e4
  ld a, [hl]
  ld hl, sp+$0c
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
  call Call_000_3645
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
  call Call_000_3645
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
  call Call_000_34ab
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
  ld hl, sp+$0b
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
  ld hl, sp+$0b
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
  call Call_000_30bd
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
  call Call_000_09ef
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
  ld hl, sp+$05
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

  ld hl, sp+$05
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
  ld hl, sp+$05
  ld [hl], a
  ld hl, sp+$00
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
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$05
  ld c, [hl]
  ld b, $00
  dec hl
  dec hl
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
  ld hl, sp+$01
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
  ld hl, sp+$01
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
  ld hl, sp+$01
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
  ld hl, sp+$01
  ld a, [hl]
  add e
  ld b, a
  dec hl
  inc [hl]
  ld a, [hl]
  sub $0b
  jp c, Jump_001_52a5

  ld e, b
  add sp, $07
  ret


Call_001_52d6:
  add sp, -$2f
  ld hl, sp+$0d
  ld [hl], $00
  ld hl, sp+$31
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  pop bc
  push bc

jr_001_52e6:
  ld a, [bc]
  or a
  jr z, jr_001_52f4

  sub $2f
  jr nz, jr_001_52f1

  inc sp
  inc sp
  push bc

jr_001_52f1:
  inc bc
  jr jr_001_52e6

jr_001_52f4:
  pop de
  push de
  ld a, [de]
  sub $2f
  jr nz, jr_001_5302

  ld hl, sp+$00
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
  jr nc, jr_001_531e

  ld hl, sp+$33
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

jr_001_531e:
  pop hl
  push hl
  push hl
  call Call_000_2ba2
  add sp, $02
  ld hl, sp+$05
  ld [hl], e
  ld hl, sp+$1d
  ld [hl], $00
  ld hl, sp+$05
  ld a, [hl]
  sub $0b
  jr z, jr_001_533a

  ld hl, sp+$1d
  ld [hl], $01
  jr jr_001_5368

jr_001_533a:
  ld hl, sp+$03
  ld [hl], $00

jr_001_533e:
  pop de
  push de
  ld hl, sp+$03
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

  ld hl, sp+$1d
  ld [hl], $01

jr_001_5357:
  ld a, b
  sub $2e
  jr nz, jr_001_5360

  ld hl, sp+$1d
  ld [hl], $01

jr_001_5360:
  ld hl, sp+$03
  inc [hl]
  ld a, [hl]
  sub $0b
  jr c, jr_001_533e

jr_001_5368:
  xor a
  ld hl, sp+$19
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $c2e4
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
  ld hl, sp+$06
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

  ld hl, sp+$06
  inc [hl]
  jr nz, jr_001_539f

  inc hl
  inc [hl]

jr_001_539f:
  ld hl, sp+$19
  ld e, l
  ld d, h
  ld hl, sp+$06
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1d
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
  ld hl, sp+$1d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1d
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
  ld hl, sp+$04
  ld [hl], $00
  ld hl, sp+$1d
  ld a, [hl]
  or a
  jr nz, jr_001_5411

  ld hl, sp+$0e
  ld c, l
  ld b, h
  pop de
  push de
  ld hl, $000b
  push hl
  push bc
  push de
  call Call_000_09ef
  add sp, $06
  jp Jump_001_5450


jr_001_5411:
  ld a, $0d
  push af
  inc sp
  ld hl, sp+$06
  ld a, [hl]
  push af
  inc sp
  call Call_001_6d39
  add sp, $02
  ld hl, sp+$04
  ld [hl], e
  ld a, $0d
  push af
  inc sp
  inc hl
  ld a, [hl]
  push af
  inc sp
  call Call_001_6d47
  add sp, $02
  ld a, e
  or a
  jr z, jr_001_5436

  ld hl, sp+$04
  inc [hl]

jr_001_5436:
  ld hl, sp+$0e
  ld e, l
  ld d, h
  ld hl, $c2ef
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5114
  add sp, $06
  ld hl, sp+$0d
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
  ld hl, sp+$02
  ld [hl], a
  xor a
  ld hl, sp+$09
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a

Jump_001_5466:
  ld hl, sp+$08
  ld a, l
  ld d, h
  ld hl, sp+$29
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$09
  ld a, l
  ld d, h
  ld hl, sp+$20
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1e
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
  ld hl, sp+$20
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

  ld a, [$c4d2]
  or a
  jp nz, Jump_001_5466

  ld bc, $0000

jr_001_54a9:
  ld hl, $c2f2
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$1e
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
  ld hl, sp+$29
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1e
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$03
  ld [hl], $00

Jump_001_54f0:
  ld hl, sp+$29
  ld [hl], c
  ld hl, sp+$03
  ld a, [hl+]
  sub [hl]
  jp nc, Jump_001_556a

  ld a, [hl-]
  sub [hl]
  add $ff
  ld hl, sp+$26
  ld [hl], a
  push bc
  ld hl, sp+$0f
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$29
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$2d
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$05
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

  ld hl, sp+$1e
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$2b
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$20
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$27
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, sp+$2d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$2b
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
  ld hl, sp+$03
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
  ld hl, sp+$24
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
  ld hl, sp+$22
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_001_558c

  ld hl, sp+$0e
  ld e, l
  ld d, h
  ld hl, sp+$24
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$24
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$32
  ld a, [hl]
  push af
  inc sp
  push de
  call Call_001_4d23
  add sp, $0c

Jump_001_55c8:
  add sp, $2f
  ret

Bank1Function55CB:
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
  call Bank1Function4106
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
  ld hl, $c2e4
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
  call Bank1Function4106
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
  call Call_000_34ab
  add sp, $04
  ld c, l
  ld b, h
  push bc
  push de
  call Call_000_30bd
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
  ld hl, $c2f2
  ld [hl], $2e
  ld hl, $c312
  ld [hl], $2e
  ld hl, $c313
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

  jr nz, @+$22

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
  call Call_000_30bd
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
  ld hl, $c2f2
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


  add sp, -$0c
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_001_57a4:
  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, $c2ef
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
  ld hl, $c6f2
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
  ld hl, $c2ef
  ld a, [hl]
  ld hl, sp+$00
  sub [hl]
  jr nz, jr_001_5818

  ld hl, $c2f0
  ld a, [hl]
  ld hl, sp+$01
  sub [hl]
  jp z, Jump_001_5893

  jr jr_001_5818

  jp Jump_001_5893


jr_001_5818:
  ld hl, $c2f0
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
  ld hl, $c2ef
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

  ld de, $c6f2
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
  ld hl, $c6f2
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


  ld hl, $c2f0
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ret


  ld hl, $c2ec
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


Bank1Function58AA:
  ld hl, $c2df
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret

Bank1Function58B6::
  ld de, $c6f2
  ret

Bank1Function58BA::
  ld hl, sp+$03
  bit 7, [hl]
  jr z, jr_001_58c4

  ld d, $a2
  jr jr_001_58c6

jr_001_58c4:
  ld d, $a0

jr_001_58c6:
  push de
  call Call_000_0563
  pop de
  push de
  push de
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_58da

  ld e, $41
  ret


jr_001_58da:
  ld a, d
  sub $a0
  jr nz, jr_001_58f3

  ld hl, sp+$03
  ld b, [hl]
  ld e, $00
  push de
  push bc
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_58f3

  ld e, $41
  ret


jr_001_58f3:
  ld hl, sp+$02
  ld b, [hl]
  ld e, $00
  push de
  push bc
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_5907

  ld e, $41
  ret


jr_001_5907:
  push de
  call Call_000_0563
  pop de
  ld a, d
  set 0, a
  push af
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  or a
  jr z, jr_001_591c

  ld e, $41
  ret


jr_001_591c:
  call Call_000_0580
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
  call Call_000_05b5
  add sp, $04
  call Call_000_0586
  ld a, $ff
  push af
  inc sp
  call Call_000_058c
  inc sp
  call Call_000_0574
  ld e, $00
  ret

Bank1Function5941::
  add sp, -$05
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$08
  bit 7, [hl]
  jr z, jr_001_5955

  ld a, $a2
  jr jr_001_5957

jr_001_5955:
  ld a, $a0

jr_001_5957:
  ld hl, sp+$03
  ld [hl], a
  ld a, [hl]
  sub $a0
  jr nz, jr_001_5963

  ld a, $01
  jr jr_001_5964

jr_001_5963:
  xor a

jr_001_5964:
  ld hl, sp+$04
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_596f

  ld a, $40
  jr jr_001_5971

jr_001_596f:
  ld a, $08

jr_001_5971:
  ld hl, sp+$00
  ld [hl], a

Jump_001_5974:
  ld b, $ff

jr_001_5976:
  ld a, b
  or a
  jr z, jr_001_5996

  push bc
  call Call_000_0563
  pop bc
  push bc
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  pop bc
  or a
  jr z, jr_001_5996

  push bc
  call Call_000_0574
  pop bc
  dec b
  jr jr_001_5976

jr_001_5996:
  ld a, b
  or a
  jr nz, jr_001_599f

  ld e, $42
  jp Jump_001_5a32


jr_001_599f:
  ld hl, sp+$0c
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_5a2d

  ld hl, sp+$04
  ld a, [hl]
  or a
  jr z, jr_001_59c0

  ld hl, sp+$08
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  or a
  jr z, jr_001_59c0

  ld e, $41
  jp Jump_001_5a32


jr_001_59c0:
  ld hl, sp+$07
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call Call_000_058c
  inc sp
  ld a, e
  or a
  jr z, jr_001_59d4

  ld e, $41
  jp Jump_001_5a32


jr_001_59d4:
  ld hl, sp+$00
  ld c, [hl]
  ld b, $00
  ld hl, sp+$0b
  ld a, [hl]
  sub c
  inc hl
  ld a, [hl]
  sbc b
  jr nc, jr_001_59e8

  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_001_59e8:
  ld b, c
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push bc
  inc sp
  push de
  call Call_000_05d3
  add sp, $03
  pop bc
  push bc
  call Call_000_0574
  pop bc
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  ld c, b
  ld b, $00
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$07
  ld [hl+], a
  ld [hl], d
  jp Jump_001_5974


Jump_001_5a2d:
  call Call_000_0574
  ld e, $00

Jump_001_5a32:
  add sp, $05
  ret

Bank1Function5A35::
  add sp, -$12
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $00
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$10
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_001_5abf
  add sp, $02
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000f
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  rlca
  jp nc, Jump_001_5aae

  ld hl, sp+$11
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
  call ClearC144toC2AB
  add sp, $05
  ld hl, sp+$11
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
  ld hl, sp+$11
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $01
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, $01
  ld [bc], a
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_001_5afb
  add sp, $02
  ld e, $37
  jr jr_001_5ab0

Jump_001_5aae:
  ld e, $00

jr_001_5ab0:
  add sp, $12
  ret

Bank1Address5AB3::
  rra
  inc e
  rra
  ld e, $1f
  ld e, $1f
  rra
  ld e, $1f
  ld e, $1f

Call_001_5abf:
  call Call_000_0563
  ld a, $d0
  push af
  inc sp
  call Call_000_058c
  inc sp
  xor a
  push af
  inc sp
  call Call_000_058c
  inc sp
  call Call_000_0563
  ld a, $d1
  push af
  inc sp
  call Call_000_058c
  inc sp
  call Call_000_0580
  pop bc
  pop de
  push de
  push bc
  ld hl, $0010
  push hl
  push de
  call Call_000_05b5
  add sp, $04
  call Call_000_0586
  ld a, $ff
  push af
  inc sp
  call Call_000_058c
  inc sp
  jp Call_000_0574


Call_001_5afb:
  call Call_000_0563
  ld a, $d0
  push af
  inc sp
  call Call_000_058c
  inc sp
  xor a
  push af
  inc sp
  call Call_000_058c
  inc sp
  pop bc
  pop de
  push de
  push bc
  ld a, $10
  push af
  inc sp
  push de
  call Call_000_05d3
  add sp, $03
  jp Call_000_0574


Call_001_5b1e:
  add sp, -$05
  ld hl, $bd13
  ld [hl], $04
  ld l, $10
  ld [hl], $40
  ld l, $11
  ld [hl], $40
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$03
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0005
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  ld [hl], $00

Jump_001_5b46:
  ld de, $bd13
  ld hl, sp+$00
  ld a, [hl]
  ld [de], a
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  ld de, $bd10
  ld [de], a
  ld hl, sp+$02
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  ld de, $bd11
  ld [de], a
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $05
  jp c, Jump_001_5b46

  add sp, $05
  ret


Call_001_5b7f:
  add sp, -$02
  call Call_000_04b1
  ld hl, $00ff
  push hl
  call Call_000_04ba
  add sp, $02
  ld hl, sp+$04
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld de, $bff0
  ld a, [de]
  ld b, a
  pop hl
  push hl
  ld [hl], b
  pop de
  push de
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff1
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  ld de, $bff2
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff3
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  inc bc
  ld de, $bff4
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff5
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  inc bc
  inc bc
  ld de, $bff6
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0008
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff7
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff8
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff9
  ld a, [de]
  ld [bc], a
  add sp, $02
  ret


Call_001_5c09:
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $01
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_001_5b1e
  add sp, $02
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $00
  ret


Call_001_5c26:
  add sp, -$0c
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld hl, $000a
  push hl
  xor a
  push af
  inc sp
  push de
  call ClearC144toC2AB
  add sp, $05
  pop bc
  ld hl, $0004
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $40
  ld hl, $0009
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $40
  push bc
  call Call_001_5c09
  add sp, $02
  add sp, $0c
  ret


  ld hl, $bd12
  ld [hl], $00
  ld l, $12
  ld [hl], $01
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_001_5ca4
  add sp, $02
  ret


Call_001_5c7a:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0004
  add hl, bc
  inc sp
  inc sp
  push hl
  pop de
  push de
  ld a, [de]
  sub $40
  jr nz, jr_001_5c9f

  ld hl, $0009
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  sub $40
  jr nz, jr_001_5c9f

  ld e, $01
  jr jr_001_5ca1

jr_001_5c9f:
  ld e, $00

jr_001_5ca1:
  add sp, $02
  ret


Call_001_5ca4:
  add sp, -$05
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$03
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0005
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  ld [hl], $00

Jump_001_5cbf:
  ld de, $bd13
  ld hl, sp+$00
  ld a, [hl]
  ld [de], a
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld de, $bd10
  ld a, [de]
  ld [bc], a
  ld hl, sp+$02
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld de, $bd11
  ld a, [de]
  ld [bc], a
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $05
  jp c, Jump_001_5cbf

  add sp, $05
  ret


Call_001_5cf8:
  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld b, a
  ld a, [hl]
  swap a
  and $0f
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_5d11

  ld a, [hl]
  ld e, a
  add a
  add a
  add e
  add a
  ld c, a
  add b
  ld b, a

jr_001_5d11:
  ld e, b
  ret


Call_001_5d13:
  add sp, -$07
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  and $7f
  ld [bc], a
  ld hl, sp+$02
  ld [hl], $00

Jump_001_5d37:
  pop de
  push de
  ld hl, sp+$02
  ld l, [hl]
  ld h, $00
  add hl, de
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
  push bc
  push af
  inc sp
  call Call_001_5cf8
  inc sp
  ld a, e
  pop bc
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld [de], a
  ld hl, sp+$02
  inc [hl]
  ld a, [hl]
  sub $07
  jp c, Jump_001_5d37

  ld a, [bc]
  add $ff
  ld [bc], a
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  add $ff
  ld [bc], a
  add sp, $07
  ret


Call_001_5d78:
  add sp, -$0b
  ld hl, sp+$09
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5d13
  add sp, $02
  ld hl, sp+$0d
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$07
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], d
  ld c, $00

Jump_001_5da4:
  ld hl, sp+$04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, c
  sub b
  jr nc, jr_001_5dd0

  ld hl, sp+$0a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $016d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], d
  ld a, c
  and $03
  jr nz, jr_001_5dcc

  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_5dcc

  inc hl
  inc [hl]

jr_001_5dcc:
  inc c
  jp Jump_001_5da4


jr_001_5dd0:
  ld a, b
  and $03
  ld hl, sp+$03
  ld [hl], a
  ld hl, sp+$08
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$00
  ld [hl], $00

Jump_001_5dea:
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp+$00
  ld a, [hl]
  sub b
  jp nc, Jump_001_5e2b

  ld de, Bank1Address5AB3
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$03
  ld a, [hl]
  or a
  jr nz, jr_001_5e25

  ld hl, sp+$00
  ld a, [hl]
  dec a
  jr nz, jr_001_5e25

  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_5e25

  inc hl
  inc [hl]

jr_001_5e25:
  ld hl, sp+$00
  inc [hl]
  jp Jump_001_5dea


Jump_001_5e2b:
  ld hl, sp+$08
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
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], e
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld b, a
  ld hl, sp+$03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, [bc]
  ld b, a
  ld hl, sp+$03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$01
  ld a, [hl]
  ld [bc], a
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$02
  ld d, [hl]
  ld e, $00
  ld a, d
  and $01
  ld d, a
  ld e, $00
  ld a, d
  ld [bc], a
  add sp, $0b
  ret


Call_001_5ec4:
  add sp, -$0e
  ld hl, sp+$10
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$0c
  ld [hl+], a
  ld [hl], e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0001
  push hl
  ld hl, Bank1Address5180
  push hl
  call Call_001_6c47
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$04
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
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
  rrca
  jr nc, jr_001_5f23

  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld a, d
  add $80
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $51
  ld e, a
  ld a, d
  adc $01
  ld [hl-], a
  ld [hl], e

jr_001_5f23:
  ld hl, sp+$0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$08
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0c
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  call Call_001_6c47
  add sp, $08
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
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$04
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$08
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
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
  ld hl, sp+$0d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
  call Call_001_6c47
  add sp, $08
  push hl
  ld hl, sp+$0a
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  push de
  ld a, e
  ld hl, sp+$08
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0c
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add sp, $0e
  ret


Call_001_6008:
  add sp, -$08
  ld hl, sp+$0a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$04
  ld [hl+], a
  ld [hl], d
  ld hl, $0001
  push hl
  ld hl, Bank1Address5180
  push hl
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
  call Bank1Function6C4D
  add sp, $08
  ld c, l
  ld b, h
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
  push bc
  push de
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$04
  ld [hl+], a
  ld [hl], d
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
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
  call Bank1Function6C4D
  add sp, $08
  ld c, l
  ld b, h
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  push bc
  push de
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
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
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0001
  push hl
  ld hl, Bank1Address5180
  push hl
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
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$00
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  ld b, [hl]
  inc hl
  ld a, [hl]
  and $01
  ld c, a
  ld a, $ff
  cp b
  ld a, $00
  sbc c
  jr nc, jr_001_6119

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  set 0, a
  ld b, a
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b

jr_001_6119:
  ld hl, sp+$0c
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $a3
  inc hl
  ld a, [hl]
  sbc $02
  jr c, jr_001_613b

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  set 7, a
  ld b, a
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b

jr_001_613b:
  add sp, $08
  ret


Call_001_613e:
  add sp, -$1e
  ld hl, sp+$20
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$10
  ld [hl+], a
  ld [hl], e
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5ec4
  add sp, $02
  ld b, l
  ld c, h
  ld hl, sp+$1a
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_001_5ec4
  add sp, $02
  ld b, l
  ld c, h
  ld hl, sp+$12
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$22
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5ec4
  add sp, $02
  ld b, l
  ld c, h
  ld hl, sp+$04
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$04
  ld d, h
  ld e, l
  ld hl, sp+$16
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
  ld d, h
  ld e, l
  ld hl, sp+$1a
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
  jr nc, jr_001_61d8

  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld a, d
  add $00
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $a3
  ld e, a
  ld a, d
  adc $02
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e

jr_001_61d8:
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$1a
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1e
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$00
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
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
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$00
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$1f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld d, h
  ld e, l
  ld hl, sp+$08
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
  ld hl, sp+$25
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
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
  push bc
  call Call_001_6008
  add sp, $06
  pop bc
  inc bc
  inc bc
  inc bc
  inc bc
  inc bc
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
  push bc
  call Call_001_6008
  add sp, $06
  add sp, $1e
  ret


Call_001_629f:
  add sp, -$21
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call Call_001_5abf
  add sp, $02
  pop bc
  ld hl, sp+$1a
  ld e, l
  ld d, h
  ld hl, sp+$1f
  ld [hl], e
  inc hl
  ld [hl], d
  push de
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_5d78
  add sp, $04
  pop de
  ld hl, sp+$24
  ld a, [hl-]
  or [hl]
  jr z, jr_001_62db

  push de
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5c7a
  add sp, $02
  ld a, e
  pop de
  or a
  jp z, Jump_001_6309

jr_001_62db:
  ld hl, sp+$10
  ld b, l
  ld c, h
  ld hl, sp+$1f
  ld [hl], b
  inc hl
  ld [hl], c
  ld c, e
  ld b, d
  push de
  ld hl, $0005
  push hl
  ld hl, sp+$23
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_000_09ef
  add sp, $06
  pop de
  ld hl, sp+$15
  ld c, l
  ld b, h
  ld hl, $0005
  push hl
  push bc
  push de
  call Call_000_09ef
  add sp, $06
  jr jr_001_631a

Jump_001_6309:
  ld hl, sp+$10
  ld c, l
  ld b, h
  push bc
  push de
  ld hl, sp+$27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_613e
  add sp, $06

jr_001_631a:
  ld hl, sp+$10
  ld e, l
  ld d, h
  push de
  call Call_001_5b1e
  add sp, $02
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $01
  ld l, $13
  ld [hl], $00
  add sp, $21
  ret

Bank1Function6334::
  add sp, -$02
  ld hl, sp+$01
  ld [hl], $01
  dec hl
  ld [hl], $01
  call Call_000_04b1
  ld a, [$c034]
  or a
  jr nz, jr_001_634a

  ld hl, sp+$01
  ld [hl], $00

jr_001_634a:
  ld hl, sp+$01
  ld a, [hl]
  or a
  jr z, jr_001_6366

  ld de, $c03a
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  call Call_000_04c5
  add sp, $02
  ld a, e
  or a
  jr z, jr_001_6366

  ld hl, sp+$01
  ld [hl], $00

jr_001_6366:
  ld a, [$c003]
  or a
  jr z, jr_001_6390

  ld hl, $0040
  push hl
  call Call_000_04ba
  add sp, $02
  ld de, Bank1Address63DB
  ld a, $04
  push af
  inc sp
  push de
  ld hl, $be00
  push hl
  call Call_000_2b5a
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_6394

  ld hl, sp+$00
  ld [hl], $00
  jr jr_001_6394

jr_001_6390:
  ld hl, sp+$00
  ld [hl], $00

jr_001_6394:
  ld hl, sp+$01
  ld a, [hl]
  or a
  jr z, jr_001_63b8

  ld de, $c03a
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, Bank1Address63ED
  push hl
  ld hl, Bank1Address63E0
  push hl
  push bc
  ld hl, 0
  push hl
  call Call_001_6402
  add sp, $08
  ld a, e
  or a
  jr nz, jr_001_63d8

jr_001_63b8:
  ld hl, sp+$00
  ld a, [hl]
  or a
  jr z, jr_001_63d6

  ld de, Bank1Address63F1
  ld hl, Bank1Address63FE
  push hl
  push de
  ld hl, $00a4
  push hl
  ld l, $40
  push hl
  call Call_001_6402
  add sp, $08
  ld a, e
  or a
  jr nz, jr_001_63d8

jr_001_63d6:
  ld e, $00

jr_001_63d8:
  add sp, $02
  ret

Bank1Address63DB::;probably a table
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address63E0::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address63E7::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop

Bank1Address63ED::
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
Bank1Address63F1::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld d, e
  ld c, [hl]
  ld b, c
  ld d, b
  nop
Bank1Address63FE::
  ld [hl], e
  ld h, c
  halt

Call_001_6402:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$67
  ld hl, $00e5
  add hl, sp
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, $01f3
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c04c
  push hl
  ld hl, $01f5
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3f5f
  add sp, $08
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld hl, $01e5
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b
  push bc
  ld hl, $01ed
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Bank1Function4067
  add sp, $06
  pop bc
  ld a, e
  or a
  jr nz, jr_001_6468

  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_656f
  add sp, $04
  ld a, e
  or a
  jr nz, jr_001_6468

  ld e, a

jr_001_6468:
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $6a
  ret

Bank1Function6471::
  call Call_000_04b1
  ld de, $c03a
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  call Call_000_04f3
  add sp, $02
  ld a, [$c003]
  or a
  jr z, jr_001_649e

  ld hl, $0040
  push hl
  call Call_000_04ba
  add sp, $02
  ld de,Bank1Address64D5
  ld hl, $be00
  push hl
  push de
  call Call_000_2d24
  add sp, $04

jr_001_649e:
  ld a, [$c034]
  or a
  jr z, jr_001_64b8

  ld de, Bank1Address64DA
  ld hl, Bank1Address64E7
  push hl
  push de
  ld hl, $0000
  push hl
  call Call_001_64fc
  add sp, $06
  ld a, e
  or a
  ret nz

jr_001_64b8:
  ld a, [$c003]
  or a
  jr z, jr_001_64d2

  ld de, Bank1Address64EB
  ld hl, Bank1Address64F8
  push hl
  push de
  ld hl, $0040
  push hl
  call Call_001_64fc
  add sp, $06
  ld a, e
  or a
  ret nz

jr_001_64d2:
  ld e, $00
  ret

Bank1Address64D5::
  ld c, [hl]
  ld d, l
  ld c, h
  ld c, h
  nop
Bank1Address64DA::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address64E1::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address64E7::
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
Bank1Address64EB::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address64F2::
  cpl
  ld d, e
  ld c, [hl]
  ld b, c
  ld d, b
  nop
Bank1Address64F8::
  ld [hl], e
  ld h, c
  halt

Call_001_64fc:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$67
  ld hl, $00e5
  add hl, sp
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, $01f1
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c04c
  push hl
  ld hl, $01f3
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3f5f
  add sp, $08
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld hl, $01e5
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b
  push bc
  ld hl, $0000
  push hl
  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Bank1Function4067
  add sp, $06
  pop bc
  ld a, e
  sub $f0
  jr nz, jr_001_654f

  ld e, a
  jr jr_001_6566

jr_001_654f:
  ld a, e
  or a
  jr nz, jr_001_6566

  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_65d6
  add sp, $04
  ld a, e
  or a
  jr nz, jr_001_6566

  ld e, a

jr_001_6566:
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $6a
  ret


Call_001_656f:
  add sp, -$08
  ld hl, sp+$0c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00e0
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
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6641
  add sp, $04
  pop bc
  push de
  push de
  push bc
  call Call_000_3a3f
  add sp, $04
  ld a, e
  pop de
  or a
  jr z, jr_001_65bb

  ld e, a
  jr jr_001_65d3

jr_001_65bb:
  push de
  call Call_000_04b1
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  xor a
  push af
  inc sp
  push de
  push bc
  call Bank1Function49C2
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_65d3

  ld e, a

jr_001_65d3:
  add sp, $08
  ret


Call_001_65d6:
  add sp, -$08
  ld hl, sp+$0c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00e0
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
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6641
  add sp, $04
  pop bc
  push de
  ld hl, $0000
  push hl
  push bc
  call Call_000_3a3f
  add sp, $04
  ld a, e
  pop de
  or a
  jr z, jr_001_6626

  ld e, a
  jr jr_001_663e

jr_001_6626:
  push de
  call Call_000_04b1
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  xor a
  push af
  inc sp
  push de
  push bc
  call Call_000_3cf6
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_663e

  ld e, a

jr_001_663e:
  add sp, $08
  ret


Call_001_6641:
  push af
  ld hl, sp+$04
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  pop af
  ld a, $09

jr_001_664e:
  srl e
  rr d
  rr b
  rr c
  dec a
  jr nz, jr_001_664e

  ld hl, sp+$02
  ld a, [hl]
  or a
  jr nz, jr_001_6664

  inc hl
  bit 0, [hl]
  jr z, jr_001_6665

jr_001_6664:
  inc bc

jr_001_6665:
  xor a
  cp c
  ld a, $01
  sbc b
  jr nc, jr_001_666f

  ld bc, $0100

jr_001_666f:
  ld e, c
  ld d, b
  ret


Call_001_6672:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$65
  ld hl, $00e5
  add hl, sp
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, Bank1Address66BF
  push hl
  ld hl, $c04c
  push hl
  ld hl, Bank1Address66B2
  push hl
  call Call_000_3f5f
  add sp, $08
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld hl, $01e7
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  push de
  call Bank1Function4067
  add sp, $06
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $68
  ret

Bank1Address66B2::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address66B9::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address66BF::
  ld [hl], d
  ld [hl], h
  ld h, e
  nop

Bank1Function66C3::
  ld hl, $fdf4
  add hl, sp
  ld sp, hl
  ld a, [$c002]
  or a
  jr z, jr_001_66d4

  ld a, [$c037]
  or a
  jr nz, jr_001_66d9

jr_001_66d4:
  ld e, $00
  jp Jump_001_6754

jr_001_66d9:
  ld hl, $0200
  add hl, sp
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call Call_001_5b7f
  add sp, $02
  pop bc
  ld e, c
  ld d, b
  push bc
  push de
  call Call_001_5c7a
  add sp, $02
  ld a, e
  pop bc
  or a
  jr z, jr_001_66fc

  ld e, $00
  jp Jump_001_6754


jr_001_66fc:
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $020a
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, $0200
  push hl
  xor a
  push af
  inc sp
  push de
  call ClearC144toC2AB
  add sp, $05
  pop bc
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  push hl
  push de
  push bc
  call Call_000_09ef
  add sp, $06
  ld hl, $0001
  push hl
  call Call_001_6672
  add sp, $02
  ld a, e
  or a
  jr nz, jr_001_6754

  ld hl, $020b
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
  call Bank1Function49C2
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_6754

  ld e, a

Jump_001_6754:
jr_001_6754:
  ld c, l
  ld b, h
  ld hl, $020c
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


Bank1Function675E::
  ld hl, $fdfe
  add hl, sp
  ld sp, hl
  ld hl, sp+$02
  ld c, l
  ld b, h
  ld d, c
  ld e, b
  ld hl, sp+$00
  ld [hl], d
  inc hl
  ld [hl], e
  ld a, [$c002]
  or a
  jr z, jr_001_677a

  ld a, [$c037]
  or a
  jr nz, jr_001_677f

jr_001_677a:
  ld e, $00
  jp Jump_001_67b7


jr_001_677f:
  push bc
  call Call_001_5c26
  pop bc
  push bc
  ld hl, $0000
  push hl
  call Call_001_6672
  add sp, $02
  pop bc
  ld a, e
  sub $f0
  jr nz, jr_001_6797

  ld e, a
  jr Jump_001_67b7

jr_001_6797:
  ld a, e
  or a
  jr nz, Jump_001_67b7

  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push bc
  call Call_000_3cf6
  add sp, $05
  ld a, e
  or a
  jr nz, Jump_001_67b7

  pop hl
  push hl
  push hl
  call Call_001_5c09
  add sp, $02
  ld e, $00

Jump_001_67b7:
  ld c, l
  ld b, h
  ld hl, $0202
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret

Bank1Function67C1::
  add sp, -$0a
  ld a, [$c002]
  or a
  jr z, jr_001_67e3

  ld a, [$c037]
  or a
  jr z, jr_001_67e3

  ld hl, sp+$00
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  call Call_001_5b7f
  add sp, $02
  pop de
  push de
  call Call_001_629f
  add sp, $02

jr_001_67e3:
  add sp, $0a
  ret


Bank1Function67E6:
  add sp, -$13
  ld hl, sp+$12
  ld [hl], $00
  ld hl, sp+$00
  ld [hl], $02
  ld hl, sp+$16
  ld a, [hl-]
  or [hl]
  jr nz, jr_001_67fb

  ld [hl], $aa
  inc hl
  ld [hl], $d7

jr_001_67fb:
  ld hl, sp+$05
  ld [hl], $00

Jump_001_67ff:
  ld hl, sp+$05
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$15
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
  ld hl, sp+$07
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  ld a, $0f
  sub [hl]
  inc hl
  ld a, $00
  sbc [hl]
  jr nc, jr_001_683a

  push bc
  call Call_000_2ba2
  add sp, $02
  ld c, e
  ld hl, sp+$12
  ld a, [hl]
  sub c
  jr nc, jr_001_6834

  ld [hl], c

jr_001_6834:
  ld hl, sp+$05
  inc [hl]
  jp Jump_001_67ff


jr_001_683a:
  ld hl, sp+$05
  ld c, [hl]
  ld a, [hl]
  add $ff
  inc hl
  ld [hl], a
  ld hl, sp+$12
  ld a, [hl]
  add $02
  ld hl, sp+$04
  ld [hl], a
  ld a, $14
  sub [hl]
  jr nc, jr_001_6851

  ld [hl], $14

jr_001_6851:
  ld b, $00
  sla c
  rl b
  ld hl, sp+$15
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
  bit 2, b
  jr z, jr_001_686e

  ld hl, sp+$00
  ld [hl], $01

jr_001_686e:
  ld hl, sp+$00
  ld a, [hl]
  dec a
  jr nz, jr_001_687a

  ld hl, sp+$06
  ld a, [hl]
  inc a
  jr jr_001_687e

jr_001_687a:
  ld hl, sp+$06
  ld a, [hl]
  add a

jr_001_687e:
  ld hl, sp+$01
  ld [hl], a
  ld hl, sp+$15
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$07
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  push bc
  ld hl, sp+$03
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$07
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_69f6
  add sp, $04
  pop bc
  push bc
  push de
  call Call_000_223e
  ld a, e
  pop de
  pop bc
  ld hl, sp+$03
  ld [hl], a
  ld hl, $d7d5
  ld [hl], $ff
  ld a, e
  inc a
  ld hl, sp+$10
  ld [hl], a
  ld a, b
  and $01
  ld hl, sp+$0c
  ld [hl+], a
  ld [hl], $00
  ld hl, sp+$00
  ld a, [hl]
  sub $02
  jr nz, jr_001_68d3

  ld a, $01
  jr jr_001_68d4

jr_001_68d3:
  xor a

jr_001_68d4:
  ld hl, sp+$12
  ld [hl], a
  ld hl, sp+$06
  ld a, [hl]
  add $ff
  ld hl, sp+$09
  ld [hl], a
  ld a, b
  and $08
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], $00
  ld a, b
  and $02
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], $00

Jump_001_68ef:
  ld hl, sp+$0b
  ld a, [hl-]
  or [hl]
  jr nz, jr_001_6904

  ld hl, sp+$03
  ld a, [hl]
  push af
  inc sp
  xor a
  push af
  inc sp
  call Call_000_2209
  add sp, $02
  jr jr_001_6913

jr_001_6904:
  ld hl, sp+$03
  ld a, [hl]
  push af
  inc sp
  ld hl, sp+$11
  ld a, [hl]
  push af
  inc sp
  call Call_000_2209
  add sp, $02

jr_001_6913:
  ld hl, sp+$05
  ld [hl], $00

Jump_001_6917:
  ld hl, sp+$05
  ld a, [hl+]
  sub [hl]
  jp nc, Jump_001_697e

  ld hl, sp+$17
  ld a, [hl]
  ld hl, sp+$05
  sub [hl]
  jr nz, jr_001_6935

  ld hl, sp+$0d
  ld a, [hl-]
  or [hl]
  jr nz, jr_001_6935

  xor a
  push af
  inc sp
  call Call_000_2268
  inc sp
  jr jr_001_693d

jr_001_6935:
  ld a, $80
  push af
  inc sp
  call Call_000_2268
  inc sp

jr_001_693d:
  ld hl, sp+$05
  ld c, [hl]
  ld b, $00
  inc bc
  sla c
  rl b
  inc hl
  inc hl
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
  ld hl, sp+$0b
  ld a, [hl-]
  or [hl]
  jr nz, jr_001_6964

  push bc
  call Call_000_2193
  add sp, $02
  jr jr_001_696a

jr_001_6964:
  push bc
  call LoadOSInitText
  add sp, $02

jr_001_696a:
  ld hl, sp+$12
  ld a, [hl]
  or a
  jr z, jr_001_6978

  ld a, $01
  push af
  inc sp
  call Call_000_21e0
  inc sp

jr_001_6978:
  ld hl, sp+$05
  inc [hl]
  jp Jump_001_6917


Jump_001_697e:
  call DrawToScreen0
  call GetButtonDown
  ld hl, sp+$02
  ld [hl], e
  ld hl, sp+$0d
  ld a, [hl-]
  or [hl]
  jr z, jr_001_6993

  ld hl, sp+$17
  ld e, [hl]
  jp Jump_001_69f3


jr_001_6993:
  ld hl, sp+$02
  bit 6, [hl]
  jr z, jr_001_69b1

  ld hl, sp+$17
  ld a, [hl]
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_001_69aa

  ld hl, sp+$09
  ld b, [hl]
  jr jr_001_69ae

jr_001_69aa:
  ld hl, sp+$17
  ld b, [hl]
  dec b

jr_001_69ae:
  ld hl, sp+$17
  ld [hl], b

jr_001_69b1:
  ld hl, sp+$02
  bit 7, [hl]
  jr z, jr_001_69d1

  ld hl, sp+$06
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, sp+$17
  ld d, [hl]
  ld e, $00
  ld a, c
  sub d
  jr nz, jr_001_69ca

  ld a, b
  sub e
  jr z, jr_001_69ce

jr_001_69ca:
  ld hl, sp+$17
  ld a, [hl]
  inc a

jr_001_69ce:
  ld hl, sp+$17
  ld [hl], a

jr_001_69d1:
  ld hl, sp+$02
  bit 0, [hl]
  jr z, jr_001_69dc

  ld hl, sp+$17
  ld e, [hl]
  jr jr_001_69f3

jr_001_69dc:
  ld hl, sp+$02
  bit 1, [hl]
  jr z, jr_001_69e6

  ld e, $ff
  jr jr_001_69f3

jr_001_69e6:
  ld hl, sp+$0f
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_68ef

  ld hl, sp+$17
  ld a, [hl]
  add $80
  ld e, a

Jump_001_69f3:
jr_001_69f3:
  add sp, $13
  ret


Call_001_69f6:
  add sp, -$03
  ld hl, sp+$07
  ld c, [hl]
  ld b, $00
  ld a, $14
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $00
  ld e, a
  ld a, b
  ld d, a
  bit 7, b
  jr z, jr_001_6a18

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

jr_001_6a18:
  ld hl, sp+$01
  ld d, [hl]
  inc hl
  ld e, [hl]
  sra e
  rr d
  dec hl
  dec hl
  ld [hl], d
  ld hl, sp+$08
  ld c, [hl]
  ld b, $00
  inc bc
  inc bc
  ld a, $12
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $00
  ld e, a
  ld a, b
  ld d, a
  bit 7, b
  jr z, jr_001_6a46

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

jr_001_6a46:
  ld hl, sp+$01
  ld c, [hl]
  inc hl
  ld d, [hl]
  sra d
  rr c
  ld hl, $d7d5
  ld a, [hl]
  inc a
  jr z, jr_001_6a5a

  ld hl, $d7d5
  ld c, [hl]

jr_001_6a5a:
  push bc
  ld a, $80
  push af
  inc sp
  call Call_000_2268
  inc sp
  pop bc
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  ld a, c
  push af
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $0020
  push hl
  call Call_000_2272
  add sp, $06
  pop bc
  ld b, c
  dec b
  push bc
  push bc
  inc sp
  xor a
  push af
  inc sp
  call Call_000_2209
  add sp, $02
  pop bc
  push bc
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2193
  add sp, $02
  pop bc
  ld b, c
  inc b
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $002d
  push hl
  call Call_000_2272
  add sp, $06
  pop bc
  ld d, c
  inc d
  inc d
  push bc
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  push de
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $0020
  push hl
  call Call_000_2272
  add sp, $06
  pop bc
  push bc
  inc sp
  ld hl, sp+$01
  ld a, [hl]
  push af
  inc sp
  call Call_000_2209
  add sp, $02
  ld hl, sp+$00
  ld e, [hl]
  add sp, $03
  ret

  push hl
  ld hl, sp+$04
  ld a, [hl]
  ld hl, $d7d5
  ld [hl], a
  pop hl
  ret


Bank1Function6AF2::
  ld hl, $d7d0
  ld [hl], $00
  ld hl, $d7d1
  ld [hl], $00
  ld hl, $d7d2
  ld [hl], $00
  ld hl, $d7d3
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $d7d5
  ld [hl], $ff
  ret


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

  ld hl, $d7d3
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
  call Call_000_2ba2
  add sp, $02
  ld hl, sp+$00
  ld [hl], e
  ld a, [hl+]
  ld [hl+], a
  ld [hl], $00
  ld a, $aa
  ld hl, $d7d1
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
  call Call_000_09ef
  add sp, $06
  ld hl, $d7d1
  ld a, [hl]
  ld hl, sp+$00
  add [hl]
  ld hl, $d7d1
  ld [hl], a
  add $aa
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  xor a
  ld [bc], a
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, $d6aa
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  sub $0a
  jp nz, Jump_001_6bdb

  ld hl, $d7d0
  ld c, [hl]
  inc [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $d7aa
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  ld a, $aa
  ld hl, $d7d2
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
  ld hl, $d7d0
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $d7aa
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $d7d3
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld a, d
  ld [bc], a
  inc bc
  ld a, e
  ld [bc], a
  push hl
  ld hl, $d7d1
  ld a, [hl]
  ld hl, $d7d2
  ld [hl], a
  pop hl
  ld hl, $d7d1
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, $d6aa
  add hl, bc
  ld c, l
  ld b, h
  xor a
  ld [bc], a

Jump_001_6bdb:
  add sp, $03
  ret


  ld a, $aa
  ld hl, $d7d1
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
  call Call_000_2d77
  add sp, $06
  ld a, $aa
  ld hl, $d7d1
  add [hl]
  ld c, a
  ld a, $d6
  adc $00
  ld b, a
  push bc
  call Call_000_2ba2
  add sp, $02
  ld hl, $d7d1
  ld a, [hl]
  add e
  ld [hl], a
  ret


Call_001_6c15:
  ld a, $aa
  ld hl, $d7d1
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
  call Call_000_2e08
  add sp, $03
  ld hl, $d7d1
  inc [hl]
  inc [hl]
  ret


  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call Call_001_6c15
  inc sp
  ld hl, sp+$02
  ld d, [hl]
  push de
  inc sp
  call Call_001_6c15
  inc sp
  ret


Call_001_6c47:
  jp Jump_001_71df


  jp Jump_001_6e58


Bank1Function6C4D:
  jp Jump_001_6f78


  jp Jump_001_7025


Bank1Function6C53:
  jp Jump_001_714e

  ld a, $05
  rst $08
  jp Jump_001_6e2f


  ld a, $05
  rst $08
  jp Jump_001_6d13


  ld a, $05
  rst $08
  jp Bank1Function6D53


  ld a, $05
  rst $08
  jp Jump_001_6e0f


  ld a, $05
  rst $08
  jp Jump_001_6cf9


  ld a, $05
  rst $08
  jp Jump_001_6d07


  ld a, $05
  rst $08
  jp Jump_001_6e22


  ld a, $05
  rst $08
  jp Jump_001_6d39


  ld a, $05
  rst $08
  jp Jump_001_6d47


  ld a, $05
  rst $08
  jp Jump_001_6dfb


  ld a, $05
  rst $08
  jp Jump_001_6cbc


  ld a, $05
  rst $08
  jp Jump_001_6ccb


  ld a, $05
  rst $08
  jp Jump_001_6e05


  ld a, $05
  rst $08
  jp Jump_001_6cd7


  ld a, $05
  rst $08
  jp Jump_001_6ce9


  ld a, $05
  rst $08
  jp Jump_001_6d27


  ld a, $05
  rst $08
  jp Bank1Function6D67


Jump_001_6cbc:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call Call_001_6d7d
  ld e, c
  ld d, b
  ret


Jump_001_6ccb:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp Jump_001_6d7d


Jump_001_6cd7:
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
  call Call_001_6d81
  ld e, c
  ld d, b
  ret


Jump_001_6ce9:
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
  call Call_001_6d81
  ret


Jump_001_6cf9:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6d79
  ld e, c
  ld d, b
  ret


Jump_001_6d07:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6d79
  ret


Jump_001_6d13:
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
  call Call_001_6d81
  ld e, c
  ld d, b
  ret


Jump_001_6d27:
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
  call Call_001_6d81
  ret


Call_001_6d39:
Jump_001_6d39:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6db7
  ld e, c
  ld d, b
  ret


Call_001_6d47:
Jump_001_6d47:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6db7
  ret


Bank1Function6D53:
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
  call Call_001_6dba
  ld e, c
  ld d, b
  ret


Bank1Function6D67:
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
  call Call_001_6dba
  ret


Call_001_6d79:
  ld a, c
  rlca
  sbc a
  ld b, a

Call_001_6d7d:
Jump_001_6d7d:
  ld a, e
  rlca
  sbc a
  ld d, a

Call_001_6d81:
  ld a, b
  push af
  xor d
  push af
  bit 7, d
  jr z, jr_001_6d8f

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a

jr_001_6d8f:
  bit 7, b
  jr z, jr_001_6d99

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_001_6d99:
  call Call_001_6dba
  jr c, jr_001_6db4

  pop af
  and $80
  jr z, jr_001_6da9

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_001_6da9:
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


jr_001_6db4:
  pop af
  pop af
  ret


Call_001_6db7:
  ld b, $00
  ld d, b

Call_001_6dba:
  ld a, e
  or d
  jr nz, jr_001_6dc5

  ld bc, $0000
  ld d, b
  ld e, c
  scf
  ret


jr_001_6dc5:
  ld l, c
  ld h, b
  ld bc, $0000
  or a
  ld a, $10

jr_001_6dcd:
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
  jr c, jr_001_6de8

  pop bc
  pop af
  dec a
  or a
  jr nz, jr_001_6dcd

  jr jr_001_6df1

jr_001_6de8:
  inc sp
  inc sp
  pop af
  dec a
  scf
  jr nz, jr_001_6dcd

  jr jr_001_6df1

jr_001_6df1:
  ld d, b
  ld e, c
  rl l
  ld c, l
  rl h
  ld b, h
  or a
  ret


Jump_001_6dfb:
  ld hl, $0003
  ld b, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  jr jr_001_6e1b

Jump_001_6e05:
  ld hl, $0002
  ld b, h
  add hl, sp
  ld e, [hl]
  inc hl
  ld c, [hl]
  jr jr_001_6e1b

Jump_001_6e0f:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld l, [hl]
  ld c, l
  ld a, l
  rla
  sbc a
  ld b, a

jr_001_6e1b:
  ld a, e
  rla
  sbc a
  ld d, a
  jp Jump_001_6e3d


Call_001_6e22:
Jump_001_6e22:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld c, [hl]
  xor a
  ld d, a
  ld b, a
  jp Jump_001_6e3d


Call_001_6e2f:
Jump_001_6e2f:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl]
  inc hl
  ld h, [hl]
  ld l, a
  ld b, h
  ld c, l

Jump_001_6e3d:
  ld hl, $0000
  ld a, b
  ld b, $10
  or a
  jp nz, Jump_001_6e4a

  ld b, $08
  ld a, c

Jump_001_6e4a:
jr_001_6e4a:
  add hl, hl
  rl c
  rla
  jp nc, Jump_001_6e52

  add hl, de

Jump_001_6e52:
  dec b
  jr nz, jr_001_6e4a

  ld e, l
  ld d, h
  ret


Jump_001_6e58:
  add sp, -$0d
  ld hl, sp+$0f
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_6e7a

  bit 7, d
  jr nz, jr_001_6e7f

  cp a
  jr jr_001_6e7f

jr_001_6e7a:
  bit 7, d
  jr z, jr_001_6e7f

  scf

jr_001_6e7f:
  ld a, $00
  rla
  ld hl, sp+$04
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_6eab

  ld de, $0000
  ld a, e
  ld hl, sp+$0f
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0c
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$13
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0c
  ld [hl-], a
  ld [hl], e
  jr jr_001_6ebc

jr_001_6eab:
  ld hl, sp+$0f
  ld d, h
  ld e, l
  ld hl, sp+$09
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

jr_001_6ebc:
  ld hl, sp+$13
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_6edc

  bit 7, d
  jr nz, jr_001_6ee1

  cp a
  jr jr_001_6ee1

jr_001_6edc:
  bit 7, d
  jr z, jr_001_6ee1

  scf

jr_001_6ee1:
  jr nc, jr_001_6f05

  ld de, $0000
  ld a, e
  ld hl, sp+$13
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$17
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  jr jr_001_6f16

jr_001_6f05:
  ld hl, sp+$13
  ld d, h
  ld e, l
  ld hl, sp+$05
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

jr_001_6f16:
  ld hl, sp+$05
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
  push de
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
  call Bank1Function6C4D
  add sp, $08
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
  inc hl
  ld a, [hl]
  or a
  jp z, Jump_001_6f6e

  ld de, $0000
  ld a, e
  ld hl, sp+$00
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$04
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  jr jr_001_6f75

Jump_001_6f6e:
  pop de
  push de
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a

jr_001_6f75:
  add sp, $0d
  ret


Jump_001_6f78:
  ld b, $00
  ld c, $00

Jump_001_6f7c:
  ld hl, sp+$09
  ld a, [hl]
  rlc a
  and $01
  jp nz, Jump_001_6fc5

  push af
  pop af
  ld a, $01
  ld hl, sp+$06
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  ld hl, sp+$02
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  jr nc, jr_001_6fc0

  push af
  pop af
  ld a, $01
  ld hl, sp+$09
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  jr jr_001_6fc5

jr_001_6fc0:
  inc c
  ld b, c
  jp Jump_001_6f7c


Jump_001_6fc5:
jr_001_6fc5:
  ld hl, sp+$02
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  jp c, Jump_001_7002

  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$06
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0a
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e

Jump_001_7002:
  push af
  pop af
  ld a, $01
  ld hl, sp+$09
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  ld c, b
  dec b
  ld a, c
  or a
  jp nz, Jump_001_6fc5

  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


Jump_001_7025:
  add sp, -$0e
  ld hl, sp+$10
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_7047

  bit 7, d
  jr nz, jr_001_704c

  cp a
  jr jr_001_704c

jr_001_7047:
  bit 7, d
  jr z, jr_001_704c

  scf

jr_001_704c:
  ld a, $00
  rla
  ld hl, sp+$0d
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_7078

  ld de, $0000
  ld a, e
  ld hl, sp+$10
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$14
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  jr jr_001_7089

jr_001_7078:
  ld hl, sp+$10
  ld d, h
  ld e, l
  ld hl, sp+$04
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

jr_001_7089:
  ld hl, sp+$14
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_70a9

  bit 7, d
  jr nz, jr_001_70ae

  cp a
  jr jr_001_70ae

jr_001_70a9:
  bit 7, d
  jr z, jr_001_70ae

  scf

jr_001_70ae:
  ld a, $00
  rla
  ld hl, sp+$0c
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_70da

  ld de, $0000
  ld a, e
  ld hl, sp+$14
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$18
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  jr jr_001_70eb

jr_001_70da:
  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, sp+$08
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

jr_001_70eb:
  ld hl, sp+$08
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
  push de
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
  call Bank1Function6C53
  add sp, $08
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0d
  ld a, [hl-]
  xor [hl]
  jp z, Jump_001_7144

  ld de, $0000
  ld a, e
  ld hl, sp+$00
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$04
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  jr jr_001_714b

Jump_001_7144:
  pop de
  push de
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a

jr_001_714b:
  add sp, $0e
  ret


Jump_001_714e:
  add sp, -$04
  xor a
  ld hl, sp+$00
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld b, $20

Jump_001_7159:
  ld hl, sp+$09
  ld a, [hl]
  rlc a
  and $01
  ld d, a
  push af
  pop af
  ld a, $01
  ld hl, sp+$06
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  push af
  pop af
  ld a, $01
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  bit 0, d
  jr z, jr_001_718d

  ld hl, sp+$00
  ld a, [hl]
  set 0, a
  ld [hl], a

jr_001_718d:
  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, sp+$0a
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
  jp c, Jump_001_71cc

  pop de
  push de
  ld a, e
  ld hl, sp+$0a
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0e
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$06
  ld a, [hl]
  set 0, a
  ld [hl], a

Jump_001_71cc:
  dec b
  ld a, b
  or a
  jp nz, Jump_001_7159

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add sp, $04
  ret


Jump_001_71df:
  add sp, -$10
  ld hl, sp+$12
  ld a, l
  ld d, h
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$0c
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$16
  ld a, l
  ld d, h
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], d
  dec hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  ld e, b
  ld d, c
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6e2f
  add sp, $04
  ld b, e
  ld c, d
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$0a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0c
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
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$06
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$0e
  ld b, [hl]
  inc hl
  ld c, [hl]
  ld e, b
  ld d, c
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6e2f
  add sp, $04
  ld c, e
  ld b, d
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld hl, sp+$0c
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  ld hl, sp+$0d
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  ld c, e
  ld b, d
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$06
  ld [hl], a
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  ld hl, sp+$07
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  inc sp
  inc sp
  push de
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0a
  ld [hl-], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  inc hl
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  ld b, e
  ld c, d
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  dec hl
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
  pop hl
  push hl
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$00
  ld a, c
  sub [hl]
  inc hl
  ld a, b
  sbc [hl]
  ld a, $00
  rla
  ld b, a
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0e
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp+$06
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp+$0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld d, a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  push af
  inc sp
  push de
  inc sp
  call Call_001_6e22
  add sp, $02
  ld b, e
  ld c, d
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  ld [de], a
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$16
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1a
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add sp, $10
  ret


SECTION "Font Tiles", ROMX[$7d00], BANK[1]
FontTiles::
  INCBIN "gfx/font.1bpp"
